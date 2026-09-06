Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF4B345CAE
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716265; cv=none; b=KiNuaaOrvJ85XCetJa8l5/qiBLCA9rePQyL3TzK+EAQe/WqXcLMnZlEZuVfliGKSWA+aDcaTQ5nIA/GMrPa+pvabR3d+EXiAVg3xSPseQUVK+3FECOg3XMYRLHAHJBypPdRRfYLW2VEyasTVt6A/1v2kTcgp3jHUFSfseLlhNPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716265; c=relaxed/simple;
	bh=BaNpnanrjgbdSZKgIxI5TIOIZm3kDLtIvvcL+9R7TZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0X2XL8eh21KESNMLfZ1SF3RC+DTxRci6qOliD8y1ZZmWDcHZ3Jm9Z64xaz2fxWKtNieQYi5vmWmxXCKJRk5Dch0mgl2Td6bzwO0C98VJWJauLhAEF05kfocZZLSn+Z0r2IlUdeMj2t+0XP6BACjqq/bUdjmi4sVX8YP/PYZ1xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZZTKBFR; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZZTKBFR"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so3395498b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788716260; x=1789321060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fATElZat+q7upA4tOibt7iYKQOftj7DVW6WQFIGNTcg=;
        b=SZZTKBFRAxhI9n/U3xxoxZGfiXf1hkq5qBLxGdqo00hrnJn0M59wFbYXO1gFcrC33G
         oBoKOL5yH1A8x6SRQM96cil+tUrpB3whx7oTCHIOk/kCcXwN3vCeQHhJUBhjwN17VXO4
         48VeO+dOV/7DKAZS4kgAUqwUScBbgt8WFpYeoHsrIjZyJFk4YHI7GNrbqujdkFGo8qdG
         SLbY53ryl/Ymj6clqG4jTuhKnDcNNAkRY3H50Iz/fEM2NEiKgmm/9De8RQbP4bLiNAaI
         yO7exLRywIH8l+IoNJJmeqi/TlZVRQ/iryuLug0ec5cw56jA5s0cexO6AZ6gFGoYHqsB
         lNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788716260; x=1789321060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fATElZat+q7upA4tOibt7iYKQOftj7DVW6WQFIGNTcg=;
        b=THCO+ql+EjuiGo/B3WW82fJBciWAtQ5/61M06T/LbphJYljlRiwvsiLPaB2oYHLmup
         QSvht4L3Ys+6gDQf5saE1qoICWfq3yHo23Ep5gLZZtvDIdOrCW2/gWoEN+/TVXOzahV2
         Jt0iG588Kv7I8qlA7KJ7C1+pY7280sQKAR9D2gd1yNisj+eIB2RMzjqzM8J2vJfxh6HE
         9mOS5A9AkYw47jX4X+2WWVircCDKOddbja2re5g/1szsAhfwv6um8qWIrCPnuGmLB2At
         1Jle7Ar0tmUjyajK14K4O1ftVfLCU0IJ4Ek2FYYFenIn4YtIQjFR9/VmpWuQk3//G2mf
         A4Lg==
X-Forwarded-Encrypted: i=1; AKwUvBzCZDooQjWC+ChpGlmJI3R2kpHXukd9iZQbF1WgafEY8Dvv3jOFal7q96nwm2I749JU5beMOTmoL6WZr3c=@vger.kernel.org
X-Gm-Message-State: AFuF++nbulSD+5n/XHlT8Y2Sf3Yr3/3xfjj2z5nU3EIqD/xFOD6mgI0k
	TCTepDct1g+8Fqgm5ze4SC00CoExai4CwiRWz9V9eVKl3bbzbpdolowUhg9wNVuL
X-Gm-Gg: AYBFou2LFsAYRmbQa2kR+hy6eKteo5pwqBe+y8WUvBepIzfuUcQEVyjQbdCHGKZfmCc
	knpvg0fq56R5j5/h3hwGzSsXiyFm+vVjnn1r5vX83+OR3TRtN2hl/L3ahy6RRmzhGopVCO8bBnn
	TagkATY6W/EMXJIkU0M5Hj5KGRBZXG2ldEPqkvFW7BcuOgiqKy06zxZwG2DsJY5ymwOTXpA3XZJ
	qG2Zi6Hu759eQT6yqvOh8JTk7mbwk0RXpWdgh8J3TQ+aXx2rwvtrLusbbnPSUYy8gnmLItpWx5N
	YIJcoMs+PrxNdGRvcxb+Of+5uqsjJCOHqLYvBWSb6p0pTrfRQZvd0PmrkT4Hc5JwB7zWz36D/lF
	eWtwOk5BA9+9RXWi8Q5wf/xuyNmeTZu+DFm7O+u/goiCpo/Hr+GmFQEPJG3gs0Hv42oObEfXO8P
	8Kq3Vz2njHSCeGAk0llgJeKb+IhlOIZU7cxJp89Zjusw8aXvqaTJd8rKwjg1hzk2OibVyP
X-Received: by 2002:aa7:914d:0:b0:848:8715:c2d9 with SMTP id d2e1a72fcca58-86169676ac8mr27235730b3a.2.1788716259998;
        Sun, 06 Sep 2026 10:37:39 -0700 (PDT)
Received: from TheRealOne ([2409:40e1:42a:44b:2da:f86:5ccf:57e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f873cb6sm3323780b3a.1.2026.09.06.10.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:37:39 -0700 (PDT)
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io,
	linux-raid@vger.kernel.org
Cc: magiclinan@didiglobal.com,
	xiao@kernel.org,
	linux-kernel@vger.kernel.org,
	Chandradhar Kumar <chandradhar.2003@gmail.com>,
	syzbot+a32ff75e417c0f49a8e9@syzkaller.appspotmail.com
Subject: [PATCH v2] md/raid0: validate device count before allocating devlist
Date: Sun,  6 Sep 2026 23:07:23 +0530
Message-ID: <20260906173723.99768-1-chandradhar.2003@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906143928.105165-1-chandradhar.2003@gmail.com>
References: <20260906143928.105165-1-chandradhar.2003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

create_strip_zones() allocates conf->devlist based on mddev->raid_disks
before verifying that enough devices are present. Validate the number of
member devices before allocating devlist to reject invalid
configurations early.

The existing validation later in the function already rejects this
condition, but it occurs after the potentially excessive allocation.

Reported-by: syzbot+a32ff75e417c0f49a8e9@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=a32ff75e417c0f49a8e9
Signed-off-by: Chandradhar Kumar <chandradhar.2003@gmail.com>

v2:
- Reject non-positive raid-disks values, which can bypass the device
  count validation and result in an oversized allocation.
---
 drivers/md/raid0.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 35e103f0c2c3..8eaf078606d6 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -69,7 +69,7 @@ static int create_strip_zones(struct mddev *mddev, struct r0conf **private_conf)
 	sector_t curr_zone_end, sectors;
 	struct md_rdev *smallest, *rdev1, *rdev2, *rdev, **dev;
 	struct strip_zone *zone;
-	int cnt;
+	int cnt, nr_devs;
 	struct r0conf *conf = kzalloc_obj(*conf);
 	unsigned int blksize = 512;
 
@@ -79,7 +79,10 @@ static int create_strip_zones(struct mddev *mddev, struct r0conf **private_conf)
 	*private_conf = ERR_PTR(-ENOMEM);
 	if (!conf)
 		return -ENOMEM;
+
+	nr_devs = 0;
 	rdev_for_each(rdev1, mddev) {
+		nr_devs++;
 		pr_debug("md/raid0:%s: looking at %pg\n",
 			 mdname(mddev),
 			 rdev1->bdev);
@@ -144,6 +147,21 @@ static int create_strip_zones(struct mddev *mddev, struct r0conf **private_conf)
 	}
 
 	err = -ENOMEM;
+
+	if (mddev->raid_disks <= 0) {
+		pr_warn("md/raid0:%s: invalid number of disks %d - aborting!\n",
+			mdname(mddev), mddev->raid_disks);
+		err = -EINVAL;
+		goto abort;
+	}
+
+	if (nr_devs < mddev->raid_disks) {
+		pr_warn("md/raid0:%s: too few disks (%d of %d) - aborting!\n",
+			mdname(mddev), nr_devs, mddev->raid_disks);
+		err = -EINVAL;
+		goto abort;
+	}
+
 	conf->strip_zone = kvzalloc_objs(struct strip_zone, conf->nr_strip_zones);
 	if (!conf->strip_zone)
 		goto abort;
-- 
2.55.0

