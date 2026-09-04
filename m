Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE0C46AA9B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519921; cv=none; b=Ca5RyFq2Yc+cHKOSWEnjGyScV5o1KPI8WB3EwN5Yw1rzOCLVB+O1Lv8ITOU3ylSK5l1AlX5d1lBWm8EcYNMpFDpliNzbSAMu/kChC1kGgtsJGf91BW6dVWqoTBTvJKeAuLlXXjUBHQUyie2kb938BdavWAQUksToddAiw62Jakw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519921; c=relaxed/simple;
	bh=3kP//1FNUJ0fhBnMfHAug/NSGo26NEWQ8ShhIowgouc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kanqXf7Yb50nKdnqW6ERfmrPN+eV7IesKiKkT7SQHV9Tm2dbKv7Sf98Ka03cEC/NZHKl4wUNfQP3hhxJNZ2fii/1f72E2E/kwXm6HbO1jhsNZ+9AKa2q5wzXYgxy9UttOTseDq4XTmYpv8aHrWIUU7miNeLTb2nfkB0WjnUIK58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuvAWfxT; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuvAWfxT"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so892249a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519919; x=1789124719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zM6C/NAdX4FMkbdyGWy9FkEuIV3AmmsEyAJubqP7u1g=;
        b=HuvAWfxT2Ov3yahqdWLuH114sjnWZoef14aSXhK6AWThohgNuJHCXvPJZtX1EgC8XT
         PSpMdf5w0eQZfz8kl2POX9PaywEc6f4SDbsxIe/4fEcg8geApHbp1sAIoYVl0s2e9CHp
         BL/K5V3p4YCd4URv7WXe/A5BKE/z5LsNwutr7ZWGnAeV+g+OpkX4d+uPtu6zKP3C7ALr
         6XH2Q4uCn6FO8kUSbG3kD1cQ0QdjFqHNP/JhycBzI3FChJuR22Ca7DuSuf2ykdTiPdLt
         ZIVdOYmRFAnOsuY0pTgtMdyGhTqIkdIq3w7vfOgmuU/8iBPB0OzH41AqrHtz49IdgzCW
         hPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519919; x=1789124719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zM6C/NAdX4FMkbdyGWy9FkEuIV3AmmsEyAJubqP7u1g=;
        b=lPa0SptGmLyzN9iKog8x48AVJI0CfWVvL77BElzeTn63bdhMSkSwSXj5bgNF+gIkg9
         Gc8RnWU8GEZLrFx4pAqHZAZhNPKksVhHam2GX8k5uE+EUqJfl2ba09H0s0Xy9qsrIIL7
         x+6ctDsD6sJ/MhB4Bwc+dlMOYlqakDe9nlT+p8l5LMrzhbLr/VOLjR5owIZeuG0SsjSL
         GGA/RW3rkrRVUwJW53x+vI59XQv5eE7KfucRUN6ZZTkmR3ZT03KDpbRJePA5vcYDp918
         xO6VnCdWq8SAWdAler/NgoES6sUozcSeXDr39xZ6oRT1rXqfpqmBqIJg2U0pB4XwTw2o
         U5lw==
X-Forwarded-Encrypted: i=1; AKwUvBzoPruF0VeI0iWoX+Z5srMH9iWDKwwYQYscIeb0eXgbn2cpl7K6x7bg+j/M411LXzN8UCMoO7s/wXxkk7U=@vger.kernel.org
X-Gm-Message-State: AFuF++kog3rVtJ1hfFVUyqG1/U7cSX2UtLPNEzU8w6Y+5WAT6wVilwsy
	3BqT7dnh50pz/PZRB/aZw/LjKCAKLK8B2mxEdVdc8jrvEj6cPJgNVKQL
X-Gm-Gg: AYBFou1DryerFPTexEq+8Qsq+MACEogF6Ky4ILOUH+VhuxHT84IQ+/kFN7gxzn0s8eX
	vXZXfOOdyIaYkOmp+NcJn3WvRUAunbSmu0YxeREsrFaVw/XXFZi0DDoMC/hsv53n3KN4QHQqSkq
	Zfz0QM59Ifdoi0Is48kZGmmMZvhkDDWJlGbExG1VUej7ZTk962EwoOm+82bJVr7LXWNFAuUwHi3
	CSWep6zHHUdIB4U+szZc2rVSbHO6f5OacOuUrDUcgCWDA9r0viqSlocqaY2TF7C4MJxahvtxxLE
	/w+rxQDHMAc6uoD2A2eDedELyZMclxPMl2fd/KeyVEdRXpFtt6n28N3Pix9IbpIcFTwMh5R9jHV
	uABRe3M31Emqn9DYnnj3nAHkrUduER42ZmntzBEGkoh7fU2QGUK7YZNs8MpQIgSQLsbk9bIEzMm
	/NOsev38Ic6kxSHXO13uBBzRHtB8hy0YawUw/lakThj9uv6BhtFD7to58Zae6NhYQ2iXBBgdU8X
	100SDg=
X-Received: by 2002:a17:90b:57cd:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39b260fead0mr8592674a91.1.1788519919055;
        Fri, 04 Sep 2026 04:05:19 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm3951145a91.8.2026.09.04.04.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:05:18 -0700 (PDT)
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
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [RFC PATCH v3 0/2] binder: split alloc->mutex to improve performance
Date: Fri,  4 Sep 2026 19:04:46 +0800
Message-Id: <20260904110448.23086-1-zhangbo0325@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bo Zhang <zhangbo56@xiaomi.com>

Hi,

This is v3 of the binder alloc lock optimization. Thanks to the Sashiko
automated review for the feedback on v2, and to Alice Ryhl for the
review on v1.

The series splits the binder allocator lock into two:

  - spinlock: protects buffer metadata (rb-trees, free_async_space,
    LRU operations) on the hot path (every binder transaction).

  - install_mutex: serializes page installation and shrinker zap on
    the cold path (only when pages are installed or reclaimed).

Performance (binderThroughputTest, Qualcomm SM8850, 2 workers, 10 runs)
under concurrent drop_caches:

                    mutex (baseline)    spinlock + install_mutex
  throughput:    27k-59k iter/s       85k-89k iter/s
  average:       0.031-0.068ms        0.021-0.022ms
  P99:           0.088-0.148ms        0.046-0.056ms

Changes since v2:
- Fix an ABBA deadlock between install_mutex and mmap_lock: the install
  side now uses mmap_read_trylock() and retries on contention without
  holding install_mutex, so it never blocks on mmap_lock under
  install_mutex (Sashiko).
- Fix a potential infinite retry loop on -EBUSY: an unexpected
  already-populated PTE under install_mutex is now treated as an error
  instead of being retried (Sashiko).
- Fix a use-after-free of the preallocated buffer on the -EAGAIN retry
  path: the split is now rolled back and the preallocated buffer is
  reallocated on each attempt (Sashiko).

Changes since v1:
- Dropped the simple spinlock-only approach that had a race between
  page installation and shrinker zap (Alice).
- Added install_mutex to serialize page install and shrinker zap.
- Removed binder_page_lookup() (GUP) since install_mutex serializes
  concurrent installers.

v2: https://lore.kernel.org/all/20260831123545.3655557-1-zhangbo56@xiaomi.com/
v1: https://lore.kernel.org/all/20260805152752.1924434-1-zhangbo56@xiaomi.com/

Bo Zhang (2):
  binder: switch alloc->mutex to spinlock for buffer metadata
  binder: add install_mutex to serialize page install and shrinker zap

 drivers/android/binder_alloc.c | 144 ++++++++++++++++++++++++---------
 drivers/android/binder_alloc.h |  11 ++-
 2 files changed, 112 insertions(+), 43 deletions(-)

-- 
2.34.1
