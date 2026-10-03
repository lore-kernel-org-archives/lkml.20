Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC93537E5
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062570; cv=none; b=JWadEFk/qJUbThE2ymX1TEgUcW6mM56n13+w6sawMAXvTI4U7Vpn3rxdIy8erkusq/5URkN3YnvMvwBkLpVc0fc4vdUjJMnRN/S3VziQIRCXaRVpXZ/0Ij4VBAKCmeOy2LqvZALkjLjd4VIjh+ooIgOv8Q5F+s5xZbgdsDgo538=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062570; c=relaxed/simple;
	bh=Ue7ULJ5WY3bFakED6d/ARGtq7/M50CODLVb+2O2f6Yo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=d8pfeRIpjwkDbMj0Pyf5DOCT9roGsGi0cEuOWoCmZd6Mk4FFF1JMXKlzwO61moVuGgLK8xZPnxTJY914MlUmkf3iPblf5ver00hSVLoJthRpN0LUX+GclLPjsqxscBDs5onuOBL2vCU6L+5qpOGVRa7+EKa4bASyVU9z1D//f5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BNOtlAbh; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BNOtlAbh"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6aaff9e86b0so545576a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791062566; x=1791667366; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VE+LxnBIdWSDoOzHpOAVXErosSD4QsTFJ9TX/Oi0RT4=;
        b=BNOtlAbhJ2+axpfljeW4WW0I/PFajuydGN3J6PhZP/nRoP3yaXWX3bC78mW68mjaOw
         Wk5ywH4lbBEOxQj2IttmWMEGa3zBu6/RaakTYYrhIu4mncoNUUTJjtBZpQsrWKXPDjkv
         l73zXTaPCwvrL173dWG/hW3s7weOubf2SbGMs5CPIZkdYhfVxSMFPnJMQ3BbY/gT2sOO
         VWvSd9JO2ROCKGgnTRYhPnYMjKm1mg1PfNhOXBMJneAr5++4Wwavg3CUS9JFVOwAFRvx
         AVyy08MMT5sb4EGuMsjCWmz9G94zFBIzkPgsKrHO0Rb/9/Ak570aTyqrLzm75JnpJh9U
         hpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791062566; x=1791667366;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VE+LxnBIdWSDoOzHpOAVXErosSD4QsTFJ9TX/Oi0RT4=;
        b=BhsACx9krJ9ijCoyWWtp97xTgE0B2PlbEQ0qygHOLm/JUJVt7KkUNLrE1jwH0zcutH
         rmy6AaiCo2uQEunGiU/B87Y2nl0CDXH35c4/n1jQNs+Dr3IzEL09xsE4egNHV7ijoD3r
         Z5zDLLf7Q2Bzk6vXv2Vc6VvzpZw24XiTT7FSeCXWHNj/+KFV7vqY1YqcDU7vcm+Yi6JI
         IWk60dNAH4vUMN5r9wY+zHScCAYbKbLNJ5dUXUw8mu2fZi6dB63TendPr+km88h8kbt2
         OupGMGZgq5i73JN3RmWQ1Itjbc6T7nv2Ve5u97CHrNv+3f2OBalBfeZmqscltcjAAwNB
         adWA==
X-Forwarded-Encrypted: i=1; AKwUvBxZfOJqoWPGiyabjp77x6L2cr5ukRm/l5hH8MQfctXnO2TlFqQvX6xALS2Q36Hx/2q7tCd2ZwbQm365kpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzrvqTbQTzqDNhIxAVrh6gh4HIPc6vo2a9FsCJXzGkApcQAZMD
	9QTgozEETb6WqQhon0m+7TY518JIQ+KjIhJb8Wpa8u74BO1kkUIdfG0kSOxOyUQuF2bck7diUIJ
	Pc56BNQ==
X-Received: from ejbhk10.prod.google.com ([2002:a17:906:c9ca:b0:c2e:6b98:66f3])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3808:b0:6ac:8ef4:177d
 with SMTP id 4fb4d7f45d1cf-6af9e2d34f8mr5494442a12.20.1791062566061; Sat, 03
 Oct 2026 14:22:46 -0700 (PDT)
Date: Sat,  3 Oct 2026 21:22:19 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003212241.3432303-1-lrizzo@google.com>
Subject: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
From: Luigi Rizzo <lrizzo@google.com>
To: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

Here is a subsystem called DMA_PMD on which I would like feedback on
architecture, possible enhancements, or kernel components that could be
reused to avoid duplication.

I think it can be extremely useful for those affected by the HW/SW overhead
of IOMMU (especially IOTLB thrashing, see [1]), or confidential computing,
or preemptable VMs.

The (not too exaggerated) pitch line is

DMA_PMD has the performance of identity, guarantees that only IO buffers
can ever have active IOMMU or IOTLB mappings, removes the bounce buffer
overhead in confidential computing and preemptable VMs, and integrates
smoothly with existing kernel APIs.

=== ARCHITECTURE

DMA_PMD was initially designed to address IOTLB thrashing (details in [1]),
but turned out to also resolve nicely the strict IOMMU overhead, and avoid
the bounce buffer overhead in preemptible VMs and Confidential Computing.

It works by combining several known techniques:

- transparently feed allocators of device memory (skb_page_frag_refill(),
  dma_alloc_attrs(), pagepool, ...) with DMA_PMD pages, i.e. physically
  contiguous PMD_SIZE (2MB) pages mapped via PDE_SIZE IOMMU entries

- heavy recycling of DMA_PMD pages (like pagepool) and lazy IOMMU unmapping
  (like DMA-FQ), BUT:

- like strict IOMMU (DMA), safely release memory back to the kernel only
  after destroying all of its IOMMU mappings and a synchronous IOTLB flush

- on allocation, DMA_PMD pages can be configured to be pinned in the host
  (hence suitable for preemptible VMs) and/or unencrypted (hence suitable
  for Confidential Computing), removing the need for bounce buffers

- there are global and per-device optin /sys/device/.../dma_pmd_*
  and /proc/sys/net/core/tx_enable_dma_pmd

NIC drivers can typically use dma_pmd with no modifications for rings,
tx buffers, rx buffers (if they use pagepool), and rx headers. For tx
headers, almost all drivers need changes (see later patches in the series)
to implement cheap bounce buffers and avoid individual 4K mappings.

The series has the following main components:

- a sparse array (similar to pageblock_flags) to quickly attach metadata
  to a 2MB page without fiddling with the struct page. Cost is 128B per 2MB
  page used as an IO buffer, totally negligible.

- dma_pmd_pool, a replacement for alloc_pages() that can be instantiated
  per-CPU or per receive queue. It handles the split of PMD_SIZE pages
  into order-N blocks, handles dma_map and unmap, and aggressively recycles
  entries. It is used to feed skb_page_frag_refill(), pagepool, and
  receive buffers for drivers that do not use pagepool.
  See [2] for "WHY NOT PAGEPOOL FOR TX AND EVERYTHING"

- dma_pmd_arena, is another allocator backed by DMA_PMD pages and
  is used exclusively as the backend for dma_alloc_attrs().
  Used for longer-lived allocations (descriptor/completion rings,
  rx and tx header buffers)

- glue code to hook DMA_PMD into pagepool [2], skb_page_frag_refill(),
  dma_alloc_attrs(), dma_map/unmap...

- per-driver patches, where necessary (e.g. tx header buffers [3])

=== PERFORMANCE BENEFITS

Your mileage may vary. Enabling the IOMMU may have no throughput
impact, until it does when some system components (bus, IOTLB, CPU)
become overloaded.  Aside from throughput reduction, one interesting
parameter is the effectiveness of the IOTLB. Here is a sample of SMMU
performance counters for a large ARM system with 2x200G NICs doing
bidirectional traffic:

    === DMA-FQ MODE (total throughput ~440Gbps)
    25,757,488      smmuv3_pmcg_*/event=0x80/   IOTLB lookups
    16,634,941      smmuv3_pmcg_*/event=0x81/   IOTLB  misses

    === DMA_PMD on top of strict DMA (total throughput ~745Gbps)
    22,693,218      smmuv3_pmcg_*/event=0x80/   IOTLB lookups
        30,536      smmuv3_pmcg_*/event=0x81/   IOTLB  misses
    (not a mistake, also lookups went down despite the higher rate
    because the tx side can use larger segments)

The 2MB mappings made IOTLB misses almost non existent, because
the working set is reduced by a factor of ~512.
       
Note, the code has more verbose comments than I would like.
Several of them are there to avoid Sashiko getting confused and
flagging false positives.

=== NOTES

[1] IOMMU IMPACT AND IOTLB THRASHING
This is documented in more detail in Documentation/core-api/dma-pmd.rst
but the compact version is below.

There are three main costs involved with using the IOMMU:
- CPU cost for dma map/unmap
- CPU cost and latency for synchronous IOTLB flush (required for strong security)
- IOTLB thrashing, shows up dramatically when the IO access pattern
  exceeds the IOTLB size, and IOMMU page walks slow down bus activity
  up to a point where we see over 30..60% throughput reduction just for
  this reason.  Some relevant references

  https://lore.kernel.org/all/4b42f2eb-dc29-153e-ace9-5584ea2e5070@redhat.com/
  https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10280580/

Specifically, NICs access 4 or more pages per packet (descriptor queue,
completion queue, rx or tx header, one or more buffers), with very little
locality especially for data buffers and tx headers. Each queue has 1-4K
entries, a fast NIC uses 16 or more queues per direction, so just the
data buffers cover 32..128K pages. Using 4KB mappings makes the IOTLB
ineffective, as shown by the performance counters shown earlier.

[2] WHY NOT PAGEPOOL FOR TX AND EVERYTHING
There is some overlap between pagepool and dma_pmd_pool in that both
implement a cache, but pagepool is missing some important features:

- pagepool does not handle splitting 2M pages in smaller chunks, or
  the mappings. That would need to be implemented (and is what dma_pmd_pool does)

- pagepool's provided pages cannot be cleanly managed by
  get_page()/put_page(), which is what all the consumers of
  skb_page_frag_refill(). Fixing that would require dozen of changes
  with high risk of missing some paths.

- even for the receive path, a provider for pagepool has more restrictions
  than alloc_pages-supplied memory, so if I wanted to wrap dma_pmd_pool
  as a provider I would have needed changes to the provider interface.

- pagepool requires a device at allocation time, which is not known when
  skb_page_frag_refill() runs, hence the IOMMU mappings cannot be handled
  at allocation time.

- page_pool_alloc_pages assumes a single NAPI consumer with BH disabled,
  whereas skb_page_frag_refill() runs from a preemptive context.

- and last not least, we need to handle the dma_alloc_attrs() allocations
  which don't match pagepool API

Of course all of the above could be modified, but the complexity
would be similar to that of implementing dma_pmd_pool, and with a
huge risk of breaking existing functionality or missing some path.

[3] DRIVER CHANGES

Most drivers need no change for rings, transmit buffers, or receive buffers
(if they use pagepool). Tx headers are generally mapped on the fly and
that is enough to trigger IOTLB thrashing, so most drivers need a small
change to implement very cheap tx bounce buffers backed by DMA_PMD pages.

We could avoid the bounce buffers using DMA_PMD for the skb->head region,
but that memory is contiguous to skb_shinfo so it would be exposed to
IO device access, which may be undesirable for security.

Luigi Rizzo (22):
  iommu/dma: introduce CONFIG_DMA_PMD and metadata table
  iommu/dma: add DMA_PMD pool lifecycle and page recycle hook
  mm: Add split_page_compound()
  iommu/dma: add DMA_PMD pool block allocation
  iommu/dma: Global cap and shrinker for DMA_PMD pool memory
  iommu/dma: reserve a per-domain IOVA window for DMA_PMD pages
  iommu/dma: release DMA_PMD domain mappings on domain teardown
  iommu/dma: use per-domain IOVA window to map DMA_PMD memory
  iommu/dma: Add DMA_PMD arena allocator
  driver core: Add per-device dma_pmd_* sysfs attributes
  dma-mapping: Use DMA_PMD arena for dma_alloc_attrs()
  net/core: Use per-CPU DMA_PMD pools for skb_page_frag_refill()
  net/core: Use DMA_PMD for page_pool memory
  iommu/dma: Support decrypted and pinned DMA_PMD pages
  iommu/dma: Add background page scrubber for DMA_PMD pools
  iommu/dma: Add per-NUMA-node PMD page reservoir
  net/gve: Use DMA_PMD memory for RX buffers
  net/gve: Use DMA_PMD memory for tx header bounce buffers
  net/mlx5e: Use DMA_PMD memory for tx header bounce buffers
  net/idpf: Use DMA_PMD memory for tx header bounce buffers
  net/bnxt: Use DMA_PMD memory for tx header bounce buffers
  iommu/dma: Add DMA_PMD statistics and debugfs

 Documentation/core-api/dma-pmd.rst            |  320 ++++
 Documentation/core-api/index.rst              |    1 +
 drivers/base/core.c                           |   51 +
 drivers/iommu/Kconfig                         |   33 +
 drivers/iommu/Makefile                        |    3 +
 drivers/iommu/dma-iommu.c                     |   72 +-
 drivers/iommu/dma-iommu.h                     |    8 +
 drivers/iommu/dma-pmd-arena.c                 |  412 +++++
 drivers/iommu/dma-pmd-kunit.c                 |  225 +++
 drivers/iommu/dma-pmd-map.c                   |  531 ++++++
 drivers/iommu/dma-pmd-meta.c                  |  403 +++++
 drivers/iommu/dma-pmd-pool.c                  | 1538 +++++++++++++++++
 drivers/iommu/dma-pmd-priv.h                  |  385 +++++
 drivers/iommu/iommu.c                         |    2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |   45 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.h     |    2 +
 drivers/net/ethernet/google/gve/gve.h         |    5 +
 drivers/net/ethernet/google/gve/gve_main.c    |    5 +
 drivers/net/ethernet/google/gve/gve_rx.c      |   61 +-
 drivers/net/ethernet/google/gve/gve_tx.c      |   38 +-
 drivers/net/ethernet/google/gve/gve_tx_dqo.c  |   45 +-
 .../ethernet/intel/idpf/idpf_singleq_txrx.c   |    6 +-
 drivers/net/ethernet/intel/idpf/idpf_txrx.c   |   21 +-
 drivers/net/ethernet/intel/idpf/idpf_txrx.h   |   27 +-
 drivers/net/ethernet/mellanox/mlx5/core/en.h  |    2 +
 .../net/ethernet/mellanox/mlx5/core/en/txrx.h |    4 +-
 .../net/ethernet/mellanox/mlx5/core/en_main.c |   14 +
 .../net/ethernet/mellanox/mlx5/core/en_tx.c   |   28 +-
 include/linux/device.h                        |    5 +
 include/linux/dma-pmd.h                       |  198 +++
 include/linux/mm.h                            |    2 +
 include/net/libeth/tx.h                       |    5 +-
 include/net/page_pool/types.h                 |    3 +
 include/net/sock.h                            |    3 +
 kernel/dma/direct.c                           |    6 +-
 kernel/dma/mapping.c                          |   39 +-
 mm/Kconfig.debug                              |   11 +
 mm/Makefile                                   |    1 +
 mm/page_alloc.c                               |   89 +
 mm/split_page_compound_kunit.c                |  113 ++
 net/core/page_pool.c                          |   61 +-
 net/core/sock.c                               |   86 +-
 net/core/sysctl_net_core.c                    |    7 +
 43 files changed, 4835 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/core-api/dma-pmd.rst
 create mode 100644 drivers/iommu/dma-pmd-arena.c
 create mode 100644 drivers/iommu/dma-pmd-kunit.c
 create mode 100644 drivers/iommu/dma-pmd-map.c
 create mode 100644 drivers/iommu/dma-pmd-meta.c
 create mode 100644 drivers/iommu/dma-pmd-pool.c
 create mode 100644 drivers/iommu/dma-pmd-priv.h
 create mode 100644 include/linux/dma-pmd.h
 create mode 100644 mm/split_page_compound_kunit.c

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

