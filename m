Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF7436404E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655023; cv=none; b=O3iRtXBEa6W7tqRqogyZPHh+HorOSuAeyjjwsThXeXnwK8VTxpF8mY6tkwyqOUOGMDcnW145lvgfuUesUVWYpqd6Vp/lMix5yBZPMiFEJVOS0n92mFMdGBxr/UujNFHk0B21EGStA+DyWYRDJKWF1qtAKb/emGHHe4Mc/vmynTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655023; c=relaxed/simple;
	bh=MpnALZG1g9ffSEIKd4Yh2uqvfW31Aa9s3G1+6rk6JIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gka9Bbu9YHb12PF9pL1K8lyXyFo9ifqEK2Jn0CFG0/ZDw9ohP1wcsg8hy6EeTOIwbNpxbJlJkBSFvDX8Nvk9ZXP5r0RMl97jGY+G6QIAcE3Q9YkgOmmforAC2JOOxjyS1BoBQ+xMD11gbXlDpp4IsDqJrOgA8Ku7ECOGbK+qfgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=DDl4+pw0; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="DDl4+pw0"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e7457349eso61494285a.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791655020; x=1792259820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3+ihWzjyeVbz1fS/BASYfQ2t4vA4knncZR4QXyo1so=;
        b=DDl4+pw0XhjDwWOunAKn9s4OP9x6b3RifMCZ0ayFXJpxFwM1Yif8r0gxs0RnO1agei
         rgJnfxxNcxTvFlZIAFx1xZ9+P2km/NEs2kQ0/i1bm4KUS/RpoUVPlIhPR7rM5NwIod3b
         aHYKDNzHSFskaWeHg7KjisT04oOBk2+OXt4Dohx0I97wUZFP1YC/lHUgMDvHLx8hU93H
         T46XCCNXP/Cc1XKWohKT7U2XKVqgdXTr7zQZpXMcCCH0qiUji5pqqFDYIPUue4iZwjNn
         rujzMFtkmJfVM0RUFT1qskmSpdiHqOOBbh+in8I26qLGSQmjbRCasAR27zAoFTsFdANy
         HZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655020; x=1792259820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3+ihWzjyeVbz1fS/BASYfQ2t4vA4knncZR4QXyo1so=;
        b=S7l9ClY4bhyl9FmDUbqFx+Ci2Y6f0WkedCgt2SO6A06v205BZsbC/NUHRXZvTtsZfu
         qB9j2O0SoklfhYxK+QXZZzavXzQ16dbjd7sBUGPtKwIfDo75uIkA980xHEwOK/IAlKuQ
         TKt106Nk+TaAq6uKOsqFdZlb/5kuflnNhKt2NStpYJLB5+QjBPzrZ0ksMmxXXdJwRWEa
         TY4y4tKXRsDmZ1Z8uyIXnBOGvOPQCbkl04h+l762KMH0xyl/SqX8fsq/vtraLSifh/ZA
         O6+6KNcvZL4//fKztwjVY9xny72ofqIO2eONjsPvz6Mu8LJ+OpWt8qljVuwG/ko4uyWe
         fPOA==
X-Forwarded-Encrypted: i=1; AKwUvBxmr3A4J174AU4T1IlvKgY97leH8vm38RuvrpLTxRNZ/+kryiz/Dj1rH8H6pzXDsWh2V6q3JgWxwFUfEdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJno/KUjk3ahBt7PBOo3Jr3fAsnu9uVqyKqIpztdWMGWLmAinnj
	83aNXyX7n0kDkAbyMPJ6Jx0YNRxSWk1iYSft3XlvmsydzJwswxnWxKlV7tfDiraTsg==
X-Gm-Gg: AYBFou2GIZsjKGNZiAwJyefJ5B7OvDpw5wTkWpLwYIRGI5NBvifsgY3iaGC2vQ/VKe9
	e+R09D9XcNsXBxExX6T+3rp50hdFCP+mcRNmGzLIxfWkkZaZUTAKjbcoG+aW53sFZ7oMpjSyQY7
	j0SF+h6dtnDgmp7fhqfQCZxD6bJrMFPuORVxbtSlRrehzy2YXvDXeU2MMwYou3/LvrykGGAMesF
	/K1c4iK3VRW/aVGaRztEryD5ETK7g+0BmrQRcIKSaYnPjq7sht7IU1yUFc/B0kn/q8WXRwdZMi7
	Kcc9CYrJaXs5CiHXBGils5WbRbp0LkfDzAtUUcEu4hE3Z42RNwVQO8omEtDvPUYnwL9gWbI35XT
	nH4Iq9lZ2ATD6txq/Vl3MR7eB3HnvgUGcDRTy1rrBFU+HlxNlmsBm5Yjt+lwmBKWeHZOao/wMUq
	DGmPTNCDnUtIw/gxAqA1J52nODtCXOARvTBNZ95v6xVRY0lD9apL2rtYN+EoA75AHG39YL3cWXl
	tWUoB87gqHHCJKBdOLroRs=
X-Received: by 2002:a05:620a:7110:b0:939:feee:630 with SMTP id af79cd13be357-93ebd24474bmr897615685a.30.1791655020077;
        Sat, 10 Oct 2026 10:57:00 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98861bdsm476732285a.24.2026.10.10.10.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:56:59 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Jan Kara <jack@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>,
	Thomas Schmitt <scdbackup@gmx.net>,
	Matthias Goergens <matthias.goergens@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] isofs: Fix handling of directories with small logical blocks
Date: Sat, 10 Oct 2026 13:56:49 -0400
Message-ID: <20261010175649.700233-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b2eb2e288604 ("isofs: Drop support of directory entries
straddling blocks") made do_isofs_readdir() and isofs_find_entry()
reject a directory record that does not end in the block it begins in.

However, the block is the logical block of the volume, which can be 512
or 1024 bytes. ECMA-119 only requires a record to end in the 2048-byte
logical sector in which it begins, so a record can cross a logical
block. As of now, ls stops at the first such record and the files after
it cannot be opened.

The issue can be reproduced with an image that has 1024-byte logical
blocks and 40 files in its root directory:

    mount -t iso9660 -o loop,ro lbs1024.iso /mnt
    ls /mnt | wc -l

Before commit b2eb2e288604 ("isofs: Drop support of directory entries
straddling blocks"), the result is 40.

After that commit, the result is 19, and the kernel logs:

    iso9660: Corrupted directory entry in block 0 of inode 1152

This patch will put such a record together from its two blocks again,
but only when it ends in the logical sector in which it begins.

Fixes: b2eb2e288604 ("isofs: Drop support of directory entries straddling blocks")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/isofs/dir.c   | 22 +++++++++++++++++++++-
 fs/isofs/namei.c | 22 +++++++++++++++++++++-
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
index 28741251d56e..c72cfb08707c 100644
--- a/fs/isofs/dir.c
+++ b/fs/isofs/dir.c
@@ -95,7 +95,9 @@ static int do_isofs_readdir(struct inode *inode, struct file *file,
 	int map;
 	int first_de = 1;
 	char *p = NULL;		/* Quiet GCC */
+	u8 record[256];
 	struct iso_directory_record *de;
+	struct iso_directory_record *tmpde = (void *)record;
 	struct isofs_sb_info *sbi = ISOFS_SB(inode->i_sb);
 
 	offset = ctx->pos & (bufsize - 1);
@@ -129,7 +131,25 @@ static int do_isofs_readdir(struct inode *inode, struct file *file,
 		offset_saved = offset;
 		offset += de_len;
 
-		if (!isofs_dir_record_valid(de, offset_saved, bufsize)) {
+		/* A record may span blocks within a logical sector. */
+		if (offset > bufsize &&
+		    de_len <= ISOFS_BLOCK_SIZE -
+			      (ctx->pos & (ISOFS_BLOCK_SIZE - 1))) {
+			unsigned int slop = bufsize - offset_saved;
+
+			memcpy(tmpde, de, slop);
+			offset &= bufsize - 1;
+			block++;
+			brelse(bh);
+			bh = isofs_bread(inode, block);
+			if (!bh)
+				return -EIO;
+			memcpy((char *)tmpde + slop, bh->b_data, offset);
+			de = tmpde;
+		}
+
+		if (!isofs_dir_record_valid(de, de == tmpde ? 0 : offset_saved,
+					    de == tmpde ? de_len : bufsize)) {
 			printk(KERN_NOTICE "iso9660: Corrupted directory entry"
 			       " in block %lu of inode %llu\n", block,
 			       inode->i_ino);
diff --git a/fs/isofs/namei.c b/fs/isofs/namei.c
index 4fba1bf7f016..289efa60f3bf 100644
--- a/fs/isofs/namei.c
+++ b/fs/isofs/namei.c
@@ -54,6 +54,8 @@ isofs_find_entry(struct inode *dir, struct dentry *dentry,
 	unsigned char bufbits = ISOFS_BUFFER_BITS(dir);
 	unsigned long block, f_pos, offset, block_saved, offset_saved;
 	struct buffer_head *bh = NULL;
+	u8 record[256];
+	struct iso_directory_record *tmpde = (void *)record;
 	struct isofs_sb_info *sbi = ISOFS_SB(dir->i_sb);
 
 	if (!ISOFS_I(dir)->i_first_extent)
@@ -93,7 +95,25 @@ isofs_find_entry(struct inode *dir, struct dentry *dentry,
 		offset += de_len;
 		f_pos += de_len;
 
-		if (!isofs_dir_record_valid(de, offset_saved, bufsize)) {
+		/* A record may span blocks within a logical sector. */
+		if (offset > bufsize &&
+		    de_len <= ISOFS_BLOCK_SIZE -
+			      ((f_pos - de_len) & (ISOFS_BLOCK_SIZE - 1))) {
+			unsigned int slop = bufsize - offset_saved;
+
+			memcpy(tmpde, de, slop);
+			offset &= bufsize - 1;
+			block++;
+			brelse(bh);
+			bh = isofs_bread(dir, block);
+			if (!bh)
+				return 0;
+			memcpy((char *)tmpde + slop, bh->b_data, offset);
+			de = tmpde;
+		}
+
+		if (!isofs_dir_record_valid(de, de == tmpde ? 0 : offset_saved,
+					    de == tmpde ? de_len : bufsize)) {
 			printk(KERN_NOTICE "iso9660: Corrupted directory entry"
 			       " in block %lu of inode %llu\n", block,
 			       dir->i_ino);
-- 
2.53.0

