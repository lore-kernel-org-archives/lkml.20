Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A083F4DCA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838511; cv=none; b=IruhYHssvf7XJm1EAyn6HzfPX4jE95ulyJ8/D1TosZlm8R9cr0cFoqe37Jn8cUnDQI5XB75bwaDS9bAtZa0iBb09HrrSPeKJjUsWG4Yfy53baRGFiLa4Y/xjL065WYCtKip86wBZfjVgCZWGQVnbR8l0+h/ET2IVdJ9CB37mpM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838511; c=relaxed/simple;
	bh=x6MdrwCfK+njhs/mtkxd6db4v8mpuvG44E4rQK4adeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r46gAn57aQeuK44thfeuhPAJ48BU7Y/oLxgqeo/XEXU8yIdAa/tCK+11HW6f809q7oELMjV5OGuVaTr6Ejr5VLq6eBdANMsQsusK0c8tUI2gigSe8yS1Jy/vj4Pm4WaJxepeFd5xLUo26vCcQW7o2z7vIW/U+frspSQRHQjzcHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=EoC1TIXu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="EoC1TIXu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af27fe287so1967134f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791838505; x=1792443305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bb8VrY2RstmYtS1K9jrAWH7oBDyhwk1ph8H2PIO6csc=;
        b=EoC1TIXuT1KQYnCfS2EB7AcorowEReBIucrKz+gGCOoiK3l+BNUlIXan4nf5zluxFF
         lJkW3d/HHSnpsy78FHY4BnmUfXdvpKKJXIhj+aIBmYXdDgHX6ewv4eCxzkhuQ+fEZwb6
         frdZEYNOsPENerZqRV4k0Jj+h1nLJ3qUNbbYbW2ERahaFhT4MsHXDv9XSrXsN3yG3RoM
         Tse8qYir6gBx59O+cdvHjvpJKvJBSgq8nCXM+dWhfc8zWfdD1zj3JPueLR0OJ7O9swBw
         FfDm9KKR5XihU9n+FyrXJk5sVooAxmfB3tmHfESe3gI0Dkm9ZhIecoT4b8jfef6G1rkw
         ibIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838505; x=1792443305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bb8VrY2RstmYtS1K9jrAWH7oBDyhwk1ph8H2PIO6csc=;
        b=xWadVpqFlUt3zES4QJ92qi3IJk9ows95GNOqhuw3vbFDfSoP7pehZdyg1ZRl9zcdZ9
         xpyr5f5wDi552U1EPHhYxV61HmSxmADCDeuAaWuDpoc1wZMq5HUcNyQUmDcFZM/pmo3J
         xoUQA/MVG88noi2EU+gxV9BhjG8w200YSP7JuVtVGN4ZekAWF46tWTD7+up64Tn28dx6
         CNBi/8ztN+RAkvdLRmN8i5v/7rRKWqScO4QmP+5ZMFqsrgIEaHqLqd15qXv7e2ZgQxFH
         kYifLd3oCCrGozsSVxP2l0A7ErBy/eZr3GtXGDzKXTC6JxaE0scUlOEusSLOFTpCxkX6
         Ym4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxs54id8XDex97V9A9qXuvujR7AvT9rfN2q6wGeFraRjx858cRkJpD9SfjoNz1cKKcUzgpDMhfiN15fRq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1UIVx8/AfOKHRN5wxX1EvVYLdbuBOA/QvMNBUF7nWSFDYlufB
	+/FnJAX4SFYVAYd3Ui4Fc47TExhp6FRFQOpG7zap3sopdUMltKrMNk0P3uSc0m4+R3w=
X-Gm-Gg: AYBFou36wcP4v4jXHZVJ9E45lt5AYmadj1zmhotBIoxUCBsu1HzbF/wynHbyFeSedJi
	+Qs0NK09PVZDY8sJyuiGtgVFhxv9P9cmygfPAYa2TpEaeCS4imk4vvWpWQh6cljPq5mPJdaW9D4
	GLoZUqHc2kIfU4u2vmwJc9JA/F+yoqzDckZujPS8Faj8CkqQWw/v03zbxIC6KbT3eJnPM8AFbzT
	zluHbFL46sa4UA/pZmGkKc9/SW4D0zbB5gMx5F/slSGEFuVddizD6kvAlzs4pqb3d4lQEJKEusN
	z4M6vFpjeNHJHjBRNnFu8aSieU+SMRfbaw7l+d/KjETqFuR/Rh2L7Ypub6y13+kTLdhWZEjWviV
	xiipMhqbEJ95ayaKM2J8EG+q5257uB9f53p4Bkc5DBMadkw5j+JS1AfAgZCz8T5UW3fnZdSZzI/
	WJsehZ9PG86CcRw9reiXZn7pInHbXamV8dQa4Peu4I+BgG7VfRMRXrnzbs+NL5z+/SmDDu66tMd
	pJusNKyiLPziw3mmCWETeJApQFsZ5gsHqzLfXYR0nha/vkWCHf0fc7wJLa7PllCEhzTOHAbh64K
	uisQFqaUVA==
X-Received: by 2002:a05:6000:2907:b0:48d:c18b:d644 with SMTP id ffacd0b85a97d-48dc18bd66dmr16906977f8f.26.1791838505418;
        Mon, 12 Oct 2026 13:55:05 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm1895744f8f.0.2026.10.12.13.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:55:05 -0700 (PDT)
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
Subject: [PATCH 0/5] mm: multi-gen LRU: reduce memcg rotation overhead
Date: Mon, 12 Oct 2026 22:54:42 +0200
Message-ID: <20261012205447.2717801-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
2.47.3

