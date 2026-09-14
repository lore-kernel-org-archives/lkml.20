Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFC93254A9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789357961; cv=none; b=GIF3rnUuD34u4bLJRGxKTcqOvRhza7zlyxpzSIV7USDyv+rg0MhJFM1lfPnE5mVACkEj63acpKn10xT2plKvOeZCQLQL4EPMlIRwCrWZuJO7jOcSTVBugYal5JZwW+nDXN7+xlAYvFem1ajtVjpF1bUtijyVskLunkUW5I/Wd44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789357961; c=relaxed/simple;
	bh=XhZ8fjzfN+7HojE3p+4q6C+JXbpwpZBVX6YbNAEP8Ps=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PUvw6m3z2ZNxsxMLSJJQj9BPpz4DBYIoArVkchMpbKgcDyQeezekDBo+NcVOjUn5wdRy8uELAJog9pyHxom6Cy6IIDGqcy9VuFKlptMTFNpE53KWT+uLqG8Wypp6BKJN3I3Aug1joMflbXYuDzHbfh+2Cr6zTbysk62PcywzEWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1ac969b92so3395592eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789357959; x=1789962759;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KEVDMHUehjNEolcd1AbwbiG8PmN+5zYicGrexK4t2WE=;
        b=bejthD8O/scyc9Myspl9cyMjxf7Rbv8v+XsB/gsbJcLfZBdubYJuS4LWTOHWDs9y8a
         ix5jE6HYYUkO2rlRhkXsmYsD3b3uxQRFXTN8cRNrFP3ADp9GXOPn3stn+0T9XTfH0gls
         pLYQHfEA6tad3/8ueWYTGajkanxGruuhnflrcbNlZvx8oaV1b0HOYhYxykhliYk2Vv9l
         djgRf85+gRGfpCN1SLcRx6WtriSwUWFrKEPG8WPkT3hZZz6VJXJoCtoZwi5Mo4PqYlh9
         mVUoStRtuaoVzt9DiB8Vs9Dekf71A2OhtbmK+S7VrgU/O1MRwmTLcvEmkRbokXa50Vor
         uudQ==
X-Gm-Message-State: AFuF++l+9Foy5FkLvLWQ7EFzXyGzIG8GWbtyE8q1ISyL5c+vUQANAHix
	rEl4uwRTBwXQx2L55Ysrq6BSt/qq/JMFRZOHS3yE6ah+vzniYvgyO1ljwuA2pDHK7Es1NyQkMcl
	SCPXUFo6xWvAR5rKftXqSyjyKAPUz0ahfPuSjL4F0I1H78vDpy3wPAxNPkhk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:607:b0:6ba:a5cd:aac4 with SMTP id
 006d021491bc7-6c542732d5fmr350464eaf.50.1789357959310; Sun, 13 Sep 2026
 20:52:39 -0700 (PDT)
Date: Sun, 13 Sep 2026 20:52:39 -0700
In-Reply-To: <6aa6a091.f670cee1.72fc4.0012.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa76f87.016ef6ab.da411.0007.GAE@google.com>
Subject: Forwarded: [PATCH] md: validate raid_disks against MD_SB_DISKS in super_90_load
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] md: validate raid_disks against MD_SB_DISKS in super_90_load
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


The v0.90 superblock format can only describe MD_SB_DISKS (27) member
disks, but super_90_load() only checks that sb->raid_disks is
positive, not that it fits within this limit.

A crafted/corrupt superblock with an oversized raid_disks value is
accepted and copied into mddev->raid_disks. When the superblock is
later rewritten (e.g. via a write to the rdev 'state' sysfs
attribute), super_90_sync() uses this value to index sb->disks[],
causing an out-of-bounds array access:

  UBSAN: array-index-out-of-bounds in drivers/md/md.c:1697:17
  index 124 is out of range for type 'mdp_disk_t [27]'

Reject superblocks whose raid_disks value cannot be represented by
the v0.90 format at load time, before it is trusted anywhere else.

Reported-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9e3014263a35700ab49b
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/md/md.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 680b34a63cb3..c65da77677bc 100644
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
-- 
2.34.1

