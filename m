Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F6681724
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371868; cv=none; b=NSfQ9rBrVh0Xmu5BiuY8tzwM4pYLt2YdiUi9qCjkyQmsHwLX0UC4zP67bUoSEiD/hHipiqwVLLvNWQ6JQs2yk5BDzvoHw9CJdgEn0U3QbzTORj/Oo/QSD0oVyEYmeV4JNStbnE6qusTLRrwtW1R8nkpIfot9snaNyhagxiCGQuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371868; c=relaxed/simple;
	bh=JlQzlfvG/TshF3pJvv+Tbn2vc4cKyh7dvxj47tBKU8U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Jgh0S7A8lKXg2gA+q4GsXqe4jZCZbWpajnwBuCOC6lMaI7SYaL7s+SZ9rtTQYsViBAmmSeX0AET62wldzo6+HxqgT0+uXvBbB6aq0Kg0ktetKBK+e6YyrnDqzPuO+Hb2Cc28Run8xdUku9ZKjaC26EkfYQBb7ORwAZs1uVeQ6TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-451d80641efso4685147fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371866; x=1789976666;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6lPdi3zzsVC4MTp1qxIoVnetDbaxxbrgKGcEz0bzRN8=;
        b=MT7z70omkM4ZHlfIsqU/WoSFWa2K2Rm9LSwtItBwebIEGT4SQTJsi6srnGXNMrq9XV
         wr+pZxCpMHjTZgg5Yvd8lzNtmIWZ++uIqCyZ4QCgOdLDNmfE8ABQX5531KxVKIGFvHZS
         4wxHtn6XthlcIhwbpHIoqR5lRGrM7mUtQNnwJ1RQtfj7Uc83C4lo1++/MgqagZjIT/CA
         bt3bLqz65xEh2TyeKPWfwQ+pWq4EuPXlnKDcpCUqUAWgCAt+mYp+xrc5XBy9Vu1j5S1f
         VHoXEwQElT5WQhHl1txeBSCR0lKzTEGRDbTX/oeASgzn/YbFLBJBfZR8QFmmwEBh86jQ
         DjaQ==
X-Gm-Message-State: AFuF++mfXFwcJ3e6kfXBeMmNssD49fXNDoGhewBqi1peRaSBSBQaisRy
	bsC1fJY/ZduazjkbIvxHjrdKbT7DpdcbMcUGq6sHVhdEbyfcbVt6MCR4hooVrOMfyo/vj8+mtW5
	RbyVp4I5R1UusHbMfLojdbZZ93+Bfv4lGe1YuLmVwXy0mrp4rCzwyTNLN3G8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1ca4:b0:6b7:46fa:16ae with SMTP id
 006d021491bc7-6c542a32456mr659571eaf.67.1789371865962; Mon, 14 Sep 2026
 00:44:25 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:44:25 -0700
In-Reply-To: <6aa6a091.f670cee1.72fc4.0012.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7a5d9.f81106d8.2ab401.0047.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Reported-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 680b34a63..bcc32b83c 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1393,7 +1393,11 @@ static int super_90_load(struct md_rdev *rdev, struct md_rdev *refdev, int minor
 		goto abort;
 	}
 
-	if (sb->raid_disks <= 0)
+	/*
+	 * sb->disks[] has only MD_SB_DISKS entries.  A larger raid_disks
+	 * count would later make super_90_sync() index past that array.
+	 */
+	if (sb->raid_disks <= 0 || sb->raid_disks > MD_SB_DISKS)
 		goto abort;
 
 	if (md_csum_fold(calc_sb_csum(sb)) != md_csum_fold(sb->sb_csum)) {
@@ -1607,6 +1611,18 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 	struct md_rdev *rdev2;
 	int next_spare = mddev->raid_disks;
 
+	/*
+	 * A 0.90 superblock has a fixed-size mdp_disk_t array and uses
+	 * raid_disks as both a loop bound and the first spare disk slot.
+	 * Never index sb->disks[] if an invalid raid_disks value reached
+	 * us through any configuration path.
+	 */
+	if (mddev->raid_disks < 0 || mddev->raid_disks > MD_SB_DISKS) {
+		pr_warn("md: %s: invalid raid_disks %d for 0.90 metadata\n",
+			mdname(mddev), mddev->raid_disks);
+		return;
+	}
+
 	/* make rdev->sb match mddev data..
 	 *
 	 * 1/ zero out disks
@@ -4448,8 +4464,19 @@ raid_disks_store(struct mddev *mddev, const char *buf, size_t len)
 		mddev->delta_disks = n - olddisks;
 		mddev->raid_disks = n;
 		mddev->reshape_backwards = (mddev->delta_disks < 0);
-	} else
-		mddev->raid_disks = n;
+	} else {
+		/*
+		 * 0.90 metadata only has room for MD_SB_DISKS descriptors.
+		 * Larger values would make super_90_sync() index beyond
+		 * sb->disks[].
+		 */
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
@@ -7926,6 +7953,18 @@ int md_set_array_info(struct mddev *mddev, struct mdu_array_info_s *info)
 		mddev->ctime         = ktime_get_real_seconds();
 		return 0;
 	}
+
+	/*
+	 * Persistent 0.90 metadata stores disks in sb->disks[MD_SB_DISKS].
+	 * A larger raid_disks count would make super_90_sync() index past
+	 * that array; non-persistent arrays have no such on-disk limit.
+	 */
+	if (info->raid_disks < 0 ||
+	    (!info->not_persistent && info->raid_disks > MD_SB_DISKS)) {
+		pr_warn("md: invalid raid_disks %d\n", info->raid_disks);
+		return -EINVAL;
+	}
+
 	mddev->major_version = MD_MAJOR_VERSION;
 	mddev->minor_version = MD_MINOR_VERSION;
 	mddev->patch_version = MD_PATCHLEVEL_VERSION;
