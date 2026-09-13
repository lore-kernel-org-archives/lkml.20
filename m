Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971FB377EDC
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789309425; cv=none; b=XEi6Q7ml1J3PqyM/atyQSbWh67Nu9qz6gJ+OR7LeqAUR3K8dpsOKjlPLs0Q26Q8rdDD//GJu+okt+I+BXkH14b8+9Emjoc0W/0Uw1K9PYqaaT4H+i8OfaHJfheSoEoI/WCb0ZDMwWvwe6aRXgyM87ISoRRU5GO+BWnkL0wQIxRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789309425; c=relaxed/simple;
	bh=e2HDJRdd2+hJqcjvKMthttlGV8EVLKR/HAVzwxVBO2k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WYhAid2Py6AAI97cqRoC5g4SciaCZ0PskjBokVYsdojhV34PHHujcrcLEuPiyUrwx12cZwdrYN45HytgSo/+CgK869pJdfLSOyXenKvzlqhqf7spVZab+ousUq76WhL1RhSKVEq3BIethCe1Ls9jIQqlOF1umtnSKJhp2pKCg4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5Kl1xht; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5Kl1xht"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381b831d535so4678755a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789309424; x=1789914224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NNdYTq05HzZvTrlRKfAdsbtptyKt0LqomzUVZOXk5ck=;
        b=G5Kl1xhtBCwji2m9qAFI1D5RErMJkTjSI3nhwI+PBx2hf9amm9hC2ML2hPKccoo9dE
         PMMhkUojPLo47fZo2ANAOOadQoqhWwzrujZuuU2WL6Ej5NSU1zPLY4Vw+tJs20w0ZAiS
         H4s2CSaJRXkNnl+4Q01EWGm2U5SerEpILn4LT/e9rl2Jux3IflWZmi1nQxR0s43oC6Qk
         ZuQ5utmIMDrAGbEIuqpzqMua4yURUmELy8MZ4xoZJCjvWOx++qk3HYXCAEwfg7dWci6g
         YwLCEB/E9LLGsPUN5jgRrxpN4vXk/sE50VJndaD1ztFQQPJgK3oS6qCOenqMBIJW6DSd
         LSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789309424; x=1789914224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNdYTq05HzZvTrlRKfAdsbtptyKt0LqomzUVZOXk5ck=;
        b=Uuv27qCDE/VUq2PQXTS5oogjW2LwgzXrY53gwFcxigUvCxdlNGY8ENEKAWcSAgDIuU
         BIYd9bvt20A7UpPUbGIJ1hWd86h7Tc3PHhazVVUNDT/HRvWtjy3QzkmOMvjACjJ0+9fC
         NUpYesogkdq1mGQ346YjTW488ZUwJT3OVZZPtDqai/GjAaCE6CLWsJvn/yul0aQAwAH0
         76M6mq2SBeQN2Op6kNOAkRNxf95Tv4RXujfmJh/DSi3+g1uFeRLZ1h6sA0u+fdrfNZDo
         nysiA3BYcOPZ2GmuUlJY3mvQ3C/MFiWwjD0mrqYUwkVvX8hb/h+tnvGXpAL0l//V0Idi
         x09Q==
X-Forwarded-Encrypted: i=1; AKwUvBwk39ccIRgyjLl979avCP94eUflT3PROpNNS6cNgSTMXDVviiO5UP5OXeiU9lYvblcdbZByIyPj+5L3/yg=@vger.kernel.org
X-Gm-Message-State: AFuF++mM2G0e7y/ow7+umJRz9xr2Md0csOARQonNPSdM9QHcHd2t3gU2
	DMQiIR399/sVUmlp80H5CmTFF18iWT089SPuw4R9YncQrdutBh5G1VKU
X-Gm-Gg: AYBFou2IRjrdq96rimbMSF4mJ5qBUcHtBT0pfzFw4D4yN3brSSXwv1W2grmW/fx512i
	Pv9gGiA7gqXMK40bcGRdhh5uhoaZyRnp6WwSo9yCrDBMAFJayf4SwZ/c1FxPy6cI41gxucpu2L/
	Z0Fo0ZUpUcj7ePdRpRQrHWr9YCeZk0JGFbacxoDI8UyO4gzJpeh2ToEN8s8V6d40W+iIjsxsFu0
	G28jNZD68XCizTaixsvd+qLpNUrVUSbv+/PlYq+B5NXZpZc8mS0n1f/CG4YpLzuEiRqwef7P19I
	eCJkqNLqoQ0O+GfVVFpPQNiNN5mxc0JZjzPW7TXJ1TnlGHbMObupq4Xf5/Xy0OJq45mTdRepOv7
	+4QkB/qqqKSiybiBHf1dTI4sW8DXWGueynB2GRHn0yzkiwEgQ7cQ4g/3d6bGlu+mmQgB6i4uIeZ
	k4m2gjMtECwy7CsJx4E/F5cfS/BLWooitRHrI9AeJUswViyWQVFU+Kl/wt4d4D4cnsptegygn8I
	GL5x/SCEuRp
X-Received: by 2002:a17:90b:4990:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39d9c0acc23mr23740786a91.14.1789309423918;
        Sun, 13 Sep 2026 07:23:43 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dbca4c9a5sm2900843a91.0.2026.09.13.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:23:43 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v4 0/3] exfat: speed up file creation in large directories
Date: Sun, 13 Sep 2026 22:23:11 +0800
Message-Id: <20260913142314.1400062-1-anmuxixixi@gmail.com>
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
Patch 3 adds the LRU and shrinker used to reclaim filters under
memory pressure.

Test environment:
  QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
  4 GiB exFAT image, 32 KiB clusters

The measured results were:

                         Before          After
  real                   589.48 s        15.94 s
  user                     4.72 s         4.20 s
  sys                    584.63 s        11.71 s

This is a 37.0-fold speedup.

Changes in v4:
- Publish the next-empty-entry hint only after the directory entry set is
  successfully committed, so post-allocation failures cannot skip an unused
  slot.
- Invalidate the destination name filter when rename or move fails because
  the new entry may already exist on disk.

Changes in v3:
- Split the change into Bloom filter, empty-entry hint, and
  shrinker patches.
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

 fs/exfat/dir.c      | 288 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  26 +++-
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |  78 +++++++++++-
 fs/exfat/super.c    |   9 ++
 5 files changed, 395 insertions(+), 7 deletions(-)

-- 
2.34.1

