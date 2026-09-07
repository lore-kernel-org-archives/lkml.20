Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9FE4F052F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787797; cv=none; b=qZtLS+Kbyn619GyVBre5XzoJaRLUhHxcSF+gaSI0tDRq4RKKNPB6xcfiiobkTNhKQ8+t9r8tFMvF8WHBbd7L7HCRIDdVK+Pfe/VePM3NxQ89RC3j9LkaEsaazBgbLfwzIQG98jWY8tEYd6t38PDD/noOESKAXxZNJitceXPxXB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787797; c=relaxed/simple;
	bh=DU09zw/q2QurpiDsBXe0WYUFmSbboztu/xbFyBYnU9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sWqmfBSORe5cMZE53UDqh745wYTbchmLHueOW8On16QH4+xsZDDzw8K4KcAeC8iiJrsHLSUuGf0CNa303qdqzkC8OA3ir7rCIT/4CXN/0ggtJJcxmxyiKq7z4U1IzWsWzaxRVk6H+nXF0CrwBAGQ9Yir3xnE3dWHFbyUMdiJBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcCp65oO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcCp65oO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d5cad1a6baso30326085ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788787792; x=1789392592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LTHmmouueQufOHOv0npHPHbHQCg0ThYyw+cVo5nAdfw=;
        b=ZcCp65oOo9ZAzDjcGPNgQ/lB1KBryJ9vcq28A4/PCoWg1fHm19Pkufpl0mPJuBud3j
         VnxcI8czd93e4ZWdsv29kzlzLjqm20Xe07HJKNRKZmkeyrFjAunhSAfzmQDNRqlM9R2u
         yzAZ8KdFpajBIXmVLUycknZg9GG4QkNGoEdeyWKKUr8UoaFM7zChZLO1g/a5BIsfRnnZ
         5paGBSv3ZC/xMbd7Rtq110s3epdrlAtj2rlQvQbWeqdSlpUBUOA2w4YS0o8svi7n3wNC
         QhJTfvVBtivku6ESJWzoi7EI6P8gVOqR/cIvF7PyZD01XSJZz/wcsd/FK63ehNynAqih
         33gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787792; x=1789392592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTHmmouueQufOHOv0npHPHbHQCg0ThYyw+cVo5nAdfw=;
        b=bPfxjwsC1YfpRJ2XZayaktRlfWIQcaXh88pncBVF0G7SyWcP3Xy1D3qqfIwg8TAjH6
         i39V4VhWZkY4KAtEKd04N2Hgd56IsYuMT+c8ASkBRk8wbVzdrGvlFTq0oHSq+39fP9vW
         JqNGbVWh/UTb865b7E0hfPbUi5sPwmDwFbqgh96lrxHxdG1Hh1SZjp62BDmicKUwMsyX
         l6Snnj7dFSBHb7Mnu/+LH4ZiBZFrJQlaJQI2/ovFjv2AyrKkHHHoRH8Kg4NstVkmYwhj
         fqTu2mzPOLlaq7XVksTEXaGqW2uxpmCM1nyBq6occ1M5s7cLqIPXTbL4P/TmBmf9BZJI
         K6tA==
X-Forwarded-Encrypted: i=1; AKwUvBxoBkOCu60gZdP90K4YSC+PxDh8FHbdMMz2bH7dXGkdLlhJFwlq4RWTUxnHuckJGyx63Xd5j+R9jtb4pQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++koXfXZm5q9OQSUgeu05CQpOqYnfhnx+ilkes8JnO2qGBU+l6in
	G7rtDWW9IGjjo++L38YVA6N7YmSd48DA3n3LzQzdTTvQDokDvvsNmGJf
X-Gm-Gg: AYBFou1TnbPA2Q+YRN/kOTAxcpK5lqstJgW48iat4//aSPx71jlNJxfy0clAUFFNXN0
	5JfluV+/aXBGY/sTNjp8HQPNSzQ2cU/2xVrARwh+Kh97/ui6VWjh7uSVRcihur6EWT98J3SF4KE
	+g/mcu9vIhVaar51Tawddw/RrJ4MLQ9Q+jcz/eNPY0vWB9MX1RNTTSCHaK7HvN7PLqiDUaLiavH
	cEI67axCmpJKY+emHN7Bdwwq7sMDjB016Dfwqd5nSxqwvh74ViwN1stnfmFhFXOncyl5O2oAI+Q
	gnlObRvF8eai/r0fagifq3+xKapIL69KUUSUzu59CNXsukMjU6bXCW0xCHpWe1BApyPii1+3IfA
	GNSwYUe+fzFZdAaX1UGe+pPWel5/cGeT3doIJzsSdk8KTcKNG9yaePqzLFbl1xIfKzZptVWqkh7
	oWXvfkkij46Hfx2o3ZL9VMwJSJ1O+UR8HVS7sLXqnSDN9igU4lYx1P0RbeOqM0Mktoorybu7o=
X-Received: by 2002:a17:903:3810:b0:2d6:3c22:99bf with SMTP id d9443c01a7336-2db124afcefmr356207555ad.9.1788787791874;
        Mon, 07 Sep 2026 06:29:51 -0700 (PDT)
Received: from TheRealOne ([2409:40e1:48a:6453:40cf:4035:e63:363a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499df27sm45871125ad.50.2026.09.07.06.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:29:51 -0700 (PDT)
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io
Cc: magiclinan@didiglobal.com,
	xiao@kernel.org,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+a32ff75e417c0f49a8e9@syzkaller.appspotmail.com,
	Chandradhar Kumar <chandradhar.2003@gmail.com>
Subject: [PATCH v3] md/raid0: validate device count before allocating devlist
Date: Mon,  7 Sep 2026 18:59:36 +0530
Message-ID: <20260907132936.6677-1-chandradhar.2003@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

create_strip_zones() allocates conf->devlist based on mddev->raid_disks
before verifying that number of devices matches raid_disks. Move the
existing device count validation before allocation to reject invalid
configurations before attempting a potentially excessive allocation.

Fixes: 078d1d8e688d ("md/raid0: use kvzalloc/kvfree for strip_zone and devlist allocations")
Reported-by: syzbot+a32ff75e417c0f49a8e9@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=a32ff75e417c0f49a8e9
Signed-off-by: Chandradhar Kumar <chandradhar.2003@gmail.com>
---
v2 -> v3:
- Move the existing device count validation before the allocation
- Add the requested fixes tag

v1: https://lore.kernel.org/all/20260906143928.105165-1-chandradhar.2003@gmail.com/
v2: https://lore.kernel.org/all/20260906184406.2141-1-chandradhar.2003@gmail.com/

 drivers/md/raid0.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 35e103f0c2c3..453e8abda22b 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -79,7 +79,10 @@ static int create_strip_zones(struct mddev *mddev, struct r0conf **private_conf)
 	*private_conf = ERR_PTR(-ENOMEM);
 	if (!conf)
 		return -ENOMEM;
+
+	cnt = 0;
 	rdev_for_each(rdev1, mddev) {
+		cnt++;
 		pr_debug("md/raid0:%s: looking at %pg\n",
 			 mdname(mddev),
 			 rdev1->bdev);
@@ -144,6 +147,14 @@ static int create_strip_zones(struct mddev *mddev, struct r0conf **private_conf)
 	}
 
 	err = -ENOMEM;
+
+	if (cnt != mddev->raid_disks) {
+		pr_warn("md/raid0:%s: too few disks (%d of %d) - aborting!\n",
+			mdname(mddev), cnt, mddev->raid_disks);
+		err = -EINVAL;
+		goto abort;
+	}
+
 	conf->strip_zone = kvzalloc_objs(struct strip_zone, conf->nr_strip_zones);
 	if (!conf->strip_zone)
 		goto abort;
@@ -200,11 +211,6 @@ static int create_strip_zones(struct mddev *mddev, struct r0conf **private_conf)
 			smallest = rdev1;
 		cnt++;
 	}
-	if (cnt != mddev->raid_disks) {
-		pr_warn("md/raid0:%s: too few disks (%d of %d) - aborting!\n",
-			mdname(mddev), cnt, mddev->raid_disks);
-		goto abort;
-	}
 	zone->nb_dev = cnt;
 	zone->zone_end = smallest->sectors * cnt;
 
-- 
2.55.0

