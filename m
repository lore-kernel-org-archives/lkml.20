Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EEA4A9D51
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053646; cv=none; b=CLg043Immni/eeL6LUYRA6s17QrozwjiskSF1dqwIMlOX0I+f356OHHPc+Sl2HV2J6Rf6OOk6of7c7iqSGvkgz3EjumwGw2flPGdIP+o281ABnz4y+I/Aa3fCmcwKSFxIlgKdAl5qZm1CnZwQdtKqNBWt2yidpxno92dlR8F9SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053646; c=relaxed/simple;
	bh=xWU5xEbyBzdKIWf3CvUYZb/YMCiCU8pzO97VajjyhCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=K6YKuwLHR3UqhB6P0DexF+oCj/ITEIFL1/dy+rlTynlG5UmOW76lmfZubBUE3YLX9uLi/0m83E2bJFeMOcQCdATj7m0Zpye5oT7R8jFjMloilM8lYJFUkBRvUH5gzv9VlzGTJs3s+GRf8RiKw62F7T0Dhq+q6Lz21lc95WLT+7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=o+PGVAam; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="o+PGVAam"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260910152030euoutp02db43d074862a12f4680ed5be9cbc6b06~T-sxMFoBu2404124041euoutp024
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:20:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260910152030euoutp02db43d074862a12f4680ed5be9cbc6b06~T-sxMFoBu2404124041euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789053630;
	bh=izFHd1RA+/2Fh1sAs5H355El9G+IR0JNrZBtgpSNdTU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=o+PGVAamrGuZJIq5ZBtsHzbopMnELdgTdEygVYagjfRGthDID706s0UX1ntU9c7UA
	 3D0tiAV2Dv9Xh7ql5krC4ypxX4lbDHSGlyZhGgwzg/7GkedYTTABE7gYtyDJiD/2+W
	 hmYABDL8NDG99JuHrtdPgaByzEWOmsvhHyEwoXX0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260910152029eucas1p10ea2e109779b1e8cd23a832adcbbd0fc~T-swhAOzC1238912389eucas1p1U;
	Thu, 10 Sep 2026 15:20:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260910152029eusmtip1fa72d122c1c1cc8d3fc529180af1982b~T-sv66MgV2099520995eusmtip1O;
	Thu, 10 Sep 2026 15:20:28 +0000 (GMT)
Message-ID: <518729f2-db28-4af5-8ed3-9985c124db3e@samsung.com>
Date: Thu, 10 Sep 2026 17:20:28 +0200
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
In-Reply-To: <7dd9e1c3-ddc8-482e-a560-e8dc4f2f0aac@gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260910152029eucas1p10ea2e109779b1e8cd23a832adcbbd0fc
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
	<7a964778-adc3-4186-9122-3858bb61c372@samsung.com>
	<7dd9e1c3-ddc8-482e-a560-e8dc4f2f0aac@gmail.com>

On 10.09.2026 12:55, Wandun wrote:
> On 9/4/26 16:49, Marek Szyprowski wrote:
>> On 31.08.2026 15:04, Wandun wrote:
>>> On 8/26/26 21:14, Marek Szyprowski wrote:
>>>> On 18.08.2026 11:24, Wandun Chen wrote:
>>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>>
>>>>> __reserved_mem_reserve_reg() discards the error from
>>>>> early_init_dt_reserve_memory() and returns 0 unconditionally, so the
>>>>> caller counts the node in total_reserved_mem_cnt and the late scan
>>>>> initializes it without checking whether the early reservation actually
>>>>> succeeded. A region whose reservation failed is then handed to a
>>>>> device assuming the memory is protected.
>>>>>
>>>>> Propagate the error so failed reservations are no longer counted, and
>>>>> record the failed nodes so fdt_scan_reserved_mem_late() can skip them.
>>>>>
>>>>> Recording the failed nodes explicitly is necessary because
>>>>> fdt_scan_reserved_mem_late() rescans the DT independently. It cannot
>>>>> tell from memblock whether early reservation succeeded.
>>>>>
>>>>> The failed-node array is bounded by MAX_RESERVED_REGIONS, the number
>>>>> of static regions is not bounded by it, so on overflow the extra nodes
>>>>> fall back to being initialized, which is the current behavior.
>>>> I'm not very keen on such partial solution. Indeed we have no place to
>>>>
>>>> store the result of the early init call, but we can check if the given
>>>>
>>>> region has been earlier marked in memblock as reserved or no-map in
>>>>
>>>> fdt_scan_reserved_mem_late(). If those attributes don't match the
>>>>
>>>> region can be simply skipped then.
>>> Considering the later patches that reject reservations for overlapping
>>> nodes, checking the memblock state in fdt_scan_reserved_mem_late() may
>>> produce false positives.
>>>
>>> For example, if region A is reserved first and region B is a subset of
>>> A, reserving B will fail because it overlaps with A (in patch 02/03).
>>> However, during fdt_scan_reserved_mem_late(), B will still appear to
>>> be reserved because its range is already covered by A. As a result,
>>> B would be initialized even though its own reservation failed, which
>>> is contrary to the intended behavior.
>> Imho the overlapping reserved regions are some kind of configuration 
>> mismatch and it is enough to detect them. fdt_scan_reserved_mem_late()
>> can first store all regions to dynamic reserved_mem array, then check
>> for overlaps, and only then initialize those, which don't overlap and
>> have proper memblock attributes?
> Thanks a lot for reviewing this series.
>
> I did try this approach, and it looks clean. The overlap check works
> well for regions within /reserved-memory. But there's one case I
> couldn't make it handle, where it seems to still produce a false
> positive, please correct me if I'm missing something.
>
> For example, region A is reserved before /reserved-memory nodes are
> processed. A is not a /reserved-memory node, so it never appears in
> the reserved_mem array. Now region B in /reserved-memory is a subset
> of A. At early reservation, patch 02/03 rejects B due to the overlap.
> But at the late scan, B's range already appears reserved (covered by A),
> so it looks like a successful reservation and gets initialized.
>
> The root issue is that the late scan can only tell whether a region is
> reserved, but it can't tell whether the reservation was made by
> /reserved-memory node itself or by something else. Maybe we still need
> to record during the early reservation stage.
Then maybe it will be easier and cleaner just to add a new flag to 
memblock_flags (see include/linux/memblock.h) and mark each successfully
reserved region with it? There are some spare bits there.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

