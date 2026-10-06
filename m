Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513AE1D432D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266010; cv=none; b=FPdyPPPoHl8sMa3uotGq0TO8c37QNnrqBGX8ffvkueY3KJsuCTPOiHLus7SKrjVK8Ye3AywHOcQWyjZ4oci4igm3xI3kphzJBTt5jwBKl7Ao4WEXs4KBM73VatILr725iOEZeLdCqEgWxf2qOL0FONUDPmqd0oldG4qrdisV5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266010; c=relaxed/simple;
	bh=lwGJsG4SCCQHllElMPk5NoYYAVbyAS72V/SXvW8JmC4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SPqr5XGsMZqRiW8BAMX/B6gWQvT47MMbX6zbfQWmkCKKm8wFMLbcnDXDvWKY6C/RDTjCAeJcPaHb/FfUQAjJBEfyxkTpTEcetSsW5ke4x3ioclr6EATNaGpWMZOmuZTl4MBsgfBUzXh14mssJc0L2rnc5oxfpxXgeWpv0bSRHW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f9b643ae53so1224231b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266008; x=1791870808;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G76ARqNBaPfC2OkFC8GL2aH2VtAkLidpGbUlbXNthR0=;
        b=S1OrRGsIvj6auQWpoeuMAp2/behghQnf/ObgBAtzMpQi0/rIX/wBM+2/zl9YAPhhRQ
         wyYbLngqu+qOfxmzSB55cGU0pYCCawwZk/ZJVeiWNb3/LqLFzqtoEhtJknc5V6o4Q8cH
         LzEfi3R82KzCMS+uzGnWAHhe7JaF6WdyEghwEjCrGf8tiz/BSCGWEGRQOHBEhbugYLf/
         mD+0Pcv9gdSdZ4xLZRl7yVpdxTiPNLguSuqBtWwM7bgRiAszwwBP/HA/tb/FcryvJ2sZ
         IjRrIs7Ltl3QJggCOW9QUoq6fCelve+j1UT4Sqy1fTeVKijd0+aU4BWsWolli9mPx+Vt
         HPhQ==
X-Gm-Message-State: AFuF++kXPoonnky2rq5Lx3YlDM8X7kescelRR7tmcszUeq4eHilmlxl0
	gixO+vJWV0k+WOTZGsXnhw0/m+HPWEkv5IYUTnm2b9ZZvjgr4oAo4DhWUeVtWtxYqGakNgVgLwm
	an4VidTbdZ00s4yYqi+oCKs2BJMthRROk1TKvWgkPx6Te4+Ev3Kq1ZwxfroQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:15a9:b0:4f5:eaac:5151 with SMTP id
 5614622812f47-4fb417c7e89mr449010b6e.39.1791266007824; Mon, 05 Oct 2026
 22:53:27 -0700 (PDT)
Date: Mon, 05 Oct 2026 22:53:27 -0700
In-Reply-To: <6ac3be67.34119e79.2f92f3.0035.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac48cd7.ae2c267a.265a6c.000e.GAE@google.com>
Subject: Forwarded: [PATCH] jfs: fix slab-out-of-bounds write in jfs_readdir()
 with multibyte names
From: syzbot <syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] jfs: fix slab-out-of-bounds write in jfs_readdir() with multibyte names
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


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

Reported-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a2748ba908c108e7e525
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
+				outlen = jfs_strfromUCS_le(name_ptr, buf_end - name_ptr , t->name,
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
+int jfs_strfromUCS_le(char *to, int tolen, const __le16 * from,
 		      int len, struct nls_table *codepage)
 {
-	int i;
+	int i, room;
 	int outlen = 0;
 	static int warn_again = 5;	/* Only warn up to 5 times total */
 	int warn = !!warn_again;	/* once per string */
 
+	if(tolen <= 0)
+		return 0;
+
 	if (codepage) {
 		for (i = 0; (i < len) && from[i]; i++) {
 			int charlen;
+			room = tolen - outlen - 1;
+			if(room <= 0)
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
+		if(len > tolen -1)
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

