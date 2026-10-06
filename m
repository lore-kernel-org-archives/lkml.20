Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FD23B71B0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791271632; cv=none; b=Xta+NI3UKNJi4OHgrZocbeIyDkwMPdzBRnnA3Tgd6/eE/BCb5SLqdWzxeLY/Fih/J262NbMTuR0mwJ3XL3Z7TTeZDFB6Nn3lwIvCnBBmSubJivIuaqeQlszUh1MH/7QpLSIXCnrs0SmLEfX5mwBjYtTa8G2KNya41eQUGGIJzNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791271632; c=relaxed/simple;
	bh=cgNh/BTXPK/thsIkKPZplYMk7nSh77DViLwK2KBSJXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lv1OxwrVH8IE54jsdlfq5A40ZJF/npnB9l/IwXZysNlnbfriN5ePyijikO64W8rkAONyTzIKQufXmlwvatTjBBC42XY3FqvzLF/f3kalTbw3CwvHZdB+Ho5wJXh4otvEboipJeRuv+si65opdcxO1q9mJa8vJMUt+Pr2xYfVH+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNWORtgH; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNWORtgH"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-31490970b97so368615eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791271627; x=1791876427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7C/fJA2TfMnhKgLmZcqMYK5INnBNQ9UzDhECLQ41cVs=;
        b=LNWORtgHutziycuw++UYbF2i38XdMSEDmJce9EaW5k7kk07lJFZybrMem9iVy9oCcU
         WtlkTwf+ZsTVOsCK8by3UtqGbTUH0n0T4MJG1FxmMgD/Aw2ivUVkPLSudfcCp5pdmNYl
         uhF1WGk2QO7Vtq+UVqSCPUyqp77eQQFjK/XpxhRTIpO3IGxDITKaRrpRXFtjt0rR+7FV
         pePRAoyZBtVWaZcEtT6k0N1/QYgCdjnRjDBhjEuifWGSqQ0OFv49vUkXsjnYcdk5pCel
         113i+oV34NBv9xwIAuoBGbFyeR2ziH4TY2J67v8d0kiqarK205TnMI3Ld7UyYyQMB2RM
         qWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791271627; x=1791876427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7C/fJA2TfMnhKgLmZcqMYK5INnBNQ9UzDhECLQ41cVs=;
        b=mVr0TTA82xtqhsxhfFerA7hySesXPrP7yRSxdvGqnM4ZVNXhFMIAejl4q/FO3Myi6Y
         lec1SpjO+Edm2bdv1ci5XUoM1uFFZjGtx95eUTL2gIIy9uzSNkFF0lP951fzVpT/M2mt
         mx9TUpCxoxNLPljILeXJKc0+oeeznSI0TO/qrP7m3hkEFT7tTMxaCk8lD2SkYbz2NOrl
         9P7RO8bhNburng95xKAliD7LZTd3zxXlPGW0Sv3vI5mGXsG6WbDrUIsFlEHyTw+GbrT9
         OXnOITmbaBz9R9qgdwoFZZmdY9G2HK/J6f627Y3KjAnD4OjqQb4a9STgbIb44E0q8UAm
         YTYA==
X-Forwarded-Encrypted: i=1; AKwUvBxVg7fexv+h3dTXgswyy9S9koUE1aD0dIdbUM+9tcYT3wrBb6BViYlyQJwORbvAzpSbx+AWM7vh131DEc8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4gg4ANqFUjUhkqDIlHxsxypWfrV5PnQv1SNWxKR4IklVtckHJ
	yNwOtV+0G4HD8/r/D8dS2+Q5nllwux8kF4YdAUJ9HodKFaKBXRkJhL6c
X-Gm-Gg: AYBFou0+o8Tdkb8KX08j0n1ZTLEjlFBRqUuhIS1w/EHsOqcF3BnaBmLMu1y1RKUwElH
	KrZMqkk43S5Uc/kZKST3zlF15UHjC3ebMlfoDprZYQoaHYLNWKF1ZGeq+/y6to2yBZtavaTHWp/
	FLnJC0p0knBzgESAHKLSDUfRbkbBMcF6ebmsBBZ3+6XH5qBtHs8yl1BKTc4ki8DDxXK4eotmx2w
	sBDumM9RZIBxgtHrtAClIdxu+TSNdEzrekKRMEDhfpwOYaMl+g7UFJi67AH7K3cAwHXsvlI4DFR
	guv2lWfmdkAWRg8HdGxJF2aA7c423acKe+7zAfyZNAN8wYRrodhnPIuWkYTc88l/K8ksqP1daUq
	HNhaHWuxrEXsqARIOxzhznMnwSK0jidGiyOlOT0Cgqa8ETaa8xQxFGfYPeNtD7oMayatbUq4G3W
	DP/NV1+7R2d3aD7Semo8axvC7osVAmgCKMDEbqf0T76NO5NsMJW3mNsgtOTZKSsbBPRXKsjazvb
	gFWZtIT24A1rxwKiJnu4duR965TKg2AP9WLKgQVpfJ0Yl2H2qR0Fl5f4MHl5etf2Q==
X-Received: by 2002:a05:693c:87cb:20b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3514e332f69mr577678eec.27.1791271627006;
        Tue, 06 Oct 2026 00:27:07 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:849b:b595:7489:bfea])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a299cdsm4948418eec.12.2026.10.06.00.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:27:06 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: shaggy@kernel.org,
	rppt@kernel.org
Cc: yun.zhou@windriver.com,
	arnd@arndb.de,
	brauner@kernel.org,
	jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com
Subject: [PATCH] jfs: fix slab-out-of-bounds write in jfs_readdir() with multibyte names
Date: Tue,  6 Oct 2026 12:56:56 +0530
Message-ID: <20261006072656.11800-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a KASAN slab-out-of-bounds write in utf32_to_utf8(),
reached via jfs_strfromUCS_le() from jfs_readdir() while handling
getdents64() on a crafted JFS image.

jfs_readdir() converts on-disk UTF-16 directory entry names into
dirent_buf, a PAGE_SIZE buffer. Before converting an entry, it checks
that the name fits by assuming one output byte per UTF-16 unit:

    jfs_dirent + d->namlen + 1 > dirent_buf + PAGE_SIZE

With iocharset=utf8 a single UTF-16 unit can expand to up to three
bytes, so a name can be approved for space it does not have.

jfs_strfromUCS_le() makes this worse: it has no destination size and
always passes NLS_MAX_CHARSET_SIZE as the output bound to uni2char(),
so the converter believes it has room regardless of how much of the
buffer is actually left. The conversion then writes past the end of
dirent_buf, and the trailing NUL can land one byte out of bounds too.

Fix this in two places:

 - In jfs_readdir(), reserve the worst case of NLS_MAX_CHARSET_SIZE
   bytes per UTF-16 unit when checking whether an entry fits.

 - Give jfs_strfromUCS_le() a destination size (tolen) and pass the
   real remaining space to uni2char() instead of the constant, keeping
   one byte for the terminating NUL. Clamp the length in the
   non-codepage path in the same way. Callers pass the distance to the
   end of dirent_buf.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a2748ba908c108e7e525
Tested-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com
Assisted-by: LLM
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/jfs/jfs_dtree.c   |  8 +++++---
 fs/jfs/jfs_unicode.c | 15 ++++++++++++---
 fs/jfs/jfs_unicode.h |  2 +-
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 8ce6e4458cc2..5ccc90e3c068 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2738,6 +2738,7 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 	int jfs_dirents;
 	int overflow, fix_page, page_fixed = 0;
 	static int unique_pos = 2;	/* If we can't fix broken index */
+	char *buf_end;
 
 	if (ctx->pos == DIREND)
 		return 0;
@@ -2892,6 +2893,7 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 		return -ENOMEM;
 	}
 
+	buf_end = (char *)dirent_buf + PAGE_SIZE;
 	while (1) {
 		jfs_dirent = dirent_buf;
 		jfs_dirents = 0;
@@ -2910,7 +2912,7 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 
 			d = (struct ldtentry *) & p->slot[stbl[i]];
 
-			if (((long) jfs_dirent + d->namlen + 1) >
+			if (((long) jfs_dirent + (long)d->namlen * NLS_MAX_CHARSET_SIZE + 1) >
 			    ((long)dirent_buf + PAGE_SIZE)) {
 				/* DBCS codepages could overrun dirent_buf */
 				index = i;
@@ -2961,7 +2963,7 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 			}
 
 			/* copy the name of head/only segment */
-			outlen = jfs_strfromUCS_le(name_ptr, d->name, len,
+			outlen = jfs_strfromUCS_le(name_ptr, buf_end - name_ptr, d->name, len,
 						   codepage);
 			jfs_dirent->name_len = outlen;
 
@@ -2981,7 +2983,7 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 					goto skip_one;
 				}
 				len = min(d_namleft, DTSLOTDATALEN);
-				outlen = jfs_strfromUCS_le(name_ptr, t->name,
+				outlen = jfs_strfromUCS_le(name_ptr, buf_end - name_ptr, t->name,
 							   len, codepage);
 				jfs_dirent->name_len += outlen;
 
diff --git a/fs/jfs/jfs_unicode.c b/fs/jfs/jfs_unicode.c
index 0c1e9027245a..bcff7e0031b2 100644
--- a/fs/jfs/jfs_unicode.c
+++ b/fs/jfs/jfs_unicode.c
@@ -16,27 +16,36 @@
  * FUNCTION:	Convert little-endian unicode string to character string
  *
  */
-int jfs_strfromUCS_le(char *to, const __le16 * from,
+int jfs_strfromUCS_le(char *to, int tolen, const __le16 *from,
 		      int len, struct nls_table *codepage)
 {
-	int i;
+	int i, room;
 	int outlen = 0;
 	static int warn_again = 5;	/* Only warn up to 5 times total */
 	int warn = !!warn_again;	/* once per string */
 
+	if (tolen <= 0)
+		return 0;
+
 	if (codepage) {
 		for (i = 0; (i < len) && from[i]; i++) {
 			int charlen;
+			room = tolen - outlen - 1;
+			if (room <= 0)
+				break;
 			charlen =
 			    codepage->uni2char(le16_to_cpu(from[i]),
 					       &to[outlen],
-					       NLS_MAX_CHARSET_SIZE);
+					       room);
 			if (charlen > 0)
 				outlen += charlen;
 			else
 				to[outlen++] = '?';
 		}
 	} else {
+		if (len > tolen - 1)
+			len = tolen - 1;
+
 		for (i = 0; (i < len) && from[i]; i++) {
 			if (unlikely(le16_to_cpu(from[i]) & 0xff00)) {
 				to[i] = '?';
diff --git a/fs/jfs/jfs_unicode.h b/fs/jfs/jfs_unicode.h
index b6a78d4aef1b..ea03dd5a0e0c 100644
--- a/fs/jfs/jfs_unicode.h
+++ b/fs/jfs/jfs_unicode.h
@@ -12,7 +12,7 @@
 #include "jfs_types.h"
 
 extern int get_UCSname(struct component_name *, struct dentry *);
-extern int jfs_strfromUCS_le(char *, const __le16 *, int, struct nls_table *);
+extern int jfs_strfromUCS_le(char *, int, const __le16 *, int, struct nls_table *);
 
 #define free_UCSname(COMP) kfree((COMP)->name)
 
-- 
2.43.0

