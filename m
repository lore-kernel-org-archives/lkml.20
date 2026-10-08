Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE8E48424D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468553; cv=none; b=BF/44Y6sRPnmdNhXduDpzNUsZJ7nKmr8HWRP/cE3eVSsSvEweijqALSIcIVIXRL4CGpIcnVtuVnVkBfW8PoEoIXvPUYlA+2nuqXrp1aTqRsVr0unDgCd9GEsrUqeIXz14zs65u7UJSFkUSgvOgrQ2r9GMME3gHQZO1WbdZvQX30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468553; c=relaxed/simple;
	bh=6BEIHJjolflX6+Gzn6XCCPW64FuT3A8Y0aHv6pxFkJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KkR6skV/N+Df/IWxEzyI9lC0qO6Spbd54KayqXcSqQR4Ofiufbposh9D+GJbcIumKRHTYO/8/acOZzr1b7TXS+reHzKQZRsJKsvHjHqFARJVb5rORVxTFh2yPMyeSpagRinmERpnpx+7Tf0k0yUh9O/kRHd0wPMupHrugT5bj0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6Sr/ido; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6Sr/ido"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a4c80d3d5aso3323326a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791468552; x=1792073352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSANG6S8NSGoFygyPtolE8Kx6+g//31lIkZsaSMWHdo=;
        b=q6Sr/idoKAFixTy2GJVGxrNisv01u7vTlYfMYMkldOBcss/dWjIB1gRaRFAZOzHYGg
         YKy8O1A7jtjnf2g/97tCl7ZaikGltRfZY5VVgKCB/v+V1ccdfb0TiMUvjhtbgHus6pue
         3p+GughFg01VVrYgiDbHOfY8sDvkk6TvZ4yzTJV6GKtNwbcGelR3VvhgSeUmW6op9W8d
         ZSOf4jTXjapARrtlDo6dgQHn3f0eyoP9+kfvk12dFafCojFrOzs9nB6UhBGKjUpbG6fv
         VqDUDJ+6MiyI8pCTLedmwl2LeBv8KzwJGzemhd9+v0tTiJV5M+oac9CVc4OWhWzsj0hC
         rvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468552; x=1792073352;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSANG6S8NSGoFygyPtolE8Kx6+g//31lIkZsaSMWHdo=;
        b=HAe1IIsAHJgeCY2CsK37Gmo5O9qDFwt7FKSdoVpvyka+l7+F2KschDNbzzMH7gd5iY
         eGSxdZEHe5eO8GGcDYP+XyCGswGLlQwFv6sDWVLpUXWQVJs9ybIVFSqQJJBsyEc+0PQb
         S7vpxE6AirY0DFJQMz9ZggG42VcFhoBOFU2sIGb4gGSJNEnNcaiESkPEycMjF9wWIl+g
         iDgYcRAvDpDyOrhGNzpOA9VW+PaGIv1LlZDKtqaqtJ+7hUR4CSDvgqbh3D5aViAuQ9ac
         DbavYoRomgdFYEzE0HsDMagDBj1DqIeyeHp5ZqZylvCMHziv02y6OZ5szlWAzImwBi27
         5beA==
X-Forwarded-Encrypted: i=1; AKwUvByqp4BJJgJO+0Vevl7C0VEpYLN973q4hPF/DokzDHLWjtTxnr8hb+qsfQD8AP2WqT464JRx+jiU556Ojgg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvuLAkziO50+J8oKUCIuZ6Emta7th92oFEIWAyaVdvfIf0kSLu
	/k4nF19sR9LKdtjRx54pzkclwvk9Mk2Rmx1Ilk+A8ys4CuDp4zRra+tfZAfw8YUw
X-Gm-Gg: AYBFou34n9vXeaKBmKZJlEf8z02RR220csc87dHR/5ywH3SEmxGuAvH2WWLQS05L3R4
	jans+sgPOrBZtB7/57hH6+BVVBUiFRPnkThhJ329MKG/S/avZF7izeBKnXO90E3GtiDVe99X/S+
	VtQFKtq4vE+Oc94iwolaFORs2zC3uluLOldbd+UWaZlzLD0HZzikIfDxjySSfavEAalx5kWVE+W
	F441pXik1LtfuuMAy154ZdKeZYtsV/u9rYzJ7l/KEx1i0Hgwt4PrQRcDDAwRev/s4VMhDY3rtYu
	K44Qg6ZXbPBuVQ1fJn3q76FMXDJqNelG8nQ/a9X77SN2XfMLh5WM9unYaf5TyqfZfXfJwiGPTzC
	5ezYCbu59M8gL7RTjiLGC3hLoLqOgmPE99pkOTc3oEKBh6btqMC6fhY0xlRIcEsCrNiwIiGj6gr
	Y6+5Xg3kgbP+zn4Njm954y5t5ug3wvl2xWOZBq34fdcZsTxKaDMI3RQQM7j7nB3TCofg==
X-Received: by 2002:a17:90b:2751:b0:3a0:9640:8039 with SMTP id 98e67ed59e1d1-3a8a0ba984cmr5074558a91.30.1791468551666;
        Thu, 08 Oct 2026 07:09:11 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd35715bfdesm53008a12.20.2026.10.08.07.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:09:08 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: miklos@szeredi.hu,
	bo.liu@linux.alibaba.com,
	vgoyal@redhat.com
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] fuse: dax: Clear stale mapping when inline reclaim lookup misses
Date: Thu,  8 Oct 2026 22:09:02 +0800
Message-Id: <pm-fuse-full-objects-candidate-0016-v4-87d8eabc59be23301791@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A mapping returned by inline reclaim must be detached from its inode
and the connection's busy list before it can be reused. However,
inode_inline_reclaim_one_dmap() leaves dmap unchanged when its second
tree lookup misses. It sets retry but returns the old pointer, and
alloc_dax_mapping_reclaim() accepts a non-NULL result before checking
retry.

With DAX enabled, an exhausted free pool sends a file read or a
non-extending write into inline reclaim. A pinned DAX page can make
fuse_dax_break_layouts() wait. The inode tree semaphore is already
released, and fuse_wait_dax_page() drops the inode's invalidate_lock
while scheduling. This permits the following ordering:

  1. Inline reclaim on inode I selects mapping D and copies its index
     under fi->dax->sem, then releases the semaphore and waits with
     invalidate_lock dropped.
  2. After the page is unpinned, the reclaim worker acquires I's
     invalidate_lock before the inline caller resumes. It relooks up
     the index under fi->dax->sem, removes D and returns it to the free
     pool under fcd->lock.
  3. Mapping setup on inode J takes D from the free pool and publishes
     it in J's tree and the busy list. J has separate inode locks.
  4. Inline reclaim reacquires I's invalidate_lock and fi->dax->sem.
     Its lookup misses, but it returns D. Setup on I then reuses D
     while J still owns it.

Successful stale setup remaps the same DAX window and reinserts the
embedded tree and list nodes, allowing accesses to reach another
file's data and corrupting the mapping structures. A setup error or
an existing mapping on I instead puts the active slot on the free
list. Later reclaim can encounter a cleared inode pointer in the
corrupted busy list.

Clear dmap on the missing-node branch, as in the adjacent branch for
a mapping still in use. Returning NULL with retry set makes the
allocator retry through the existing pool and tree lookups after
releasing both inode locks, rather than reuse an unreserved slot.

The failing worker produced the following KASAN report:

    BUG: KASAN: null-ptr-deref in igrab+0x2d/0x260
    Write of size 4 at addr 00000000000001e8 by task kworker/u16:0/12

    Workqueue: events_dfl_long fuse_dax_free_mem_worker
    Call Trace:
      <TASK>
      dump_stack_lvl+0x93/0xd0
      kasan_report+0xe0/0x110
      ? igrab+0x2d/0x260
      kasan_check_range+0x105/0x1b0
      igrab+0x2d/0x260
      fuse_dax_free_mem_worker+0x172/0x9e0
      process_one_work+0x908/0x19c0
      ? __pfx_process_one_work+0x10/0x10
      ? srso_alias_return_thunk+0x5/0xfbef5
      ? lock_is_held_type+0x8f/0x100
      ? srso_alias_return_thunk+0x5/0xfbef5
      worker_thread+0x65c/0xe40
      ? __pfx_worker_thread+0x10/0x10
      kthread+0x34f/0x460
      ? srso_alias_return_thunk+0x5/0xfbef5
      ? __pfx_kthread+0x10/0x10
      ret_from_fork+0x659/0x940
      ? __pfx_ret_from_fork+0x10/0x10
      ? srso_alias_return_thunk+0x5/0xfbef5
      ? __switch_to+0x74f/0xf80
      ? __pfx_kthread+0x10/0x10
      ret_from_fork_asm+0x1a/0x30
      </TASK>

Fixes: 9a752d18c85ae ("virtiofs: add logic to free up a memory range")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Drop the duplicate Oops report and format the KASAN trace.

Link to v1: https://lore.kernel.org/r/pm-fuse-full-objects-candidate-0016-v2-f3854498f12705839ecb@gmail.com

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 85cdf0199bc0b8fb121324ffaf8046a054cbfadf..361538bc41e5a44d01da11b76070f8af0e783b2b 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -951,6 +951,7 @@ inode_inline_reclaim_one_dmap(struct fuse_conn_dax *fcd, struct inode *inode,
 	node = interval_tree_iter_first(&fi->dax->tree, start_idx, start_idx);
 	/* Range already got reclaimed by somebody else */
 	if (!node) {
+		dmap = NULL;
 		if (retry)
 			*retry = true;
 		goto out_write_dmap_sem;
