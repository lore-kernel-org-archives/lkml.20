Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96409499F04
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940973; cv=none; b=IujHeTJ957ilYpKq+BmbrX3iCTSPBKqlyCqqouekcA+szAiMptUG/dKNTNU/5HOKCUG58wbuBZAgZ0Fw+k4kCwOeP4AbQSeqjT6+iUr7zAa8hmYp+b7747cwHZCv8rYhsfBpDOWuDrsk4AfQqYbq0wMG73xL7cnysNytbcpUVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940973; c=relaxed/simple;
	bh=fNedMvATv88XUN2yXNzYAwN7WlHGUXWXzn+KTQ0e33M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQUsXiPVRA7RYAOYDbIpKy9o8v7Ufy20HfN2TTbphbrWmmvPP1cMcf6eNR6/kJPY34FhmgZPMn4Hsi3U8444CdSWNGFJ7Xlu1gbCndz74bS47OG3fLVSkl1C/DDQoZgdHW4JMF7eLCUBpCC6UApoWIbP6hpiRrRi5hcJ+rJBtvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DI1t4fNk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DI1t4fNk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-484362f5c4aso6675460f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940970; x=1789545770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhCyelSoPVv7zgNsnvURqCzMuI51nbjIqRvKAAsNNuQ=;
        b=DI1t4fNk4Y3mtXLg07dg9ja0BMfoSBpUcA2qqgwkfIfO7LiH0Os+Wac3FSXt8vCYgd
         ECT6GEKItbLTkgtzuU5Csoicdsn3B78TVvz6CL4g5vgtRduunu65WTTnfCuHEbo1Iw34
         OyQQJHJOhXxI0si8uty2G+FY9aDIw0N3sHWPI05+EQ9nFBTWKAejtGMmO9hebyHfJMAx
         JyGM7jB/JwInw28tA02IbRxArNsk8Dw1otT5ttR/lNqmTLZGieeqDsD0d3KnCfbyJxAZ
         sDswJDLmsW/sjx7bSYKgYRbENd4BlD+eUyI48+xTtxXBQgl4XO3hsNTWTuFeWZZzUCB8
         TQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940970; x=1789545770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KhCyelSoPVv7zgNsnvURqCzMuI51nbjIqRvKAAsNNuQ=;
        b=PWVN6sPJHrb7LtO6r1++fI+qXBMOlk2buq3lsWnkupGP0o1mbuAmMmOh6/e1mRJCk0
         UpwhTXXwOY2yaMyRvbvZN9VEC20Iw3Nk0cD2CFeUXZPFHy4t13fEL0vZXHcebGXqNceU
         amhUynvPFHYi0ZPgnjI0knVzOVZ0/6D9fefzVS1YHZIG2dFuD4hRnIVbabL537/vz3Rc
         pUqJWNQP5RAeuum7FnFjvQUh1SIngW6QUSpLBFsVnXwHJCeAu4zcLWr2jX7lpgHXxu4t
         F+x+bi5UXL+DqmRBdrzk65YuPwrFjcCmGo/2d/sBp4mBDCAXPucxvsbTRk6khdYMs5SE
         6j3Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5KIqi74kZBxtB39lqvsFa+5bDCdbik/4nkwvISWhmzm830ZaS+kgbCOeURCVf+6kYTt+nOflO13B+kTM=@vger.kernel.org
X-Gm-Message-State: AFuF++nWFIPDGlwJmjNayMUWztmTXJb4Kt02isEJ/PXwXTIcIRX4D0Ex
	WEK5pJIqoBRdku/xXMV/9xtMiorga13bNgK7voxMmhiviLYKP7m1hkvw
X-Gm-Gg: AYBFou2QdNX2obryRwcPqU0j3sSAz+NxTLegFOcbAO3I2fuwm/9+TvsMzFEb2eu92nE
	qceRzAwopIyeZrnt/Rx8p3rlYfuXk3GekfhRoWE95tOOMRGloF+gbsGWi40AGKBG6yqZmYeWHAY
	NjvbeFgiTFihzo/LQ6oUNJBfngJuLOjferE6zTa8SSErAodTS3jAilfTFGmuR8t7ySm7kLNSvBs
	TPFjPkzgvxeBicyLfA3EthSmRVf8n4BuO+LG8RcWnZhoiCr9cNEd1BzO4VZIvSGrEc3Xg3gBQmg
	b9LB8fLFB77aXScBJPQa4q9a4LLlks3exIIcyRw5MhRR+zgXtL0kkK7KQRoFr7d8tXxLwT5ZFIX
	cA35/PQ4NsuIS5yAedc9CrlL5zbuEnudYlkenOctCgyv6AE5eH4YsafPOpMKhAbwRn5ynaE48Xx
	Q3o6WHRXgD3A8UD96tylT1RWxasnJs+/KJZ+kqElQ/mfCXK8lx+Z/D0kuB/4cmLP868e40PwNzf
	on8u4tMAv1h4EYUzUV2RhNe4+K+3zHq76/lo1hRuQ==
X-Received: by 2002:a05:600c:4e94:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49cf81e368emr586908475e9.6.1788940969610;
        Wed, 09 Sep 2026 01:02:49 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.lan ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm412817125e9.3.2026.09.09.01.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:02:49 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	mani@kernel.org,
	michael.riesch@collabora.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/5] media: i2c: mt9m114: Add missing v4l2_subdev_cleanup() calls
Date: Wed,  9 Sep 2026 11:02:25 +0300
Message-ID: <f3340fe13dfc5c331da1444335508fbcc02e0c23.1788940469.git.chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788940469.git.chubuchnyi@gmail.com>
References: <cover.1788940469.git.chubuchnyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev active state allocated by v4l2_subdev_init_finalize() is leaked
on unbind, for both the pixel array and the image flow processor subdev.

Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
---
 drivers/media/i2c/mt9m114.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 848ea06e7..137e8e6df 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1482,6 +1482,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
 
 static void mt9m114_pa_cleanup(struct mt9m114 *sensor)
 {
+	v4l2_subdev_cleanup(&sensor->pa.sd);
 	v4l2_ctrl_handler_free(&sensor->pa.hdl);
 	media_entity_cleanup(&sensor->pa.sd.entity);
 }
@@ -2208,6 +2209,7 @@ static int mt9m114_ifp_init(struct mt9m114 *sensor)
 
 static void mt9m114_ifp_cleanup(struct mt9m114 *sensor)
 {
+	v4l2_subdev_cleanup(&sensor->ifp.sd);
 	v4l2_ctrl_handler_free(&sensor->ifp.hdl);
 	media_entity_cleanup(&sensor->ifp.sd.entity);
 }
-- 
2.43.0

