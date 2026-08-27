Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F65D3F1053
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787860629; cv=none; b=sVvN7kieT+wrzxi6LwI6QtYILoKhBKT4EIhFXBjdNlgapBtjl2md9S1f5+6n/fKpkGWyy3KJ1dI7mXxptU+sWe7J71ePGXKV1I2KGSgHllUdcize8Hf1E5EFrtltDWBO5Uj6dDNkFoHpdiDGHQcsTIlPVYpZMQWobtZ9Bd1jQUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787860629; c=relaxed/simple;
	bh=vDu5qVZi5+B2YTh94nK7d3oZgqw1oQXWOUqDYalHD4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TNRgeCNg+kArcfHvb3kk8HYoFqwkYzYJ+26qQUqmO6hzIbbr+0AA5559Wm7YFdwx4RVVNtaXH29zb6CfSXzl0zAhhdjcHIxxFd9ejpHD0iwwdswT1QpUFpp2eV0B1+8iAGPB+MB12cjY07mgkMiMMOmOpkV3xqrfBHeUqYmJ4aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqFYZsOr; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqFYZsOr"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-cc147d86bebso260816a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787860627; x=1788465427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QKSwaBw0Qfs+/Q4v+yYjSyUPLlZIbYu5DPza0B2CzMo=;
        b=FqFYZsOrHipINoFni0BAz7C2EHuyWWsKI6CytT7CAJGPh7kMLccFbMocxC/ptl2MQ0
         qdsxcfJU1EmjlaoNaR9ne5h6wVhUVhowWQ9c/fyCuGbwqUCUQrF7HxRZwH0e0LHMmU7w
         mieHqL9OJXSDgE6AfUIc5liQaN6JwQrMf1t6EiB0rGUw//bstKENxO6GE5JWfI2tenOX
         7DXCcgf+2QcBTpmu1aa1NG5tAp8bviEAAzMXbuLvTvFF/6FyTW3nZkzNL0dg8OT4xnb8
         3FuedqydLb1bWUM35E2EPTju5f7Tka7EOSwdK6CJP5Zf0Bg/+bpzhD0tQHEz7lQI7aIT
         dufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787860627; x=1788465427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QKSwaBw0Qfs+/Q4v+yYjSyUPLlZIbYu5DPza0B2CzMo=;
        b=oqWxQl/uUCDRB69KobCMc4D/T08i9Qbld0ewMDWMeWmg1JiCv7TK//37kfcWSUjgG0
         0JLYYVyca2OyX2JhKUKo4AXaAl6TaJJPDRkgD9CRvB5HuqwK6cQm+qwLvBS9K5gYPCfn
         k3NedCet88r+QHxgqDuhS3XwW47SGLSC3iX9Hq7laE8wlksHKQC7Vc5Gl4ouhtH3RE2H
         hRlRU7jE7Zh//aolD7pMVb+i2MQAVv5amwxTVchdtGVWx/VObHlf0Ir9jAg1xeB1DWmG
         ukmlWBnw4S6YwPpCw6MLRkTsFrr1Z9B52vCZUBnVNWHxI+lNUj2IAW768AQf6othq6q7
         KQ7g==
X-Forwarded-Encrypted: i=1; AHgh+RpYt6LIYkyYtVv+M3qh87Crne4yo587gf4gS7WRX7pMRdH2IS3tnUfgzEfEgOA7LJMa91bjOpKPpUJIoZc=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ944oPtf1/23LoxzAOBeobuuDffrqq1sgEj4tFFKnwAm47UmH
	hGDAOpmTWvogWcps3eBJ6oTWHlNNsek8vdLlDwH77pTxZgixa44+J+cb
X-Gm-Gg: AR+sD139ynX50SoLdtSQIa5xJ9a8+64/2j26yx1gdwqrZoE2d2Cpfg04ea0cEcSnrLr
	OinuBFBAtsDwp35ebBw93u0YmdiqJduxozyrpVSI4MUpb7yor3/c5bVGZ11gSH+pelvL+NxjqeW
	5HPSRmOv84tmZf6dCzFNiy8BYDoNkoHhdW+GLvWiPb6c53g5kdb7ooG886BWcN84c/WKd5oLz8S
	/7AB7+q4p6WmwZvEzI8mhtCO2co+l8iKmcTS3apq1hr4nle/e2sE0T3VMX4dJ+EdSn/OsT+ib3W
	vAeqrHWoxyev1urQBzDQp3ggYWiRyKAt/jZlVwabJgn1OAtLm+eq2FhO2C4UsgfSfe3YfiWsy8R
	3Hjtedp2QKlnSGskYfLKLAR9ywsg0rAhrEwrnwcM48gJqvbjCk10kJlyFLNK5PV3jyDuljcTHnt
	XVOBWzu5N3J/PsfM6iQXPeIvtII5i6Ne5+zBisAhnMezCy7V/h+7uKUAWDZsNYXG+dl8A4a1rK
X-Received: by 2002:a17:90b:4fd0:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-3969ba3c181mr13031508a91.1.1787860627206;
        Thu, 27 Aug 2026 12:57:07 -0700 (PDT)
Received: from Mahmudul.. ([103.139.196.183])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3285a5f96efsm9258581eec.11.2026.08.27.12.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 12:57:06 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: jic23@kernel.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	dlechner@baylibre.com,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v5] staging: iio: adc: ad7816: Use modern IIO attribute macros
Date: Fri, 28 Aug 2026 01:56:42 +0600
Message-Id: <20260827195642.12831-1-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the legacy IIO_DEVICE_ATTR() macros with the modern
IIO_DEVICE_ATTR_RW() and IIO_DEVICE_ATTR_RO() macros.

This includes renaming driver-specific callback functions to
standard <name>_show() and <name>_store() formats.

Signed-off-by: Md. Mahmudul Hasan Mabud <mdmahmudulhasan1511@gmail.com>
---
v5:
  - Converted to a standalone single patch (previously part of the v3/v4 series).
  - Updated commit message and fixed function header line lengths and wrapping based on Andy Shevchenko's feedback on v3.
    Link: https://lore.kernel.org/linux-iio/act9ovNVsJvWO6Cx@ashevche-desk.local/
v4:
  - Sent by mistake without updates.
v3:
  - Initial version (as patch 4/4 of the series).

 drivers/staging/iio/adc/ad7816.c | 64 ++++++++++++--------------------
 1 file changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 30644d2d7..62bbd7b34 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -116,9 +116,8 @@ static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
 	return ret;
 }
 
-static ssize_t ad7816_show_mode(struct device *dev,
-				struct device_attribute *attr,
-				char *buf)
+static ssize_t mode_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -128,10 +127,8 @@ static ssize_t ad7816_show_mode(struct device *dev,
 	return sysfs_emit(buf, "full\n");
 }
 
-static ssize_t ad7816_store_mode(struct device *dev,
-				 struct device_attribute *attr,
-				 const char *buf,
-				 size_t len)
+static ssize_t mode_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -147,24 +144,19 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(mode, 0644,
-		ad7816_show_mode,
-		ad7816_store_mode,
-		0);
+static IIO_DEVICE_ATTR_RW(mode, 0);
 
-static ssize_t ad7816_show_available_modes(struct device *dev,
-					   struct device_attribute *attr,
-					   char *buf)
+static ssize_t available_modes_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
 {
 	return sysfs_emit(buf, "full\npower-save\n");
 }
 
-static IIO_DEVICE_ATTR(available_modes, 0444, ad7816_show_available_modes,
-			NULL, 0);
+static IIO_DEVICE_ATTR_RO(available_modes, 0);
 
-static ssize_t ad7816_show_channel(struct device *dev,
-				   struct device_attribute *attr,
-				   char *buf)
+static ssize_t channel_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -172,10 +164,8 @@ static ssize_t ad7816_show_channel(struct device *dev,
 	return sysfs_emit(buf, "%d\n", chip->channel_id);
 }
 
-static ssize_t ad7816_store_channel(struct device *dev,
-				    struct device_attribute *attr,
-				    const char *buf,
-				    size_t len)
+static ssize_t channel_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -205,14 +195,10 @@ static ssize_t ad7816_store_channel(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(channel, 0644,
-		ad7816_show_channel,
-		ad7816_store_channel,
-		0);
+static IIO_DEVICE_ATTR_RW(channel, 0);
 
-static ssize_t ad7816_show_value(struct device *dev,
-				 struct device_attribute *attr,
-				 char *buf)
+static ssize_t value_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -236,7 +222,7 @@ static ssize_t ad7816_show_value(struct device *dev,
 	return sysfs_emit(buf, "%u\n", data);
 }
 
-static IIO_DEVICE_ATTR(value, 0444, ad7816_show_value, NULL, 0);
+static IIO_DEVICE_ATTR_RO(value, 0);
 
 static struct attribute *ad7816_attributes[] = {
 	&iio_dev_attr_available_modes.dev_attr.attr,
@@ -266,9 +252,8 @@ static irqreturn_t ad7816_event_handler(int irq, void *private)
 	return IRQ_HANDLED;
 }
 
-static ssize_t ad7816_show_oti(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buf)
+static ssize_t oti_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -286,10 +271,10 @@ static ssize_t ad7816_show_oti(struct device *dev,
 	return sysfs_emit(buf, "%u\n", chip->oti_data[chip->channel_id]);
 }
 
-static inline ssize_t ad7816_set_oti(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf,
-				     size_t len)
+static inline ssize_t oti_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -327,8 +312,7 @@ static inline ssize_t ad7816_set_oti(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(oti, 0644,
-		       ad7816_show_oti, ad7816_set_oti, 0);
+static IIO_DEVICE_ATTR_RW(oti, 0);
 
 static struct attribute *ad7816_event_attributes[] = {
 	&iio_dev_attr_oti.dev_attr.attr,
-- 
2.34.1

