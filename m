Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC143346A5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608523; cv=none; b=Qh2BbwDJBqam8O27DejMx+NalzeFwXWYTZyQpRLyiVTBJik4CkjuA4CtMg399EZFmjL9UWy/oXOycleaov6CU5aqg32TEH+We/DqkfnHHNq9gR5mxywMmrOa7tqQDx+zzqNY4VTRfo+95FtNBUR1SCUomClSTXXVEIdVpUF3Jdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608523; c=relaxed/simple;
	bh=HEzcE1ePHmEpV7Cl+VbOq1FX3oEb3H9KY8DFo4WgptA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Nz3LE8teNtmwTUfpg3qxOl14+OTmAwjoh3DNeugVkGlmqMGanfLVSvOq2eU/60/XuKHKqJHEysYy54ZOs1ghdysQ3X6e6ekzZhJdh5kH/a/m79CNgqtBqe9CSPjc/6BA/BYQ4YlxP87AqCfdWx2r0c+Yc0FrLbfaVwZKJAm32nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c2c5c1f843so332824eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608520; x=1790213320;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iSQSq1SRn/qotWki9H1/9P7EnVIIjjk3znCbl14SWBY=;
        b=f7DI3cVkRjem61ARF5wia269/cWfUgGDsCd9m8T8XM7bfO7pFiIOMMl/Ndiq2iOTgs
         VcUWQi9lMtkYkND0WZrARHhjEoR/Z4K9g3oHubI7bF0LCIC/VencrkJImgGlISj258Kq
         x0RNSnwWy+Kpi+LyhMPMFc8VDZvFUy8ux1kYyFVDh/88DQw0T/hiLKlgy0iYFB47a1Gu
         lWRxmmkYsGXIJlfK2vfma0AZWKOpU0HnZi3Icw2fs5HmazD73Y3Z/rjQk1zFoTvKMdEl
         hwgfrIRkhyVlWIHFuRGbRG7nmUQL58QoSxYEdJBYNNCdLNyUXSvKiotyQcH74jsWxgxn
         b+og==
X-Gm-Message-State: AFuF++nLWpeXAHCWGxVvUunnjFA0iXsQCdzSD8M7fHNG4c4YP2tnAIT8
	E6Ruim21Aat6cbNmnSun5JhzmZPjucOnCBut2KgK049XzcrLJPI824sGKBcmEeFU8A+8QAu4U6q
	gRKyZVeDA8beKyj8mHjJXSorQTufufp9sf4DXlzuuvTg+QD8VQAU5jYfABWs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c93:b0:6c3:b162:46de with SMTP id
 006d021491bc7-6c8fc5c7d50mr1253682eaf.14.1789608520241; Wed, 16 Sep 2026
 18:28:40 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:28:40 -0700
In-Reply-To: <6aa6a091.f670cee1.72fc4.0012.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab4248.71f81b7d.278072.0008.GAE@google.com>
Subject: Forwarded: [PATCH] UBSAN: array-index-out-of-bounds in super_90_sync
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] UBSAN: array-index-out-of-bounds in super_90_sync
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Reported-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 680b34a63..45fcf79b2 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1393,7 +1393,12 @@ static int super_90_load(struct md_rdev *rdev, struct md_rdev *refdev, int minor
 		goto abort;
 	}
 
-	if (sb->raid_disks <= 0)
+	/*
+	 * A 0.90 superblock has only MD_SB_DISKS descriptors, and
+	 * super_90_sync() uses raid_disks as the first free spare slot.
+	 * Reject geometries which cannot be represented safely.
+	 */
+	if (sb->raid_disks <= 0 || sb->raid_disks >= MD_SB_DISKS)
 		goto abort;
 
 	if (md_csum_fold(calc_sb_csum(sb)) != md_csum_fold(sb->sb_csum)) {
@@ -1408,6 +1413,9 @@ static int super_90_load(struct md_rdev *rdev, struct md_rdev *refdev, int minor
 	rdev->badblocks.shift = -1;
 
 	rdev->desc_nr = sb->this_disk.number;
+	/* desc_nr is used as an index into sb->disks[] below and later. */
+	if (rdev->desc_nr < 0 || rdev->desc_nr >= MD_SB_DISKS)
+		goto abort;
 
 	/* not spare disk */
 	if (rdev->desc_nr >= 0 && rdev->desc_nr < MD_SB_DISKS &&
@@ -1487,6 +1495,13 @@ static int super_90_validate(struct mddev *mddev, struct md_rdev *freshest, stru
 	clear_bit(Bitmap_sync, &rdev->flags);
 	clear_bit(WriteMostly, &rdev->flags);
 
+	/* rdev->desc_nr is used to index sb->disks[] below. */
+	if (rdev->desc_nr < 0 || rdev->desc_nr >= MD_SB_DISKS) {
+		pr_warn("md: invalid disk number %d on %pg\n",
+			rdev->desc_nr, rdev->bdev);
+		return -EINVAL;
+	}
+
 	if (mddev->raid_disks == 0) {
 		mddev->major_version = 0;
 		mddev->minor_version = sb->minor_version;
@@ -1575,6 +1590,14 @@ static int super_90_validate(struct mddev *mddev, struct md_rdev *freshest, stru
 
 	desc = sb->disks + rdev->desc_nr;
 
+	/* An active descriptor must not point past sb->disks[]. */
+	if ((desc->state & ((1<<MD_DISK_SYNC) | (1<<MD_DISK_ACTIVE))) &&
+	    desc->raid_disk >= MD_SB_DISKS) {
+		pr_warn("md: invalid raid_disk %u on %pg\n",
+			desc->raid_disk, rdev->bdev);
+		return -EINVAL;
+	}
+
 	if (desc->state & (1<<MD_DISK_FAULTY))
 		set_bit(Faulty, &rdev->flags);
 	else if (desc->state & (1<<MD_DISK_SYNC)) {
@@ -1620,6 +1643,17 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 	int i;
 	int active=0, working=0,failed=0,spare=0,nr_disks=0;
 
+	/*
+	 * A 0.90 superblock has only MD_SB_DISKS descriptors and needs one
+	 * free slot for spares/faulty disks.  Refuse invalid geometry rather
+	 * than indexing sb->disks[] out of bounds.
+	 */
+	if (mddev->raid_disks < 0 || mddev->raid_disks >= MD_SB_DISKS) {
+		pr_warn("md: %s: invalid number of raid disks %d\n",
+			mdname(mddev), mddev->raid_disks);
+		return;
+	}
+
 	rdev->sb_size = MD_SB_BYTES;
 
 	sb = page_address(rdev->sb_page);
@@ -1693,6 +1727,12 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 			desc_nr = rdev2->raid_disk;
 		else
 			desc_nr = next_spare++;
+		/* The slot number must fit in the on-disk descriptor array. */
+		if (desc_nr < 0 || desc_nr >= MD_SB_DISKS) {
+			pr_warn("md: %s: invalid disk descriptor %d\n",
+				mdname(mddev), desc_nr);
+			return;
+		}
 		rdev2->desc_nr = desc_nr;
 		d = &sb->disks[rdev2->desc_nr];
 		nr_disks++;
@@ -4428,6 +4468,20 @@ raid_disks_store(struct mddev *mddev, const char *buf, size_t len)
 	if (err)
 		return err;
 	noio_flags = memalloc_noio_save();
+	/*
+	 * Make sure the new value fits in the selected metadata format.
+	 * A 0.90 superblock has only MD_SB_DISKS descriptors, and
+	 * super_90_sync() uses raid_disks as the first free spare slot.
+	 */
+	if (mddev->max_disks && n >= mddev->max_disks) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
+	if (mddev->persistent && mddev->major_version == 0 &&
+	    n >= MD_SB_DISKS) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
 	if (mddev->pers) {
 		if (n != mddev->raid_disks)
 			err = update_raid_disks(mddev, n);
@@ -7926,6 +7980,17 @@ int md_set_array_info(struct mddev *mddev, struct mdu_array_info_s *info)
 		mddev->ctime         = ktime_get_real_seconds();
 		return 0;
 	}
+	/*
+	 * A persistent 0.90 superblock has only MD_SB_DISKS descriptors, and
+	 * one must stay free for spares/faulty disks.  A larger raid_disks
+	 * value would make super_90_sync() index sb->disks[] out of bounds.
+	 */
+	if (info->raid_disks < 0 ||
+	    (!info->not_persistent && info->raid_disks >= MD_SB_DISKS)) {
+		pr_warn("md: invalid number of raid disks %d\n",
+			info->raid_disks);
+		return -EINVAL;
+	}
 	mddev->major_version = MD_MAJOR_VERSION;
 	mddev->minor_version = MD_MINOR_VERSION;
 	mddev->patch_version = MD_PATCHLEVEL_VERSION;
