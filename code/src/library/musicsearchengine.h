#ifndef MUSICSEARCHENGINE_H
#define MUSICSEARCHENGINE_H

#include <QFileInfo>
#include <QThread>

#include <QDir>

class MusicSearchEngine : public QThread
{
	Q_OBJECT

private:
	QList<QDir> savedLocations;

public:
	MusicSearchEngine(QObject *parent = 0);

public slots:
	void setLocations(const QList<QDir> &locations);

protected:
	void run();

signals:
	void scannedCover(const QString &);

	void scannedFile(int, const QString &);

	void progressChanged(const int &);

public slots:

};

#endif // MUSICSEARCHENGINE_H