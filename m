Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4132BE7CD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556308; cv=none; b=oTBbnMzE4E4gvOojXg0HWcRnZTz5lC3JYhHsHxP1dFJJx/z9BDypapYM8urkPzNMu+7oCUjCNe06gjgNiWja3t4JBB0ys1ai9I/j3ctGX6seqOaz0kgNt6O/hdsDSLpZKPXoPKwERKvzWnN7poUSLydQAsho007Oc9zFM0X3giw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556308; c=relaxed/simple;
	bh=qez0UEh6M+IFb72yqVOvMsLU/1AHABWlHDztBFNWu14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UqRRSE13NHRswpKlc61t+zPF81cmQ/sY20YRzJMsFH69LB00Kjaq1uzoBErW3cRCCeyOGxCIwne0GQR2/Z8HFWs66nsgdLzxAfwhUzTcPyX5QvLEWpGNE9Ia2uCO+zJ9S1lXC3CDUeBhTQeowk6sW6y4s7ssceNlQWRAfDEQ1qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGLvdkZP; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGLvdkZP"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so385660a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791556306; x=1792161106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oa9Plq0/6IqSumf3BKrxs90q5c+V2qXVjg7vmpPOXsI=;
        b=RGLvdkZP1ngmhqx8LZzn6YBj5zyjBSf1WAXG3H36F6dZxbJW7ZwpbugAKdfMQvol6r
         y1bgUKq7voF39llUtiaK31vVXuHlIdvwDM/Iizf/EgdLJomJ8a9KUZEVCFW+QTO5KxiU
         +NJ4+9vJHB5c3E5TGdtsABbgzJN9HqjEWKXwtOcfzBcR3AAYM66ULEf/iC5NS0DYxzvE
         NrEJet0nN9iQC0mDevH60o7PlvufZYnv4M6lmPn4sodtuLR1CKxJ5jX8QHqSbrzZjjLZ
         yq/u3v6vPHSjo3m4w2//dt9Rsc+bgLD2mg82uyXac8TFIKzahX/qYZIUt8/ghq+HTiBi
         MvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556306; x=1792161106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oa9Plq0/6IqSumf3BKrxs90q5c+V2qXVjg7vmpPOXsI=;
        b=PK2T/qmHataIM6BbBZhNcL1oHJwTp8BsoAoGXfseXB78kj4kxl+Dba86nH8RwU/FMN
         SWwUuaHsvZMr6wB0goYE/8R+GhxaNM2823HACVsn2rROk9CDfdSltd9a8GwzvFexcE2P
         AEU4UbLF+yEeTileRH8JqoxCam+PnmlML1Mp615kI6gK+6pd45AOrBsV1s33GN9wDL0D
         3pmdYo8JNxzbTqMc/Jdf6uPeeWjOBxDOnTXz3VGaVLg82lh7lWIGRksiFYHEWsvnBzsI
         H4u/SWpxql9h4efdS0BkCxVR2tNTM4KZqY5Obs8FQ8CMSl57Hzk+xpJPMT8XjPUUIYBv
         Rhbw==
X-Forwarded-Encrypted: i=1; AKwUvBxSlKLGQFk1qfZPKRh++C25xD4amYhFQPlJtuYQoXJHMltNAjRIfHJAcRVqUBEEYcHMiS8wycclv044UaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN85CcZdcru4Qn7tzmz9Nmws/+IJMmDBTmaJby7963hiTce/Mn
	eSccAeJs9CTatUad4kphiRj5wMo8eItdl9Q/zO2JXM7wlk1oPjlvjh9c
X-Gm-Gg: AYBFou3iCx9xUPOn8ETiYesUzyXozaLwsCy4N3b51+b4CMmgI4wV52IvfIHOfDScjdS
	NEE3BV4Uxq26KvgTsjpbEhwxD2rcH86bT8+bugZwckE25F6nTWmmnFfdWUmoHfEooIiR5mHWG3s
	cgoQqA2k6weqooMOHer1LOAYH9SW2baKYqsIwnbBvhtr8jLYT9paZpzkTachTwrb5IUz2KO9N6M
	IC33fK14MteyCRu4uZf7rYAzVyl/dVieTy4heT//OQzwG4Meel006+BDApTYPdDOhDjZcXqk6lT
	BFFBpOiCcDLLAlpwovJWAWYzOou+1a5xhIdeJ4z4ISzl+PY4DE+5jlUCNxd22lVBqnqSpGPWXe7
	bUYm0q0QNNwMH0lR9x4/gTj6X8/umVHRWdO3RFId6iSlg8WuICv0offmq2PVFgE1WSLFHbyRjhe
	0j6RbwE9jsQh57fSXmFUz9AGrH7sbvcZGCPCrLmzahdU1kaxUrbE8kI+eXD46N2Y1wJ3mPjutbW
	d+R1B9cBfoWD77rgbmatw==
X-Received: by 2002:a17:90b:3143:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3ab3ac718f2mr2195103a91.50.1791556306130;
        Fri, 09 Oct 2026 07:31:46 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f4737esm3907735a91.7.2026.10.09.07.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:31:45 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] fs/ntfs3: widen wnd_bitmap::free_bits to u32
Date: Fri,  9 Oct 2026 22:31:38 +0800
Message-ID: <20261009143138.3197828-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

free_bits[] holds, per bitmap window, the number of free bits in that
window.  A window is one block, so the value ranges over
[0, 8 * sb->s_blocksize], but the array element type is u16.

ntfs_init_from_boot() picks the block size as

	sb_set_blocksize(sb, min_t(u32, sbi->cluster_size, PAGE_SIZE));

and ntfs3 accepts cluster sizes up to 2 MB, as true_sectors_per_clst()
and the comment above it describe.  Nothing rejects a block size above
4096.  So on a kernel with PAGE_SIZE >= 8192 (arm64 with 16K or 64K
pages, powerpc with 64K pages) mounting a volume whose cluster size is
at least 8192, the block size is at least 8192 and a window holds at
least 65536 bits, one more than u16 can represent.

A completely free window therefore stores 0, and five sites read 0 as
"this window has no free bits":

  bitmap.c:533   wnd_rescan()    treats it as all ones and skips it
  bitmap.c:950   wnd_is_used()   skips the on-disk check, returns true
  bitmap.c:1155  wnd_find()      skips the window when looking for space
  bitmap.c:1243  wnd_find()      the "window is empty" path never fires
  bitmap.c:1450  ntfs_trim_fs()  skips the window when discarding

The free space in such a window is then never allocated and never
trimmed, while total_zeroes, which is size_t, still counts it, so statfs
advertises space that cannot be used.  wnd_is_used() reporting a free
range as used also costs mark_as_free_ex() its per-cluster check and
ntfs_mark_rec_free() its already-free detection.

bits_last, declared two lines below free_bits, is u32 and holds a value
from the same domain.  Make free_bits u32 as well.  The array grows from
2 to 4 bytes per block of bitmap; for a 1 TB volume with 4K clusters
that is 32 KB instead of 16 KB.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Fixes: 4534a70b7056 ("fs/ntfs3: Add headers and misc files")
---
 fs/ntfs3/bitmap.c  | 10 +++++-----
 fs/ntfs3/ntfs_fs.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 60b362f388d96..41ea3fad99af0 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -677,7 +677,7 @@ int wnd_init(struct wnd_bitmap *wnd, struct super_block *sb, size_t nbits)
 		wnd->bits_last = wbits;
 
 	wnd->free_bits =
-		kvmalloc_array(wnd->nwnd, sizeof(u16), GFP_KERNEL | __GFP_ZERO);
+		kvmalloc_array(wnd->nwnd, sizeof(u32), GFP_KERNEL | __GFP_ZERO);
 
 	if (!wnd->free_bits)
 		return -ENOMEM;
@@ -1330,7 +1330,7 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
 	u32 b0, new_last;
 	size_t bits, iw, new_wnd;
 	size_t old_bits = wnd->nbits;
-	u16 *new_free;
+	u32 *new_free;
 
 	if (new_bits <= old_bits)
 		return -EINVAL;
@@ -1342,13 +1342,13 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
 		new_last = wbits;
 
 	if (new_wnd != wnd->nwnd) {
-		new_free = kmalloc_array(new_wnd, sizeof(u16), GFP_NOFS);
+		new_free = kmalloc_array(new_wnd, sizeof(u32), GFP_NOFS);
 		if (!new_free)
 			return -ENOMEM;
 
-		memcpy(new_free, wnd->free_bits, wnd->nwnd * sizeof(short));
+		memcpy(new_free, wnd->free_bits, wnd->nwnd * sizeof(u32));
 		memset(new_free + wnd->nwnd, 0,
-		       (new_wnd - wnd->nwnd) * sizeof(short));
+		       (new_wnd - wnd->nwnd) * sizeof(u32));
 		kvfree(wnd->free_bits);
 		wnd->free_bits = new_free;
 	}
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 5811d89d67b39..6f05b1bbb565a 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -152,7 +152,7 @@ struct wnd_bitmap {
 	size_t nbits;
 
 	size_t total_zeroes; // Total number of free bits.
-	u16 *free_bits; // Free bits in each window.
+	u32 *free_bits; // Free bits in each window.
 	size_t nwnd;
 	u32 bits_last; // Bits in last window.
 

base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
-- 
2.43.0

