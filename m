Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4E33BA225
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808134; cv=none; b=gfbK88WCOxGViswdqen17dVZIqXhZLnVtsCTN945GC6TCPmI8oG3KToTmIE37TkUSvW4hRuNtDqwpbSBjDm0j3t/en6EexAd8OMECWNqh7nFtiqcTuM2QUCRQLY8D7nMv14FE+VFu2l1LV0T23etbYh7L7CwYDVgMHVD2u/zXSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808134; c=relaxed/simple;
	bh=+/9iF8Q/HzoQ9AXsjS629ikGCqE2KrlWmQsyKxS+xbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rwm+OK0Pgp53Fva2aLeZ3TWl+XUuWtJU+XruGuSKCcE47k+xUK0A7GN9rOIkuN/qwlJ7fnexXujVysRsXQezhVwtGiXswZXEXF4kGp7yRxaVhp6NbxEB0slHcdYlVq5JlyOs04wxIUQXeLByMhaV/6NPJxKRKTXVIobVJlSqHPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VH2MoHMe; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VH2MoHMe"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so499639f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789808131; x=1790412931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=04kbXYpwvydfIV09e+Yw8RNCO3EBvkyuMvNNxaqIlHg=;
        b=VH2MoHMetwiOlpqCwK2s3xJEavhj4uHlDweasxc/cSzyUrVLM3F6PvEC81vU+NDDJd
         awA2+N0Y0HfM5sXMNWZMoPJA3zfvX/Ex2w+BX9ijehBS1+4rp0Tk+/YIpFcatCOvcSxx
         /YTf1WtWiF1yzA8xtb3d2bHfqIPDCRFSt2WMYVBokwbnEXkhDRM1um1CIPzBZjcHL6Eq
         UtADB22yYXGwEVvhEUIO7Nb2dHuu2xzZuxHbk3rTUEojPvM3xMsTOyLUYVYu7HIgZmd5
         jERBtgrAOv7WjdzwTgiWNq7J2EX9oJLf+AgvA+B+IZJyr9g/MkOZkGSuYYSmaK1GDKNE
         fKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808131; x=1790412931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04kbXYpwvydfIV09e+Yw8RNCO3EBvkyuMvNNxaqIlHg=;
        b=vm5GqLfQN6I6chtvvzSf6GIk7lcaNuW3JowaR1Zi26TH6yC1k+c5njcyQ1U9kOwg/m
         7KT394HtDjc6+SHXgjZPQUSCWIkApc3mvmmInvL46O3B5BJVOvzzk3qXJKfZb8WPAbss
         D9/fKt/+fLLje7+RbbmRr3ZJREYFaHLMLvoylmwqTN5vUuns0aoG6Wi5Cd5aZU0vXSbS
         O19nNIRLS60bYWCJdO9p6xk9e0CICL5bbab8guBegFVTZ65FKsJPtvTOb56yScltPc8A
         zsjR6OuorU3JlJALMnSvCSp0k71U4GvezAGqDhGnRn0mTqgDtZBQ4vr1h6r4NplLgtbC
         9/9w==
X-Forwarded-Encrypted: i=1; AKwUvBxjBNTfijvqst2eJOuV9DI68OdXkCSN8+9K/tVIOHSptR4aPqtRyTSdK6KVzrRkRATe3AmMMrmuXeRYI0E=@vger.kernel.org
X-Gm-Message-State: AFuF++kvEPq0Y0E8uMAEDgguwlG/mkwgI3NvsUHiFna+3XO33J0w1E0E
	PQkF/WqlNJA3GhTaKT0D/7sIvCjJtSrFx5AlV71XJqfKMNhBddFlCDBV
X-Gm-Gg: AYBFou0Iv3xZp6IKIxK93KqjGMSRwyZEq9wIuLpS2EYp9vQ+9BT5IuRgQSJ0C58Xid+
	YUACgwMZHHHpV/9als/ujFqUODEfToEf1xj2I/HiZoq3Cu2nk3Es2kCRC1S0OpvAgiDv4ig1ln8
	ciXBRVOVFKdq1MkSN40LxwuTaR8uQ9bwQzn0PJ5zS11K2vWyJMS/IJX1VgG/VRFmzjXTfflayi0
	108cbW/6cgDgJe7/cy6cWprUKdBhWabMvPi1nO2F1Vscuv+jQN/4R2orGpV3klyObsCa+9ODfer
	PfVKgtn2cS+5CQSHgxH3qhn1cuwE1DAMh8RavQkp3E7VTzMW0TYjEnfEP4hbXTogT4Xm9PDR3EE
	YpQ2gi7S1drE/tPt7U8sZlYcuQhR2nx09RuY5MCbAab+3kpPlaXPSZ3e+zdZvxsthe9WJk/fNr+
	9oc4PL+icn7YX2By+8weKd//H8uTbHG/yFKGe5e0GshsFHzxMRKdLVD92LouVZc/6EB43A0C4A/
	C1JIGcOgbxzKBQ3YOEqS5I=
X-Received: by 2002:a05:6000:2688:b0:487:146f:7c88 with SMTP id ffacd0b85a97d-4871d98cdcfmr7778873f8f.4.1789808131054;
        Sat, 19 Sep 2026 01:55:31 -0700 (PDT)
Received: from fedora ([154.182.123.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724595289sm5574613f8f.29.2026.09.19.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:55:30 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH] staging: iio: adc: ad7816: Protect sysfs attributes with mutex
Date: Sat, 19 Sep 2026 11:55:13 +0300
Message-ID: <20260919085513.9173-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs store functions (ad7816_store_mode and ad7816_store_channel)
modify the device state and toggle GPIO pins. If accessed concurrently
by userspace during an ongoing SPI transfer, this could corrupt the
SPI transaction.

Add the existing chip->lock guard to these functions to serialize
access and prevent race conditions.

Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index f76f0215119a..d8f4b1f79e2a 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -143,6 +143,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
+	guard(mutex)(&chip->lock);
 	if (strcmp(buf, "full") == 0) {
 		gpiod_set_value(chip->rdwr_pin, 1);
 		chip->mode = AD7816_FULL;
@@ -207,6 +208,7 @@ static ssize_t ad7816_store_channel(struct device *dev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&chip->lock);
 	chip->channel_id = data;
 
 	return len;
-- 
2.54.0

