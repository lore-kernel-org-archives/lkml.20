Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482274;
	b=IQnGlDT3ZcpxGubruqSJYP8rEe1gCEtQfHvkyjFukhlJM3m2e33OnUVt0TnBafScjGs3
	 zHUCa8OY88z12/nOgxSMyG06etJhsf7bVDJ8rkbQFstWr8yvrLTiMZWFjZpyHwR6re4TX
	 tRZ4yNH4AOEfjyyXbCvxGxeisz95D1l7BqstTecbpQxj69BdNatLQ6iLBm7+HZbTt9mmQ
	 ReKYBDXURA/7twFV2uZku8cKDdqssC8+zcIyF023Gb+/dUqO/obyJA4COOZy4V5KxL8lU
	 SIq1MyFp9xfrA4T3aMJwKemg2/qjeAEQBlwYB/uMda7xhnkILF/nRAmhERHLMhtXKDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOaR3H7k5OmOapzitXVwDOMX6LeeOcetR9gDymis4sg=;
	b=n449joWOp2shOxhim6ISUZwPM8wxw+O68uU2qicGyigHNPvITHFn8dZRhl75dnkykHX5
	 u88AmaQIHpji1dACXnY40ev6rupy/0I/VZTqOmCfhvECI99qwiASm00lAbx9yDKYeZ+JP
	 pLt61kd70ZoABDVYjqcZsME7ThpVMZB853HGcfojm/fmMUDpgXNFkI8VY+ZxhyUQPMA42
	 /4EGKS8ezRr3e9693bs0xaLxrMhJXq7tJg2UCt86USlPeigR/y2QW98AxiqZRX7N8KZYr
	 9FfgdY/L0JPXMFBOLtXvSoUal4bxRf1Saoqv0hUusuo277RgxsYVwxAuV6QYU5BVbcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=lMaSgk62;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72080606A882
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72080606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=lMaSgk62
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53381e53b80so52340391cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794482273; x=1795087073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOaR3H7k5OmOapzitXVwDOMX6LeeOcetR9gDymis4sg=;
        b=lMaSgk62QClSs2cDettt3zL+4JrB+p8oqo+GkBrqpR+xjK5gkZY3PRUAm0Dm8PjcEh
         9cNRr5Eme9k/QDrnigEem5F/q3jGXW/woWdoIqPy7NmotvmOysDhM0dFtrNpfvmXyzmO
         i6c3V0/pMLLQarWO451oZWvhvxRzBAPOE5db43wo+5hX01kO5oTH5UPxCJLEJA3HAOO8
         2123B/oxj1VkzOu85ERJEmE9G3/9SuyokuS6+8FaDTNSU2LziDuvkIrgHYctyIUiWGra
         /pPvUU29APYBlSmz5P68i76B0fMJ90qDTX4Wq9Oh2zlciJP4fj8g3YtG/FtjDgwefIyd
         lAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482273; x=1795087073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOaR3H7k5OmOapzitXVwDOMX6LeeOcetR9gDymis4sg=;
        b=qrJs6IZFcKjVl7J+/nhuKiVFnAZwXmMXrkIpxuOMRAI8dckBHiTWdlDGn6QWWWVUyq
         b1HHmB8zEroSbb7UU9AFVG9GaoYppEAX4vHDu4MIIs/X2hSJ7uh1wJMYGZpqUtTVz7wg
         dYUSIYnox+qNkV0l25SltyQZyc8O41FlIAAYxLr2LfD5TSvUN/gy/UKd6REVd3tAhkmX
         J66wNq8xzUBd1OmqCw/qA57tyoAM1CLzYmsal6mFte/R5MvDGxIodCT5t4aFO2I4lyYF
         Pj4sQulJBhzaods4lnim9AqxJhf8qj29YQNX1ccvV8WfHl2tZb3AgL5lfpGA3oMW/jM9
         EEvw==
X-Forwarded-Encrypted: i=1; AL+hErHHppJg3csS74t6I/ySqkLezMOHzMQTXWtzPog8JSrOPDyU4tZ4wLvwuw8hTt6nwcVrxEwblcnTrOFBSdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LRJx4RMEZxOi5nc0tZV5EkHdH9jIU2f67Gg1h3clrBJEjF2h5
	SZaoMB7bbasU1Kl3PT4tp5R1WvaBLCf4VkjWlJoJYi6hcM5rly1jLIiN2mw3Ry5aMg==
X-Gm-Gg: AYBFou3EuOdzprCxJ9X4TX2NVB2tSpdgTN8G6JSwc+TjYs7iiZG6A17gUaBHW+Jjy4n
	33cHbtsjOtZ5Ap9MnI8gyOWK+vr+9eKmJ5KDrkw4WLyeuhC6zswvlPuXCkHvU8EaGOhgsVgIrA9
	Y/3N7ysNs1h4SJ6tneIj/Ft3JgsxUh0CbV4EImkm/fe86UHv9YdT2LaMEsVL2upGzZ+bKTkPkMu
	CdKnuqmEwDC6n65qTlov7s5LIalrw72eTpPhlBOFU7qrsHPbSpq4a2OBrit8f2ZwqCy0bVjJQ+6
	4QI8zvPeunfPeORJ0eL2XBsx9/QnyCKKW0YzEDR68VgIqmcU7rnvy8JKgeEqa9h7hEz+cQcYFZ7
	FLKXM9wOmuQi0ul6fRMbCoJCG5OgKO4dUliSAO65mljr4UdL/+DABdQK9hT2pIuk8t88A5OlSwi
	GyWbclmsCNpjZmhTXzw54vROd+ch5neBHM45hjNl/JPuj+i7PkWMZi8YHKu7q8nx5Y+UA/F/Bvc
	wUEUxIX8LdNgydO1d9GflltYugS/ETBsywUKm5rTHw7KCQZhWxEtJ1etMztwkxIkpAaLrezsjbk
	TcPz8wVXxkpQhRQTPQxE3qcQIPXPng7p2GK4i+khnnKeqG4GuYqC
X-Received: by 2002:a05:620a:470e:b0:93e:c12c:f124 with SMTP id af79cd13be357-947b00c9938mr879475585a.80.1794482273450;
        Thu, 12 Nov 2026 03:17:53 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73c3ddsm710100585a.15.2026.11.12.03.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:17:53 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] hfsplus: do not end readdir at i_size after an unlink
Date: Thu, 12 Nov 2026 06:17:45 -0500
Message-ID: <20261112111745.4094283-3-hengyul@cs.unc.edu>
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

Commit 4b0496432844 ("hfsplus: rework hfsplus_readdir() logic") stopped
moving the position of open directories back when an entry is deleted.

However, hfsplus_readdir() still ends when ctx->pos reaches i_size, and
i_size drops on every delete. As of now, a program that reads a
directory and deletes what it read sees the directory end early and
leaves files behind.

The issue can be reproduced with BusyBox rm on a new hfsplus volume:

    mkdir /mnt/d
    (cd /mnt/d && for i in $(seq 1500); do : > f$i; done)
    rm -r /mnt/d

Before commit 4b0496432844 ("hfsplus: rework hfsplus_readdir() logic"),
the directory is removed. After that commit, the result is:

    rm: can't remove '/mnt/d': Directory not empty

and 304 files are left.

This patch will end a walk that continues from the saved key where the
records of the directory end, and keep the i_size check for a walk that
starts from a position.

Fixes: 4b0496432844 ("hfsplus: rework hfsplus_readdir() logic")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Application impact (Ubuntu 26.04 user space): a folder with 1500 files
on an HFS+ volume is moved to the trash, then the trash is emptied with
"gio trash --empty" (the call behind "Empty Trash" in GNOME Files, done
by gvfsd-trash 1.60). On v7.1, all files are removed. On v7.2, the trash
looks empty, but 478 files stay in .Trash-0/expunged and their space is
not freed.

 fs/hfsplus/dir.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/fs/hfsplus/dir.c b/fs/hfsplus/dir.c
index b3a1193a491f..81fe8a3e07c9 100644
--- a/fs/hfsplus/dir.c
+++ b/fs/hfsplus/dir.c
@@ -135,10 +135,16 @@ static int hfsplus_readdir(struct file *file, struct dir_context *ctx)
 	char *strbuf;
 	hfsplus_cat_entry entry;
 	struct hfs_find_data fd;
-	struct hfsplus_readdir_data *rd;
+	struct hfsplus_readdir_data *rd = file->private_data;
+	/*
+	 * i_size follows the valence and drops on unlink, so it says nothing
+	 * about a walk that continues from a saved key. That walk ends where
+	 * the records of this directory end.
+	 */
+	bool resume = rd && rd->pos == file->f_pos;
 	u16 type;
 
-	if (file->f_pos >= inode->i_size)
+	if (!resume && file->f_pos >= inode->i_size)
 		return 0;
 
 	err = hfs_find_init(HFSPLUS_SB(sb)->cat_tree, &fd);
@@ -183,10 +189,9 @@ static int hfsplus_readdir(struct file *file, struct dir_context *ctx)
 			goto out;
 		ctx->pos = 2;
 	}
-	if (ctx->pos >= inode->i_size)
+	if (!resume && ctx->pos >= inode->i_size)
 		goto out;
-	rd = file->private_data;
-	if (rd && rd->pos == ctx->pos) {
+	if (resume) {
 		memcpy(fd.search_key, &rd->key, sizeof(struct hfsplus_cat_key));
 		err = hfs_brec_find(&fd, hfs_find_rec_by_key);
 		if (err == -ENOENT)
@@ -195,9 +200,11 @@ static int hfsplus_readdir(struct file *file, struct dir_context *ctx)
 		err = hfs_brec_goto(&fd, ctx->pos - 1);
 	}
 	if (err)
-		goto out;
+		goto end_walk;
 	for (;;) {
 		if (be32_to_cpu(fd.key->cat.parent) != inode->i_ino) {
+			if (resume)
+				goto out;
 			pr_err("walked past end of dir\n");
 			err = -EIO;
 			goto out;
@@ -263,11 +270,11 @@ static int hfsplus_readdir(struct file *file, struct dir_context *ctx)
 		}
 next:
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
 		rd = kmalloc_obj(struct hfsplus_readdir_data);
@@ -279,6 +286,10 @@ static int hfsplus_readdir(struct file *file, struct dir_context *ctx)
 	}
 	rd->pos = ctx->pos;
 	memcpy(&rd->key, fd.key, sizeof(struct hfsplus_cat_key));
+end_walk:
+	/* This directory can hold the last records of the catalog. */
+	if (resume && err == -ENOENT)
+		err = 0;
 out:
 	kfree(strbuf);
 	hfs_find_exit(&fd);
-- 
2.53.0

