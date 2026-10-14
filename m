Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F018147DD50
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965098; cv=none; b=uT3e/lXw9mEbO04Ic/8ZUEPEheCWRdgT8P9EXY6Xll9s2I2/QZTdtyABlVZNwCeBvDjXLEnLXPOeh2WB0Ibw65CLUOXmriMNbqOXuZUvxYlrZXpbqESwzpiG7KnfjpnZvO9uz6hgXObHvwXUMtYqOTxhqCxYkvN3UlkSSdG4mdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965098; c=relaxed/simple;
	bh=qRhR1LL6foT4QhkBCJiTLRkaPKNeIrNbHQtNKCf7+HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=XTvqL/KlW0YcM11BqJhKFQteuBgVkX569p/WINK356MnfjhuqvXtIWQAs7+f42z4rMIYdj0rpt/se9Zl7Ht4yu4zXkqCvC2q8p+KGWW+oGox4LXMNdgpkfOAxrklI/TPyKYW8W3N35hqos9ViLsgHaB+uwUQjhgnMkwQZrvjlas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=sYLTXX4j; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sYLTXX4j"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261014080453euoutp02f424d59046a22d3f6bdf77f7a65ab582~eVsIf9-I-0445904459euoutp02C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:04:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261014080453euoutp02f424d59046a22d3f6bdf77f7a65ab582~eVsIf9-I-0445904459euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791965093;
	bh=bUro6dOpqOZkLgIwXsmgcxwmdXRb9oPBkMDddypWdxI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sYLTXX4jX0eYOunJVd7rJnsGiRdr/zInUJvJvtB7yc1gEsBQ1ynQSIKyUFV89jmFf
	 sVFhthw9dIdWYVU4hd7rNd/SA2RFvqQ25zBRPzrPpt/ieBN1HKnx0RocMHbtnPtOwU
	 4aRhWNg+R1wYx61CXgLOAGFSToXFE4S9/AjVYvHA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261014080453eucas1p158cc49f0c63d9419059a2228a44c0a76~eVsIQsCC52533225332eucas1p1G;
	Wed, 14 Oct 2026 08:04:53 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261014080452eusmtip2b271c365d5fbcb7f579007b96b7e0073~eVsHlyttp2605826058eusmtip2i;
	Wed, 14 Oct 2026 08:04:52 +0000 (GMT)
Message-ID: <15f70a45-a754-488c-8ba3-9e63bb956033@samsung.com>
Date: Wed, 14 Oct 2026 10:04:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
To: Wandun <chenwandun1@gmail.com>, linux-mm@kvack.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, Rob Herring <robh@kernel.org>, Saravana
	Kannan <saravanak@kernel.org>, Oreoluwa Babatunde
	<oreoluwa.babatunde@oss.qualcomm.com>, Andrew Morton
	<akpm@linux-foundation.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <42cdc3f4-95f7-4efa-be23-b3fafae84109@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261014080453eucas1p158cc49f0c63d9419059a2228a44c0a76
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261008152450eucas1p1d5517eadc2c1d684ff6d4ddc010f6331
X-EPHeader: CA
X-CMS-RootMailID: 20261008152450eucas1p1d5517eadc2c1d684ff6d4ddc010f6331
References: <20261008152403.766439-1-m.szyprowski@samsung.com>
	<CGME20261008152450eucas1p1d5517eadc2c1d684ff6d4ddc010f6331@eucas1p1.samsung.com>
	<20261008152403.766439-3-m.szyprowski@samsung.com>
	<a8ac6daa-e721-4cba-bef3-3333643db23d@gmail.com>
	<81d6c6be-d03b-4fa8-be30-1425c4d1ad40@samsung.com>
	<42cdc3f4-95f7-4efa-be23-b3fafae84109@gmail.com>

On 10.10.2026 08:40, Wandun wrote:
> On 10/9/26 19:27, Marek Szyprowski wrote:
>> On 09.10.2026 04:16, Wandun wrote:
>>> On 10/8/26 23:24, Marek Szyprowski wrote:
>>>> Get rid of the static, limited-size reserved_mem array and replace it
>>>> with array allocated by memblock_alloc_raw() and accessed through a
>>>> temporary early_memremap() mapping. Such mapping is needed for some
>>>> architectures (like ARM64), where linear map is not yet available during
>>>> early boot scan. Having a single, writeable array with all reserved
>>>> regions removes the need to perform two step initialization introduced
>>>> by commit 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved
>>>> memory regions are processed"), so all regions can be processed
>>>> directly during the early scan again.
>>> One concern about the ordering here: the new memblock_alloc_raw() for the
>>> reserved_mem array runs *before* the static ("reg") regions are reserved,
>>> so the array can be allocated from inside one of them which makes the
>>> subsequent static region reservation fail.
>> Well, that's what Sashiko already reported. It will be trivial to process
>> 'static' regions before doing the reserved_mem allocation, but this in turn
>> returns us to the point of not being able to handle their reservation
>> failures. I wonder what's worse...
> Indeed, every option has its pros and cons.
>
> Could we reconsider the approach from my v2 series [1]:
> record the nodes whose early reservation failed in an reserve_failed_nodes
> array, and have the late scan skip them.
>
> As I understand it, this handles the vast majority of cases. And if
> the number of failed nodes exceeds the reserve_failed_nodes array size,
> the system is already misbehaving and the DTS configuration itself
> needs to be revisited; even in that case, the v2 approach behaves exactly
> the same as the current code, so nothing gets worse.
Frankly speaking I would only keep the information if any of the early reservation
failed or not and just print information that "Early reservation of some memory
regions failed - system might be unstable, please fix Your device-tree". I see no
point over-engineering this more for no visible benefit.

I will send v3 of this patchset with such assumption.
> Also, IIUC, setting a memblock flag may split memblock regions, and since
> memblock cannot resize before paging_init(), that would increase the chance
> of a panic.
The memblock flags are already set for each reserved region, so adding one more
flags probably won't increase significantly the number of memblock entries.
Adjacent regions with same flags are already being merged by the memblock layer,
so many adjacent reserved regions might be covered by a single memblock entry.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

