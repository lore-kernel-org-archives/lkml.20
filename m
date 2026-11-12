Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482272;
	b=EOF0FjH5yviSYrijR6P3C4sipEHFKy2NFrDikryxBtlbbV05U5oX3/4hscpdLLRDQKsZ
	 fADLb3c86uIi97kyjn4xTzkei1w8lIAlr6ApAM1OPt4VcIXpTHOBIJnMB4+13OXJo33KQ
	 m+sjU962a4+i8BqU1m+j/cvvk+XUUYhc4516JY1TiHdckRijM0z2PXA0nB7VV05bGUMid
	 u6Cc9iB6SKHFZmpIt3NDc4yundgA78jerZByMO0P2nwc5b2OISXmcq3XE8gUpmQR1taAG
	 3FDvKbHT02tuSekOm4oz5faRM2TUUoD0XN55ueRpENCcKrwoft3iUyiNNvA2jEy91mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5JX8MQEngV9RKQVBr6UAo6pqNiwSuLgCFMMfBJhECyQ=;
	b=C6cbR6zhZDcfniKy5KKXaUU82U2hp75m87SLz2vyAxPOK5jiXgh9jfiaWshrIFnllqs5
	 YGi2xSQ9sNs8cViS2cY0tn3QbMZiv+I5ieXv4j12xGSqzLVDcbiH/3WnKxdIdeAyfMqB7
	 S4+MlNYIera5EfuIgAQjnw78MCCERS/bEWH+DrKV1xidGIkZmU2JB7EecIgDfqpr8thqO
	 PbP28sdTdpeNuC5vDwOyjlQ5d0F7KkjBizfXqMvQEdTylGP+lFWH65fNJlo/oy0vEaw5L
	 TI94Xr8/Q360fpnowK20c3FgFIsZ5dIQuUqlvkThOeGzrQqIGwiCpyMLefXfLm/7YzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Xx3HvdyE;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F170606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F170606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Xx3HvdyE
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93efc0452b5so273029185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794482271; x=1795087071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JX8MQEngV9RKQVBr6UAo6pqNiwSuLgCFMMfBJhECyQ=;
        b=Xx3HvdyE0KnJIIONqctDx06RfcjP1rwhsIIQ0Lt5BST5k5OBf1JBAwkRj+/dt+HVOU
         M8IOW0q0gQm28X6Kn8wyBAEvrgZx1NlivUSGVibPm5KJV4ONOe3sBOapY6hojub1LCdt
         hUiPfen6CGU/900YZdcjxtqeLlMBGuOBY5/dgXyt760G4Trl+vopJy1Fx2i1IU56rfb+
         MMm/L+jGwGPBkb9Op29f29cF/sxP1gF0JPT30rXIzQ6qokRmzfb4b+hdJMnuEQzRI78J
         R1IvnA23CwcSBeJto+GcWYVOQeSpPq05TLay0xf4/S0V6IVtKorkES3fV8vZeWdXEm/l
         w7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482271; x=1795087071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5JX8MQEngV9RKQVBr6UAo6pqNiwSuLgCFMMfBJhECyQ=;
        b=uM+PblbPvFzDwEapg9BtjegPJ7K7fDh60BOh1bzkQ3tVXGfwTFElwh7qSeOXOLjRmV
         zP4d85yAJb3RgBtvAnlmCWQ75YMDIN2nuSHiA1mZUt47xegQPn5UvpOKYfGFIyvtaPrC
         7d6KOvze+//bQnwqPJNjhGr6vXLCkJLLDvJHq8uCLBe8rfgp8pxuQwjw3j9R18oDhaoT
         qG0j7HOKWzU8ykqoy1tbDXEpA7+d9vROE3dHYb8LLsXgdhUW2ztu0SJYOFJxVw2GVy52
         nIeoz1Bl49w9fOxcZqFuM3IfgB2KjMOFmrJlggErfZNfA+H7gL2DjAY79I6+1xzM0pgA
         id/g==
X-Forwarded-Encrypted: i=1; AL+hErEEOoigkEabbnrBBXGyJp1BHcbbjwtFukvV0SjT1Q2OVIG8Q4P9Ha+qw56HZ0k83z/VZf3+Pc/J47z+q4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zTNi2kj7H4NmWnfeNi0sy4xeNl+ACVArD7pIoeJN2QxMrDWpW
	GYB7PW/hTgy7FkY+nO/tANb8H4QsRAwpXZVprz7uZCUaw35Vpu1NxWz5gtv+BB7A/Q==
X-Gm-Gg: AYBFou0g3FV/oKe0oiN/Bj1OKs2ZnvTM287sLnTrQ0zCP+C7v16ROyjZJValsSen28K
	w87KVhOEI3a5kvNeYrLqq5gRRYUnqY3FY/vMvGgW3GNUSvPdph1JJdj3/DIjCdqfxlx2Vi9HF0l
	c3oY+fo3r6Mz1MVP6Zqqfy2iIKCwYESRqxKfoPZLgOy4thszxP2mVanX7eRKtSRLzBAfnpu5RNP
	7JEF8Y017JcpSSbH1WgwXG+35ZeUDaB2llyIFd3eHa3aC3x1LX9q1LGVgPhGoiQxx9QiVnzwGqt
	37rIKU3lJuJrNqzI/nmxsl9Eg+ANWckinX0la0e2CQKTA/o4SIU90pPHJFWLF3F+t4XZ4liA8t7
	BnOAdOYOGLW1k/AGdCNDAHaSDR1LeRECWzX78X+LQWlhqufjh4y4Vjuen6h1hrxWGqZEOS3jY+x
	eX+pKwEeW2QaOizdJFSL3SfhoMVg8CCCZNZgbNQCynyGoxUiaoN4vzm6GQ8tGxh5jPPhaszz3UR
	fqGAe4l41rAsarboUU2mzisglZIOWTJW/qkZ1hApqRb0sEJWsuHIGzZBCpxdqkFhH6pQtm+s0cL
	aA7/hu3nwT798RJcyXhG+aVMR9Ps2DdqUV0CNLYwVPsoALpF0vTa
X-Received: by 2002:a05:620a:394b:b0:947:1d0a:c8b4 with SMTP id af79cd13be357-947b0008a65mr834833885a.56.1794482271052;
        Thu, 12 Nov 2026 03:17:51 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73c3ddsm710100585a.15.2026.11.12.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:17:50 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] hfs: do not end readdir at i_size after an unlink
Date: Thu, 12 Nov 2026 06:17:44 -0500
Message-ID: <20261112111745.4094283-2-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112111745.4094283-1-hengyul@cs.unc.edu>
References: <20261112111745.4094283-1-hengyul@cs.unc.edu>
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

Commit 7fde7e806657 ("hfs: rework hfsplus_readdir() logic") stopped
moving the position of open directories back when an entry is deleted.

However, hfs_readdir() still ends when ctx->pos reaches i_size, and
i_size drops on every delete. As of now, a program that reads a
directory and deletes what it read sees the directory end early and
leaves files behind.

The issue can be reproduced with BusyBox rm on a new hfs volume:

    mkdir /mnt/d
    (cd /mnt/d && for i in $(seq 1500); do : > f$i; done)
    rm -r /mnt/d

Before commit 7fde7e806657 ("hfs: rework hfsplus_readdir() logic"),
the directory is removed. After that commit, the result is:

    rm: can't remove '/mnt/d': Directory not empty

and 304 files are left.

This patch will end a walk that continues from the saved key where the
records of the directory end, and keep the i_size check for a walk that
starts from a position.

Fixes: 7fde7e806657 ("hfs: rework hfsplus_readdir() logic")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Application impact (Ubuntu 26.04 user space): a folder with 1500 files
on an HFS volume is moved to the trash, then the trash is emptied with
"gio trash --empty" (the call behind "Empty Trash" in GNOME Files, done
by gvfsd-trash 1.60). On v7.1, all files are removed. On v7.2, the trash
looks empty, but 478 files stay in .Trash-0/expunged and their space is
not freed.

 fs/hfs/dir.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/fs/hfs/dir.c b/fs/hfs/dir.c
index b6b8945712a9..b0858512f4d2 100644
--- a/fs/hfs/dir.c
+++ b/fs/hfs/dir.c
@@ -51,10 +51,16 @@ static int hfs_readdir(struct file *file, struct dir_context *ctx)
 	char strbuf[HFS_MAX_NAMELEN];
 	union hfs_cat_rec entry;
 	struct hfs_find_data fd;
-	struct hfs_readdir_data *rd;
+	struct hfs_readdir_data *rd = file->private_data;
+	/*
+	 * i_size follows the valence and drops on unlink, so it says nothing
+	 * about a walk that continues from a saved key. That walk ends where
+	 * the records of this directory end.
+	 */
+	bool resume = rd && rd->pos == ctx->pos;
 	u16 type;
 
-	if (ctx->pos >= inode->i_size)
+	if (!resume && ctx->pos >= inode->i_size)
 		return 0;
 
 	err = hfs_find_init(HFS_SB(sb)->cat_tree, &fd);
@@ -93,10 +99,9 @@ static int hfs_readdir(struct file *file, struct dir_context *ctx)
 			goto out;
 		ctx->pos = 2;
 	}
-	if (ctx->pos >= inode->i_size)
+	if (!resume && ctx->pos >= inode->i_size)
 		goto out;
-	rd = file->private_data;
-	if (rd && rd->pos == ctx->pos) {
+	if (resume) {
 		memcpy(fd.search_key, &rd->key, sizeof(struct hfs_cat_key));
 		err = hfs_brec_find(&fd);
 		if (err == -ENOENT)
@@ -105,10 +110,12 @@ static int hfs_readdir(struct file *file, struct dir_context *ctx)
 		err = hfs_brec_goto(&fd, ctx->pos - 1);
 	}
 	if (err)
-		goto out;
+		goto end_walk;
 
 	for (;;) {
 		if (be32_to_cpu(fd.key->cat.ParID) != inode->i_ino) {
+			if (resume)
+				goto out;
 			pr_err("walked past end of dir\n");
 			err = -EIO;
 			goto out;
@@ -146,11 +153,11 @@ static int hfs_readdir(struct file *file, struct dir_context *ctx)
 			goto out;
 		}
 		ctx->pos++;
-		if (ctx->pos >= inode->i_size)
+		if (!resume && ctx->pos >= inode->i_size)
 			goto out;
 		err = hfs_brec_goto(&fd, 1);
 		if (err)
-			goto out;
+			goto end_walk;
 	}
 	if (!rd) {
 		rd = kmalloc_obj(struct hfs_readdir_data);
@@ -162,6 +169,10 @@ static int hfs_readdir(struct file *file, struct dir_context *ctx)
 	}
 	rd->pos = ctx->pos;
 	memcpy(&rd->key, &fd.key->cat, sizeof(struct hfs_cat_key));
+end_walk:
+	/* This directory can hold the last records of the catalog. */
+	if (resume && err == -ENOENT)
+		err = 0;
 out:
 	hfs_find_exit(&fd);
 	return err;
-- 
2.53.0

