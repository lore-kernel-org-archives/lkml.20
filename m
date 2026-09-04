Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0AE4963A6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528312; cv=none; b=oGRgtvaKz1LDVjjT5ibpBT8P/mhqf+AFpkvSFrGFyp7OA3LtK9LJXchMu1JFCg/Gtl0xclm5qjG+wCbEwS65LLhxl2giQ4aqj7xEWEGjmjCmO3TjIRfc/j6nDWGl/C/ISd3gWlIgmBPnc0JadUY9UmgXEnLMrls0brVg1MLYZRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528312; c=relaxed/simple;
	bh=K/jiaZnVuaW5E5AeWCKVVN7yFU5/jENyifD0pDrIqBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQJOSHaD1TPJ1SE+pK6DovWAP35o7yuBgV5AaD33dzi84+rJPaHv6KGj85q1AGWEr5gATSOLARpBbV9yAowtA3l69ckd1QaFBBOJ0bEijUEfbu/JCj24qI5HLwupl1MFOFn7yjMH5jbYhzCfFWLpnBqbmgoIeupb9JGGCaRNiEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1HgBy2C; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1HgBy2C"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-85c9a79590aso997624b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788528308; x=1789133108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CP/vbJtIF948iniYIw2bTcvHalRSWj3A4FS22l6l3aQ=;
        b=q1HgBy2CB5uZU4eVTXalHWptpzMK4imJ22t19Le/bHEF+dHIij5XlEnUk+v5hfJWxp
         PdLG/snQtTQTKrcuwaw7uGhG2GjqU4qzEn16AzfgJlwjDTfAPfrJ39tXFNwUXkeN8A97
         guvQWqUZOf/avAsZ3c0JDeLBUG5I/s0VrjVcGmHHMnE9yGdIdi2ox1nd+1QGcy+b7q4n
         OVULBsV8oDybD/b50OblbOfL7BhFfJVvjlQDwpXS8sXOyTfDPSbPBLanfzwCWYajiH/x
         OfXbxD+WDLES8LkbeeHeg6glIw0/ru6WHoh/8Oc4DU8KKR53TBcLGUlFHd3gpyEQjtug
         VlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528308; x=1789133108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CP/vbJtIF948iniYIw2bTcvHalRSWj3A4FS22l6l3aQ=;
        b=A/601aIAiNrg/VpqWMCSCqvZ+EsyE1RhMKg/vb73YPMMHjvyKFKulo40EQ8rxExdnr
         brakLqrnbi/a2CgKN8YjjT2P5dqqUfgXI/09g2pla8VKxnIurid5efWGdb5rh3gk3TSX
         JNspxZtSKnMXP0+BZRIP67/AVvwo+IvNKL4AMvszn16jwFeaf8z7Ea4Gz5Qw9eEjy65J
         zDEClG5OoZ++vjzW9UcpgX3sRdkHik8kCudPSdh+ydNWUfWUe2LRYmfJdhKaViSdlB+W
         VtBrU8GulEs7mNt9qW0KXq7qKP6tW1/quqSOs7h72xk6ezbIeHXxL9DUwxyRJPhllDh2
         lbNw==
X-Forwarded-Encrypted: i=1; AKwUvBzfHcS1p+ha3tWOH42Caon1zJ851rp2M/ABXKM2y4nj7deFjPmKQoTFqWKChDGc+Uptsf1ZG5VK0USAU1s=@vger.kernel.org
X-Gm-Message-State: AFuF++n0Bhy+WBdz/Rh5nNog9Wn54UUKP1YStIqv3Wn+j4/clbhXzVvi
	YnWNo08U+kMWjSGEGGk5bJy0RChpkrCF0F8YLRutSh/Ffn5BOTpAuf4A
X-Gm-Gg: AYBFou2s5aVlSiX8l1X+ap0m8vnUl+aqzQyKuC/kLhxy/O3uJUfcLni5u9YsHuu9DR9
	vNAEmDNRZs+A/ZxKkC8Ww6L3oqDO1ML2gBjCIBi87wdZtHaWFdn9032PJuSsL1Vw5UUAR5zB1Hb
	VH22jfzS/v1MDApJjA6BFT8wQKlp/7nuGGkCGvmK89NryeA9xB5yUASwwcivrnl6LVYJMyAUghx
	JqtL0Chtz6XkoyWDMe3//r/bowyM4xMq18/cMyPx/6BmtQ00qqO+vLrAlD8ASaTiB1eYlRYs8Zf
	ENeKL8zuyMjwJA5TuLOs3RjOmc33bU0Cbw06p4x8Q859Z1s3q1ZonqKJ8pvaIoV+PC+1TYcBW5p
	VZ5xT43qExMuM3hS86RTqUAjtT4mVMjHPt8Ah7im4L8FgKZKLIqGow2wNSgKrQB/9/vP06hsO8C
	xv+nmrLfJpffgsPn6mGb+32CvWIn4FuJKmLVxxJ//Sr5H7pSYaimbaxT2MM3xX6YPBRGo7I6NQX
	3Cp4l6aj5gmvvNhVQYMW2/u+1ZXAxDUxEfa3g==
X-Received: by 2002:a05:6a00:2d0a:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-86169b6bda4mr7057801b3a.14.1788528307602;
        Fri, 04 Sep 2026 06:25:07 -0700 (PDT)
Received: from NV-J4GCB44.nvidia.com ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152c2a52asm1147302b3a.30.2026.09.04.06.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:25:06 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] mm/zswap: shrink zswap_entry via a pool id
Date: Fri,  4 Sep 2026 21:24:53 +0800
Message-ID: <cover.1788528216.git.wujianyue000@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830114731.8322-1-wujianyue000@gmail.com>
References: <20260830114731.8322-1-wujianyue000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every stored page has a struct zswap_entry, so its size is pure per-page
overhead.  On 64-bit it is currently 56 bytes, of which 8 bytes are a
pointer to the owning zswap_pool.

Only a handful of pools are ever live: a new pool is created only when
the compressor is (re)set, and pools are reused across compressor
switches.  That makes a per-entry pool pointer more expensive than it
needs to be, and the RCU list that currently tracks pools is more
machinery than this needs once each pool already has a stable id.

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
     pointer.  The u8 fits in padding after the bool referenced field,
     so the entry shrinks from 56 to 48 bytes on 64-bit (~2MiB of
     metadata saved per 1GiB of data held in zswap).

Runtime compressor switching is preserved.  Pool ids are bounded to
1..255 because struct zswap_entry stores the id in a u8.  The cap
counts every id still in the xarray, including a killed pool that still
has entries.  Ids are reused when a pool is erased.  Switching back to
a compressor that still has a pool in the xarray resurrects it rather
than allocating a new id.  If all usable ids are full, creating a pool
for another compressor fails and the compressor switch is rejected.

On 64-bit, struct zswap_entry is 56 -> 48 bytes, which fits 73 -> 85
objects in a 4K slab.

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

This series is based on akpm/mm-unstable as of 2026-09-04
(20cab322c95c).

To: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosry@kernel.org>
To: Nhat Pham <nphamcs@gmail.com>
To: Chengming Zhou <chengming.zhou@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Changes since RFC v4:
  - Replace the RCU pool list with an allocating xarray
    (XA_FLAGS_ALLOC1 | XA_FLAGS_LOCK_BH) and a separate RCU-protected
    current-pool pointer.
  - Resolve entry->pool_idx with xa_load() under rcu_read_lock().
  - Write pool_idx before the entry is stored in the swap tree, so a
    lookup cannot see a stale pool_idx left over from slab reuse.
  - Retire pools with queue_rcu_work() on system_percpu_wq.
  - Drop the RFC tag.

Link: https://lore.kernel.org/all/20260830114731.8322-1-wujianyue000@gmail.com/
Link: https://lore.kernel.org/all/20260815-shrink_zswap_entry_0815_v2-v3-3-0171bd86a667@gmail.com/
Link: https://lore.kernel.org/all/20260731-shrink_zswap_entry_v2-0-0-v2-0-e72083aa8734@gmail.com/
Link: https://lore.kernel.org/all/20260726-shrink_zswap_entry_v1-0-0-v1-1-30957e4d0cb6@gmail.com/

---
Jianyue Wu (3):
  mm/zswap: release retired pools via queue_rcu_work() instead of
    synchronize_rcu()
  mm/zswap: replace the zswap_pools list with an allocating xarray
  mm/zswap: reference the pool by id to shrink struct zswap_entry

 mm/zswap.c | 144 ++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 97 insertions(+), 47 deletions(-)


base-commit: 20cab322c95cea0327215bb81a05df69336032dd
-- 
2.43.0

