Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D61363C48
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788720260; cv=none; b=WTkes087ZmPgC3xrUqmlbm41+1SU5mOZNrzn/ne6PAXSyBOOcTJMJqElIbkQHVpL+g2twU6reh0d/LzxaBXXf9WYUPBixlOUS5inwb+PMFE9BbW7w/lsCTrLRvrIn1K8wC1BQP63WuexqB9NF7RfNRjCDuoV97QNVFCP3NCIXCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788720260; c=relaxed/simple;
	bh=BaNpnanrjgbdSZKgIxI5TIOIZm3kDLtIvvcL+9R7TZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cUeTYERRv7YAcmJhk7snE6NX3yvms3UDF8eCIoNw46mpHPZYckl2/vmFbF9fNRYw/he+epnKaYCP5+cIAMNljXhOovAXD6Vf9Hit25TYukbfEGoAuN/OVsZSI9nSAdKJ7a2JcO+jimw9SrjCEsxbJYeY5CwHixCx+VoXJgJFSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5gU8oRB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5gU8oRB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d9b60c652aso33900605ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788720258; x=1789325058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fATElZat+q7upA4tOibt7iYKQOftj7DVW6WQFIGNTcg=;
        b=m5gU8oRBAuN52eaGGCnQJX/9oA1fNKHojXWzmGMpOf17exQQdwsEFkdA8qWJ8877Kr
         bk50gx/YvFvzxwosdjOwaAl5y0JN698F0OnFcsIGNOJXV5NfxkBz+hTsxpEmef6Vus8W
         eGmnxynb5OOyGy7zgVTas8tRnK3H1WwIa0BEreicBcQqypwQcW7gn51nXFmbEmEmM1Yp
         nVdN0V6oEU+Q3D+o9e0ofH/1yWY4CNsagVbqXLQApYcNDliYpl98dAjmO6NFjvlnzA7F
         aFplzIHFDCBTziuYtx7oBTThcGggQMsWaiY2eH5SKmfNhStLQVnpLJ+6tCct1jeiFnZN
         DfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788720258; x=1789325058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fATElZat+q7upA4tOibt7iYKQOftj7DVW6WQFIGNTcg=;
        b=O+35NAPiUFm7bgHOUo4WuHxCcwZuoEU1INn49OHWmKWeYiB67ACIeHBAUASo/Nvr55
         BragQXJBQLhuN8dsCc45p8tJt4B+lhmoOW8uR3VS4NxOEBCgXklZLXlcarLfxfgFWyZ6
         DQ4kZjkVledLhXCeJunSkEHnuiCxhHBJcuqGNxpJYj8NEHAtyi5MUsGanCbg2Wj0RNEJ
         TpHRdVgUKbPtV4MBkZJgWuMXoasgYLUVheZ7CAW7xN00TkmNuibJE5Q6GMRW1Hjla/2y
         bY13vENamlzOyex8L2eMx6J4cJ8vcIE5KDbAMIRrmcc1hK/L/XzlFt+0SjjnP2mtbYc5
         Mz1w==
X-Forwarded-Encrypted: i=1; AKwUvBxSiLMSUfD1Cm2tQqkoDhe9v+CfcQe/+nIixZNprOz5kArjklto4ECoYIxcSzs86jbD9thpfZMsKqBntcY=@vger.kernel.org
X-Gm-Message-State: AFuF++nOUQoe0YBNgdmqiv5YRPKOMEIt7VvNHGlv0Q5L8RFeYgcSpWwg
	VqeSIVIi2EG9bPCD7YyssyKgaSeYGIuB/P6+DY5CdsCtKe2wX66coF8VE0/0HuIM
X-Gm-Gg: AYBFou1H0y11RZiYgWQkITtOEaiSZO6WSmdHX7ezjre61zn083Y4tGr1gYhmra4jOxq
	/8Y1zB4M6tNl/R5bEX2lXmLqrIatFef4gJjz2LJHYs3GhavyqX130ej5QmKaOQrZ5YOWfWL/FJg
	ETme92+1XmpQYz7z8JHM80JrUmXyPp/fEe62n+r+DapN4EM6zDnCuOwF9a7uySP8Pu80LpakGZh
	sSVaHPGEr+KzqLU01Kxy3u7Sy9SfXVihbuwrrAonhK+yp4fv4mmyFKoUQXsvFeFnWE4Lj1eemke
	ij2/txHOU0Re0rHy3ZMFjHbKImnWlVXun53jftk/Dmm2/rx7Sp7rKmJIvZsT0O8JWUcy/TcfUUZ
	St3LAfNIF54AXPcpAh5t+Jwww6vVtpMBUZx4YHBtYfikh2g3dal2jMY4FeKKbb0/L5KddvrgxRW
	Wz81vYVm6nr9HKRra+lIlSMhE1ZcuYJzeXwYX9+QAire0YH5nCA/aqEBd3deER6JNyqA2NMA==
X-Received: by 2002:a17:90a:e7c2:b0:398:9be8:ea66 with SMTP id 98e67ed59e1d1-39b261da126mr27194570a91.19.1788720257917;
        Sun, 06 Sep 2026 11:44:17 -0700 (PDT)
Received: from TheRealOne ([2409:40e1:15:4732:db5a:76f6:6f7d:3814])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8e0b117sm8219320a91.3.2026.09.06.11.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 11:44:17 -0700 (PDT)
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
Date: Mon,  7 Sep 2026 00:14:06 +0530
Message-ID: <20260906184406.2141-1-chandradhar.2003@gmail.com>
X-Mailer: git-send-email 2.55.0
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

