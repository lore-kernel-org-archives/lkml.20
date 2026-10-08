Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF6486BB6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460404; cv=none; b=YivF6pBIsN3sLN78wMCeoHUPFlmierWop0GuQJ/hhPfVnP+kyvaYtG3eRH5Sjabd+vqkkqpxhvdG5ZCWRcVTemk/HNB9hljDVMlMmbn1jWhSVcm4zi9/Ps6yUembiviWD5gn+OAznjjx91DVb+P3s2+G5O3aOGOFd0Pd9R7Kzeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460404; c=relaxed/simple;
	bh=u1KGci1FENARnMk5cvejW+u6M7Dou0PtZjer1DlS8Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDTjvJzCsOLr8ezpMNPkNOxx7BwNtIfWpP59O4uM8hQdvRrj+48WeCzoqjqKEcjcqzzrvWurwAWou5IcTfZwvzPMrFS5gl3PptdSrucHtfnTggbY+JNFP/SzCKtPIElv6BpmsL479EUBSr7w1++xe+DewEriwDAtwrulQyjecHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOjfS16M; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOjfS16M"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2060065a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791460402; x=1792065202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtIlXzbZpBsjilW6PVdSkWToCAg9NZ6bfmznCf9pr8c=;
        b=GOjfS16MZNfO7jJcRDbJudow46HvQI0ot47kIUyt7LoeERD5qMRGsImGYR6WxlcGTl
         HGz1uPFkURHiH9gBuCvQ+qpbnIhPrcEolaNIJ8CE2mU36+U/kpSXcG1lZnDDPsZI6LLx
         DRcii/GW1MdN1c+Me3xUDxX3/yHucdxZROS/mYxFrbBjCmBI3ILfMwd+PKCLAifPguP2
         9gYlRlmpJ+fr5XXOuTr5UBp3qD22F1t6RlsI+Sc0fF5E4ZkvgHorfs/l1J4LM4QXRUr3
         oPWrhCx6YAKDyrggZtNYoguodMn7ilJ9RZzgpdBciLQsXTW5X+pCd93mf9KDBCiX1uvC
         iF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460402; x=1792065202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VtIlXzbZpBsjilW6PVdSkWToCAg9NZ6bfmznCf9pr8c=;
        b=SFs4ZzoMPu2LeitVqcxwbERCyEHLS80M9LjHXjFie6PiAyWerE7x8XXFfvdJXEJoPv
         PpxYhFDHPr+V3p1+8l6PqNO3nzyZHfedYxT1e2aPjGOsWxtt3mh3bnWMpmLE1UlLreRp
         BlZ2mo1qguqzln9FZIAjSG0/wSAxPW+ZHKZJioz9hdDEMgwu4nSQSQM+b6CEyIFie1vL
         ThZqNL4NMLD+lSW5GKTncuaBc7UukAnuKGQQW8+XzMV8qB6PtAtf87LAkzBkhn6/2wym
         Rfs4Luwc+7UwznoVKs3q5Ni/tyaa9rueM2okqutVKi0gJ1l8atf5gpgwEwVeQgV1YRxU
         rNlg==
X-Forwarded-Encrypted: i=1; AKwUvBywwBjXoYDQHt7IVBe92PNQC6feS3a6XRIzSp6OclkCnNxRW2rtthelnrAl+cKj9eIqs/4g43fQhbR576g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxYeI875VPewi63q/wvVjIzQhuYGGudwxrBcA+PcRrbJKu5TE0
	3EwCeQGX9xHL0epqOFZYGllmIWi68jFmRqKPQgZgP9Hm7L6E/Dz9Tqqx
X-Gm-Gg: AYBFou0VhTheyejcGaoS7/HNtAW37p8Tma1b9v9kbZ3spMMIZdRiE1ZvgG55m5xVfZK
	zibRyqYLNXVPm+XpvKIkVAFpssLPs1WtjO5t9Qkm82JXELTZm9ZjtuFEOZKNyflSd6x8TI/+80R
	mlbpi5rdy9DW00cb3wlMofPFX02h+5f+aB1VccFnj1pYtqpJAaW1/tfaUdUQ6voADkXKA696k+c
	R0ZmubwM0Hc4YZy88vQmAyy5r6rOl8JutxRB1jysL/sHga/n2+C5diWJlTocsJvHSNmF0z7OzuF
	hBi8zX+Z4Jm1mZ4KObc3Vw/Bfdy8QYhpJ//nxkFZzz/Vc1LKZ4AtfbswRSZ26DLupR/qGnStGVM
	H9bygyyU5cuHkfheaQR9clChNlHm7sb9u4tC18IVAmduffIlWP4VjpoJR5Scs5sFhZ67EqUBmbI
	4FkU8S8cx7RXm/n9L78NsvqsYMVxQaOKKOJSOjQ3hzOkOjU55MEMAa5iAdexvzROiUJf5/o7RfY
	xF1olBD2R5acl2jCRSBrW7hXT1pWSpywZt4YE5coA==
X-Received: by 2002:a17:90a:e7cb:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ab0c8098d6mr821478a91.16.1791460402483;
        Thu, 08 Oct 2026 04:53:22 -0700 (PDT)
Received: from carrot.taila25129.ts.net (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1c17b63sm4760164a91.12.2026.10.08.04.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:53:20 -0700 (PDT)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Jake Labelle <southampton.jake.labelle@gmail.com>
Subject: [PATCH 2/2] nilfs2: validate directory position after llseek in readdir
Date: Thu,  8 Oct 2026 20:52:48 +0900
Message-ID: <20261008115312.18482-3-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008115312.18482-1-konishi.ryusuke@gmail.com>
References: <20261008115312.18482-1-konishi.ryusuke@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jake Labelle <southampton.jake.labelle@gmail.com>

nilfs_readdir() uses ctx->pos, which userspace can set to an arbitrary
value via llseek, as an offset into the directory folio and parses
whatever bytes sit there as a directory entry.  A position pointing
into the middle of an entry -- or at unused bytes of a corrupted image
that the page validator never inspected -- makes dir_emit() copy up to
255 (name_len) bytes from a bogus entry, possibly reading past the end
of the folio and returning unrelated memory contents to userspace.

Snap unaligned positions onto a valid entry boundary by walking the
rec_len chain from the chunk start before parsing, as ext2 does in
ext2_validate_entry().

[ryusuke: fixed offset wrap-around in nilfs_validate_entry() and
 conformed AI tag to guidelines]

Fixes: 2ba466d74ed7 ("nilfs2: directory entry operations")
Assisted-by: Claude:claude-mythos-5
Signed-off-by: Jake Labelle <southampton.jake.labelle@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/dir.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/fs/nilfs2/dir.c b/fs/nilfs2/dir.c
index 8b53802b6ebd..7686ca9228fc 100644
--- a/fs/nilfs2/dir.c
+++ b/fs/nilfs2/dir.c
@@ -231,11 +231,27 @@ static struct nilfs_dir_entry *nilfs_next_entry(struct nilfs_dir_entry *p)
 					  nilfs_rec_len_from_disk(p->rec_len));
 }
 
+static inline unsigned int
+nilfs_validate_entry(char *base, unsigned int offset, unsigned int mask)
+{
+	struct nilfs_dir_entry *de = (struct nilfs_dir_entry *)(base + offset);
+	struct nilfs_dir_entry *p =
+		(struct nilfs_dir_entry *)(base + (offset & mask));
+
+	while ((char *)p < (char *)de) {
+		if (p->rec_len == 0)
+			break;
+		p = nilfs_next_entry(p);
+	}
+	return (char *)p - base;
+}
+
 static int nilfs_readdir(struct file *file, struct dir_context *ctx)
 {
 	loff_t pos = ctx->pos;
 	struct inode *inode = file_inode(file);
 	struct super_block *sb = inode->i_sb;
+	unsigned int chunk_size = nilfs_chunk_size(inode);
 	unsigned int offset = pos & ~PAGE_MASK;
 	unsigned long n = pos >> PAGE_SHIFT;
 	unsigned long npages = dir_pages(inode);
@@ -254,6 +270,24 @@ static int nilfs_readdir(struct file *file, struct dir_context *ctx)
 			ctx->pos += PAGE_SIZE - offset;
 			return -EIO;
 		}
+		/*
+		 * ctx->pos comes from userspace via llseek and may point
+		 * into the middle of an entry -- or at unvalidated bytes
+		 * of a crafted image. offset is only nonzero here on the
+		 * very first iteration (subsequent pages always start at
+		 * offset 0, which -- like any chunk boundary -- is always
+		 * a legitimate entry start, since no rec_len chain crosses
+		 * a chunk boundary). Snap a non-chunk-aligned offset onto
+		 * a real entry boundary by walking the chain from the
+		 * enclosing chunk's start, as ext2 does; otherwise
+		 * dir_emit() copies name_len bytes from a fake entry,
+		 * reading past the end of the folio.
+		 */
+		if (offset & (chunk_size - 1)) {
+			offset = nilfs_validate_entry(kaddr, offset,
+					~(chunk_size - 1));
+			ctx->pos = ((loff_t)n << PAGE_SHIFT) + offset;
+		}
 		de = (struct nilfs_dir_entry *)(kaddr + offset);
 		limit = kaddr + nilfs_last_byte(inode, n) -
 			NILFS_DIR_REC_LEN(1);
-- 
2.53.0

