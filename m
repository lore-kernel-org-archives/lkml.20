Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF06336C0C8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511781; cv=none; b=KLpCzkn8SPwf3dQrgitYpLlDmo8r8pIRUJXIww45i1eaq+RhbesM6NCgcHGQBSSsamgNy+zqsiUUM+Ub33hYmgXwiPI+vx52zvZJIa28dcGZYvEKomTjy84ZYyvUnBr6+5XbTVFz0LiYUUKrV1v+cIfb1iGgv41lTPzN0P3be5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511781; c=relaxed/simple;
	bh=E7DlWlAAt6X48ZBw22IDOTtmj08VFwzhfvZoHumv1k4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=HN5uDZUjP166w6btlKrsgddRiZ4gowvMvVZTfAjvkznoSDWTajfrzcf+8eq598WRxGAgR6HcpYxCqcmSnhdY1GV0MAtO+Ok1EWsHxreHoYT+a6+uOuzk253Dn4uoZMf5NOJ7RR6Wr9OizLJ2kqBq6JkqmU08QVJ6sJLmJ/mrGlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=k+xjfBZb; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="k+xjfBZb"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260904084935euoutp02d6498587a1c6844e24c90ece282080fc~SEfvYtlpz0254402544euoutp02E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:49:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260904084935euoutp02d6498587a1c6844e24c90ece282080fc~SEfvYtlpz0254402544euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788511775;
	bh=TRJp0dKoJ0AAnYHiw2vjCZISve1u5NQsN4lNqiqXCas=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=k+xjfBZb8EOgq/nE1LFiRwgk5san30m75zav5GE5AIdFn+n0lmmiAZtv4FivAlksh
	 bJ5/si4pfBP2lD8+pAhcxxk0v9sRIdacAvSwO1YIzUbUWc6vSx15ara/qBcyWU+o8V
	 4RUUlXPJK6m6r6nr55E02f5HQmfNf6DFKccChJsM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260904084935eucas1p13ee1a4294211aadad724ea4db531ad41~SEfvIXAcH1432814328eucas1p1d;
	Fri,  4 Sep 2026 08:49:35 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260904084934eusmtip2ef0e7280d599597ee308dfec8b910eca~SEfuw0oom1654116541eusmtip2n;
	Fri,  4 Sep 2026 08:49:34 +0000 (GMT)
Message-ID: <7a964778-adc3-4186-9122-3858bb61c372@samsung.com>
Date: Fri, 4 Sep 2026 10:49:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 1/5] of: reserved_mem: skip init for regions whose
 early reservation failed
To: Wandun <chenwandun1@gmail.com>, robh@kernel.org, saravanak@kernel.org,
	rppt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <af87036b-0809-4880-b088-545780b4d963@gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260904084935eucas1p13ee1a4294211aadad724ea4db531ad41
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260818092438eucas1p20115e5d33908e32ef4433cb246da8098
X-EPHeader: CA
X-CMS-RootMailID: 20260818092438eucas1p20115e5d33908e32ef4433cb246da8098
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
	<CGME20260818092438eucas1p20115e5d33908e32ef4433cb246da8098@eucas1p2.samsung.com>
	<20260818092420.2859026-2-chenwandun1@gmail.com>
	<72074a49-2963-4f96-b939-79bf95a829cb@samsung.com>
	<af87036b-0809-4880-b088-545780b4d963@gmail.com>

On 31.08.2026 15:04, Wandun wrote:
> On 8/26/26 21:14, Marek Szyprowski wrote:
>> On 18.08.2026 11:24, Wandun Chen wrote:
>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>
>>> __reserved_mem_reserve_reg() discards the error from
>>> early_init_dt_reserve_memory() and returns 0 unconditionally, so the
>>> caller counts the node in total_reserved_mem_cnt and the late scan
>>> initializes it without checking whether the early reservation actually
>>> succeeded. A region whose reservation failed is then handed to a
>>> device assuming the memory is protected.
>>>
>>> Propagate the error so failed reservations are no longer counted, and
>>> record the failed nodes so fdt_scan_reserved_mem_late() can skip them.
>>>
>>> Recording the failed nodes explicitly is necessary because
>>> fdt_scan_reserved_mem_late() rescans the DT independently. It cannot
>>> tell from memblock whether early reservation succeeded.
>>>
>>> The failed-node array is bounded by MAX_RESERVED_REGIONS, the number
>>> of static regions is not bounded by it, so on overflow the extra nodes
>>> fall back to being initialized, which is the current behavior.
>> I'm not very keen on such partial solution. Indeed we have no place to
>>
>> store the result of the early init call, but we can check if the given
>>
>> region has been earlier marked in memblock as reserved or no-map in
>>
>> fdt_scan_reserved_mem_late(). If those attributes don't match the
>>
>> region can be simply skipped then.
> Considering the later patches that reject reservations for overlapping
> nodes, checking the memblock state in fdt_scan_reserved_mem_late() may
> produce false positives.
>
> For example, if region A is reserved first and region B is a subset of
> A, reserving B will fail because it overlaps with A (in patch 02/03).
> However, during fdt_scan_reserved_mem_late(), B will still appear to
> be reserved because its range is already covered by A. As a result,
> B would be initialized even though its own reservation failed, which
> is contrary to the intended behavior.
Imho the overlapping reserved regions are some kind of configuration 
mismatch and it is enough to detect them. fdt_scan_reserved_mem_late()
can first store all regions to dynamic reserved_mem array, then check
for overlaps, and only then initialize those, which don't overlap and
have proper memblock attributes?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

