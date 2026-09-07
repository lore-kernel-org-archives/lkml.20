Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF90B4E66A5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786071; cv=none; b=kBeWMlPTPviJq2sepKjhLlY1KmSoOpqg9j/vMvI/tCrXPKU2yMHE3ph/BknabydHXG3ck/tGou69aK4JwTOdZtHWxShttkakkqueCyw+NHvY1r1R33JrCVgEdFeT9twXxfDcWVNkxScP6P+dVnvOs/5JyUgb85IzGHSo1AmKC4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786071; c=relaxed/simple;
	bh=I+KGJQSaFuiFQqaJd4WTbgyQakGdDL17bHCfV1O6JO0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TYGOpefR/asYBO/u8vBQ2oP6q2sEoESMMjzpFfDyYDH5a4cnYd7lTCkYai67LLuS8th/nDu+AVdsHeDJoA9z0YUVPP2U8tFtwyGqX7AXEA8NhiTSGQHHaR26W8Zdk90ZPfPvBRXvaQv8ykN8znv7aAHJ2ABAX9yk7HwMhz+au4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pm8IvzzT; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pm8IvzzT"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3536357a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786055; x=1789390855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9lu9r4O1nlAVQeCkhUgitNF1/65fOde09LujJjN41A=;
        b=pm8IvzzTSzy5aPq39JqDJoCwWDEhkseOSgxMmczsp3Pn3ZaEAF2/rw0TrG6MqJ1FMY
         E4jvLB27CrkTNUjelmui01ELCISZlWDjEyIiqiKd7/tsYobWqwaCfX+0BttuQHeWPSci
         s3TUP1k4TNKvos3mTo9E1LjCwWx+BnfF0oY00w2yel+wqXoVxYYF+sMIVP23z+BFbF4X
         b0qOrAR5nO+Iap+YwFh0peFwST5qXUUFqPpL/7fuVp1lyRJIi19VMLe3+EZQblix1s97
         UT1qi1Lf/hm9Qrpf4sYifM4cUVPDVG1WnFEXTrjRIAo6LYrFhAyEMEWYe5h+lgobSLQ2
         ohnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786055; x=1789390855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9lu9r4O1nlAVQeCkhUgitNF1/65fOde09LujJjN41A=;
        b=bfc1SYMp17/foZX/YrMqBjSBnajOEGRLSdtf6mVnzSM/0IXQoNcPdN6pKhvVDH2Ve0
         6UjsuhJfxlXYdSukNVlOdXDtNGimqb3mIM2aVNrhpdoAnyEHodCJM4s87QiV3OUCheH1
         P4ufXQj2exZ6S2wcMsDbs+60h9pQ0gP9btQXUyrY8UxzUWAEaLj2LI31PV/TsWR0Jz0J
         FE0ZkHdc21trvsYw8HYlZtKFVkvOJ4FxYjKpoqZpd/pnUwph6EWysuFQvskeCIuZMTET
         D8V5k1EpJ/RLJaO4sm4kS7anoerCaXbp48FLRBuYNp/mZTNgOdymkmlCMIqB2ggJuZU6
         Do6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/ZpQ97FfYdNu1awRRTyvTixpdO6Pjo5W5lfnMeyMr7ANrYiVrYzDNODzq3+mrn8focEt/Gw63MBxy7Ok=@vger.kernel.org
X-Gm-Message-State: AFuF++n9rvIlCFq00keyxMv4+3GT3qm/lmTjROh5yuW6c6viDcVPfuPY
	xaQKFCqvHWQfTM+7bEJckjhhRGoNX7IyfIOabfd+K3zBoHOz/tfG7aBU
X-Gm-Gg: AYBFou0ZYFKKcYwDr5yEPP4/ujw8A6zhBDaIl2GvDJL72DdU9lCXPqog/m9iSKj4AOG
	j2OBe/FW65OtYSThmPoGf/LiPl7JVUnOoPefoYIHvPVdvFsdkc+IvwqZXB2CGti4wzojEeXmZiE
	HE/wqlgcJr4yZArx/WmJ4ZpELl5wU79K6pp2sa1smhPnWSeOaicYrXDaWvT3BdduL1MYW8Rv7a5
	J9tDfigwK/TwsHnZO6DrugUNkrWctLEOwutDVeORXrLBP7B0Va+sSjPy7ko5nDKLs/9fyC7HTiP
	b2x+Kd7Omw4xknvw0ecY5z8IWtjdoEUAC/wveZftacUBo958tv1DEh7BYOzYOVfHIFTfZD88PFB
	e2fmUH17WRb+jXC0DdpBiBfmyuukb7wBcvx1VdOdJswow21Oh3BOmZW7WzfTRwH3BTwmJBnLXuQ
	veW5vffCfNKVKFKo6eLLeiKCziHK1Cht/XYYQWuhIw3U/XNpZYGSiDT6jpLtOrJyHZtPXe+8O0i
	oK9fO4=
X-Received: by 2002:a17:90b:4d87:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39b26100bfdmr31090249a91.6.1788786055275;
        Mon, 07 Sep 2026 06:00:55 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae62a54f6sm10916296a91.1.2026.09.07.06.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:54 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
To: aliceryhl@google.com,
	gregkh@linuxfoundation.org,
	cmllamas@google.com
Cc: arve@android.com,
	tkjos@android.com,
	christian@brauner.io,
	surenb@google.com,
	baohua@kernel.org,
	zhanghongru06@gmail.com,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo0325@gmail.com>
Subject: [RFC PATCH v4 0/2] binder: split alloc->mutex to improve performance
Date: Mon,  7 Sep 2026 21:00:26 +0800
Message-Id: <20260907130028.807366-1-zhangbo0325@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v4 of the binder alloc lock optimization. Thanks to the Sashiko
automated review for the feedback on v3, and to Alice Ryhl for the
earlier reviews.

The series splits the binder allocator lock into two, with distinct
roles:

  - alloc->lock (spinlock): owns the non-sleeping metadata - pages[],
    the LRU list, the rb-trees and free_async_space. This is the hot
    path hit on every binder transaction.

  - install_mutex: only serializes the sleeping PTE operations
    (vm_insert_page vs the shrinker's zap_vma_range) for a given alloc.

pages[] and the LRU are always updated together under alloc->lock, so
the buffer allocation path always observes a consistent state. The
shrinker takes install_mutex with mutex_trylock() (skipping on failure),
which avoids a self-deadlock when install-side reclaim re-enters the
shrinker, and keeps the shrinker out of any blocking cycle with
mmap_lock.

Performance (binderThroughputTest, Qualcomm SM8850, 2 workers, 10 runs)
under concurrent drop_caches:

                    mutex (baseline)    spinlock + install_mutex
  throughput:    27k-59k iter/s       84k-89k iter/s
  average:       0.031-0.068ms        0.021-0.022ms
  P99:           0.088-0.148ms        0.046-0.056ms

Changes since v3:
- Fix an AA self-deadlock: the shrinker now uses mutex_trylock() on
  install_mutex, so install-side vm_insert_page() recursing into direct
  reclaim and re-entering the shrinker on the same thread no longer
  deadlocks (Sashiko).
- Fix a use-after-free: pages[index]=NULL is done under alloc->lock
  (together with the LRU isolate) instead of under install_mutex, so
  binder_lru_freelist_del() can no longer read a pointer the shrinker is
  about to free (Sashiko).
- Fix an RT-task livelock: since pages[] and the LRU are now consistent
  under alloc->lock, list_lru_del() never fails and the -EAGAIN retry
  path is removed entirely (Sashiko).
- The mutex_trylock() also removes the ABBA concern with mmap_lock, so
  the install side's mmap_lock fallback returns to a plain blocking
  acquire (no more -EAGAIN/retry).

Changes since v2:
- Fixed the ABBA/-EBUSY/next-buffer issues raised on v2 (superseded by
  the simpler v4 locking above).

Changes since v1:
- Dropped the spinlock-only approach that raced install against shrinker
  zap; added install_mutex to serialize them (Alice).

v3: https://lore.kernel.org/all/20260904110448.23086-1-zhangbo0325@gmail.com/
v2: https://lore.kernel.org/all/20260831123545.3655557-1-zhangbo56@xiaomi.com/
v1: https://lore.kernel.org/all/20260805152752.1924434-1-zhangbo56@xiaomi.com/

Bo Zhang (2):
  binder: switch alloc->mutex to spinlock for buffer metadata
  binder: add install_mutex to serialize page install and shrinker zap

 drivers/android/binder_alloc.c | 95 +++++++++++++++++++---------------
 drivers/android/binder_alloc.h | 11 ++--
 2 files changed, 61 insertions(+), 45 deletions(-)

-- 
2.34.1


