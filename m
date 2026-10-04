Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940213A6B8E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122223; cv=none; b=ZBbUKqReyCT8WU/LN7QhV2V3WoY2Ro33Ijbw8iLYbtBmglNm9bVaq9i7OBi02LZmUGH6/FtPtLNSMAQfNbOJWN1iqu8U4yeIrcVvMrdq1r9Of+QTSRsq59ppY8I1R270wFYOZh6TLtRInFMZnx1rIvWaA4Iq+Qetm5yqCIZGLMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122223; c=relaxed/simple;
	bh=pmFKQECN/1g2BouKe8+oDUfj61IJz+zyRJ4LXn804/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E48lt/wpOHacKmBixbOz4YG9Pnr0CzD9gN78B72fEHWWAEyjQgkqhN5zA8ewT2SrMhuHaJ9r+AGXeULvm5/uvlT78DC2/guVf+yF90x8YtpPLmDciw+kvqBQX5oOvsk6FaBO5d92Le6WQ46fXnY0HdRRuOGwGG76zH87BKMv7mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tGmVPUJH; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGmVPUJH"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a7e13e2a77so129098a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791122221; x=1791727021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+DO1yEzfxyadFeHcANw8jUbpWw6KMN2IhkWPDLISq9c=;
        b=tGmVPUJH0qXpJ0JsG7dAJhEOPoDlCko+EkapKRzrvrY3R3efhXETDjSMRUcCTbMknz
         f/mDwUYVVYiixpsnqcExeSzLFsdfMyHjK2g4LNnQhjAPdptyw9wy3wYcOKaBYrwLs+n2
         svw6dbWUVjZBGu5O5QEfjOBpg/PeQh5TDbYUR1fdPB1xcKG6qQcQaejtOksj+Ln/yImH
         z2g+WMLkD/Gd2HfImNsIRxOuvOfjcJf7SN+9ZSobilUkNoN5xxfGj6SaaMTnVDYZyemT
         2a81KuuZEl2wf04/kIKEPiVIw2AaFQ+tq/Jg7YIWW3tq6DS2CQxD1gZ02XLZJpRx9b9T
         GG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122221; x=1791727021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+DO1yEzfxyadFeHcANw8jUbpWw6KMN2IhkWPDLISq9c=;
        b=R30E6zNOQb1mWp1dGbuMp+zPSfaEsTRGbt6AURbzwzPEVMb2CyK6bNadrUM1UhMkW9
         YmV/CwS2FJz3lZGR3naAQxHChI6lGtWkd8RHZGvzcwEt4fjOx/DCsj+g0JBIrIQDFFrD
         6NTeNhNycQGSi3lOEdl0OJzWCpO2H8t4IJ3AWxC7A5f4krBbQQ1g32+TIGVi3VXcv26i
         NM0LILWWZ1CxzQU9tZjMXfeHXqCHPfltDXpG4KDvMDV2SxQwCe3YMy38mjk7eoIBtQmO
         XbkF9ukvcKcxclRJU8R2RnHC/8HqbDzJYcb8lRaGhJ24qCd3Ebzv+84SPuvJ4nxvULFp
         HN2A==
X-Forwarded-Encrypted: i=1; AKwUvBz/ZI/IqxyM/B6b4oK/dzbCMw71fxB4/dVWNMc2BT/bYPtA2Ew18URjlEHPkOaS44CmoexWretwf7OiEDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZhOPQkXijciQ4HIdV1yG7+6TIsPKmq8hvAu1B7lNKPs58Nw1W
	XbhQ1qz9igGYuuCTvmvQyVMni41X9AgnkzjeOf3Ht5F7eps5vOYmYFNg
X-Gm-Gg: AYBFou2HbcKsWw8R+XIq2XJ9XkuzV19/QwbmhLxvSjhqZF2r9+iwpaKU11NqKQflHSq
	5nl21NLIIZpGD7FZzGwSFWTkIoe2zmeQxvxqQ9OnfwQRRwxGBJ7gwd4hdH8yALhmD7lmECnznco
	2gfOvNz4hUm4AfI/+GikH37gbVZ+ZER2VJWaEuUxKYMnOzSIJMz3zf2f8wAKXnr/O017XNv4D1v
	6rXcgBKLqaBorYuN5pCtR9h4mJS6WG4DY1oHtdTmAxhy5v/LULVbqNTtwoG3ZnSMzPNsw0tKrcC
	HLI6lmdnN6s56WzUSFdebDs7rbA4G2LzvQPh6/32hSr0X6ShuNwUe1HAdz1fYxrQbtFOPJ2Y9CE
	tGNjNwIn/sJc6xtDShLHRD+eQhzOZVV8s9/70GSyZ6vw8E62Yt5jBu1O9mx9r++cGjh2/KsQtzm
	I76p9yxsZY/q7/VOxMHjp7h7ktiWRo0aMkWiKNi0hc6iq+SL+0g5kTtGcKcdY7X7e8xc4ihq6UF
	xrCHY9ZAqpT
X-Received: by 2002:a17:90a:1c17:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3a6f1d26a1dmr3124752a91.58.1791122221416;
        Sun, 04 Oct 2026 06:57:01 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7cd433sm6876358a91.15.2026.10.04.06.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 06:57:00 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v7 0/3] exfat: speed up file creation in large directories
Date: Sun,  4 Oct 2026 21:56:35 +0800
Message-Id: <20261004135638.1888530-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Negative name lookups and empty-entry allocation can repeatedly scan a
directory from the beginning. Bulk creation in a large directory therefore
approaches O(N^2).

This series separates the optimization into three independently reviewable
steps. Patch 1 adds the Bloom filter used to reject definite name misses.
Patch 2 retains and correctly invalidates the next-empty-entry hint.
Patch 3 adds the LRU and shrinker used to reclaim filters under memory
pressure.

Test environment:
  QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
  4 GiB exFAT image, 32 KiB clusters

The measured results were:

                         Before          After
  real                   589.48 s        30.09 s
  user                     4.72 s         3.40 s
  sys                    584.63 s        26.65 s


Changes in v7:
- Size each Bloom filter from the allocated directory size, using four bits
  per on-disk entry and clamping the bitmap between 512 bytes and 4 MiB.
- Track set bits and discard a filter when one third of its bits are set or
  directory growth requires a larger bitmap. Rebuild it lazily after a
  later complete negative lookup.
- Account reclaimable filters in pages so shrinker accounting follows their
  dynamic allocation sizes.
- Preserve the shrinker core's scan budget and return SHRINK_STOP when the
  LRU is already empty, preventing repeated no-progress scans.

Changes in v6:
- Invalidate the name filter when committing a new entry set fails, before
  attempting rollback. Despite the reported write error, the new name may
  already have reached disk.
- Move rename/move error invalidation into the Bloom filter patch so that
  each patch remains correct when applied independently.

Changes in v5:
- Rebase the series onto the exFAT maintainer's dev branch.
- Treat every non-negative exfat_find_empty_entry() return value as a
  successful allocation in the volume-label path.
- Record the minimum entry-set size for which a saved empty-entry hint is
  valid. A shorter entry set now rescans from the beginning and can reuse a
  smaller hole that an earlier, longer entry set could not use.

Changes in v4:
- Publish the next-empty-entry hint only after the directory entry set is
  successfully committed, so post-allocation failures cannot skip an unused
  slot.
- Invalidate the destination name filter when rename or move fails because
  the new entry may already exist on disk.

Changes in v3:
- Split the change into Bloom filter, empty-entry hint, and shrinker
  patches.
- Accept filenames containing exactly 255 UTF-16 code units while building
  the Bloom filter.
- Invalidate the empty-entry hint in every path that can free directory
  entries, preventing stale hints from skipping earlier holes.

Changes in v2:
- Move exfat_name_filter_free() to exfat_evict_inode() because
  ->free_inode() may run from an RCU callback in softirq context.

Yang Wen (3):
  exfat: add a Bloom filter for negative name lookups
  exfat: retain the next empty directory entry hint
  exfat: reclaim name filters under memory pressure

 fs/exfat/dir.c      | 352 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  30 +++-
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |  87 ++++++++++-
 fs/exfat/super.c    |   9 ++
 5 files changed, 470 insertions(+), 9 deletions(-)

-- 
2.34.1
