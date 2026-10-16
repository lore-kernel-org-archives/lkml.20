Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1F23CB56E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151192; cv=none; b=cHLvESQ+c5QTjGZWiUUAQeDz6zKt+7MjMSIO0zTHuebKwLNqV72uRFO2ZhwpfIgqP4GVs1+Reof5Mzxc72821/NqPJxDD+3l5/s/glbR+/5QCrsBp8snqIvWAdwL1lOIk/Et80Y3A7hXpc+arEvD4z+Gwsoh/Gnt5pVQo2n9as0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151192; c=relaxed/simple;
	bh=Uvmmp2ZgCoQ3dwzThmBqUX6TSI/JKruY9bN8EY5j6vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1WGGl71cUlqzQK79J+jjMl+MmyG7PVbBfs/VdLMtG4Tat7ViHMnKZF6Ar6+jHg85p3HxA4WIgeGZLqalpO/SteXVeByhZ6Y/Uedj1kzOkuSB7xH2IHQtRh7r6uaPEvmk//ObwLYz1EGC+fvJG3dsxSeapTXr3OBho+UhxqW9oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtSn21gi; arc=none smtp.client-ip=74.125.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtSn21gi"
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1848630eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792151191; x=1792755991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWLAHlKO0hInXWoQXAgF9Kg+b4ACy1GGHEQwU1sBFAo=;
        b=WtSn21giVBkMemLGU1E2ueMXjxTqJPXwICISCy8jvXAFyTJh6nxE/ynvqODXrtgr/B
         0lq8YT40mB6phpaA9XC9I6tjXwn4lZYIT3d+tmKiATqubA59dzQcHtHic/AE0/tzT6bU
         Q+B0LD+e5AdmJXQ4GMD0Korg3ltVzZgVbqueN99QuYIxV0rrr3VPgJ9QsdUvkNCW9J0b
         CX19vzpD5V51CpKDYdADHa17a5MbFX6TdmMRK8MfTc7I4FP2mP0/bc8+AgZF+otC1vE9
         0A8t3l1puRMxUAlsXLMvakkrW1OMp8CrAonrgd9FgA6DnIeaeIwrjZ5B7JdOwUaJlNwi
         t2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792151191; x=1792755991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWLAHlKO0hInXWoQXAgF9Kg+b4ACy1GGHEQwU1sBFAo=;
        b=xmSBJF1Xe50AmWk+RxmY/374dNDWZZXdBUhBDj14gWtsDFIixYjM6oUS1G+eRV+WHo
         koZ1FgcL5zOv3+lRrilHOcj0alzqFyH85t+wW4EwJx0H7GWGcHSWO+w1kvswcicazuTP
         1/iAzGi/uJpsMMf4lhKxlwzoVNT8HhU7+cMFymCRRCQKqbU+e1LQCG/ut2G+E4vOR9Uw
         b0NL76xqGIFrY3YbLJzZqtdh3l2E2NPhnPEUkzLzyoVulmo8vRqTF/Sgw9uazaHX+0Bh
         3ZPOlWybAjRc55N8LmO/iXlMZ79X1vHE+WwtvXepCEKYRl5ZKWAa1tFv7CDXxDwsLKuk
         4Gjg==
X-Forwarded-Encrypted: i=1; AKwUvByz8uu2tAcdoo5zPt+Ih9qOkXKgmqhUS5ZrhhcSX4OHwSGeYOE8in4Hj+aXLPIYL+XEPJP9/XNVOGW3pVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXXjToqU29oD1lJbxXPebe+Iji5nYo0WkPqiacTOE0bbu0YAGc
	ZHVJYZbXc+FM0M6/XqVSWNklTRMPvw93rJLpYeHNoioVElhJxnmXl/RP
X-Gm-Gg: AYBFou3lCdVyKet4nUGNeCBxwqSiyJj5VnckmxJp/DQsfFsY8ZJh7Kl64t9CM4S31pM
	gY0Df2+8EZ6jugbYc8if4iUwVeYqY11vNRNvPE6PDuuP2DJkRiqOJxJ0hAZ7GxO9zcFrrf56C8o
	6DRS9y/t/1mltOwLRRF1KSIM59cCzyINok6SH55cHPzPnCSh1nct2Q9eZ2gzktwYbPkOSVmuZSt
	10dDHCx1ka2eQhcJnvvy163yGF+8AKik3bZdXkauAbDe2juHS4uUd+7AT3u75IpHwspwWEtP5uF
	ckj2GtLDG9oBcsI5S72HrfxUOZFALZt30O6LftOBKNFnMHPQmruvga9iKdSqyEGcxBzgM07Eun8
	itVYv5f4Up1Cqc6SRHRbjRDLofa9wsv9Kw4UzfLYRrC3AbpGfN1tSnyDEUETMjV2MEMvqrQDGVo
	YwC3SG9rRFz+tcLiLM64NR6NstpVLqzxoQ9DRi3irSCedqwFIXzNVjgRzgYO5gaVTSxsG8
X-Received: by 2002:a05:7301:408b:b0:351:31c7:ab1d with SMTP id 5a478bee46e88-3537df95584mr37998881eec.16.1792151190580;
        Fri, 16 Oct 2026 04:46:30 -0700 (PDT)
Received: from fedora ([117.134.210.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm7330259eec.8.2026.10.16.04.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:46:30 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH 1/2] iio: accel: adis16209: add SPI device ID table
Date: Fri, 16 Oct 2026 16:45:26 +0500
Message-ID: <20261016114527.128364-2-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016114527.128364-1-shehryar.amd@gmail.com>
References: <20261016114527.128364-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spi_device_id table for ADIS16209. Replace MODULE_ALIAS() with
MODULE_DEVICE_TABLE() which automatically generates the same module
alias.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/adis16209.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/accel/adis16209.c b/drivers/iio/accel/adis16209.c
index 04e169f22..07a682d68 100644
--- a/drivers/iio/accel/adis16209.c
+++ b/drivers/iio/accel/adis16209.c
@@ -298,16 +298,22 @@ static int adis16209_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct spi_device_id adis16209_ids[] = {
+	{ .name = "adis16209" },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, adis16209_ids);
+
 static struct spi_driver adis16209_driver = {
 	.driver = {
 		.name = "adis16209",
 	},
 	.probe = adis16209_probe,
+	.id_table = adis16209_ids,
 };
 module_spi_driver(adis16209_driver);
 
 MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16209 Dual-Axis Digital Inclinometer and Accelerometer");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("spi:adis16209");
 MODULE_IMPORT_NS("IIO_ADISLIB");
-- 
2.56.0

