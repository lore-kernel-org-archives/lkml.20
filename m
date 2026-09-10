Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E46208D0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789001542; cv=none; b=mxlljUzLNZO/tGr4jmMKpk3ojnTx276bbjREWLp3BfFq76DeuR5HnLDvZyYrzhQ2QOHtj2KtFA03gJ5mwrneBYJ2KdiMGPxaNMonAHOPVrTpe1EQ7ur7kpiWXU4O7zPeGD4YWYB9DcfKmXFP0iy8u8ilY90BSu2POZtCYVcsFh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789001542; c=relaxed/simple;
	bh=fRh1oIzwWs47PMqD2dyLKsdesCkXzPdn4vgt5R1+geo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyfKidSvl8i0eCN/BL3WUyiOs8bHZSCIBY1Vvii27xHQP7X2ylTASdBFBJxIGCXXgJC9gr31nxf79uwMP+//rm0UgcVvHlom+Fd9Ck9cDpbUNiQ+Wifu9mMVZ2T5axqJpfZW8kPUJzkpkkw5JA6ECaoVagihxViJypg7EE+9w1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OCDeLKE8; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OCDeLKE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=AO8JmiwkDyOOjQQUcvZkGJAu8DjBBEEuc7ZAE11OeWs=;
	b=OCDeLKE8cU5YJytu6w1qv20p36KcBOqfKD8llXopOrF3Sr1zT+rdLO30/O1Zhs
	JZDrBTQ/EnhaMUk4VE9Rsf/qf/lJZzr1If4uHL3QPLc/zsosBD5IO78tc7xrOS7/
	DSWzbuJd8Sse2nWwnMXYhtROCl8cfiy3qDdyQSHx9JrOA=
Message-ID: <84bb8f53-54ff-4153-845f-e085ec649d36@163.com>
Date: Thu, 10 Sep 2026 08:51:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/ksm: trylock the mmap lock in the unstable tree
 walk
To: "David Hildenbrand (Arm)" <david@kernel.org>, xu.xin16@zte.com.cn
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, chengming.zhou@linux.dev,
 linux-kernel@vger.kernel.org, xialonglong@kylinos.cn
References: <20260909110228828hKTCgUeuZkOujOBaVtUcL@zte.com.cn>
 <91cf8129-d705-4ebd-b420-129bab7ed261@kernel.org>
From: Longlong Xia <xialonglong2025@163.com>
In-Reply-To: <91cf8129-d705-4ebd-b420-129bab7ed261@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD337YT_6Fq2xv3Bg--.17001S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr4DKF1xuF4UJw4UCry8Zrb_yoWfKwc_AF
	1vv3Z7WrZrJr1ftr4ayw1ftrsaqa1vgFyfJF4YvFnIva4UG3WkZFWYq3s3XF1fWFWrWa98
	CrnFy3yxuas09jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjWxRPUUUUU==
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC3AQMBWqh-yREugAA3-

Thanks for the review.

在 2026/9/9 23:17, David Hildenbrand (Arm) 写道:
>>> index 49d48d1e0998..3cfb09a926ff 100644
>>> --- a/mm/ksm.c
>>> +++ b/mm/ksm.c
>>> @@ -820,7 +820,14 @@ static struct page *get_mergeable_page(struct ksm_rmap_item *rmap_item)
>>>   	struct folio_walk fw;
>>>   	struct folio *folio;
>>>   
>>> -	mmap_read_lock(mm);
>>> +	/*
>>> +	 * We trylock because we don't want ksmd to wait for an mm that is
>>> +	 * busy changing its memory layout: we prefer to skip this page and
>>> +	 * let the next full scan retry it, like the folio trylock in
>>> +	 * try_to_merge_one_page().
>>> +	 */
>>> +	if (!mmap_read_trylock(mm))
>>> +		return NULL;
>>>   	vma = find_mergeable_vma(mm, addr);
>>>   	if (!vma)
>>>   		goto out;
>>> -- 
>>> 2.43.0
>> Sorry, NACK
> Agreed. Likely the answer is to switch to per-vma locks here. All we do is a
> folio_walk_start() to look up a page, that's not too crazy :)

Thanks for the suggestions — I'll explore this further.


Thanks,

Longlong

