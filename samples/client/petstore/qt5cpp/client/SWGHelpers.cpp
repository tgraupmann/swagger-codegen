/**
 * Swagger Petstore
 * This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.
 *
 * OpenAPI spec version: 1.0.0
 * Contact: apiteam@swagger.io
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */

#include "SWGHelpers.h"
#include "SWGModelFactory.h"
#include "SWGObject.h"
#include <QDebug>
#include <QJsonArray>
#include <QJsonValue>
#include <QDateTime>

namespace Swagger {

void
setValue(void* value, QJsonValue obj, QString type, QString complexType) {
    if(value == nullptr) {
        // can't set value with a null pointer
        return;
    }
    if(QStringLiteral("bool").compare(type) == 0) {
        bool * val = static_cast<bool*>(value);
        *val = obj.toBool();
    }
    else if(QStringLiteral("qint32").compare(type) == 0) {
        qint32 *val = static_cast<qint32*>(value);
        *val = obj.toInt();
    }
    else if(QStringLiteral("qint64").compare(type) == 0) {
        qint64 *val = static_cast<qint64*>(value);
        *val = obj.toVariant().toLongLong();
    }
    else if(QStringLiteral("float").compare(type) == 0) {
        float *val = static_cast<float*>(value);
        *val = obj.toDouble();
    }
    else if(QStringLiteral("double").compare(type) == 0) {
        double *val = static_cast<double*>(value);
        *val = obj.toDouble();
    }
    else if (QStringLiteral("QString").compare(type) == 0) {
        QString **val = static_cast<QString**>(value);

        if(val != nullptr) {
            if(!obj.isNull()) {
                // create a new value and return
                delete *val;
                *val = new QString(obj.toString());
                return;
            }
            else {
                // set target to nullptr
                delete *val;
                *val = nullptr;
            }
        }
        else {
            qDebug() << "Can't set value because the target pointer is nullptr";
        }
    }
    else if (QStringLiteral("QDateTime").compare(type) == 0) {
        QDateTime **val = static_cast<QDateTime**>(value);

        if(val != nullptr) {
            if(!obj.isNull()) {
                // create a new value and return
                delete *val;
                *val = new QDateTime(QDateTime::fromString(obj.toString(), Qt::ISODate));
                return;
            }
            else {
                // set target to nullptr
                delete *val;
                *val = nullptr;
            }
        }
        else {
            qDebug() << "Can't set value because the target pointer is nullptr";
        }
    }
    else if (QStringLiteral("QDate").compare(type) == 0) {
        QDate **val = static_cast<QDate**>(value);

        if(val != nullptr) {
            if(!obj.isNull()) {
                // create a new value and return
                delete *val;
                *val = new QDate(QDate::fromString(obj.toString(), Qt::ISODate));
                return;
            }
            else {
                // set target to nullptr
                delete *val;
                *val = nullptr;
            }
        }
        else {
            qDebug() << "Can't set value because the target pointer is nullptr";
        }
    }
    else if (QStringLiteral("QByteArray").compare(type) == 0) {
        QByteArray **val = static_cast<QByteArray**>(value);

        if(val != nullptr) {
            if(!obj.isNull()) {
                // create a new value and return
                delete *val;

                *val = new QByteArray(QByteArray::fromBase64(QByteArray::fromStdString(obj.toString().toStdString())));
                return;
            }
            else {
                // set target to nullptr
                delete *val;
                *val = nullptr;
            }
        }
        else {
            qDebug() << "Can't set value because the target pointer is nullptr";
        }
    }
    else if(type.startsWith("SWG") && obj.isObject()) {
        // complex type
        QJsonObject jsonObj = obj.toObject();
        SWGObject * so = (SWGObject*)Swagger::create(type);
        if(so != nullptr) {
            so->fromJsonObject(jsonObj);
            SWGObject **val = static_cast<SWGObject**>(value);
            delete *val;
            *val = so;
        }
    }
    else if(type.startsWith("QList") && QString("").compare(complexType) != 0 && obj.isArray()) {
        // list of values
        QList<void*>* output = new QList<void*>();
        QJsonArray arr = obj.toArray();
        foreach (const QJsonValue & jval, arr) {
            if(complexType.startsWith("SWG")) {
                // it's an object
                SWGObject * val = (SWGObject*)create(complexType);
                QJsonObject t = jval.toObject();

                val->fromJsonObject(t);
                output->append(val);
            }
            else {
                // primitives
                if(QStringLiteral("qint32").compare(complexType) == 0) {
                    qint32 val;
                    setValue(&val, jval, QStringLiteral("qint32"), QStringLiteral(""));
                    output->append((void*)&val);
                }
                else if(QStringLiteral("qint64").compare(complexType) == 0) {
                    qint64 val;
                    setValue(&val, jval, QStringLiteral("qint64"), QStringLiteral(""));
                    output->append((void*)&val);
                }
                else if(QStringLiteral("bool").compare(complexType) == 0) {
                    bool val;
                    setValue(&val, jval, QStringLiteral("bool"), QStringLiteral(""));
                    output->append((void*)&val);
                }
                else if(QStringLiteral("float").compare(complexType) == 0) {
                    float val;
                    setValue(&val, jval, QStringLiteral("float"), QStringLiteral(""));
                    output->append((void*)&val);
                }
                else if(QStringLiteral("double").compare(complexType) == 0) {
                    double val;
                    setValue(&val, jval, QStringLiteral("double"), QStringLiteral(""));
                    output->append((void*)&val);
                }
                else if(QStringLiteral("QString").compare(complexType) == 0) {
                    QString * val = new QString();
                    setValue(&val, jval, QStringLiteral("QString"), QStringLiteral(""));
                    output->append((void*)val);
                }
                else if(QStringLiteral("QDate").compare(complexType) == 0) {
                    QDate * val = new QDate();
                    setValue(&val, jval, QStringLiteral("QDate"), QStringLiteral(""));
                    output->append((void*)val);
                }
                else if(QStringLiteral("QDateTime").compare(complexType) == 0) {
                    QDateTime * val = new QDateTime();
                    setValue(&val, jval, QStringLiteral("QDateTime"), QStringLiteral(""));
                    output->append((void*)val);
                }
            }
        }
        QList<void*> **val = static_cast<QList<void*>**>(value);
        delete *val;
        *val = output;
    }
}

void
toJsonValue(QString name, void* value, QJsonObject* output, QString type) {
    if(value == nullptr) {
        return;
    }
    if(type.startsWith("SWG")) {
        SWGObject *swgObject = reinterpret_cast<SWGObject *>(value);
        if(swgObject != nullptr) {
            QJsonObject* o = (*swgObject).asJsonObject();
            if(name != nullptr) {
                output->insert(name, *o);
                delete o;
            }
            else {
                output->empty();
                foreach(QString key, o->keys()) {
                    output->insert(key, o->value(key));
                }
            }
        }
    }
    else if(QStringLiteral("QString").compare(type) == 0) {
        QString* str = static_cast<QString*>(value);
        output->insert(name, QJsonValue(*str));
    }
    else if(QStringLiteral("qint32").compare(type) == 0) {
        qint32* str = static_cast<qint32*>(value);
        output->insert(name, QJsonValue(*str));
    }
    else if(QStringLiteral("qint64").compare(type) == 0) {
        qint64* str = static_cast<qint64*>(value);
        output->insert(name, QJsonValue(*str));
    }
    else if(QStringLiteral("bool").compare(type) == 0) {
        bool* str = static_cast<bool*>(value);
        output->insert(name, QJsonValue(*str));
    }
    else if(QStringLiteral("float").compare(type) == 0) {
        float* str = static_cast<float*>(value);
        output->insert(name, QJsonValue((double)*str));
    }
    else if(QStringLiteral("double").compare(type) == 0) {
        double* str = static_cast<double*>(value);
        output->insert(name, QJsonValue(*str));
    }
    else if(QStringLiteral("QDate").compare(type) == 0) {
        QDate* date = static_cast<QDate*>(value);
        output->insert(name, QJsonValue(date->toString(Qt::ISODate)));
    }
    else if(QStringLiteral("QDateTime").compare(type) == 0) {
        QDateTime* datetime = static_cast<QDateTime*>(value);
        output->insert(name, QJsonValue(datetime->toString(Qt::ISODate)));
    }
    else if(QStringLiteral("QByteArray").compare(type) == 0) {
        QByteArray* byteArray = static_cast<QByteArray*>(value);
        output->insert(name, QJsonValue(QString(byteArray->toBase64())));
    }
}

void
toJsonArray(QList<void*>* value, QJsonArray* output, QString innerName, QString innerType) {
    foreach(void* obj, *value) {
        QJsonObject element;

        toJsonValue(nullptr, obj, &element, innerType);
        output->append(element);
    }
}

QString
stringValue(QString* value) {
    QString* str = static_cast<QString*>(value);
    return QString(*str);
}

QString
stringValue(qint32 value) {
    return QString::number(value);
}

QString
stringValue(qint64 value) {
    return QString::number(value);
}

QString
stringValue(bool value) {
    return QString(value ? "true" : "false");
}
} /* namespace Swagger */
