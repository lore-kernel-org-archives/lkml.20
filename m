Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99923ACA5A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283142; cv=none; b=W/AGdNLS5cwYaODvzjIVre5/GJFBIhT2Ifu5Luq7+PImsv4ROrLrlhp5Gr+K/YWEIP3w4BMtvDfIcIyRLXJM7Q/zdgCtf7k2z+v66GPMCLQb6CQ9fESW9KuPT9JmLH6JM0EUaESPWiflba4IUM1lYrIjErN3/wnVBu/K+Cm+C34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283142; c=relaxed/simple;
	bh=5SBDIrzGAQEBhEnuVBvjyWjW+cvgWc+5Dhaw9jOzesI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AlhRfiw9TQnJ8rV7ARA3h4B0XewGdN1Wp9yQGGUHG2G4Ytz83iRJLt2eTFehcSQR+5hVyKzxNsVberf/yaoJdeG5kcw9eSDpHYk8NMIq7MeXFk8hWf9Gg9mJUtNwvUr4QR3tq5psL68ckbqrdg/8y7THZU4YL5wHo85HT3Tc/b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyX+UMUT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyX+UMUT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c45111bebso353200f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791283139; x=1791887939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PKrnSSgSMY6ZmA5twi9Nx86W77c8h087WtIxcCKmQ0=;
        b=pyX+UMUTHn7PFHouaOVd5uID28UVxhEMuLqB0ZTWeMIiEL/lxyseo2TsVxQ+SsTo38
         Fe8CiATIwr6F39IKuDhjJGeTpfb1Ma3UIRAP0DK2HQROEXXGqjnl3eh7SNPg0B6oCGUR
         yxNe3JhaHg/+iaLHGseu7IMcUw3dwOd4I9mn3VH60JygeTtTtFdThMqePXYi4iz4rB41
         5iEv6iKE+JlLuBYSgvzLGFFoeNE02RyXrXuFB4CsIz1rR5W96WwnekHVuCKYTeNsSn11
         rtuTeDRSmyrdfqXUGVXxBe4v5NgYoG/AiuNvwakkbuP7EFT7FptA2cOw11y1Z4/sLHCO
         okuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283139; x=1791887939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PKrnSSgSMY6ZmA5twi9Nx86W77c8h087WtIxcCKmQ0=;
        b=DaeFpaba3UZJqc5fD5GX1BSXBjyDEXAzKaEUHdpLwTTrdA5O5OEcGodFR5bw8nR6f/
         9K0ui19eSifJtOXgb15KO2BkEwablPYdfVLk48A5NIXamrCd/XK02izHOWpXO7s/slL2
         EoSDyVTW8ZPOn4HbvyGJNh0ZkcvWGc13CAJkcdzRY5OBo9sxMaEhdhANPM3sy7/P+HZk
         IH9sE03N+FG8wU/k2kPaICPUYeTnw+6T1eyIVKO1lm0//5eKuNZY2qGgI2JYrgXmDjIp
         wxrBQne3JMos4HMG871sgq+SxVLyJQa9jNgX9PUNGZyo6SkpqRdjlUXYw8scVPVi/I/c
         LIMw==
X-Forwarded-Encrypted: i=1; AKwUvBzrdV+8m4V6UrtOBGbgyZfg2SCSk6QaWHBCGDvfrTwykFB7YBaYbKh6S9aw+bANmoYDApeiTK987d3tL60=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqST/WoX9ldfJ1Kx4zE3WD4ylOMr0VZWtfkZgXrBcK0Zmu0TXr
	clCBFoGsZxaTpDeJ0qtgCFl0hBqIS8dd7K7CrQYE03XpqYF4XlEb5eAc
X-Gm-Gg: AYBFou0gKJr9vz9e+AEt5BJKcrwJ/Kj5mpN7a/Dj2OvQSWbgmMLXwkqUI253iIwTkg8
	DD7RLaP3Xugt0EbLGh8pdGLQ9HxzhbCoUQYwkp5X44RZY/9TB+9RwCV8frD4pGVtVq28dzXMtnV
	1elZz8XZc/Wy/AdCRbXoEh1nbfEFFhKsujgy8V0WcB41POKXxbsPfTPRxNWzMy2qaoZEjnDdhP+
	z/QMlV0UK04+05e1Hld1jced2eJjWrd/tkLvEag+yN+57fYKOIZT4joe6a7p8WIKp6wdn0t1Rwj
	kkYmU/Aoji1+U+n+hdtJBBzrx61/yNifUVkPsI03CVSBilANGUa4icgalM7vECoSAHpG8leuEdr
	6KQ0E/Lixro1VXNT3i92lwuCfT9DG5E8yUaY8v/n3x7BaUGQnUsis9rmfyvqV7cdjLKn23PMCj4
	vIWEPXgyq8yqAvnYoA3rmQ5u/UK4yUxgUv9rkh8z+VR5cwn2Z2hnb09h++h3+cKfDX+OUapEp7p
	Ks8NF2I7dsxnl1Wuc4=
X-Received: by 2002:a05:6000:298e:20b0:485:8a47:5b91 with SMTP id ffacd0b85a97d-48c6d1ee143mr1211829f8f.46.1791283138652;
        Tue, 06 Oct 2026 03:38:58 -0700 (PDT)
Received: from fedora ([154.183.153.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd717f8sm2526963f8f.48.2026.10.06.03.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:38:58 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH] staging: iio: adt7316: use kstrtobool() for sysfs boolean parsing
Date: Tue,  6 Oct 2026 13:33:50 +0300
Message-ID: <20261006103350.32853-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual and unsafe character checks (e.g., buf[0] == '1') with the
standard kstrtobool() API in sysfs store functions. This ensures proper
handling of standard boolean inputs, fixes potential safety issues, and
adheres to the Linux kernel coding style.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 94 +++++++++++++++++++++++------
 1 file changed, 77 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..21a1b811a142 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -246,12 +246,12 @@ static ssize_t adt7316_store_enabled(struct device *dev,
 {
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
-	int enable;
+	bool enable;
+	int ret;
 
-	if (buf[0] == '1')
-		enable = 1;
-	else
-		enable = 0;
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
 
 	if (_adt7316_store_enabled(chip, enable) < 0)
 		return -EIO;
@@ -285,13 +285,18 @@ static ssize_t adt7316_store_select_ex_temp(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool req;
 	int ret;
 
 	if ((chip->id & ID_FAMILY_MASK) != ID_ADT75XX)
 		return -EPERM;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7516_SEL_EX_TEMP);
-	if (buf[0] == '1')
+	if (req)
 		config1 |= ADT7516_SEL_EX_TEMP;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
@@ -482,10 +487,15 @@ static ssize_t adt7316_store_disable_averaging(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config2;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config2 = chip->config2 & (~ADT7316_DISABLE_AVERAGING);
-	if (buf[0] == '1')
+	if (req)
 		config2 |= ADT7316_DISABLE_AVERAGING;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG2, config2);
@@ -521,10 +531,15 @@ static ssize_t adt7316_store_enable_smbus_timeout(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config2;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config2 = chip->config2 & (~ADT7316_EN_SMBUS_TIMEOUT);
-	if (buf[0] == '1')
+	if (req)
 		config2 |= ADT7316_EN_SMBUS_TIMEOUT;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG2, config2);
@@ -559,10 +574,15 @@ static ssize_t adt7316_store_powerdown(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7316_PD);
-	if (buf[0] == '1')
+	if (req)
 		config1 |= ADT7316_PD;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
@@ -597,10 +617,15 @@ static ssize_t adt7316_store_fast_ad_clock(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_ADCLK_22_5);
-	if (buf[0] == '1')
+	if (req)
 		config3 |= ADT7316_ADCLK_22_5;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -640,13 +665,18 @@ static ssize_t adt7316_store_da_high_resolution(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool req;
 	int ret;
 
 	if (chip->id == ID_ADT7318 || chip->id == ID_ADT7519)
 		return -EPERM;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_DA_HIGH_RESOLUTION);
-	if (buf[0] == '1')
+	if (req)
 		config3 |= ADT7316_DA_HIGH_RESOLUTION;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -685,12 +715,17 @@ static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool req;
 	int ret;
 
 	if ((chip->id & ID_FAMILY_MASK) != ID_ADT75XX)
 		return -EPERM;
 
-	if (buf[0] != '1')
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
+	if (!req)
 		config3 = chip->config3 & (~ADT7516_AIN_IN_VREF);
 	else
 		config3 = chip->config3 | ADT7516_AIN_IN_VREF;
@@ -728,10 +763,15 @@ static ssize_t adt7316_store_enable_prop_DACA(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_EN_IN_TEMP_PROP_DACA);
-	if (buf[0] == '1')
+	if (req)
 		config3 |= ADT7316_EN_IN_TEMP_PROP_DACA;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -767,10 +807,15 @@ static ssize_t adt7316_store_enable_prop_DACB(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_EN_EX_TEMP_PROP_DACB);
-	if (buf[0] == '1')
+	if (req)
 		config3 |= ADT7316_EN_EX_TEMP_PROP_DACB;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -967,10 +1012,15 @@ static ssize_t adt7316_store_DA_AB_Vref_bypass(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 dac_config;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	dac_config = chip->dac_config & (~ADT7316_VREF_BYPASS_DAC_AB);
-	if (buf[0] == '1')
+	if (req)
 		dac_config |= ADT7316_VREF_BYPASS_DAC_AB;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_DAC_CONFIG, dac_config);
@@ -1006,10 +1056,15 @@ static ssize_t adt7316_store_DA_CD_Vref_bypass(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 dac_config;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	dac_config = chip->dac_config & (~ADT7316_VREF_BYPASS_DAC_CD);
-	if (buf[0] == '1')
+	if (req)
 		dac_config |= ADT7316_VREF_BYPASS_DAC_CD;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_DAC_CONFIG, dac_config);
@@ -1969,10 +2024,15 @@ static ssize_t adt7316_set_int_enabled(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7316_INT_EN);
-	if (buf[0] == '1')
+	if (req)
 		config1 |= ADT7316_INT_EN;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
-- 
2.54.0

