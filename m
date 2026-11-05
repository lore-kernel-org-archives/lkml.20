Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864789;
	b=BfQZ/FsbbbF6/aOMvCxqkATead8f3Mi+69inDrWt6euNMR6pxNii8hEwedOuVT8Q6oBf
	 VwiDAs+Bj8qCL7DEV1mkFRCl3OsAjNtLHdkL0bvAStMt84BZY69f/wbyECnaoYx5Ajd46
	 QoyZRZJ+K7dx76j/vujRPnd2zfJU5TsjSsv+NJX9Vii6GSozszi+dux7NBAhyP0RmbJk6
	 +gEXcg1+qKNlcLg9rr75dZtbVksGY1GemFWHl7zB6e6ZY/UYwbIqTuq15b0Pf0yKUFtge
	 skMWwoc3Gwc+5UxCTx0/4zjAF1/Q/yA+nVQKEVyShvTazNRaakaV1rik2Ci4s91Tnpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864789;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=lU5J71U4XgIWMOiPvXfTbGDkT+Od3ly2nNQHaTLpzYM=;
	b=Ttaov88HFwgj5EvOzLixijWKWObUsEQt+5CyfrP4Upm6sXbm/F5LuaTjN30wPxwCL9PJ
	 fTXdzlhZ3DlfYNfVy1hYVVy8BiWY9eKQub6q4HwF5rj4G187L5vefYsj+Pgucks5DoGJb
	 9gsxTG/mU9L64wln7tolnhnPNQaiD9f5ieYC1JSw2taF6STlsucX26sRRoniAkoCAn2xx
	 zN7NSTv2xNjObKO1Amz1bP9JUqnbZXk15hRdlJDKi2faviAf6JOdBewWFxc+sPn6UmR1Z
	 hEdIQ7OOlkb/DLdtziY37sJy0VT5nvwy7jP49fJA6foEX6R2/9f+LVmyoizKp2rPPZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67462606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67462606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261105074625euoutp026d268223a10ac0a87d0a4b3a99f61181~lFoSS8GnR1276612766euoutp02Z
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:46:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261105074625euoutp026d268223a10ac0a87d0a4b3a99f61181~lFoSS8GnR1276612766euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793864785;
	bh=lU5J71U4XgIWMOiPvXfTbGDkT+Od3ly2nNQHaTLpzYM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=muxVFj3nm9m7uVIu1wQnTfdKrp53jFMylxFBgvaxk3xmACoIUeLYYcJ5tapxX0I4v
	 9y1Svt/3wA15g+uMZvfQuMEUaAikosga+rMj1CggEqYXZiSsTSGhOjVZavLsLoBKlN
	 7QxQ/2Y5JMj1T6+tIF3pj+K58ujAwCfiGcbePuPs=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261105074624eucas1p289667b7bbae43845369198bd5ee4635c~lFoSCAsYq2212322123eucas1p2C;
	Thu,  5 Nov 2026 07:46:24 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261105074624eusmtip22b7a36fed5a922a5603e7a85df7483f9~lFoRSxEzR0109901099eusmtip2s;
	Thu,  5 Nov 2026 07:46:24 +0000 (GMT)
Message-ID: <d394bfeb-a578-436b-b8e5-2f704c4f7e4d@samsung.com>
Date: Thu, 5 Nov 2026 08:46:23 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] dma: Remove redundant 0x prefixes
To: Thorsten Blum <blum@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Michael Kelley <mhklinux@outlook.com>, Will Deacon <will@kernel.org>, Petr
	Tesarik <petr.tesarik1@huawei-partners.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261104155414.126812-3-blum@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261105074624eucas1p289667b7bbae43845369198bd5ee4635c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261104155542eucas1p21319566787c295bf97d096bc5f85474a
X-EPHeader: CA
X-CMS-RootMailID: 20261104155542eucas1p21319566787c295bf97d096bc5f85474a
References: <CGME20261104155542eucas1p21319566787c295bf97d096bc5f85474a@eucas1p2.samsung.com>
	<20261104155414.126812-3-blum@kernel.org>

On 04.11.2026 16:54, Thorsten Blum wrote:
> The %pa format specifier already includes the 0x prefix. Remove the
> redundant prefixes to avoid printing 0x0x.
>
> Fixes: 9d4f645a1fd4 ("dma-debug: store a phys_addr_t in struct dma_debug_entry")
> Fixes: 823353b7cf0e ("swiotlb: Enforce page alignment in swiotlb_alloc()")
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied to dma-mapping-for-next. Thanks!


> ---
>  kernel/dma/debug.c   | 4 ++--
>  kernel/dma/swiotlb.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

