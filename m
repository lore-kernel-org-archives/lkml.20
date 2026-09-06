Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21630223DEA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 07:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788680847; cv=none; b=rNeAioJRUFSGlMb0MGpKVaeBXo3vucCZ/hvyc8yvO3H0hMNi21qhKYf6EV6+OHUjKO6oYUKaq80HwNi+9CqymAu5bpEHGTZHBPQlzBY3Rmj9U6gELXHvAxjr+v6kh7eCjTxuisKSvhNFnKA1km8R36XcmGaK1uQoL7J6od1QCNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788680847; c=relaxed/simple;
	bh=KbN3asJSK+TTbGnv/VcqthRURzav8YC1jBQtgcwSjJM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 In-Reply-To:References:To:Cc; b=u6r6LI038spnSYeNJO0AMp5ks0Vg2t7Xh2oI7/0SG6DH01cuj89Xy66ghYnBzsWmbyJNymDlQ7+H8dAdDLC2reiNRGwKOj5vwFAeIuAEIFASzs8FhIZnlLmoDSfwvSrWd7eO5VidGGQaO1OCUDmIAC9rlC3A2UZ8J8/dNcOzCvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmWtebqh; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmWtebqh"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2263667a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788680845; x=1789285645; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTW8rfxRTuzQ7sC9TwGZDi4dZwe0Eh2shs5D/k7Yn2w=;
        b=TmWtebqhdMwqf8vQQXcxbJhYHlzkPGvsXXBYb2kLxmgavWjHiizjs0ihvfe5+PsXEo
         4SYcYz6b7PsRh4xk9LdVDn79Gcu1aq3F74RrdWw8QbvPMI3hiSCIwy5oObcl9NoJLDxY
         3wAlZeaGARIrGkMM5hikGn+DnTuOeHZD3LanHpCkN9UleU4SbDZsUIYqvBepZHZV+u6E
         QbKt/gq15ZjHm+PaPCnuIHllUCakKBGj3XWJ5bsJ7fsCdrWRK5ZNG6LyqCemOyM7Bl5k
         z9s+oCdN2lyg7FRrfntXJrbzdGO0n2Z/6jQw1NZr+ProfOvZUHuULdewde8oAlowNYXh
         o1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788680845; x=1789285645;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTW8rfxRTuzQ7sC9TwGZDi4dZwe0Eh2shs5D/k7Yn2w=;
        b=mgxCYSzUNDRLwDquH/h7qiMELI4t78I59T1PmuBtWQm2UOdQsgqWacD1gvFE9WMKH7
         x8NYMZR5+hb1+U2UBmZ9Ac2WUn1weWYZtM2hfj3syMJZy7fGFgOIa2H0kbwXkQBQzoRh
         JD4EQfoPyPiX7C4UmbFmjki9iEuweFdYiMMHtoKg1z+TZFB+Hw/mrHbpEzXRQwKdQKCq
         OJNLjp+zP2Z3fPO3z300AwYbxskr/sbrqepC1d41JZoAQg50sRZ76X/usMIjXD4G0t1f
         pb4QFzokLiYFzEPOAMpiT5f7iIa3BJTeky3s2OcxNz1XYKF9zy8YvGPacJK5h2c8HxHC
         L32A==
X-Forwarded-Encrypted: i=1; AKwUvBw5RqjWKkwvYeWmxjZ8D+BQpP0ko9PwdaVLtbr/DwRoH3XdmtHwR1wRCPMHIel0N7Cz2Q1r0S8V0WQ5Uq4=@vger.kernel.org
X-Gm-Message-State: AFuF++lfA1WTLa4B7JPl3DmGGhUz4IDKWLtrc/VrybPOwYKvC+z7OkEl
	oepK31gSnMPuFdMEQETY0R0i5SbHCOIPvglxQxZ07NstDKgsJdsyEBaE
X-Gm-Gg: AYBFou3zM+mh3Cvp9HA95kZGLZoJrnGEtygSm0oZIfzsUxZ7usf8qdAQKEFGSURYxG1
	ZXBzSo+z7geL3DMM3tfel9OmAmC13pR7laG0SQ4iDR+6F1Agimxp/yaA6Jij6W/mNHQ5nLSC3IA
	KGaNNfBw0cXmSsGWCZIVRQ3QlYotOsSKudGcqzMU5ygd4HvlZAQMSEXS31t3J5L4RmZjdBM/GSv
	kdezOZnUmS8orRSNbOEsw0tAgrjRBfz/tCshtj7HCqugXsG6VD+NWQa3bn0yuL8vKENqBrp4PWK
	80+1Do6R9LVo5ooguRtSyZq05WylRpDQYb1XVRDYp2xbU8h38PU/MfMuyPcngRePC+/HiytamRg
	LmRo/jGXV1H+C8YHgswlCLXEc+XEtTZW3cDGSNE3anqtxQ+jVseGH0QgQdupegCZuJ0tGQPw6RB
	q1WuaZ5dxjzNGZKxlcLs/So5XUiujgBBxD6T+tzEN9lF26I31H2cIdJwMOLj3LRmMRG8F+kKbsM
	52IFyDmdW+Ge6qK2iZ/eM/eq2C6P+mKNTOfHb7TIvuLqLdWkQ==
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr26738023a91.9.1788680845337;
        Sun, 06 Sep 2026 00:47:25 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm21138905a91.16.2026.09.06.00.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 00:47:24 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Subject: [PATCH v6 0/3] mm/zswap: shrink zswap_entry via a pool id
Date: Sun, 06 Sep 2026 15:47:16 +0800
Message-Id: <20260906-shrink_zswap_entry_v6-v6-0-ac4cf61565fb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQanWoC/x3NQQ6CMBQE0KuQrqX5VKngynsYQpryga/SkhaKS
 Li7leWbZGY25tERenZLNuYwkCdrIuQpYbpXpsOUmmgmQEgoQaa+d2Re9dcvaqzRTG6tg0yxOTf
 ZRZcAWctid3TY0ufYfVTRPfnJuvW4Cfk/ZdoGdDy7FkUuCpFJ3tHEl/lJyqwzAsC9GxS9ubYDq
 /Z9/wEVj+WXqwAAAA==
In-Reply-To: <cover.1788528216.git.wujianyue000@gmail.com>
References: <cover.1788528216.git.wujianyue000@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1788680840; l=4938;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=KbN3asJSK+TTbGnv/VcqthRURzav8YC1jBQtgcwSjJM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH0cx7afb7EwRu47MyXKggWSjW8ssjR2L1qEb8101sNb/2zGGDS2pVRPumkcDgn331N2SAc3boT
 +RAUTfHD8yAM=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

Every stored page has a struct zswap_entry, so its size is pure per-page
overhead.  On 64-bit it is currently 56 bytes, of which 8 bytes are a
pointer to the owning zswap_pool.

Only a handful of pools are ever live: a new pool is created only when
the compressor is (re)set, and pools are reused across compressor
switches.  A list cannot look a pool up by id.  An allocating xarray
can, which lets each zswap_entry store a u8 instead of a pointer.

This series:

  1. Releases retired pools with queue_rcu_work() instead of a worker
     calling synchronize_rcu(), so the release worker no longer blocks
     on an RCU grace period.
  2. Replaces the zswap_pools list with an allocating xarray
     (XA_FLAGS_ALLOC1 | XA_FLAGS_LOCK_BH) and a separate RCU-protected
     current-pool pointer, giving each pool a stable small id.  Ids
     start at 1.  The reserved id 0 is never allocated, so looking it
     up resolves to NULL.  The table grows as needed up to 255 live
     pools (u8 pool_idx), not a fixed slot array.
  3. Stores that u8 pool id in each zswap_entry instead of the pool
     pointer.  The u8 fits in padding after the bool referenced field.

On 64-bit that shrinks the entry from 56 to 48 bytes, which fits 73 to
85 objects in a 4K slab (~2MiB of metadata saved per 1GiB of data held
in zswap).

The 255-id cap counts every pool still in the xarray.  Switching
compressor kills the old pool, but that pool stays in the table until
its last entry drops the pool's ref, so a draining pool still occupies
an id.  The id is reused only after xa_erase.  Switching back to a
compressor whose pool is still in the table resurrects it instead of
allocating a new id.  If every id is occupied, creating a pool for
another compressor fails and the switch is rejected.

Pool table locking: xa_for_each() walks and the current-pool pointer
use an explicit rcu_read_lock(), because xa_for_each()'s own RCU does
not span the loop body.  xa_load() takes RCU around the lookup itself,
so zswap_entry_pool() needs no extra rcu_read_lock().  The returned
pool stays valid because a live entry pins it via percpu_ref, so the
id cannot be reused under it.  xa_lock is taken only in xa_alloc_bh()
and xa_erase_bh().

Benchmark (x86_64, compressor=lzo, MADV_PAGEOUT store + fault-in load):

  - e2e store+load median latency: no measurable regression vs baseline
    at matched stored_delta

Each store, free, and decompress looks up the pool with xa_load()
instead of following a pointer.  With only a handful of live pools the
xarray walk is short.

Testing
=======

- Boot with DEBUG_ATOMIC_SLEEP + lockdep/PROVE_RCU + KASAN:
  zswap store/load, shrinker writeback, and compressor switch
  (retire, then switch back to resurrect) pass

This series is based on akpm/mm-unstable as of 2026-09-05
(d118502628f8).

To: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosry@kernel.org>
To: Nhat Pham <nphamcs@gmail.com>
To: Chengming Zhou <chengming.zhou@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Changes since v5:
  - Use xa_erase_bh() and move queue_rcu_work() out of xa_lock() in
    __zswap_pool_empty().
  - Drop the redundant rcu_read_lock() around zswap_entry_pool(). xa_load()
    already takes RCU and a live entry pins its pool via percpu_ref.
  - Replace xa_lock() protected pool walks with RCU. xa_lock() is now only for
    xa_alloc_bh() and xa_erase_bh().
  - Drop zswap_pool_current(), it only read the current pool under xa_lock(),
    which this path no longer takes.
  - Add a comment in zswap_total_pages() on why the outer rcu_read_lock()
    remains (xa_for_each()'s RCU does not span the loop body).
  - Rebase onto akpm/mm-unstable d118502628f8.

Link: https://lore.kernel.org/all/cover.1788528216.git.wujianyue000@gmail.com/
Link: https://lore.kernel.org/all/20260830114731.8322-1-wujianyue000@gmail.com/
Link: https://lore.kernel.org/all/20260815-shrink_zswap_entry_0815_v2-v3-3-0171bd86a667@gmail.com/
Link: https://lore.kernel.org/all/20260731-shrink_zswap_entry_v2-0-0-v2-0-e72083aa8734@gmail.com/
Link: https://lore.kernel.org/all/20260726-shrink_zswap_entry_v1-0-0-v1-1-30957e4d0cb6@gmail.com/
---
Jianyue Wu (3):
      mm/zswap: release retired pools via queue_rcu_work() instead of synchronize_rcu()
      mm/zswap: replace the zswap_pools list with an allocating xarray
      mm/zswap: reference the pool by id to shrink struct zswap_entry

 mm/zswap.c | 171 ++++++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 101 insertions(+), 70 deletions(-)
---
base-commit: d118502628f8b673be9023db8bdf878f64a7ed45
change-id: 20260906-shrink_zswap_entry_v6-ed3d14c9001f

Best regards,
-- 
Jianyue Wu <wujianyue000@gmail.com>

