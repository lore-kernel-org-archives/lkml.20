Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1FB383C66
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289637; cv=none; b=lS8CdZbMm4nasyeyjFgzg6hCTscf5qIMzUGkSUBKk/2YT2/d8yPR+9a6kLE+zMAiLscqnPkML89XhCm5/ofEI3nceXEAZTltNxzPjt0bSkW2tu8JngfvOKXQte7tkvMMCBX0Wc7dvA9WqP9wqr1gu6GGyWlkuISTgGH2tGomFDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289637; c=relaxed/simple;
	bh=3+cgl2lApzXM57QbowOk6GGJ+xHrzWmluYrLDPam/Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBFlu/e7HD+KmqYnlpZXCPhYLuGuTfBIZV66eYe3/7j3fg6lYeJL+k9lqQsxLQALSSIoCsNViEtR6wlM00YHqWdth1zPb5l6tYywQ+v5uX0GhnGJlLKtLYrLZkGyYPFNJmecjmpfksZVfr+djdRj+petO+/c5RS8rXASXQZRRJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq5QxBpa; arc=none smtp.client-ip=74.125.225.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq5QxBpa"
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-4843169420fso620743f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289633; x=1789894433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOdml8t4+a2r4TluaWsnQnPMm+X8XLNBiqhXtFxxsck=;
        b=fq5QxBpahrv+jiIYVzyNveZEQBLfAo2e/h8lMGtG8BFn3flSQbTQ4FPTt+qQW3Qep3
         kTxBsXb/WD8kKvA3Axlpmsrh7ueLU/1JuHh70tvKwafSDJzkdchgXiharHlZ8gopxbPb
         ZdiBTCYCEhm52ZX5/45guzUIB4O4VyvPCvMJg8PgvpKjyGXXa2pEnFRW2u87ELPo65F+
         oyJwUEkDO00hHeMrvvE8dsfoBWGc2gay5PuS/3eqyoRKwckwFs1+qnVb/W2RBJu0RfoP
         Mw8//lqS6YfI8EQWByc62MaBmKJQPt9WYlK9heZncGg+6LktLM+MuaaDWiaHOzz2dV1r
         B02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289633; x=1789894433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uOdml8t4+a2r4TluaWsnQnPMm+X8XLNBiqhXtFxxsck=;
        b=S0fmNjjGA2fS+TRhOseaE9n6H3Sr4Vq2rLYUztNjQwOpiLbMYgb3eMzexEqfOd60ow
         crnxGpEfQS+/Wop4pY27mcidoKAAi4ya8Hy8QBRSHrXNbtkniFbVHPCsZEgb976U/sQc
         pwOtVwd9eyDDORtx+nYMqc4i8cMvycf3wC5LmuUzEzVJYufQZSwN+KA781FbCgrUowtB
         fwJED6nSo82DsYGbc5SFafeTAOMO5CqPHTyZXj9S0d1SBKz7Mk0bNhoyKZ781UKrXe9Q
         CDi/Fm+NlaFqoRdZc9m7BI3CPhybuPQUpPnoffOxSJs+RZSzM03o0aK/uyNjQP1vGeHo
         msxw==
X-Forwarded-Encrypted: i=1; AKwUvBx6cO2P4PkQ7bH5uqjX7WSw6374F2iWnC6+ogjaWaqjcfReJ2Cq7wdNAJJWHG8D+rEgjgCQRO5uE9YUVfA=@vger.kernel.org
X-Gm-Message-State: AFuF++krL9YUf3Fk/rl2x5p5bhIaMhFIzwueTjRuMH+MXnIA57FS4RoA
	YEx1/8B5EZo4I9yhIHj1JLc3iZzQKmLO9NcbJO/Em2UipEe1WVSducyI
X-Gm-Gg: AYBFou0bJhmt2973Cn/cz7PFIFF+AQqwNGEIWOFjZIqKBvv83fbgYP5TXZuRWMiKaAl
	0o+08cGb7V92domc6T85J83m1TmKilsJc85zgzT1tnyA+/t5km2C1URjXHzodEzGPQ6WLt4WLMm
	DFjc4QspDyh9sFEzdfnC4XLdN3dGHe90jRfGxHhEtzjhIa66Pfmpf1mlInqTz1n4RalrQupSMo6
	UeQ4rZMXOj++DD83Xl0d7CGJDzatoMUAk6UfTZGVX6mDFrpoP0KM21DfUQMfjJjpztt6lQxGcOY
	nMboNdQXvzNL7uZKdnhJSgjn8PH1PRiM50Ik5lrCcdEzbKlIBIwn7/0Sb8Ti7bsHigz0KBS+EuL
	k1io6OuagGZ3fb6nzExTKEWSVbSh8R1fysI+oL3BezYuZu4Ggm0HN+5UNz1iAvjCx+ez5uCmZ38
	A3A89mcSu4NpoxbJkUPV2nhEUJgSetqQDanVyNAel67g/a73ZOIb8vN5n5rMGZiGCUDXl4dyFjf
	RAliGjBoTqXgkQEyZQ=
X-Received: by 2002:a05:6000:2084:b0:486:f455:403 with SMTP id ffacd0b85a97d-486f455045emr9034370f8f.57.1789289633058;
        Sun, 13 Sep 2026 01:53:53 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm18228489f8f.9.2026.09.13.01.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:53:52 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH v2 1/6] iio: accel: adis16201: add SPI device ID table
Date: Sun, 13 Sep 2026 13:53:02 +0500
Message-ID: <20260913085307.13846-2-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913085307.13846-1-shehryar.amd@gmail.com>
References: <20260913085307.13846-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spi_device_id table for ADIS16201. Replace MODULE_ALIAS()
with MODULE_DEVICE_TABLE() which automatically generates the same
module alias.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/adis16201.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index ba0f97944..1e76a3560 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -288,16 +288,23 @@ static int adis16201_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct spi_device_id adis16201_ids[] = {
+	{ .name = "adis16201", 0 },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(spi, adis16201_ids);
+
 static struct spi_driver adis16201_driver = {
 	.driver = {
 		.name = "adis16201",
 	},
 	.probe = adis16201_probe,
+	.id_table = adis16201_ids,
 };
 module_spi_driver(adis16201_driver);
 
 MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16201 Dual-Axis Digital Inclinometer and Accelerometer");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("spi:adis16201");
 MODULE_IMPORT_NS("IIO_ADISLIB");
-- 
2.43.0

