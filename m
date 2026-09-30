Received: from va-2-113.ptr.blmpb.com (va-2-113.ptr.blmpb.com [209.127.231.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C08C5158A2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776984; cv=none; b=hKGQItl/Cn5VSjiVa5kYl5NHafhau8eBsRSlHeyUhxFeTIu9oJ8UQs7cupHwMrOo8YeIlPBVnh0aicxnTrQJE7wDTs1DQFE/7ESYozbcFWx4Hnf9OxN22RJQ9KjiRSA4QT7Yeo7382gWvNcRt4nB2k++qmusAb6hUIPy0vrUbLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776984; c=relaxed/simple;
	bh=6ru/kbdsbpMCsJGQVcyHizgWLndwUbOnSRbzgOMzWBU=;
	h=Cc:Subject:To:Mime-Version:Content-Type:In-Reply-To:References:
	 From:Message-Id:Date; b=b5Cy+jxZVQ5veGhgmctuOWPKJMxXH0BCvDtEo5h4m92uKl1nUQMJLepQ8buXqqNp8nPpyQq4tObE5mGOqtX0m+Gx+0qfZRK73QwoNA8cB5gIImFsT34zna0HmzjrJNOLwbVuwLSRT/WtgRuAJZ/Hizilk9XvkVIM/KJYx4b50LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jUJz+CnS; arc=none smtp.client-ip=209.127.231.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jUJz+CnS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790776964; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=WaE+XWWIAh7wnvjsJHyHq9GcUuzsegZPrdGo3qEDS8I=;
 b=jUJz+CnSOqgqoBn9Hc/HYuORMShKcjbAaBXhBH6tBK4ZTVT20sLZU13QAGOquh440muTy+
 LfyXsFrvNZXXBslpnhQB7TxZhuC9N2GWVbXTTuq+tNGHPpQvHO/a30NGeV1vBIUHgE4SNZ
 /0NHnlLPqSou8wkk4UPhBUNbPAUBKrma8E8gm8KRbNsVEFnF8hmJHRwES6ECPLqgTp2Dl2
 zquanW77auaekDGa0lTL6MY2mZE5rhIeVaFbd9etUwnkz6/PEI+npxhE+6sVTDEJK5uWHU
 Py4llw4JunqLEd7JxG9uCDOJsXxMSP2r+4deauH6DpofbRj+3YbQX6VY0guiUw==
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <liam@infradead.org>, 
	<rppt@kernel.org>, <mhocko@suse.com>, <corbet@lwn.net>, 
	<skhan@linuxfoundation.org>, <ziy@nvidia.com>, <gourry@gourry.net>, 
	<ying.huang@linux.alibaba.com>, <apopple@nvidia.com>, 
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference with MPOL_WEIGHTED_INTERLEAVE policy
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
To: "Joshua Hahn" <joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20260930121154.687586-1-joshua.hahnjy@gmail.com>
User-Agent: Mozilla Thunderbird
References: <20260930121154.687586-1-joshua.hahnjy@gmail.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <2e3f12b7-0dac-428c-b70b-07e1f63de028@bytedance.com>
Content-Transfer-Encoding: quoted-printable
X-Lms-Return-Path: <lba+26abd1683+9fba82+vger.kernel.org+lizhe.67@bytedance.com>
Date: Wed, 30 Sep 2026 22:02:23 +0800

On 9/30/26 8:11 PM, Joshua Hahn wrote:
> On Wed, 30 Sep 2026 19:52:05 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrot=
e:
>
>> On 9/30/26 7:26 PM, David Hildenbrand (Arm) wrote:
>>> On 9/30/26 09:26, Li Zhe wrote:
>>>> MPOL_WEIGHTED_INTERLEAVE is useful on tiered-memory systems because it
>>>> can seed a workload's new allocations across fast memory and slower
>>>> capacity memory according to a configured ratio.
>>>>
>>>> That initial placement is useful for workload managers and orchestrati=
on
>>>> systems.  They can take the amount of fast memory and slower capacity
>>>> memory on a machine into account before starting a workload, and choos=
e a
>>>> weighted policy that seeds the workload across the tiers at allocation
>>>> time.  This avoids starting from an all-fast or all-slow placement and
>>>> then relying on promotion or demotion to reshape a large working set.
>>>>
>>>> After those pages have been placed, however, the policy cannot current=
ly
>>>> opt in to migrate-on-fault placement.  set_mempolicy() and mbind()
>>>> reject MPOL_WEIGHTED_INTERLEAVE when MPOL_F_NUMA_BALANCING is specifie=
d,
>>>> so memory tiering cannot promote hot pages that were initially placed =
on
>>>> the slower nodes by the weighted policy.
>>>>
>>>> Initial placement is only a starting point.  Pages initially allocated=
 on
>>>> fast memory are not necessarily the long-term hot pages, and pages
>>>> initially allocated on slower memory may become hot as the workload's =
hot
>>>> set changes.  The policy therefore needs to be able to combine weighte=
d
>>>> initial placement with memory tiering's NUMA fault based hot-page
>>>> promotion.
>>> Ok, so memory allocation will respect the weights but balancing will ig=
nore
>>> them? That really sounds rather odd to me.
>>>
>>> And I assume that was the reason why we might have disallowed the combi=
nation:
>>> it turns a weighted mechanism into an unweighted mechanism.
>>>
>>> So are we really sure these semantics that you would essentially set in=
 stone
>>> here are the semantics we want? (ignoring weights)
>> Yes, that is a fair concern. It does look odd if the weights are
>> interpreted as a hard resident placement ratio.
>>
>> My understanding of the existing MPOL_WEIGHTED_INTERLEAVE ABI is that
>> the weights are allocation weights, not a long-term resident ratio. The
>> sysfs ABI documentation says that these weights only affect new
>> allocations, and that changing them at runtime will not migrate already
>> allocated pages.=C2=A0 The implementation also has normal allocation fal=
lback
>> if the selected weighted target cannot satisfy the allocation.
>>
>> The use case here follows that interpretation.=C2=A0 The weights are use=
d to
>> seed the initial placement across memory tiers.=C2=A0 After that, with a=
n
>> explicit MPOL_F_NUMA_BALANCING opt-in, memory tiering would promote hot
>> pages based on access patterns, not based on the original allocation
>> ratio.=C2=A0 Users that want weighted allocation without that behavior w=
ould
>> keep using MPOL_WEIGHTED_INTERLEAVE without MPOL_F_NUMA_BALANCING.
>>
>> That said, I agree that allowing this flag combination would set the
>> semantics for it.=C2=A0 If reusing MPOL_F_NUMA_BALANCING for this is too
>> ambiguous, do you think we should model this as a separate opt-in ABI
>> for "weighted initial placement plus access-based balancing" instead?
>> For example, a separate flag or policy mode would make it clearer that
>> the weights are not intended to constrain migrate-on-fault placement.
>>
>> If the allocation-only interpretation of the weights is acceptable, I
>> can make it explicit in the commit message and documentation in v2.
>> Otherwise I would appreciate your suggestion on the preferred interface.
> I see two usecases for weighted interleave. Let's say you first allocate
> all the cold memory, and then all the hot memory using an interleave
> policy. This leaves the same hotness in both tiers since they are
> interleaved:
>
> In one scenario you might genuinely want to keep some hot memory in
> both tiers to maximize bandwidth utilization.
>
> But in the other case when you are not limited by bandwidth, you might
> indeed want to start out with a weighted interleave allocation to
> reduce variance on where hot memory lands, and then make promotion /
> demotion decisions based on access.
>
> Zhe, do you have a specific use-case in mind? For the second use
> case I would be curious to see if you see any meaningful performance
> differences in startup time when comapring a workload using other
> mempolicies for the allocation and then tiering vs. using weighted
> interleave and then tiering.
>
> But yeah, I think David is right that we should go over the semantics
> and really make sure this is what we want to commit to.
>
> Thanks again Zhe! Have a great day,
> Joshua

The use case is closer to the second one, but the main motivation is not
only startup-time performance.=C2=A0 The more important point is that each
workload has its own DDR/CXL budget assigned by the workload manager.

MPOL_WEIGHTED_INTERLEAVE is useful because it lets new allocations
follow that per-workload budget from the beginning, instead of placing
everything on one tier first and correcting the placement later. This is
important for workload orchestration because the workload starts from a
placement close to its assigned DDR/CXL ratio.

After that, we still need memory tiering because the initial weighted
placement does not know which pages will be hot. Some pages initially
placed on CXL may become hot, and some pages initially placed on DDR may
be cold. The intended model is therefore: weighted interleave provides
the per-workload allocation ratio, while promotion/demotion and reclaim
exchange hot and cold pages and try to keep the workload within its
assigned tier budget.

So I do not expect MPOL_WEIGHTED_INTERLEAVE alone to be a hard resident
ratio after migrations. The ratio is part of the workload placement
policy managed by the control plane. The kernel side still needs to let
hot pages from the slower tier be promoted when the workload explicitly
opts in to NUMA balancing.

Thanks a lot for taking a look at this.

Thanks,
Zhe

>
>> Thanks,
>> Zhe
