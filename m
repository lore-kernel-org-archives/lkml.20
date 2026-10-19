Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430631;
	b=Xm6Nm10tBZfCIcqftqzF2if8eUhti/LsFV8+xX1qszTZ4Ueh16JMweL6aHHNjJg5bOhf
	 E7ZUb301SHX8Ks+6OPkIzZlZyUI00sYaQgZpsXN9tTH1jxzQo/3K3VDNPRevn6tDWx154
	 Vl9xB/saL69imNjojhtDsj6v1Bal/eYt/X7EU1Mdi2hxybkVgaSOjus29/tW62kFlgkzN
	 tQdvEbYaZCi5XqO6iLHpkxCGGDqIZxgXhL6P40kLDjIPDzoVDNlQVHb75fsC2spx9DYAG
	 gn1M53zo7SnfSEGjPcwbkC6SAOJt8qR0vPCda8R8e58647kevi6EB3ol9sssDFKpQkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FM3inNO3NvMJdWVpEEkpanyELpfwLSr0b1DWGRNHevw=;
	b=py3WWYKEEcVmA/tjiJAmDR+xNn98CpvyJkQg9WAe+TzeUrVJfObx9ltnkuiEG3OIBYZn
	 cSLeHremRkFvFRWQhf5dyeYUiSiiEEzzQUSShDMlQdgIN0+fquGEr/PgCORJ6rryiJpn9
	 DaFhHaACBZd51nVebR4P1DFcVkihThjdhzffTAVW7rlQJHyRQiICjXa+tTjlaZb9zqd2J
	 KJQ27bTQsZuf3+ID/k7QgftxZasLPnW0qS8kvryuhvAyKF5O9q5ISyoHLV7RWSWy1AzAN
	 Ym79e8f3U71/rZ94L35hr4yDMBRFrTraVLHUdrguP4osTm7Q4Wcu1O7mNJrqaxLBC+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ahAQyfEO;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FC4606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0FC4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ahAQyfEO
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91986c5cb75so25349906d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792430630; x=1793035430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FM3inNO3NvMJdWVpEEkpanyELpfwLSr0b1DWGRNHevw=;
        b=ahAQyfEOKvl3eyqmc66IDG2DLi5ZHG1v1uqXkz7ntJ65LJkdOtMQ+zz+oAgHvTpNhE
         Ry6AQVpWwYsxVGuO2/cbTuCmvtgWoz1uGD0NUBOj+j9TTAG1wmOrt0+RwLpSsnRGrxCR
         hyqdmXnmGFaOpO57ZGxqiJEZZjK+NG/jEDVOlSQf/OKNNSmkQe8vI86tSII4edHGv4XR
         fyhCYqwnWQiblDMfNDAq9g91T0hvlVVTG5W8QMKoNXcWjluU7/1eDFUFwaPiYHUzoC4W
         V0mvZQrbHHtMW/9jG6lh6LoSXBCWgZ6voo+Eaqb6P57F+Uh1jnQOfHhgTr+0ucIrVDih
         Mpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430630; x=1793035430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FM3inNO3NvMJdWVpEEkpanyELpfwLSr0b1DWGRNHevw=;
        b=Fu7FXLy3x4LTW7k4jRU/eaexqUwiqOf4wQSDTM6gr25E1jlF8QsvSUFKE0LXgnirbi
         mVaxasCT8RevESQHYYNwZ8YgCP7G1k5hdx6ypmsX3242cP660VILDaLbQ0+3oIwaThFA
         eqOc3O0Gw8KA6ZXOgaCUiqkEB3VsmFIJgFt6Gxo9Iblbj8upcRMYhsSsu7yXdbC1iTUC
         23jx30Vou7kp3eT/LcZ54KJC0iZBszdZOyigKIWFDKc/uKRCSLinO8XRgW0Oe3dwmW7W
         +vZ3VpOo+4gtbKxzTx5ZizgyvrGBxhNxC1J+MXmA0Te7TVWoRGk21t1wVcd/xxQoKMbb
         dZow==
X-Gm-Message-State: AFq9FYLzsY6FGhq8wEQyW/YkzDQsp0voESH8S7IW9K9+qHjREVhB0LAv
	irQyZBHZB8rO38SEAAAvER2zscEK8YfxkSkROzpma7P0X2QZEaYcx3uRJ971uoT02Zo=
X-Gm-Gg: AYBFou0Rqs079P7Dus+CDYt31IFpsBBXJWGs2JykcTTLWWIm3bAUP8f+1mE6PAjh8KQ
	Ty2cjeTHLRk2JAo4s+utyakPiukbSUHO406+csqE7add9etjLqOBHhgrROAOGVGmCubxfgCut7d
	KIbE56ZhJpyzZFQgXAdYGz0/zlC5WADQv+8qdBkcd0r/kRlW6A147hqVmUtGjVIfnIB4T/ZAz8B
	m/cFmt1r9DnVUSfW5sVKdNdeIoPn8tymLryI7wYilbl6BmKWUJsKR3zTsESoE8j0ImNfISWFnG9
	i7qpeoaMenBgAhrpFtS6gpAbSvA1RqW+qqN3JPck/3IA6yvketRpM6deYVhx/A2F9GnUkjmqA1g
	gGPgrSiKewpJgerAopEkbKhzEXE1Id4XAIIRa5h+AxWzb+qvi6VqDycM3tSxzO4VZCvj4v8PZ9z
	GgxuetKfP8rRm7DwWUMGYpXEwh2HJJbXGtDh/zLQ05LZXTPWvMT4+stdu9j26j+nlkrPseuk9B5
	Y3DZh9djJ8iNowYrEaZbpGOzOFxV/GPDsgTZEz+03T2CwouDl5yZTgxw3rd
X-Received: by 2002:a05:620a:43a8:b0:93f:1dbf:6ceb with SMTP id af79cd13be357-93f29b74543mr1329416185a.3.1792430629865;
        Mon, 19 Oct 2026 10:23:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4adb28c2sm14615385a.0.2026.10.19.10.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:23:49 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	mgorman@techsingularity.net,
	jiang.liu@huawei.com,
	Bessel.Wang@huawei.com
Subject: [PATCH v2 0/5] mm: fix allocator races with memory hotplug
Date: Mon, 19 Oct 2026 13:23:40 -0400
Message-ID: <20261019172346.3344005-1-gourry@gourry.net>
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

Five fixes for allocator paths that can act on state another CPU is
updating: zonelists rebuilt by memory hotplug, and the pagesets of a
zone that offlining empties.

I've packaged these together because they're all related to hotplug
in some way, but they may end up backporting differently.

Patch 1: the zonelist_update_seq retry is compiled out without
CONFIG_MEMORY_HOTREMOVE, but memory hot-add rewrites zonelists in place
too. A __GFP_THISNODE allocation that sees the list mid-rewrite fails
even though the node has free memory.

Patch 2: onlining a zone shifts zonelist slots under an in-flight walk,
so the allocator can use a zone its filters rejected: a GFP_KERNEL page
from ZONE_MOVABLE, which later makes offlining that block fail, or a
page from outside the nodemask. Without CONFIG_MEMORY_HOTREMOVE, it
relies on patch 1 to retry a walk that skips a zone and runs off the end
of the list.

Patch 3: offlining a zone's last block can move the zonelist's NULL
terminator onto an allocation's preferred slot, which the allocator then
dereferences in zone_statistics().

Patch 4: zone_pcp_reset() frees an emptied zone's pagesets while the
vmstat worker can still use them. The pagesets are now kept for the life
of the zone, which costs 320 bytes per possible CPU for each zone that
was onlined and then emptied.

Patch 5: __next_zones_zonelist() tests a slot's zone for NULL, then
reads the slot again to look up its node. If offlining turns the slot
into the terminator in between, zone_to_nid() dereferences NULL.
Current GCC and clang merge the two reads, but nothing requires it.

Reproducers
===========

All five races were reproduced on unmodified source in a QEMU guest
with three NUMA nodes:
   node 0: 3G, CPUs 0-1
   node 1: 1G ZONE_NORMAL, CPU 2
   node 2: 1G ZONE_NORMAL, CPU 3

And a 512M pc-dimm cold-plugged on node 1, left offline at boot
(CONFIG_ACPI_HOTPLUG_MEMORY=y).

Patch 1 needs CONFIG_MEMORY_HOTREMOVE=n to show the failure
Patch 5 needs mm/mmzone.o built with -fno-inline -fno-ipa-sra,
        without which the two reads are merged.

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

Patch 2 (zonelist slots):

  On one CPU, allocate GFP_KERNEL with a nodemask, and stall it after
  the iterator approves its first zonelist slot but before the
  allocator loads the zone from that slot.

  Online node 1's first memory block as ZONE_MOVABLE, which inserts
  ZONE_MOVABLE at the front of node 1's zonelists.

  Before: nodemask {1} gets a node 1 ZONE_MOVABLE page and nodemask
          {2} a node 1 ZONE_NORMAL page, for single-page and bulk
          allocations, 3/3 runs each.
  After:  nodemask {1} gets node 1 ZONE_NORMAL and nodemask {2} gets
          node 2 ZONE_NORMAL, 3/3 runs each.

Patch 3 (preferred zone):

  Online node 1's block as ZONE_MOVABLE, so node 1's local zonelist is
  [MOVABLE, NORMAL].

  On another CPU, allocate GFP_KERNEL | __GFP_THISNODE from node 1,
  whose preferred slot is NORMAL, and stall it after it loads the zone.

  Offline the block, which rebuilds the list as [NORMAL] and moves the
  terminator into the preferred slot.

  Before: NULL dereference in get_page_from_freelist(), 3/3 runs.
  After:  the allocation succeeds from ZONE_NORMAL, 3/3 runs.

Patch 4 (pagesets):

  Online node 1's block as ZONE_MOVABLE, then offline it.

  Stall the offline before the zone empties, and stall the vmstat
  worker on another CPU (kicked through /proc/sys/vm/stat_refresh) in
  decay_pcp_high() for that zone. Let the offline free the pagesets,
  reallocate the freed percpu area with a known value, then release
  the worker.

  Before: decay_pcp_high() runs on the freed pageset, 3/3 runs. In
          1/3 the area was reallocated before the worker resumed, and
          decay_pcp_high() rewrote the new object.
  After:  the pageset is not freed, 3/3 runs.

  Repeated offline/online of the block, and ejecting and re-adding the
  only DIMM of a CPU-less node over QMP, reuse the same pagesets.

Patch 5 (slot reread):

  Online node 1's block as ZONE_MOVABLE, so node 1's local zonelist is
  [MOVABLE, NORMAL].

  On another CPU, allocate GFP_KERNEL | __GFP_THISNODE from node 1
  with nodemask {1}, and stall it after __next_zones_zonelist() tests
  the NORMAL slot for NULL but before it reads the slot again.

  Offline the block, which rebuilds the list as [NORMAL] and moves the
  terminator into that slot.

  Before: NULL dereference in zone_to_nid(), 4/4 runs.
  After:  no oops, 3/3 runs.

All five reproducers also pass on the series tip, 3/3 runs each.

Changes in v2
=============
- Added patches 2-5.
- Pulled cpuset patch out by itself

Link: https://lore.kernel.org/linux-mm/20261014222456.2318284-1-gourry@gourry.net/
Link: https://lore.kernel.org/linux-mm/20261015210539.3243563-1-gourry@gourry.net/

Gregory Price (Meta) (5):
  mm/page_alloc: detect zonelist rebuilds from memory hot-add
  mm/page_alloc: validate zonelist slots against concurrent rebuilds
  mm/page_alloc: snapshot the preferred zone against shrink rebuilds
  mm/page_alloc: keep a zone's pagesets when it goes empty
  mm/mmzone: read each zoneref slot once when filtering by nodemask

 mm/mmzone.c     | 11 +++----
 mm/page_alloc.c | 77 +++++++++++++++++++++++++++++++++++++------------
 2 files changed, 65 insertions(+), 23 deletions(-)

-- 
2.53.0-Meta

