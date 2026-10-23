Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778373;
	b=aXW97HciY+6iQAYIFy5nNCSwbu0ANLMrXYj1t1YbTQiEFDF3wciwCrHTEOFzQwrbi74I
	 Wgoodsat7U1cv726LB/j0a7YW4HB5wWBrffzG7O5SwWoDVhsx33ZjxQCWgN913EbC4tlo
	 4YGBUI64dVduGdAhxLxBn3OyP/A1CVOwG2UHijxXpXqvSg9cCQX3YSu/4mjTMcUuCDFcO
	 HS4yD03RamL52RjbgkwcldIe2tlRD+yazE3wpjOWMr9cg77Kgml6YoNrO+Sbs1ZojqrAv
	 uAJI9/Zwv2yOzLBi6lRZhW9FVsuWThK0baCntbBHRqswTlisyxmAEhXZUSicc4OE89A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2YMg5NPi7NvaRXzD5WHLcrPWeRT8sqhBxohUakTspaw=;
	b=ctlD/hVnbcM5H59rd9Klujyb7NiasMBrtcp9+BdlEbbF1vZAGj6uuTDsIkvHuLwoWI84
	 +RAYQqBJqJZqSx9jZm+ia1rxSWZXK+xc9Gh9YqX6d8lhQBolg2/CnFnqZqEGD9WgYftql
	 AoDPzuO6ibzNKWVDs1VBVexA9UMMmXnEMzeLHdG62fwAoplI1C7JsD+WG5Q5Wb+sIhe86
	 XYKPFkEqzPmiat1QmaDdKg1g1wbMjgJ9UctT6llMUBES8ShQG207Et46/2MgsQNLxRdGE
	 gtrBbMBv7v/KgsxlHaq1wnxW7ZMFb8ftERhMhAypwdyfa3ErT88ZYJV9/bFzVF8TrkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="jH/5CyJx";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A29860A263C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A29860A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jH/5CyJx
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20c923847so9664105e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778372; x=1793383172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YMg5NPi7NvaRXzD5WHLcrPWeRT8sqhBxohUakTspaw=;
        b=jH/5CyJxasgvY+0HhkFIIm2P0gmCd6I7Z8tSrHqM2RBWOyvZtww24dtS7KOA51Ut4N
         KaMcTeRuN5SCws1rkHUNAR38QfSLU95B5dSwlw0gxbtXVyW9brsPeEgitDa1uCzyRdsh
         cKX/O8m+QaDZt5xDYBrSJIk3kbOFB9+mVQBJYabTGfvEEb0k7QoKTdXhm1LLC1TOb0SF
         +CvNSLxZxDI2WbqiERTyVu0iPklbrkUApbFf+h93/ynY9z4Ee7J4hTFgmlCnwcA8wNjV
         KZVbRaKp56L9klE+sl0egFwENzL1scaYTKFtwumDEqh+aAIsAUU5p0a7gftDDSuX3B0s
         TpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778372; x=1793383172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YMg5NPi7NvaRXzD5WHLcrPWeRT8sqhBxohUakTspaw=;
        b=ltKMY1tu/sDi479zEJl11DZBT/yQ2oqSyG/bfyTD9A5F7QJIK07v0I6lOoCdzal1O+
         mXjND+E54FwZT/6oAo4eSML+eJt6awA0splNyST4TwZlkncj2PFn+deTrna068XZx5yC
         MV7PvcQ1Nx/D5uVeo7x3MKvbIIOU6+zBgZz68QeFAB4a13vfBuEcMwB/5dwkzu26nbqC
         DJvxQI3mI9XOvY34t/RUA5nh9G74i7wtXchg2mYUPoEKMqHnnyQd9koEqdCdpwvePngN
         SYkkby1JDTYZQ23WHhJ9kC46dk5ZwerSwJqUv8F1jTpIDNPoazqGMcHDgOKL5AXpsH03
         LqUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtJgaxg6pCxHCWpD0NgVYoiso+tD8p2PSbqA2EnlczmjFf/ZVanK2kws/MvDn9xcUFstdprxOLNXtpUIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNKEewRDGQVg8kUfkiIuDdCd210ns73JZqaZwWMCTIdWRFFZ6m
	a8EYUD58v3ftvD7Oqr1XtRFCrc+aJkUXC/XtBPNRNisAOYd8yRj7u2ra
X-Gm-Gg: AYBFou18eMVH9l6OkRe0uWqk0RssrEIFn0yElzPKIoBdqYaLrYuL+mcLExIxZDV8Yz9
	/9XOmhWbft8rewSVz9PR6ugtIi7lJskDb2KQG700CM9H+teLHMLx9Xp3xdpALn6hFkM6IgIMNm5
	+SCybeuSfQ8KErwwiHQbJgvgRibFiuExEuXz0hawN9tBFuFhIPBZrDQcBOes8pnGDE41X/9MUII
	K4IhzpCBped6omXyMdA8nNhU9egiEviP2Iq9B5XJHmvluryyvpAFQoUAH4XjtRWZ9WfNt7P76RT
	NGXNI4ZXppTg7KJ30DCX0oynbpSlaY7rueMbnZzLPy/52dmdh2NOMeHeGpwxgmJkLVGu52GmZEx
	sB7tphEHWHowuEA/EQxRsToOv/YSFR16aDrXr6wpTmPMCeWyoLhw5WI8yczDh6Pu/0tmJNrEpJ7
	L/vw730xJeE5HAaYTY9EM7+J+1N6i8uJ3h4jDpjLPGEuCVhczu7vG8uKMvH58S58keZDhFTIH9q
	SFiyhNLcvUw3HCtSxyGHdN7pfvJUtApAxF6p6nKyE2Iv2vE5SXRGJQQWxMRye/cNJc5gHfUWmND
	GYPB3Tjti0kuSzPU3aPmLMChfKVxjaJfsnuZxpuMzZb6p+I3NqA15dAnxTWSkbTTUOFmwkEdIJ8
	APHpzsS9uUt+On86kzQbyCkqeCeYDHEQMeWKYipSC5Gd/
X-Received: by 2002:a05:600c:4715:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a211eff69dmr54002725e9.29.1792778371771;
        Fri, 23 Oct 2026 10:59:31 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:31 -0700 (PDT)
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
Subject: [PATCH v3 7/8] iio: adc: rzt2h: Use scan type for ADC scale
Date: Fri, 23 Oct 2026 18:59:18 +0100
Message-ID: <20261023175919.160103-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the driver for RZ/V2H(P) support, where the ADC supports both
12-bit and 8-bit conversion resolutions.

Use the current IIO scan type to determine the ADC resolution when
reporting the scale instead of assuming a fixed 12-bit resolution.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- Renamed RZT2H_ADC_VREF_MV to RZT2H_ADC_VREF_mV
---
 drivers/iio/adc/rzt2h_adc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index dbe82939acc2..debd5873ed2a 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -60,6 +60,8 @@
 					 RZT2H_ADC_DMA_PERIOD_SAMPLES)
 #define RZT2H_ADC_STOP_CYCLES		2
 
+#define RZT2H_ADC_VREF_mV		1800
+
 #define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
 #define RZT2H_ADC_FEATURE_SAMPLE_STATE	BIT(1)
 
@@ -532,10 +534,18 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_dev,
 
 		return rzt2h_adc_read_single(adc, chan->channel, val);
 	}
-	case IIO_CHAN_INFO_SCALE:
-		*val = 1800;
-		*val2 = 12;
+	case IIO_CHAN_INFO_SCALE: {
+		const struct iio_scan_type *scan_type;
+
+		scan_type = iio_get_current_scan_type(indio_dev, chan);
+		if (IS_ERR(scan_type))
+			return PTR_ERR(scan_type);
+
+		*val = RZT2H_ADC_VREF_mV;
+		*val2 = scan_type->realbits;
+
 		return IIO_VAL_FRACTIONAL_LOG2;
+	}
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		*val = adc->chip_info->sst_to_freq(adc, adc->sst[chan->channel]);
 		return IIO_VAL_INT;
-- 
2.55.0

