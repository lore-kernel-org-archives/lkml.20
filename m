Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C4E3A8758
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213942; cv=none; b=GIjuhR9ty3I/PO3OU6r2eUQ1KwsVZY6dJ0y+aaLHE6lIM/Bsu9N0R8vpsm21JI1X46jf9yM/FBBUxJEm8JxwCL92i8of772Hpl+Xhz4YRjFQcFd53o/Yg5xJ3mlPkzJKOou7wkmGBtKjCN5thJM71SQ1hDY3mYDOBTzIfbpuyFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213942; c=relaxed/simple;
	bh=XP6yj8rw6hG7bTSPi7oGkgkS+EJ6C8E4iteUrKh0Fh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozaxnupd78sEeO/O0IKehcMaCwOdx8OXcKkEqyRNgFqfdq7ucxitHBMyshswRtg2nh6I86wdjW1sYYmbpswDoaj6sC8NOLWPvnAfBqd2gmHWxyvQOIfXB1f2fWjdE3hM1qlvSc6J09UQMCvoxNifsfViK/CqVp/MrKkfU11WrKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLKSM6fD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLKSM6fD"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39675172593so3570925a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213940; x=1788818740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SU3rdh97lkeZJr+7CduyypOUNik8G+JmicPTmnCyvI=;
        b=NLKSM6fDz8uBX4Mru4o9lXfZPYdf0jh8MKOO0aK7prfQFl5LKP8Oev4ynLP0yJqgYH
         /8CyPAXji2RIIgnJAGdGn7f6qeofaiu/Fw4gVka2T2Uylprdieoio/eiik2pJU5XLPVm
         qDHEWIDmpWyRpLyCSfDkUzaocoE0s2Hdl9e8C04vo+j94eHS3BGg+ZxJwt1jxu9nfyRM
         R3/f9HYTcNtjLTwYaw/H4rVdUhmrUMs/w23ReaXTkQKXjP1/NAMeRJm6FXj6dMRghw3b
         1azeZQkXn6aedkEDuOt4fohH5W8HN3bUw78/9IrrW5W3X8Wopk3ltGuN7YTyx+b049FH
         eNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213940; x=1788818740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SU3rdh97lkeZJr+7CduyypOUNik8G+JmicPTmnCyvI=;
        b=pMJf1w2MDxWYb+NiPx6g3ffFPwLJIDx5ruVOOiP4xbnV21cs8QOVfTTOzSY5gfsJlg
         KMuzIfmkipZb0bvPxwgZJXOda28kfbv6rKqEM916wPzH4vvh8q8mSqn2D0XY9Uioasav
         RPkbVdIQVKlchwJuw3e7VoPROFUlQV/+80YHMV4BFBKcZW9mARZ0+Mky4b6oARsj8/Sl
         +HrSHaS1kCjrVZ2Bk+SKLibx/rB2n2h0e77YfIOVUHV2buEokPghwCaBTN+duAnJ69Eo
         d7ask4IxS/O+os0LglCLy5NwPWmEaXVHexim8rg/dF9PVRnXldP4+3rSSSENC1cyopTU
         A/9g==
X-Forwarded-Encrypted: i=1; AKwUvBwwl9mKSCAQR/D58u6EXHmQwnQ5a4IdfcRTVKRgdlB0Jo4HLrbTbJW9rAR/l4uPwUVIknRJfuuqYt8FL/U=@vger.kernel.org
X-Gm-Message-State: AFuF++kGul53pmrEGpDqUbLd0ihxxAUc9+XCcj5prQXYE1s1w/mGIk05
	cSuT1LjN6DtCb1xhkmGHaBBZvFpmkAs0JENlU9NBRmagnRwZJhRgCtzQfWultC+u
X-Gm-Gg: AYBFou33Tbvsv45tGrew4WKUArsW93L3E6790jVGM7cGXN3u95BELG3Ju8Xbec6ZZHo
	SbYBzq4oG7wo4JhEE+L0AsdOZv3tVl1zaZYJEH5GNF0oCGhh/Qdxp7iymzyrWt8OALsru7yXyCg
	G0jqLOPHp7xsVzGns2m3JutCGoal6CS6YjBuf4fcclqnvBomLviTkHQX0Ld3pH8kg0RMtSPCP8c
	9/LRcIHahXId4gk40YkRN1FoL45RyIWxb7+r+nlRiblv9BUxqiBT+oUrygew4fNIDavCo1OaP7S
	9TXzPq4VfRidu6afJLYLwbQJ2DugWokgJIvCgeC94mP3s8EJ6d70KZ0NRhmnsRsO1UwSSzAUsZU
	TPhvvuVrQ95uY6awLE6V3BBxU8RD+dAYqOkgPOyiH7UwUFB0UmK0WNaX2DdHVsZh53Mb19alQdY
	6u0wucAjcpvTPf8Co9zy5V2SHJnfe63ANaW1p63sEm/7jOK665okMY77IgFZNH+Gng2MI=
X-Received: by 2002:a17:90b:538c:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-398d6e68870mr18634235a91.25.1788213939680;
        Mon, 31 Aug 2026 15:05:39 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:91a4:c2d8:1d54:21ad])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d499811sm1952863a91.10.2026.08.31.15.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:05:39 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/11] f2fs: initialize sb_info early in f2fs_fill_super
Date: Mon, 31 Aug 2026 15:05:37 -0700
Message-ID: <d3fa15836c409ac6028956c06dbe11a8e0149734.1788213716.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788213716.git.zhangxp1998@gmail.com>
References: <cover.1788213716.git.zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, init_sb_info() was invoked late in f2fs_fill_super(), after
processing superblock error tracking, mount options, and sb->s_maxbytes.

However, read_raw_super_block() reads the superblock folio directly
from the block device mapping using folio page offsets. This makes the
initial static sb_set_blocksize(sb, F2FS_BLKSIZE) call redundant.

Move init_sb_info() to execute immediately after sbi->raw_super is
attached, allowing the block device block size to be set dynamically via
sb_set_blocksize(sb, sbi->blocksize).

This early initialization also prepares for upcoming patches that add
dynamically computed filesystem geometry fields, such as
sbi->addrs_per_block and sbi->nids_per_block, to init_sb_info(). These
fields are required by earlier initialization steps, including mount option
consistency checks and sb->s_maxbytes computation.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/super.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 253a579e9d5b..2d9f5b77f815 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5125,12 +5125,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	}
 	mutex_init(&sbi->flush_lock);
 
-	/* set a block size */
-	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
-		f2fs_err(sbi, "unable to set blocksize");
-		goto free_sbi;
-	}
-
 	err = read_raw_super_block(sbi, &raw_super, &valid_super_block,
 								&recovery);
 	if (err)
@@ -5138,6 +5132,14 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	sb->s_fs_info = sbi;
 	sbi->raw_super = raw_super;
+	init_sb_info(sbi);
+
+	/* set a block size */
+	if (!sb_set_blocksize(sb, sbi->blocksize)) {
+		f2fs_err(sbi, "unable to set blocksize %u", sbi->blocksize);
+		err = -EINVAL;
+		goto free_sb_buf;
+	}
 	sbi->max_atc_write_bio_size = UINT_MAX;
 
 	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
@@ -5217,8 +5219,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (err)
 		goto free_bio_info;
 
-	init_sb_info(sbi);
-
 	err = f2fs_init_iostat(sbi);
 	if (err)
 		goto free_bio_info;
-- 
2.53.0

