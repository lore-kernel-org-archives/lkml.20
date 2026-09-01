Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7CE3845DC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259377; cv=none; b=g3xEvRZfza1FbY+9IQeo0Nk6w1a3VTHfWACoxXMLsupz2xRa1lkzJgE3vcdpVVI1Yy411nzJlPNzkV00Xa6037X8BxDR/u0LEm2A/U4db6c4RYDR42qw5dbwCV0mqZ4o9hr7rTBNU01d7kUHKzaIx3Gq15AvU6gaEK2nFnW3IXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259377; c=relaxed/simple;
	bh=xqoGEMIQVT1d3A9wTX3gMVQnA4z7jnDXvURpr+qYg4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OsPec9iUh0xrpcbo5jQSPsn2/Qfl3lqBTv2LngO/b/aVPFhygkwrGw1qJwlD6l4zgbZdYQRLu344bMEHdrbm/H/HeywWYeng1nq+hJcjBHGatXjL1MoBKtPFYVW7V8RjJNSLzRDk9YVVnI+KCHckgpltQMBmcQz4lktvwUsnyRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHeEs1S5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHeEs1S5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so49055875e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788259374; x=1788864174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uu7ywtYgst/k9O0Fu+h9ViYiyjKPBkfjcMSBZusirJA=;
        b=WHeEs1S53BFKxj+IawgMhOw6aLTzVHi6qtpq99VYsDWMTqru/NV+sLbpSg81QnzAqV
         7jg1iSHyuCSWZRz87MqQxpBBxe8GEDR7s0DGh2QqrTxAPHZDOwW3xT9lAetg8xFxRL4M
         7hxM8HGrvHudE2b69WwPRbvgalSWkWJAy7uvjZa9bGmrge3W8iajtUaLrZYoBByCiR1V
         jCml8Plp39P3EfN+kXQenCDkxiHvckgNmnHR64zmQT2+Ppaf476L66SKZS64LTokhrYV
         FDOeEdosHiIlnGTmQunumgvh3r3Q/qZNcQWEFlgYUrK63+N305c48ODAn8HySTbRoq+z
         7S+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788259374; x=1788864174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uu7ywtYgst/k9O0Fu+h9ViYiyjKPBkfjcMSBZusirJA=;
        b=AaprWfj/F2HV75zpPUTit7/hptK0wMImUVl+qYSCeoSP/m+FC3eaIknUUCz5CBrDif
         rvpw1sMxXOrjooFGgpDwoVV59Y+cLlZv9kpfCKt/bWXYGU+0qO6MaaptanV77x9988ad
         BbWvAbI55//wxAwpNoCDppy6iEh8wFk8K6+kK6DUQxi6rQoQCRsemJ5ud1u8bPGlo0ws
         MdQM1/EhQQkOUbsGdl8/V2TC9QM3qutWio/buzyutwqpAZEbD0hglCGas2+cUpDG30Rp
         tYb24Qu9oqwIXgHktXUTxeiDev+NYoU+cKarD7AKkndcW5hf6b/oE7IIb+tqxRInpr9F
         3O2A==
X-Forwarded-Encrypted: i=1; AHgh+Rrq7DXZLRf28NosshY/7S9RrwiI+F2aolLt+DE0qMAd7IOC8bAGXEdaTQisYXXE/KVgyLN/mHZw/aIUSpo=@vger.kernel.org
X-Gm-Message-State: AFuF++khDi5GQ2pX5ybew2GiTrICf2SWKUkBAxSGuHb0WMcki6MUInaA
	2KPK1XGPo7LyMAvCDbG+hLdOmh88JvOaTBEbn22iYd+WaqlXLPz3rbUt
X-Gm-Gg: AR+sD106xR0De6URx5wUYUVt8h245cO8cfdbEHTofEoPDywjVga2HSYnErhK6ym2DRF
	5GSmHSB37AaZV5x/mR6+v3p2+mq6CymAMnb2CMjbPidOR32/iLLqsyivK5TVTC4znMgFk1jlYhh
	K5azlpyuxKWCT+ISnLbxSm/tErOhMWGc9yyMT2HXeLtOTcgRlen3FeJg0IsOaViyV0tsM03Rc4L
	9Pxce/UgXDiJ7+6Lw2RAJZtmcHnRI4WnnOWBQwadISH0DUfEUDqORLGiSoqwEDiZ6ocSV/cUvMg
	lg4GIzTJU28CGlIMFImhd3cceNP+q0yKCakVL+yyqIw7tqf2Yj7h6gv8XwRTxUCtlRkeJczHXfA
	f9UQMXNrtj9ywNnp/BJe7BolRbDvb27w5WXyrcxwMx477UM6S/KGcrp8kDy6pVs8OdIMwBlDq3X
	qCdYUchvgoy1yneHKCPrJ7ELkyCTf98diTpIid7hPiHiZ4E03U5R6FVTaMky6oszSmK9c0ew7U5
	w==
X-Received: by 2002:a05:600c:3f19:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49cdc43d444mr144963275e9.6.1788259374119;
        Tue, 01 Sep 2026 03:42:54 -0700 (PDT)
Received: from localhost.localdomain ([196.235.159.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9267c369sm238972235e9.3.2026.09.01.03.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:42:53 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Esteban Blanc <eblanc@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH v4] iio: adc: ad4030: fix invalid oversampling_ratio validation
Date: Tue,  1 Sep 2026 11:42:43 +0100
Message-ID: <20260901104243.48732-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ad4030_set_avg_frame_len(), the logarithm is calculated before input
validation. Passing zero or negative values leads to an undefined result
from ilog2().

Validate that the input is strictly positive prior to computing its
logarithm to ensure only valid values are processed.

Fixes: 949abd1ca5a4 ("iio: adc: ad4030: add averaging support")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Changes in v4:
  - Reordered local variables to enforce strict reversed Christmas tree layout
  (per Andy Shevchenko).
  - Rephrased commit log in plain English without C-specific terms
  (per Andy Shevchenko).
  - Converted AI assistance note into a formal Assisted-by tag
  (per Andy Shevchenko).

Changes in v3:
  - Dropped the !is_power_of_2() check to preserve standard IIO attribute
   rounding behavior, per feedback from David Lechner and Jonathan Cameron.

Changes in v2:
  - Added note stating the issue was identified with assistance from
  Claude AI and verified manually.
  - Removed initialization of avg_log2 at declaration.

 drivers/iio/adc/ad4030.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad4030.c b/drivers/iio/adc/ad4030.c
index 9c5f19321e3b..17b0ca7f1cce 100644
--- a/drivers/iio/adc/ad4030.c
+++ b/drivers/iio/adc/ad4030.c
@@ -746,14 +746,16 @@ static int ad4030_set_chan_calibbias(struct iio_dev *indio_dev,
 static int ad4030_set_avg_frame_len(struct iio_dev *dev, int avg_val)
 {
 	struct ad4030_state *st = iio_priv(dev);
-	unsigned int avg_log2 = ilog2(avg_val);
 	unsigned int last_avg_idx = ARRAY_SIZE(ad4030_average_modes) - 1;
+	unsigned int avg_log2;
 	int freq_hz;
 	int ret;
 
-	if (avg_val < 0 || avg_val > ad4030_average_modes[last_avg_idx])
+	if (avg_val <= 0 || avg_val > ad4030_average_modes[last_avg_idx])
 		return -EINVAL;
 
+	avg_log2 = ilog2(avg_val);
+
 	if (st->offload_trigger) {
 		/*
 		 * The sample averaging and sampling frequency configurations
-- 
2.43.0

