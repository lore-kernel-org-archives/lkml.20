Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D5131D362
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009594; cv=none; b=HLAojgUIfKwHBGyWeECPe1IM00PPTndYhm7kqAra0S5/JcKuu/crBCf9broWLAhUqzGUJbhCOEI/GGls4bK7RDrdOHhAgk4JAAnwfqF3z6oL6zM2AiQYaKpCdHLwhEm2SR1vrio8jjrKierK6ReEiuDU/hB8cHUhbBTHSv42uLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009594; c=relaxed/simple;
	bh=T7kBtrRhAZaTeK02UCCq1q23G79xKmKUFQ6zk4gMnq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5y/aLVkHCDLuhXvuHYRyiFUBpqVmvFP5NX0IbmKMNS5iL18iAOp22GZeHBIGbWDYsJItfbbT9XWWC2EKBazLJsUb2ywZgLVqPtufjI0irVAnB8Ge5g8a4sLMBlHKzFX6ha4envpkDSKbVf9Qit7Je45ptK9GTFVKB3FXFaK4mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uNTPhxwB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uNTPhxwB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED61719F0;
	Mon, 21 Sep 2026 09:53:06 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B17773F86C;
	Mon, 21 Sep 2026 09:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790009590; bh=T7kBtrRhAZaTeK02UCCq1q23G79xKmKUFQ6zk4gMnq0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uNTPhxwBnqNuuRfqdePLqPjgzzTE5oQ6mE23i96RqxcJSz9yU9hgpbOIv4Bs00IkL
	 YMNgySeDs6CN9PIadGPwEK5isxleq3hEn2/VSKKZiA+xfIPCM7AVTuNHoVozgiDfCe
	 six39kZcYnwe/zkI+qoMQErXjpYdcoJwVcF2kBU8=
Message-ID: <f9d97f42-bfa0-4862-8494-7769b929ea52@arm.com>
Date: Mon, 21 Sep 2026 17:53:07 +0100
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
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <46e62f37-37f0-4d8e-b869-b83a61cb611b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Reinette,

On 21/09/2026 17:06, Reinette Chatre wrote:
> Hi Ben,
> 
> On 9/21/26 3:22 AM, Ben Horgan wrote:
>> Hi Reinette,
>>
>> On 18/09/2026 23:47, Reinette Chatre wrote:
>>> Hi Ben,
>>>
>>> On 9/11/26 3:09 AM, Ben Horgan wrote:
>>>> Hi Reinette, Fenghua,
>>>>
>>>> A couple more thoughts on emulation.
>>>>
>>>> On 10/08/2026 16:53, Reinette Chatre wrote:
>>>>> On 8/9/26 7:55 PM, Fenghua Yu wrote:
>>>>>> On 8/3/26 22:26, Reinette Chatre wrote:
> 
> ...>>>>>  * @emulated_by:List of controls that emulate this control. When set the containing
>>>>>>  *              struct resctrl_ctrl is likely a legacy control and @emulated_by
>>>>>>  *              are the finer grained hardware controls used to back the legacy
>>>>>>  *              control. This emulation is hidden from user in schemata file when
>>>>>>  *              rdt_resource::ctrl_mode is RESCTRL_CTRL_MODE_LEGACY and
>>>>>>  *              exposed when rdt_resource::ctrl_mode is
>>>>>>  *              RESCTRL_CTRL_MODE_NATIVE.
>>>>>>  */
>>>>>> struct resctrl_ctrl {
>>>>>> ...
>>>>>>         struct list_head        emulated_by;
>>>>>> };
>>>>>>
>>>>>> Does this mean a legacy resctrl control can be emulated by a few
>>>>>> resctrl controls (which is stored in the list)?
>>>>>>
>>>>>> e.g. legacy MB control can be emulated by a few controls? I thought
>>>>>> "MB:" line is emulated by only one native control. e.g. "MB:" line
>>>>>> is emulated by "MB_NODE:" line.
>>>>>
>>>>> As Chenyu highlighted this is to support region-aware. 
>>>>>
>>>>> While I did originally suggest MB_NODE to emulate MB I learned from Ben just
>>>>> how troublesome this can be. I am still trying to untangle how MPAM MSC and
>>>>> AMD GLBE can be supported in this new interface. Could you please consider the
>>>>> most recent message on this topic:
>>>>> https://lore.kernel.org/lkml/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
>>>>
>>>> For the emulation of MB. I think in the case where the MPAM driver currently uses the memory class
>>>> to back it (single L3/single NUMA node) then it would be most correct for the MB control to become
>>>> MB_NODE_MAX when switching from legacy to native. As previously discussed, in the other case when MB
>>>> is backed by a cache class then I don't think it makes sense for MB_NODE to emulate MB.
>>>>
>>>> I'm wondering if it would be best to make the legacy/native switch a mount option (--native). By not
>>>> being resource specific it allows controls to move between resources where that is appropriate. A
>>>
>>> In the current design switching between legacy and native only involves changing which controls belonging
>>> to a resource are exposed to user space. No matter if legacy or native is active the controls remain
>>> associated with the same resource without ever changing the relationship between control and resource, nor
>>> changing the relationship between controls. Practically speaking: the info file hierarchy does not change.
>>>
>>> Moving controls between resources sounds like something entirely different and a significant new change.
>>>
>>> So far the model has been for the architecture driver to own and "build" the resources, their associated
>>> controls, and their control and monitoring domains. After the architecture establishes these relationships
>>> the data is shared with resctrl fs but architecture driver always owns it. Letting resctrl fs make adjustments
>>> to any of these relationships is unexpected to me. More so when this can change from mount to mount.
>>>
>>> Changing the "shape" of a system seems to be something that the architecture should own?
>>>
>>> Are you instead saying that resctrl should expose a node scoped control as that of a L3 scope control?
>>
>> The problem is that this already happens, for MPAM, in the degenerate case. This is the consequence
>> of allowing memory MSC to pretend to be L3 scoped MSC and so represented by the MB resource. This
>> only happens when there is a single L3 and a single NUMA node with no caches in between so that the
>> traffic at either end of the path is effectively equivalent and the scope for both is global as you
>> can't turn off the last CPU or the only NUMA node. In want of a better term, let's call this "L3 is
>> NUMA". These shenanigans are what lead to the complexity of having more that one MPAM class backing
>> a resource which we discuss at [1]. The need for the association is that, where possible, the memory
>> allocation and memory bandwidth counters are exposed to the user using the existing resctrl
>> interface and, as such, existing software will continue to work.
>>
>> What I was suggesting, is that in "native" mode we do away with any pretending. That is, memory MSC
>> always back resources with NODE scope even in the degenerate "L3 is NUMA" case. One benefit of this
>> is that the resctrl hierarchy can be more correct. I was about to write that a second benefit was
>> that if there is a L3 cache MPAM class and a memory MPAM class which both provide memory allocation
>> they could both be displayed in resctrl, MB and MB_NODE. The same consideration applies for memory
>> bandwidth counters. However, as the MPAM driver in the "L3 is NUMA" case, always chooses the L3 MPAM
>> class to back MB over other classes, the MPAM driver can just be extended to back MB_NODE with the
>> memory class that was not chosen. In this way it will works the same way as in the non-degenerate
>> cases and the same mechanism is in place for memory bandwidth counters.
>>
>> Hence, the only benefit would be a slightly closer description of the hardware in resctrl in the "L3
>> is NUMA" case. In performing this exercise of laying out my reasons for allowing the native/legacy
>> control to move things across resources  I see it is unnecessary and so the native/legacy switch
>> should, as per your proposal, *not* move controls between resources. Thank you for your patience.
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/0b0eef2d-ce3b-48c8-af08-5889e7396e4f@arm.com/
> 
> If I understand correctly an "L3 is NUMA" would be presented to user space as:
> 
> info/
> ├── MB/
> │   └── schemata/
> │       ├── MB/
> │       │   └── MB_L3_MAX/
> │       └── MB_L3_MIN/
> └── MB_NODE/
>     └── schemata/
>         ├── MB_NODE_MAX/
>         └── MB_NODE_MIN/
> 
> with the "MB" resource backed by the "L3 cache MPAM class" and the "MB_NODE" resource backed
> by the "memory MPAM class". Is this getting close?

In the case when there is an L3 cache MPAM class and a memory MPAM class both support memory
bandwidth allocation then yes. However, I don't know of systems like this today and this isn't
dependent on the "L3 is NUMA". If there are multiple L3 and multiple NUMA nodes you would still get
this structure. It just relies on both the L3 cache MPAM class and the memory MPAM class supporting
bandwidth allocation (mbw_max/mbw_min). The "L3 is NUMA" is all about pretending a memory MPAM class
is a L3 cache MPAM class so that it fits into the existing expectations of the resctrl interface.

> 
> It sounds to me as though both resources would be able to concurrently support monitoring so
> resctrl can be expected to expose NODE scoped memory bandwidth monitoring events retrieved from
> the "memory MPAM class" and L3 scoped memory bandwidth monitoring events retrieved from the
> "L3 cache MPAM class"?

Yes. Unless we are in a "L3 is NUMA" setup to expose memory bandwidth counters from a memory MPAM
class they would need to have node scope and they could co-exist with other memory bandwidth
counters at L3 scope.

> 
> So far I've viewed support for monitoring events at different scope as "after multiple controls"
> work that the "CPU-less NUMA nodes" depends on but looks like it is needed sooner.

Why do you think it needs to be sooner rather than just a next step? Is there some contradiction or
incompatibility I'm missing. I thought that the monitors would just remain unexposed to resctrl
until there is an interface.

> 
>>> I aimed to document how I understand the different scopes and how to communicate this to user space in: 
>>> 	https://lore.kernel.org/lkml/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
>>>
>>> Are you instead saying that MPAM plans to create a control that pretends to be for a node scoped resource
>>> but placed under the L3 scoped resource like below?
>>>
>>> info/
>>> └── MB/
>>>     └── schemata/
>>>         └── MB/
>>>             └── MB_NODE_MAX/
>>>
>>> Something like above does not follow the relationships that the hierarchy aims to communicate, which
>>> is that the resource has L3 scope.
>>
>> No.. I wasn't thinking of that.
>>
>>>
>>> If you are already considering scenarios where user space would need new mount options, would you
>>> perhaps consider instead some new command line parameter, similar to the existing "rdt=" ones that
>>> adjust how resources are exposed? With something like this MPAM driver can control which "shape"
>>> the system should have in resctrl.
>>
>>
>> Luckily, we don't need these. Out of interest, why is that consider mount options the last resort?
> In this case I asked about a command line parameter because I viewed the solution as needing MPAM driver to
> change how it describes the "shape" of the system to resctrl. Since this is something that needs to happen
> before resctrl fs is mounted a mount option did not seem practical to me. 
> 
> Speaking just in general about mount options I do think we need to take care how user space is expected
> to interact with the filesystem. Previously user space could query /proc/cpuinfo to determine which
> features are supported by the system and then mount resctrl fs based on that information. For example,
> the user queries /proc/cpuinfo whether CDP is supported and then knows which CDP related mount options
> can be used. New features no longer by default add flags to /proc/cpuinfo. The expectation is that
> users can mount resctrl fs, discover which features are supported, and directly interact with those features.
> Without knowing which features a system supports we should thus be careful that a new mount option does not
> mean that the user needs to mount resctrl fs, query what is supported, and then remount resctrl fs with
> mount options that enable the use of the new features. Please note that a mount fails when there is an
> unrecognized mount option.

Ok, thanks for the explanation.

Ben

> 
> Reinette
> 

