Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705848;
	b=Bta6gXQuudHKJLTejpvulaTlSCmdhj5HLpkyxNXZaYAqAHOCE4BEGdM3OBKEgVpYo0Lk
	 +EdwdmSOIJgDlr6QVHgdJWMlA5l4dxU0fbp85xSEO6rvB3iAvjgIeA+k45r748WJZX5Hi
	 RjhQfA9EeMG+gjtRTbXIZWILALLMfcMDQSwQPtUtcBDN1b6nr32fh7iv6mysvzivszAG6
	 rF5PG18vwpAb0Q2PQWfJ2WWvF7dHyhIC1gmegcJBQ4ZKNQJjBwIAhvIVepvVzpXmlpSMx
	 hFYtOh9P7fEUFOOTw5a7sMCjYGaYxYCF94GLQUfilyJpK9BPE4j0b0wfGSAYYHxPWhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BHZ8wigQ+noV1zThe9Z+XoDY/JY+YdNhjpHWSzpgF40=;
	b=b7f05fYqKaUXmDryp8I1BebI+A4An+o2vuX4eKiFzKNVQ1ZgWzQUwYOC/C5IkOZ9eZIy
	 0mesajLJF49YPhauBcKbPH/x6SbsCMkrIwk2lnyVkmnh2CEe64BaVarQzqfyMeVhuZ0e8
	 fhO53t97QEyk9OyuK206Kl9GQcnBA6npaU4WD7zlwIiSrZwwN177uyx2kT6ntFBghZ0vo
	 WiamEpJ7QqHRgJSOKwpaQVb9bdoakqGcdqQEHpeaCO0P7hWSP3HYzGotFyYI+/omI4y/t
	 XCo9ncilqSHtGmeUj01+f8F8jU/+09E1pOov7876xpWOo0gnYh0yTzJc2AxYfA1c1lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=dqRmTDXe;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6141B606D817
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6141B606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=dqRmTDXe
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so3815876f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793705841; x=1794310641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHZ8wigQ+noV1zThe9Z+XoDY/JY+YdNhjpHWSzpgF40=;
        b=dqRmTDXeZ3TfhW2LCKEt4x3hIFoTeh4yebdPNvrUZ4BqhaMerPf8i2f07+cGqfTTy5
         kzjkddzp1nJ1JT/0AAYsU9bnsaiw8aEjUSG2S1xp4T1FR3vBqtNnDLZXUOnh5wyLo2XE
         I3wQeLeDpzUzSsRXl/X4P5jC2biHktFxiaXCryI7q25lLjhjSUJMz75JnPQXc4f9dM2E
         PZFn6JpUQ8UAL2kUBo1uokNU7IEx1jZgsjiOGVsps4xDTy0kk5r9SA1cjVYZDs8qptLU
         dbhoecyP0/yTrlEvRu+MuohKI79D5bV3xoQ6jWUX3BME+yJy5Q2733wJpwJ+9UO4bVTc
         CikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705841; x=1794310641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHZ8wigQ+noV1zThe9Z+XoDY/JY+YdNhjpHWSzpgF40=;
        b=JMvG35FiKJaSDGBMTzAif5tm6UHjyZMvf6h0ktaZDbVEqZOwK0fkRf7KO78eVTI+zS
         jn5XY8fVYbI9pvKJaNr6QCMjUcmlCr7dEwDA6uuW868r96/xKHj7no5oov2xmvnhuHKb
         V8tYhLJzfmiEYYkXjDrqctT11A17hemk62WvnoKv4lVYhJEKbl02iih2rVntXoi5R2yF
         oBy2z/YuaD0AOFwiZOR63sQzK/70QAcyRRbz7Y7z8yhd844zB9Nk4eCuwIlqR9uCOv1a
         hnD1vRTMoT/qg43nhQo8QFqSBitj6VrWtQg7d6de8N5GRrLP37TDT50x6AuK8PdL/Xx8
         xzKA==
X-Forwarded-Encrypted: i=1; AKwUvBykd8CbDO92WdmnOCORwDz8xK0wtix1eh2ZDGBlNZSLyPcQlbBazgfUrpCOu0ttpGpZsNF1CQNec8gZquA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EeXVdpduz1ULM7pj58v+Vt+OpuOJtYFtcb28zvWCWXdZEVy8C
	DBWUGBDtx0eRdmXjXcO6nuJfZ0J29jz+fweVxV8++HNlwCHH2x+4DmiuGiVXVClC1Qc=
X-Gm-Gg: AYBFou34lfLENB8oCclxq/GbL8i8Mz4aqvdDk1zu9NBPtGsthdqPc69L8LcoxYENETw
	E/u6aT3vnmEgGzHqRzHcelYu5VdoODzNN75jIipL4s8blofEoh/otsmyRci2iF4Wtb8leuWS7Zi
	tNcfWFLYRN/QcTOJ6wfr+W3qeAfC6o+bNCVvI2/TfKdw3lF1WT4QpVkYJqvkSU6nJA4roJWicYg
	PlzF7xu+pRSV3i+umRJ3DKqbHKFQzGHMxrbwYxykym0fD/6BYNuwmJiMMROVHDeGFAwgoFu5rf9
	Og12SkJutrWy8yXDqBmDb31bjv6IYdrtcE/N9PnR8bqhGbEkwlR1T6Z7cIxja2GjgbpiIaaVPre
	UG8S1yHB0VC8JbHu86jqftSXRh+Rdq9WpSDfLAeJqQ4kU6nBVoPyIQdz+iAb5x5OeQhs+S2A2kZ
	R6O42Xd00AYpz6uxUd0XK8LXiFD5Mc7h0Fpybt2PXYk1k6vc6yL974/HAX1xZy3oyhtcwhXCzPm
	dPed07akSjPW3J35zUgqz1SovOrm74UOqdPl9rHthiuqMcxoVCrNdN/Yo14BcxTelA5Ij2BxCzU
	mv93r6/lXXOqLMJIr27F09lpzgDrYmSq9vfL1yHCDhscrrHCNtJWGQs2g1eDnD+nxBzAYuNXQnh
	dDVsIgMSldReLvkzeFd2/qJtbnKyYq2PP8ShvLlBQ6oPDtpp5cwM=
X-Received: by 2002:a05:6000:2501:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-48e6e2b9c3emr28666535f8f.8.1793705840586;
        Tue, 03 Nov 2026 03:37:20 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm23000997f8f.28.2026.11.03.03.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:37:20 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 0/5] mm: multi-gen LRU: reduce memcg rotation overhead
Date: Tue,  3 Nov 2026 12:37:05 +0100
Message-ID: <20261103113711.1832834-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses excessive time spent rotating memcgs during
MGLRU reclaim on systems with a large number of memcgs.

On some servers with tens of thousands of cgroups, we had repeated
soft lockups and RCU stalls:

 rcu: INFO: rcu_sched self-detected stall on CPU
 rcu:         60-...!: (1118 ticks this GP) idle=ca74/1/0x4000000000000000 softirq=140067260/140067260 fqs=10
 rcu:         (t=2101 jiffies g=180256409 q=94266 ncpus=96)
 rcu: rcu_sched kthread starved for 2073 jiffies! g180256409 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=53
 rcu:         Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
 rcu: RCU grace-period kthread stack dump:
 task:rcu_sched       state:R  running task     stack:0     pid:15    tgid:15    ppid:2      task_flags:0x208040 flags:0x00000010
 Call trace:
  __switch_to+0xc4/0x108 (T)
  __schedule+0x2b4/0x978
  schedule+0x2c/0xc0
  schedule_timeout+0x7c/0x110
  rcu_gp_fqs_loop+0xec/0x4e8
  rcu_gp_kthread+0x12c/0x160
  kthread+0x118/0x1e0
  ret_from_fork+0x10/0x20
 rcu: Stack dump where RCU GP kthread last ran:
 Sending NMI from CPU 60 to CPUs 53:
 NMI backtrace for cpu 53
 CPU: 53 UID: 3758108211 PID: 4052395 Comm: php-cgi8.3 Tainted: G        W    L      6.18.52-i1-ampere #1203 NONE
 Tainted: [W]=WARN, [L]=SOFTLOCKUP
 Hardware name: Supermicro ARS-110M-NR/R12SPD-A, BIOS 1.1b 10/17/2023
 pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : handle_softirqs+0xa4/0x2e8
 lr : __do_softirq+0x18/0x20
 [...]
 Call trace:
  handle_softirqs+0xa4/0x2e8 (P)
  __do_softirq+0x18/0x20
  ____do_softirq+0x14/0x28
  call_on_irq_stack+0x30/0x48
  do_softirq_own_stack+0x20/0x38
  __irq_exit_rcu+0xc0/0x100
  irq_exit_rcu+0x14/0x28
  el1_interrupt+0x3c/0x58
  el1h_64_irq_handler+0x14/0x20
  el1h_64_irq+0x6c/0x70
  lru_gen_rotate_memcg+0x210/0x280 (P)
  shrink_node+0xb14/0xcc8
  do_try_to_free_pages+0xd0/0x508
  try_to_free_pages+0x11c/0x230
  __alloc_frozen_pages_noprof+0x4f8/0xe00
  get_free_pages_noprof+0x20/0x60
  ceph_alloc_readdir_reply_buffer+0xa4/0x160
  ceph_readdir+0x248/0xeb0
  wrap_directory_iterator+0x54/0x88
  shared_ceph_readdir+0x1c/0x28

The problem was lru_gen_rotate_memcg().  Its memcg tail insertion
walked the destination bin while holding the per-node `memcg_lru.lock`
with interrupts disabled.  With so many cgroups, the lock duration
grew too long and thousands of concurrent reclaimers were contending
for the spinlock all the time.

Reclaim can also repeatedly promote memcgs that are already in the
young generation, and scans of empty or protected memcgs can bypass
the rescheduling points in page reclaim.

This patch set contains three parts:

The first 3 patches add a cache for each bin's tail to make tail
insertion constant time.

The fourth patch skips redundant YOUNG rotations when the memcg is
already in the default segment of the current young generation.

The last patch adds rescheduling points between memcg reclaim attempts
and at bin/retry boundaries to avoid potential remaining soft lockups
under extreme pressure.

I ran a micro benchmark on branch 6.18 on a 12-core Xeon 5118: 8
concurrent workers repeatedly write `1024M swappiness=0` to the root
cgroup's `memory.reclaim` for 60 seconds, against a previously
prepared set of 1500 memory cgroups.  Each worker issues its next
request when the previous one returns. The test measures request
throughput and latency under concurrent MGLRU reclaim.  All requests
returned EAGAIN, indicating that the requested reclaim target was not
met; the reported throughput counts completed reclaim attempts, not
reclaimed bytes.

Results:

                  Requests/sec  Mean latency  Maximum latency
 Unpatched               4.56     1739.85 ms       4083.55 ms
 Patches 1-3            43.42      183.53 ms        393.15 ms
 Patches 1-4            59.22      134.03 ms        393.44 ms
 Patches 1-5            57.80      137.63 ms        412.72 ms

Constant-time insertion increases request throughput by 9.5x.
Avoiding redundant YOUNG rotations adds another 36.4%.  The full patch
series improves the unpatched throughput by a factor of 12.7.

All requests returned EAGAIN.  These results measure reclaim attempts
that did not meet their requested target.

I did not measure scheduling-latency improvements of the last patch.
---
v1->v2: rebase after MEMCG_LRU_HEAD was removed by d5d1712c5928
  ("memcg: remove lru_gen_soft_reclaim()")

Max Kellermann (5):
  include/linux/rculist_nulls: add hlist_nulls_add_behind_rcu()
  mm/vmscan: move code to lru_gen_{add,del}_memcg()
  mm/mglru: cache the last memcg node, make tail insertion constant time
  mm/mglru: avoid redundant rotations of young memcgs
  mm/mglru: reschedule between memcg reclaim attempts

 include/linux/mmzone.h        |  4 ++
 include/linux/rculist_nulls.h | 36 ++++++++++++++---
 mm/vmscan.c                   | 76 ++++++++++++++++++++++++++++++-----
 3 files changed, 101 insertions(+), 15 deletions(-)

-- 
2.53.0

