Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583407;
	b=LYXhxRN8aOqCtac9Tfw2FEzDdVCkcTQXg6lr7vseGlKBvEb3TlrgiU3j4EF58V7bKE+F
	 7RSsV2hjPDnbqznk22qF5l+9mS44lIgocWiCOV9k3K40hBKt9Q3PIECm4PCaGRPuj8FpZ
	 dByRmBUGW+FLcXCoxjpvWqcO/3n3+jYY3A0Xp004Lf+pXTL1rccsM5/wqJWpA561TR4GN
	 ghtGtaVDQzQyJ47enEOSZbHCofsthg7wxozqXSfkkGs6R60gevBuaDJ4aVLtWJ09v58jJ
	 V2gjQEgb2cPqBtcrjkvfxINr9fRStC3GZeWl+D2t1ObQMmIbqUHI7pMNCDp7or2AYlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RqLckU7nN78voUlSDboIzDrjLsWYkhwAdW5s+a1Lqt0=;
	b=Aap8ZbNco9dohsBTu+qyocKKLNaHmMHWYNhkufcEiHyQaOEL3a5i2EahM2VmdHc1GKp0
	 +7EvfBo3L3QZZrU9Y9WZ3sRmpQpmP/TmgpLmR1Kr6YQTQhDWCtHF2ZPT09zJMpaLA3noZ
	 bUyOd86wqxbvRzV/yxJpzXM7nrGIb7ewRZIePV73u4NzNB+ZjgK+PZaEdKsQM4rdF59Kf
	 0xwume3UWmobtKSFL4l0d7hv+CZm5PajL0EQVsG7rKJcBlnC/3NFAxD2B12RK0rYThzhK
	 2/QdmcBaMyuhBrG9n59MsxYx5MzNV4y/s2ItFuMWVC/B7e2Be8c+gYWTFUIDvV+AjQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yzX3sPbJ;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8E606A882
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE8E606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yzX3sPbJ
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-89d6bd67045so569299b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794583406; x=1795188206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RqLckU7nN78voUlSDboIzDrjLsWYkhwAdW5s+a1Lqt0=;
        b=yzX3sPbJCANvdXtLj6W30PbV0dvpSA0aPe3pLayNmMXzRyVe4P1F6clE66E8bEQUIe
         xeDQZ2oxamDa1tGDsvREKJLWcRynW8hhLKsWGo9FQAWC9LpCIui9Z61b7D5HywOg9ZKH
         2EV1CYkCnXjEoRc/rVwMZak0CW1HR9VuTDgSnHRFcGmivD418TclfxZ9s2Lso7c7ctnd
         C75BGeAVlkLovQgUvRQFljuITJOPUDjgursRLB5gJpP1xybeLSZXKw2qt5/85BBWibbh
         BH0wtoGJGRI+5MDm9ZghblL59T3S4EHbaWvvfkJzdlX7YCjn30chBYxeXsS59CElOmWK
         3Ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583406; x=1795188206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqLckU7nN78voUlSDboIzDrjLsWYkhwAdW5s+a1Lqt0=;
        b=BrbCnq5VTJILXgGOSCnQEB1n2fQKbuHbNgQjRDbzV2uLZbAz3VPfSJCRPQbbGR+K8u
         rNA+HwHSp/9kU9mAVCpugEc1sPgGe76z1IX9JOddVBYol6kgTnbf0+ado+DOIxA74ywe
         /wDgBWedCjwjgtsTD1WH1qfOEi1M93FxM6vxDGY93uUYENZY20hHm7zMjgqqLfiWRI28
         VVx1X8JCDdyuZWO4QVBEaN3E9lRPXRldmoyKR76tUghrFB/UswXfQC2Yf7RLWS/0dJf8
         Y3ZDwG5+8MHt4sX9AxhtWlvm8N3RiBL8CNlKiLUSRU505Thul5rXpbrvwB4kUR4pnmXP
         nbrg==
X-Forwarded-Encrypted: i=1; AL+hErHt3UA66jmRPeJFqi+y/HrP+/tA1AnP2XDlbSbM6VibnHYXJjq0zYmuqSrSM0EgtwCTH3YGsBJAHEyVe3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KZjldcUw1KXlkldfwOkr+d7zprvJLhOoZwxv0ubiKSbj8MM3X
	c0ev21vF4oCjRuk5MftCg8k8iScnNlAiH0ZiDGSK/Kp2jYTz6FJ+ci5K
X-Gm-Gg: AYBFou39jewEMziKK9yMUF964M2pA4QOIQCzp29pS9d8f+HMbdM0L3IPR0aUacF9NXg
	2IWTFrMmekyzbxWPpKOG3NNsLi/SYhcFZ49EaueWr82yPCWAsiMiX8y2R06qjMKBIKXRtjSm8ir
	JzcJshrswYNTDSrEQXeBYjD24+hneRFT2DBG7di1JwaSOH8OX89ksMTELYIXfLw/0XGWoWZLBp1
	MXzWKe300tJTD/Y9880mV204P+pv5TJBkZXkuiJH+X0XkDH1hxbeZ7jL+Y23fRnjdmVjKMH+LLO
	ipa3AQO7NJHaVGV7uCtZ8WyDOkEchysd994XI+T+BD7flaa10ErgUpnVkX+G7ngfb8B8yhGM8wl
	xWqghczVv+hVS57137MxxzZa6WH1s4rLK3pWYN8FcZXJoYr/evuyVuqHCIxXSnsr1xlGO1o6uz5
	Wtp2aEtpuQTrKT7Ndt8C4L5LvdtE4lwDW/pZ4ljQ7ZPBjc/CBwTbVNhJLXD8G98ZUOvJfKn/OmB
	OXhmhTJhqOnVnpynB+ndFasSMZWnXsXyeALSi1S2JSKD8asN2PGG5SR0o05aZXiX8oTO4m1bCbT
	tck6HKkv86Hsl6dq48HQ9xWx4PW4AAgHLh0bHtGhwbDz
X-Received: by 2002:a05:6a00:2d25:b0:881:e266:c3d8 with SMTP id d2e1a72fcca58-8bd62ce86b2mr4470413b3a.35.1794583406301;
        Fri, 13 Nov 2026 07:23:26 -0800 (PST)
Received: from TheRealOne ([2409:40e1:18:d372:a07a:dba1:7b75:ec2e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2635285sm1343994b3a.44.2026.11.13.07.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:23:25 -0800 (PST)
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>,
	Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Chandradhar Kumar <chandradhar.2003@gmail.com>,
	syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com
Subject: [PATCH] md: enforce MD_SB_DISKS bounds across v0.90 superblock paths
Date: Fri, 13 Nov 2026 20:53:04 +0530
Message-ID: <20261113152311.13949-1-chandradhar.2003@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The legacy v0.90 superblock format (mdp_super_t) embeds a fixed-size
array of MD_SB_DISKS (27) disk descriptors (sb->disks[27]). Currently,
several configuration and metadata load paths fail to enforce this
upper bound, allowing mddev->raid_disks, rdev->raid_disk, or
rdev->desc_nr to exceed MD_SB_DISKS - 1 and trigger an out-of-bounds
array access in super_90_sync():

  UBSAN: array-index-out-of-bounds in drivers/md/md.c:1740:29
  index 124 is out of range for type 'mdp_disk_t [27]'

Fix this across all entry points and harden super_90_sync():

1. In super_90_load(), reject superblocks with sb->raid_disks >
   MD_SB_DISKS or an out-of-bounds sb->this_disk.number. Validating
   this_disk.number also prevents an out-of-bounds read in
   super_90_validate() when indexing sb->disks[rdev->desc_nr].
2. In raid_disks_store(), slot_store(), and md_set_array_info(),
   reject disk counts or slot indices >= MD_SB_DISKS for persistent
   v0.90 arrays even before mddev->max_disks is populated.
3. In super_90_sync(), reset rdev2->desc_nr = -1 prior to bounds
   checking so that if an excess spare exceeds MD_SB_DISKS, skipping
   it does not leave a stale desc_nr that later corrupts sb->this_disk.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9e3014263a35700ab49b
Signed-off-by: Chandradhar Kumar <chandradhar.2003@gmail.com>
---
 drivers/md/md.c | 46 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 03e35386a802..a72f98cdad54 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1407,7 +1407,9 @@ static int super_90_load(struct md_rdev *rdev, struct md_rdev *refdev, int minor
 		goto abort;
 	}
 
-	if (sb->raid_disks <= 0 || sb->raid_disks > MD_SB_DISKS)
+	if (sb->raid_disks <= 0 || sb->raid_disks > MD_SB_DISKS ||
+	    sb->this_disk.number < 0 ||
+	    sb->this_disk.number >= MD_SB_DISKS)
 		goto abort;
 
 	if (md_csum_fold(calc_sb_csum(sb)) != md_csum_fold(sb->sb_csum)) {
@@ -1621,6 +1623,10 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 	struct md_rdev *rdev2;
 	int next_spare = mddev->raid_disks;
 
+	if (WARN_ON_ONCE(mddev->raid_disks <= 0 ||
+	    mddev->raid_disks > MD_SB_DISKS))
+		return;
+
 	/* make rdev->sb match mddev data..
 	 *
 	 * 1/ zero out disks
@@ -1693,6 +1699,8 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 		int desc_nr;
 		int is_active = test_bit(In_sync, &rdev2->flags);
 
+		rdev2->desc_nr = -1;
+
 		if (rdev2->raid_disk >= 0 &&
 		    sb->minor_version >= 91)
 			/* we have nowhere to store the recovery_offset,
@@ -1707,6 +1715,12 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 			desc_nr = rdev2->raid_disk;
 		else
 			desc_nr = next_spare++;
+
+		if (desc_nr < 0 || desc_nr >= MD_SB_DISKS) {
+			pr_warn("md: %s: desc_nr %d out of range for rdev %pg, skipping",
+				mdname(mddev), desc_nr, rdev2->bdev);
+			continue;
+		}
 		rdev2->desc_nr = desc_nr;
 		d = &sb->disks[rdev2->desc_nr];
 		nr_disks++;
@@ -1736,7 +1750,7 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 			d->state |= (1<<MD_DISK_FAILFAST);
 	}
 	/* now set the "removed" and "faulty" bits on any missing devices */
-	for (i=0 ; i < mddev->raid_disks ; i++) {
+	for (i = 0 ; i < mddev->raid_disks && i < MD_SB_DISKS; i++) {
 		mdp_disk_t *d = &sb->disks[i];
 		if (d->state == 0 && d->number == 0) {
 			d->number = i;
@@ -1752,7 +1766,10 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 	sb->failed_disks = failed;
 	sb->spare_disks = spare;
 
-	sb->this_disk = sb->disks[rdev->desc_nr];
+	if (rdev->desc_nr >= 0 && rdev->desc_nr < MD_SB_DISKS)
+		sb->this_disk = sb->disks[rdev->desc_nr];
+	else
+		memset(&sb->this_disk, 0, sizeof(sb->this_disk));
 	sb->sb_csum = calc_sb_csum(sb);
 }
 
@@ -3374,6 +3391,10 @@ slot_store(struct md_rdev *rdev, const char *buf, size_t len)
 		if (slot >= rdev->mddev->raid_disks &&
 		    slot >= rdev->mddev->raid_disks + rdev->mddev->delta_disks)
 			return -ENOSPC;
+		if (rdev->mddev->persistent &&
+		    rdev->mddev->major_version == 0 &&
+		    slot >= MD_SB_DISKS)
+			return -ENOSPC;
 		rdev->raid_disk = slot;
 		/* assume it is working */
 		clear_bit(Faulty, &rdev->flags);
@@ -4462,8 +4483,14 @@ raid_disks_store(struct mddev *mddev, const char *buf, size_t len)
 		mddev->delta_disks = n - olddisks;
 		mddev->raid_disks = n;
 		mddev->reshape_backwards = (mddev->delta_disks < 0);
-	} else
-		mddev->raid_disks = n;
+	} else {
+		if ((mddev->persistent && mddev->major_version == 0 &&
+		     n > MD_SB_DISKS) ||
+		    (mddev->max_disks && n > mddev->max_disks))
+			err = -EINVAL;
+		else
+			mddev->raid_disks = n;
+	}
 out_unlock:
 	memalloc_noio_restore(noio_flags);
 	mddev_unlock_and_resume(mddev);
@@ -7951,6 +7978,15 @@ int md_set_array_info(struct mddev *mddev, struct mdu_array_info_s *info)
 		mddev->ctime         = ktime_get_real_seconds();
 		return 0;
 	}
+
+	if (info->raid_disks < 0 ||
+	    (!info->not_persistent && info->major_version == 0 &&
+	     info->raid_disks > MD_SB_DISKS)) {
+		pr_warn("md: %s: invalid raid_disks %d for v0.90 superblock\n",
+			mdname(mddev), info->raid_disks);
+		return -EINVAL;
+	}
+
 	mddev->major_version = MD_MAJOR_VERSION;
 	mddev->minor_version = MD_MINOR_VERSION;
 	mddev->patch_version = MD_PATCHLEVEL_VERSION;
-- 
2.56.0

