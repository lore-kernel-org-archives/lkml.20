Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5477941DDEC
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290510; cv=none; b=THXjKezHdMKv5K5/7FDGJMckTUxLA1YJQ2DnIjNn9tULxsNiH5EcBM4Ohw+7EY0gUbUqJkG6VH1oyJuUy76cJUksOyU9geDF6al+vpVofeIvZASrN8htcV8fFgMkEDdEsMPYx6onmCO4rNbAmUv9GOQ0NnvonNjxjO5Df0i6WhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290510; c=relaxed/simple;
	bh=wEI+4IdRoiUkNy0DoaQdDHjN5i4HToizYZEOsF0bWzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8OHn1WH8liThtD+gLW1uhbOkCSuWzH42dYslE0DsvrZGxaEwh6gqu/coCDTo0KyhvhDXdIZvw0MTKRw1Vi7/8Do/ptf2xS+Aq9Sgc6nRXxNL8VEC6F+3079CYyK6EOka47VhopLq7lBcBHm6KqqLJKIcIf1u2ESKdTtATbAkEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSYdkStq; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSYdkStq"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso959086a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791290488; x=1791895288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Vk3+2cGga50xeWMdbFK+urEdPBF53lIfPHsg3pEZLA=;
        b=eSYdkStqB0q+7mlmVE9cQZU6cyViqmnK+wCu1c2nx/MGUTRhjhW1F0l2cTy1tNbLTB
         1NS00wUpIpBbumt7xCFMjrilYc3SSJTO6p3Vwn1elJIz8LNabQ9B6+VtdBCNH4p8IvQD
         kQuU7oMjKbBwjrT3y2BtybZ+5hSa+I0QOt2eT/mIHZYCVLt+CLlkyoIhU2REjPa0+IqA
         nAWfxtkDvHPeTlchtUxy6tC2JPuPqROH6iVXImxEb6Hqv+TWLyocr95Q/M4vaOJgliSH
         BJpxYOXTVfuMDlkwbVgrsMvYCsXUjIHjgJHOif4WEm/+4arV1uyqg3Q40qEdliN8e3Xq
         knVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290488; x=1791895288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Vk3+2cGga50xeWMdbFK+urEdPBF53lIfPHsg3pEZLA=;
        b=NEF+ZW+PdekqJlKUK9g5l9pEaao2iHYBI7Z2hr/B07xZPJh3inz4m4Kzs1AskbVTrA
         z0KX+ysfol6NX7cPrnSyjbfar0ElftIttB0VmZy4rQpspfyZBuuQ7lm8uLUBJjWRCrdp
         /aX+UssuvQ/YcQmtfj2X90k9RkaPDz6cCQ7QVGbgcAVurBrVTN8slfxP9Biyjw4fTodb
         QogvybDPJtOtBWS719ZitKueQN9UGVwRHxeVqxoeVKaUpxvjvMUylpgHwu++dawoGZvt
         6u6KfpM2gtCr5ZmpzldUNM0U8FeF3pWgsCS7YZwBdrrtlFzFQwh6mwPImANBkF4t9kRC
         q7zg==
X-Forwarded-Encrypted: i=1; AKwUvByQwvUodcR9DWIE5bEiCndAW4B6E+4t/tRmQXRvZuITp8deWyKvonul2Fz4Fij9xRgMQ6beOdTypIo/P94=@vger.kernel.org
X-Gm-Message-State: AFq9FYIalOPD52otUdATfZmSMnej1NZakOTHBiVpmzxFHVMDhvQQmWOF
	PtVthLer7XzL4klg1iU00s/PFOBGZEM9sJ9Ey0NApbcodY96WIHOfbqb
X-Gm-Gg: AYBFou1tTLadE0iRZkv6u7NsnTCQpS+ya3+AoATIRcd8a47JRIi6nuM2QZBE3vYrVXa
	tx0ft4dxkT/PF2OJdG2bDtAXvDVObO8PS4OwUb8gr6sCp6Ihl7wwhpOqY5b3zciA6Oha5LVqcHH
	t1+27RykTkLUL+Vpp1ovi24/AtvYuv0cMryrsLKDZF0Iu7vmryin6Cskh3NsaVW+Zkfvr4zx+6S
	CvZs9rXXFMHKtUwNdBI68ZBvY43PBIPeINoSaOXu9FRLhVag05UWaxDPbjyHKz9mvvfTgkLaepN
	daRtzUK+NH7U5eVArYEoE7QjK6RR6BAOp3QUOrLdvoUgP/8x0uZmbEhO4X8e9i9UF2VsYfFHHWb
	tGv1y/rGnY9Mq+NMsL5QxehCdnzRTWqrGLihDq+GNUFwHdld8TCKOzXOlBwBZBRWuLge494YXub
	aWA0SOc/FtWxgb7s9vFdiCs8FZNbEbCeEryjVfXzQuCgPIOVTGzEwnVAUDL4RHmf+zDGCucaimS
	6S01SoaXNnbR5ED
X-Received: by 2002:a17:90b:4d02:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-3a87267ea23mr1122519a91.6.1791290487966;
        Tue, 06 Oct 2026 05:41:27 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([2401:4900:900c:ec20:d139:f8fd:7043:7eb2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a854257d18sm5246668a91.7.2026.10.06.05.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:41:27 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] jfs: account for the dirent header and charset expansion in jfs_readdir()
Date: Tue,  6 Oct 2026 18:11:12 +0530
Message-ID: <20261006124112.1703-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jfs_readdir() converts each on-disk name into a struct jfs_dirent in a
PAGE_SIZE buffer, and stops filling the buffer when the next entry
might not fit:

	if (((long) jfs_dirent + d->namlen + 1) >
	    ((long)dirent_buf + PAGE_SIZE)) {

That check undercounts twice.  The name is written at jfs_dirent->name,
after the 14-byte header, not at jfs_dirent.  And d->namlen counts
UCS-2 characters, while jfs_strfromUCS_le() lets the codepage's
uni2char() write up to NLS_MAX_CHARSET_SIZE bytes for each one; with
iocharset=utf8 most non-ASCII characters take two or three bytes.  So
an entry that passes the check can still be written past the end of
the buffer.  Since commit de9f4f0b2c0f ("jfs: replace __get_free_page()
with kmalloc()") the buffer comes from kmalloc-4k and KASAN reports it:

  BUG: KASAN: slab-out-of-bounds in utf32_to_utf8+0x24d/0x3d0 fs/nls/nls_base.c:111
  Write of size 1 at addr ffff888039ad7000 by task syz-executor304/5946
   utf32_to_utf8+0x24d/0x3d0 fs/nls/nls_base.c:111
   uni2char+0x35/0xa0 fs/nls/nls_utf8.c:21
   jfs_strfromUCS_le+0xd2/0x3d0 fs/jfs/jfs_unicode.c:31
   jfs_readdir+0x16fd/0x33f0 fs/jfs/jfs_dtree.c:2984
  The buggy address is located 0 bytes to the right of
   allocated 4096-byte region [ffff888039ad6000, ffff888039ad7000)

Before that commit the same write went into whatever page followed.

Check against the worst case instead: the name starts at
jfs_dirent->name and each character can take NLS_MAX_CHARSET_SIZE
bytes, or one byte when no codepage is set.  The largest entry is
then 255 * 6 + 15 bytes, so an empty buffer still always takes at
least one entry and readdir keeps making progress.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
Built with W=1 only; not runtime-tested.

 fs/jfs/jfs_dtree.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 8ce6e4458cc2..d930e577a496 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2712,6 +2712,8 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 {
 	struct inode *ip = file_inode(file);
 	struct nls_table *codepage = JFS_SBI(ip->i_sb)->nls_tab;
+	/* most bytes one on-disk character can turn into in jfs_dirent */
+	int max_charlen = codepage ? NLS_MAX_CHARSET_SIZE : 1;
 	int rc = 0;
 	loff_t dtpos;	/* legacy OS/2 style position */
 	struct dtoffset {
@@ -2910,9 +2912,10 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 
 			d = (struct ldtentry *) & p->slot[stbl[i]];
 
-			if (((long) jfs_dirent + d->namlen + 1) >
+			if (((long)jfs_dirent->name +
+			     d->namlen * max_charlen + 1) >
 			    ((long)dirent_buf + PAGE_SIZE)) {
-				/* DBCS codepages could overrun dirent_buf */
+				/* the converted name might not fit */
 				index = i;
 				overflow = 1;
 				break;
-- 
2.55.0.windows.5

