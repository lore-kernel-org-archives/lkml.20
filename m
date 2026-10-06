Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2CE41D626
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293195; cv=none; b=gSLiMA69SAZRw5zkUuxiJAugjVcni1d91vqewjYj0WMbD6JHJxHoavehPOiIHCsgdnBk7rPXkfb39WRUzIF4Zarl5KJZcpRLSiU2tG8nfd5OaQjdilq3JzF6E8d8JtOqocbNIByhh8xqrpgCfDDQ7FF7fJcyaP3fUNFcc3hdZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293195; c=relaxed/simple;
	bh=ceGfxjof+93GEskjqqlX9xzwc6QXB9c09TKAcO5jqe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=pII3tt/a5DPjACXmIe0yHR6Tti4rmVA+u3kBgGJ+6UJJ3cpMnqYuMIPmo323i+5N2zzTUKnhWMzGlC4gZ5TXRUKb9rXYV95RMmNbYNItWGgQStX2vVKbWgcp/fxdxIj4WVdsIyCKkSL67BjSbiGNuJJ/PxZmUiXcntWNytrgOiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Xo20vtU7; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Xo20vtU7"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261006132623euoutp013e5b8586da358d788590084bef82b134~b86j2k0PX2564525645euoutp01s
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:26:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261006132623euoutp013e5b8586da358d788590084bef82b134~b86j2k0PX2564525645euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791293183;
	bh=ilvLBZmTUTzmE/0HmWSaWsOHx+yR2B5vrGdgJnqNXLU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Xo20vtU7vpz6oPUoo5J+3OTaVXCzYEoQLwGJLQfKlEieZQ+4aq6ct4FxV2dwnPz/D
	 yx4SBODk1XoQCa5j4HwJKEaIxs8v9xdtu6dfama+2U5eK6SntjR0Uh3iaxA3MvMUdy
	 /tKoGJSPDOTQ2YTToVsh2PWc+iaolL2UY3RkF6XI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261006132623eucas1p2f095ce115c383348370c030aa9756bab~b86jfzdIa1161711617eucas1p2E;
	Tue,  6 Oct 2026 13:26:23 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261006132622eusmtip134c8b3d58fbd753bef81a132148a358c~b86ibB-YQ3255432554eusmtip1f;
	Tue,  6 Oct 2026 13:26:22 +0000 (GMT)
Message-ID: <5dccea9b-a9e1-44f5-84d9-bc9efe04edee@samsung.com>
Date: Tue, 6 Oct 2026 15:26:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 0/5] of: reserved_mem: several fixes about reserved
 memory
To: Mike Rapoport <rppt@kernel.org>, Wandun <chenwandun1@gmail.com>
Cc: robh@kernel.org, saravanak@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <asC3DBvtlcO5AVsz@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261006132623eucas1p2f095ce115c383348370c030aa9756bab
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

On 03.10.2026 10:04, Mike Rapoport wrote:
> On Tue, Sep 22, 2026 at 05:24:32PM +0800, Wandun wrote:
>> On 9/22/26 16:48, Mike Rapoport wrote:
>>> On Sun, Sep 20, 2026 at 05:28:47PM +0800, Wandun Chen wrote:
>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>
>>>> This series fixes several error-handling issues in the reserved-memory
>>>> initialization paths.
>>>>
>>>> The first two patches fix cleanup of no-map regions after driver
>>>> initialization failure.
>>>>
>>>> Static reserved-memory nodes are reserved during the early DT scan but
>>>> initialized later. The third patch tags regions whose early reservation
>>>> succeeded, so the late scan can skip the nodes whose early reservation
>>>> failed.
>>>>
>>>> The last two patches reject overlapping static regions. Without
>>>> these checks, overlapping nodes can be initialized over the same
>>>> physical memory, result in data corrupt.
>>>>
>>>> Sashiko reported these issues in [1] [2] [3].
>>>>
>>>> [1] https://protect2.fireeye.com/v1/url?k=7e2f7441-1fa46164-7e2eff0e-74fe485cbff6-619f01488e6b7010&q=1&e=f3c07e6c-275b-4aa1-aec1-d931cda5f11a&u=https%3A%2F%2Fsashiko.dev%2F%23%2Fmessage%2F20260814090305.4C8741F00A3D%2540smtp.kernel.org
>>>> [2] https://protect2.fireeye.com/v1/url?k=a92ba57b-c8a0b05e-a92a2e34-74fe485cbff6-5f58f4b0f32080b9&q=1&e=f3c07e6c-275b-4aa1-aec1-d931cda5f11a&u=https%3A%2F%2Fsashiko.dev%2F%23%2Fmessage%2F20260814084718.29C341F000E9%2540smtp.kernel.org
>>>> [3] https://protect2.fireeye.com/v1/url?k=4f58aae4-2ed3bfc1-4f5921ab-74fe485cbff6-f4c4b3d0ed61b93e&q=1&e=f3c07e6c-275b-4aa1-aec1-d931cda5f11a&u=https%3A%2F%2Fsashiko.dev%2F%23%2Fmessage%2F20260806100605.2C2C01F000E9%2540smtp.kernel.org
>>>>
>>>> v2 --> v3:
>>>> 1. Rework the mechanism that checks in the late scan whether the early
>>>>    reservation succeeded (patches 3-5, suggested by Marek, thanks).
>>>>
>>>>    Patch 3 adds a new memblock flag MEMBLOCK_RSRV_RMEM, which is set when
>>>>    the early reservation of a static region succeeds and checked in the
>>>>    late scan.
>>> Can we keep this local to of_reserved_mem please?
>> Probably not. I do not see a way to keep this entirely local to
>> of_reserved_mem while handling the issue robustly.
>>
>> I previously implemented an approach in of_reserved_mem that records
>> static reserved-memory nodes whose early reservation failed in a local
>> array [1]. However, the early scan runs before paging_init(), so the array
>> cannot be dynamically expanded. If the number of failed nodes exceeds
>> the array size, some failures cannot be recorded and the issue remains,
>> and that is why Marek said "partial solution", although in practice
>> having that many failed nodes is unlikely.
> Even before paging_init() there is memblock_alloc().

One can call it, but such memory cannot be dereferenced/accessed for example
on ARM64, because it is not yet mapped in the linear map.

>> To handle this robustly, the late scan needs a way to determine whether
>> the corresponding early reservation actually succeeded. Current approach
>> uses memblock to retain that state.
> I can't say I like the idea of keeping this state in memblock.
> This add flags and code to memblock to deal with corner cases of bad
> firmware that reports weird memory layouts, and once there is a flag in
> the common infrastructure, people tend to abuse it.

So far I found no better place to store the information about successful
region reservation.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

