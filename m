Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550386;
	b=KZlzzF4pyOgXpicM/ZI+kwOcR34uf6hZedHvBPSrbfcCXVY6XubHQOexGY8hI2cr6tmP
	 bZ6ANO5gUNYkmuP1xgN5bo4cNYDA5NL7/u+bdTHunRw0/MXkEQbSi0KMgqTbEFUs2JiIp
	 iu9ZNE3mDIzPPTnJG07RstLXGiVR9st/TbeZ2X89jx1uYsKY1QUuE4zFUHwToaDYINVFd
	 v7nfj/1aShNX4mSxE/1hOhYR37rlCK4K+8WN9PMzpXz2MFcx1WHpcx5n5dEgbDMrrYDNz
	 f9AWRhgqivmxCJVG/CnEuB9HdBrqCk4fUCNoNXFXOQ6dAZ1arbPfyrAdhHticoiZBtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IJC2MsJ0jpysriv3T3ncr7oRZBUiitKdqEmiCZfBP3c=;
	b=IQXSNxR3VXjO8f7SifvHx6zKFC1y2JIjyHV50jhb9sGjSi4lUpPB+bsuz7BjaIeLJ0O7
	 9xbCYBQAE0AB5VVvvd2nKmpnJytgzBbcWW0KesdQxWt4zRkZHz3iU/iEs0VCE0gwg9e+z
	 XF2oBQ3Ch/WgVXM2KufgAtR5oGcDg25Go0Ojbs5J/mo2KVayn2WW2g+qL3gQuOe+PAPpi
	 7w3J8P1sieoFP0xdddWIXxwm3UgTqp2Bx0nwzAylD+gZL9/pbZ8z8VzYOqSI9vqa5k25i
	 tu4GRRJqkmbb9QvkqvDROVDiak/ONK7rpxt6JkNtdYR7lUoQHC2Y9A3uy7GatXSYUxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nSSuRi0r;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58976606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58976606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nSSuRi0r
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91b55859245so3767786d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792550384; x=1793155184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJC2MsJ0jpysriv3T3ncr7oRZBUiitKdqEmiCZfBP3c=;
        b=nSSuRi0rD76Z+mPU/mnWiKz039LXlRWFW6nVXhi4s3UZ+g04tOq+dsBBeZQbXCbrnS
         zK0WKL/fhXWUJSIYUchbF+SBvXI5GjYA7jvsv6e9pZUQHzTFn2ZViJO4vF7lKI2DKmNq
         NNeJ5EulFeehC2UZDJh/PGgTsfo03S3BETEUuASgDtjBSYhXpg+KSsQo4sznnRbGKfFr
         IhdcESvJMBlTwhY3hcFFgXCBd9oY4CDd9iOCqHV4wUz+UhI/7xxDb0X7FCwn6nBR2Mtb
         nEjt2lR94eOvoJc9S8orS8DHi30L2atj6DvSLNh5r3tJ3Jh/IjURTQLlkGNIJTX3Swgs
         TbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550384; x=1793155184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJC2MsJ0jpysriv3T3ncr7oRZBUiitKdqEmiCZfBP3c=;
        b=Yepp90RSYkvSkeA2QedR8ITFqCVVxCaraeXRzSAAzW6ry8G4RrKVctAfWswdBr42sa
         SukgJy6aOqh29PorLE1gMPrMp/SeItgo+9DsOVXV7OJMxZHLJampocPnn3BQMmATzffW
         k3nhuKzbw8zG1l1+GbHO53XzHgbjcztRP0an4ZBaiQLx9sP59EXnlOyXkD3RmeFEeA2x
         HfvtzoGbYsWbAEVvBuK0vFFddAp+vLTfbRI3lYoPoHQawz70hsEO4+aXK+UCuU7vsKjJ
         Z/SDMR67nTNQnTT76hTDehIBWuq82dSyv9X3j2FUs05yBFyS4lsSA9+yRN4zgBY9BE65
         GH3Q==
X-Gm-Message-State: AFq9FYL7+xbDD05esfRcspthQlUkG4W0ifwVsqMkEZPxc/UQBAJ1pJBP
	FWLzGDwq8lqdHWbu1CSV90SuUvmR6400ExLkF+QlYsY7Gosk+nYtfe7QMxJE+nvktC0=
X-Gm-Gg: AYBFou2GBa/VXgIVVE7HSpHZADUfBTwQyWlXIUruwbFAh9j4O2BA3EYCJXH/0PO69mE
	lql1b/rV3fkHiKi7luNx9t8TmpIwNISAk+yEZmAABb5VBYX65Im4qGwdLdxVuz0rXQlDeVj/SCv
	4bGR9sAJJZJq1VRHBG6ImZGK9UuYEMRl8wczHu3eoF/5GlhilkVCCSns1BKRyiB/wD+ym7sCems
	bbp2QT17inB3r48Xk+CEJgVErzmBbsPWgaXEGnlXZMhJbBfM2D4MhXCfXo8itQmqMW7y9669LUI
	G5JQ5s01F4BZ0ITQHpVIe3cW87yo2vGrKP5JC9AsEdL0qm+PxQeI5MFGQpsd0IHG7KXMIg+Rwew
	cJ732OAhvRxIpCt3St8ZhA9pI3JxnO5NbFC0dvwUxHWy5trONCHWr9727jcE7knPCEMlMr6wAOq
	Gnn/hg/YweyLFy2g+ph30dzzK7BXJOaV3ijMY/+/E3/CScSKHC8VAGLkjCWYhBJgIhWYArJSpoh
	XhEHE7AwDaTtZvMlXm3l/XLFe2aR37mZEVYLyCCkGO2EkpXIVoUWZAcXqzul8PAuwo5H4g0/Mtn
	qsBYDeFTY+z7MjeSJN5QewJUAVjjusqEWmm9/q95Eg==
X-Received: by 2002:a05:6214:3bc5:b0:91b:8059:5037 with SMTP id 6a1803df08f44-91c12ee3a7dmr14525426d6.32.1792550384097;
        Tue, 20 Oct 2026 19:39:44 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10a45336sm13819426d6.3.2026.10.20.19.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:39:43 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	mhocko@suse.com,
	rientjes@google.com,
	shakeel.butt@linux.dev,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	Bessel.Wang@huawei.com,
	jiang.liu@huawei.com
Subject: [PATCH v3 0/8] mm: fix allocator races with memory hotplug
Date: Tue, 20 Oct 2026 22:39:32 -0400
Message-ID: <20261021023940.1940971-1-gourry@gourry.net>
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

Eight fixes for allocator paths that can act on state another CPU is
updating: zonelists rebuilt by memory hotplug, and the pagesets of a
zone that offlining empties.

I've packaged these together because they're all related to hotplug.

*** Backport note - Patches 5-7 build on patch 1: without it, their
    retry is compiled out when CONFIG_MEMORY_HOTREMOVE=n.

Most of these race conditions stem from zonelists being re-ordered
in-place at runtime during hotplug.  The result is a mixture of failed
allocations, NULL dereferences, incorrect placement (GFP_KERNEL in
ZONE_MOVABLE), node misplacement, or incorrectly allowing hugetlb /
contig allocations on a node/zone otherwise not eligible.

Most of these are incredibly narrow race conditions, but since the most
likely impacted machines are VMs with memory hotplug, the narrow
condition can more easily occur when a vCPU takes a long interrupt / VM
exit of some kind.  I've made all of these race conditions
deterministics with a kprobe reproduction module described below.

Reproducers
===========

All eight races were reproduced on unmodified source in a QEMU guest
with three NUMA nodes:
   node 0: 3G, CPUs 0-1
   node 1: 1G ZONE_NORMAL, CPU 2
   node 2: 1G ZONE_NORMAL, CPU 3

And a 512M pc-dimm cold-plugged on node 1, left offline at boot
(CONFIG_ACPI_HOTPLUG_MEMORY=y).

Patch 1 needs CONFIG_MEMORY_HOTREMOVE=n to show the failure
Patch 3 needs mm/mmzone.o built with -fno-inline -fno-ipa-sra,
        without which the two reads are merged.
Patch 4 needs the reclaim_retry_zone tracepoint enabled.
Patch 7's hugetlb case needs a 64G guest (node 1: 4G) so that one
        memory block is 1G, with a 2G pc-dimm on node 1.

The windows are a few instructions wide, so I used a test module to
widen them with kprobes that stall one CPU inside the window. This
emulates an interrupt or vCPU preemption.  The vCPU preemption is the
more likely event to cause this at large scale with memory hotplug.

Patch 1 (zonelist):

  Online node 1's first memory block as ZONE_MOVABLE, which rebuilds
  node 1's zonelists.

  Stall the rebuild after it writes ZONE_MOVABLE into the first entry
  but before it writes ZONE_NORMAL into the second.

  On another CPU, allocate GFP_KERNEL | __GFP_THISNODE from node 1.

  Before: the allocation fails, 3/3 runs.
  After:  the allocation waits for the rebuild and succeeds, 3/3 runs.

Patch 2 (preferred zone):

  Online node 1's block as ZONE_MOVABLE, so node 1's local zonelist is
  [MOVABLE, NORMAL].

  On another CPU, allocate GFP_KERNEL | __GFP_THISNODE from node 1,
  whose preferred slot is NORMAL, and stall it after it loads the zone.

  Offline the block, which rebuilds the list as [NORMAL] and moves the
  terminator into the preferred slot.

  Before: NULL dereference in get_page_from_freelist(), 3/3 runs.
  After:  the allocation succeeds from ZONE_NORMAL, 3/3 runs.

Patch 3 (slot reread):

  Online node 1's block as ZONE_MOVABLE, so node 1's local zonelist is
  [MOVABLE, NORMAL].

  On another CPU, allocate GFP_KERNEL | __GFP_THISNODE from node 1
  with nodemask {1}, and stall it after __next_zones_zonelist() tests
  the NORMAL slot for NULL but before it reads the slot again.

  Offline the block, which rebuilds the list as [NORMAL] and moves the
  terminator into that slot.

  Before: NULL dereference in zone_to_nid(), 3/3 runs.
  After:  the allocation succeeds from ZONE_NORMAL, 3/3 runs.

Patch 4 (tracepoint):

  Online node 1's block as ZONE_MOVABLE, so node 1's local zonelist is
  [MOVABLE, NORMAL], and enable the reclaim_retry_zone tracepoint.

  On another CPU, allocate GFP_KERNEL | __GFP_THISNODE from node 1, with
  its get_page_from_freelist() calls failed so that the slowpath reaches
  should_reclaim_retry(), and stall it in zone_reclaimable_pages() for
  node 1's NORMAL zone.

  Offline the block, which rebuilds the list as [NORMAL] and moves the
  terminator into that slot.

  Before: NULL dereference in the tracepoint, 3/3 runs. With the
          tracepoint disabled, no oops (1 run).
  After:  the allocation succeeds from ZONE_NORMAL, 3/3 runs.

Patch 5 (zonelist slots):

  On one CPU, allocate GFP_KERNEL with a nodemask, and stall it after
  the iterator approves its first zonelist slot but before the
  allocator loads the zone from that slot.

  Online node 1's first memory block as ZONE_MOVABLE, which inserts
  ZONE_MOVABLE at the front of node 1's zonelists.

  This was run for single-page and bulk allocations, and for a
  single-page allocation whose fast path is made to fail so that the
  slowpath's walk races.

  Before: nodemask {1} gets a node 1 ZONE_MOVABLE page and nodemask
          {2} a node 1 ZONE_NORMAL page, 18/18 runs.
  After:  nodemask {1} gets node 1 ZONE_NORMAL and nodemask {2} gets
          node 2 ZONE_NORMAL, 18/18 runs.

  The check adds 5 instructions to an order-0 allocation on x86,
  counted with a hardware counter on a non-debug build.

Patch 6 (hugetlb):

  Reserve hugetlb pages on every node. On CPU 1, fault a hugetlb page
  bound to node 2 with mbind(); the pool walk uses node 0's zonelist,
  where node 2 follows node 1. Stall the walk after it approves
  node 2's slot.

  Online node 1's first memory block as ZONE_MOVABLE, which shifts
  node 1's ZONE_NORMAL into that slot.

  Before: the page comes from node 1, 3/3 runs.
  After:  the page comes from node 2, 3/3 runs.

Patch 7 (alloc_contig):

  Write 1 to node 1's 1G nr_hugepages, and stall the gigantic page's
  zonelist walk after it approves node 1's ZONE_NORMAL slot.

  Online node 1's first memory block as ZONE_MOVABLE, which inserts
  ZONE_MOVABLE into that slot.

  Before: the 1G page is allocated from ZONE_MOVABLE, 3/3 runs.
  After:  the 1G page is allocated from ZONE_NORMAL, 3/3 runs.

  Calling alloc_contig_pages() directly with GFP_KERNEL in the first
  guest, as in patch 5, nodemask {1} gets a ZONE_MOVABLE range and
  nodemask {2} a node 1 range before, 3/3 runs each, and neither after.

Patch 8 (pagesets):

  Online node 1's block as ZONE_MOVABLE, then offline it.

  Stall the offline before the zone empties, and stall the vmstat
  worker on another CPU (kicked through /proc/sys/vm/stat_refresh) in
  decay_pcp_high() for that zone. Let the offline free the pagesets,
  reallocate the freed percpu area with a known value, then release
  the worker.

  Before: decay_pcp_high() runs on the freed pageset, 6/6 runs. In
          1/6 the area was reallocated before the worker resumed, and
          decay_pcp_high() rewrote the new object.
  After:  the pageset is not freed, 3/3 runs.

All eight reproducers also pass on the series tip, 3/3 runs each.

Changes in v3
=============
- Replaced v2 patch 2 (zonelist_zone_valid() recheck) with patch 5,
  which checks zonelist_update_seq whenever an allocation succeeds
  (Vlastimil). A raced attempt's page is discarded, so a stale preferred
  zone can no longer affect the result (Sashiko).
- Moved the NULL dereference fixes ahead of patch 5.
- Added patches 6 and 7 for the hugetlb pool walk and
  alloc_contig_pages(), which have the same slot shift.
- Added patch 4 for the reclaim_retry_zone tracepoint's re-read.
- Fixes: tags on patches 2-6 now name the stop_machine
  removal that made rebuilds run concurrently with zonelist walks.

Link: https://lore.kernel.org/linux-mm/20261014222456.2318284-1-gourry@gourry.net/
Link: https://lore.kernel.org/linux-mm/20261015210539.3243563-1-gourry@gourry.net/
Link: https://lore.kernel.org/linux-mm/20261019172346.3344005-1-gourry@gourry.net/

Gregory Price (Meta) (8):
  mm/page_alloc: detect zonelist rebuilds from memory hot-add
  mm/page_alloc: snapshot the preferred zone against shrink rebuilds
  mm/mmzone: read each zoneref slot once when filtering by nodemask
  mm/page_alloc: pass the zone, not the zoneref, to reclaim_retry_zone
  mm/page_alloc: retry allocations that raced with a zonelist rebuild
  mm/hugetlb: retry the pool walk when the zonelist is rebuilt
  mm/page_alloc: retry alloc_contig_pages() when the zonelist is rebuilt
  mm/page_alloc: keep a zone's pagesets when it goes empty

 include/trace/events/oom.h |   8 +--
 mm/hugetlb.c               |  13 +++--
 mm/mmzone.c                |  11 ++--
 mm/page_alloc.c            | 106 +++++++++++++++++++++++++++++--------
 mm/page_alloc.h            |   3 ++
 5 files changed, 107 insertions(+), 34 deletions(-)

-- 
2.53.0-Meta

