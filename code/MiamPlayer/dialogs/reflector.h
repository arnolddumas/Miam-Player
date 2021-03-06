#ifndef REFLECTOR_H
#define REFLECTOR_H

#include <QWidget>

/**
 * Reflector Class is only designed to help the way one can customize colors.
 */
class Reflector : public QWidget
{
	Q_OBJECT
private:
	/** The color used in the preview pane in the Customize Theme Dialog. */
	QColor backgroundColor;

public:
	Reflector(QWidget *parent = 0);

	/** Getter to the color used in the preview pane in the Customize Theme Dialog. */
	inline QColor color() const { return this->backgroundColor; }

	QPalette::ColorRole colorRole() const;

	/** Setter to the color used in the preview pane in the Customize Theme Dialog. */
	void setColor(const QColor &color);

protected:
	/** Redefined to be able to reflect the color of the elements in the Customize Theme Dialog. */
	void paintEvent(QPaintEvent *);
};

#endif // REFLECTOR_H
