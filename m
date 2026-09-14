Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B03BB57
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789359766; cv=none; b=uEnEHWp0uxj7wtExNYvZBm4AXIqXTegwqioUEvWJmXcWCfaY25+0h/7sB76eWWbjaPKiXqHGin8wId8cvuBbabBTLLnJuMFyKnEAiS6QSjDnW821ajy2B24nZFhuYocpwrv3fONmRk4dRqWhsIqfGf9PGXy4D4vW6saDU6CXvzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789359766; c=relaxed/simple;
	bh=0czlBDzVIt2DNM6YOGngtMEagXOXrl76OK/9O0N7wvE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jtj3LdzxF98Srod6cJKRg54fygEp+MEShrdG7LB35u3tHYH4PrNOAJKKynfMgy2XHqdUSaZzNvIKZA/iJkAaMxGqEpIuD5BiOsvol4+Y0Ivo4mIrQcrJP0fa8QvIIt7hr61ixiTcJqYzSVYZ7bqYH+Xp5a8IdWySK4ITpThZpmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1413d9c19so3023057eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789359763; x=1789964563;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZjHl3JNTHV7/S0aK5Y5nOSrRbhb7VT7zZjMDL0N7u/E=;
        b=jvqNDB02GP6dH2XFeoR3tVT/9CLHfAqd+eBJ7F4vZplEMAzGzi0qg73L0N4hBjG3vL
         1j4LmB6hqTKyhrvA8QmKWyioE/7pPQ5tB6xa0ujZijnSxN4A82bLWnmf8aPMD4LMTVUW
         WUAwnEE5MECdiMzQCblAebPwmaFOlzW4cVjB4l9p/6F4RgX6TeOGmRD+/dGCOSIxNh+V
         AWMrGYf4OgR54drCXp8Wg8p06kQ/TBJMr68J1mLlekjBVudRPV1xiZwAZxgIcTWlVv7q
         KEDtHdISpAZDFKuMrm7V4EJB4gQc20WUvbLtLXEi0jmOTAlPEBdTj79XbGyOjnpnSawj
         lxtw==
X-Gm-Message-State: AFuF++nBhtE77p4SdRkMr2KvI3vwfwIMFj06YbvA+x9BqaIztefYXXZF
	qYQq0FHzyvb1VQKV+RQMrCiQxRauPSXFd65Hhqmo9GrhatYn7MPw0U2CJwmVcG5XAal60droZ1Q
	xroRCPFlv//E01SiVMrs2Fp0k3OBqfoFU4M2ZD68b6bejJ04Z8scK7GITc2w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:169e:b0:6aa:cce3:ab61 with SMTP id
 006d021491bc7-6c53f555385mr627701eaf.9.1789359763619; Sun, 13 Sep 2026
 21:22:43 -0700 (PDT)
Date: Sun, 13 Sep 2026 21:22:43 -0700
In-Reply-To: <6aa6a091.f670cee1.72fc4.0012.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa77693.3aa11909.1a03b8.0058.GAE@google.com>
Subject: Forwarded: [PATCH] md: fix out-of-bounds access to superblock disk array
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] md: fix out-of-bounds access to superblock disk array
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



The v0.90 superblock format can only describe MD_SB_DISKS (27) member
disks, but several places did not enforce this limit, allowing an
out-of-bounds access to sb->disks[]:

 1. super_90_load() only checked that sb->raid_disks was positive,
    not that it fit within MD_SB_DISKS. A crafted superblock with an
    oversized raid_disks value was accepted into mddev->raid_disks.

 2. super_90_sync() computed desc_nr from rdev2->raid_disk or a
    running spare counter without checking it stayed within bounds
    before indexing sb->disks[desc_nr].

 3. super_90_sync() also indexed sb->disks[rdev->desc_nr] for
    sb->this_disk without any bounds check.

 4. The "missing devices" loop in super_90_sync() iterated up to
    mddev->raid_disks with no per-iteration bound on sb->disks[].

Any of these could be reached with a bad raid_disks/desc_nr value
and cause an out-of-bounds array access:

  UBSAN: array-index-out-of-bounds in drivers/md/md.c:1697:17
  index 124 is out of range for type 'mdp_disk_t [27]'

Validate raid_disks at load time, and add bounds checks at each
point sb->disks[] is indexed as defense in depth.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9e3014263a35700ab49b
Assisted-by: Claude
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/md/md.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 680b34a63cb3..f950e6fd144c 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1393,7 +1393,8 @@ static int super_90_load(struct md_rdev *rdev, struct md_rdev *refdev, int minor
 		goto abort;
 	}
 
-	if (sb->raid_disks <= 0)
+	if (sb->raid_disks <= 0 ||
+            sb->raid_disks > MD_SB_DISKS)
 		goto abort;
 
 	if (md_csum_fold(calc_sb_csum(sb)) != md_csum_fold(sb->sb_csum)) {
@@ -1693,6 +1694,13 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 			desc_nr = rdev2->raid_disk;
 		else
 			desc_nr = next_spare++;
+
+		if (desc_nr < 0 || desc_nr >= MD_SB_DISKS) {
+			pr_warn("md: %s: desc_nr %d out of range for rdev %pg, skipping\n",
+			        mdname(mddev), desc_nr, rdev2->bdev);
+			continue;
+		}
+
 		rdev2->desc_nr = desc_nr;
 		d = &sb->disks[rdev2->desc_nr];
 		nr_disks++;
@@ -1722,7 +1730,7 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 			d->state |= (1<<MD_DISK_FAILFAST);
 	}
 	/* now set the "removed" and "faulty" bits on any missing devices */
-	for (i=0 ; i < mddev->raid_disks ; i++) {
+	for (i=0 ; i < mddev->raid_disks && i < MD_SB_DISKS ; i++) {
 		mdp_disk_t *d = &sb->disks[i];
 		if (d->state == 0 && d->number == 0) {
 			d->number = i;
@@ -1737,8 +1745,11 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 	sb->working_disks = working;
 	sb->failed_disks = failed;
 	sb->spare_disks = spare;
-
-	sb->this_disk = sb->disks[rdev->desc_nr];
+	if (rdev->desc_nr >= 0 && rdev->desc_nr < MD_SB_DISKS)
+		sb->this_disk = sb->disks[rdev->desc_nr];
+	else
+		pr_warn("md: %s: rdev desc_nr %d out of range, this_disk not set\n",
+			mdname(mddev), rdev->desc_nr);
 	sb->sb_csum = calc_sb_csum(sb);
 }
 
-- 
2.34.1

