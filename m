Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A150AC0D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571299; cv=none; b=Zs5KXJRM5GLIBjHxw8b9OBLUBroVZ6f3thNLOwPCbM5EKyoqUVQSTEW9jK8lnRTFAZkWAQ19F3GZGrlqUFaIjU9DpPwGh4xBrjgE3+CItjiOec/ha62FcTAQUY/2yaPmQMqRTUcP0Opr4uwDCaEiIspGLyTxEFUHP2rI7nnThdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571299; c=relaxed/simple;
	bh=X7VpOgMu1Y5jKPx40+Ypu2wTVKETwc5U/eJ7C7lnxyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNp7YKQ63dcb0EMlv4Vw7/t/DONX4s9gCG9UWvL1P2gL/aOBhzKrSo6aX7hdXLrOuvMTSnh8z3egsrNNKXRPyo2yX4dusV7sKwT00GtLaInpVl+vNY4Fx7ADFrVw5lhT8F32/3OjlEopqW7NqOzAd/ziSnYi5yatib2J3TZSazw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjFH+ozE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjFH+ozE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso1226205e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571291; x=1792176091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxWSpxCZJ1iKjLEhOrBy/GRrfeHUzPGW6dWhrGGOwL0=;
        b=ZjFH+ozE8HftfFTOn6YzzaTRqB9Yv9xLyCDpLdfy3xHfkZlTjbIa7IRro8v6ec7Xzt
         lnl4lL7LDWbloSAoKZgurN5zUawYdxj9eQEMGnEOlXQEQk8VnnLPlFZi+NzkRO2ro3CB
         lhoUqG2iYDMMT6MG+K8FpEZDYYI7dV+tm2RFStPrpzuPLtUtJfVXMWIwVrvwaguAoD7N
         wnB/pInjV6Y2intMMvC5vHaJ5cJgz/BS+pBVR1hgVpICPjAFR/ny4V9sxo4+G3v3sMOq
         eS46rGcMYL8E863RqLJdTg08aKd6GuDWo/pN1jtkhZNkqg4ialrJOHw4Mmg1QV4z2qwi
         unbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571291; x=1792176091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IxWSpxCZJ1iKjLEhOrBy/GRrfeHUzPGW6dWhrGGOwL0=;
        b=kwWudNYTXQ7eTwb9+LKXAawB0xKRGhBVhmyGAucWVYIunUikzltBdihvMLq0lLx+Zc
         KUjC6Y2aVPTW67zNxXlzDhXpfSg5fxQca0Pt31Q6agDWxp4prMilxOpYKmv8XV6K1Zlj
         CFGIk3vjNT3YTXVZeT0JDvsscOsDXagtQQ6NC2zjTity4hcAqu6r4xlVKqqkpGHbY0wX
         kB5U45Ntf6veqjQDjulJ2BAu4cvS5CfB6wKZapYKwcw1ediMkl3tNv5hJz6L4FVoRW2N
         qN2MnrpnSvho6vIM9E2lMGXLlzQxZUDL694Igr2/xzzfo9aogo04SfygKSI1q7xVCEX0
         QB5A==
X-Forwarded-Encrypted: i=1; AKwUvBwamHvERrMbpq0KTUnV2LW+v0If4mPJVk6ok58OMgRFD3dqJaxh7PWuq4kIwi4e76rZwcM+BhF/RIFPOd0=@vger.kernel.org
X-Gm-Message-State: AFuF++kbFm0eHi4RVy3T9FCXMjqM8C9iWdMQqCdiX9xCj4uzjml9taFq
	oIVxhjcTiFYjQUavzVqakCgPArF96vuJ8UVzBdnV04bHU1z0S8+rP5jW
X-Gm-Gg: AYBFou3aRxMEjo822TdkmVDxwIiYalDuxbsUxFfEFXyh1FZAjT+PQ9d16dfhhxz4eBh
	9E6Zg5L5jG0VPLb4YGNNkcC/8ifqOyzx+BpMZu/LQm1/4pDy3zC/fZB4rG/IlTev9U2nf4D9lce
	ZxHr8OKQ/QyfrK0rUqYbcypHyNP2xpnIEjk/95Unxys3ki3M66Cj6zt1/F+JpJ1ynfA9JVbxj95
	nz2JAbe5z8tdvFuEoQhR3QhnEuCI6qMCH3JeJNOaQgKgpNjnvf170jA7IsX2NPkdIwy/3aijJHN
	YBYPj68MLLk689WsixMT82ZXtpSgMDzR4vmpw+JQTVHWROyiGhbAPWWfS6gigSVEJrQmij8i4Ta
	uRfBUAxxggTKC/z4anM1DCi5KrSKRj6BKbJlmPbmZSGqwqGA74b5fJTVtxbbQDAZ6+dUgEc2TDW
	DZxTbLoRyoc2nwyPUA2rU3MHjDMO80rJduXzRZmk0Kvv1rJXJzTqnB/OfJAZ/NApz+DBRZ285fe
	LqkL7kFZbMZwtkDcdWWuq1xHjMAWyob92vJBkuZiv4gY1JH9rItWVkmoc+9CVRXYvD9oGrgGoVr
	b0429YdP5relYptXPA==
X-Received: by 2002:a05:600c:19cf:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a18e4a988dmr50455645e9.13.1791571291106;
        Fri, 09 Oct 2026 11:41:31 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:30 -0700 (PDT)
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
Subject: [PATCH v2 2/8] iio: adc: rzt2h: Wait for the analog part to stop after a forced stop
Date: Fri,  9 Oct 2026 19:41:16 +0100
Message-ID: <20261009184122.1378797-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

When ADCSR.ADST is cleared to forcibly stop a conversion, the analog part
of the A/D converter can take up to 2 ADCLK cycles to stop operating.

Wait for the write to ADCSR to complete and allow the analog part to stop
before reconfiguring or restarting the converter.

Fixes: fc3b97dd71ab ("iio: adc: add RZ/T2H / RZ/N2H ADC driver")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped using DIV_ROUND_UP_ULL to DIV_ROUND_UP
- Included time64.h
---
 drivers/iio/adc/rzt2h_adc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 8ba7b0fde8a1..a46726b054b3 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -15,10 +15,12 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kthread.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/time64.h>
 
 #define RZT2H_ADCSR_REG			0x00
 #define RZT2H_ADCSR_ADIE_MASK		BIT(12)
@@ -58,6 +60,7 @@
 #define RZT2H_ADC_DMA_BUFFER_SIZE	(RZT2H_ADC_DMA_BUFFER_SAMPLES * \
 					 RZT2H_ADC_MAX_CHANNELS * \
 					 RZT2H_ADC_CHANNEL_BYTES)
+#define RZT2H_ADC_STOP_CYCLES		2
 
 struct rzt2h_adc_dma {
 	struct dma_chan *chan;
@@ -124,6 +127,16 @@ static void rzt2h_adc_stop(struct rzt2h_adc *adc)
 	reg &= ~(RZT2H_ADCSR_ADIE_MASK | RZT2H_ADCSR_ADST_MASK);
 
 	writew(reg, adc->base + RZT2H_ADCSR_REG);
+
+	/*
+	 * When a conversion is forcibly stopped, the analog part of the A/D
+	 * converter takes up to 2 ADCLK cycles to stop operating. Read back
+	 * ADCSR to make sure the write has reached the hardware before
+	 * starting the delay.
+	 */
+	readw(adc->base + RZT2H_ADCSR_REG);
+	ndelay(DIV_ROUND_UP(RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC,
+			    adc->adclk_rate));
 }
 
 static void rzt2h_adc_set_sst(struct rzt2h_adc *adc, unsigned int ch, u8 sst)
-- 
2.55.0

