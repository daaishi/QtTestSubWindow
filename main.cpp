#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QScreen>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Get default screen
    QScreen *screen = QGuiApplication::primaryScreen();

    // Get screen width and height
    int screenWidth = screen->availableSize().width();
    int screenHeight = screen->availableSize().height();

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    // Screen sizes published in QML
    engine.rootContext()->setContextProperty("screenWidth", screenWidth);
    engine.rootContext()->setContextProperty("screenHeight", screenHeight);

    engine.loadFromModule("SubWindow", "Main");

    // Make the mainWindow object available to QML
    QObject *mainWindow = engine.rootObjects().value(0);
    engine.rootContext()->setContextProperty("mainWindow", mainWindow);

    return app.exec();
}
