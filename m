Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816857;
	b=zE1r33kKiISCqhWbvPgVtHqNnLghs+Y7gkd8eQpma05NLdjWk/trxgRzCwGvftEzH4z5
	 fW5vt2Vd2GUSFDjDVGsd0Tt9FCoHkXcWMtgPpqc0PGIXlAR2zL5BS8BxYZg8B7YzwLsNe
	 9tBU0iqiFvFbxr8OU8JhIhCne5BeqxMcVYXrj0V9kHV4l5peq6E5Tf8Tds2ii9e08rUca
	 IBdSRsy6TAQragMP5QB/pWPkQmwu8MJ7PMcOW9qGyDE2rW/ygmKT+OLXXulbNUVyOrXTp
	 AXVrOO5hCRMmB9x+V3Ks7FIv8z91Nhf/x1Giba+o6h7J3ltuH1NxzASjLWMy7y1eGcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AnqFXuidLiaxByYIxjVtd9KzsEjAj9vwLIHGSb6bKLs=;
	b=lGBBa4l2VZ6lqLFnBnq5uJrREKbIfrdf3ij+Lv2BEz5BgcjydmLKxe+S1taNKiiI4+af
	 YK7u+By7oRJha/QIipcRlOK0FCV+VO+PIZSa055LD8HaShzaCugNgGIR3qTyCGlnWf81b
	 eA+IOzfofsSwmwT+ATlXfeo+Zqy2L3QhV51PgQktOPno3N+JS4UFJOIh2V58mPLT1/MYB
	 dQNROU7kN4ZradiZ3UFyZ10a3HpCk9tsvM3aLnyRnBMPv0+IsezeUljMyBVpDjdWUEqTc
	 lCp5jE3ZQmurIVlFMedtLVc+63MQnCNnGB4UcvwMO8FFeUey6wGSeDd7uwPrqhS6YDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=DMKWOee9;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF8E606A880
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BF8E606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=DMKWOee9
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1803068f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794816853; x=1795421653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AnqFXuidLiaxByYIxjVtd9KzsEjAj9vwLIHGSb6bKLs=;
        b=DMKWOee9hTNEpjHlQhK01VGdAJzP0AppU2FmVxqsOzEOTSdpZe3TsYpEIynJgdD+gj
         0OgEU47fdVaM5t/L+z1Ys5N6ROnUeHMKehhy6FizHRc8jjUq1+gNJ7WLDBfwe7k7CEwJ
         eLnAVU2bl6zcWVIrBNQ7IHYIJu9Lfuj9684OqmscKf/wz+c8dIHtEjWhbRn5mShnR6He
         Mb1KXgHmpEyxqdm4ZoS3/XuZgqbCnMWFYiDCQuTovhhTkwkc37g5eOnA0oRukxATPmu9
         6b1S72DpTi3pctbbHaGkatd1SMFCOY2rbcqlyvcDc2Lt0APoYByTdoFba9CxMEtIWZEy
         16xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816853; x=1795421653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnqFXuidLiaxByYIxjVtd9KzsEjAj9vwLIHGSb6bKLs=;
        b=w+Lc3nXQ1fuzzFSSG+9a2KGhT3kfaGILQrpvCFK8Y0L6FhFaIFUNk8KzoefYo9DiVt
         leTncLqoO4Si85D36rFB0JjISHEYfg2dKlGBZ0VGwxgzTEY7d+ZP+/+K75PGeJ0gcVpU
         N07+U600iz2xNpqA8Nwdzkle2q3jaTkwZIgwgz2XJXE92b+RkCxEebFiDiMLUblzQ+Jb
         b/Ag1qx1zhuro+PE1rGwiuwCbiSi6mhmVfviTprYq5MGLYq0Qtn3iabfMvjaOVd0w2RB
         UiuKN74QJISG1PGDTjf+wAbpydcjQQsDHTM9FfsVZ/EwXYzY7NDdyfirrSSrWgpmqCRT
         fI1A==
X-Forwarded-Encrypted: i=1; AL+hErFUlY0xzsXGIanE1YLSMwyYhlVqa2l/vXKNQDYFIj2xnAehqvF0GfW/X5snY956FMeBgdpRDJI1zriRHXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ROwySfbYdXDUFHpYpkNEddEK7dALWfBMs0rDCTDNdA4bhh7sM
	2Bw//+LO4/B9md+Ht7D2nzKQKnjr5izCaRrsh6WzvCdtVIJheAHh3IcGfUiJXaFn7wJs/exC3BI
	Wrov63LI=
X-Gm-Gg: AZFdTZfBOBbLq6sSqZGHsXSIcKJFSij13LKoZ6tHV79bWU+EZsybplee07DZKMy4X8m
	VEaxs2k/lvyNq09HV0EfeB6jz2GwdAbCYEC/KgvuD7USDSAplUWWIbXFc47DoQ1A5X6gGjY1bSQ
	Wb2JLJfvVg/G99J+EBz0qr4iCgB3cpxJsq15yXje8bcPwHDlep5TDWfdf+wUBfVRiMu7FPPMs2u
	o+PXufmVe/FQtObfhIuY1aeRrqKg2ywBkPBP7pBjntOZRwqrfzKQSagiLHBHUJjeqVxpC6GcQcP
	NWL7v/8S7w41jT60SBtP+CPxLWJQ0aMvod7bOAK1UhjiVtE+JSZQiBosv6Hzy6jzRG0T/yyR2A9
	6MuMwiuh8GJ9hg8IxrFtuY8glr/REJy1V39bGoRbWKMeADEwdCgRc1sK1D9N+nyTmx8DCX2oM5h
	XuJNZzdjBK58wkEEViKdzsIHcGC3wE3K5JffNgXQu3Lu8eDZh4y0ft1kshWqVfqUY8Pn//G6z/3
	hfOVf03S37JUkRptn2C+GJKYE84gBowPgHe/FgdDeC+ge+d6wFJtiVaxvy8CGuzgqspG0sDLLZi
	E90ceNY2b21z0uyC9AesvmuZPzZdQ2iC888EoGfTioIqnrcupQ9XwKk4W9Ehurf6+HulqTN1FC7
	hcrdg7aP6tVofewHnS/LslMoE0IXQGKwJRFSomtAZvxzMh0bRkw==
X-Received: by 2002:a5d:5e07:0:b0:49b:b94c:e8e8 with SMTP id ffacd0b85a97d-49bb94ce98amr26317536f8f.8.1794816853264;
        Mon, 16 Nov 2026 00:14:13 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm22902289f8f.11.2026.11.16.00.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:14:12 -0800 (PST)
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
Subject: [PATCH v3 0/5] mm: multi-gen LRU: reduce memcg rotation overhead
Date: Mon, 16 Nov 2026 09:13:58 +0100
Message-ID: <20261116081403.216452-1-max.kellermann@ionos.com>
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

This series is very similar to an earlier patch by Chen Ridong which I
was not aware of at the time of writing:

 https://lore.kernel.org/all/20251119083722.1365680-1-chenridong@huaweicloud.com/
---
v1->v2: rebase after MEMCG_LRU_HEAD was removed by d5d1712c5928
  ("memcg: remove lru_gen_soft_reclaim()")
v2->v3:
  - rebase on mm-new (MEMCG_LRU_OLD removed, too)
  - mention Chen Ridong's earlier patch
  - defer the get_random_u32_below() call until it's really needed
    (suggested by Barry Song)
  - rename hlist_nulls_add_behind_rcu() to
    hlist_nulls_add_behind_last_rcu() to avoid confusion about the
    function semantics

Max Kellermann (5):
  include/linux/rculist_nulls: add hlist_nulls_add_behind_rcu()
  mm/vmscan: move code to lru_gen_{add,del}_memcg()
  mm/mglru: cache the last memcg node, make tail insertion constant time
  mm/mglru: avoid redundant rotations of young memcgs
  mm/mglru: reschedule between memcg reclaim attempts

 include/linux/mmzone.h        |  4 ++
 include/linux/rculist_nulls.h | 36 +++++++++++++++---
 mm/vmscan.c                   | 71 ++++++++++++++++++++++++++++++++---
 3 files changed, 99 insertions(+), 12 deletions(-)

-- 
2.53.0

