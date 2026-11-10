Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319487;
	b=xBc69TU8m1TM/WdB7cZkhHudejfcSmfz9VhSabJp6U5aEZXNM600XUiFpdC5fwQiKKSo
	 gsRI/J8PZhf9c6LS+WT4ZEkG2Njb2JsaErpfr3K4ihk3xafBJEcg5faWT9u0iv2T7CiCK
	 +KuC96n3BBBBc0h+Ux1tn1YcAoEsmtKegkEBRSeAXOpQYM1Ifn/eX54jdOsPcZFLxVLf7
	 ONZjxqg9oQzIMQjodeZ6q7amOMj86HXuyAUT3jTO7QOIYj80x0i2CokFBQLwUBKvBnLJY
	 UmroGCtKWP04NeZUeFjydOPiH43SLESY3SBRjmZyGjPhC+KtBm7+KCNIm/Yjqv9EhEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=418qL2keCn/YC9lRyTTJ32argrNbioPNqzsGFZM0jp0=;
	b=4LbnUxHfLdgGzo1ucFHTnx/q2nw2hlE+9NtHQK+zdWvjL+TqHXYOj3F55vng7jj3Ahcx
	 2d0QhWeLrDJqSEO7cnGOMiybRxiBa50gOLWnrvsh6mp6phqezjyT4dkGx5EsOvai3Juio
	 dec/QOlO8R1NxNN4nRXPnJsKv9NgWmgrsXIXbqVJVYPsefhSvKyz/mqBtBdg38jjNBKkN
	 4xMrEZeAoFIwex+2XotWHn9SvCMmnCc/gcHUp2QK61t0nbSv5L8FLfLB1de4FeZ0pw/pq
	 x66rHgJPKFQAV1RwWHDKfdDmhStGhcuQ/hljlcGkSGdx+q68uH7uk8998AM73YedOdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vWtTmGCr;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F72606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F72606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vWtTmGCr
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1159782a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794319486; x=1794924286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=418qL2keCn/YC9lRyTTJ32argrNbioPNqzsGFZM0jp0=;
        b=vWtTmGCrwobFP4zJww8Q+XzfMCl9hyZEiswN2YzfeLyaZY+ThZgKsYFihWrzRdrF7V
         SwcsnfuoYO+jpoLlnekqtsQFMxUDvHewDr/dYNu/eiGhKpQg5n3vPGWj9sT1jDhNFWZ3
         B9tESisHXDW9JO6kvF3mg+OA5+edOc5ljNGp6fsEb0fr3zIzuDbGIAl/3Gwdgpbc6EM7
         g9FJ8LOEYTpTlGif5N9inWvR5ST7Ns5mEZZbF3eLripB0v9gUYhkvfPfFG4frDaAQg+I
         I8AxymV8Zruu4E8L1ERDWepQ6Cxsp2L6q4Xir/wauUyPAFl/jVpumFuCPcybwSt8INhY
         dvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319486; x=1794924286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=418qL2keCn/YC9lRyTTJ32argrNbioPNqzsGFZM0jp0=;
        b=mN3op22i5+lMEDilXmxvoeWVEwqEYtntE3SCR7kcmlSNakJI0l7+rzPgd3UzQ9JoIs
         vKGE/FjsDiviLciC06DXA1Gk6jwOVGrSWiuAlbNpbSLG37+y/fy5ySkPmPfCeh65isoh
         J2ftvv/g0WPWqoYJMx/dz2lGW9entKZJ0q56nmgT3dqJrZTzQvWCzD41RtIUiOiwcxEH
         lqVPZxBhssUVFo7jIYetb7tGdbbX7M/4e0LsNDQdUA2k00rPEuRe/ORrqg7AzRELcoZi
         5qyf6NpT3iwqJioGiDQx/slf31C+EVtHKuuUfPvatS9GNp9muCWaufG3DIe5MO0KFXoI
         t+ew==
X-Forwarded-Encrypted: i=1; AL+hErFxXRw00QhF3U+Nabeqia9hCl3TldID32/mc0uQbLOFWMr9zJIGhxlKBhIrR/bsLjTTSdnj+8gaEJBnSqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rcs9OWpNo8+E/rjHjdGzwXQRUzKz0TMFNSszEMpweBEnJf5kV
	An18Vsz2BdDROUakFvLU5QKOKHMngIi/Po+GqJIauuF3ntIssJBAgjx6pKtnw8hH
X-Gm-Gg: AYBFou3vgT/9teviCGZTqB5EUhbU48KlvE311UKqlkNP04HSuV4FTB+fuTS/c49G+6m
	B+U+yc/IURkBGHS8A/2pwR2hw5B4I9I8rtKwhoUeSlm4r4gRRQx66nbvIS/FoxchXtDqqA0MQhk
	mddUpltOPqEQUXB9fmD7GYiE5dHjkmTzjDelCWI44AauImHNK8aTlhiP37khayUVSzdc0Cvl5PY
	zMEMCnOL35Km3ivjWb91ElUN5XqOhgn5Y7z/cP2ahgpK4MmRtWpc0j4np7/EygvR3o1yWfpybKK
	YW4DQwXFkqg7XBygpbVrUONxgnFPj7nKvckRp/ERaPV4fAmuf8BYm2/Nz7Fljn+d4af2wIzHbyi
	h1u7CT4L/U0vsm8CZwjUFJZ5ym/c2cROesXxXm1PFq4vvj9RIEzlCGGUBH6PdACMMU4aqnhnkY0
	n7baFS5vjLVuNMmFKiIlW1MlJ1dw3WxnuG2J6hue1bXy+EyE2co6k2zBzb35/126uUBfxIpzoGY
	Xtq83vPpoOoCcYgzE/cyZGIhgNhOqKMjPUsogwwOKEleuoQTWOBHPes9MQ6rdB79rexwu1mRd+A
	6C7JUnI8rMpv5A6X+QmiBzdlDa6Sm9eTExif5498Ude53suGjW7/CFHkeJiI
X-Received: by 2002:a17:90b:1a86:b0:3b1:2810:dfdb with SMTP id 98e67ed59e1d1-3b166d1edf5mr2895888a91.48.1794319486272;
        Tue, 10 Nov 2026 06:04:46 -0800 (PST)
Received: from LAPTOP-6IS184GT ([104.28.251.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16903edfesm1875444a91.2.2026.11.10.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:04:44 -0800 (PST)
From: Nick <nick21042013@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org
Cc: lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nick <nick21042013@gmail.com>
Subject: 
Date: Tue, 10 Nov 2026 20:33:54 +0630
Message-ID: <20261110140354.2047-1-nick21042013@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
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

From: Nick <nick21042013@gmail.com>

Date: Tue, 10 Nov 2026 19:57:26 +0630

Subject: [PATCH] staging: iio: adt7316: fix camelCase violations



Rename Vref and AIN to lowercase characters.

This fixes the style violations and brings

the driver into line with the kernel style

guidelines.



Signed-off-by: Nick <nick21042013@gmail.com>

---

 drivers/staging/iio/addac/adt7316.c | 12 ++++++------

 1 file changed, 6 insertions(+), 6 deletions(-)



diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c

index 20f6052cc..a71502cf0 100644

--- a/drivers/staging/iio/addac/adt7316.c

+++ b/drivers/staging/iio/addac/adt7316.c

@@ -663,7 +663,7 @@ static IIO_DEVICE_ATTR(da_high_resolution, 0644,

 		adt7316_store_da_high_resolution,

 		0);

 

-static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,

+static ssize_t adt7316_show_ain_internal_vref(struct device *dev,

 					      struct device_attribute *attr,

 					      char *buf)

 {

@@ -677,7 +677,7 @@ static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,

 		!!(chip->config3 & ADT7516_AIN_IN_VREF));

 }

 

-static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,

+static ssize_t adt7316_store_ain_internal_vref(struct device *dev,

 					       struct device_attribute *attr,

 					       const char *buf,

 					       size_t len)

@@ -704,9 +704,9 @@ static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,

 	return len;

 }

 

-static IIO_DEVICE_ATTR(AIN_internal_Vref, 0644,

-		adt7316_show_AIN_internal_Vref,

-		adt7316_store_AIN_internal_Vref,

+static IIO_DEVICE_ATTR(ain_internal_vref, 0644,

+		adt7316_show_ain_internal_vref,

+		adt7316_store_ain_internal_vref,

 		0);

 

 static ssize_t adt7316_show_enable_prop_DACA(struct device *dev,

@@ -1684,7 +1684,7 @@ static struct attribute *adt7516_attributes[] = {

 	&iio_dev_attr_enable_smbus_timeout.dev_attr.attr,

 	&iio_dev_attr_powerdown.dev_attr.attr,

 	&iio_dev_attr_fast_ad_clock.dev_attr.attr,

-	&iio_dev_attr_AIN_internal_Vref.dev_attr.attr,

+	&iio_dev_attr_ain_internal_vref.dev_attr.attr,

 	&iio_dev_attr_da_high_resolution.dev_attr.attr,

 	&iio_dev_attr_enable_proportion_DACA.dev_attr.attr,

 	&iio_dev_attr_enable_proportion_DACB.dev_attr.attr,

-- 

2.52.0.windows.1

