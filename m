Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903869;
	b=dxPrqA/+I8iiezW46I3NiXN69SN6mfc1djctghWHjgr5qkA1u6mrQweBKFJuQ9D7nFgK
	 i3PQGOIdL9cpGTCoLKCdG3Yk+v7uMGFonVwbyXY7GrS/EeFP71xi3UV+Sjd0QptaC/Aq/
	 QO9C8lnCKBtLB+TUsMFM4mLQfiVTdr5SPsp5Zz5pQfKUlJLUnZ7aSMNVzj9HK0nXP2c4h
	 0GRfskNlV5cXP0+Bh+789p3tLp/kZgwNzsVxRDdMptcNy4evmVwBBHcrb8UGUxniB4dMP
	 b2dRdnOwS9gXbiFJyyvFgDaRMMyMNrpwCmLzDCpKmpWJVkWyIdlviPBDW4Td4/SwAyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EgrVZa2eZmqWGHTSXzSBkx9rK3FiMfFpfyVDiLiMkq8=;
	b=JagCLXvbh3jEXvUN1OPYzGs8/tIf85MeA4VHRA9sBT9THTrXwrUwndd2nzXwaXh7Sq8a
	 HDg2Kr607ltKMgIZY+jHK4YCwcf7ssKuO4cwvZG0cH4wEbihlrMlaoCPevHIozp+hezb3
	 P2puZ2rGcwzrcH4mDZTrZ9jW7p/2ZbSx42FL8IG8hMjWcCZWvA0RSeqo4OzJJXLQnAMsM
	 k7lWD1LPZaW1xLw1Ta288kDCmxQU0OVz38L4QdLZV/s/F242FTq414HOWrU3C26Omgzg8
	 +jkDexYNp2sCiomSNEdc1K3aqJv1lIvrah+7yxbU1VPiDfRB9eSYQ7qME9gTz0pV8Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=qJ0w7yjt;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8807606A8A7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8807606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=qJ0w7yjt
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b807aab44fso2595341a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903867; x=1795508667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgrVZa2eZmqWGHTSXzSBkx9rK3FiMfFpfyVDiLiMkq8=;
        b=qJ0w7yjtJE1lC1zKPwOibwHew9VyeF40XwkE7/3yvx5PT+Ju5NAaJ4PAYpSd+gwHGY
         w7cc1v7y04SypaBVvpt0FdJ28SLaaLsSZoQeNlJY+q4fNMRgEosPLHV3CHWwRikNnAx1
         GmpPsBD7FywbCP4QoC/tQcG+Bwl3jGw0dQYN3ntPTRr5NsIOkJK7aiGBYTPyHA9B3Yhf
         m9wg2+ELiGZz1v/ioIhxWmVh2DL4jz1BZ6oJLEFOPFEMV0/0NSkxHHhQAeV0VysiAjI7
         ZrbLuE9PTGnkywNGKg28gayA6JsZ5rWJo/l+NwLWZQZynBQktGrHxtKU7fZkqerZZW1Y
         G6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903867; x=1795508667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgrVZa2eZmqWGHTSXzSBkx9rK3FiMfFpfyVDiLiMkq8=;
        b=0zIROx3j4Wq7G97KFa4V/UV9S6Vp4tlOmyOGhv+72aeyvIiNejQmzMEPLay4updXjn
         IEb4e31yZzkYXjdsuBYXWXv+X3ysgxvBX0pyiQ9YeMG93TFNxMAEpoWDnAcNaK5s0ASE
         IpaA2+El9RtU81d565FS6TlMFCGKynoYdtnaCZiQt5jDzmMqzn6Gw2DNfZD3XhdmN32m
         xZJuq1+7eph3Yu4tZf/81vRgB91BH3TW/wS+PKuneOJLQ2q8X+vOmN2bBux6tBtAAvIS
         XCZ2XA1exbrD923qL+ELPKqQBzIXM5wv7je6VvNV2mAj7ODkRT2c+4MUBNKP98ChSJou
         yddA==
X-Forwarded-Encrypted: i=1; AL+hErG1hBXtxC48v5FoNjpJCDZpQDOz1oEAP7OEHLuOhAqUwkgd6wyX34iy2BQ4SYKMYzfea9YECm2PaZpPT7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+4Jg+qX7/jDeYGsdgEFF3Wg6Kf0oCKpAe8Gwm1XE8nhpas2C3
	O0wVeB4WBsykg3GDWtJAFpObYYug974B/b1g0KlZMsFMV0y1jjSAHDAQPA/oP67XceE=
X-Gm-Gg: AYBFou1uie9Qvm27Zfza+jZS0C2xligGIVv32SRARKC7GkFkDVwar2ERvsRYalC/v+T
	+dun/1h7joWqRrtFJ48cfENdcvbXpZQlONIUlMC1/pkXzv1yyMM+5UXuuRQLStkjSlmLaxNAVvD
	6y0LdSguXZSHkedJf27YIjy+MbY7qtVA70XqlzJamannbxxTdoWuBbyT6zBF3acyuBSr6yDU75Z
	GpfixmtAS4zjeL2SzfOTIchnqmfb/4rBaf59oGND00C+kWwJDewMUlxjug60pjR21k75vsLKH6C
	TeZXuLWVqr15e3/Pc1z5g5P6tAHFDrUYUCV9TAXqxqiTUtEwBYFev/bvrnOfwYcdvkuVwbiej+A
	qgI3FmxWO4uNqtpmmDxy0mPxOjjw2ZeFqaLszPIqY6g9k0Ik9/Nz7qaKRx+0Gf+OtQuTIYOGOdp
	imWnxsfamr2VOJaTA52cBFgd/Y7hR5MNrJ3Hqq+1WKPBjJRpUpyQOYFN7NnnEWQ+jIfsVNLrAwy
	aMia5aJ6PMCJUI/ZB+vPCrICLZ/pp8EZmQXztpqkeDeCnLVcUyQ/B6Lm50y1XAuo0ATRMeDgXzU
	lIN2grm9PsvS2LIxR6EilLdhyMrvhxEGru70ttY0mA9rvEGWV0SypJFVVD8blUlyJGUHwlxCuH3
	KpYQ/kVqilyq7IXwtsbTucH/CjXgMx33It/rbS+JFfNhJE1id
X-Received: by 2002:a05:6402:88a:b0:6b5:5530:c9af with SMTP id 4fb4d7f45d1cf-6b7c0bb79ebmr6791992a12.15.1794903867414;
        Tue, 17 Nov 2026 00:24:27 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:13 +0100
Subject: [PATCH v4 3/5] thermal/drivers/generic-adc: Allow probe without TZ
 registration
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-bat-temp-adc-v4-3-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=2598;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=IewvetNZMf9FalFWEd0iq4I/lCqxZHq/FLtsO53H2jA=;
 b=K0QTEVwf1uzSjckbKxKpcCKrAkkngarK9NjPv21hTvhJ9thkoh3P+WGons6vpo/CWOd5JylkV
 h4KSZ3LpFcKCi0kZt4zAzExS9pRPsxol5yvMrSY/2FHbt73E/Xe8w2m
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

If the devicetree node is not referenced in a zone under /thermal-zones,
devm_thermal_of_zone_register() will fail with -ENODEV.

Since the driver is now also registering as an IIO device[0], allow the
probe to continue without the thermal zone.

We also can't use gadc_thermal_get_temp() anymore because we haven't
necessarily initialized tz_dev.

Link: https://git.kernel.org/torvalds/c/3762f5851ac5 [0]
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/thermal/thermal-generic-adc.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/thermal-generic-adc.c
index c6a7a65aa6a6..b73cd47bffa6 100644
--- a/drivers/thermal/thermal-generic-adc.c
+++ b/drivers/thermal/thermal-generic-adc.c
@@ -55,9 +55,8 @@ static int gadc_thermal_adc_to_temp(struct gadc_thermal_info *gti, int val)
 	return temp;
 }
 
-static int gadc_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+static int gadc_thermal_iio_to_temp(struct gadc_thermal_info *gti, int *temp)
 {
-	struct gadc_thermal_info *gti = thermal_zone_device_priv(tz);
 	int val;
 	int ret;
 
@@ -70,6 +69,13 @@ static int gadc_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 	return 0;
 }
 
+static int gadc_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct gadc_thermal_info *gti = thermal_zone_device_priv(tz);
+
+	return gadc_thermal_iio_to_temp(gti, temp);
+}
+
 static const struct thermal_zone_device_ops gadc_thermal_ops = {
 	.get_temp = gadc_thermal_get_temp,
 };
@@ -90,7 +96,7 @@ static int gadc_thermal_read_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_PROCESSED:
-		ret = gadc_thermal_get_temp(gtinfo->tz_dev, val);
+		ret = gadc_thermal_iio_to_temp(gtinfo, val);
 		if (ret)
 			return ret;
 
@@ -193,16 +199,13 @@ static int gadc_thermal_probe(struct platform_device *pdev)
 
 	gti->tz_dev = devm_thermal_of_zone_register(dev, 0, gti,
 						    &gadc_thermal_ops);
-	if (IS_ERR(gti->tz_dev)) {
-		ret = PTR_ERR(gti->tz_dev);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev,
-				"Thermal zone sensor register failed: %d\n",
-				ret);
+	ret = PTR_ERR_OR_ZERO(gti->tz_dev);
+	if (ret == -ENODEV)
+		dev_dbg(dev, "Thermal zone sensor register failed: %d\n", ret);
+	else if (ret)
 		return ret;
-	}
-
-	devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
+	else
+		devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
 
 	return gadc_iio_register(&pdev->dev, gti);
 }

-- 
2.56.1

