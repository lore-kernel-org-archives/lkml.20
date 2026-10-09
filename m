Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF48027B35F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791509805; cv=none; b=Aw1k23epBnBYZ6441j/NmRZXJosiI/VDbJLoZUHWSGFIFomq0ekE3FVnSF4xhVb4PjYZzBBJYgmKKcyy26y9IG2Pd3AQDo9LwVH8r/E9H0t+8mQLQ+ITtoiAZ89M4wcop/IY8/Hg7wx6DL7wPDkupXvjSLNdG236LbLvH2xDClw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791509805; c=relaxed/simple;
	bh=NI8OFL2J7qAMszDxg74xt5ZHtNJOxFxoplsZH9cq/kc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BToH36laV31Gq8R0/h7rw2cQZc9pHWptJnTJ/gfwIDNO1muVstxcf8lCaoh4P/WeY2BeckgVN/p5iXf4hegUV/q8xMeogZHtTuyrYUS3vkuEBpPj4nosE/JwWqG0cv7d3MJ3LF4Jurj6QFjHlxEEqpGfy1PV9/fy0UvJuVtnyx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd1KPG1N; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hd1KPG1N"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso2064470a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791509804; x=1792114604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Bnewlcc3wxUQK8ZF4pr/LclN0rmZn+IbM4m62WaKNI=;
        b=hd1KPG1NVkEhJIzPlE2asZVgL58Eb+uFWByJBQv8bx2Er++HN6ZMq0P7AOLpV2DdEb
         aH35/FyGO6W0UIy4SGgcXDYwKSEGDSTAGUe/y6JGFiAUeP1HvWNwSziij2anUskOugos
         mR/K4VQ2hcLIe/C/8+YuAEEOMmjTvUsexQWziqiPpJCWFx5kYEtRrBpCwZQ7RFfvdgGg
         6VijZdcgtyyCiHG1PsupsJSuKhvs61CS6/xkm3kpvIWCtE60VeFrLvrSCCOHP1XLaQZS
         ssY9TCayjv+TfjlXi0MHxUIgKWtiv9B45pugNxwSke7YemBrzuiVVeaQSpkUlhUbaFv/
         1xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791509804; x=1792114604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Bnewlcc3wxUQK8ZF4pr/LclN0rmZn+IbM4m62WaKNI=;
        b=NdFBmZbBQEyfOEfmM/m/2Kg+deIbyPKoayDLbg3cOSJCM/VA9sSsVve/e0K/WzIlo/
         6mLADjTSttrrCUVxUyEpkK/C/vEO1OQZbX7eXo2ZC+3jEKTysbhVJbVn6qnh7pzDrHYy
         7bC0uLUUxwExCj4Agcr4k1JyYfWMEtLeid+bfMDcpa7Q6c7yYa6n4hc/cASPQgDzETpl
         oGDhJaWsNNSWSgETwld9CMUN+iFIF7NgZD4seVSsMSxJMfcxAwk5+ftNczFG2zHx6QWy
         7dqpzHoX7Cr2OhwE9cf9+ssW/xfzjFbtUsFfkDNpCoZK77sdYXeJgm8ATSSY4JaVKd5+
         Ul0A==
X-Forwarded-Encrypted: i=1; AKwUvBxfupU5Gx2i80bVFe4p8VmZDLGPLwWrg6zjJ65cvC1I+BTGf4yYuQ4lMGFlR8L8OLzYjYzBSc3RJIR3XaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQKIW743gWoPlKqrVUJqvBef93A6QcMyBvS9k3y49u9FUAAyH5
	KVhtb7u5g2J7vSyGJM5Ti1uVuCYHbzBEDezJVvdf9ToBFulPk06OzAF2
X-Gm-Gg: AYBFou2nNKDcRQQO1QgP5soDo5FpFq4LoRFVU+KGWtLJNb5RpHBtFOJo9rSgdZ9MF2K
	crRXC/LWo8R2FRQguF8FpGqoXanDs9Ge9zuMCnLlBqapaeEUopWLHbhXV9eQT6de9NLGvMc4oVT
	k9KW+s2lnShe2g7yDIKckPWjkAOKSNMcXegvI2FknWbx0V+6jmqO6K9DqLGCz8pmCUVPf2kKX8/
	86WcPRQqt1YVDmmItJ7lUEXn7iKZu9wIbAKkaF09j9QELCjjSL1bn6L25lZx8k9o0iMgyLoQAVk
	+brXg1i71syJyuVVvkbjZulJhGxqx7/5YJ14xITKYF9LDnuihpdhOWaZdqlRJ6C0tFvIr1nsxk6
	sSUXfafKWQVetpW7dp1QWJN4eQrlCzxFydRAEy/xkmAi176fA81aNF8DgbRbxk5ov9NljZiidqT
	HWFkrVZ++WLDhfbgRUOgEbh06mx7r9dTFe1mCXWURQvkCxiGiGBZzkdmH7tu+VR33tEQ8JOTX9E
	8WeX1iJiCU=
X-Received: by 2002:a17:90b:4b92:b0:3a8:6b84:234d with SMTP id 98e67ed59e1d1-3ab3a366814mr527166a91.6.1791509804000;
        Thu, 08 Oct 2026 18:36:44 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f5509fsm1052576a91.12.2026.10.08.18.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:36:42 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] fs/ntfs3: widen wnd_bitmap::free_bits to u32
Date: Fri,  9 Oct 2026 09:36:36 +0800
Message-ID: <20261009013636.2920704-1-zhanxusheng@xiaomi.com>
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
 

base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.43.0

