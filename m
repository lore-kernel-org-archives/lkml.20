Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008479;
	b=1fLIPaNm26mvK9UHCjK8H0+aM33U+c8c9nnFybD7moslwxQcqSzHsbLnhLeQjxoPbcsz
	 XOOsNPCAJpJrF+oxWqRdx3C0f3mn3B1WTVc//250ktJBGET0q5lXjAMNvXMJV1F0DXXqV
	 OQx5WuGCiHVgVtr8YLBmOcNt1m8IhewsWOj2vYpRUDyQjkoQTHr3HoMiIQkAjyWeaEB+H
	 eP7ZVnlAN2S4ZkG+kLN4Ev3dGa7MWSayCr5zXYj4pzH62ng0cO/guHVOX+JmKZgUBQ3RA
	 aOuxB3y5aVMIkWj4fMC/oQG5uH5a9qA0JPc2i0IAVz82DV28xC3eQcljK0QMtwi+gFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008479;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=Tn3WPWRDtplxSPLBkF+EHw8TVMrWKj86jyrvVJfM21s=;
	b=XG29y5hOzuAd4PjG09BUUUwq6Yalp63XFelVRU99zj3mNSZUsUWIPwAeE2RnVvy/XDCO
	 A//OjP8gPwwZfTagUgdDjJfozMoxs/ZcntDAYtLgiG+YTfwla658Y0OB1JmZWBpHEcfw9
	 C/5Ao6jOadrglSK+2zGFXPWqq5i7PwdCVhhn9fwl8LQJ3Tti1viuKLgwDwOw4AujWHDgr
	 WGssNSvukfIn2wFVPTsrKwWd6co3XuXyIPFPo1LKi26+YozekQg5SS2Uw/9gx21hpEgc8
	 haXUXKaF5aI6RW2xM+wFhNHSal5k1xRtieEEHDMz7cikUtRrFLlBDs3zkFRiy3D0xXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=OT6hWMA0;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BAA60A2602
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BAA60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=OT6hWMA0
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261026095435euoutp02b017cec0e7460e104291645d4540c4a5~iC7VhVro71239212392euoutp02D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:54:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261026095435euoutp02b017cec0e7460e104291645d4540c4a5~iC7VhVro71239212392euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793008475;
	bh=Tn3WPWRDtplxSPLBkF+EHw8TVMrWKj86jyrvVJfM21s=;
	h=From:To:Cc:Subject:Date:References:From;
	b=OT6hWMA0PR+hYodPYaTZm1bOeXXaHVOEKyNP+bqOzxyqP2/l0qsu5h5HbdqUlPVgV
	 Wns79yyo2k09hhOo0s5SVhFxupDD8bxEgAbRVbo5u1CwVpP87eVWJw8eD0wlTDwUGk
	 fxPdGXZ6j2A2VGwMAFEuO7R5f63+ipgNWAeGCThs=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261026095434eucas1p29408e916eda327a5e9c83f64b0df4e66~iC7Uzd3642924429244eucas1p2T;
	Mon, 26 Oct 2026 09:54:34 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026095433eusmtip28961b4577144cb7ec6d636562a432549~iC7USR5f_1096710967eusmtip2O;
	Mon, 26 Oct 2026 09:54:33 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Konrad
	Rzeszutek Wilk <konrad.wilk@oracle.com>, Claire Chang
	<tientzu@chromium.org>, Petr Tesarik <petr.tesarik.ext@huawei.com>, Nicolas
	Saenz Julienne <nsaenz@kernel.org>, Christoph Hellwig <hch@lst.de>, Lucas
	Stach <l.stach@pengutronix.de>
Subject: [PATCH 0/5] dma-mapping: assorted sashiko.dev fixes
Date: Mon, 26 Oct 2026 10:54:11 +0100
Message-ID: <20261026095423.966856-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261026095434eucas1p29408e916eda327a5e9c83f64b0df4e66
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261026095434eucas1p29408e916eda327a5e9c83f64b0df4e66
X-EPHeader: CA
X-CMS-RootMailID: 20261026095434eucas1p29408e916eda327a5e9c83f64b0df4e66
References: <CGME20261026095434eucas1p29408e916eda327a5e9c83f64b0df4e66@eucas1p2.samsung.com>

Hi,

This series collects fixes for the DMA-mapping code, developed while
analyzing issues reported by the sashiko.dev automated review. All
patches were prepared with LLM assistance and then reviewed manually.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Marek Szyprowski (5):
  dma-coherent: serialize reserved memory pool initialization
  dma: swiotlb: Serialize restricted DMA pool initialization
  dma: swiotlb: Remove default pool from the pools list on exit
  dma-pool: release CMA pages on atomic_pool_expand() error path
  dma-direct: zero memory allocated with DMA_ATTR_NO_KERNEL_MAPPING

 kernel/dma/coherent.c | 11 ++++++++++-
 kernel/dma/direct.c   |  3 ++-
 kernel/dma/pool.c     |  3 ++-
 kernel/dma/swiotlb.c  | 15 +++++++++++++--
 4 files changed, 27 insertions(+), 5 deletions(-)

-- 
2.43.0

