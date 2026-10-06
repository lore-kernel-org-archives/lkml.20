Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69AD3E9C2B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292264; cv=none; b=ZcsKLF+oaoIxte9byTFivp64uPCENhnujY8/X1PTRmiqLqFGKnOBZnXpfkoDfxNP0Zgo149boyhldg8TrWzlxhHdV0BlXyEWd9crR5pTjUNxqBDOL4VltknnZZKnQ4dv4+oograYmHyAO43THhn5coxJUOp/VP8Kieupsof/Qbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292264; c=relaxed/simple;
	bh=pKG+G/gx2NfFQHOz7fygi4Bq33B7vmC6kn9GiCKo7Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMUMYy6KWfZb7N1Bgzq6OdxDLDOiFNCjeKFnCpxSkMKr57oMu/ULyBn+cLSQZjm3O2yTBGP/3dr05T9OtmC1kfEhxNnzO4Xd6trZzijwBleua0ihtRN4B+mlTOtuDgOvvoEQLXhCz1FfiIqC9TK3stqsmcdGTgm2c2fR/UPlbBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvjasvtW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvjasvtW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a02718da81so6559445e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791292261; x=1791897061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kR+aK5Y7Uqk9JqfaD3k6LXtSgo3UHIu2EWnIjGCHhl0=;
        b=kvjasvtWxkO5vBO9ACsqFZET2OCVWP+17FoPBbMGctvGYC/9ROOWav95C4L1QXeGF2
         3PvBcnjmUcZZxrY1qJKjWODJjZzQdeZAhd9mT/bM2qNQyLGoq+xOxg1i3USTJoCuPMEQ
         XrbP0IsLINvx7pBQrFWzNUTLSTKDS9DCwyjuXoPfW5/p3o73VFpGgaY6237jANgm6AlJ
         cJtd96q680j534JRR82Ums3G8EzSsvUjeAcFqU9vV0xwertTwzmGPCL2cGju94cCwQuy
         eYasl3vqcSE1L49S8H/c4Wy41virN/jhqLIMbYHmKfS+X7Ob5UriqYahCc/7iY5lZngA
         zpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292261; x=1791897061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kR+aK5Y7Uqk9JqfaD3k6LXtSgo3UHIu2EWnIjGCHhl0=;
        b=GWy6eu1PbydfCHs0nkaXBl8I6qMpxP3i727q4c0XdTnDvUenBWJW1m8N5nuIBc0lqd
         +Nmljp4p5pxcd3FFb4hXPeT8MBDfH+4HbNYAjOHePh4Ybx6QJNIpi8jGRv56vpbgzaVO
         6dgieNutgF8pP4HUP2PbpUeQTx0yc3wPaLPZPLeSpEK+QV2Q81O0Q4UibqXqbQBEDk+a
         VA1LMQUUjlIMyW/lemMbVOnvFvGJP0bUzuYbTcGuXAKd1BoBHk64tlrNWzzEqMXYKjJp
         YWr+0uBiiaxndDXn0Ww6HLp7onjYvOYEZThNzK5MdvXVDDN5a/YHrik9DZB5H5s2kXXc
         YPiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtxxlBLYPLLVhsHbtor0CesBQEGp/yJD5hql6UvvOU0nkc1CPDSlEsCsYH5lI47r68bS1TZ9uFGBh4U4g=@vger.kernel.org
X-Gm-Message-State: AFuF++nzF9td1QR+dnwoqpgxNREkCX0JC03aTgrMsE3C1K7SDGHvPQEb
	zL7G70dVvA15oMdTsvjk8T7m2/4kHcc+A3ikQPXP/eciWOv88BRD6dru
X-Gm-Gg: AYBFou3E143C+3envNzLXun5EDvfugEeQLcXFn1F1H4dRr24aXPmNP16yecez6slchL
	NSljWF45EB5cfBRoWuhXmgFC9BZ/3UnX9jZNOaXTxJuxNqavmx2HH14nxlLFYQUrYinoDZTBn6h
	uLU3dJ9dPZhE9SOIybz+k3RsVo765D0wYomuxYYMK6BuOEmxN35K6bWLkeLPkBT74Em+R3H1T66
	0hzqoqF+4bIjVZuvsveGqDq1+tOqe2J0pgBH+cJHAjMB8Bo0yMqMI2csHLzUeUfyQH8/0J7wZg1
	e5CZgZy2wAnvfQ4MkupBZZGANOQVRt+bgk1E1X4QoekYhQF8OULc/iuu3nQwIKjoailE7OnonyK
	KLUH7XrmUGk2FZY/qpRXTQQGyI2uglUA5OtLwvDytXBY32LilHzQ6lhZQ3lKKBM7cSJrdUrN8ro
	syer9vCN7boTmMRfnTb2FL3dPnctNAZJByDA5G1FQERKTBQXx7sq8PIGWqCMe17GEGMw==
X-Received: by 2002:a05:600c:4f91:b0:4a1:6f78:8419 with SMTP id 5b1f17b1804b1-4a17b4b8591mr25357415e9.0.1791292261003;
        Tue, 06 Oct 2026 06:11:01 -0700 (PDT)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1776cfe45sm74047955e9.1.2026.10.06.06.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:11:00 -0700 (PDT)
From: Andrey Misiurov <andrey.misyrov@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <andrey.misyrov@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ntfs3: check split point bounds before copying the split entry
Date: Tue,  6 Oct 2026 15:10:29 +0200
Message-ID: <20261006131029.2503576-1-andrey.misyrov@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

indx_insert_into_buffer() copies the split entry before checking that
its on-disk size fits in the index buffer. A crafted image makes the
copy read past the end of the buffer:

  BUG: KASAN: slab-out-of-bounds in indx_insert_into_buffer+0x49c/0x1310 [ntfs3]
  Read of size 4352 at addr ffff888172fcc760 by task touch/970
  CPU: 0 UID: 0 PID: 970 Comm: touch Not tainted 6.12.88+deb13-amd64 #1
  Call Trace:
   <TASK>
   dump_stack_lvl+0x110/0x1a0
   print_report+0x237/0x77f
   kasan_report+0xdc/0x140
   kasan_check_range+0x30f/0x350
   __asan_memcpy+0x33/0xb0
   indx_insert_into_buffer+0x49c/0x1310 [ntfs3]
   indx_insert_entry+0x14b/0x480 [ntfs3]
   ntfs_create_inode+0x2016/0x4b20 [ntfs3]
   </TASK>

  Allocated by task 970:
   __kmalloc_noprof+0x349/0x6c0
   indx_read+0x75c/0xc20 [ntfs3]

  The buggy address belongs to the cache kmalloc-4k of size 4096
  The buggy address is located 1888 bytes inside of that object

Do the check before the allocation and the copy.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Misiurov <andrey.misyrov@gmail.com>
---
 fs/ntfs3/index.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1899,12 +1899,6 @@
 		return -EINVAL;
 
 	sp_size = le16_to_cpu(sp->size);
-	up_e = kmalloc(sp_size + sizeof(u64), GFP_NOFS);
-	if (!up_e)
-		return -ENOMEM;
-	memcpy(up_e, sp, sp_size);
-
-	/* Make a copy for undo. */
 	used1 = le32_to_cpu(hdr1->used);
 
 	/*
@@ -1913,13 +1907,19 @@
 	 * that (PtrOffset(hdr1, sp) + sp_size) exceeds used1. Without this
 	 * guard the u32 'used = used1 - to_copy - sp_size' underflows and
 	 * the subsequent memmove count becomes a near-4-GiB value,
-	 * triggering an out-of-bounds kernel write.
+	 * triggering an out-of-bounds kernel write. The memcpy below also
+	 * reads sp_size bytes starting at sp, so the check has to happen
+	 * before it.
 	 */
-	if (PtrOffset(hdr1, sp) + sp_size > used1) {
-		err = -EINVAL;
-		goto out;
-	}
+	if (PtrOffset(hdr1, sp) + sp_size > used1)
+		return -EINVAL;
 
+	up_e = kmalloc(sp_size + sizeof(u64), GFP_NOFS);
+	if (!up_e)
+		return -ENOMEM;
+	memcpy(up_e, sp, sp_size);
+
+	/* Make a copy for undo. */
 	hdr1_saved = kmemdup(hdr1, used1, GFP_NOFS);
 	if (!hdr1_saved) {
 		err = -ENOMEM;
