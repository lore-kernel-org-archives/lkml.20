Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778371;
	b=s7EUbyhKtx0pooQ19lgMEAyqhfNd4qrI6qMw5tTz2EY6YiR/0N6f/Df67+1GoRrf1aQX
	 mrlvkMZEbfxTjNZFTTa65VBuNWotEIt8fAr4tKVE9efLnBieVzejEEITfv2+ShUgSrLCo
	 TLcvAUloxnwIhGdwyprLyfMWa6o/zats8h/Zd4fvz7szSrM8d8lQ4JN1t26eMIXACixJE
	 zdZ6L3dxOsGksaQljQA0T1xbCzA1jjHhvRrqXGY8B+aIYhVXxjwQ8HnRqTzJuVaaU7cnp
	 /Wj1cwqfGmZvO/XGO1MxoYq2j+bCfOGfHVyDBeL2rVbrkjl8hG9cb8EQmDq+fRjjkCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GVmgd8z0CPb2cc8gY/ciKAfurSnSMglt/JBh+HjasTs=;
	b=25dSu7+ZJ9PjqoFdzBPDWs4ICZpzK3hDALdzLXjgY/sGOjvC1JAupyiqIBEopFoFY0+i
	 gb53/wTwuuwfwy84qOwbPMnQdwnTqj1Ilf1tY0VDRqDXWK6gmd46YTLt+N8pHsFb3G/7z
	 xBymEyqJI74ElNkXtjM7bFdlw2qZaZE+iqVVGcaUDEbSWz6pUZhCidU+urxJVpqWdU1zT
	 38A5fL9qQiFGlIWDWBQp8HtEuIBv90ilzXlFmJidct1G1FK2HlnjHKOSMQJcklmU9AU3w
	 dwYnv/Z6En6YR+azmv8s8xKEPyLH6QnAJI9etTZliLhS02y1uUFJSnq9QCQw2Qj3gyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RGgWKqKe;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2AF60A2609
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB2AF60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RGgWKqKe
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-487049569b6so691102f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778369; x=1793383169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVmgd8z0CPb2cc8gY/ciKAfurSnSMglt/JBh+HjasTs=;
        b=RGgWKqKeYbqLW0wSlqk2RC3TVrh9pZb/qBOtmdo1z6Um8DH2YQValyJHCcsrU45xRM
         rqds4snvjM3RElw0tPKlmBnG/ZS59z0VNp5NlNkyurocmDjZGYNz2rqTjz+Sgh3DCfRc
         Pfq5WtRupPT31sivjVqm1WT66KRoj1RRI5BpVuahZGYM6cCTktx1fRKm+lHllMR5W6uH
         MH4iceWt+pWQIZX1Jzf7qANDe77R0xQ+zclk1cw1PNeqbS6xuWJJ9wGCqOH4h8JqIfOk
         6QObAnUW6kJkKfArxU3L18Iw5Iuq2sXspHU7vZ5TtHbHTs7Xuwb+hUQ84Erq0FKd1RAi
         dOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778369; x=1793383169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVmgd8z0CPb2cc8gY/ciKAfurSnSMglt/JBh+HjasTs=;
        b=udAcfWdx7MdrfuPo2rWBFUkOIo3m9TgGBISgE6KgSJazbuQX9wIYrvVrs5wK3Rs3w9
         NLu3yPbu9gwsU7SXOkCLV+dkcTywT7HBAKG50rqS4P63xoTTu3KQgJ5N7Qmft/0RXSSL
         y109v1TnUm0f5z6oRDIjVKISNxtg9byKqpFeTmH1B+vV7rvyQBq7ZIQgmW5bXtQCKuuT
         bSEWgdhPjw1cP4YaunNJHKofqaeFXL6xYTmwAl+ty0G2Rz8GQUyZ3WbisuvPWRqWZwwy
         PwCJTZrS97qZFBYeslLCafXyf8hrupp9zXjxDT1lZ+6LEs08ZN9obOZ22SA3GJyvDIcZ
         fRpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1B5tdlMZAGcMqmPiO/xVBOKfqZKfUyclwOENS12EtgPjguAnrkjaQkVSbKUOl6/1GiSPl136KceQfhes=@vger.kernel.org
X-Gm-Message-State: AFq9FYINJEpHoZoid1LVIii4RfI/5D/6XCJ8rNKqgO1B3diEdQPAAde9
	e4O6DEbV5C2ZNlbaNl0MFmIbA510WLCNIT5bfNMNiGDbpREX3K3AeYwF
X-Gm-Gg: AYBFou2jvItsUPchJX4XjkDFd3VQKxdInhfC3lSj3FH6ColcYr8SmGZKGpGmqjRxwaI
	AQFG7/wmrD0fPM3lQRmhW0CI93PQYKowCLDdzy0rFst4keEzEND/d3ObPGmqfREgxqR+ck0dKlH
	K6SpmbR2Yt/1l2MWfCnivbDMJPWhin4D/Ois8JIiErmU8B8ZxpAaiXuoVz4vUUaDRHeRiNxFeNN
	0913uIcVxeFGZ0KiXv47pYyzkScltQNcVY/Ra2c4OYXfBjbVUws+H5SbWqUOEr1FqPbpPnHj12L
	Sqhq0OtCskEyzRCxo2D5bb26ilzVNU4yKkmkuV47SEUQWVYtTLkDp91ystUeSDKO/XLZZo6JD5g
	DkhtY5ds1UIfIhtfrXiGdoXoPc2e+4B3/kRtd7K/7IrH+k0hOSU/A2UgGNG3y8Z6cfJskoodpqD
	+qwglBKMWFbtU3tP8S2OxgfKKqVa/+YZUW0gTFqefT+w1y+oujS5OLShfKWQNhUIpXZAZZArh0m
	IaJ2U3Z1u5qFAljcwNtWKQvHEPNFcj+0l1CpQ8K5OdKem5SeYoaDOtuxkjmcWFe+SEMJ1FoQRRw
	a2t3Ch87kWS/I6ZtthZvJENfTpaenmCdfnP8ewOYokrAEuYwRFIVwabpxUqLgcz1Ip6roA+470i
	1mpM5pyLtesuKc3JDEJlFho2pQqHVJyFAFlt6G1Lam0FT3w==
X-Received: by 2002:a05:6000:22c5:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-48e3859df07mr4841249f8f.18.1792778369013;
        Fri, 23 Oct 2026 10:59:29 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/8] iio: adc: rzt2h: Add optional reset support
Date: Fri, 23 Oct 2026 18:59:15 +0100
Message-ID: <20261023175919.160103-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for RZ/V2H(P), where the ADC has a module reset line
that is not present on RZ/T2H.

Assert the optional reset when the ADC is runtime-suspended and deassert it
on runtime resume before performing calibration. Assert the reset again if
calibration fails.

Use a shared reset control to support SoCs such as RZ/V2N where the reset
line is shared between multiple ADC instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- rzt2h_adc_pm_runtime_suspend() checks the return value of
  reset_control_assert() and returns it if non-zero. This is to
  avoid churn in future patch.

v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 2ada8ecb2603..51a976f85ae7 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/time64.h>
 
 #define RZT2H_ADCSR_REG			0x00
@@ -91,6 +92,7 @@ struct rzt2h_adc {
 	void __iomem *base;
 	struct device *dev;
 	const struct rzt2h_adc_chip_info *chip_info;
+	struct reset_control *rstc;
 
 	phys_addr_t phys_base;
 	struct rzt2h_adc_dma dma;
@@ -709,6 +711,10 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, adc);
 
+	adc->rstc = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(adc->rstc))
+		return PTR_ERR(adc->rstc);
+
 	ret = rzt2h_adc_parse_properties(adc);
 	if (ret)
 		return ret;
@@ -770,10 +776,27 @@ static const struct of_device_id rzt2h_adc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
 
+static int rzt2h_adc_pm_runtime_suspend(struct device *dev)
+{
+	struct rzt2h_adc *adc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_assert(adc->rstc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int rzt2h_adc_pm_runtime_resume(struct device *dev)
 {
 	struct rzt2h_adc *adc = dev_get_drvdata(dev);
 	const struct rzt2h_adc_chip_info *chip_info = adc->chip_info;
+	int ret;
+
+	ret = reset_control_deassert(adc->rstc);
+	if (ret)
+		return ret;
 
 	if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
 		return 0;
@@ -785,11 +808,15 @@ static int rzt2h_adc_pm_runtime_resume(struct device *dev)
 	 */
 	fsleep(1);
 
-	return rzt2h_adc_calibrate(adc);
+	ret = rzt2h_adc_calibrate(adc);
+	if (ret)
+		reset_control_assert(adc->rstc);
+
+	return ret;
 }
 
 static const struct dev_pm_ops rzt2h_adc_pm_ops = {
-	RUNTIME_PM_OPS(NULL, rzt2h_adc_pm_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rzt2h_adc_pm_runtime_suspend, rzt2h_adc_pm_runtime_resume, NULL)
 };
 
 static struct platform_driver rzt2h_adc_driver = {
-- 
2.55.0

