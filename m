Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B7B37A4AF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914888; cv=none; b=hrmOw/fXV54newPIpc/6XFjFuFA0fTnW0LuB3Ghki/ojUetaJtJLF9LSdlzKhBFPnK6DXECGavy4t1thnRmvPrGpoooaKTofYj6DG+nr+uxxj1TRPOeZfIG9+cNwn0SaaS8Tfe9YqLq0SxvoM5LGHAkr3gv4df1RkhxFanP4HjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914888; c=relaxed/simple;
	bh=Pryg5xS+n+g+Fn2cHf2KW4X9OGMWP1v3ShHt73nesCE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wi/HBKZfUFM9qsKbFJaVBy983PwyTuIbHzRDKCBufQjb9Gs1hLAzlsxk3BKDKYZjXbdxDXgercA4NJs11HmmAoiCJbJa6CLQCo02rIIgQkULJeeAfoJc2rclidSm37z574HcvEnEL4K7bSUe8i6Wz/ut5CntKvvN4pbvK2H+t0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOpknzKX; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOpknzKX"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39675172593so668988a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787914884; x=1788519684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTWa+djf47koqumolK6H+Xu1UaXk+Fum2BNO6AlYd3U=;
        b=ZOpknzKXjsiH8ZA23mYJnzkXyDz43bsqmSmuThTI9d/LeIuZ9pbYZSdNXQGAGrugzr
         i4Yxf7uGSxsof5v5H4divtOq1TTH8N7AMK+OflkBk6A2PiB9eYbIfkrzk+TEGCiTdPwe
         UlLih0tlB1VntMIAS6FwZufyp5dQy0BDHtZeX/SRHakXRllmPXLzBCvVabC9nqW2Pz+q
         /kgfwq374hThdY2vNKTIxvOFqeMqFndXc1OqCzvaOkBAgepWh82xi1wN9UL9U3tBuGHQ
         Ftyv7UMRpqe8RwrusS9ohok9loYAkNPBHcZFoLjxOpdDyQVKbhuDuXlpP1cVMSZdQYGf
         2r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787914884; x=1788519684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTWa+djf47koqumolK6H+Xu1UaXk+Fum2BNO6AlYd3U=;
        b=ZLcrnOErAJAM1WT3eRoadMLVD4k/IFrZ3X4AeuGkigvrMa5P3vELTv242486S/++Be
         FXBjFbvxnHXoiT9tebgFXPyVVVuR5nt0EeZE4IE8yrL6BeEV1HvpFYwgj77xFP69/QhB
         yKGxDBID4rShwl7dWIXYE+ZEqheV1eWu6cT1+DRZB7GHvC1djNlmJ47IRsFz9h2gIjqA
         tQlzjghSXOxf25Cn9lj6I4QG1/5FpRM81hGePoYVQBx/CisBQjKBbm67Hg6RKsHbgmzm
         M8IvlpM6PuQJoaV5HvhoCczeaZ7BBxKbmEgUWBEZzmmeOQPD6DPuanuTQS9wYef5rigi
         IBWw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/HmCemchUpvi+bPz/hS2PK2n9YJwVsDqxCZjGOsk/7w8I6UNoDAm8hPpR9qxUty0Zs0Pno8DYlrI0xLg=@vger.kernel.org
X-Gm-Message-State: AFuF++k70U8slvkSAdbtJKo/UAe+ozWgytk1lW9D/tWD6/Xbg4f281oc
	b9FZjAkp4HKoy/JrQrko2VOb7DtnnJ8HdIlUaNmKXbBzmwMSNAn0ZOGuRFoTwA==
X-Gm-Gg: AR+sD12ZZd/FXhVfebP/BJDm2cTtP8ncEqVyhlk9ydNTvKw8TFDtWwOtTwURTsMd4V3
	0NnDnbDd2Zzvm6szAKHuSTYbKfoDWe7r7lQK7LEm4AfCcUrsEKORRSPUJAXp6WdCK2ln+PHCqFc
	dahRSMdKCxBM+bihuC/VaY9pB/2w5bds3psWC+h5Wb7kcHJfQ0VnUMlClFNdL8hzWwBJW8AIr6q
	pKnTBJPpADfbLwWEeStlEMXO3qBky86v5bD+5qSCCiro9XQod4EiISUB64e2EXHkZ5wj+vN+3CG
	S38AdWI5kb0ypht0iVsOKi6jSYOqRKrHHpp6wKsLzyRhRJid2G6PjFBwcToo5Cx0tYKweMrUyQB
	qqe8p2YUrRkjB3tvc7oyW2Gaeor1gVy40GMh44hW2nC4hqa5WPtwqnZsE2mj9FyLCJt69WnoXmH
	CKqPbG523rSl+X5d1pt3pc9ylXZucV2VHp5E+/xo2BtEiRJ2wHHQWcIH4XXHfVIqPoihNv60Uwz
	g==
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr12801662a91.14.1787914883610;
        Fri, 28 Aug 2026 04:01:23 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([42.116.29.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc58f3dsm2075669a91.16.2026.08.28.04.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 04:01:23 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matt Ranostay <mranostay@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH] iio: proximity: pulsedlight: fix iio_device left registered on PM setup failure
Date: Fri, 28 Aug 2026 17:59:09 +0700
Message-Id: <20260828105909.2425439-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_set_active() failing in probe() jumps to error_unreg_buffer,
which only calls iio_triggered_buffer_cleanup() -- it does not undo the
iio_device_register() that already succeeded a few lines above. probe()
then returns the error, the devm-managed indio_dev is freed, but the
iio core still has it registered: the sysfs/chardev nodes stay live and
point at freed memory.

Add an error_unreg_dev label that unregisters the iio device before
falling through to the existing buffer cleanup, mirroring the teardown
order already used in lidar_remove().

Fixes: 4ac4e086fd8c ("iio: pulsedlight-lidar-lite: add runtime PM")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/iio/proximity/pulsedlight-lidar-lite-v2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c b/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
index 400477b4c740..8a9ee21f2bf6 100644
--- a/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
+++ b/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
@@ -294,12 +294,14 @@ static int lidar_probe(struct i2c_client *client)
 
 	ret = pm_runtime_set_active(&client->dev);
 	if (ret)
-		goto error_unreg_buffer;
+		goto error_unreg_dev;
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
 	return 0;
 
+error_unreg_dev:
+	iio_device_unregister(indio_dev);
 error_unreg_buffer:
 	iio_triggered_buffer_cleanup(indio_dev);
 
-- 
2.25.1

