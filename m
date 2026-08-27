Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E5541DED5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826710; cv=none; b=pd3Dh73SU+lfg7IIXjSkg4C6hF/M66geGQ/ZS7QdPPL7VzqnUr+R9rODCxROUqdAxMZi67pF3mM/bY/DAZn9Bb5yMK0OIl1zcdWRO0MoiIdE8XGykBsWHGhS7EqNsr6mwoR5RTe24DhustGBzA7nFoRGLEo3s5+1HCJyQXOLxPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826710; c=relaxed/simple;
	bh=vRUinhL8Kl69hQDB7Kmeani1hMmmG3jjlapkgspJ2Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=KN5cDYIq6bw7AiqiMe7VYOo4IdRxk0KnbxYonINEuN58Vw3L0ZrQ1qwhGiGAuKYJpZP7NiTIgrsGDWANh18gx9DQ7weqEGaFZd41qENXzWEMcQqm3Wru0W3+xqadC/XGMBj4IrzefAzgyjeX7F7KoDYpWFub6s6qKKw/PHJYBek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CUswHnJo; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CUswHnJo"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260827103141euoutp013e595bbc37514c176f2923fd440bac8f~PoumpjhqD0754107541euoutp01x
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:31:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260827103141euoutp013e595bbc37514c176f2923fd440bac8f~PoumpjhqD0754107541euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787826701;
	bh=1tP05teUxVPqrtuviHpqptvcSsGiCr6FinH/7ktOWxo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=CUswHnJoH4Sbeo8XiNLebbc8rV2zuB6Qhf/yLmX8DQQ7ndTaITf5Tk1J6UzSPyGu1
	 ZtqBPBsfkn4b4xxJh9pR1Ei2rycmIvv1Mzjzt+X+Hz0lHiUYNUHHaYJ6O5I5KiyPOc
	 Ujd5tetLQEoUYKG2rvxeIOjpDmZz9gEYgHDM0OWA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260827103141eucas1p1a97fc08693ac663d8e8382e2ffb7f800~PoumMXccw2646726467eucas1p1S;
	Thu, 27 Aug 2026 10:31:41 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260827103140eusmtip157997614241f2b88e841c3c47ce8d6bb~Poul3U-fU0968509685eusmtip1y;
	Thu, 27 Aug 2026 10:31:40 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Marek Szyprowski
	<m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Alexander
	Graf <graf@amazon.com>
Subject: [GIT PULL] dma-mapping fix for Linux 7.3
Date: Thu, 27 Aug 2026 12:31:26 +0200
Message-ID: <20260827103127.4074178-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260827103141eucas1p1a97fc08693ac663d8e8382e2ffb7f800
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260827103141eucas1p1a97fc08693ac663d8e8382e2ffb7f800
X-EPHeader: CA
X-CMS-RootMailID: 20260827103141eucas1p1a97fc08693ac663d8e8382e2ffb7f800
References: <CGME20260827103141eucas1p1a97fc08693ac663d8e8382e2ffb7f800@eucas1p1.samsung.com>

The following changes since commit 121f9fd1c3083312055126205f3e40b8ee999fe6:

  dma/swiotlb: decouple high watermark tracking from CONFIG_DEBUG_FS (2026-08-13 08:02:35 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git tags/dma-mapping-7.3-2026-08-27

for you to fetch changes up to 1476cca098f6d3a553fcec6fe9b7d86e15c00b59:

  dma-contiguous: fix truncation of numa_cma / cma_pernuma sizes >= 2G (2026-08-24 15:40:07 +0200)

----------------------------------------------------------------
dma-mapping fix for Linux 7.3

- integer overflow fix for kernel cmdline parser for DMA contiguous
initialization code (Alexander Graf)

----------------------------------------------------------------
Alexander Graf (1):
      dma-contiguous: fix truncation of numa_cma / cma_pernuma sizes >= 2G

 kernel/dma/contiguous.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

----------------------------------------------------------------

Thanks!

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland

