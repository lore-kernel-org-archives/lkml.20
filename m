Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DF6547074;
	Mon, 28 Sep 2026 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598409; cv=none; b=KPqT+yIzuCnzdAZGXTOdApeG+CigvFt8vbaaZlgvGrYliusTuLwzL4mtyveK7f3rAKvzA3M6AFoNPGERtzp8kPWfwfh5Or9MrKsFL+7GNu49wdIpDLQ5XRQGduH14et8v4d34HsT6R6JgmwWKLxEF3x7ATASHcVizIab6h6jlkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598409; c=relaxed/simple;
	bh=wPs0WKOvyZp3tfsZ+PPe2sRXbr63ukzEd3hrixqLTMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kLgDdMmDbB7SX7eT/UYqi1FnbjjG0oxGmoRiuMDFmwYByBTpiCWAj3IXR2XAejEETWFQr6PhZBkFAgHvmRtEPmqV1AGv4kI1UzVxjQ34l5yexr6cM9Yov3A3nvGope3VZVqF+O9zHTpUL7wyzMW48i6ZDxGwk1zetbbsma5+Kq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=v4ev79pF; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="v4ev79pF"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KACfx1G2q1GAQfSfbEu83uZ/Iaq8+MkddQpDTiGosdY=;
	b=v4ev79pFv7LYn7GzuvqgyuVWE1fUT3b7YzjpGNU/yCYoUbUWfWAm7pafsTm3Qz+DOTbMmnmKF
	nyb9gLGmvjMLioR5yQfMiyKEaSrA/7b2s/JfbcwkOkc4j02C1M/wqkQzNkOi171lRsBBzMa3dnf
	6mMdL3yVUGrGAFPHkJmkvhI=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4htgGX2YrRzmV8H;
	Mon, 28 Sep 2026 20:14:28 +0800 (CST)
Received: from kwepemk300003.china.huawei.com (unknown [7.202.195.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 18D9F4057A;
	Mon, 28 Sep 2026 20:26:36 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 kwepemk300003.china.huawei.com (7.202.195.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 28 Sep 2026 20:26:35 +0800
Message-ID: <99ec7529-0733-4d04-a30c-d9a2b299182f@huawei.com>
Date: Mon, 28 Sep 2026 20:26:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the fs-next tree with the mm tree
To: Andrew Morton <akpm@linux-foundation.org>, Carlos Maiolino
	<cem@kernel.org>
CC: Mark Brown <broonie@kernel.org>, David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
References: <arUS5b85ed6L01qc@sirena.org.uk>
 <arZn0IB-L3hnNniw@cronus.toxiclabs.cc>
 <f9ddfd24-ee1b-47d9-a906-299421247b1d@sirena.org.uk>
 <araNBVKW6MXR97P1@cronus.toxiclabs.cc>
 <20260925141448.57220a7d3f76b92d8f1cb130@linux-foundation.org>
Content-Language: en-US
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20260925141448.57220a7d3f76b92d8f1cb130@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk300003.china.huawei.com (7.202.195.93)



On 9/26/2026 5:14 AM, Andrew Morton wrote:
> On Fri, 25 Sep 2026 17:03:58 +0200 Carlos Maiolino <cem@kernel.org> wrote:
> 
>> On Fri, Sep 25, 2026 at 02:11:28PM +0100, Mark Brown wrote:
>>> On Fri, Sep 25, 2026 at 02:26:25PM +0200, Carlos Maiolino wrote:
>>>> On Thu, Sep 24, 2026 at 01:09:09PM +0100, Mark Brown wrote:
>>>
>>>>> I fixed it up (see below) and can carry the fix as necessary. This
>>>>> is now fixed as far as linux-next is concerned, but any non trivial
>>>>> conflicts should be mentioned to your upstream maintainer when your tree
>>>>> is submitted for merging.  You may also want to consider cooperating
>>>>> with the maintainer of the conflicting tree to minimise any particularly
>>>>> complex conflicts.
>>>
>>>> Do you mean non-trivial conflicts with linux-next? I always attempt a
>>>
>>> With other trees in linux-next.
>>>
>>>> merge against Linus's tree before sending a pull-request to check and
>>>> annotate any possible conflict, but I have never done that for
>>>> linux-next. I can do that, no problems. Where should I send a
>>>> notification to? linux-next@vger?
>>>
>>> If there's anything interesting it can be helpful for me to get a heads
>>> up on the resolution but the main thing (and half the point of having
>>> -next) is to coordinate with other trees that you're colliding with.
>>> You don't specifically need to check, I'll tell you if I notice
>>> something, but OTOH if you know your work is going to be colliding with
>>> someone else's it's good to coordinate.
>>
>> Ok, that sounds fair Mark. I honestly didn't expect this patch to
>> collide with Andrew's tree. The submitter sent both of them initially,
>> Andrew picked one, and I asked the submitter to send the second one
>> individually for me to pick up. But I didn't expect it to cause a
>> collision. Next time it happens I'll try to keep an eye on the ending
>> result.
> 
> I don't think much went wrong here.  Keeping the [1/4] xfs patch in
> mm.git is appropriate, as it's part of a series.  Unfortunately Kefeng's
> standalone "xfs: fix NOFS state corruption in btree split worker"
> conflicted with it.


The mm series patches were based on Andrew's mm tree. However, sashiko
discovered a previously existing issue and sent a separate bugfix (based
on linux-xfs). But because both patches modified the same function,
xfs_btree_split_worker, it caused a context conflict.


* 26f42375404e xfs: fix NOFS state corruption in btree split worker
* 213bf447fc22 xfs: remove dead kswapd flag inheritance from btree split 
worker

I checked the latest linux-next, next-20260925, and found that the
current branch has issues while resolving the conflict, resulting in the
bugfix part being lost.

> 
> I suppose I could add the standalone fix to mm-git as well (with xfs
> maintainer acks), just to make life easier for everyone?

Maybe Mark will fix it in linux-next, or as Andrew said, merge all
the patches into the mm branch, but depends on the maintainer :)


