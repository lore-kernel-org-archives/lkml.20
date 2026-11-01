Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499228;
	b=v/7QvIN8ikLcHEoxdSaGs4Qbh2PNUnviikrHIogd4FedqySEkR6PF3AXzZ+IDlwFfkHh
	 Gxq5rMw2HrypLRd/NhDjCtYcPVknaNjewww4GOOPJFgDi5V5B9uzIhaAkYvsb6pSkb3dj
	 lOXlVFZNzXMN85atvKkHzjbe1D0DdojDWRgnJ3T/yAvaMs+eg8eGbqkz3noV9LWTrX23N
	 nySHuzDqFG19IzEG5m0GzE+aDH7+kK/Ix18Nj+QSb6QPtWRd2d1f/Dzunhk5vrZ9xh89p
	 PSwzhpY0wQvq6razB/GKg1Dyb8rT1ITieCFT11YQq8HQfrqY5ORZkcEl/kN1EGLB1RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=//dwDWwlt0K01pJNLrRVdLtiRgsCM03tXrjKo5UHy9M=;
	b=LC8zXVO+MIUTEmCHA6u0N+UcaCOKcu2pMvN0a9U4OqvzTtq+xqCLRFIdzbx/cZkXWU0F
	 paN0ITGYjLhKAnZSYlhfFO4HBCC8F6bJwQ0oUoPqTa6qxiHgPO9b1yVL7CASpVysi9gEn
	 7yRk/NB4GLBQxkgM6Tzc1ujhI1Na/n1h9ucmj/U79jqticFm3NErdt/lPNPLM64R34yLy
	 b1jYnpd4YB+wnWQTGtB3tzm3yQHEwJ44+0Ih3ugZNZqro0UlswFCH6sFE48vJ8K1jStD2
	 GlG076rKcjI3Do1VbqdzlzVzleWU4ByPTgAAP/JiCUo/CI+c06vtKuqwBrJSBXuMgug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=H0H3M0Cs;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727AD606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 727AD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=H0H3M0Cs
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93ece7a73b9so258155085a.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793499226; x=1794104026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//dwDWwlt0K01pJNLrRVdLtiRgsCM03tXrjKo5UHy9M=;
        b=H0H3M0CsItgFBfoc8Tj7dwbmapyg4/KLDl+ED9vqhSwM4MHSdfX7/kj0EJ9XkbLsrZ
         +6YMh1M6hl2hXYLX2GSph2c1a2JcpJzR/jWrMaKgrhCrrLbtaT0xClwigTDuyBPl7QfI
         2S6ZeJyUIp6R30Xtc/iUiuH/hMK2GsjJUYx4fqMOIzOeCbO8z6ZJV1nOJ23TS6ePLr56
         BNy24LLaFGaozo1TROAT/xyuEEpNrnK4qg2KJCyaSLebEvtG/JTzQPIdrSr9TpQ/BxJk
         wS3kAk1qKz+v2r3C/E46V7jDRt8zru4RccFnv44stl8/MN2lsra91EggDRPONtyG1FBK
         Qelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793499226; x=1794104026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//dwDWwlt0K01pJNLrRVdLtiRgsCM03tXrjKo5UHy9M=;
        b=ogq3+VkgYPEfMITuT0J1YhgWE2Q6XJ6zdPsaFMhMplF3+DuX7l8bBg9v4ED87LuZpU
         Q4HwPWW+aXil7MJhRihyQ+8SiWxAg5OIfKBIjdt2wcZagE2MqmrD7JTIJHPnHrcuZAte
         zAObbi/Y+GXEyEjCP6d4ELTY8+eYjGFJ9ASGvuRULM6igy6U9xKFSj3VQwLVr1aTmEVV
         LWb3PeS3dk34eZn8/XwVnVEuqEUSEQHgPo9cy91Cpc57XQZHDL9K9K94zhzEK8WEhxCX
         9S1kYg/oQmRQcgCBBQZqZfHGQVQdxxZBkK0/jl09Xc6SkC/opi2WlbEn7Sfibr6fb9GL
         SEhw==
X-Forwarded-Encrypted: i=1; AKwUvBxaP3SSAH6G2O+DC4Qq5jgLx5z8dhNjAJHvgOzOAWIddFN3ruwCmWc9sd7r/FQHc0BhfDmuFHZA9VLHB4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN6S+TFAy4FIs7jWuiQfLiLsgMVMz7dViXhxuHWgGRNGaBFXv5
	SuLbDdkKRKprfxAkFRj4Uye8O8bVJJx5VXlo1/GbB1Xj059PHwFdox+ekVP0YVA+MlU=
X-Gm-Gg: AYBFou09k/E1QFTpo4nFa6GLzVRfnW/c03nXAPW/9gAjnsGlfxMypJ6iDWmef+Ap2eG
	0jchSv0XC6XjtPWRMei36n5LC+73K7Ma4VoOSybJU+EYf8ECSSS1Z1++NRQ4sdpUBQJ2TvJNg0Q
	ishGcWMwkSwghPdH4464+bHdajb5RwPYVeQ9ecTvHO+8s7UI7bkbuGSjWTRgMZUkoqsLNSmdWml
	G0XVDo35NhnidfHHJWHvZicFfpmGw6+dU0bYpk6dcw0w3LM3o++FwxtF0ImkJ6VTpC6SdpG5Jh1
	3XPVlLflalzhEhl0jhECLn63tFINPESHOFCaZDL5KrGj/Qrb89LxVTi04Y2bIb1BAVCkrKORe6u
	5TDMUg33A7ehgQmpX736O7yby3/GElJvXzdEMfGb+PWd3BVZpMcnqGbQlvDP4H2082OcN8LL32P
	jVK3a2DDJkWg80vBu4SQLGFXfYBV2DloIk1N0M6v7ouYeSfQskky6LgX7b4orLLIMTIEzZgwFyt
	ifxwcqX0hhtNnIL4Oxz60qSwlzN1QZcnHcmZ+bJYU+MQO4oMSuzKhG4TNDM8BNG2Sm2sRvSIbg0
	HayCnYliCpruiwDtR8/0iUpg37N5YPspeR9l6wWAD1MwauTCVjej1iq+AZyypzkDhK3nshzDigP
	8lENiaafDX8FvZOslC4moipvMtXL6R+4=
X-Received: by 2002:a05:620a:6406:b0:939:b057:daf2 with SMTP id af79cd13be357-9442176d62emr1044006585a.45.1793499226345;
        Sat, 31 Oct 2026 19:13:46 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425858552sm498131985a.18.2026.10.31.19.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 19:13:45 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	Bessel.Wang@huawei.com,
	jiang.liu@huawei.com,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com
Subject: [PATCH v5 0/12] mm: fix allocator races with memory hotplug
Date: Sat, 31 Oct 2026 22:13:28 -0400
Message-ID: <20261101021340.2251928-1-gourry@gourry.net>
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
hold.

These eleven fixes cover the walkers that crash, fail, or pick the wrong
zone or node as a result, and a twelfth patch removes a helper that
invites the same bug.

   1. a restarted slowpath loses its retry with reserves
   2. offlining an emptied zone frees pagesets still in use
   3. the reclaim_retry_zone tracepoint rereads a zoneref slot
   4. the zonelist retry is compiled out without MEMORY_HOTREMOVE
   5. zonelist_zone() may load its slot more than once
   6. NULL preferred zone after a shrink rebuild
   7. __next_zones_zonelist() rereads a slot
   8. allocations land outside their zone or nodemask
   9. the hugetlb pool walk takes another node's page
  10. alloc_contig_pages() takes a range outside its filters
  11. mempolicy_slab_node() rereads a slot
  12. zonelist_node_idx() invites the same double read

Patches 1-11 are for stable.  Patch 12 is a cleanup and is not.

Patches 8-10 need patch 4, without which their retry is compiled
out on HOTREMOVE=n kernels.

Patch 8 needs patch 1.

Patches 6, 7 and 11 need patch 5, which makes zonelist_zone() read
the slot once.  Patch 12 needs patches 7 and 11, which remove the
other callers of zonelist_node_idx().

Patches 2 and 3 are patches from anthropic, pulled in from Vlastimil's
series to keep the backport issues self-contained on the series.

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
 2     UAF                      6/6    no UAF                   3/3
 3     NULL dereference         3/3    allocation succeeds      3/3
 4     allocation fails         3/3    waits for the rebuild    3/3
 6     NULL dereference         3/3    ZONE_NORMAL page         3/3
 7     NULL dereference         3/3    ZONE_NORMAL page         3/3
 8     wrong zone or node       18/18  right zone and node      18/18
 9     page from node 1         3/3    page from node 2         3/3
10     1G page in ZONE_MOVABLE  3/3    1G page in ZONE_NORMAL   3/3
11     NULL dereference         4/4    keeps allocating         3/3


Cost (these tests were run on v4, v5 hasn't substantially changed)
====
Kernel instructions per order-0 allocation and free in the QEMU guest,
counted with a task-bound hardware instruction counter around 1M
iterations on a pinned kthread, non-debug kernel, mean of 15 rounds.

                           instructions per alloc+free
                             base   this series
  alloc_pages()             890.5         900.5
  bulk, nr=1, nodemask      865.5         875.5
  bulk, nr=16, per page     477.2         478.1


Bare metal, two-socket Xeon Gold 6138 (Skylake-SP, 80 CPUs).

will-it-scale page_fault1-3: each iteration touches one page, so
the unit is millions of faults per second, summed over all tasks.

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

The boot-to-boot stddev is 1.0-1.8% at 1 task and up to
15% in 10-80 tasks, so basically this is all within noise.

Changes in v5
=============
- Pulled in patches from Vlastimil's series (patches 2 and 3 here)
- inline functions (Vlastimil)
- Added patch 5: zonelist_zone() reads the slot with READ_ONCE(), as
  recommended by sashiko on v4's mempolicy patch.
  Patches 6, 7 and 11 call it instead of open-coding the load.
- Added patch 12, removing zonelist_node_idx().  Not for stable.
- Patch 1: reworded the changelog (Vlastimil).
- Collected Reviewed-by tags.

Link: https://lore.kernel.org/linux-mm/20261028211930.3504634-1-gourry@gourry.net/
Link: https://lore.kernel.org/linux-mm/20261027-pgalloc-ai-hotfixes-v1-0-9c7d1aca801e@kernel.org/
Link: https://lore.kernel.org/linux-mm/20261014222456.2318284-1-gourry@gourry.net/
Link: https://lore.kernel.org/linux-mm/20261015210539.3243563-1-gourry@gourry.net/
Link: https://lore.kernel.org/linux-mm/20261019172346.3344005-1-gourry@gourry.net/

Gregory Price (Meta) (10):
  mm/page_alloc: reset can_retry_reserves when the slowpath restarts
  mm/page_alloc: detect zonelist rebuilds from memory hot-add
  mm/mmzone: read the zoneref slot once in zonelist_zone()
  mm/page_alloc: snapshot the preferred zone against shrink rebuilds
  mm/mmzone: read each zoneref slot once when filtering by nodemask
  mm/page_alloc: retry allocations that raced with a zonelist rebuild
  mm/hugetlb: retry the pool walk when the zonelist is rebuilt
  mm/page_alloc: retry alloc_contig_pages() when the zonelist is rebuilt
  mm/mempolicy: read the zoneref slot once in mempolicy_slab_node()
  mm/mmzone: remove zonelist_node_idx()

Josef Bacik (2):
  mm/page_alloc: keep the pagesets of an empty zone
  mm, page_alloc: pass zone pointer to trace_reclaim_retry_zone

 include/linux/mmzone.h     |   9 +---
 include/trace/events/oom.h |   8 +--
 mm/hugetlb.c               |  13 +++--
 mm/mempolicy.c             |   6 ++-
 mm/mmzone.c                |  11 ++--
 mm/page_alloc.c            | 107 +++++++++++++++++++++++++++----------
 mm/page_alloc.h            |  19 +++++++
 7 files changed, 123 insertions(+), 50 deletions(-)

-- 
2.56.0

