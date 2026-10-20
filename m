Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487227;
	b=2xxaMLIodBL9Pyey0GbY+QIC0Az4tQabx7d/Nundx5WLsb1LG9/hQ9KC5VxXsPWeabJo
	 Zek60v1sro8cB1O6dawD84Z1ypTo4TcxeNIZnSWwjpM5PW+HmQSgrdPiZOQBjHTvox57Q
	 1U8+CgC98cmxlR3jSSCcyKw5pKPdHOOLA0qllUmw9SYGh28We1qP0F4f51Ksh5qTu9lOm
	 JTAOeTckVH5sAAG+bhxNCdRz66+UxPY3WaWJ55ihD0UVw/QSIrzZuFxTFqtgGjZAHyt2/
	 /gaMdzKRvh+tIOcwoUXQ5zcPnWFf3btr1VLai5gniNO2t6dNWpGMH23n8Y8EzFwjf3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487227;
	h=DMARC-Filter:DKIM-Signature:Message-Id:Content-Transfer-Encoding:
	 Content-Type:Cc:X-Lms-Return-Path:Mime-Version:From:References:To:
	 Date:User-Agent:X-Original-From:In-Reply-To:Subject;
	bh=17hQliTTVycNMjFjUeYlptDj5DXt5fa/p+ydi6udKSU=;
	b=wyX0KuCqGdepERcPC/3qjzjF6/KrxV7/TQh55dce9ZmcQ3kcRSWtu8Eg69g7/vSKmp8p
	 PI3r9KiiTdxN3iRYlHHml5godzACMaoMGU7vjEA0tGIQznq5oVeqbVcbpE/UYc+hO/y6R
	 YVJLSugtXfcv1W50Z6osth3b854GxnWm+rJoI0pRBulYdp3hfhiGM4egjENx+5h5+tzq1
	 93eon1NgAW1IE8J34kBgvKA3/uLsmugMXe5ui59EVHvln4XH7gve08lI/aPieFwzVaVST
	 e9m1+a/UJkYvcuV99Q+sCE9/e22qif4/5VsEs1ukg1eD9AHZy/sMOszkgGaLBi1wOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=oiZNDrpz;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6773A606A329
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6773A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=oiZNDrpz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792487214; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=17hQliTTVycNMjFjUeYlptDj5DXt5fa/p+ydi6udKSU=;
 b=oiZNDrpzrAkMNzUdv8yTLttmcDorWIKe/vE8fAunuYrGXVRF5wWHjpCG7w1v/vR3m9L3v+
 kOcip5YWQtADmNvgsGgSttxrVFLpLy9DtVP1gD87KSAzqlo1IEqqxqYuFq80yUUDIRPtEZ
 OkML+Il6t0QCSEVhkhZM/V8kQzs7+Y+cc1fOTfit8xXfVIKcKYo5swCFhP8fi5xaBkbB8a
 bSuLDobmSEvSNM4FwoaRnuAwuRaVtUOYClTAzFcg/wTMBcn4wb+AcmgqvGKsr0s4o/sn38
 akOICqkXsOszye0zovd933PGfPuGtSUEZh4H+156wUVt8bM49OeunfE+CvlPAg==
Message-Id: <6b0a2dba-6096-432d-bc1a-251343dd1e74@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <gourry@gourry.net>, 
	<ziy@nvidia.com>, <rakie.kim@sk.com>, <ying.huang@linux.alibaba.com>, 
	<ljs@kernel.org>, <mhocko@suse.com>, <muchun.song@linux.dev>, 
	<roman.gushchin@linux.dev>, <shakeel.butt@linux.dev>, 
	<weixugc@google.com>, <cgroups@vger.kernel.org>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
X-Lms-Return-Path: <lba+26ad72f2d+2a4662+vger.kernel.org+lizhe.67@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: "Li Zhe" <lizhe.67@bytedance.com>
References: <20261019152148.3330024-1-joshua.hahnjy@gmail.com>
To: "Joshua Hahn" <joshua.hahnjy@gmail.com>
Date: Tue, 20 Oct 2026 17:06:28 +0800
User-Agent: Mozilla Thunderbird
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
In-Reply-To: <20261019152148.3330024-1-joshua.hahnjy@gmail.com>
Subject: Re: [RFC 0/2] mm: add source selectors to memory.reclaim

On 10/19/26 11:21 PM, Joshua Hahn wrote:
> On Mon, 19 Oct 2026 22:13:59 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:
>
>> memory.reclaim is a useful proactive reclaim interface for memcgs, but
>> tiered memory makes "reclaim N bytes from this memcg" underspecified for
>> userspace controllers that manage memory placement across tiers. The
>> kernel's reclaim policy is aging-based, and on tiered systems aging may
>> demote folios before they are eventually evicted. Without a way to
>> declare where reclaim pressure should start, userspace can only reclaim
>> from the memcg as a whole and observe one aggregate progress value.
> Hi Li,
>
> Thank you for working on this patch. I think it's quite interesting.
> I have many comments about implementation detials but for now let's
> discuss the direction of this series first.
>
>> There is prior history here [1]. The old nodes= proposal tried to let
>> memory.reclaim scan selected NUMA nodes, but the discussion left several
>> ABI questions unresolved:
>>
>> - nodes= did not clearly say whether the mask was a source selector, a
>>    reclaim domain, or a demotion-target constraint.
>> - The implementation did not apply the mask to the whole reclaim path,
>>    so demotion could allocate outside the mask. If userspace interpreted
>>    the mask as a domain or target constraint, the ABI did not provide
>>    that.
>> - Selecting top-tier nodes could become an implicit way to request
>>    demotion without uncharge. That would make userspace depend on a
>>    particular reclaim policy and could make future policy changes hard.
>> - The separate completion-accounting question remained: demotion can
>>    count as reclaim progress even though memory.current is not reduced.
>>
>> This series takes a narrower approach.
> I think this is the way to go.


Thanks for taking a look.

>
>> It adds a typed source= key which
>> declares only the source on which the existing memory.reclaim aging
>> pipeline should be applied.
> Calling it an "aging pipeline" is a big confusing to me. Maybe just call
> it eviction targets or reclaim targets?

Thanks. By "aging pipeline" I meant the combined reclaim behavior that
may demote some folios and evict others, depending on the existing
reclaim policy. But this wording is confusing here. I will use "reclaim
targets" in v2.
>
>> It is not a demotion target selector, not a
>> demotion-only goal, not an eviction-only goal, and not a change to the
>> existing completion accounting. Leaving source unspecified preserves the
>> existing memory.reclaim behavior.
>>
>> In that sense, this series extends node-scoped reclaim pressure to the
>> memcg memory.reclaim interface. The existing node memory_reclaim
>> interface can apply pressure to a node, but it is not scoped to a
>> particular memcg. This series lets userspace apply the same kind of
>> source-scoped pressure to a cgroup's resident memory on selected nodes
>> or tiers, while still using the normal memcg reclaim path.
>>
>> The main benefit of this series is to give userspace a steering knob
>> for per-node and per-tier memory placement control. A tiering controller
>> can observe the resident memory distribution across nodes or memory
>> tiers, and then apply reclaim pressure to the source that should be
>> relieved. For example, it can apply pressure to top-tier nodes so that,
>> under the existing tiering policy, cold folios can be aged and usually
>> demoted to lower tiers, or reclaim from a terminal tier when it needs
>> actual charge reduction.
> To me I think the other interesting aspect is being able to evict memory
> from lower tiers out to swap so that toptier always has room for
> demotions, preventing swapouts from higher tiers. In fact I think for
> my interests this is the more important use case.


Thanks for pointing this out. This is indeed another important use
case. I will add this use case to the cover letter in v2.

>
>> The existing memory.reclaim interface cannot express this. It applies
>> pressure to the memcg as a whole, so on a multi-tier system the kernel
>> may make progress in a tier different from the one userspace is trying
>> to control. That makes feedback control of tier ratios ineffective: the
>> controller can observe that a specific tier is over its desired resident
>> footprint, but it cannot direct the next reclaim request to that tier.
> This part is confusing to me. The kernel curently doesn't observe
> per-tier-memcg memory footprint and try to manage it, does it?
> ( that is what I'm trying to solve currently in my tiered memcg series ; -)
>    but as it stands right now, I don't think there is any feedback loop )


Right, I did not mean that the kernel has such a feedback loop today.
The feedback loop I had in mind is a userspace controller loop: userspace
observes the memcg's resident distribution, for example from per-node
memcg stats, maps nodes to tiers, and then issues memory.reclaim against
the source it wants to relieve.

The wording is confusing because it can sound like an existing kernel
policy. I will reword this in v2.

I have also looked at your tiered memcg series. If it is merged, I think
it will be very useful for tiering use cases. I hope that work can move
forward as well.

>
>> Patch 1 adds source=nodes:<nodelist>, which is the basic source
>> selector.
> In general I agree with Lorenzo, it took me a second to realize that the
> bulk of this series is just adding a nodemask to
> try_to_free_mem_cgroup_pages. It might be helpful to just call it
> "reclaim" instead of calling it an aging pipeline.


Agreed. I will simplify both the cover letter and the documentation in v2.

>
>> Patch 2 adds source=tier:<N>, where N is the memory_tierN id
>> exposed by /sys/devices/virtual/memory_tiering/. The tier selector is
>> only a convenience layer over the same source semantics: it resolves the
>> current tier nodelist at write time and then uses the same source-scoped
>> reclaim path as source=nodes:<nodelist>.
> Personally I think that it makes more sense to just start with a
> node-based reclaim interface, and then extending it to tiers. It seems
> like the tier usecase is entirely doable with just a nodemask interface.


That is reasonable. source=tier is only a convenience wrapper around the
same node mask semantics. It is not required for the core ABI.

I can drop patch 2 in v2 and start with source=nodes only.

>
> And in this case, since we're just selecting the sources of reclaim,
> tiers don't really matter, right? That is, we don't care if the memory
> gets demoted or swapped out, we just care that the footprint for the
> tier memcg goes down.


Yes, that matches the intended semantics. source= selects the resident
source to apply reclaim pressure to. It does not choose whether progress
comes from demotion or eviction.

So for source=tier, the tier only provides a convenient way to resolve a
set of source nodes. The actual reclaim semantics are still the same as
source=nodes.

>
>> The remaining issues from the old discussion are intentionally left out
>> of this series. If userspace needs to control demotion targets, that
>> should be a separate target/demotion-policy ABI rather than folded into
>> source=. If userspace needs a strict "bytes actually uncharged"
>> completion mode, that should be discussed as a separate accounting or
>> goal extension because it would change the observable meaning of
>> memory.reclaim progress. This series only adds source selection for the
>> existing reclaim policy.
> 100% agree.
>
> Thanks Li, I hope you have a great day!
> Joshua


Thanks for taking a look.

Thanks,
Zhe

>   
>> References:
>> [1] https://lore.kernel.org/all/Y5bsmpCyeryu3Zz1@dhcp22.suse.cz/
>>
>> Li Zhe (2):
>>    mm: add source selector to memory.reclaim
>>    mm: add tier source selector to memory.reclaim
>>
>>   Documentation/admin-guide/cgroup-v2.rst | 29 +++++++++++
>>   include/linux/memory-tiers.h            |  6 +++
>>   mm/internal.h                           |  3 +-
>>   mm/memcontrol-v1.c                      |  6 ++-
>>   mm/memcontrol.c                         | 11 +++--
>>   mm/memory-tiers.c                       | 24 ++++++++++
>>   mm/vmscan.c                             | 64 +++++++++++++++++++++++--
>>   7 files changed, 133 insertions(+), 10 deletions(-)
>>
>> -- 
>> 2.20.1
