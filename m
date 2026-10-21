Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574917;
	b=NJBsazbp+25aCSjzz0cTdzlh1FTSJSpY7UkXO1Dv7qN0oCvHr329j05JjYR6F8pY6TeP
	 zwWMUkbhYX3/WSXXKFqs42OVNEVf6PlQV1j8xQeigD9LL0JMofEjsoobZQxS04O2D49zu
	 m/ErslZSnfe9J3ZojLvGS2nqPnP9K8PxQQSvdNfGFwf9aDVYqGdULTRWpvJwKIlS5sDe4
	 LgIhcF5w0kF77wVb0I4lhK+Q5+dHqI6eV1Ce8CKZsHbn2jIc4sOYvh/5Fm/869OWEkb1V
	 oaWZP6Egi0IYVAUlKjmBnK2mW/my3kfQhSBIn2Q47YTq2wu4QC12EjSxlPePfyt5B6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574917;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=Cg6EqZtqP98/9Z7wtmnm+wkEmJNwp6tKXCKPiybtwoA=;
	b=nqGPW48jZJRnAmG11chaoKkk+7cg+PuC2EDUY6/ofIlxlkJG4VUDVLZWY0brxdd01Mt6
	 8zWkS7Lskrojr+JHRR3KhiDPb/1K3xnLBJYbsjlys7lqKQFbaKzc/1y6jsz4RNG9wQJT7
	 +e0mcZgSjcr6o6YoQjSFpsyrxsIoJbQEu7uKLSHEXjwmglzqnsid/4+vYzrmkcu0yNrFr
	 MDXnwWqw9QdSNL0vFpyeR5ExemFyXk4NQIRm7Dr9K/oEHT93PxNDmc98QFe2vDhGCk8iy
	 K1Khs9VP86XrD4wpV8mJ83YB3HdthtTCeC/CZFIS7mW8cThbevxjKpoTnrZe4R1OZqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dtrurpMG;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1208606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1208606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dtrurpMG
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261021092828euoutp02565b5a9f530cbc45398ea09759c51000~ggWG5y0ta0371603716euoutp020
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:28:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261021092828euoutp02565b5a9f530cbc45398ea09759c51000~ggWG5y0ta0371603716euoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792574908;
	bh=Cg6EqZtqP98/9Z7wtmnm+wkEmJNwp6tKXCKPiybtwoA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=dtrurpMG3tUW6hceKrsHChi9/xiHHXs95JtCTnPDNPjpVcd3aBbO2ez0n6cimJ24W
	 ZUBC2sRY7P/WaZ/oi8ehwMk6swMseJYvMzhMFQiDSWWRiVLhmYdLAcduMJNyccCqmZ
	 yerRu1EXzu6/gtUBsZPSig4OqA8xwxo2uYjqyDCs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261021092826eucas1p167036f47ed4ccf542f3f7b33d253277c~ggWFXHzWl0180301803eucas1p1V;
	Wed, 21 Oct 2026 09:28:26 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261021092826eusmtip15bad0e29e446461c6685d2dca2531770~ggWE1VmFv2716227162eusmtip1G;
	Wed, 21 Oct 2026 09:28:26 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Marek Szyprowski
	<m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, John Garry
	<john.garry@linux.dev>, Qingfang Deng <qingfang.deng@linux.dev>, Francesco
	Valla <francesco@valla.it>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Sasha Levin <sashal@kernel.org>, Leon Romanovsky <leon@kernel.org>
Subject: [GIT PULL] dma-mapping updates for Linux 7.4
Date: Wed, 21 Oct 2026 11:28:00 +0200
Message-ID: <20261021092802.3294826-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
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
X-CMS-MailID: 20261021092826eucas1p167036f47ed4ccf542f3f7b33d253277c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261021092826eucas1p167036f47ed4ccf542f3f7b33d253277c
X-EPHeader: CA
X-CMS-RootMailID: 20261021092826eucas1p167036f47ed4ccf542f3f7b33d253277c
References: <CGME20261021092826eucas1p167036f47ed4ccf542f3f7b33d253277c@eucas1p1.samsung.com>

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git tags/dma-mapping-7.4-2026-10-21

for you to fetch changes up to 4733f2966433b7f926f70c9dc461c33cd5c10835:

  dma-debug: Skip cacheline tracking for MMIO mappings (2026-10-14 15:07:22 +0200)

----------------------------------------------------------------
dma-mapping updates for Linux 7.4:

- several SWIOTLB initialization cleanups (Aneesh Kumar K.V, Francesco
Valla)

- exact page allocation for DMA pages (Qingfang Deng)

- tools/dma build fixes (Sasha Levin)

- minor fixes for various corner cases (Marek Szyprowski, Leon
Romanovsky) and code cleanup (John Garry)

----------------------------------------------------------------
Aneesh Kumar K.V (Arm) (3):
      dma: swiotlb: Rename swiotlb_size_or_default()
      dma: swiotlb: Consolidate slab rounding
      dma: swiotlb: Track whether the pool size was explicitly set

Francesco Valla (1):
      dma: swiotlb: use KiB in restricted pool allocation log

John Garry (1):
      dma-mapping: rename dma_opt_mapping_size()

Leon Romanovsky (1):
      dma-debug: Skip cacheline tracking for MMIO mappings

Marek Szyprowski (2):
      MAINTAINERS: Add files to the DMA MAPPING HELPERS entry
      dma-direct: Restore arch_dma_alloc() for the DMA_ATTR_NO_KERNEL_MAPPING case

Qingfang Deng (1):
      dma-mapping: use exact allocation for DMA pages

Sasha Levin (2):
      tools/dma: fix building with O=
      tools/dma: fix building from the top level with O=

 Documentation/core-api/dma-api.rst   |  2 +-
 MAINTAINERS                          |  1 +
 arch/arm/xen/mm.c                    |  2 +-
 arch/arm64/mm/init.c                 |  2 +-
 arch/riscv/mm/init.c                 |  2 +-
 arch/x86/include/asm/crash_reserve.h |  4 +--
 drivers/iommu/dma-iommu.c            | 12 ++++----
 drivers/nvme/host/pci.c              |  2 +-
 drivers/scsi/scsi_transport_sas.c    | 12 ++++----
 include/linux/dma-map-ops.h          |  4 +--
 include/linux/dma-mapping.h          |  4 +--
 include/linux/gfp.h                  |  2 +-
 include/linux/iommu-dma.h            |  2 +-
 include/linux/swiotlb.h              |  2 +-
 kernel/dma/contiguous.c              |  6 ++--
 kernel/dma/debug.c                   |  7 +++--
 kernel/dma/direct.c                  | 30 +++++++++++++++-----
 kernel/dma/mapping.c                 | 10 +++----
 kernel/dma/ops_helpers.c             | 11 +++++---
 kernel/dma/swiotlb.c                 | 54 +++++++++++++++++-------------------
 mm/page_alloc.c                      |  2 +-
 tools/dma/Makefile                   | 10 +++++--
 22 files changed, 106 insertions(+), 77 deletions(-)

----------------------------------------------------------------

Thanks!

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


