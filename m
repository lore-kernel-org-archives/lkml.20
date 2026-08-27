Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C2495036
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851320; cv=none; b=KdjRBSTvs3xtZ9E8Xp6jlDWJh0XePqXoABL80ZNF6AJ4CTjnaw4Kv1xh91w8N/HfxxReeXjTsyAOs/4VooABMGzaeezd37RB4KLMlJ/UMp8qA+KFliYZpyIeJGa7/KZmHSKQs5uvFhkVutnijIH0NNc/olUmRKyEs/cfLZPSAF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851320; c=relaxed/simple;
	bh=lXuGALADpdYx0vO4VSK8tnkYBICnr5QRqUa7sGpDYUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DTK0x157NsuzFw+g94CRbrSMspXtLnMjXo2eMJQDYW4MVsy5AibGuu5H6CC/bLsJu/ZzDV2oHA75Tz/1bz3nv/epT3A7kDcXp+QsJvwH9MCGoDKp2BJU6h8bkqXBUZ4RgDa0kLZrrUamqsOXY+BuN8wGJ4C6zrJPlBpKeFBmlNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU5r6rJ/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU5r6rJ/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e347638adso323290a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851318; x=1788456118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gw3dvZrCiTdARZjyeMDfU+Lq93+rhoJslG7bH+ap744=;
        b=HU5r6rJ/MlNZhwGSamRiFC+QCpdTHstCmx16xh4AaXhPvY0ACJHGClhC7bFqgacDP+
         I/nBiPvHdH+dfrR23fYGD9opvIjRZkNLSNg1zp/BIOMzADaapAbYL3B5LUOYIRu8nXE9
         edqjxYcNt3WpePJPW+OiNxwU5D/mBq2Cf+rhdpEfTMm4AWft3z/8sOggdKuLMAr3z16D
         +San9h92BJG4vgtyX/R3/viF03F8dQhpeOtYtMEZOBCYAVEDASQCyNr1H1Q3hq0nO/ro
         azg4wkG+j7JODInTXeABJOizdsc8jQ4YIevLyGgxOMywymdxqUVw9tNk0nm29GNPDuYc
         iCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851318; x=1788456118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gw3dvZrCiTdARZjyeMDfU+Lq93+rhoJslG7bH+ap744=;
        b=VxzGimSEIwMXP1DQ3pZEPhmUapudeQE/52Ma2/qIBYVxZXF8BCfPL1TRikGq1f7lv7
         kyxbDnG60qojMk+ZBorj+SGofqHlf14mo+P5zvDAb1/sC0F5DOGgpcGsjySkCJ3SPNxE
         pgv6tF/0fKC6Ig5iKH2h9eyiUNA3OwK2w363eOIsoaLxAeoYKrbxPfDLuRr6wY1IdzGO
         LSssk0AXSCXC9yRF8Jpp14nTSw5huQ8rYfhT7JwO3D+zw6X49oV0MD5OeBp6W3PXqKfE
         F100F9h7RLVgb/pd+A4otkGTUG6ziOZCJsMMJ/r32JTyx9MMLFGAkhJGKFm/FrA9aJQL
         KAEA==
X-Forwarded-Encrypted: i=1; AHgh+RqrowfaaVhBtxBMBN+SySeWz3CKVkUVAYlrLX+BD2sIH+18DDUUqo5hw0AQghpkOUhN21GmoTgbE9+MK9U=@vger.kernel.org
X-Gm-Message-State: AFuF++kEYsJZdpaD6G6rRgu07gMwHZkSewCPhEkwtL4FD0giMuXJkvzV
	2Rty+cDP26Wy3geQXLW+dFfHAzGQX/0H7ks73zUa8cg5vFnHqph2XArp
X-Gm-Gg: AR+sD12pSq++ZpUxl/lyhMQQQI7tADjf27ifEqcZ6w9LFfR8RhVLqB3Tmz0I5XyD+YW
	TdVvOmyRDgDvoSmqLR0GjnDMeqyf6M1QW5lms/qcFBlZUzamWrT5NJAtKze3nljPezPIz+1U0nb
	aGYN+JsipvSyyup5NPKOeSLYGXtuAQ2JVovmumSzcX5pI7MlUJ3f+CnucYZTwOsXQRChL2izp+P
	8VowgQeLF0aji9aF8EVbYvPdEMuNbiWMkqZZqh9ZwxKFqS2M2PoUVeJVBJXeNd0x+oekb0Xq8ZV
	uNQiq7IQO9xtgWzOcAWXD7mO5+8stywBpLSQS7jS/Be28FNxSIeqvjh+ja1hGOKkTSjiND+2UVi
	B4k81h+7h865BVyIO3BMRuu92Nxr/FNsyt2po9JQZ/aS+G6gLUmqr/LunNd5oiiGAz9dIIyZymB
	dMkS020oTf2GYOLGmItsG3Spn9vx6WNUKhD6NeQxQHOilnT3R6cJ5M8PVFtX7QZ0pPTRqmtkKGL
	BnGapuw41DlijQyaYqNHh2p81cOKjudQujU
X-Received: by 2002:a17:90a:e7cf:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-396d0fccec0mr1155735a91.12.1787851317751;
        Thu, 27 Aug 2026 10:21:57 -0700 (PDT)
Received: from debian.ari ([47.30.51.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eedd13sm17797165c88.1.2026.08.27.10.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:21:56 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 5/8] iio: adc: ti-ads1015: drop unneeded < 0 error checks
Date: Thu, 27 Aug 2026 22:50:57 +0530
Message-Id: <20260827172100.39176-6-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260827172100.39176-1-architanant5@gmail.com>
References: <20260827172100.39176-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several functions in the driver only return 0 on success
or a negative error code on failure.

Change the error checking to align with standard kernel
coding style.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 0d1006041819..ba4a01850531 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -539,7 +539,7 @@ static int __ads1015_read_info_raw(struct ads1015_data *data,
 		return -EBUSY;
 
 	ret = ads1015_set_power_state(data, true);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	ret = ads1015_get_adc_result(data, chan->address, val);
@@ -727,7 +727,7 @@ static int ads1015_enable_event_config(struct ads1015_data *data,
 		return ret;
 
 	ret = ads1015_set_power_state(data, true);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	ads1015_event_channel_enable(data, chan->address, comp_mode);
@@ -994,7 +994,7 @@ static int ads1015_probe(struct i2c_client *client)
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 					      ads1015_trigger_handler,
 					      &ads1015_buffer_setup_ops);
-	if (ret < 0)
+	if (ret)
 		return dev_err_probe(dev, ret,
 				     "iio triggered buffer setup failed\n");
 
-- 
2.39.5

