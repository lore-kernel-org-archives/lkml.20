Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC8A5111BB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750532; cv=none; b=nf8uq0HoWdBqfSsUPZp6QQVJonaf/YFOrUtdSqA+kiTp1vByB08++ANuTdJJT+LnK0nfKR5BgWm/HQVOlJfifpsAqLqbH95BuBOAF3c6hXpYknsCvKldUvDYiES+aP+eBFHOjt+keYMFXWFJ0Pv6EIKsBDGN1iI7WCD6qAJc3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750532; c=relaxed/simple;
	bh=OhY3w79Xo/cmM/8Ycq76W3093cbunKYPDuQ9CGZmfIM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XTsCsOdxmjE06Owofz4pLjUxVccaY/lwkxFrC3MokS2ywSMt3dR4eUKKUB95bkqVEmytBa7D2u5YQxqK2e/R6iisbG9XwLxwat/a0nwXdWgwI5NQ2BN8Mxkycjd2vPSLk4oCn8RpgrlfeQ3dgE/vzXWNsMyABjpHt80i+Emzyo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kf4lyoh6; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kf4lyoh6"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f066d8so3485285ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750529; x=1790355329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjJplJ4znQm9GNj31Qhyhiop9ZBBKbv4OXShDDwM5fk=;
        b=Kf4lyoh6QsuGAQZ6P05vvWw6lMOe00B0XWR4lD6+Dr1FQPxQRuHkDSYJpNjhzDyIaN
         QWEoJC1sM/mWEi2SbJ/0f2DZk5Ww2O8wT1+tF/Z1JriL/zuOsHUu9jgT6nA0b6BG9Lx1
         NdI6lxzN6zHkdubTsIAUi1o9wvaoe4VI8zqEmH30mBJRTHsjDDCKSVH+spZlelYpHRa7
         a82oN7pVAyddN9SZYX2lQDABfazJUfF9MLLQDmIwfn+yCQ6dDutGAYp7c/Rue+RrjbJJ
         yGxZh5Xoqrxf4B9Lw0dbKw7/6iKJCHtaYor+bA3YRH5KRcNHOkzDMn8fUW9XozKDGi4Y
         TjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750529; x=1790355329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjJplJ4znQm9GNj31Qhyhiop9ZBBKbv4OXShDDwM5fk=;
        b=Nqj2NXHjt/uTfvW8Q5FRZfe7/T5dX9Gk4r4Xv+V7e2+eHcXU9H7Mi6OPXPH1X8Vj0h
         x4MNFBdp8CUePthyHBJRn3tfHnyCCWt+CF4O7ss1Emktrn9i33xySph5Lm6TOhZiU23A
         1Hr0H1fvq14Grt5TmKZTeGqlpu3ve5m8MHJsqN/cRaUx5+L99tuvaUzruI9IiIm4XiB2
         +VeAfdF0Ybti5ku/2jDQZDI2Km8lj3lUSEZe8qwPrPDu0t3TgIqSiyAW5x6+WQA+riqh
         UTByLhVSmVpERNY3I6t7zhB173taJN0v4aaSWt3ipsKs9W+CqnyFlUHzMMkySKiT+ew4
         3Opw==
X-Forwarded-Encrypted: i=1; AKwUvBxaSrO7h1lsxS6W/s7Ki80e99kC7L/3Gw3AXJxwWssUI4dEwFwfCWx9NyYFAvuvjLgXQJ4cp8kSBEv6cWs=@vger.kernel.org
X-Gm-Message-State: AFuF++m/rPOXWbphYCOgzcpweep9rT710FT934/2Sxe3sH8QakHdSIHb
	sKDlP8qKmW709Q3YLZpRjRpfypoY/9/Rdt8NxgMtoeytviV087V+tLy7
X-Gm-Gg: AYBFou2sbHQxN/wUq1wliGDv3KnwInJL39eQzO8FN+0ynXof9ZlLr8vjlAE+Nm9ACSq
	zlxe+RHjbPWeJ0VFQKITqTGKL4je2l+MrimZn1Dg9AZPV2vjJs+0CikjdWWiuf7h8VRKDkeqOLx
	ozYZN3Z1OHHt94eFbGfHcEBQQfUvvU2xH9W6v2oM6t67kvUG5KGSoKHY8JcreXZGTSkGRLbRb/p
	g3KCQ/DGBJLa49tmRadyes29APhSxus1MjypLkHeXBkdUznFpvarET70920jmdG262b1mFD1N+F
	t497oIuZxS6gNIhHOjb8oMetxMjMOlgNmdbhmOcAfJdPQEjPu33ouqessS/buQgk0OQhqLZSJsc
	iL4ZAu1iM4SN9IJRmEvodIVOqrNK/F/rFXBmQaUtYXk3HkxrncI2s3kifjU1a5nAWNsV/3rUCtA
	MFooyxTDiejMiWnpE8osn2z6sDsc0oLaZT2AEkukWN4qX84oqL37qjzdRXYCBJ6hVrtz75Ue3B+
	hAK8lDhowIPhv6dGzkG9NRg3w==
X-Received: by 2002:a17:902:e742:b0:2dd:c053:b9c5 with SMTP id d9443c01a7336-2ddc053ba23mr5666215ad.22.1789750528462;
        Fri, 18 Sep 2026 09:55:28 -0700 (PDT)
Received: from csl-conti-dell7859.ntu.edu.sg ([155.69.199.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75b6552sm11568185ad.61.2026.09.18.09.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:55:28 -0700 (PDT)
From: Kaixuan Li <kaixuanli0131@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Kaixuan Li <kaixuanli0131@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] f2fs: check every cur_*_segno[] entry on readonly images
Date: Sat, 19 Sep 2026 00:55:07 +0800
Message-Id: <20260918165507.1267942-1-kaixuanli0131@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sanity_check_ckpt() bounds-checks cur_node_segno[] and cur_data_segno[]
against main_segs, but on an image with the RO feature the goto that skips
the duplicate-segno cross-checks also leaves the enclosing loop, so only
index 0 of each array is ever checked.

An unchecked index reaches __set_sit_entry_type() through build_curseg() ->
reset_curseg(), which writes se->type through &sit_i->sentries[segno]. With
segment_count_main 120 and cur_data_segno[1] set to 200, KASAN reports
three out-of-bounds writes during mount and the mount then succeeds.

Use continue so every index is bounds-checked, and skip the node-vs-data
cross-check explicitly, which is the other thing the old goto skipped.

Fixes: a7d9fe3c3388 ("f2fs: support RO feature")
Signed-off-by: Kaixuan Li <kaixuanli0131@gmail.com>
---
Found on v7.2.4; the code is unchanged in mainline at commit
5dd1818b15d98d4a20806cd00b1b40320b06004f.

Before the patch, mounting such an image on v7.2.4 with KASAN:

	BUG: KASAN: slab-out-of-bounds in reset_curseg+0x48a/0x530
	Write of size 4 at addr ffff888009f8df40 by task init/1
	 reset_curseg+0x48a/0x530
	 f2fs_build_segment_manager+0x1f65/0x8de0
	 f2fs_fill_super+0x4348/0x7a10
	 vfs_get_tree+0x83/0x2f0
	 path_mount+0x570/0x1fb0
	The buggy address is located 3200 bytes to the right of
	 allocated 4800-byte region [ffff888009f8c000, ffff888009f8d2c0)

The 4800-byte region is sentries[], 120 entries. Two further writes of
size 8 follow at f2fs_build_segment_manager+0x479f and +0x480e, so
__set_sit_entry_type() is not the only sink the unchecked value reaches.
The mount completes afterwards, so nothing surfaces the corruption.

Reproducer: mkfs.f2fs on a 256 MB image gives segment_count_main = 120.
Then, in both superblock copies (offset 1024 and 1024 + F2FS_BLKSIZE) and
both checkpoint packs, set F2FS_FEATURE_RO (0x4000) in the feature word and
set cur_data_segno[1] and cur_node_segno[1] to 200; recompute each pack's
crc32 over checksum_offset bytes seeded with F2FS_SUPER_MAGIC and store it
at checksum_offset. Mount read-only. Scripts available on request.

Tested on v7.2.4 x86_64 with KASAN, three cases:

  - crafted image as above: rejected at checkpoint validation, no KASAN
    report (before the patch: three reports, and the mount succeeded);
  - plain mkfs.f2fs image: still mounts;
  - RO feature set with valid segnos: still mounts, which is why the
    node-vs-data cross-check is skipped explicitly rather than by letting
    the loop fall through to it.

fs/f2fs/super.c builds warning-free and checkpatch is clean apart from
"Unknown commit id" for the Fixes: tag, which is an artefact of the tree I
built in rather than the tag.
---
 fs/f2fs/super.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4239,7 +4239,7 @@
 			return 1;
 
 		if (f2fs_sb_has_readonly(sbi))
-			goto check_data;
+			continue;
 
 		for (j = i + 1; j < NR_CURSEG_NODE_TYPE; j++) {
 			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
@@ -4251,14 +4251,14 @@
 			}
 		}
 	}
-check_data:
+
 	for (i = 0; i < NR_CURSEG_DATA_TYPE; i++) {
 		if (le32_to_cpu(ckpt->cur_data_segno[i]) >= main_segs ||
 			le16_to_cpu(ckpt->cur_data_blkoff[i]) >= blocks_per_seg)
 			return 1;
 
 		if (f2fs_sb_has_readonly(sbi))
-			goto skip_cross;
+			continue;
 
 		for (j = i + 1; j < NR_CURSEG_DATA_TYPE; j++) {
 			if (le32_to_cpu(ckpt->cur_data_segno[i]) ==
@@ -4270,6 +4270,9 @@
 			}
 		}
 	}
+	if (f2fs_sb_has_readonly(sbi))
+		goto skip_cross;
+
 	for (i = 0; i < NR_CURSEG_NODE_TYPE; i++) {
 		for (j = 0; j < NR_CURSEG_DATA_TYPE; j++) {
 			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
