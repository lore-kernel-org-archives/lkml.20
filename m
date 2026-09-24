Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0AE3CCA19
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260685; cv=none; b=G/0F8XiwPKUvEb3d+HK341sSvv6zRnIDMIJwsSKT9Hjd0I8H3HYymHc+jBBqwSEoBHs1gjAue3EomsuphqlcRByfN4/NleJXlzYM8Ee5BpTdhFXqnurIMp6MBDtbuPNk8RsDJ7XZgyyl59hb/EprQM3bDz1Amtms9F7enhej8W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260685; c=relaxed/simple;
	bh=1TRuzB0QdQy7dzH6bea4XfakDXRE9mVkigI9onRd7ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A38gLqBHmlfQBhYMvgcULuSaZkepnPNmvRcMtOL9dHtdMYt5dFnklA61aAVJor1eD3A4ss0dpIbPl0CcLGmLZczoAQWFHmSk3iWQLfHkNvqKrMDjgR42QFAwQiI3LJtYc9kbTqfePd+Ww7wBC2+etDekCKA1gSkIXFxMZnYCvig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tgS02rox; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tgS02rox"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49C652F;
	Thu, 24 Sep 2026 07:37:59 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C9CD3F86C;
	Thu, 24 Sep 2026 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790260682; bh=1TRuzB0QdQy7dzH6bea4XfakDXRE9mVkigI9onRd7ew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tgS02roxXNDs31ofMmXBfl7Xw715c/ozRO19SNAgJggG+UGUdMf/fLPAysDGiYUqk
	 1+3ALkEb+GmODH5TpSJhpd6BDhajtn5zdydW5zZiKRfWYYLoPgOFpoIlwU8l8IoOtG
	 3LE3hhI3TO/oFpSuj2f5BuVu/hWrJCKuCd/U/z6k=
Message-ID: <05289411-7b6c-4f75-b811-e32348717ca4@arm.com>
Date: Thu, 24 Sep 2026 15:38:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Dave Martin <Dave.Martin@arm.com>,
 Babu Moger <babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>,
 Chen Yu <yu.c.chen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Newman <peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <eed6d913-c01e-46d4-b249-68d2e7f5b616@nvidia.com>
 <6cf3efa5-697f-476d-9f8b-0c97bebd706b@intel.com>
 <3f39918f-91c0-4411-88d2-1ab1db3f12d8@arm.com>
 <94cb1f7b-0b78-4aec-8d57-7ae7e547cf36@intel.com>
 <7ff818b9-77b9-4ac8-9132-98fec40ab0ac@arm.com>
 <46e62f37-37f0-4d8e-b869-b83a61cb611b@intel.com>
 <f9d97f42-bfa0-4862-8494-7769b929ea52@arm.com>
 <49d4132a-843f-4034-9bc0-0dbd351f8215@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <49d4132a-843f-4034-9bc0-0dbd351f8215@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Reinette,

On 23/09/2026 16:28, Reinette Chatre wrote:
> Hi Ben,
> 
> On 9/21/26 9:53 AM, Ben Horgan wrote:
>> On 21/09/2026 17:06, Reinette Chatre wrote:
>>> On 9/21/26 3:22 AM, Ben Horgan wrote:
>>>> On 18/09/2026 23:47, Reinette Chatre wrote:
> 
> ...>>>>
>>>>> Are you instead saying that resctrl should expose a node scoped control as that of a L3 scope control?
>>>>
>>>> The problem is that this already happens, for MPAM, in the degenerate case. This is the consequence
>>>> of allowing memory MSC to pretend to be L3 scoped MSC and so represented by the MB resource. This
>>>> only happens when there is a single L3 and a single NUMA node with no caches in between so that the
>>>> traffic at either end of the path is effectively equivalent and the scope for both is global as you
>>>> can't turn off the last CPU or the only NUMA node. In want of a better term, let's call this "L3 is
>>>> NUMA". These shenanigans are what lead to the complexity of having more that one MPAM class backing
>>>> a resource which we discuss at [1]. The need for the association is that, where possible, the memory
>>>> allocation and memory bandwidth counters are exposed to the user using the existing resctrl
>>>> interface and, as such, existing software will continue to work.
>>>>
>>>> What I was suggesting, is that in "native" mode we do away with any pretending. That is, memory MSC
>>>> always back resources with NODE scope even in the degenerate "L3 is NUMA" case. One benefit of this
>>>> is that the resctrl hierarchy can be more correct. I was about to write that a second benefit was
>>>> that if there is a L3 cache MPAM class and a memory MPAM class which both provide memory allocation
>>>> they could both be displayed in resctrl, MB and MB_NODE. The same consideration applies for memory
>>>> bandwidth counters. However, as the MPAM driver in the "L3 is NUMA" case, always chooses the L3 MPAM
>>>> class to back MB over other classes, the MPAM driver can just be extended to back MB_NODE with the
>>>> memory class that was not chosen. In this way it will works the same way as in the non-degenerate
>>>> cases and the same mechanism is in place for memory bandwidth counters.
>>>>
>>>> Hence, the only benefit would be a slightly closer description of the hardware in resctrl in the "L3
>>>> is NUMA" case. In performing this exercise of laying out my reasons for allowing the native/legacy
>>>> control to move things across resources  I see it is unnecessary and so the native/legacy switch
>>>> should, as per your proposal, *not* move controls between resources. Thank you for your patience.
>>>>
>>>> [1] https://lore.kernel.org/linux-arm-kernel/0b0eef2d-ce3b-48c8-af08-5889e7396e4f@arm.com/
>>>
>>> If I understand correctly an "L3 is NUMA" would be presented to user space as:
>>>
>>> info/
>>> ├── MB/
>>> │   └── schemata/
>>> │       ├── MB/
>>> │       │   └── MB_L3_MAX/
>>> │       └── MB_L3_MIN/
>>> └── MB_NODE/
>>>     └── schemata/
>>>         ├── MB_NODE_MAX/
>>>         └── MB_NODE_MIN/
>>>
>>> with the "MB" resource backed by the "L3 cache MPAM class" and the "MB_NODE" resource backed
>>> by the "memory MPAM class". Is this getting close?
>>
>> In the case when there is an L3 cache MPAM class and a memory MPAM class both support memory
>> bandwidth allocation then yes. However, I don't know of systems like this today and this isn't
>> dependent on the "L3 is NUMA". If there are multiple L3 and multiple NUMA nodes you would still get
>> this structure. It just relies on both the L3 cache MPAM class and the memory MPAM class supporting
>> bandwidth allocation (mbw_max/mbw_min). The "L3 is NUMA" is all about pretending a memory MPAM class
>> is a L3 cache MPAM class so that it fits into the existing expectations of the resctrl interface.
> 
> I am missing something
> 
> From earlier description ("... the complexity of having more that one MPAM class backing a resource
> which we discuss at [1]... ") I understood that "L3 is NUMA" scenario has two classes available and
> currently just uses one to back the MB resource. Further, that the new interface makes it possible
> for "the MPAM driver can just be extended to back MB_NODE with the memory class that was not chosen".
> 
> Above seems to state that such systems that have two classes do not exist?

Hmmm, there is a distinction but I obviously haven't made clear. Let me expand on that here. You can
certainly have more than one MPAM class backing the monitors in a resource but each class backs
different monitors (mbm_total/llc_occupancy). As currently resctrl expects all monitors to be at the
L3 when the system allows it we "pretend" (this the "L3 is NUMA") and so the llc_occupancy counts
would be taken from the MPAM L3 class and mbm_total from the MPAM memory class. What doesn't
currently exist, but could, is a system where the MPAM L3 class and the MPAM memory class both
support memory bandwidth monitoring. Currently, in such a system the MB mbm_total will always be
backed by the MPAM L3 class and the memory bandwidth monitoring in the MPAM memory class would be
left unused. Once the MB_NODE support is introduced the unused bandwidth monitoring at the MPAM
memory class the mbm_total can be exposed there. Even once MB_NODE support is added we can continue
exposing mbm_total counters form the memory class as MB in the same case as before, they aren't
support in the L3 MPAM class and it's "L3 is NUMA" (single L3 and single NUMA with nothing inbetween).

It's similar for controls although the only control that we have currently that is effected is
maximum bandwidth, MB (MB_L3_MAX). If it's implemented if mbw_max is just at the L3 we expose it as
MB as would be expected and if mbw_max is just at the memory class, then if it's "L3 is NUMA" then
we can expose it. When MB_NODE is added this doesn't change but for a system with mbw_max at the L3
class and at the memory class the L3 version will be exposed at the MB resource and the memory
version at the MB_NODE. Each resource is only back by a single MPAM class and so we wouldn't have
e.g. MB_MAX provided by L3 class and MB_MIN provided by the memory class (These two controls also
have an interdependence in h/w so the behaviour may be confusing if they are split). In a system
with mbw_max at the L3 and cache occupancy at the L3 then the L3 class will back both the L3
resource and the MB resource.

> 
> My concern is the impact on the user interface. When MPAM "stops pretending", could a system that
> exposes an MB resource before the new interface boot into new kernel with the new interface and no
> longer have an MB resource but instead just have an MB_NODE resource?

No, I did briefly entertain the idea of stopping pretending based on legacy/native view (which is
surely the source of some of the confusion) but anything that is currently exposed as a control or
monitor at the MB resource will stay for perpetuity at the MB resource. MPAM has no need to "stop
pretending". The only systems where the mbw_max control in the MPAM memory class is exposed as MB is
when there is no mbw_max control on the MPAM L3 class and its a "L3 is NUMA" system. If the MPAM L3
class can back "MB_L3_MAX" then it will. We should keep it this way.

When new controls are exposed to resctrl the MPAM driver will have to be careful to not break the
existing interface in the "L3 is NUMA" case.

On adding a new control e.g. mbw_min it will have to still be mbw_max that determines whether the
pretending occurs so the rules remain the same. If the L3 class supports mbw_max then it will always
back the MB resource and if the L3 class doesn't support mbw_max and it's a "L3 is NUMA" then if the
memory class supports mbw_max then the memory class backs MB. For the other cases MB can always be
backed by the L3 class and MB_NODE by the memory class. This for instance means that in, the
unlikely case of, an "L3 is NUMA" system which doesn't support mbw_max but supports mbw_min at the
memory class, then it will only every expose MIN at the MB_NODE resource, MB_MIN_NODE. I need to
revisit my patches exposing mbw_min to resctrl to make sure it never changes which class backs the
MB resource.

> 
>>> It sounds to me as though both resources would be able to concurrently support monitoring so
>>> resctrl can be expected to expose NODE scoped memory bandwidth monitoring events retrieved from
>>> the "memory MPAM class" and L3 scoped memory bandwidth monitoring events retrieved from the
>>> "L3 cache MPAM class"?
>>
>> Yes. Unless we are in a "L3 is NUMA" setup to expose memory bandwidth counters from a memory MPAM
>> class they would need to have node scope and they could co-exist with other memory bandwidth
>> counters at L3 scope.
> 
> It is starting to sound more and more that the new interfaces may result in user interface changes
> on MPAM systems?

No, we should definitely avoid the interface changing for the user (other than adding new things)
but please do call out if there is anything else that may cause that.

> 
> Apologies but I do not think the MPAM plan is clear to me.

No worries, I hope I've made things at a bit clearer but please carry on asking where things are
still murky.

>>> So far I've viewed support for monitoring events at different scope as "after multiple controls"
>>> work that the "CPU-less NUMA nodes" depends on but looks like it is needed sooner.
>>
>> Why do you think it needs to be sooner rather than just a next step? Is there some contradiction or
>> incompatibility I'm missing. I thought that the monitors would just remain unexposed to resctrl
>> until there is an interface.
> 
> No, you are not missing anything. My comment was based on my realization that the monitoring scope
> changes are needed by more systems than I originally thought.

Ok, yeah, all the MPAM MSC can have monitors and the ones at the memory bandwidth counters at the
memory are likely to be of particular interest.

Thanks,

Ben

> 
> Reinette

