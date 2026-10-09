Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AAE5013BB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571302; cv=none; b=Tkst0Ks98iCjOlSS0DuZkv1JDe0VrpyhjUYvzwJWe96+ApvR2s+h1WU/CJO1HPEYz63sRiQ65cpAVeorw19aIbmEhtyPoxsLd+TqHrHXhYaCcjjzqAXCfPVEtcgIP+p3GXdbpmqI3Rt47KedWIzTE+xCYMAfu2uUumheyk4uAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571302; c=relaxed/simple;
	bh=cWdSr/HCAYpw9N2hmIHYWZwHbcHbL62T+g3jRZ9hgjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cz7YZeFGJEqwCo1HGicjT8wTg9YHipoh1pi0H5CbPckIaX4b9CgNBxmJIj3nVYby6LaWDit0tQlhMlyLFrM5mUmKFkZKVmjl6GbIsLxfEKSEGePNd3WuYuvXnKqZrv9TsksOcBFMug3YXptn/GpQkYnxS3CFHKj1FInDp0kp1t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icIvWqas; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icIvWqas"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so1087335e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571293; x=1792176093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4hysl45OVBhRRFcK6ukjKkbAyi3VQ7mXgaShYNjelk=;
        b=icIvWqaswIL0xvdbmVeMnaLo3PZoqiV76okaZoItyVcMGyDo80rMvGYyZNAxj53rVi
         /mFuG4CsGkRCO6nnvE0ea1u1tFdHMYOvpOuQeALLpbVMYcfuusRLQNAM/c46ItCtKe9X
         esxCsx2DcWJJaaySQkBSGV618kJkcz+OCXfoO4M7eExn529liW8TlJTnNxg1aXE38xUs
         1qONi1/ZqkPorZYHkV8z2WjDFXIfZCLGMXpv5NSjkJmk2NdLpAjX6UiPTnVmZbDjmx+t
         5SuMbEIbAGIyhGU/b1boCSwFyLLcTXjygNL0Ktr3HjatwKtVmTMICurSQYtLUdX042Ts
         fpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571293; x=1792176093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4hysl45OVBhRRFcK6ukjKkbAyi3VQ7mXgaShYNjelk=;
        b=UnzOlM820kLHwfLifQubw3xt4PWN37CAShcfkTacq31jrGmYT3DIV3FCI+e19Si/X4
         5RD0Xlb1RiQCwsqNx5Y3B4ML1yZtn1GAyKQN2kfBW7bnJ1ECmmtaPeefSZt/RvEP4zm9
         wI/G7G3ZfK9tDS2m3pe3DqSbjrrfSI/JGr/a8TlLZi0Ryt9c9UyST3vBwm1mkR0dxGO2
         jTSfY3KAMendkQWwBWYYLNpU83CHln2PMvfad4zZRiQs2n3YCmkCm/GGkwdPnGYe2CuO
         YwCW3gYoDVLaIe9vKPzVRjFyUAerJ10+KSQ7D9daoaDGnR9UJWXlGWw6NQv46TOFeCf4
         B/pQ==
X-Forwarded-Encrypted: i=1; AKwUvBy55wIpo39aNfMFST0e9U1GQY0rtnaTQGYK8UHl0MmLrMOCleK7uRBXALmdO/I1OilDdiB2aaulitnKiZA=@vger.kernel.org
X-Gm-Message-State: AFuF++ldQ50VQttJYn/D7aDLxO1BEWBvOx8XuNSV5BE2/MTfu0H1bPVn
	JYdgCpfwD5oD7ARSjV7o6PRRcNq1GgYjtpVUkGWnH+sXNgRXSYIxYduP
X-Gm-Gg: AYBFou2JU7x6rWiwmt6qSIHxTmT3MjYPxx4f4qr7CQmD7nP3Ea38bLvn08RT+Fz3Yp1
	eV2cAkWje72CLTrMTu+zdx7r515c8qVJtkbBnLiFIzMUore8YjVvGUDmV/hRWldqQm0HJJ6sz52
	cKDVq44bqY1TxwE2IqM5Ew9l8a85u7WvaInhjlkDZV/DCC/8khc17SVNDziJnOqKepnsjZscZvd
	/8MfhptB5Dzsa6stcLaSrjk4mvZBCQv1jtmQKiMu/7Q2ETKbolzCgeM+ggfY1OuhQAw0cMkS07T
	JLO8d2N6ac0gnEykpHnHmJRs0TdRqS7gSSVoPBVv62xi/4OFVK3d/yFNBVQKfZ4E46u+NOCnXKn
	bVfip4SQ/iz49FPJSkgZyjk4VQttVl1Le8ICgoH0awZxJjzpbB2pZLeSTgBYyipHR5cszl1UR0p
	xh4tEHfXg/lGFF7hFF/NH1wXQzcMjVCMhlAEpyXyg+Eygdr718OyHSCSWeAkG0ut5Mg6EYFsPM1
	UHcfuyFEgkYfatgVGiOQWikvP5/Ub2wdFqaJg1Ujdmh+xAHFQfojUbDNSKHR7ZHCMu9lgh6NVwd
	itHjydND+v+2Sls9Gw==
X-Received: by 2002:a05:600c:5249:b0:4a0:1b14:e846 with SMTP id 5b1f17b1804b1-4a18e446905mr53912465e9.4.1791571293221;
        Fri, 09 Oct 2026 11:41:33 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
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
Subject: [PATCH v2 5/8] iio: adc: rzt2h: Prepare for SoCs without sample state registers
Date: Fri,  9 Oct 2026 19:41:19 +0100
Message-ID: <20261009184122.1378797-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 62120d218515..9f027d524997 100644
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
@@ -150,6 +154,9 @@ static void rzt2h_adc_stop(struct rzt2h_adc *adc)
 
 static void rzt2h_adc_set_sst(struct rzt2h_adc *adc, unsigned int ch, u8 sst)
 {
+	if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_SAMPLE_STATE))
+		return;
+
 	writeb(sst, adc->base + RZT2H_ADSSTRn(ch));
 }
 
@@ -530,7 +537,7 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_dev,
 		*val2 = 12;
 		return IIO_VAL_FRACTIONAL_LOG2;
 	case IIO_CHAN_INFO_SAMP_FREQ:
-		*val = rzt2h_adc_sst_to_freq(adc, adc->sst[chan->channel]);
+		*val = adc->chip_info->sst_to_freq(adc, adc->sst[chan->channel]);
 		return IIO_VAL_INT;
 	default:
 		return -EINVAL;
@@ -545,6 +552,8 @@ static int rzt2h_adc_write_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ: {
+		if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_SAMPLE_STATE))
+			return -EINVAL;
 		if (val <= 0)
 			return -EINVAL;
 
@@ -734,9 +743,11 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
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
@@ -767,8 +778,9 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 
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

