Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49290511E7B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571306; cv=none; b=KtXi/fSFVU3AK7fG/PXoz8+pdeDzn0znYyBTtPR4npYG0zL5keE1pKJtZq9fNuJ4FP8ysXM8TcZRJhx5lefIEL1zs4TM/jqd6/Km3OgevtGYqOYnvbf9kn0rC1KsHtxNycmoWa9wQZiD9WRVpU9xj89j+KYtGa3P2SIjZBFvNY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571306; c=relaxed/simple;
	bh=zWXMbUVBcviqxThu0500QfWeDzEk9IakSPzJWVquazU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lONfxxpUVUXCXZPonbZuhG8hPQOw64sCmqLn35xXZBXHe62UY4n0ZapnogvaVeDX3QW7KWXmmqeoyQPqfBEb55OnXRp0LEUqw8lgcSHBGGfVrPi3HGdrocPg+C+FxRxdAWg7iZV9GM1G8usEPQidd88/J4hJ3MSepvijWnWVxPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFwiRwzk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFwiRwzk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso1486755f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571295; x=1792176095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fc2TG1DWHDcQDJr8eEX9rjGsX23Y6ernBWy7IME0Who=;
        b=sFwiRwzkHn/tGbf+4cq9c/jWSzQlNOdB+X7Or4RtzvGWX8R/gBwyasJFF7ZRiyfwGS
         1hlStSKxYNP2AnwKR/+wTo4B6+LgAfwXydegopnCgz2LvNUz0ON+71Mzg2K5A0gO2bfu
         tfKDyq8Wh+R/SSndaZSAFBUQEUZnA6xuB4wWZJDGAv14m5Mu3h9YKza3pIpL5XvLR16s
         uHZl6zYeHRTfimFHQV6wQf7XRvGFAB2VKhpheGsEnbzv3MC73+qqdIUWKYvjmn21AK9D
         twgQsveHitrllGmodd/NHHJtYVwFpFmIo8GTyyo5Nq3AymVVQHczVACu4O5D5xyfIDOn
         VQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571295; x=1792176095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fc2TG1DWHDcQDJr8eEX9rjGsX23Y6ernBWy7IME0Who=;
        b=cEVnyMhM5ZMlmHWYRP+fnQWu34qfhl6RaJg6/JN9H/PyqGvHL/iiR0wjZvdbfyYJph
         y3VTlGJ5kqBxqtXKdUvASU9u5KZHwMgaJ/MpHzQ48+Ht7k1MUcTnVRnWloLNDCXQSoze
         a3Hqa0iP402yAl0VA+W1D1UYK46LNrrBbc4TDzj8IisM3ZE8E9ifiEu/Zkm6UjugJvxS
         DTpdtdDvqQm5fU6iSPO5hgISbyKkRGl0452xrjAF5B9eoAPJ6i0R3ODjaL6nGkqNQqRa
         lAjJHXTwKN8AZboHXat7WuO+9wiLnOKUJiFnQdVZ+y2NX+93iNfNs126C/1H8QMwlWtY
         MKyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKjGomAMp674VajVf39dxl5cUUGhfdOB5ecIUCTukhDUW0cnaPQeOcB48p8mWJCNsnTl7r+4ATcamibhA=@vger.kernel.org
X-Gm-Message-State: AFuF++nzdZxlY33Gftsc03ksrR3ezc9lHvP1vRb1pk4RJVs0jh8aY6rP
	JXfU9AhfR0/aRLiAwk/vLdjEsqHLv7FMVAzBA81VXwPbbn4EKiRrpgG6
X-Gm-Gg: AYBFou3BiH2qCi/sD26NAQSKaWMQq0mx+ABRxFtQL7uvqOnTWnaiYcptyz1610Nhasj
	cOetmGys+CSUpNvrMHPyxdh7fHO+9PtuUqyjmpH45RihZckXKUdyafIAUhvrPWdPCh5NXJ3DKeX
	iZUpyJ07CGeOJai6g4QoWmN3Yh5IgdZ9UspWeqsXzhqGZD+fiWe44VwmxJl1N29jUXSI7Z0HihT
	oX5exh5AudaEM3ADZJF/NhtEHbs87lsHSwd5iR4lMG/5F5q6SKqgyHjWwztU3jDeS2JQ4JUIiUo
	p4ylBBBIMVfiGYkYHeYyuLkpjE+a2YZMdIHP+4txK5fOYVwVjiMajycIwuN+gyLwRy56QzGJ237
	GNG6VVyqyv+zEuBrhbeFOuMHqTecCi756wDmo/bQJCrZWHKSSCrvxBc3I7dxpMNZizRbZeIPRxd
	9suM6kIsftjtuONOpbG0jBXTQLcg+C///pXsFJaujUZ3I/beqIMTgAhchCoFCfRLct8ElKWV3c5
	3XAMqOWfC+H9qN1yV0+I1/PeHH27KHCoMrZTDsS06grwc0VDl6lcIS8kiHVQIgmu/vXbD2QrlCs
	PttLxDTDO4TeGRSMsA==
X-Received: by 2002:a05:600c:3c89:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a18e49105cmr44372635e9.7.1791571294838;
        Fri, 09 Oct 2026 11:41:34 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:34 -0700 (PDT)
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
Subject: [PATCH v2 7/8] iio: adc: rzt2h: Use scan type for ADC scale
Date: Fri,  9 Oct 2026 19:41:21 +0100
Message-ID: <20261009184122.1378797-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the driver for RZ/V2H(P) support, where the ADC supports both
12-bit and 8-bit conversion resolutions.

Use the current IIO scan type to determine the ADC resolution when
reporting the scale instead of assuming a fixed 12-bit resolution.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Renamed RZT2H_ADC_VREF_MV to RZT2H_ADC_VREF_mV
---
 drivers/iio/adc/rzt2h_adc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 041566f3059d..0703c2025e3f 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -60,6 +60,8 @@
 					 RZT2H_ADC_DMA_PERIOD_SAMPLES)
 #define RZT2H_ADC_STOP_CYCLES		2
 
+#define RZT2H_ADC_VREF_mV		1800
+
 #define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
 #define RZT2H_ADC_FEATURE_SAMPLE_STATE	BIT(1)
 
@@ -533,10 +535,18 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_dev,
 
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

