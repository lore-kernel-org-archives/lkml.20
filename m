Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE9B368D51
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538510; cv=none; b=eDgeQIMzQtcpn3ox7ckcUpTLh8pGdDONnc1u1Ug/pkZZP5gEYAKmjCHqW2uDoq/7f+6aWkTgydf/RfV5LB+CtLKUzejp/LN8CvZkF23hve+Nm5t9LtkUswEHnUKrqoUCqE3CyDUZ7uGy24SUFpPXJ3K9t6kgUrkTKyXwbrc/TVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538510; c=relaxed/simple;
	bh=jdjAPSPLuyxRLZ1jAdbxmzWn5IkgNSpN8s2QXS4iXI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcRSzcK74C7ttxRbuS97S0HW5C5rwXJI9APO51PjnCzP1RJnLZ10sWWOGy7Fm0nKy3l/NMA4hD5GKyZO2kRBS5ttEMgZgHAfPFZyAcMND4n4SQu5qhWlgK8JWDDwRTFa05dhoJCDRO65KOk5uUTeTc7vSQ5+b+By5x1902NwkqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7ED/rEN; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7ED/rEN"
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-6a3900cb2b5so2284567eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789538507; x=1790143307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlprtAOoVlPqxqtboFIENF5edZTisK8lwKsAslAoF7w=;
        b=l7ED/rENgmRd6+SwgGaIsKLlLtDGdoNOmYzCqsL3Cj0274He1L/cND0s+TXGfa/Mte
         JMrA2cxaPE2LIzxFGprgskkSquDvc5TxvDKAJG+ohWeiOghLC+Z5ndwgTZI5wVDIDQbn
         mWK51pwo112zSLVaxBgsuE0UFLXcjt2VQtO2saLeBXFxhSZEkAYDjHQAoW7oHetIZm7x
         aJIaeQTKWAJiFgbnzqXIz22kzXqyBzFWUePC+HQi9Y5qGwG9wKZNosi2shYtw3HJagDA
         Ix2umLt4dy9ekPoUGLz8z6ZC5bvMNWbhRZSNQoQttHx9uA4x3JWgvVR0OJ0yXqEShS73
         wFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538507; x=1790143307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xlprtAOoVlPqxqtboFIENF5edZTisK8lwKsAslAoF7w=;
        b=lk39oypL4kZHuis3VfkDfyAxnvP2qFF7J8KkXSf4Pk3MngZ5FXozHshG7Epl+XYTUY
         UdX5J7YP5ka74c3/s4OkCk0Pm2cbksIaHr0IZP1PbTqLMZ7+cq3ZCxGCcFUB4vj0kBze
         lvLkcexJ/0RQL08tOxBDMsayD5c2PTKBSHTUmQR++RsB9rw8SnweKU+Lrkzut7qTuxNP
         +I7gl4eHEKJTcHMGY6xEsLwu0xePxXW8E/JzBkikM9qi40M8MrFj1G+v94XJzYtSPM3e
         iIRycLx03cEx4COGEEAV1fHQLnBcMnmix4TcrmkOuGWNDyQTG9SBJ8bemIgtP2uTSvIR
         tjng==
X-Forwarded-Encrypted: i=1; AKwUvBxvWye1fuaep4EUW9NuAyuVA5AkD9pxM818/2rmi/6Obb9J86ToYN4QhHNoaBCH02c0UCO185UH5D9wOss=@vger.kernel.org
X-Gm-Message-State: AFuF++lST8R6IHMGtujCH6/uynvOjMalsX9o8deoJXB5lH8U7tkL0nAY
	cyYqFNJef+eeq/vuuG5cuGf0JpcJxtgmzGHjUyQdRHSA5jSAHgmhY9Rl
X-Gm-Gg: AYBFou2h77NZ6tP0RjPXU9OFk6+X7KSss2HgQNRF82oi+NQL52h0tvhqvNAqlrtB+oW
	7B5rVRnyjE5Khwq2JtYHajEg252HbDAWeOxq55YSq76eVv9zZRf7b088de2/FfeXKZDt2qdc7ND
	BvJKPlv1ED4RcEH9YU1Fl2MA/dRCF4Lg+wNP92q3bTCxSsCqgDFQKHRQm0An3rCjauhX/+HO7PF
	u06WwanD4NRxzyvfTrMqn9RlSbJ5Tub6TiAA3RAn0sCUJcLrd4mxiYLdSaVgU5dsJgtUio/QVxy
	2Oa5UCc6AiCtuhK9vrD9LqDg6JLzlJ6VWgKw/9RsaWLKyBCSCm5J8L85oPeWD63Whb6Dz+/ko1Q
	ibTvPR5lY8wrDOXc8T/ogl1PQD/zzRl+vrQVIFkCZPcNCtQcBiwIggzGYBrM4f0poV6yyLjCA9x
	wVX/yYMC92kr6HjfkaXbicIejWioC/KcDBQQRo6zZu/QfJAC/USHGkeN4BphOimyyjZDjjCnnby
	guqjXL2YbJw7zOexV5nh8fh/eo0xA==
X-Received: by 2002:a05:6820:1c9d:b0:6b4:117e:543 with SMTP id 006d021491bc7-6c7d0eddbd4mr1579180eaf.21.1789538506965;
        Tue, 15 Sep 2026 23:01:46 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm5150929eec.14.2026.09.15.23.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:01:46 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: linux-iio@vger.kernel.org,
	linux@analog.com,
	linux-kernel@vger.kernel.org
Cc: Shehryar Ahmad <shehryar.amd@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v3 2/7] iio: accel: adis16201: add SPI device ID table
Date: Wed, 16 Sep 2026 10:55:32 +0500
Message-ID: <20260916055547.15206-3-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916055547.15206-1-shehryar.amd@gmail.com>
References: <20260916055547.15206-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spi_device_id table for ADIS16201. Replace MODULE_ALIAS() with
MODULE_DEVICE_TABLE() which automatically generates the same module
alias.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/adis16201.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index 834714fb9..2b76a6b3d 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -288,16 +288,22 @@ static int adis16201_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct spi_device_id adis16201_ids[] = {
+	{ .name = "adis16201" },
+	{ }
+};
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

