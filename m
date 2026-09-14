Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EBA38655B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365399; cv=none; b=kfuTFUorPH9JtkqkzapNyLGv/NoHOqJR46Q8QvWjxCMRvbD3BILpIR/vbjz9ncF/lOxA4xRtszQ0EodgHCwh9ju75KSWR9hdPPaTSY7WkVOgw/wW/IQT08S/0tdxUF1p1j3iFjM8cp4YK9hinEJdTUBO28qFd++XMUIs+kN4nL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365399; c=relaxed/simple;
	bh=TpSPkH+SXiJ3GUAtyS7rFYndR00eT9614I4bRCa+GH4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S1mSgHbdgUqAPF6ATzTRAi8ftiWYIMsNSGJZVeZf9Vd+ymIpxfERmbJ2ByfPqeaccKPGzcbzGdJ20V0ByamlD6Hd0kVmts3CxW6rKXPEJr4Kvrm9yEox936TUfRXpIo1XE6/sRMTTtLf7kvzVN1leCjWT+QYtZxECmFoSq1cA2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuwUDlbu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuwUDlbu"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd6665a10fso4839655ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789365386; x=1789970186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bRMmXFSdNXlIVborRjU6mCE3PD/OEqkVPn+DnkXz8F0=;
        b=kuwUDlbuHpjvvJT+x1YwMJxRUk5W2nBsDXlxqN7e8wdoUHV56rf4660vFvMmf2lJiQ
         nqBXmDczQHcVp/jU6dYkrH/0/w9bLBwXowO5oIz2u0Q8Zl6TFa3EtxR8oXs69sfVoHHj
         8yRT+MvfjZrHrICAWabsXV9T1dFSxXu5rZmUGEzhTBSxau5aZN3Gv5GsQeOGAGXFxn30
         oBCYiQ9EWQm2SA8HoUZFfJCEeswX2XcOYkYqaQYFMBjUmRbkS8xngVu9QfA3t0eh3FWk
         RCYMDE1Jw2YEwrbh2LLOZ0XISEHcpm7Dn1orXbGgFWtayMlc5gO/PLBuJEFqfInkk1MC
         3F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365386; x=1789970186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRMmXFSdNXlIVborRjU6mCE3PD/OEqkVPn+DnkXz8F0=;
        b=oN3DdpMJTBmVqvBh3UcCOUSlfiFuqom+HOs+hfemUOoTuOg0QEoLN2JhGK8lBQ1Fpn
         ZONp5opOjTD9bvMTJIlUd57W6HUzHipxP6vOZmxddbpln8SVRWlPrbpz5J/DT0LyfWu4
         UTXvaN79FoFfBtsJx/eU+6/FYy2prH+qncRA3MVz60OxAqBubAOg+5Vbn/bKslzcLZks
         Yl3xwmryrNKF93cc9pNIrM0Mz55X7vRAmfypI+2soL1jhRPCKB05Ngn1/6bUKWJCRNjR
         Y1657kiH3beArm8Bh7exPkOaUpi1Y+xhvJ3XYT667wtlKWdiBX19ll9zzXVt8hzZkUQq
         V7PQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9gj/oVP7tcGBvGcFiv+XJZNUHGBLCNls8X7J2Chz/fQDYy01Sv4xYLdErZG4lC0pEx34f2mkqV8pYuSw=@vger.kernel.org
X-Gm-Message-State: AFuF++kXGvI0ncGN8/NGA+20Q0l+Ao6LIlJ9Be0QGFUzcLgqEzXUtbMG
	qddeVVmPQGTvd6gAsWhr6/0SDxJbp0fuvQZb8OX8NUXoOW093yTF/MaS
X-Gm-Gg: AYBFou1MKzf+lnvfCh2JRNaBQVXI9F56C0DJVDKsgJ2LlzmDMVdRfZqQeqH2ROHi9GZ
	JAGQX0vmz6qiZMtKuUisVcrgVEHtWytefLwvbuqH5Drr1T4wf6Lmg+wP/GbqJARMW5s+u4+knzQ
	+kB2NkGca5YtJJH1J3dDmrOUxHyThjfi0bV3zwcz+m3skxj9KbewgsnFGIJkyxLShLgwdOvFpof
	As10lxmRyrs6ZOwlX+p7W1UWI1+6mstUiTeCmREfN8zrDUj/uW/cdlRhi3EFsnbJsoWOTpbrt/1
	OyxjIx7rmdLgnRzyRn28NqKaZ1yfJd8kNDzTDbK0RKz/wGndmD/PqNNEs391xuPVNM5eqheyhx9
	QyVGZLszy/g99FcXotfQ5WheIJ6kM9/LBmg9roaQdEgKBr4KzetGj61ym9D2WypJQ8BVHR7JQKM
	bbmudr9acIlROb9AuWxd+/6xgyT/XcVmVB1VqLHwDZIpsJlf28ka7H1ZIsY+RFjDv4XpOafrLwO
	zpJosGzhHOMt2lxzIQSbRFJT3H8JIc65zQ=
X-Received: by 2002:a17:902:f644:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2dd6c725048mr27735915ad.15.1789365386312;
        Sun, 13 Sep 2026 22:56:26 -0700 (PDT)
Received: from deepanshu.. ([2405:201:682f:383f:70f2:8a07:cfbd:d0e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd44ad5d5bsm31494665ad.75.2026.09.13.22.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 22:56:25 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io
Cc: magiclinan@didiglobal.com,
	xiao@kernel.org,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com
Subject: [PATCH] md: fix out-of-bounds access to superblock disk array
Date: Mon, 14 Sep 2026 11:26:19 +0530
Message-Id: <20260914055619.32929-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Tested-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com
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
+	    sb->raid_disks > MD_SB_DISKS)
 		goto abort;
 
 	if (md_csum_fold(calc_sb_csum(sb)) != md_csum_fold(sb->sb_csum)) {
@@ -1693,6 +1694,13 @@ static void super_90_sync(struct mddev *mddev, struct md_rdev *rdev)
 			desc_nr = rdev2->raid_disk;
 		else
 			desc_nr = next_spare++;
+
+		if (desc_nr < 0 || desc_nr >= MD_SB_DISKS) {
+			pr_warn("md: %s: desc_nr %d out of range for rdev %pg, skipping\n",
+				mdname(mddev), desc_nr, rdev2->bdev);
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
+	for (i = 0 ; i < mddev->raid_disks && i < MD_SB_DISKS ; i++) {
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

