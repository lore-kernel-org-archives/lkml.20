Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572332;
	b=PUcYoqRPGJlxNa1G0nLMjRkg8G1FbXCkY9en17mzPddmVhUfivR29IjoL2sIQZXnmJk5
	 jcs27mDy13mVITov0GM+EViJ+BhXXQJ2sSiX+Ju+ds8RCdLERfs2/veQBkQRmq40H9b38
	 JwGxUV1iEbK0othVsYHjIO7rFBGAdySx0T6ALB8UXHOwPI0P5TDA/Kk1MS/CielWv1if+
	 6oR7UeiLBdo4nLjfQ/CKoxvbCjqGW946PvtLEzRjS4PAesk13Ej5UgPKLaJ6oMeB9U7sl
	 d2c01MugAVJAWMsnovM94GAvMtWwWfDY3oYLQyqmrCu1Z7hGKgi0AdVk9qhjVD3E3vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/oo0P+3X9BiHnkYcpoTTWVObs+mJWQllEAH3BZW8Dz8=;
	b=KhknTydgwTjhPjEar9YfA0B7a41C0OrviDvjuePRSVSj8eWf3CWSJTFjZP+B3iQP7fMG
	 5+MHUUDFOc5qoriskyhxB6VaM5zz12alV+uZmwPYHMGkvyx9rF6dHFmnYWohoGx6AQ9Ty
	 17ZX8q9rrn/P7Y+WzPY4h/4v3ja9hwHKG4Y+PtPclrwaNXp0Z6b6Hb8ah1O5tJrxOaKBB
	 nK3iS4SUt0qEJv0TC+ABdK4lPufTaZWAlf+RoOHHx3UowdUOHmjRcnnWeSKcmtM20qcwL
	 oBIwjas2kgp9m+TXUGScagU679biAvZiv7FDx0qU9HaEtuMA1M2bDgJDRZusGUq8WbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w0q6EgDL;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E7606A33D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 755E7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w0q6EgDL
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so15129985e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572331; x=1794177131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/oo0P+3X9BiHnkYcpoTTWVObs+mJWQllEAH3BZW8Dz8=;
        b=w0q6EgDLGeZ1QrSapJpMVNHgMc41t1fCMnVLmQHjc4a3vz29cywmUua5PiIvBMKCwk
         s8fjOzFEjH5i6++s1Xq3ep0ylavf6hms+Eo9v813oW+XDbSkhOkTQVcQXUa4zKSg/AqU
         oz/euJ6V0iSok6UXpJPMRDvbIoTFZPqHAL0H6O7fk8y4oF0VJE9bkr0WBCCZE77SPH9n
         x3+3RAcXkneENO8+CVRsq1n5kRK0yP1UAWBAfJ+2jxCDNC1oepwy4ksw/LRmLbctZqxe
         Vg7L/yJ8TwQRxKEZY2c03pxTduEHsmrAMTm5NrNPxJv6gXuojubfZ77yj4kd+BnGdAFu
         zSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572331; x=1794177131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/oo0P+3X9BiHnkYcpoTTWVObs+mJWQllEAH3BZW8Dz8=;
        b=sHGL8A6zNnWLjqGAVPk/t06Jb+XWHgQP2V2e9P2F6TdcYv6lI3ysuTp7rbTjUZlivN
         uAvC9chtc20+szov4+aNxxZ5qkbT6/ydhksPwsIt8r3wR+HC1a8bUqapZerD41hBW9yK
         1pCPOqsBB+9E6bf+4e+QEA1HNDquWiPeum9h0aeg0rm8HNg9Il48t8uA7CcU3gpzeS+v
         0Tce5fP2cT1zycbTkPxYTzPKA8UsONythgvbqiBMlDLcvrVvJdm5f3QQ6gy2NA5l0scA
         9aVS962dD1tb1gUKOoKQ2nIPe/j00SHgy358Wd9ySmoYT59QqBoYPKpoylDhUPKyFY6p
         dWvA==
X-Forwarded-Encrypted: i=1; AKwUvBwiETqisv4boN4kyHTx9dJ6NnA2BrrmlW7bqPhjUBueFxUEDwptiG/WtkQJPERq5P8tw2eNqS0Dy3xRYGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPr6feoydIXyS31OnGs7L7nKG//UMO1qy1oYz3CInt6/aFHHEF
	aj1I53Skviw9Jda2ppb84Xs/gkEgUhQgtxAvRwSGWoklxK5GpRouB4Al
X-Gm-Gg: AYBFou3BCINhsT4Hxy6mPg31wqeBaKkJpzys4fOCtFioDh5TS/H/XfThWuzgY3OcaHw
	9fUk3lbvkPYh8USVJxUlt7MJg6Qcm5TEQPzblmBQade3wnBnyrg5eGr6T3aNp9ChizjhMkCu5a7
	OD+CcPTLHvW8y79saKT5FbzV/rjLli18vUW3n5WFPMC8jjbbk8yQE5n4P+i0lpFIaHL0ILrS3JN
	QaetdL0gCANAvcijXpHtPPVA5kaAinaVsWLUNvspqdTvuimGDPMNlxk482sEgS4+Ax0PXmMrHfp
	1fVJ2eG4q2DuIkNv9tmZxt13ngI+7L7bBj7B2sy6RqRaSGHrFRV790q2zQX5Ham009eqn3nTcJt
	y4iO5FMEU7pvbqq9kEQsdTDuRLw13qYUywRWiqOeqjmsSLtHj3E9NryEzi7p0BgcJZyBotkIiCF
	OjHGF1C9VqycF11Gkl3Y8FjkF+i6JIn7hB3wLtwm6nuXkRfC2DKNcVbhFLN5G1MzODPm2AAYvse
	/hlHtp/2TLX5jF0Knya3Zf5MfpDqOnOZhtXuXT0lbp50V5oLe1NXDki+gnm5QttuS7utuTa7hwz
	J1S6pa4fdogVLgSgTey513TN+Vdcy50EB4ifjdDTJCWAlEqJiXlYe0j1ld+EJFI=
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr199017885e9.24.1793572330786;
        Sun, 01 Nov 2026 14:32:10 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:32:10 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] regulator: sy7636a: wait for power good on enable
Date: Sun,  1 Nov 2026 22:31:21 +0000
Message-ID: <20261101223125.302001-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101223125.302001-1-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wait for power good on enable, as the TPS65185 and FP9931 drivers do,
so that consumers can use the rails once the enable returns.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/regulator/sy7636a-regulator.c | 52 +++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index 382bab017784..f87144e921da 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -7,8 +7,10 @@
 // Authors: Lars Ivar Miljeteig <lars.ivar.miljeteig@remarkable.com>
 //          Alistair Francis <alistair@alistair23.me>
 
+#include <linux/completion.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/mfd/sy7636a.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -17,11 +19,14 @@
 #include <linux/regulator/machine.h>
 #include <linux/regmap.h>
 
+#define PGOOD_TIMEOUT_MSECS 200
+
 struct sy7636a_data {
 	struct regmap *regmap;
 	struct gpio_desc *pgood_gpio;
 	struct gpio_desc *en_gpio;
 	struct gpio_desc *vcom_en_gpio;
+	struct completion pgood_completion;
 };
 
 static int sy7636a_get_vcom_voltage_sel(struct regulator_dev *rdev)
@@ -65,12 +70,43 @@ static int sy7636a_get_status(struct regulator_dev *rdev)
 	return ret;
 }
 
+static irqreturn_t sy7636a_pgood_handler(int irq, void *dev_id)
+{
+	struct sy7636a_data *data = dev_id;
+
+	complete(&data->pgood_completion);
+
+	return IRQ_HANDLED;
+}
+
+/* return once the rails are good, so that consumers can use them */
+static int sy7636a_enable(struct regulator_dev *rdev)
+{
+	struct sy7636a_data *data = dev_get_drvdata(rdev->dev.parent);
+	int ret;
+
+	reinit_completion(&data->pgood_completion);
+	ret = regulator_enable_regmap(rdev);
+	if (ret)
+		return ret;
+
+	wait_for_completion_timeout(&data->pgood_completion,
+				    msecs_to_jiffies(PGOOD_TIMEOUT_MSECS));
+	ret = gpiod_get_value_cansleep(data->pgood_gpio);
+	if (ret <= 0) {
+		regulator_disable_regmap(rdev);
+		return ret ? ret : -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static const struct regulator_ops sy7636a_vcom_volt_ops = {
 	.list_voltage = regulator_list_voltage_linear_range,
 	.map_voltage = regulator_map_voltage_linear_range,
 	.get_voltage_sel = sy7636a_get_vcom_voltage_sel,
 	.set_voltage_sel = sy7636a_set_vcom_voltage_sel,
-	.enable = regulator_enable_regmap,
+	.enable = sy7636a_enable,
 	.disable = regulator_disable_regmap,
 	.is_enabled = regulator_is_enabled_regmap,
 	.get_status = sy7636a_get_status,
@@ -104,7 +140,7 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	struct gpio_desc *gdp;
 	struct sy7636a_data *data;
-	int ret;
+	int irq, ret;
 
 	if (!regmap)
 		return -EPROBE_DEFER;
@@ -156,6 +192,18 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	irq = gpiod_to_irq(data->pgood_gpio);
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq, "no power good interrupt\n");
+
+	init_completion(&data->pgood_completion);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, sy7636a_pgood_handler,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"sy7636a-pgood", data);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to request power good interrupt\n");
+
 	config.dev = &pdev->dev;
 	config.regmap = regmap;
 
-- 
2.52.0

