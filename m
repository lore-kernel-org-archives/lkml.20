Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E483E51F5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166815; cv=none; b=T/WOsynDro8McsuA0u2cH5SdFYiVkX/L8a4L/hhKiciakUUsG9EJCjzsn0DBAijltLSlIBYmY2wcxUrlRIrQy5E44u4X5EO3g7MmuanLv84FAvcLhKC02q1wAbhC6QspRNXmBAVWQz1DvGicoAQjrllZpu6UScwPs8BN2JwdsKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166815; c=relaxed/simple;
	bh=Kw1D7x3e0DUFoJur+dMbjUEgfL32VrgoQAFkq1DSLM8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZJqF1IkODjdbPJW1k/QOd7Sgh2iD1ppf/FzkBlEDQJh4oDsp6eXwO69SbfPFgBaRSixQI3EPJt7VqXWwTTxp9O6iuQqo9bKvTEQEqCT3sjsYexxiRGyFEl/bQ7kh6WkTAL16UZFqHbkTBYJaHIK7DqqviHDeIQgVQ0Ql6R2IYwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPxn+8iQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPxn+8iQ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d9004a1ac0so3457415ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166808; x=1790771608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bjEYBRRXH+Qyw5H6z4owKhXElfv0eipiaXkKKJThTG0=;
        b=mPxn+8iQCWgb+RuWWzZ4mI2Xpeo3uWR/AsejltQtFd8ewiZHlc1gUODY5Nxx0hDClg
         m6TdkTRXLbpSqzEhY9+weddxv/cihtgFUZOKQb5NR2TZT425Ryke1FEKMvtNnSLm3n9I
         SQKI0j6Dlgd/e+7kmkY+8ovtpnfNG8O/6rmGmwMsaIBclVD1secam/uHci9Dj6lwzmmX
         CqesIXO5QnGLvp3FX+ZRV8rPQZ/vJKE0onKREFEhLZCbU/uPaZCLvIw5I8sNVxmLSfOW
         mLqnM84T9CXOKwDV0Q+qcpcTw+Y3GE4LiHosuLIRMJZLv258XZfc1YRk6iW2w8YR3siJ
         i+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166808; x=1790771608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjEYBRRXH+Qyw5H6z4owKhXElfv0eipiaXkKKJThTG0=;
        b=E48q5oiowVK1BRHCyh3Nn46k/+javERXq5axygv9J3cym7EeF8syp2/EcTJQM7cJQ9
         qbamDwAyh4ZPRhnbveUhKXCoTlQn6LlICNj7FOEQfQ+iAGvPgnwc7IdM01Won5xtWN21
         L+0mwDWJAIRCn7vmpxXVD154W2SqSHi6ZhuNcbo8pIqya0z2Ctd2dujami+5ZRPI0BnC
         03nJOn9sfN0QSv2agaxA6XEmiOXbBKLSnRG52j8iYKw7PV4UzGBMmZBGzGRRwKDlF1HK
         vCTF/b2f2S+acEZWezahZGZONHn+Mnhj2ReXbXOKI14iXEexdrnUK/KZsnqu9a+qfFux
         wOBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0bxMcWBD8+I4p5vtdLnBpNQVt8UkmLFh5BQd9DVAvO8RAJ+EHnl6fol3m69gm++rQVzqZj3mkytK8ulQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kh5E04Zl2Dx7ZMB1y/QNZ9NGAPQTyJowVzpq/mTlAeRpxqt0zS
	to9NfFoLYya0nId0o/isnZqgQwDuD5VY+vGpvcg9R1tLeRBaenKPVRC/
X-Gm-Gg: AYBFou0zQ1n3huOKD01F3F71foygWhewYWijvM9LpOmrmi9ZEnghCHF89jnvAGCSM4r
	tmx5D3jdueH3CdyjzkfY/nX9p0brdn262qLjgIYtNbPWWxJrtFIeQbr5pjU4ZM2VOjG8wXBJKAO
	KC3/oCbtdgXG2w4yr9GB5oOdlMnaPUCZekq7BPz1vJuxVlHFwZFA1q1A0CQBxuZjl1YZEKqjAlA
	St23NUwxS2oHQR77weQZWH6n1sEuIxW9faWHcmIg8qXqp9Qaqi4X9/wu4OT4jgJUitcP3sMqm17
	KF73+d5IHlo3LQ3rwCYAJzQr3p7u7PRKsna66h9iET5YS2R7qiavj8isIBYEmUIT0fdrNQLE5c9
	hUu2kgmqtbd22g9vtrNQEuwbuRPmLMXzFsjOkJi3j7xKBpHADrjOIjJUe6NxYz5n+K8uZcUCKVq
	DN0cBmlg0Kfj/w9c3KoPhw5sF2oQC7iEtkfx2MjJH2x9d+GpxQa9ro7P5Z5vMGPmcCG7cKIQsDz
	ZXCtUs1ARdR
X-Received: by 2002:a17:903:4588:b0:2d9:1dee:43e3 with SMTP id d9443c01a7336-2df69d58bb4mr23419345ad.18.1790166803015;
        Wed, 23 Sep 2026 05:33:23 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm9510475ad.19.2026.09.23.05.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:33:22 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v6 0/3] exfat: speed up file creation in large directories
Date: Wed, 23 Sep 2026 20:32:57 +0800
Message-Id: <20260923123300.1626723-1-anmuxixixi@gmail.com>
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
  real                   589.48 s        15.94 s
  user                     4.72 s         4.20 s
  sys                    584.63 s        11.71 s

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

 fs/exfat/dir.c      | 293 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  28 ++++-
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |  87 +++++++++++--
 fs/exfat/super.c    |   9 ++
 5 files changed, 409 insertions(+), 9 deletions(-)

-- 
2.34.1
