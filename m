Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E7F1FD4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750222; cv=none; b=dV69X/O1LLPkzW8dyJZO0qbxk4EKYKoP1GPoUPSzbjKtkqJ67VQeR+DPDP87aKhd/h3e/dFFD8iGr6XLW6se1zap5P6J2nM2tR5e+5OH8nPft7dy7YGXtwJNUsX+pzvycf58k/oSkow0cqHuJgjVmAMibxLifxN+fZMiRKWAwVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750222; c=relaxed/simple;
	bh=hRIVCZE8qImBSvhxbNmGBSwsIyjqLEqqHnsfDXPZM5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=e54qakRRflxf3x8q1VKxixiNWWZ3K+62/zFihwCZYVDdnlcRG9DCwKgr2orgw7TCsBpWHjX63qPDnD1QtY2PrCpLejC570PcFb51Mr02xXLTlAbkKVjQsK23WGAm3RpCaIMwiMs02ra6hXzCHcg40v7aVKAJFLpKEsimoIbZ/Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lMThwP9R; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lMThwP9R"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260826131658euoutp02bc1b7cd080081e213d979cee935142a2~PXVosKA5T0617106171euoutp022
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:16:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260826131658euoutp02bc1b7cd080081e213d979cee935142a2~PXVosKA5T0617106171euoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787750218;
	bh=2os+3o1og40BuZeY7uz7w59SkoMRJpdj9rEqqL0mwf4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=lMThwP9R6FDjrPC9nptqevGjE2Dk8A8g9XBmDDi4sFmLTPcU2Kz85blhBUnrvB9pF
	 UqwwPKNVpcTPrRj4zh1PD3Am0iwUzRRsRK6C7CYwsqE0QegWyo1CB00xMW4hm+rp8/
	 zAKk4P6ptBjlodT/twiSqNJuYSM4x0wVIm1Yi0U0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260826131658eucas1p1c7eab0531ab7be76a4c3b5f064a06735~PXVobgG1H0932509325eucas1p11;
	Wed, 26 Aug 2026 13:16:58 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260826131658eusmtip2ca2a6111ac9f506e7298106e30ce75f0~PXVoDFpiI0853008530eusmtip2B;
	Wed, 26 Aug 2026 13:16:58 +0000 (GMT)
Message-ID: <d6be30c5-6342-478c-b2b7-b3cfe90e7014@samsung.com>
Date: Wed, 26 Aug 2026 15:16:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 3/5] of: reserved_mem: reject statically placed
 regions overlapping existing reservations
To: Wandun Chen <chenwandun1@gmail.com>, robh@kernel.org,
	saravanak@kernel.org, rppt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260818092420.2859026-4-chenwandun1@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260826131658eucas1p1c7eab0531ab7be76a4c3b5f064a06735
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260818092446eucas1p2240860352520f8ae98e86fdd70e9fd83
X-EPHeader: CA
X-CMS-RootMailID: 20260818092446eucas1p2240860352520f8ae98e86fdd70e9fd83
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
	<CGME20260818092446eucas1p2240860352520f8ae98e86fdd70e9fd83@eucas1p2.samsung.com>
	<20260818092420.2859026-4-chenwandun1@gmail.com>

On 18.08.2026 11:24, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
>
> memblock_reserve() permits overlapping reservations, so a statically
> placed region whose 'reg' overlaps an existing one is accepted. When
> initialization of a statically placed reserved-memory region
> overlapping an existing reservation fails, memblock_phys_free()
> returns the overlap to the buddy allocator, corrupting that memory.
>
> Reject the overlap up front. Dynamically allocated regions are
> unaffected, as they are allocated from free memory and so cannot
> overlap an existing reservation.
>
> Sashiko found this issue in [1].
>
> Fixes: d0b8ed47e83a ("of: reserved_mem: fix reserve memory leak")
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link: https://protect2.fireeye.com/v1/url?k=d2f37e74-b38e94f7-d2f2f53b-74fe48600158-b5e65a51ea74eb99&q=1&e=2078d834-d5d6-4867-9088-f9d3bd0e1d17&u=https%3A%2F%2Fsashiko.dev%2F%23%2Fmessage%2F20260806100605.2C2C01F000E9%2540smtp.kernel.org [1]
> ---
>  drivers/of/of_reserved_mem.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 9fb2e4c29443..767ef702392e 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -158,6 +158,11 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
>  
>  		return memblock_mark_nomap(base, size);
>  	}
> +
> +	if (memblock_is_region_reserved(base, size) ||
> +	    memblock_overlaps_nomap(base, size))
> +		return -EBUSY;
> +
>  	return memblock_reserve(base, size);
>  }
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

