Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078D93F2118
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109072; cv=none; b=ibv29w0jDmIarmPn0raqF49kXItEbJm+/Z6Upyv3cvpVsZvGY4gj1IhL7i+Ag4PlyNKKep7Qg0vzvxs15mUSpITR3Z27TxK2QNUfdts5eB7fn7uC9r26MvJ7FLuHVG4GcL92UEQVBBFuHaZeptf8eRAdjdBPkT9PvekxSmDc0Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109072; c=relaxed/simple;
	bh=nwJY3eyt33SYOXwAO/mLSI+T7Hsnk/pI3p4H9sMrdbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=E00bUVlj2BlNvhS/SylD7693wgW03geboqnRhDlva5eRxTDOpY/vGpx8Fz2RU7RG4ITA1VD4JpL1CDMaOxzi9xylHZWtXjFxuykFEpDVq/5zYZtgGgT3SolSX09HtJ2dYYYf3Z+ye0t/wgBBaZjmkxCbnSLgDlizJUjsCKIuKNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=e5KK3FdC; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="e5KK3FdC"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260911064411euoutp025fc41d40c860d7a98a569318b84553b4~UMTQMblzI1585015850euoutp02w
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:44:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260911064411euoutp025fc41d40c860d7a98a569318b84553b4~UMTQMblzI1585015850euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789109051;
	bh=t1H50kH3M88JVikkBnDtR3FYrroEvYJwh3vXK+3DDGo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=e5KK3FdCweoN99A8Aq68AIq6VaEB4V1PFMz1oU40j6tmrjZtbpkljk09HgAdyOtsD
	 2935EV/4FVJMN+kveoaHhlam2sVk8XWZvKMryakPLfwRos8emPs2XwNoi03i2lO1gz
	 Ty+D4A7DidAquXdSvOBUhhp0zsMS5zJiugz4LkqE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260911064410eucas1p1a59106bb32ffd42bf86506e3b9b7ff91~UMTPcco_M3171431714eucas1p1b;
	Fri, 11 Sep 2026 06:44:10 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260911064410eusmtip10832dba296ae40699d5456b7b7154595~UMTO1e4tm0512005120eusmtip1P;
	Fri, 11 Sep 2026 06:44:10 +0000 (GMT)
Message-ID: <7dff82db-cfac-4c38-91f6-12b542716bd6@samsung.com>
Date: Fri, 11 Sep 2026 08:44:09 +0200
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
In-Reply-To: <cbbe6ba0-5ee2-4597-92b8-3257e152be75@gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260911064410eucas1p1a59106bb32ffd42bf86506e3b9b7ff91
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
	<518729f2-db28-4af5-8ed3-9985c124db3e@samsung.com>
	<cbbe6ba0-5ee2-4597-92b8-3257e152be75@gmail.com>

On 11.09.2026 08:37, Wandun wrote:
> On 9/10/26 23:20, Marek Szyprowski wrote:
>> On 10.09.2026 12:55, Wandun wrote:
>>> On 9/4/26 16:49, Marek Szyprowski wrote:
>>>> On 31.08.2026 15:04, Wandun wrote:
>>>>> On 8/26/26 21:14, Marek Szyprowski wrote:
>>>>>> On 18.08.2026 11:24, Wandun Chen wrote:
>>>>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>>>>
>>>>>>> __reserved_mem_reserve_reg() discards the error from
>>>>>>> early_init_dt_reserve_memory() and returns 0 unconditionally, so the
>>>>>>> caller counts the node in total_reserved_mem_cnt and the late scan
>>>>>>> initializes it without checking whether the early reservation actually
>>>>>>> succeeded. A region whose reservation failed is then handed to a
>>>>>>> device assuming the memory is protected.
>>>>>>>
>>>>>>> Propagate the error so failed reservations are no longer counted, and
>>>>>>> record the failed nodes so fdt_scan_reserved_mem_late() can skip them.
>>>>>>>
>>>>>>> Recording the failed nodes explicitly is necessary because
>>>>>>> fdt_scan_reserved_mem_late() rescans the DT independently. It cannot
>>>>>>> tell from memblock whether early reservation succeeded.
>>>>>>>
>>>>>>> The failed-node array is bounded by MAX_RESERVED_REGIONS, the number
>>>>>>> of static regions is not bounded by it, so on overflow the extra nodes
>>>>>>> fall back to being initialized, which is the current behavior.
>>>>>> I'm not very keen on such partial solution. Indeed we have no place to
>>>>>>
>>>>>> store the result of the early init call, but we can check if the given
>>>>>>
>>>>>> region has been earlier marked in memblock as reserved or no-map in
>>>>>>
>>>>>> fdt_scan_reserved_mem_late(). If those attributes don't match the
>>>>>>
>>>>>> region can be simply skipped then.
>>>>> Considering the later patches that reject reservations for overlapping
>>>>> nodes, checking the memblock state in fdt_scan_reserved_mem_late() may
>>>>> produce false positives.
>>>>>
>>>>> For example, if region A is reserved first and region B is a subset of
>>>>> A, reserving B will fail because it overlaps with A (in patch 02/03).
>>>>> However, during fdt_scan_reserved_mem_late(), B will still appear to
>>>>> be reserved because its range is already covered by A. As a result,
>>>>> B would be initialized even though its own reservation failed, which
>>>>> is contrary to the intended behavior.
>>>> Imho the overlapping reserved regions are some kind of configuration 
>>>> mismatch and it is enough to detect them. fdt_scan_reserved_mem_late()
>>>> can first store all regions to dynamic reserved_mem array, then check
>>>> for overlaps, and only then initialize those, which don't overlap and
>>>> have proper memblock attributes?
>>> Thanks a lot for reviewing this series.
>>>
>>> I did try this approach, and it looks clean. The overlap check works
>>> well for regions within /reserved-memory. But there's one case I
>>> couldn't make it handle, where it seems to still produce a false
>>> positive, please correct me if I'm missing something.
>>>
>>> For example, region A is reserved before /reserved-memory nodes are
>>> processed. A is not a /reserved-memory node, so it never appears in
>>> the reserved_mem array. Now region B in /reserved-memory is a subset
>>> of A. At early reservation, patch 02/03 rejects B due to the overlap.
>>> But at the late scan, B's range already appears reserved (covered by A),
>>> so it looks like a successful reservation and gets initialized.
>>>
>>> The root issue is that the late scan can only tell whether a region is
>>> reserved, but it can't tell whether the reservation was made by
>>> /reserved-memory node itself or by something else. Maybe we still need
>>> to record during the early reservation stage.
>> Then maybe it will be easier and cleaner just to add a new flag to 
>> memblock_flags (see include/linux/memblock.h) and mark each successfully
>> reserved region with it? There are some spare bits there.
> I really like this idea, it's cleaner and directly solves the
> "late scan can't tell who reserved the region" problem. Combining your
> two suggestions gives a clean and simple approach, and I'll implement it
> in v3.
>
> One concern: a reserved region carrying the new flag won't merge with a
> reserved region wihtout it, so memblock.memory and memblock.reserved may
> end up with more regions than today. When fdt_scan_reserved_mem() runs,
> memblock is not allowed to resize, so if regions in memblock.reserved or
> memblock.memory are exhausted, panic will occur.
> The default regions number of memblock.memory/memblock.reserved is
> INIT_MEMBLOCK_RESERVED_REGIONS, it can be raised if a platform actually
> hits it, so I don't think this blocks the approach, what's your view?

When reserved memory regions are not contiguous, the current code will also
trigger memblock split on each allocated region due to setting the
no-map or reserved flags, so setting one more flag should not make it worse.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

