Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5F846EF92
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987082; cv=none; b=f78ld1SXcyzOCtRF3ROKakA+qNfpNk6PhPZh270xLgwwW3d0AxcZH/GOpVp2DJClPE8JhgfasvMArz5PS5EmyCAg/ZHHWx1O7JJEUdp699ktQ3EHdW+qLZfm3tfT2U1TXCBFgGrhOzV9RI3fPimn4jYxDtz1vV/w3l5yT0y5E+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987082; c=relaxed/simple;
	bh=SQTj5lF1Zme4heu6m043jfxGx9HTFzHgmW83Z8v52XI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bCmY6fx6gJy02aoZfPjJB3eGTgN7/aPoQi/rz+rxSUrak3dZSbXxIgFL2gDBaz1cEKoeofDpyGS1iNq8aqJMW9JjtsKKzSg7rEgA5Ph4iDwFjl/O+30QlJKXGjN2QngAquW1wyuDMF3d4EALSm5w8csfHBjKAH4ZB6PnjTVfCC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTLHceE3; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTLHceE3"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a91e06e2f9so1417406a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788987066; x=1789591866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eJxZDDzOzotiu9MIMPs18NtUcg846lKcSJ1Zq48T8/E=;
        b=DTLHceE3nFbtM/ocrMT8DKX3opbW51+Zkn1iBMjZjjNEjpPGKEdnRHvY7ocEY6vpdc
         bwpV5Udc6q2KF47IxkyK5lzYptdgMry5Lui0Iq+t3JVEleAONom48Zd8mFnW3KtQ3F2V
         YdN6B21OuIf7OrbYseKaRM4GCGqfrykRO/GwAoXtBz2W7deCtEL+3pDThdijKrYNTYGP
         S5ProvvAwA+AuBi2Ip7zKsJ4mTDDRN4mokJBNT/7nABU/Xq3iQTq/mizriMZOD4s/EDO
         meEwklMTmfcAlMipbtKWVLojX26v5UaLIOCmiQ9FBdFApnDa/uNEwCf47RdP+WXH6HOA
         uKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987066; x=1789591866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJxZDDzOzotiu9MIMPs18NtUcg846lKcSJ1Zq48T8/E=;
        b=mzk7GnoYJqP025KXROPQwg03I9JvMBfUygZ3ihBukQfVv95maYdXI03/rtMW5FRs5X
         X/KE5ujGZdtS06goaidVU1i8hXjZ/GcEP6uoXnxsFIRycfOGPe8iUR+dawItruGbS8Pq
         YXql3KWqzeXrmoXTNPSzRseLoMC7NyclO/mYR00xoTDkLzsONXSvcG390yhuRmROr2qx
         d2f/0D5NreXWwedlxIzmD1Vgl+4t+8dVKVtb3gKR/GlF13HctP55+TVvJzBeicJKGk3K
         44kr0uKv8xuDTnNnaYIy+o8Rc1WRT3rUWkY7WSBKzJOsIt4+cf1tC6K4PXokLD3mFKq6
         rEmg==
X-Forwarded-Encrypted: i=1; AKwUvByd71NfAJF8U/pHjXa9hNq7tMYFaCZsNBmNpBpls+J98pV6hl97qa1A28V0I0dTKrgPeVnFOYxbDsTGxT8=@vger.kernel.org
X-Gm-Message-State: AFuF++nT1hg+75hYMm91AJ4OLSyl8cNeyZLznTNqIkdf8U5h83EpNGIg
	Sb3bYXKjeUO7ZZ7Y2SWevZ4X/Go/QrdnZzIXOojIyoEV7tYPH86Rm2il
X-Gm-Gg: AYBFou2XDoKAX/nRx47bqFtmmWvbrenpBkzI+L8wNZCtBjeWdS4YQgN+fgDRMgK9m9u
	RM37WM3Cu8bRQC51VpJvHWzmXv4+yN/K+Z8tta4XwCf+p9D+HUosFEwhuN0t7al7B4K9RzHKGWx
	C6FtbW8WDTpN6/covaTANSRcHDdvamwDI9RxDOVEU1epC/OeQLoWDVTf969ovGlX47Ww6SXStBw
	PAzICsQUflDXUuWka9NOWgooFsj/lqBf2nAg8wycv5Q3dxmcwqTj+KzFCoYwR8q03lFSA3dqB+V
	MH5DhDwJsegIO/q0iE8gSwcmoW7mLQLZ67BwRSPI3AoeZVpggHiUgr0+UStkcGXDOGNs0jRkJwe
	POhEGAjhZ02BQj77Q2OMWJgEnBz9/pG4yl93Iv3kx4k3ZEeGGSyCyDuirrxHlPe/Gdibj3ZCOyr
	zjHFb8gQAZ51cO/76iS3mHSD/TGvxN66t6xFySzmGX+fNWuXCfHEQF43DOEBl5C3nNon++4nFrg
	0ND/g==
X-Received: by 2002:a17:907:3f0d:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c2945eecb04mr57074466b.18.1788987065689;
        Wed, 09 Sep 2026 13:51:05 -0700 (PDT)
Received: from bbzr-mini (cool-t.fvds.ru. [103.137.251.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d03644bsm825646266b.6.2026.09.09.13.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:51:05 -0700 (PDT)
From: Vadim Nikitushkin <bub4z0r@gmail.com>
To: christian.koenig@amd.com,
	ray.huang@amd.com,
	matthew.auld@intel.com,
	matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	skainsworth@gmail.com,
	alexander.deucher@amd.com,
	bernardomagri21@gmail.com,
	Vadim Nikitushkin <bub4z0r@gmail.com>
Subject: [PATCH] drm/ttm: fix swapped-out resources never leaving their bulk_move range
Date: Wed,  9 Sep 2026 23:50:28 +0300
Message-ID: <20260909205028.13799-1-bub4z0r@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ttm_tt_swapout() returns the number of pages swapped out on success and
a negative error code on failure; for a populated ttm it never returns
zero. Commit b2ed01e7ad3d ("drm/ttm: Fix ttm_bo_swapout() infinite LRU
walk on swapout failure") moved the bulk_move bookkeeping in
ttm_bo_swapout_cb() under "if (!ret)", so the
ttm_resource_del_bulk_move_unevictable() / ttm_resource_move_to_lru_tail()
pair is now skipped on every successful swapout. The equivalent change
for the shrinker in commit 1d59f36e95f7 ("drm/ttm: Fix ttm_bo_shrink()
infinite LRU walk on backup failure") tests "lret > 0", which is what
was intended here as well.

Before b2ed01e7ad3d the resource was taken off the bulk_move before the
swapout; since then a swapped-out resource stays inside its BO's
bulk_move range (and on the manager LRU) although it is unevictable.
When it is later freed or the BO leaves the bulk_move
(ttm_resource_free(), ttm_bo_set_bulk_move() via amdgpu_vm_bo_del()),
ttm_resource_del_bulk_move() skips it because of its
!ttm_resource_unevictable() guard, so a range endpoint in pos->first /
pos->last is left pointing at freed memory. The next
ttm_lru_bulk_move_tail() or ttm_resource_add_bulk_move() on that cursor
is a use-after-free, seen as the resv WARN in ttm_lru_bulk_move_add(),
"list_del corruption" in ttm_resource_move_to_lru_tail() or a NULL
dereference in ttm_resource_manager_next() -- minutes to hours after a
hibernation, or at process exit / reboot following one. Samuel
Ainsworth's analysis of drm/amd issue 5387 (see Link) identified the
dangling cursor; the missing removal at swapout time is the reason it
dangles.

Testing the condition for success restores the removal. On an AMD
Phoenix APU (ASUS UM3406GA, gfx1103) running suspend-then-hibernate on
a 7.0.y stable kernel carrying the backport (Ubuntu 7.0.0-31) the bug
crashed 5 of 18 hibernation cycles; a function profile of one
hibernation showed 336 ttm_tt_swapout() calls and zero
ttm_resource_del_bulk_move_unevictable() calls. With this change the
removal happens for every swapped-out resource and 12 further cycles
were clean.

Fixes: b2ed01e7ad3d ("drm/ttm: Fix ttm_bo_swapout() infinite LRU walk on swapout failure")
Cc: stable@vger.kernel.org # v7.1+
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5387
Link: https://lore.kernel.org/dri-devel/CAHYiNPa6aVacJoLOje-qZ1GyYx-9p0tN4NuP8D_eSL+UJeevXw@mail.gmail.com/
Signed-off-by: Vadim Nikitushkin <bub4z0r@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ef56c18..9b85b5f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1434,7 +1434,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 
 	if (ttm_tt_is_populated(tt)) {
 		ret = ttm_tt_swapout(bdev, tt, swapout_walk->gfp_flags);
-		if (!ret) {
+		if (ret > 0) {
 			spin_lock(&bdev->lru_lock);
 			ttm_resource_del_bulk_move_unevictable(bo->resource, bo);
 			ttm_resource_move_to_lru_tail(bo->resource);
-- 
2.53.0

