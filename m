Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F1B400987
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179766; cv=none; b=QvwcNDGkn/dKLm25y8hLJf3md2CpxW+qMEicYD9XbODuIZVUfeX3ndw0oODb3EiCo28DXt+Z9d2nLlHz9OxJR77VvKWE3ZOrhN25ewCT2+849plFaMj+jbX6Zf4IpjHuVYJBzC+sT4tq44ErhssBvCbNO6c1neB1iATO0QEOu4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179766; c=relaxed/simple;
	bh=7ikC9LiS35FjOaELPIY7E5OZsNWbtx3OuQq2J36ZNMk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=noIiMWn3/m+AZ9yDlfodbw3/Ox/2AYjJBl1Mqqk1AkmxE19de8Jf7SZlLCxle8iQt4kzkUQZZQT5FZ2CEYAf0HmuS+tEwp8Glw2Tti8xQN6TcNjl3r+0AwkRBAlBeIFfEUQuqABIg5h9t3pzkyfu2pj3gmz6Q5GFFi8/xDBCUbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRUrscs5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRUrscs5"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8487214ad2bso4507887b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788179764; x=1788784564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lx2Zmo+SsP1nVumu34Drh2ZzNRPfIN45V+1+6/o9VIA=;
        b=sRUrscs5utdh00A/zBROQHNM4+sz3HYD8U6oAALILGgRx3f69dbbcSmAbPJkeZSl2J
         mqBAdqwR0iEzyfrL6DCWBxMpNBl2WE3IJhYfArli16s//O6U0+hMGCe/+4IBjK5sfiwx
         N5msJzJF+p+t6HypYDKPLjcF7io4kLD/DwgHnAdumv5i+V6AmDJIkgyBD0rCSmOoOpOX
         BpBHFWyodkRHz+7BQhd8oDOsDvTEVB7GfWNFMPCpe/F94GxpqDVbj+HwVwP1RZzyQZSr
         Wl8uAJ0qJxxbj7gh2ko05/6aqk23UvtHmofuVAe7EZRPwmPvM7c423kV+yA4qh9Gqx98
         oHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179764; x=1788784564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lx2Zmo+SsP1nVumu34Drh2ZzNRPfIN45V+1+6/o9VIA=;
        b=ZGKxqYM324PISiz+YLItMsjnncI9BFGmW5qn7mckmj/lzZt9e6YamOE5EEzLtmiz8s
         kPZ7lp2aSQ442B6Uarx/Mo1S3NrP2GWrqIhBS3dwqLszca60MVT2DYHQ8W29UfvQ6AfM
         RkegY1688lS32/xfOtkLzymnLNmZgM3XRNLUyxhcHzS08z5gexk9aE3XtyPfkuhOO4Mw
         8TTvSCIFL4N31pLwusWDzAZmZ1/zstN0ZWxJFh9hQes5GCAB84E8cR6EGoUpeXVaEG5y
         Y26rHN7wsr3pSSRTSHKvGEK01fuAUSPkIRE+l74iW0xT5GhIO39ZZTkPKnVlhgox3kW2
         aajg==
X-Forwarded-Encrypted: i=1; AHgh+RrPg5MiJxpyqbtVguwPQY9dxvIGVQUdDS52fbm1oK7SPJ42g2CFn2KSfmMpR0MbZW9RdrCfcFttYR8rrhw=@vger.kernel.org
X-Gm-Message-State: AFuF++kNTO40BuozSZYDb2nrNDHRv+HjV9EJrHnWFK9UevQOLmTrRzKG
	cBBuoRDOqlNLNnPwxXXT9QI4peR8hrgFHQA6mhXzzcFkED4S/fdnhKxM
X-Gm-Gg: AR+sD127xrS05fYlmOWvVpv9mh/Qf3R/zlAXG1LEJ5j85Vlt5P2XBAbuKeG5fZ1yqxY
	Y2V4JHybkCSzrzXZES5YsuOOLQ1kF/moHgPF9ewydln7Wf5OtzA2pDbbiHxU4KfceGwYlqKo4CZ
	1k6gn+qdDwf9f5uLRc8wWlvXBxehau98d4SuEZX7+J/6fGulmydrhwuT/np8MkE+yacH+Yklo+u
	psqb7WIDsQU8eWhBPK062Qc76C/MZ5Hraqwvhah85P/uiSBBOxUpnusYqhLaN8JTaq72s8eSgs0
	1LGshFnL9bMuXTTtdiwAyBoPAI/1VfKTXQeWv1OYc/rr20PvzbK8RmC4ITyboLuIGXRL9uYpqus
	DxWWxRsRTfk/xg7s6DlU36fUK8x7rZn/VRTc1xu93L3ndq30UKwHH4lORGWI4sgxgyP1h4HwH9o
	wPpmgaQr7oSVESe/GJH1NyOG5vrQ/vMpOt8U1q+5vsFgpQpIA5qQIKpUteJvkIlLbdKTeBvqVJp
	wNuliM9AmyGxvh0
X-Received: by 2002:a05:6a00:4ac7:b0:848:2c2e:c7a3 with SMTP id d2e1a72fcca58-8562abbd937mr43369478b3a.16.1788179764399;
        Mon, 31 Aug 2026 05:36:04 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a3a7bf20sm3502474b3a.57.2026.08.31.05.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:36:03 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
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
Subject: [RFC PATCH v2 0/2] binder: split alloc->mutex to improve performance
Date: Mon, 31 Aug 2026 20:35:43 +0800
Message-Id: <20260831123545.3655557-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v2 of the binder alloc lock optimization. Thanks to Alice Ryhl
for the thorough review of v1 [1].

v1 simply converted alloc->mutex to a spinlock, but Alice pointed out
a race between page installation and shrinker's zap_vma_range() [2],
and that busy-wait retry would deadlock with SCHED_FIFO threads [3].

v2 splits the lock into two:

  - spinlock: protects buffer metadata (rb-trees, free_async_space,
    LRU operations) on the hot path (every binder transaction).

  - install_mutex: serializes page installation and shrinker zap on
    the cold path only when pages are installed or reclaimed.

The install_mutex ensures pages[index]=NULL and zap_vma_range() are
atomic to the install side, eliminating the race from v1. Since
install_mutex serializes all installers, binder_page_lookup() (GUP)
is no longer needed.

When binder_lru_freelist_del() finds a page already isolated by the
shrinker (when list_lru_del returns false), it rolls back and returns
-EAGAIN. The caller waits for the shrinker via mutex_lock/unlock on
install_mutex, which is safe for SCHED_FIFO (sleeps instead of spins).

Performance (binderThroughputTest, Qualcomm SM8850, 2 workers, 10 runs):

                      mutex (baseline)    spinlock + install_mutex
  throughput:    27k-59k iter/s       81k-94k iter/s  (~80% improvement)
  average:       0.031-0.068ms        0.020-0.023ms  (~45% reduction)
  P99:           0.088-0.148ms        0.047-0.061ms  (~55% reduction)

Tested under memory pressure (concurrent drop_caches) to exercise the
install_mutex and shrinker paths. No regression compared to the pure
spinlock approach in v1.

Changes since v1:
- Dropped the simple spinlock-only approach that had a race between
  page installation and shrinker zap (Alice)
- Added install_mutex to serialize page install and shrinker zap
- Removed binder_page_lookup() (GUP) since install_mutex serializes
  concurrent installers
- Handle list_lru_del() failure in binder_lru_freelist_del() with
  rollback and -EAGAIN, wait on install_mutex instead of busy-wait
  to avoid SCHED_FIFO deadlock (Alice)

[1] https://lore.kernel.org/all/20260805152752.1924434-1-zhangbo56@xiaomi.com/
[2] https://lore.kernel.org/all/anRNX4sftcuDXRj8@google.com/
[3] https://lore.kernel.org/all/ancz-vd9v5P5kRJq@google.com/

Bo Zhang (2):
  binder: switch alloc->mutex to spinlock for buffer metadata
  binder: add install_mutex to serialize page install and shrinker zap

 drivers/android/binder_alloc.c | 114 ++++++++++++++++++++++-----------
 drivers/android/binder_alloc.h |  11 ++--
 2 files changed, 85 insertions(+), 40 deletions(-)

-- 
2.34.1
