Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683974;
	b=yXeur/R5aDiAAwHCjg9NYv7nngf9c0wIPnszoobm6hua0Gf4idcISCkKclpVA3jjtQBm
	 kGe7ZN1YXO3vMoKMFZvFvu0K/2x17YGi/TH94+1spw5ClAQMUnNJ96vnnK9CjWr9Deovg
	 7sR0IyR4pspHSLg5As6RcCtzQWwgKyqVLFYOxPv4wUXbz/yiTQ6axOiSoIYGl3I+cDDT6
	 Rk5OOADomMNt9Y4DAFXAWLz9KQWzSxZkawUqptBeTQkR1G4srI5U+ExHiS/JrBCqugeZ+
	 AbkbZJM0wU0koy7b/SnjkJEilhTfYxiFghDEmHYYdPIEkM7QhzUnWBs8/ZlOYMCtCCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683974;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9pi5Cf8lYlgIxWwwhLkLb/3K15+n+n519JnBtYVcEX0=;
	b=GHNu8Vw2xdMX43UE+hzqXdypTL28voMK8P7r0oUhsYhJUGMUewLa9jM+wMn8DAMkLYMy
	 pspbFtC+u5GiGqLdKYfAbF7U7XlgBw3OKYQ8o56B2sxK6kKcvswKUZ3GH1Zagy6x9plDf
	 Dr2LdPmUg92i9Eyr8OZnzKI8rYLK+FljiAEmbov6yyFUAIRdVvzZzwr598ZRvffIhkfcN
	 4CGT4ac9fxiV+RTHNzpUuCd2FTf9KDSugQgmxI2zHBA2GhwLgI0iH0QMAXw3iZLmFGkMM
	 VhgsLUr6/YqFMg8bSS7QlOkBbHsX0Uwjxrv2iGfMPTkEb/1iJ82hSClTcTKj2gNUv2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=B+kj81o2;
	arc=none smtp.remote-ip=95.215.58.14
Received: from mta1.migadu.com (out-14.mta1.migadu.com [95.215.58.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB55606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EB55606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=B+kj81o2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=K5gk0WLO40R0B55fjMwPkib7g20hUay4hoQc0CNZhRc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792683972; v=1; x=1793288772;
 b=B+kj81o2//KNWFTqLM7RV16zmXrceknJUmtuPZVTnsrtWyQReLBYpG/GusMbUT+fAAflh0PC
 f7yJhqwDa8KGBcbm74Hksm0nGr8fPCMHpVed/oPxjimJT390tdN3gtjm0Q++gxh2u5wWCYRJrZE
 XFP27JgSwu4H+PG0vnJgJjMQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 131368cd1c1280cc;
	Thu, 22 Oct 2026 15:46:12 +0000
X-Mizu-Trace-ID: 131368cd1c1280cc
X-Migadu-Flow: FLOW_OUT
From: Andrew Jones <andrew.jones@linux.dev>
To: linux-riscv@lists.infradead.org,
	iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	tomasz.jeznach@linux.dev,
	jgg@ziepe.ca,
	jgg@nvidia.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	tglx@kernel.org,
	kevin.tian@intel.com,
	fangyu.yu@linux.alibaba.com,
	nutty.liu@hotmail.com
Subject: [PATCH v7 0/5] iommu/riscv: Enable MSI remapping and IOMMU_DMA
Date: Thu, 22 Oct 2026 17:45:58 +0200
Message-ID: <20261022154603.1374754-1-andrew.jones@linux.dev>
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

This series adds MSI remapping for IMSIC so a device's MSI target gets
translated the same way its DMA does, allowing RISC-V to enable IOMMU_DMA
and paging domains by default.

The IMSIC MSI target address changes with interrupt affinity, so every
possible target must be mapped before an affinity change can select it
in atomic context. The IMSIC driver prepares an ordered list of targets
with iommu_dma_prepare_msi_list() when allocating an IRQ. DMA-IOMMU maps
the list into one contiguous IOVA range and caches the base in the domain.
The MSI descriptor carries the base IOVA and mapping granule, allowing
IMSIC to compose the target address without allocating memory or looking
up IOMMU state during affinity changes.

Ordered-list mappings have their own cache, separate from the existing
single-page MSI cache. IOVA allocation, mapping and rollback are shared
between the two paths.

VFIO and iommufd support from v6[1] is deferred. This series does not
enable VFIO_IOMMU_TYPE1 or introduce an IOMMU_RESV_SW_MSI reservation.
I'll look into Nicolin's MSI-window configuration patches[2] in a
follow-on series and see if I can avoid introducing IOMMU_RESV_SW_MSI
entirely. Without that reservation, the legacy Type1 backend cannot
provide the MSI mappings it needs, so I'll try to support existing Type1
userspace through iommufd's compatibility interface. That path will need
automatic MSI IOVA allocation, since existing Type1 userspace won't issue
Nicolin's new ioctls.

LLM-based coding assistants were used during development for code
exploration, patch review, test execution, and drafting and editing
commit messages and this cover letter. I reviewed and finalized all
resulting code and text. Per-patch Assisted-by tags are omitted in
light of ongoing discussions about simplifying coding-assistant
attribution.

Thanks,
drew

[1] https://lore.kernel.org/all/20260925151659.419512-1-andrew.jones@oss.qualcomm.com/
[2] https://lore.kernel.org/linux-iommu/cover.1760487869.git.nicolinc@nvidia.com/

v7:
- Rebased on linux-iommu/next at 20bfd2575765
- Added deferred-attach handling to the list API
- Simplified ordered-list mapping to a cached base IOVA per domain,
  separate from the existing per-page cache [Robin]
- Shared IOVA allocation, mapping and rollback between the list and
  single-page paths [Jason]
- Dropped the fixed MSI window in response to Jason's ABI concerns and
  deferred supporting VFIO Type1


Andrew Jones (4):
  iommu/dma: Prepare MSI physical address lists
  iommu/dma: Introduce iommu_dma_prepare_msi_list()
  irqchip/riscv-imsic: Add MSI address list
  irqchip/riscv-imsic: Support IOMMU MSI address lists

Tomasz Jeznach (1):
  iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V

 drivers/iommu/Kconfig                      |  2 +-
 drivers/iommu/dma-iommu.c                  | 77 ++++++++++++++++++++--
 drivers/iommu/dma-iommu.h                  | 10 +++
 drivers/iommu/iommu.c                      | 43 ++++++++++++
 drivers/irqchip/Kconfig                    |  1 +
 drivers/irqchip/irq-riscv-imsic-platform.c | 24 ++++++-
 drivers/irqchip/irq-riscv-imsic-state.c    | 32 +++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  3 +
 include/linux/iommu.h                      |  9 +++
 9 files changed, 190 insertions(+), 11 deletions(-)

-- 
2.56.0

