Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685C841BA7A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452595; cv=none; b=tgLECJhdS7D1+SMSQkJPYp/NOjzXU//cOBUkwf6o9zQ6F1B6FtM7HpUYuKSoLT1c44cGAGRbePw0GHwPpg5xIjpQwzJnWOFon4hZcdUsdY59g0UrX+il6IZ9jwZID9HqvGEw9JVnx0iFyQjMJJLef/qNwL8XIV1qdJCU7rBdY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452595; c=relaxed/simple;
	bh=OLQLPaWJw7XppWYwcxYfmvI/mXWhlgZYI5H6dgeasww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=l051OyhVechX9gRO+4qg0W1SgO7SGB/bC5DUGDxlno4GUlZvmyRb5FZAv/HGsQojH+S/xmdzrLGHfdc1cztr/8sZnPURqCXoBLn3m5DWc9jFrOzrZazVE/XRoZhrTa0UEXEH298pJQJFjYDuVtHco02/D1/CALhMUv29fS9wIq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PbgH3VY5; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PbgH3VY5"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261008094311euoutp02ad128691f22de11244a978ebcd223ba9~chKPwSkSm2643026430euoutp02v
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:43:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261008094311euoutp02ad128691f22de11244a978ebcd223ba9~chKPwSkSm2643026430euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791452591;
	bh=nJNnHPGG4mNQooWPuJ2KoNzlsArMHoPuRSotZ7wNxxI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=PbgH3VY5H2lL1x3cW1EYzRMsvXBfnGZD66HPLDIegw38L8M/Ylhmpg0gnsFxXzm12
	 rXoJE1UUssw/hNOLBLOVEna1pFXZnwlpFoCFFYrzfy+1UpkiLGMWksbKaG4In8YiGQ
	 fs97ketcN/775lV7DxP2TVq9KZ/k2Xat6DOpVv+Q=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261008094311eucas1p1d640b4ffd81730e0ee429aef7e8412b4~chKPgpifp2015020150eucas1p1J;
	Thu,  8 Oct 2026 09:43:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261008094310eusmtip1d8898c71d330dd4bbb9e00e90ce133cc~chKOulU4o1455814558eusmtip1R;
	Thu,  8 Oct 2026 09:43:10 +0000 (GMT)
Message-ID: <1813f0d0-1e0d-4cec-8132-cf1f8731a8e6@samsung.com>
Date: Thu, 8 Oct 2026 11:43:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 0/5] of: reserved_mem: several fixes about reserved
 memory
To: Mike Rapoport <rppt@kernel.org>
Cc: Wandun <chenwandun1@gmail.com>, robh@kernel.org, saravanak@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, akpm@linux-foundation.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <asc6brs_g0ky0wOM@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261008094311eucas1p1d640b4ffd81730e0ee429aef7e8412b4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261003080438eucas1p2bdb68c248ecad088559285a4f736bfe5
X-EPHeader: CA
X-CMS-RootMailID: 20261003080438eucas1p2bdb68c248ecad088559285a4f736bfe5
References: <20260920092852.614973-1-chenwandun1@gmail.com>
	<arJA6fOMetzoBhDH@kernel.org>
	<060fb694-ba1d-40e7-8a18-f32d5a4039ab@gmail.com>
	<CGME20261003080438eucas1p2bdb68c248ecad088559285a4f736bfe5@eucas1p2.samsung.com>
	<asC3DBvtlcO5AVsz@kernel.org>
	<5dccea9b-a9e1-44f5-84d9-bc9efe04edee@samsung.com>
	<asc6brs_g0ky0wOM@kernel.org>

On 08.10.2026 08:38, Mike Rapoport wrote:
> On Tue, Oct 06, 2026 at 03:26:21PM +0200, Marek Szyprowski wrote:
>> On 03.10.2026 10:04, Mike Rapoport wrote:
>>> On Tue, Sep 22, 2026 at 05:24:32PM +0800, Wandun wrote:
>>>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>>>
>>>>>> This series fixes several error-handling issues in the reserved-memory
>>>>>> initialization paths.
>>>>>>
>>>>>> v2 --> v3:
>>>>>> 1. Rework the mechanism that checks in the late scan whether the early
>>>>>>    reservation succeeded (patches 3-5, suggested by Marek, thanks).
>>>>>>
>>>>>>    Patch 3 adds a new memblock flag MEMBLOCK_RSRV_RMEM, which is set when
>>>>>>    the early reservation of a static region succeeds and checked in the
>>>>>>    late scan.
>>>>> Can we keep this local to of_reserved_mem please?
>>>> Probably not. I do not see a way to keep this entirely local to
>>>> of_reserved_mem while handling the issue robustly.
>>>>
>>>> I previously implemented an approach in of_reserved_mem that records
>>>> static reserved-memory nodes whose early reservation failed in a local
>>>> array [1]. However, the early scan runs before paging_init(), so the array
>>>> cannot be dynamically expanded. If the number of failed nodes exceeds
>>>> the array size, some failures cannot be recorded and the issue remains,
>>>> and that is why Marek said "partial solution", although in practice
>>>> having that many failed nodes is unlikely.
>>> Even before paging_init() there is memblock_alloc().
>> One can call it, but such memory cannot be dereferenced/accessed for example
>> on ARM64, because it is not yet mapped in the linear map.
> Can't we use early_memremap() for it?

I didn't know that this is a valid, allowed use case for early_memremap(). If so, then
this is definitely the best approach, as it also removes the horrible two pass
initialization introduced by commit 8a6e02d0c00e ("of: reserved_mem: Restructure how
the reserved memory regions are processed").

I've backed such refactor with LLM and it looks very promising:

https://lore.kernel.org/all/20261008094125.3197971-1-m.szyprowski@samsung.com/


It works fine on ARM, ARM64 and RiscV64. :)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

