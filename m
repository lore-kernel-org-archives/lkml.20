Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708943;
	b=M2fZr9vLHzgxUA3kxr0pdZlAGTl6ctbxbUhNmbv7xoWhj/nVZzKLes65azaO8MDB5MLh
	 1hbMv75aXCX6Ux3vtyxSE2s8O6ZlqR4VtibvFO/sd9I2K3gJIwNYta/k4+I2Awp1tXZ9W
	 yRHqjtRH73jNwvGQDT5JNyhbQjRqX4DRPNoolNvP0OVFUK0L4Rmx8740JlWmhMirCgLpe
	 0ocfDbmXim8rADw8H4EEzIrGIMJOr/TScXZJM5aJwRWcgkwEXPRtDp8Wsk1G1Wv2y7q9e
	 QxQqEr5LcorHONND2QkwYCSvATrEWJnEVgm1AkkyHsxtnBF+VyKLK074vwkhbhBMsXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708943;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:Content-Type:From:
	 Content-Transfer-Encoding:Date:X-Original-From:X-Lms-Return-Path:To:
	 Subject:X-Mailer:Cc:Message-Id;
	bh=wOhCgbps4lA7SRHLdsZoglLbAnTEV76cW6tNLVgU3KQ=;
	b=Lo2O1z3ZqaDGJEY5rceAS4FUYLoXCDrZvlT2TMMEQ8RKAOjuf5Z6z5zrPjrx+sMBxnmw
	 F7H5o1uPaByVC7ussJt21wG3dOwgd6fD5vgcozsnWEeaB632SIWjuVoyoMMugo+O72oDM
	 LaD15f9/uuhmz487rVnLK8GyOdZ3hcUZX5kiC2BF5ufnG7W6eMAvWBb7pMc2V5Gor/l7s
	 9vmep3yuKlSUb3wWuY8kdFKnDw2U3KTS0bPV11WF9/Cq5aQhzLMjjq22JH/AyICM27qMS
	 GHG+mEYCxcYLGdxCRULbLkzEaXkZBU9HjenyxRGixMGFaswQSr5dgDjAoznEaUx3ySg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	arc=none smtp.remote-ip=209.127.231.114
Received: from va-2-114.ptr.blmpb.com (va-2-114.ptr.blmpb.com [209.127.231.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426B5606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426B5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793708935; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=wOhCgbps4lA7SRHLdsZoglLbAnTEV76cW6tNLVgU3KQ=;
 b=flOJ/X+ybYPE0Hw4aOowGOFweRGDj5wp90XD0ZDJd3YEc7liRSuOxdYJb1w176ufzFQZGm
 vukg3j0UsIJ60M2J0Dc118YPrpEJakKP5Wa7SiS+W5E2AlyBbf6VWujCzC/k+tYUtk03N1
 9kqqB+DEwtAV3xjH302BOj0Dd9OoHeX5zQzNHy7LEdlCbubi1gYeMk9PzEMfdQ+Ftbh8YU
 zxbBo1qFWly9lag/rwXrs2d6rAbdqnasVopYdmKEk9RZRN6whQuYlM1EgJjsdDEOltyNRR
 u/Fd1jA1FFRdlwcnz8gm6GEmvaf9iKsXIDeL3ZndzramxVK1idxj9FtYOvIR3A==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
From: "Li Zhe" <lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
Date: Tue,  3 Nov 2026 20:28:13 +0800
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26ae9d386+ea1628+vger.kernel.org+lizhe.67@bytedance.com>
To: <tj@kernel.org>, <hannes@cmpxchg.org>, <mkoutny@suse.com>, 
	<akpm@linux-foundation.org>, <david@kernel.org>, <gourry@gourry.net>, 
	<ziy@nvidia.com>, <joshua.hahnjy@gmail.com>, 
	<ying.huang@linux.alibaba.com>, <ljs@kernel.org>, <liam@infradead.org>, 
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>
Subject: [PATCH 0/3] mm/mempolicy: add per-cgroup weighted interleave controls
X-Mailer: git-send-email 2.45.2
Cc: <cgroups@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, <bpf@vger.kernel.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261103122816.48037-1-lizhe.67@bytedance.com>

MPOL_WEIGHTED_INTERLEAVE currently has one system-wide weight table,
configured through sysfs or auto-derived from node bandwidth. This series
adds an optional BPF control plane that lets privileged BPF syscall
programs install manual weighted-interleave overrides for individual
cgroups. The per-cgroup override is supported only for the default
cgroup-v2 hierarchy.

Different workloads may prefer different DRAM/CXL memory ratios depending
on latency and bandwidth sensitivity. Per-cgroup weights let an operator
tune co-located jobs independently while leaving the system-wide default
unchanged.

There is no new user-visible Kconfig option. The BPF control plane is
compiled behind a hidden derived CONFIG_BPF_WEIGHTED_INTERLEAVE symbol
when the required NUMA, cgroup, BPF syscall and BTF prerequisites are
present. The existing weighted-interleave mempolicy remains
unconditional, as it is today.

Each cgroup stores only an explicit weight override. Cgroups without
their own weights inherit the nearest ancestor override and otherwise
fall back to the system-wide weighted-interleave weights. No per-cgroup
weight table is allocated when a cgroup is created. The first BPF update
for a cgroup materializes a complete local weight table by copying the
currently effective parent or global weights. Nodes not named by that
first update become cgroup-local values and do not continue to track
ancestor changes. This keeps cgroup creation unchanged and keeps the
common no-override case behind a static key.

For simplicity, this series keeps the existing per-task
weighted-interleave cursor behavior. A task still caches the current
node and remaining dynamic weight quota. Weight changes and cgroup
migration are observed when that cached quota is refilled; the hot
allocation path does not revalidate a partially consumed quota on every
allocation.

Readers use the same lifetime model as the upstream weighted-interleave
table. Normal allocation paths select the effective table under RCU.
The bulk allocation path may sleep in the page allocator, so it first
enters wi_srcu, briefly uses RCU to choose the current task/cgroup
effective table, and then keeps wi_srcu held while walking the table
through bulk allocation. Replaced cgroup and global tables are retired
with wi_state_retire(), preserving both the SRCU sleeping-reader and RCU
non-sleeping-reader grace periods used by the upstream code.

This patchset provides three BPF kfuncs: bpf_wi_set_weight() creates or
updates a cgroup weight override, bpf_wi_clear_weights() removes it, and
bpf_wi_get_weight() returns the effective weight. All three kfuncs
require host CAP_SYS_ADMIN.

The cgid argument must name a cgroup from the default cgroup-v2
hierarchy. Overrides are cgroup kernel state: they persist after the BPF
program that installed them exits and are removed by
bpf_wi_clear_weights() or by cgroup deletion.

The existing sysfs interface remains global. It still shows and updates
only the system-wide weighted-interleave state; cgroup overrides affect
new allocations by tasks in the target cgroup and descendants that do
not have a nearer override.

Li Zhe (3):
  mm/mempolicy: factor weighted interleave state helpers
  mm/mempolicy: add cgroup weighted interleave plumbing
  mm/mempolicy: add BPF kfuncs for cgroup interleave weights

 include/linux/cgroup-defs.h |   5 +
 include/linux/mempolicy.h   |  10 +
 kernel/cgroup/cgroup.c      |   2 +
 mm/Kconfig                  |   6 +
 mm/mempolicy.c              | 357 ++++++++++++++++++++++++++++++++----
 5 files changed, 348 insertions(+), 32 deletions(-)

-- 
2.20.1
