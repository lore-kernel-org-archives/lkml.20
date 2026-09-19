Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA18C38D3E2
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850898; cv=none; b=FcHBUrli7VQZ19Azho1Xad7AM3EqW2yv6AUhuSPtqm4EC7hCQx945KmHYbp4u04gZ3eFaqUllu3BCqmrmFqDRQSIGatKIlPmhJOy4+iSWZQCqf7btNfTM8I7uLhh3/2ZimHu82sqtFFZzZbQsHahw7IWmv6kA71R60vnfIergm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850898; c=relaxed/simple;
	bh=Xb6YmybDYOpffDEcr8Qpz3o3baljqAvw1OLCUNDOILc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SG0HnQLaETrACD5FRcJfw0qtBcktH6OHupuC82B6qI9kfLvKFF1RpbjlaAoa2dfR/Q/1Gn7sf7bPHDo/qMwMl3PcjSCPKgaB0lv3ZKme2dMQLGPDYbvT5L/Ya368HGCpJKcB6jbjghGOBDyPEyvMyxK/0ys6kMb1qMAfLudqKTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuWKQ04+; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuWKQ04+"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868cfc5c244so1008420b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850892; x=1790455692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8coy9Idjf1Xbt6E4H3MvvQY7vOxDVZhrZENv3R8zOc=;
        b=AuWKQ04+RdJ1Ccrl2bfOx/J6pBmZwjkvWyVFE2lCtBa0Kmwqc5Li7Q0uTAHPGLTn42
         0ZPVphfxoPP7+Bz7aXPoFBUeFYubdUtpSKhgGsQQ5r0hrpH/KZf5HbpTKydSQ/hsMIoy
         YGNvLBqjOpiDoUVq/qU751zsPPkTmIGrN7jFaj23e7S0y70BoW9GoVQWTFx+xq/s5jcV
         5thcgj1uthL4XK1AFYvjR33SX+rWJKSc3S3CK3/UJRGcu1aM49RM4wCdiIoVbQnZJxwo
         IXHqzcMURdTzpWtdQPfOKGN1M9xR93ucFGRGcH2HJcw0N0tpZLNYJrdGxU5T0isB48xA
         4zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850892; x=1790455692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8coy9Idjf1Xbt6E4H3MvvQY7vOxDVZhrZENv3R8zOc=;
        b=bEiLsQkN6IYXxag66bvJ9ep/asIY/O8be9yOGH1anHNv4WLxVaBTadRgNGPpJn5KY+
         RN6Xn7tzSLAN1gp3g/Kx2uNEhVyIt1P81w05jJ7TzV1ule9z86H5v12HMbPdKdi1X3nK
         hUpQeZQKR3oVP58Xiw1XStd7fpjbENyMikzFbXY200SlfI43Cz5NB0tGQcJ9jkvalxBB
         HMR7wGi+n1+F+siW3T3DA4x9DreFmAlfojgfpYntuY44u6hd/39PoMo7LXqTSEzsbKSY
         zNLHhso0I0fIfEm3o/Y4JS9BZgs/ZzuimSomx4LLI3IE6IoACi0fEZ5RD/SbYFL8QP+S
         WaAg==
X-Forwarded-Encrypted: i=1; AKwUvBzZYWg83fwigh86WLpTBLZvwE5/lVDrLsA1nkwdFgalnqKR+kqnAY1s614UfYugmWX7NEgviM2rigEZe04=@vger.kernel.org
X-Gm-Message-State: AFuF++nhGl/PLTmSYf76F1h9YA48DX96ETYtgSc2TZtHI3O4Lm7L2Hbo
	QFsxT9Aug4YysNlZ2uL0rJA932lnFoB5w64SszilYV5rtdxnmsp86N2u
X-Gm-Gg: AYBFou3akN8r5xnJKDCXI6HHsdF9n1un8+uGSyd+7kWR6e2jNQZxBVmqFMNXJtCaoVB
	u00a5BulD5Xr0cuX3FCQNCaD3P6PRHSC33nA1YMZ5K/jD+g3CO/fBbK6hU6Z4nry6sqT+JEnOQe
	+ihJMsvoULQwmMC3YeuCmwW213inigSUh8Cm/y76QNBFM+5Nhvi47CJwGVFE0wwwd0aULibNiMI
	tzTy6mxoL/ZVQvUVLH+SYPIxHNoMzqZr6VomxG8fGO73Ur09Fimnh7v1/BVPu3ejuYsRovxluXK
	FTq2WRsUKi6WGQobhA6HG6e1ZIPQTXuUTI3tjN5aFV0s9S9mosFrDmHoU3OI0N9j0nUnuu4Xe5a
	VQhU0UyG9sHYova4u/0nideKCarBP7KQshVY0bmMSCbAMDA9I9S8muHgZJiOc8Lv8MEUJy8kZcq
	o+3cFVBG0LunvzOhmQXB1CSnJF2/IM+dgGLfq7dVxEvcMiqTR6K2xyHjIBmmepod1NbOUfJkptD
	LNXFBpBgm7HbUviaA27HX4AZVglIe5Ag0u9IVYaC9RkQzaUucy+UvI10YC9wPjovLnK1oAOhKEN
	Y+YWuoaM9Q==
X-Received: by 2002:a05:6a00:1a0f:b0:877:b053:2e12 with SMTP id d2e1a72fcca58-877b05337a5mr2996714b3a.10.1789850892092;
        Sat, 19 Sep 2026 13:48:12 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9b18689sm1299910b3a.40.2026.09.19.13.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:48:11 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fat: avoid freeing clusters on failed directory validation or read-only mounts
Date: Sat, 19 Sep 2026 20:48:10 +0000
Message-ID: <20260919204810.2813594-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fat_fill_inode(), set_nlink(inode, fat_subdirs(inode)) is called
before fat_validate_dir(inode). If a directory has zero valid
subdirectories (so fat_subdirs(inode) returns 0) and fat_validate_dir()
subsequently returns -EIO (due to a missing or malformed '.'/'..'
entry), fat_build_inode() calls iput(inode) with inode->i_nlink == 0 and
inode->i_start still populated.

fat_evict_inode() then checks !inode->i_nlink without checking
is_bad_inode(inode) or sb_rdonly(inode->i_sb) and calls
fat_truncate_blocks(inode, 0), freeing the cluster chain on disk even on
a read-only (MS_RDONLY) mount.

Validate the directory before setting i_nlink in fat_fill_inode(), mark
the inode bad on error in fat_build_inode(), and guard cluster
truncation and metadata writeback in fat_evict_inode() with
!is_bad_inode(inode) && !sb_rdonly(inode->i_sb).

Fixes: a3082d526f2d ("fat: add simple validation for directory inode")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/fat/inode.c b/fs/fat/inode.c
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -535,11 +535,11 @@ int fat_fill_inode(struct inode *inode, struct msdos_dir_entry *de)
 			return error;
 		MSDOS_I(inode)->mmu_private = inode->i_size;
 
-		set_nlink(inode, fat_subdirs(inode));
-
 		error = fat_validate_dir(inode);
 		if (error < 0)
 			return error;
+
+		set_nlink(inode, fat_subdirs(inode));
 	} else { /* not a directory */
 		inode->i_generation |= 1;
 		inode->i_mode = fat_make_mode(sbi, de->attr,
@@ -610,6 +610,7 @@ struct inode *fat_build_inode(struct super_block *sb,
 	inode_set_iversion(inode, 1);
 	err = fat_fill_inode(inode, de);
 	if (err) {
+		make_bad_inode(inode);
 		iput(inode);
 		inode = ERR_PTR(err);
 		goto out;
@@ -688,12 +689,14 @@ static void fat_free_eofblocks(struct inode *inode)
 static void fat_evict_inode(struct inode *inode)
 {
 	truncate_inode_pages_final(&inode->i_data);
-	if (!inode->i_nlink) {
-		inode->i_size = 0;
-		fat_truncate_blocks(inode, 0);
-	} else {
-		mmb_sync(&MSDOS_I(inode)->i_metadata_bhs);
-		fat_free_eofblocks(inode);
+	if (!is_bad_inode(inode) && !sb_rdonly(inode->i_sb)) {
+		if (!inode->i_nlink) {
+			inode->i_size = 0;
+			fat_truncate_blocks(inode, 0);
+		} else {
+			mmb_sync(&MSDOS_I(inode)->i_metadata_bhs);
+			fat_free_eofblocks(inode);
+		}
 	}
 
 	mmb_invalidate(&MSDOS_I(inode)->i_metadata_bhs);
-- 
2.43.0
