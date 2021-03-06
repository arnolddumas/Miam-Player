#ifndef TRACKITEM_H
#define TRACKITEM_H

#include <QStandardItem>
#include "model/trackdao.h"

class TrackItem : public QStandardItem
{
public:
	explicit TrackItem(const TrackDAO *dao);

	virtual int type() const override;
};

#endif // TRACKITEM_H
