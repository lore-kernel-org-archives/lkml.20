Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE59C524AE6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685778; cv=none; b=uwwZsi7ijk3XLpQfDujsK4pdl1euomR90XM4Onl9V7VdTivjuQI/HP6nqsFZorYy6gV0S4lt4soyoKFHISNrR9pWb4Fkb+KTED0TSKMk0r5DPJackixTFdjHmpFUZs7Fz9Jx/6N4+a2Nzuw3zvERkE2xqvzprx4784oM7d1Bci8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685778; c=relaxed/simple;
	bh=N/Fg0ckEM7Ej/EFsFzrgFeUexMpnCOX5K4Eclxi3jsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVnj/BPxNJIfWQWcVS5VTkcWPCA4bRieuId6RST9TnCLEXa301b7DshYgBBCCGoIaYHmS5/tinwfoGRJh2F1hO0DNGNW3mrn6pqKxItRuMUYl75BCke6Ob9+xoSxwWgyIHIdE+vVBZxsMSJBAQedrUOw/imOVHarMXAdPu8+cGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKG+/2AP; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKG+/2AP"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f2baso1056744f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685774; x=1791290574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CklJvYA4bHZqCaFDmRqhZRi0YHZtTPoVpEjj+VZ/lJo=;
        b=dKG+/2APWwKALQYX/7+jVAtEalR02YF9k4bbYEiPRcEQBrCpPW33q2qDEyi9wpKRWz
         b2CRdW7kqUMpV11zZY1rrKmN0gU3YWHG1irgvES0xD2KlgYAcBZnmIdoVbUl+H5fr7aJ
         Yh0HyTWIIKh4ytrO88wfukb3KMl8gGp2e0pBfts+2yDCbv7VVVKOutmOcy2Sv+s8wfys
         m67mf92UvFgcHwlMT07TtvrdQDq1NYAf2uzpXOqGJ9Fhoe+sng67UAuY4GzSrEsCYLIX
         zUSqTBD5jlzAN2fCcbCoi3MRs1SjpKok66O/oUEdXSrbvkxGOLcrSJxojUToahmU6psB
         A5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685774; x=1791290574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CklJvYA4bHZqCaFDmRqhZRi0YHZtTPoVpEjj+VZ/lJo=;
        b=yMd3M8O/SldtshsCWWW9ELa+jCRYK5NuPZemeDvqqhNDI7bVkVgHU4gfVEvSZK5S/y
         bCipB1eJkVnxUEGb7ZI2o0ZmEA8R/mo7t6qyajq6zL2n+d0jvRwQM06hC3f2CDAMIRtr
         JWbVBRdWkv7y7nxddLJevDr6uy0OXyxzYbAhKyXgmM1H80hit7Ek8V2ybpfOAuNhlnjr
         DyG99TvwB0CPPmqE2WuUCudeVq+Q9stJ6ClZwS+t7S+cU7ApfOv4RwFGFHA/3kuJ95CR
         HCy7nL29rsFR7OwIgfcr90q3fg4smin9JUYysWudYQD4YyycpKpo5GMNRTYWJUlNStag
         uIZQ==
X-Forwarded-Encrypted: i=1; AKwUvBycGU9PD5aJz+1O7T6W4IZza5id/ywaZkzUZyVphbek9u2hD4VYUb/kiacRDAG7w5KMvwRdX/PPjmT+BI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRaAl/trPnCNOeLre7/LuTtOQE5ADA3c4aNTCRMeQ0DtMdcUdY
	Nlx9xAJX981ryrMNSe70TcQJkJZBMCOwdNEn/KyZ9ZnImhcm15oryXAQ
X-Gm-Gg: AYBFou3X1YOojl9KcLQs+OcnDi/OeF06va4nsryjOil9fQvPcn6f7IV1pmaFAf917Oh
	pgmByw2QJf6/NdH1q1H8YkCPBKWbF3H6qKCAN3EmmWvlM0p7x1dAGeicES2SeRZA79mStRPYxIF
	xCl0VD5Rfqms1A2t07EFtcHu8aOvNvN+KbQEWPftB7TTU6twPryEt5FCQD4INYoeeHjmCfsR0ro
	4Oal04QR5C2xKA8TqBLCYJXzDa5spfDgj7e4LS29emM5L1vmOLrsgy/YDpPG0YkKSBZIDy77OTU
	QHwvrGFDRfjYCaelhO5+6KbYU2MSWzd6lk2N+j6rW97MYqsziaA+tueOdXTtV9CsyFBoHzC/WaS
	3OxKUVgL31xoCZWPVwe1Ky9WonfzWsOppjIrnAx317mGah07IYdxC+v40FZ6I0lUB04fum/0ygr
	aSLyuxidtxKm9uLaQfvy1fE4UEJGNIcF03Dqa3XhejGWGghqxnIZkI2jyGDP6LFiESaACHm9lzq
	cCdbM6WqvkaQnzPruuig9hFs67JiTfF5mT5eYl/3C9ddEXDDuT1UCaUgADkUgFZGK3pDARv0IZn
	lD4iNcyejfio+eF6UQ==
X-Received: by 2002:a05:6000:2f83:b0:487:27f9:843 with SMTP id ffacd0b85a97d-4887172a612mr29919339f8f.56.1790685773839;
        Tue, 29 Sep 2026 05:42:53 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm4436630f8f.11.2026.09.29.05.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:42:53 -0700 (PDT)
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
	Magnus Damm <magnus.damm@gmail.com>,
	linux-iio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/8] iio: adc: rzt2h: Wait for the analog part to stop after a forced stop
Date: Tue, 29 Sep 2026 13:42:42 +0100
Message-ID: <20260929124248.237032-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/iio/adc/rzt2h_adc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 8ba7b0fde8a1..d53888730f00 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kthread.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -58,6 +59,7 @@
 #define RZT2H_ADC_DMA_BUFFER_SIZE	(RZT2H_ADC_DMA_BUFFER_SAMPLES * \
 					 RZT2H_ADC_MAX_CHANNELS * \
 					 RZT2H_ADC_CHANNEL_BYTES)
+#define RZT2H_ADC_STOP_CYCLES		2
 
 struct rzt2h_adc_dma {
 	struct dma_chan *chan;
@@ -124,6 +126,13 @@ static void rzt2h_adc_stop(struct rzt2h_adc *adc)
 	reg &= ~(RZT2H_ADCSR_ADIE_MASK | RZT2H_ADCSR_ADST_MASK);
 
 	writew(reg, adc->base + RZT2H_ADCSR_REG);
+
+	/*
+	 * When a conversion is forcibly stopped, the analog part of the A/D
+	 * converter takes up to 2 ADCLK cycles to stop operating.
+	 */
+	ndelay(DIV_ROUND_UP_ULL((u64)RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC,
+				adc->adclk_rate));
 }
 
 static void rzt2h_adc_set_sst(struct rzt2h_adc *adc, unsigned int ch, u8 sst)
-- 
2.55.0

