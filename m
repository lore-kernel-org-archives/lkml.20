Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9583D25CC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899140; cv=none; b=D2UUVkbYyZI5xKQXCql+gnimMm5ntSDlkzD1Icva30IXUjToRWPQd8lPfKpTc/CocteZNWWD1xk/qpLKo1JIHe2WYKpUT27UDBOXMTSpeuG98dt+Eseq4MAuYd4llnw5cw+w4eprVE5qzjh1EqBJylhDRpWZN6p+xwIaFt/c27I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899140; c=relaxed/simple;
	bh=awLx3251t6HAnsVHNTGEYJXrS1sww/D1jVL1AboaEro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6hTEgfPQ2wzrqSZ2ggCWuMHm65hRua+of/GnN839d6rhVo4nutZ+2TQ7fDKzrtzEddTciaNn1SzA6kSY86MAbfPuIV3WrYj0OGb2dB67UNFBE+AVzXZrW0WkLpkQgphiG/xxURvMs6MiDh2myqji3Uk3ZgiZGAZXckpP2c+TYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRkgHXMd; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRkgHXMd"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-765c077b5c1so197900137.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787899137; x=1788503937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H45UkJcpynWSM6p3u8+zxGMMVZ+9d4Z2GwcIBMNn4Wk=;
        b=DRkgHXMdlS2xipubcTxUvCMYG2WVDUOfbvooNSqzHwav7G+oir9KVfZ06XpGaASLSg
         exSLe6CuXbrBe6ifX2Fwlgf1RzBTTJsjc3NWvJ9r2z0jDTN+TSI9wfleuSM20mDs8XRZ
         GkCBEsx1lS0IJb13WlZMnRH2py7z/UPn5c0eDpDZrBwmtgtPOWHbCk7WCb89s87YGWu9
         iG8cdcHbxxOfYWv9YFOt3r7Y3dirxIyTNh7BgMj0vxElLGlN4RNAGAIT4C1xJirLsRuk
         7kL/T70Zg27EfTYLRG9Wkh2BEYai72gyt/6M9Jrl3hqLaYcwvQA9xiCRWfdvafpUS9UG
         Y5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787899137; x=1788503937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H45UkJcpynWSM6p3u8+zxGMMVZ+9d4Z2GwcIBMNn4Wk=;
        b=Z0pIRyHHzM2Ef7xKGPDxeGiEW0/ZCGg/LWnNNbZGbGUpBO5BVEttxt0xSaI0RjniNU
         YclqCAcQcAspSiVz+cScR/T7DxxpPdLqb8Q3cnIj3iSkSWfC+cvWvgzLyauHmDisUEGo
         x+W0PAv96Qg5+keJmBezQwuSvIpk3DDIvCFpILaYiDhQnD5+yggbLdVSg4Chc0qr6mzY
         YPw8L3WWd+iDy/ligByffPby60+IuPJzIIsFIvv8AjEd8hyPvkeXbs2gvT78Iv+apHw3
         xHQ0Xr95e8Bu7kKvMMoPPgTf6ccnnioOhyRunNE3ZWkd/LrGQvyb/AqxFZKsppS3qLMh
         n4wQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSZz2BNm/T5SLaA8h/xxPzMf/CltyfCWlJd8XYLlSwI68MdL0BLT9Q6ayFfnsdLbWtsM8Q3Gt8fT6S0oY=@vger.kernel.org
X-Gm-Message-State: AFuF++lSuS3MOuD2kPHSnmjWAcm0EyCL1xXd3xANtDg3eh76eF/geVtD
	bAKZR90C1mn6UOHZsJDWF9rD71mibWd8NZlZ/g2FRY5nBAE8i/8yNn25
X-Gm-Gg: AR+sD13eSVHKgoxxCuEFe1R7EkRdqkTUukEV6W6NaLzjfNL3MIlduFeZkiTVobgwjpa
	C60kfRg6/Q0uUyYIay7qXcPOXYYPXtsqalgi+SOuYGRaDKDa8myGyejc0748CgXCffdyq5nnE2V
	R+UWs3Pya/sCELjTR40URJc4Pd0sbGX7oAJzMr2y8HsGWVGwj6tiXCBn1zidohKBtwlXZEkdh27
	m7LSIPmqkimRZeSgJrtQDXRBrMZ1F2cSf2coRBSBrIxz7knXAMyJ1f63HvrQ45F7qiFLdSyEvXm
	Kf5KrpreHARyaiPw6jnUr3/G830KLEDzjr6YqnCEeyIx9bfqkX9eLdshTaqaxLLw8Qjl9dFVn0r
	gUfMVdigWbTzQS0G+NI9AsPAp5Y0/+6tQnwzEhWlWkKCVhJyp8Nj+xgx0htPbpCC5DaKqUB9LUd
	/oxrvceCFSZ64GIIoye87aGQsangdrDwC58/SDgpSqdsU7raPYXJryw+7IyzDR8AQQvnENETYSW
	M8=
X-Received: by 2002:a05:6102:831c:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-785c39b30f1mr567577137.6.1787899136690;
        Thu, 27 Aug 2026 23:38:56 -0700 (PDT)
Received: from [192.168.100.153] ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e849d8494sm454195241.1.2026.08.27.23.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:38:56 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 28 Aug 2026 01:38:24 -0500
Subject: [PATCH v4 09/10] iio: adc: ti-ads1262: support REFOUT and VBIAS
 regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-ads126x-v4-9-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
In-Reply-To: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4665; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=awLx3251t6HAnsVHNTGEYJXrS1sww/D1jVL1AboaEro=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkTdd4oLX6VJJ3+u922OXPW1B1B1xVX8jzfcEWz44lR2
 HpO7Z7dHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjARv/+MDKsDureeneUeEPi/
 Ym0hO+/tN8dEn3zhaub5X7vIcEXY54uMDBubVlxv8L2m5t4rWXW17+i+X9zy4oVc/HKRMp4e2nw
 HOAA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Register the "refout" and "vbias" regulators to be able to use them as
common mode supplies.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/Kconfig      |   1 +
 drivers/iio/adc/ti-ads1262.c | 119 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 2b60ade01e90..4548fec1f86f 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1864,6 +1864,7 @@ config TI_ADS1262
 	tristate "Texas Instruments ADS1262"
 	depends on SPI
 	select REGMAP
+	select REGULATOR
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
 	help
diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 3f6d34a08b29..4784142f35c9 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -25,6 +25,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
 #include <linux/spi/spi.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -1132,6 +1133,120 @@ static irqreturn_t ads1262_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int ads1262_vbias_enable(struct regulator_dev *rdev)
+{
+	struct ads1262 *st = rdev_get_drvdata(rdev);
+
+	guard(mutex)(&st->xfer_lock);
+
+	return regmap_set_bits(st->regmap, ADS1262_POWER_REG,
+			       ADS1262_POWER_VBIAS_MASK);
+}
+
+static int ads1262_vbias_disable(struct regulator_dev *rdev)
+{
+	struct ads1262 *st = rdev_get_drvdata(rdev);
+
+	guard(mutex)(&st->xfer_lock);
+
+	return regmap_clear_bits(st->regmap, ADS1262_POWER_REG,
+				 ADS1262_POWER_VBIAS_MASK);
+}
+
+static int ads1262_vbias_is_enabled(struct regulator_dev *rdev)
+{
+	struct ads1262 *st = rdev_get_drvdata(rdev);
+
+	guard(mutex)(&st->xfer_lock);
+
+	return regmap_test_bits(st->regmap, ADS1262_POWER_REG,
+				ADS1262_POWER_VBIAS_MASK);
+}
+
+static int ads1262_vbias_get_voltage(struct regulator_dev *rdev)
+{
+	struct ads1262 *st = rdev_get_drvdata(rdev);
+	int avdd_uV, avss_uV;
+
+	avdd_uV = regulator_get_voltage(st->avdd_supply);
+	if (avdd_uV < 0)
+		return avdd_uV;
+
+	avss_uV = st->avss_supply ? regulator_get_voltage(st->avss_supply) : 0;
+	if (avss_uV < 0)
+		return avss_uV;
+
+	return DIV_ROUND_CLOSEST(avdd_uV - avss_uV, 2);
+}
+
+static const struct regulator_ops ads1262_vbias_regulator_ops = {
+	.enable = ads1262_vbias_enable,
+	.disable = ads1262_vbias_disable,
+	.is_enabled = ads1262_vbias_is_enabled,
+	.get_voltage = ads1262_vbias_get_voltage,
+};
+
+static int ads1262_refout_is_enabled(struct regulator_dev *rdev)
+{
+	struct ads1262 *st = rdev_get_drvdata(rdev);
+
+	guard(mutex)(&st->xfer_lock);
+
+	return regmap_test_bits(st->regmap, ADS1262_POWER_REG,
+				ADS1262_POWER_INTREF_MASK);
+}
+
+static const struct regulator_ops ads1262_refout_regulator_ops = {
+	.is_enabled = ads1262_refout_is_enabled,
+};
+
+static const struct regulator_desc ads1262_vbias_regulator_desc = {
+	.name = "vbias",
+	.of_match = "vbias",
+	.regulators_node = "regulators",
+	.supply_name = "avdd",
+	.ops = &ads1262_vbias_regulator_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+};
+
+static const struct regulator_desc ads1262_refout_regulator_desc = {
+	.name = "refout",
+	.of_match = "refout",
+	.regulators_node = "regulators",
+	.supply_name = "avdd",
+	.n_voltages = 1,
+	.fixed_uV = 2500000,
+	.ops = &ads1262_refout_regulator_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+};
+
+static int ads1262_register_regulators(struct ads1262 *st)
+{
+	struct device *dev = &st->spi->dev;
+	struct regulator_config config = {
+		.dev = dev,
+		.driver_data = st,
+	};
+	struct regulator_dev *rdev;
+
+	struct fwnode_handle *reg_node __free(fwnode_handle) =
+		device_get_named_child_node(dev, "regulators");
+	if (!reg_node)
+		return 0;
+
+	rdev = devm_regulator_register(dev, &ads1262_refout_regulator_desc,
+				       &config);
+	if (IS_ERR(rdev))
+		return PTR_ERR(rdev);
+
+	rdev = devm_regulator_register(dev, &ads1262_vbias_regulator_desc,
+				       &config);
+
+	return PTR_ERR_OR_ZERO(rdev);
+}
+
 static int ads1262_dev_configure(struct ads1262 *st)
 {
 	struct device *dev = &st->spi->dev;
@@ -1939,6 +2054,10 @@ static int ads1262_spi_probe(struct spi_device *spi)
 
 	indio_dev->name = ads1262_device_id_to_name[st->dev_id];
 
+	ret = ads1262_register_regulators(st);
+	if (ret)
+		return ret;
+
 	ret = ads1262_populate_tables(indio_dev);
 	if (ret)
 		return ret;

-- 
2.55.0

