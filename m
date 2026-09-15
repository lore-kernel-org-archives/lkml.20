Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9D6265621
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467853; cv=none; b=DHjuDgbp/hx5jvCFnyWNT8mI91qyj+LmIZ6K1mxjYKlVzZPLHYFEKzVvJ/H+UTKEj3o7UBK8RdIJiyO0+tvAV0/9frkCks1WsvxKoz9lQgkXP1jra7qSUVZyG5i4LSfji3DLz/BwF7qAypNjsKAZykvmr71zHNpdHXHk/84L/KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467853; c=relaxed/simple;
	bh=aUd/36u9Kwweuoo+yiuuPIsVEFuXttHoFaao8krgvyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gjWg9s/nV+AoFoejJc6GHBaCcaQ/WraqIXk0sGsXlNV6hqk92XBTtEVy656Ex/xR2pjvpnpNz6EGd4sHE79SJDM12afDk6zg/WL5CyHli9Gbja9A1lAVU7KuIxNnpBP1x7FGz7SXSpNisv452j0oZOpOpDDVMsBd8O/5+XUe4Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ON8QmcBl; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ON8QmcBl"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db18fe433fso20954925ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467852; x=1790072652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KHU2z1i2cZYO9dBeMlbgbmxMWFY6UEr2eGRAYUrBz5g=;
        b=ON8QmcBlpEHd0vDamaI+Am2/83dvPR5rQo4864t8LA0PSbFehKFA5mEiS7q1u/xOzP
         KVhRRtDEuyplshrgU6O8RI6i1mmz9YKSAi2eV/tEpH0WsA3q9a1Oxfqkl2/So15xA25Q
         dtx0SNJTI2LSV8u73XNUSsOmjzGUH5KthJhUagGAvWKG4kAHCIdkjmL4UnpAWas1DLuN
         8UlfZM7kfBBwZRlmPTfGZ7jRwHvoqQbx1YCdp2UyLHRajudWptHoK+xMJNxxxjf2KMYv
         UlRa9u4MkFSRnx0fNsU66XahGxBNZ2IITvTdDc06yb1rue9CoDWuHWJZpCtcIuOSiTpt
         G9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467852; x=1790072652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHU2z1i2cZYO9dBeMlbgbmxMWFY6UEr2eGRAYUrBz5g=;
        b=OgsCyVXjFo5DdTll1UpgvUSO2XD7fGBpcs9wDyQZ+BmVqL6mWa7bZctQna4reRZWCA
         0/hi0xqUXiemAvdxgt9S1NWwKNSB6GVU23DCADoKvhDJakiQUGBeDXZIqZbHUdxpYnIK
         JzL3iaJg6ws4XploPM7bMne8ziOW2VGDU9F+oobl7m7icSlOyRnpNfHwVYxmXbfJFLGt
         kax4e2Hti7jNgQmUpX/gz+Ot68u4YZc1Qvb5/7f+feAW6gVtrchPDUOWIfRLiZsZJIqb
         a5Xfi2fNEoOYx/zsMNpTsf6Usp9BYpsnbgUQWTh4ZIrFoavCuRK231ox2m63XbN+bew3
         +xWw==
X-Forwarded-Encrypted: i=1; AKwUvBzAWsiodpwZQHUY7bgRL1dRQqEB/AiZQUd42zm65Vk11i8RaL9mk8aNSjhpFIbdJ3JhYiMRF2mACb24yi0=@vger.kernel.org
X-Gm-Message-State: AFuF++kLb0mNq0RVICBywTU3S/Y9BhuKu3/EHCWZe/ADHeI1C3teSe24
	/T31Giv6puPafYPO4kRpymnCy2RKTTcrZ3xsa5uFL4yz9tdr1PSwVpLF
X-Gm-Gg: AYBFou18ZztX6uth0gDhT3w+2bpYajRLAMQ+0al42Guz6ZOkqq6u87GdymDlsf9+G1M
	FmYXXVJZGsY6I7d5i5OXNJxqBX6s71gaW2N8a+ajndLRpvhuuA2G1Amzg4B2dJ8yiOLdAnuQ/Mq
	TMsk/cNHwuFbMUfRwV1d2JHpz/guV51FHT7uxciY62NE/6RG9bYVL3vfa4sucM4BxX8r4IMEnrI
	ZzHBEh+8DQ8UuBamGZMbkYIyV1z1fkQBP3L3xb9/DiQzAk+yz/PZ5OyFb0vMp1u82Nku9uO87KJ
	Fb/Expvc+c3WHBOLjwqsxf0S8RX9jg8NSt3Kmlxajt5dtdkjPksYaexD3JO5cYDmI374lioXNOe
	NFu1UddVBheC+P51SRC/dSaihIBHB7Ub6H4907MkqzGC57tyHK8YP+DJwcEltnOTtCO/2w8uPEG
	KgxhnFBK2d4JgI9WuHen1I/fkK2sCl3rSIbUmNuT4b3xsodMQiKqmSag==
X-Received: by 2002:a17:903:1a0c:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2dd6c5ba2f0mr137031705ad.5.1789467851583;
        Tue, 15 Sep 2026 03:24:11 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd76fc2c54sm10370225ad.72.2026.09.15.03.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:24:11 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: vgxy61: free control handler on remove
Date: Tue, 15 Sep 2026 18:24:02 +0800
Message-ID: <20260915102402.2357813-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vgxy61_init_controls() initializes a V4L2 control handler and assigns
it to the subdevice. The probe failure paths release the handler with
v4l2_ctrl_handler_free(), but the remove path does not perform the
corresponding cleanup.

As a result, removing the driver after a successful probe leaks the
resources allocated for the V4L2 controls.

Free the control handler during remove. Do so before destroying the
sensor mutex, which is also used as the control handler lock, matching
the cleanup order used by the probe failure path.

This issue was found by manual code inspection.

Fixes: 153e4ad44d605 ("media: i2c: Add driver for ST VGXY61 camera sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/vgxy61.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
index 3fb2166c81ef..553ab5a2e265 100644
--- a/drivers/media/i2c/vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -1876,8 +1876,9 @@ static void vgxy61_remove(struct i2c_client *client)
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
 
 	v4l2_async_unregister_subdev(&sensor->sd);
-	mutex_destroy(&sensor->lock);
 	media_entity_cleanup(&sensor->sd.entity);
+	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
+	mutex_destroy(&sensor->lock);
 
 	pm_runtime_disable(&client->dev);
 	if (!pm_runtime_status_suspended(&client->dev))
-- 
2.43.0

