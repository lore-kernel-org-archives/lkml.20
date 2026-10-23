Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778372;
	b=A41B9B89aLH1zAX/BG5nJbq0MScVX1UJJMmSFc2J5RXH9/Ztq9XE/7iBdhIwCW0hO0U9
	 TFYfcRJpedGDWExp9G/Fy0xxNzEHVvngtfcGL7ifBakB/aTk8l6g2ojOzC95035jnciXq
	 jdn01QeiKSVaZ+mzSPLgqnAMNxVJ/B2KBaSTugqasJRmyPm640jv/2HLZRoSEffS8CZ3M
	 pBq3dOhif1m7L7obls2ViTWzCwcsnK8gwfBMDyqIgzRpolFIhkDQW5MFSvSjtbj7juA8g
	 VEX0OhAKuZRXN185yjfCre4pS9u45Fk6+XcYK6howL/uBnrYA/PChVwdFKFI/3VlSUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=WkiQu/yXLk7Gnv6kxACf+5k/KFRhbQ3OUKruqKRLWhw=;
	b=1n6eq867MJb00xFqS8WdhupV0xgN4VJrBZnPFU/xy7TpkDS7uhANooLn5MWpfzeDKM/H
	 P6X3t+7WC4nhyeTx6QvrDZaUzezjkZno0su0pKJhGi7A7Y469pB0xDycNBPnTclSTCEpP
	 PA8He58FCkZbZG7YydaJPqE/6TPSAsBVfrFof3AYQxnn0501o/PfbVt+cu8OkrK0QvkH2
	 3SEKAqWXjpFTHwFUKg/SJFm7ma0W+CmtMgWGKx8xnPSpUg363HRYHVOmvCGpdWAznRXc9
	 uJDEkorQcJVjF4d45iWjN5Wj4gXwyG1xGvC5hoB2ZizvONAVsObY6dtgEVlaexplyWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4HT7nWn;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9662D606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9662D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4HT7nWn
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e00eee27dso764966f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778370; x=1793383170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkiQu/yXLk7Gnv6kxACf+5k/KFRhbQ3OUKruqKRLWhw=;
        b=Y4HT7nWnZbyR81TXpjXltfD7lHrSeNfFoRs6oIMDkoU4872MTfW4z8CXPzoH/6Wnx3
         Cy/XG5stD7ons84pjJSAPPws5Ak0bo2o3ghh0KGs19aHFVG/WO7fDp5bwU47i3vFPcwl
         1oWDRo/18WCVd3FldUmOovqOmzT9cmDCBvwgOnF/Eczah/DWKerEyCU7MLbQH9Rka0mw
         EhLqr/d2VINXQZ8L8HxSeNIiRsknq12oth4uQC+bFTTEIZsD/Z2qWHCZnql9r8bgFaGB
         IhCDxnIuccKGg4MuNlfJtGuNZ7z1nJWBCphU5TWIeKLFETPnc1GiveSif8a1ZbqOpNKM
         MTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778370; x=1793383170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WkiQu/yXLk7Gnv6kxACf+5k/KFRhbQ3OUKruqKRLWhw=;
        b=jFG4lLK6upPEEbE1P4yPjuX943u/5oALSHJCz39qX4u8yPgmzDK3kcJU5oIFtxJTk7
         HPfyLUSYVgHqwnAWhNeMflR1x2NN6XrXmEWryJ/ZuESHvwlUmqx7FnVgdhEw39WRmPLz
         OUzVicDw7PgQPD322pwWxoXK94xsJrKnEFLTN7+6U6CTVDZ+DgFtX+uwfO+wwQdixGVf
         7JYwBps45/bjlSgsxDezvhu9GNhSK722I3xf5pvfKsI26gReOzClNOnoacanu4Tu90U1
         jlLL/z3Xg+I0QhlHVW1pdemDw4+M/8xMWnqOXl1YMR93ZU5cHQJIBYmuIzxRILYSqkyv
         N1Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxUvcvz/EU4MrTH7QbKa3OK6WH7Fj/QohP0D2N6vKtujyHrEKBlvWCFqkZzeN9/ReVFSM1iIHNOvRhthik=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvG1s39isxrgIIJHrpyZa7u4kHCrNr1MQ2KRQKIk9gFktHQWgu
	hoQ9C79shjZBue6bMCOo9iKR+nDuRYzmu5OIt5aZW+qvyo2LMV9CQVTN
X-Gm-Gg: AYBFou1efHTVDEEufgWCNqKY+Yk1kM+PbPLADNyB3MqErXEzmJyRnG82UahnkLLdsLL
	oFtDXH9/+pbZta5OsMNtQ12q8+s3VB23afjkECqnqCKoBgm/pyJC0hglI5y/9lnu7H7sQJGT72K
	NjKHe6LCVqiURHf9iuzunkeCO/koGlQHCLTFoHi9PiEkZ6Pe8YIxXFVE1ZqJ5aWcXDxdsYoKvPv
	hQN5n/wUe/M1pZ+lzZcVOxJAGJPWEX93Sntim2iAwsiXeTiLHBGMWuYdsZMZiFiG4Si356THKkv
	NFRahBu6+2pV66NbW940i20/IdwfGpIAmK81kY4QGAtqD9FiHSHGQM07vibX9uVF1e1yHTxW7ft
	Edx7PoiIKvvKtMBjWuTzum2yqZOOE9JpRTh0Jxck1WPxzOlT7H2GDGLkCZ96aQ/rMEZn361fRww
	PAlIQcFmEI6xL+nQQdzoRXJDjsU8L/RlYpqBrBg4O0UFJAHFSD8H2PMtyKQfkYQP6C03t65CZ+w
	0fOFfNuMzHktGCU58zZXWdLy8LKxT6D3LPah3vRzJ26ifPbz8t8GcNfzuAN3TbAdXb+4xO2k1On
	NT3hyLTTbQsgclbXQiANC75z8T22KxwACEzC+5+jiKjZT2JnVPCUUWdf0cKPT6kjv+5BekBLnLR
	Xzrn4X9MEJm/nSsQe6xvpZ9lgA3soxaNbw8iqdVPewHn4
X-Received: by 2002:a5d:6f07:0:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-48e385a6073mr5116724f8f.24.1792778369969;
        Fri, 23 Oct 2026 10:59:29 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:29 -0700 (PDT)
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
Subject: [PATCH v3 5/8] iio: adc: rzt2h: Prepare for SoCs without sample state registers
Date: Fri, 23 Oct 2026 18:59:16 +0100
Message-ID: <20261023175919.160103-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the driver for SoCs that use the same ADC IP without the
per-channel sample state registers present on RZ/T2H.

Add a feature flag for the sample state registers and make the sampling
frequency handling conditional on their presence. Allow each SoC to
provide its own sampling frequency calculation and configure the existing
RZ/T2H support to use the sample state registers and corresponding
calculation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 51a976f85ae7..94dad479abff 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -61,9 +61,13 @@
 #define RZT2H_ADC_STOP_CYCLES		2
 
 #define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
+#define RZT2H_ADC_FEATURE_SAMPLE_STATE	BIT(1)
+
+struct rzt2h_adc;
 
 struct rzt2h_adc_chip_info {
 	const struct iio_chan_spec *chan_template;
+	int (*sst_to_freq)(struct rzt2h_adc *adc, u8 sst);
 	unsigned int num_channels;
 	u8 features;
 };
@@ -149,6 +153,9 @@ static void rzt2h_adc_stop(struct rzt2h_adc *adc)
 
 static void rzt2h_adc_set_sst(struct rzt2h_adc *adc, unsigned int ch, u8 sst)
 {
+	if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_SAMPLE_STATE))
+		return;
+
 	writeb(sst, adc->base + RZT2H_ADSSTRn(ch));
 }
 
@@ -529,7 +536,7 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_dev,
 		*val2 = 12;
 		return IIO_VAL_FRACTIONAL_LOG2;
 	case IIO_CHAN_INFO_SAMP_FREQ:
-		*val = rzt2h_adc_sst_to_freq(adc, adc->sst[chan->channel]);
+		*val = adc->chip_info->sst_to_freq(adc, adc->sst[chan->channel]);
 		return IIO_VAL_INT;
 	default:
 		return -EINVAL;
@@ -544,6 +551,8 @@ static int rzt2h_adc_write_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ: {
+		if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_SAMPLE_STATE))
+			return -EINVAL;
 		if (val <= 0)
 			return -EINVAL;
 
@@ -733,9 +742,11 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 	if (!adc->adclk_rate)
 		return dev_err_probe(dev, -EINVAL, "invalid adclk rate\n");
 
-	adc->samp_freq_avail[0] = rzt2h_adc_sst_to_freq(adc, RZT2H_ADC_SST_MAX);
-	adc->samp_freq_avail[1] = 1;
-	adc->samp_freq_avail[2] = rzt2h_adc_sst_to_freq(adc, RZT2H_ADC_SST_MIN);
+	if (chip_info->features & RZT2H_ADC_FEATURE_SAMPLE_STATE) {
+		adc->samp_freq_avail[0] = chip_info->sst_to_freq(adc, RZT2H_ADC_SST_MAX);
+		adc->samp_freq_avail[1] = 1;
+		adc->samp_freq_avail[2] = chip_info->sst_to_freq(adc, RZT2H_ADC_SST_MIN);
+	}
 
 	pm_runtime_set_autosuspend_delay(dev, 300);
 	pm_runtime_use_autosuspend(dev);
@@ -766,8 +777,9 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 
 static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
 	.chan_template = &rzt2h_adc_chan_template,
+	.sst_to_freq = rzt2h_adc_sst_to_freq,
 	.num_channels = 16,
-	.features = RZT2H_ADC_FEATURE_CALIBRATION,
+	.features = RZT2H_ADC_FEATURE_CALIBRATION | RZT2H_ADC_FEATURE_SAMPLE_STATE,
 };
 
 static const struct of_device_id rzt2h_adc_match[] = {
-- 
2.55.0

