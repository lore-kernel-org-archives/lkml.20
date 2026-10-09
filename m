Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9983EEAF4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584731; cv=none; b=GtE+zAbSLiMFQevPat+gwIEyj7HG998EJhq8E0/1A/J228l3yAjkrV7dD4lT0XFKANgXg8M0F31veSVr0RgrVpA3uUPy/LiWH1YOiUKumk5MnqZzEZIkCl8eGM4B+2rjoGi0bZdofr6ixXEHtfPCL9Rj2Mf8QqTWCt8SLqtvBSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584731; c=relaxed/simple;
	bh=4uqeXdnRU/1UZNsHvp4XBofBIT9pDbRG5x20+z4/OTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AnWKGSQWMXsBXJrcF5XSMcEG1I/ycV12qY4Kpd96eZqcYKZaU1PZrXFG2Ga5nSWAIG4r4C+i099tU+KTHVsIkVbfdYPo1VSwFnYWMCPBYCQ5HOyNf9oHofse9gzmqxm06bGwqO3ry5xCHAVecrsAWhNRQBTlxuOxhlrfE1+SV98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=m6iYZf2A; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="m6iYZf2A"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5da7a39e584so73082e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791584728; x=1792189528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khCEw7C6hBWBoACe6eWgt6IH+9W6DFj2toNOYtuO/ZQ=;
        b=m6iYZf2ANIvs/WuDYGkMtJGQU/FnJr/i+2u+53i2/MxyxWUWVry984bJfvAaxVtrC9
         y38WHO+MEEdfZEcUZx0HH/X/SPVcefZO3lueC0i4kbZGJARwZzkjRcftIsUzGpa2piB3
         QcTo+AWCMct+kc6qXZWdbt7tjDBKqlVesBTgKyuNJCUK79juQlZWe8dqmRIR9gXhAnZh
         jisi99i6HFxB4dIDOViKlruwpCWt4EDnnjRSeiFxsH6Jah88NtiHx4p3n6ivhVLUb177
         zlJ6j+297yAGUktpEMsBCjGpReAUNUknhOOHwSRow0XP/U+r9UI5t0lUw19UyK2e/IKO
         zBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584728; x=1792189528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khCEw7C6hBWBoACe6eWgt6IH+9W6DFj2toNOYtuO/ZQ=;
        b=nl+Dfa9HhtIe04y9ZMxkxVaNtBpW2qH0JcrnO+pioR3F/SP7YbXCKUFye3uvmsTYjb
         aAfmd36XMC6Tm2mLZZg2xGSo6NpmSnn1Rfbpzw+G77NXuiUZtF0ptmIsX3TWWyQ3VlXj
         +es8AJRqfHW6SCOFGtWOt6W6S+38NkBWc3hlQO7whkbkW/H8aKa7YXTOx7zUyFkX6VyN
         6fDZpMJSsS+SellEY6B5rITA7dLAZatWDDWbwRvcclxe56qoqgjiqjGWgSC3/jBv2CVN
         GTR4WNxVVgeFQDTq9Gfz+3tgKCHAf3x0lvkXJH5v+fU44CoCVMP73MRzDYvl1encmR0F
         lEGA==
X-Forwarded-Encrypted: i=1; AKwUvByUEAT8NvUSWOVlPCsEeMMKFN9MKjYnML6OBsmmRHbKZNxvB8y3NNUR7vlk53nS0c1TR9tWwqqtO3KCAIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIshxQcnsICbf58AwRoRpvTNrR3GzJ2NcQpuxomxpnZAxOMxtfx
	sjW51uctFqFLOnaluVz+tlh2xx7BMTxluesloLfuRZxDTSWVpCSf3GzfP6tqT/ql4ms=
X-Gm-Gg: AYBFou3gPLbHZXhbrNOceAg421PWFDK305dsI5CvxhsIWCdToImCgy/o3V4o4npsV3V
	USRyn5UT8HfRglM7QJRYBt91IF1VbA+qo6iUCKPZYw6yUMpyXNVr9g7julk8/nvOC0lb4CDmx0I
	AoeJ8sg/qQ0+rPRHN0YSW9OVuqkVqAw1aG+pqQIdJziOnNaxusl8HyCD0QyuPyTmHQKio8ZVJAm
	JN/YCbigtOn2+u9lEaqsGWyxyfTfkq/MVa9DpigaNQTHncXkAEyyO9VjJr5W0x6uU1SZwHuHWhM
	nt6bUOZMFZ/YJJ9lcDMRc2+kfihkn2gXEJGq0cap9n1i1/39pioYeuZPn9NPCfYLmpH/8+PaMWK
	GCwqVIJgOvSUrI+fB2436d7vIGrcpg9ZvkKuWXo3nz+EG5U09BnyuhXJEIaZKQ/W17R53knwT6j
	kYK3usJ2zwSoXGMlTMfmpK7awzhWm6vmUtTo38TpgX6vnH4jC/s8xs+nX0681cQ6fTMc4xLXtSq
	LE=
X-Received: by 2002:a05:6102:370c:b0:7b2:b159:98c3 with SMTP id ada2fe7eead31-7cb3739b2c4mr1184109137.28.1791584727707;
        Fri, 09 Oct 2026 15:25:27 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:29bd:56f6:5ae7:35d2])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99007c130efsm2125418241.12.2026.10.09.15.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:25:26 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 09 Oct 2026 17:24:57 -0500
Subject: [PATCH v2 1/2] iio: adc: ti-ads112c14: fix negative settlingtime
 check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-iio-adc-ti-ads112c14-fix-settlingtime-sign-v2-1-6b54a7378101@baylibre.com>
References: <20261009-iio-adc-ti-ads112c14-fix-settlingtime-sign-v2-0-6b54a7378101@baylibre.com>
In-Reply-To: <20261009-iio-adc-ti-ads112c14-fix-settlingtime-sign-v2-0-6b54a7378101@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "David Lechner (TI)" <dlechner@baylibre.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=4uqeXdnRU/1UZNsHvp4XBofBIT9pDbRG5x20+z4/OTA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqyWnEvaRSJSJi2VN7Vwyv9dFT8Uy+4DJInDRFP
 WFYlVjuCteJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaslpxAAKCRDCzCAB/wGP
 wOg1B/9toJslPqhgbA4IO+TI6fRGS/ZhcL0HgHWP6LXIXNIiosgejyMTr88Nk1BhrpqY4iNwuMi
 nQNQkMO6RJTmKwl5GdGNyx7wzPsSI0DmL91A5R0Ckc0HKDdQBYq7ohpqcRMsiiMbmumbC5A1PCY
 /SKGRpHeqlVokIeJiWlyOlHJyqYWDCaKikX1aOr0LgDfas2InquZSCbGIkCVwMaN/Jmz11l/KKC
 O041MtytEobKOm0wtbXAU7BhdPoAN7P6EVaLME42sZFGzrLMP4JuGXnyMV3+kRx79c6v5KPy7SF
 HFmaA3PYOO1QHUrbmy2T9QztfHskoNgUboA5/7ugUIJ7tBnM
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Fix checking for negative values when writing the settlingtime
attribute. MICRO is an unsigned long, so on 32-bit architectures,
integer * MICRO is evaluated as a 32-bit unsigned value. A negative
integer part is then zero-extended to a positive s64 and passes the
< 0 check. Large positive values can also wrap around.

Reject negative input before doing the multiplication and do the
multiplication as 64-bit.

Fixes: 839cbb1e2331 ("iio: adc: ti-ads112c14: add settlingtime attribute")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260910-iio-adc-ti-ads112c14-filter-support-v3-9-e5a9b27ddb1a%40baylibre.com
Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads112c14.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index 3c877126b0be..d8fa8d413e87 100644
--- a/drivers/iio/adc/ti-ads112c14.c
+++ b/drivers/iio/adc/ti-ads112c14.c
@@ -653,7 +653,7 @@ static int ads112c14_get_settling_time_us(struct ads112c14_data *data,
 
 static int ads112c14_find_delay_for_settling_time_us(struct ads112c14_data *data,
 						     struct ads112c14_channel_state *channel_state,
-						     s64 settling_time_us, u8 *delay)
+						     u64 settling_time_us, u8 *delay)
 {
 	u64 delay_us, delay_tmod_needed;
 	u32 fixed_latency_us;
@@ -719,7 +719,7 @@ static ssize_t ads112c14_write_settling_time(struct iio_dev *indio_dev,
 {
 	struct ads112c14_data *data = iio_priv(indio_dev);
 	struct ads112c14_channel_state *channel_state;
-	s64 settling_time_us;
+	u64 settling_time_us;
 	int integer;
 	int fract;
 	u8 delay;
@@ -729,10 +729,11 @@ static ssize_t ads112c14_write_settling_time(struct iio_dev *indio_dev,
 	if (ret)
 		return ret;
 
-	settling_time_us = integer * MICRO + fract;
-	if (settling_time_us < 0)
+	if (integer < 0 || fract < 0)
 		return -EINVAL;
 
+	settling_time_us = (u64)integer * MICRO + fract;
+
 	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
 	if (IIO_DEV_ACQUIRE_FAILED(claim))
 		return -EBUSY;

-- 
2.53.0

