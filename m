Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222374;
	b=mGoSuNB8G+jiDO6sX3xxnoh+wBZygC+iYjI++zN2mebdDLyXYGNVShG0vcIO+8REOgjB
	 xTZFWgulTzruGTzdvRqpOxTnR2tygH2CJT4HHNnWDR2liTWazPj4DOplCEEEAp7up/P1j
	 jRaO5MIU2/2/s2sf3mtBAJUXx0cqsjD+DsRyZuZ6pCpNw/EPgJmliLMZflfwiL1yHtbIe
	 QR2YR4iDcj2kKRSUMM1AheOAy2kQG0hK4QXfkNYwvD7M2GrrvzYY8QXKKLdqgga4UyvXP
	 17RBAbMmVH6qsgOw4u3aDBPssrItw1XiImlNAEtzd1WeWUosdlQBat/F6MzFV4x6aRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=H1inaUJqZMR0MYj0p8tMRX6+N//ATaZsUxxZwRk9wOY=;
	b=sJXcbkkIOoMJCyox19KET0xZt5/K5QsEX/R1QNHy9H7gUsKMKQ9jf6eP0fj7/dcayRsi
	 Y9WgGP06sRzKy1QkafMm6GXNwGHUnaFUn4gZFZD6n3kzepjrvpIsS9qsmr3CzTpIq+iRd
	 QdpKXTIoXXlT5GnAdqPaRrS5qkQ3Ws0JwoKwkqpHpi4dVZ0TqHGl0WketDg8my/ik+p1j
	 XugOtqsVXyutnnh4kCNFd0aAOlSO+tBKGAAZnyFDjKbVTgyNvEd11cn0fug1HsXAj3HCV
	 N1jaLyqeHYD1YlIemxmpWpimPCrWMxI/3UcuLWlJjq9soCwk76+Vn7ezPnDUGsZK9Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ZkRzJCOx;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F220606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F220606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ZkRzJCOx
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5361e313e63so16788421cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793222373; x=1793827173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1inaUJqZMR0MYj0p8tMRX6+N//ATaZsUxxZwRk9wOY=;
        b=ZkRzJCOxNW0RXoaDaK4BiiSsiCN74vBLbd7HA0aNdCsWzHUm4S/zU+nkVMB9hHwmTM
         XdmEAr0IeNzF5OINUC4PxTeG6hgJ4KbRzC4qQc0oXedzPC/RE6TQrdZUfQt8E/OwFqyU
         JNCKJXEJ67jbwbpZyptcT6NRB90v/sAozWkhXGZXjIslQJClQnol0/JewKjFdh1f12JH
         CvhxipJFpR5kqK8Jal86LJY5vwd+hagBRQ1+OTNobdYNst2snxAQmUVDFBOiA5+bDE9P
         sUYrLFRRReliOaBUzk5xMG3d1VeF7afSt/9c1+eYOBwwAghauH1d/1UIiFzlGB1PvFjx
         9iZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222373; x=1793827173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1inaUJqZMR0MYj0p8tMRX6+N//ATaZsUxxZwRk9wOY=;
        b=oxmucOQKomtm51RtKPl9ASqbmgK7tjuPY/NlS4dPGWjEXqnXEYI6IzGlsYF5GFMxN1
         EYcJGf21H4Vyerr5tVXeErDl4pKpsMRjXrrCXloa1q/JO2Yg5Rab53Z3lVW3ERrhkhME
         q7u0ebiNFBQ3RuYaUGAEuppKqVdKdM5/eAnlzMQJkbWMCU8FkuPf60AIPTRj3+Bbtnab
         DzIIYLwNHsny3RKIepjsxWob4mDZn37zVYyNz9nmY7K3Qbl7s9bWC7j0w2bKKe6UjnE5
         zkvV3HZIjqSqIvXnGDobDN5TjOprWNGuWze1DTN1a8OhUoXdXijmiFLPC6pJStZrvqev
         Rcxw==
X-Gm-Message-State: AFq9FYIcSA7xzM8QGCa/h1mtfHFVPV0TVrijhJhflu7hawbfcQHQS/yV
	UmnhCLhceGWQCFSCKGp/OelsLxmKllMiUo2G0juYQv2lRk3+WW43/pHDSzy6jSzkcq0=
X-Gm-Gg: AYBFou1og709MexD3Tf5h6Z3TITqEcNHkf8UpJBf9WPT2b4YGK6ITa68d3XKgbZN1/4
	v1U3ipLQW5H2dUafJreTwSVWA72l5t/Rb1QcpbUzfXfVJaznp+Ue8k7nrhxydXIKCrXgNT4Ntto
	pJXdIKP72dDceyQQuVBTHlYrP28fW7Mm8RL1lhiMjJ83p9+i+Q8tTywwYTFbJ9CnX6ChM4o013K
	oXlrgGzW+2Zi3HBz1XUMw81mrmK2R5N8Op740RJgtFORi7S0jpFSwsqwuOrs7X1Fmdz12aebmY4
	0eutn6vj3L8O5cfZKd96hTkYEGIjFGnKWSkLf7NMzyamn/Uo2FN/NfVb6dbJJjANOMeQlB8Gc/o
	k0DjjNkjB/ChOQGfJBY4eBGjH1AkB2Z+zCxulI3iNGjDgsdAhXZBKKDbyJ63vBdnb+lbR4whxvK
	pu/oO00tbdghH5UxsOrvDqS6V3Wxis8PjVkamvC9jrqkXmRWTyyQLssWB4tt4JZ+Vx3G4vkOIeu
	EXVvB2u93dwrPPUWwN7TggA7Erj1/rbtqcSUFZ9u2RkfEQX0FzJu835eViLXdIBdtfaDV45XCRy
	KiNJRKaqIkJHHrlDvkyUAqSB1vHhtGHFEvaF/AwpUkzrUGygzboC2s/eSnzHkFweTU9tHsRwinZ
	yZZM1Wgtmk2f3cUs=
X-Received: by 2002:ac8:5f8c:0:b0:536:9684:36b4 with SMTP id d75a77b69052e-53fcc3d0fd9mr62417701cf.57.1793222373004;
        Wed, 28 Oct 2026 14:19:33 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6d598sm139778966d6.3.2026.10.28.14.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:19:32 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com
Subject: [PATCH v4 0/8] mm: fix allocator races with memory hotplug
Date: Wed, 28 Oct 2026 17:19:22 -0400
Message-ID: <20261028211930.3504634-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
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

Memory hotplug rebuilds zonelists in place while allocations walk them,
and offlining an emptied zone frees pagesets the vmstat worker can still
hold.  These eight fixes cover the walkers that crash, fail, or pick the
wrong zone or node as a result.

   1. a restarted slowpath loses its retry with reserves
   2. the zonelist retry is compiled out without MEMORY_HOTREMOVE
   3. NULL preferred zone after a shrink rebuild
   4. __next_zones_zonelist() rereads a slot
   5. allocations land outside their zone or nodemask
   6. the hugetlb pool walk takes another node's page
   7. alloc_contig_pages() takes a range outside its filters
   8. mempolicy_slab_node() rereads a slot

All eight are for stable.

Patches 5-7 need patch 2, without which their retry is compiled
out on HOTREMOVE=n kernels,

Patch 5 needs patch 1.

Testing
=======

Each race was reproduced on unmodified source in a QEMU guest with three
NUMA nodes and a 512M pc-dimm on node 1, left offline at boot.

A test module widens each window with a kprobe that stalls one CPU inside
it, as an interrupt or a vCPU preemption would.

       base                            this series
patch  outcome                  runs   outcome                  runs
=====  =======================  =====  =======================  =====
 1     NULL returned            3/3    page from reserves       3/3
 2     allocation fails         3/3    waits for the rebuild    3/3
 3     NULL dereference         3/3    ZONE_NORMAL page         3/3
 4     NULL dereference         3/3    ZONE_NORMAL page         3/3
 5     wrong zone or node       18/18  right zone and node      18/18
 6     page from node 1         3/3    page from node 2         3/3
 7     1G page in ZONE_MOVABLE  3/3    1G page in ZONE_NORMAL   3/3
 8     NULL dereference         4/4    keeps allocating         3/3

Cost
====
Kernel instructions per order-0 allocation and free in the QEMU guest,
counted with a task-bound hardware instruction counter around 1M
iterations on a pinned kthread, non-debug kernel, mean of 15 rounds:

                           instructions per alloc+free
                             base   this series
  alloc_pages()             890.5         900.5
  bulk, nr=1, nodemask      865.5         875.5
  bulk, nr=16, per page     477.2         478.1

Bare metal, two-socket Xeon Gold 6138 (Skylake-SP, 80 CPUs),
12 kexec boots per kernel across two hosts.

will-it-scale page_fault1-3: each iteration touches one page, so the
unit is page faults per second, summed over all tasks.

each boot takes the mean of 8 one-second samples.

Base, millions of faults per second:

  tasks                         1     10     40     80
  page_fault1, processes     0.46   4.16  10.51   9.23
  page_fault1, threads       0.46   3.51   4.35   4.19
  page_fault2, processes     0.43   3.66   9.02   8.33
  page_fault2, threads       0.43   3.48   4.37   4.19
  page_fault3, processes     3.89  14.78   8.10   8.00
  page_fault3, threads       3.87  14.29   6.88   7.96

Change in faults per second with this series, + is faster:

  tasks                         1     10     40     80
  page_fault1, processes    -0.3%  +0.1%  -3.0%  -1.7%
  page_fault1, threads      -0.5%  -1.6%  -0.9%  -0.9%
  page_fault2, processes    +0.0%  +0.9%  -1.4%  -0.5%
  page_fault2, threads      +0.3%  +1.5%  -1.4%  -1.0%
  page_fault3, processes    -1.0%  -3.8%  -0.7%  +1.2%
  page_fault3, threads      -0.9%  -0.7%  +0.8%  -0.2%

The boot-to-boot stddev is 1.0-1.8% at 1 task and up to 15% above
1 task, so no column shows a change larger than its noise.

Changes in v4
=============
- dropped 2 patches already covered by other posted series
- Added patch 1. We found that a restart, also reachable through
  cpuset updates, lost the caller's retry with reserves.
- Patch 4's changelog now says that an eligible page is dropped too,
  and that an ALLOC_NOLOCK caller gets NULL.
- Patch 6 checks for a rebuild before escalating to the pass that may
  migrate hugetlb pages.
- Added patch 8 for mempolicy_slab_node()'s double read, the one
  remaining instance found by auditing every zonelist walker.

Link: https://lore.kernel.org/linux-mm/20261014222456.2318284-1-gourry@gourry.net/
Link: https://lore.kernel.org/linux-mm/20261015210539.3243563-1-gourry@gourry.net/
Link: https://lore.kernel.org/linux-mm/20261019172346.3344005-1-gourry@gourry.net/

-- 
2.53.0-Meta


Gregory Price (Meta) (8):
  mm/page_alloc: reset can_retry_reserves when the slowpath restarts
  mm/page_alloc: detect zonelist rebuilds from memory hot-add
  mm/page_alloc: snapshot the preferred zone against shrink rebuilds
  mm/mmzone: read each zoneref slot once when filtering by nodemask
  mm/page_alloc: retry allocations that raced with a zonelist rebuild
  mm/hugetlb: retry the pool walk when the zonelist is rebuilt
  mm/page_alloc: retry alloc_contig_pages() when the zonelist is rebuilt
  mm/mempolicy: read the zoneref slot once in mempolicy_slab_node()

 mm/hugetlb.c    | 13 ++++++--
 mm/mempolicy.c  |  4 ++-
 mm/mmzone.c     | 11 ++++---
 mm/page_alloc.c | 85 +++++++++++++++++++++++++++++++++++++++++--------
 mm/page_alloc.h |  3 ++
 5 files changed, 93 insertions(+), 23 deletions(-)

