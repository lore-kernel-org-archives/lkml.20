Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0561A6806
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759271; cv=none; b=bgdyq0BRxnoZR9Hx6dxBAWpArb+ZjjWHQ9W2mwhXBSHM6qo3KrnjoDa7dQRyOqMb2IzltzsAS69pb8BlLgHjnNu5XFjQpKkuqOmcfPukJPwasUSlzTareuEGoLExh1BwtU3y4PxnF1s4I/4mJXXcFUJAEvB/slw9rbwDNlz9gO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759271; c=relaxed/simple;
	bh=mwRUJF3wGx2Qhe1fuExeMLHPcmjOCo1c/6Pg7yRmVMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PBrI3unTW9vk7oeRS7VfLsYdeaqVp0zuRCqVvo9C6X4NHbV/plbBokj0jQjmbkV32CSbp0GXMmHcHpzkIWiaEt1A38qeE+8lJtv+EKKvj4wEaWpqQFIQZWcKnsZlfy1a0nnRApTklcCG1h3Bbx9KqJPDwBKeeMZM/7m9Y8RWhF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEIQyQ6R; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEIQyQ6R"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so30233595e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759268; x=1789364068; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cCFD/yXemFHbj/JySUZn34on1n5S4vAUBReMZLU41VE=;
        b=dEIQyQ6RABC0hHoLH6QeNsA5I+rO3Z42AxPdw2fUhALj4iCNOXOBNJOflZOTJr02zW
         I/3XPAOOBVrk25CLifnaJtUL46ioss3TNE1Wuu0EAxLfyTOtS4rcLYuQK4Q4OFMFXfB3
         d5gk144k7N1hyfoFus71fNQfN/ABxvSTtq8MyT0MqpMcgyyzxNKB3Fp9zb2B2b/9lGre
         z1nX3M4pIS3i8Yl3S+qZVf5wBDVE8gj0gn+HD0TlXj8rara9v+oTrSFxAKfrsOufGkt8
         UTzzQoyxY5eqtU0WY/TDlVpDMKQUTbx1YvhAsvOTNrJmsESVLrtcoG1UezL2hLYDZfFk
         cCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759268; x=1789364068;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cCFD/yXemFHbj/JySUZn34on1n5S4vAUBReMZLU41VE=;
        b=YY/GBQ/lE91aA+8D1kgBpq+yNtaE/hXfLj/cpNAFe8eYWn8x8UeyQ6Yy835327XnBI
         0hPFleOTfqvQSHksi7YKin+hkvkjaIScGB861+mABzndLbCwN3d6+1gj2DEpYVZcnhXf
         oX1cMEIMSeLdm4Hj8qEYsd1mtJy49mLQEk6B/yWqIACGwColwi+uUPObX+PhH27j5k6o
         pto4VN0uz/RpuTs4cFHRYPC0Q2umPIDKnq70iTThYpg/Cah9cWJYP1iSkdOsNP8h/nhF
         Mh83CWMlGXQ+8DEtpyJEPcWoyusB5uilH0YrEoA5cInFHprThyeoKfwvTyAfjNGmgWGW
         rvlQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6/Pnrg2wrkiApNqLpgWQnIxbwe2KxinV9aGUyYdoQRZo3Ln9vyLyoiFthyWJ/O0LArMB8Ke6JhQ9k2/M=@vger.kernel.org
X-Gm-Message-State: AFuF++lkmGJdL570oTAh1bSRYEVVHZSRVcwjP3G1nGmCWQkAjACZH2M2
	yhOaGiSYU7GQOACyWjpBO5O4thf66VHuJY/AN5QDyUElbQ7mGMcUcrNs
X-Gm-Gg: AYBFou2wC5atf2fwwijg5VvkNYy1bnwtZF3P+cKdAL9suI9su76d0+OxEk6OxjbAk/T
	w/P+lbeOHQUwAAl+H9iksPgnkWGSp6p1PFKpg/kBHFaM3CYmRG+yPzHmteAfRKFRDzvqyFuN0v/
	AIREs4SvT1QzKAuDAJKfNRJ44QTMNo7QWEjFo+kSlb+TaLPtymZY8zW1+oclwqYl7gJeAyJOpqY
	0vZLKvfzBdX05ILXz/3DsXblVcZP9LV9RTy78K49Px4ONrKqE8pVQQDMGtfsRMEjwDbv4Phg2M2
	2m0F9Uqvj+qlaBthLgTYrA2ny5KZWKp+NytDyWi/+O5BmcZJtP5d+jGI1eGmEXjX6En2e5d3bDV
	oxIIkz3QKJQJB4RRD3AmErzHrZsmnfgTiTHKp61Zot+kHUW/Dl9XZGSIRA4rNp19FeTfN1upI0R
	6Q+FrBWxrHf7Z5SRKE4VbL6vZ0jkrUkOWCdQ8ed8z/l54SBsuVrxcoqWLgyCsOCIRqKWZViPCCA
	Zd5fbXfam5/ySEVWv/5fi7O10Q7c5wvDT22MgjiCWYKZwJJ+fPzVT1AmOqbN8QO1VwGcxJ3r4ax
	Eu7QcvTAlZohneJgYEc/QwfM9K09BnYkuyq6W2Ae+QVoRLFwLuFwocGSSxoBcGzpIu6OpG3gvVT
	dVsMhfDogg40q+NGkm2rC0z/K
X-Received: by 2002:a05:600c:a00a:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49cf81f6736mr416215265e9.6.1788759263385;
        Sun, 06 Sep 2026 22:34:23 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm783385275e9.0.2026.09.06.22.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:34:23 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 07 Sep 2026 07:34:21 +0200
Subject: [PATCH v2] nilfs2: remove '#if 0' code blocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nilfs2-dead-code-cleanup-v2-1-fa1ab5b0abd6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrB1Ip9hgr1JcxORPHZAoCRUhe
 PcGl9/ivUoFWVHo3VXKOLTolhqk78gvLn3BGppJjLzMaAZOusYiHOAC+y2A/QqXfjt7xBli7fN
 hhVq+Z0Q97/Vnuq4/dcVM8moAAAA=
X-Change-ID: 20260905-nilfs2-dead-code-cleanup-cefbe2773172
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759262; l=2332;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=mwRUJF3wGx2Qhe1fuExeMLHPcmjOCo1c/6Pg7yRmVMM=;
 b=Tqy5R6SDWC36FaN3x/0yiMabRHSFHS/2yRDudjVam6e1zC9Au22w8vVRRnXYlTjwYQA5K4slZ
 TVCUpQvQx6ZAzj3ljja+nYvhEABui/gpTLTSVBD5QmryPiGvfIwwg9r
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

There are two instances of '#if 0' code blocks that are dead code.
Remove these code blocks.

Additionally, remove a commented out section containing similar code
as the '#if 0' block and unnecessary brackets around a single-statement
if per checkpatch rules.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Changes in v2:
- remove block of commented out code (Ryusuke).
---
 fs/nilfs2/inode.c | 7 -------
 fs/nilfs2/super.c | 8 ++------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index 34e6096069ad..778274203f4c 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -342,8 +342,6 @@ struct inode *nilfs_new_inode(struct inode *dir, umode_t mode)
 	ii->i_flags = nilfs_mask_flags(
 		mode, NILFS_I(dir)->i_flags & NILFS_FL_INHERITED);
 
-	/* ii->i_file_acl = 0; */
-	/* ii->i_dir_acl = 0; */
 	ii->i_dir_start_lookup = 0;
 	nilfs_set_inode_flags(inode);
 	inode->i_generation = get_random_u32();
@@ -422,11 +420,6 @@ int nilfs_read_inode_common(struct inode *inode,
 
 	inode->i_blocks = le64_to_cpu(raw_inode->i_blocks);
 	ii->i_flags = le32_to_cpu(raw_inode->i_flags);
-#if 0
-	ii->i_file_acl = le32_to_cpu(raw_inode->i_file_acl);
-	ii->i_dir_acl = S_ISREG(inode->i_mode) ?
-		0 : le32_to_cpu(raw_inode->i_dir_acl);
-#endif
 	ii->i_dir_start_lookup = 0;
 	inode->i_generation = le32_to_cpu(raw_inode->i_generation);
 
diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
index 893a504cb80c..89fa6faa34d2 100644
--- a/fs/nilfs2/super.c
+++ b/fs/nilfs2/super.c
@@ -824,13 +824,9 @@ static int nilfs_setup_super(struct super_block *sb, int is_mount)
 	max_mnt_count = le16_to_cpu(sbp[0]->s_max_mnt_count);
 	mnt_count = le16_to_cpu(sbp[0]->s_mnt_count);
 
-	if (nilfs->ns_mount_state & NILFS_ERROR_FS) {
+	if (nilfs->ns_mount_state & NILFS_ERROR_FS)
 		nilfs_warn(sb, "mounting fs with errors");
-#if 0
-	} else if (max_mnt_count >= 0 && mnt_count >= max_mnt_count) {
-		nilfs_warn(sb, "maximal mount count reached");
-#endif
-	}
+
 	if (!max_mnt_count)
 		sbp[0]->s_max_mnt_count = cpu_to_le16(NILFS_DFL_MAX_MNT_COUNT);
 

---
base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
change-id: 20260905-nilfs2-dead-code-cleanup-cefbe2773172

Best regards,
-- 
Kind regards,
Joshua Crofts

