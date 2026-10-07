Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB4F3BAD92
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791387780; cv=none; b=HRX67jxYjRzQMdGcaCCs0z6InP3Mvm2Nb+qFwC954FRIaHw006KK59SvS9b4RX7yQfZUAhaRsR/paR6XTfl2DyDxh1T7wwBDbPxlJfkU6qU7+QlxPrvhiwqzfsxm8igVIhrQMA3v6WueSCZjoWh8utmc6Ak1xO4ejUZU4dCLMM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791387780; c=relaxed/simple;
	bh=njOC8gNt5Jj8Xhx5PPo/vD2hNb6r0AsToW4zZDqOXU0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YeBXL2x7E9QZIdXx0vh9uRJ3pBM9t2nE5O3hH4CzRqZVUgGrOWMpdxYsRvFhzsGFfSkQm/Ts3wC0JdHIDJGfvLZAP1FLbTcr6zlU+BWg4lguR+rrCFHosVKdlDc+MHNHY8emqDJU+uWaOAL8pe0y2U+ylFpqBYVdRaIpF/xIPVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4fb73e868aaso2650453b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791387777; x=1791992577;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vD8PjLzspWQ6RnsuhN1kvzN23maf4mwbUo2TI8AxnI8=;
        b=cqxXqUh/f1b/uAmf+3rdvNz+oZRK7f0NnjMssiACwap/3iRLUrohXrKlCSNFQuNIMj
         LrDKg2wF5h25ZQjEZpImsmFM4HU3HzMLUmSlXxkDI/24m4E5wkwygMK2C6MZQCz/4RTV
         eyIEXesEQzjPFtdEvFmaiYbBsxrG6UXwHMxqWAn73TBNXkiB64oaAsvdQuNwh0ay2tjq
         ny6RjZ3zDLBBseygF9HEDnByQzwX73/u96fH/mq569ZpRh+XF/7DNkNhUCK6OOzU7kMZ
         8iD/drfLYrUHPdrKkBZZDrh450b5NfFrj3o2aU6jj5z27hNSoK7xqGNz/wwDaekDEO9L
         LUug==
X-Gm-Message-State: AFuF++kVY/JFj/PKnNYc2ACg9OsHOQ5ULIHbxcb0zZDNTtG3QfOCHZTS
	2ZrhCFte/DwdSlLHwSr7pW6trgUdTF2FSo1KEEdY0RuXbQrm51GD4bcnpuZTX18Z+1+Ix++1VZv
	VjEE94qon/YBSbZs5ApHK/qCx4s44++5cKKG7BBnf3owqFoGUGI0UI3wAuio=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10cd:b0:4fb:c2dd:c7ae with SMTP id
 5614622812f47-4fc435f3f9bmr2712671b6e.6.1791387777085; Wed, 07 Oct 2026
 08:42:57 -0700 (PDT)
Date: Wed, 07 Oct 2026 08:42:57 -0700
In-Reply-To: <6ac3be67.34119e79.2f92f3.0035.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac66881.a36481ec.1ba24c.0001.GAE@google.com>
Subject: Forwarded: KASAN: slab-out-of-bounds Write in utf32_to_utf8
From: syzbot <syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: KASAN: slab-out-of-bounds Write in utf32_to_utf8
Author: j.bhargav.u@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

From 17072f0e3fe2eb3e6e6323c60b52f3dee8c02e82 Mon Sep 17 00:00:00 2001
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 7 Oct 2026 02:49:53 +0530
Subject: [PATCH] jfs: fix out-of-bounds write in jfs_readdir()

jfs_readdir() converts on-disk UTF-16 directory names into a
PAGE_SIZE buffer. The existing space check assumes that each UTF-16
unit produces one output byte:

if (((long) jfs_dirent + d->namlen + 1) >
   ((long)dirent_buf + PAGE_SIZE))

This is insufficient for multibyte NLS encodings, where a UTF-16 unit
can expand to multiple output bytes. jfs_strfromUCS_le() also passes
NLS_MAX_CHARSET_SIZE to uni2char() without accounting for the space
actually remaining in the destination buffer, allowing the conversion
to write past dirent_buf.

Pass remaining buffer size to jfs_strfromUCS_le, Ensure that at least
NLS_MAX_CHARSET_SIZE bytes remain before calling uni2char(). If the
remaining space is insufficient, return -ENAMETOOLONG so jfs_readdir()
can retry the entry in a fresh buffer.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a2748ba908c108e7e525
Assisted-by: ChatGPT:LLM
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 fs/jfs/jfs_dtree.c   | 24 ++++++++++++++++++++----
 fs/jfs/jfs_unicode.c | 14 ++++++++++++--
 fs/jfs/jfs_unicode.h |  2 +-
 3 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 8ce6e4458cc25..7b80c34e841db 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2961,8 +2961,15 @@ int jfs_readdir(struct file *file, struct
dir_context *ctx)
  }

  /* copy the name of head/only segment */
- outlen = jfs_strfromUCS_le(name_ptr, d->name, len,
-   codepage);
+ outlen = jfs_strfromUCS_le(name_ptr,
+   (char *)dirent_buf +
+   PAGE_SIZE - name_ptr,
+   d->name, len, codepage);
+ if (outlen < 0) {
+ index = i;
+ overflow = 1;
+ break;
+ }
  jfs_dirent->name_len = outlen;

  /* copy name in the additional segment(s) */
@@ -2981,12 +2988,21 @@ int jfs_readdir(struct file *file, struct
dir_context *ctx)
  goto skip_one;
  }
  len = min(d_namleft, DTSLOTDATALEN);
- outlen = jfs_strfromUCS_le(name_ptr, t->name,
-   len, codepage);
+ outlen = jfs_strfromUCS_le(name_ptr,
+   (char *)dirent_buf +
+   PAGE_SIZE - name_ptr,
+   t->name, len, codepage);
+ if (outlen < 0) {
+ index = i;
+ overflow = 1;
+ break;
+ }
  jfs_dirent->name_len += outlen;

  next = t->next;
  }
+ if (overflow == 1)
+ break;

  jfs_dirents++;
  jfs_dirent = next_jfs_dirent(jfs_dirent);
diff --git a/fs/jfs/jfs_unicode.c b/fs/jfs/jfs_unicode.c
index 0c1e9027245a6..f73c718c5dd03 100644
--- a/fs/jfs/jfs_unicode.c
+++ b/fs/jfs/jfs_unicode.c
@@ -16,17 +16,25 @@
  * FUNCTION: Convert little-endian unicode string to character string
  *
  */
-int jfs_strfromUCS_le(char *to, const __le16 * from,
+int jfs_strfromUCS_le(char *to, int to_size, const __le16 *from,
       int len, struct nls_table *codepage)
 {
- int i;
+ int i, remaining_size;
  int outlen = 0;
  static int warn_again = 5; /* Only warn up to 5 times total */
  int warn = !!warn_again; /* once per string */

+ if (to_size <= 0)
+ return -ENAMETOOLONG;
+
  if (codepage) {
  for (i = 0; (i < len) && from[i]; i++) {
  int charlen;
+
+ remaining_size = to_size - outlen - 1;
+ if (remaining_size < NLS_MAX_CHARSET_SIZE)
+ return -ENAMETOOLONG;
+
  charlen =
     codepage->uni2char(le16_to_cpu(from[i]),
        &to[outlen],
@@ -38,6 +46,8 @@ int jfs_strfromUCS_le(char *to, const __le16 * from,
  }
  } else {
  for (i = 0; (i < len) && from[i]; i++) {
+ if (i >= to_size - 1)
+ return -ENAMETOOLONG;
  if (unlikely(le16_to_cpu(from[i]) & 0xff00)) {
  to[i] = '?';
  if (unlikely(warn)) {
diff --git a/fs/jfs/jfs_unicode.h b/fs/jfs/jfs_unicode.h
index b6a78d4aef1b0..ea03dd5a0e0cb 100644
--- a/fs/jfs/jfs_unicode.h
+++ b/fs/jfs/jfs_unicode.h
@@ -12,7 +12,7 @@
 #include "jfs_types.h"

 extern int get_UCSname(struct component_name *, struct dentry *);
-extern int jfs_strfromUCS_le(char *, const __le16 *, int, struct nls_table *);
+extern int jfs_strfromUCS_le(char *, int, const __le16 *, int, struct
nls_table *);

 #define free_UCSname(COMP) kfree((COMP)->name)

-- 
2.56.0
