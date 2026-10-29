Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305540;
	b=WDjx3J4mjHOCZgSGnQn5HRri8+JVg3t14qYHhIavM3kvWDUyVgC3H5lq4rN1d1Xn545M
	 PU7rjbfdNIAKcw+l8zUuGPOfDCQT+KeR73VHyk/GBrcjuU85iNMiRTCeq9XGoOcfmlxRK
	 olQfhwSk49WYtDVvv8peQN+mI9hcoNxZ5MM332e8sxdluBqxbHL1yM5ROSvXKgZ/uvQOD
	 Jad3AdQgEJbqcqeXGZ28VOFD1p+S+wKNMqoJOKYjy1tE6Gi5rFvpBSyifOT12E+phx0QT
	 FVw9FN2hAy4G+U6In9aaRMwRWcBxBIDVRvZEX8rcYKWJFs/gulYDsMrJRWjsB1K0lkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AJ2rr9yl7nzCTLgX0OQTyS4SWxqI0qu4DuqhR4MK27g=;
	b=PTG4Geky22Xoioils1AISWEIC53t4ekf5Wi7sKMVOf9oRPLt9feTPQ6k+S3yy9u8ivnw
	 E4JE/bU08QOLMZ7RMdKwG9xfI2Pevv+vNA7ywbiiwWNTO85hPLe6pYaiUeULk51YxIBKU
	 WZUWGC1pRalTKMz1Rsy0OrxCJDZgZdGQ5w6sQh3D4WlwoEWGIxxn/M+wpO60dxJ2SKEId
	 XSXtZnYoKZIAbLmF+KqWIIbKYz/HIoEakFUbZJmiYQtn8/ru6ymy/Akuc3Z7LG6GPz1B2
	 kEYcpRzjAb/LNqXwfUuonIOnmhk9hHOEybInh3MLTtaH2CYRRDTd5EkA4QBIaUYEzjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HuJXZvMB;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464ED606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 464ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HuJXZvMB
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso61525c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793305539; x=1793910339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJ2rr9yl7nzCTLgX0OQTyS4SWxqI0qu4DuqhR4MK27g=;
        b=HuJXZvMBZqZoZ1IJ0Au4NTWas5k2JraJEWR7azsu0LGrObUsqThdtmt+JZDaWSq4ZK
         uc7Wg05f4u/OPDeLCtehyc1CTXTHEc3wutW/Q4C4J+fbSzkMBxxHIS+FxiUUFw2R0CeP
         tLnGc2MDnQ2D+nOlg6AIBbve0lsUSoHb0BFl3IycI8f5oeUjoDK+4XDHqTHtNPO0LUuZ
         J8jSConYemvnfwHycleXl7t8ktZxRyRlw5/vX34jw/tDxCtdEVgEmaGpCtk3mdCu/mE0
         r1STlzOFry6MWpl50GFApT4Ghie5PrwQyRt7/PnamieplaiodoF/dccgy3l+XMF2US3U
         1G0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305539; x=1793910339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJ2rr9yl7nzCTLgX0OQTyS4SWxqI0qu4DuqhR4MK27g=;
        b=dl6K76YMrCCWUhdDwc5vYPdhd6Pwatiwg91pOhBY4H3Z2zCdzytWjmuw8LIfq2yK6B
         O9SAgvToHZPeIIdAgs0H4JA6va5JCv6eKnc6zwBDwFRUeVVhBMPlA/HdCYayQXGa0kJD
         9an5dLZu0vqqOxr2NmP1XpIl6SX0Vmu690NkcVaMQNttJ9/WCxUZbVJZ3NkrEJRWtB7+
         9otqlUBP9gjjtevIMV23w/+2cslWQnRYZFRyDvsrN32fJXNlDTwEh1+mpZHy3T8qsNim
         bnrYKAFk8JGbR5lA8ISq8L0gOXKZWR5629pKxALz1a1/PFa4rcN/B32HyVQzOnXSB6Iq
         Bm8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzUjBKPIk0i76AuGASnsQeGKq+dwdoOA3qezOJ+oIGl3e7eCbb1m4yKmrJ+sipLFTZPzcXy/LIpQxRAQJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYL3bJ3qtNBmS/CU+e0H/blK/GY3kZXs6eexA6NfL1qmARQbDx
	sttFG5WkbWy/8vHyGyfCDoO4wYZrtMuK+5LVZj9A2Zv/oi0sfdhDw7Um
X-Gm-Gg: AYBFou029Lfgi6oJiV3w3jXgSISsxDFZeZIJgyiTFwWOpp/ZEOU3V+JLQTttUB5+eLR
	chdAbvKISYjS2PBFi4KRnFEXlmKAkiZU5vn7URxwa/hW1rGwz/Oi4K/E+nZxlsYT88Fo6L9brZY
	eWFqRnZvsHOEDWkgjuzaJVY5IsT0xtK5SgDBNTlKWeFn/7eG4GS/sqi8T1ng4WQ7AytYWUbeFcc
	W3nM8zBAosEwngsLDO0OerWwCuWptjK6UBfj7AV8sC0bCrvdWhjgTy/5bx2JA5cta5ScQVpqaL2
	4J4qpjdPeVYaYW3904VgIL/RmXkcujulJFag3fVLweIxrc5cY0V+RbHN0106OdAXSemi0GIOKb/
	47ydWRCIUPwgfZDS7FKLeGxnSAikUIky5NTqpVbGyaUS2618MiLblcpY9Sn57NOlwAophrrPoMM
	cOcYKNdk0+Adz4sCsqTIIdqlgfrjvvqv0WUEidAy931E6YlMiCoNWKfor/rIqGfwkzxPqBdocGZ
	5S1b99f7DNpUqTFDfH4UU4pdqlAwoqVn99OTro1C/POjDnZneWHhhRxGCEa9ov8MfY+Ldzxg5bm
	tPFrgf+5WqSbDNDo9Q4sMoH0aSLfhwstl5KlDUBimXjtv3Mb5j1VoCyU
X-Received: by 2002:a05:7023:a42:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-1ac5d88c626mr122263c88.12.1793305534108;
        Thu, 29 Oct 2026 13:25:34 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm916000c88.14.2026.10.29.13.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:25:33 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: hirofumi@mail.parknet.co.jp
Cc: akpm@linux-foundation.org,
	brauner@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] fat: fix parent link count when replacing a sibling directory
Date: Thu, 29 Oct 2026 20:23:52 +0000
Message-ID: <20261029202352.59890-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

vfat_rename() and do_msdos_rename() adjust parent link counts only when
updating the dotdot entry for a move between different parents. Replacing
an existing empty directory in the same parent also removes a
subdirectory, but leaves the parent's link count unchanged.

For example, renaming one of two sibling directories over the other
leaves the parent with four links instead of three. stat and ls report
the stale count, and find -links 3 does not match the parent.

Drop the parent's link count for this case after the source entry has
been removed successfully. Leave cross-parent renames, regular files
and the existing error paths unchanged.

As in rmdir, check that the parent's link count is at least three before
decrementing it. Report a filesystem error if corrupted directory entries
have left the count too low, rather than reducing it below two.

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Check the parent link count before decrementing it and report low
  counts with fat_fs_error(), matching rmdir(), as noted by Sashiko.
- Retain Hirofumi's Acked-by from v1.

v1: https://lore.kernel.org/r/20261028211626.26103-1-dennylin0707@gmail.com
Review: https://sashiko.dev/#/patchset/20261028211626.26103-1-dennylin0707@gmail.com
 fs/fat/namei_msdos.c | 8 ++++++++
 fs/fat/namei_vfat.c  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
index c7500c2859e0..97289c9d9261 100644
--- a/fs/fat/namei_msdos.c
+++ b/fs/fat/namei_msdos.c
@@ -565,6 +565,14 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 		(void)sync_inode_metadata(old_dir, 1);
 
 	if (new_inode) {
+		if (is_dir && old_dir == new_dir) {
+			if (old_dir->i_nlink >= 3)
+				drop_nlink(old_dir);
+			else
+				fat_fs_error(old_dir->i_sb,
+					     "parent dir link count too low (%u)",
+					     old_dir->i_nlink);
+		}
 		drop_nlink(new_inode);
 		if (is_dir)
 			drop_nlink(new_inode);
diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
index ff7652bf0410..c4d5628c05fa 100644
--- a/fs/fat/namei_vfat.c
+++ b/fs/fat/namei_vfat.c
@@ -1011,6 +1011,14 @@ static int vfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 	vfat_update_dir_metadata(old_dir, &ts);
 
 	if (new_inode) {
+		if (is_dir && old_dir == new_dir) {
+			if (old_dir->i_nlink >= 3)
+				drop_nlink(old_dir);
+			else
+				fat_fs_error(old_dir->i_sb,
+					     "parent dir link count too low (%u)",
+					     old_dir->i_nlink);
+		}
 		drop_nlink(new_inode);
 		if (is_dir)
 			drop_nlink(new_inode);
-- 
2.43.0

