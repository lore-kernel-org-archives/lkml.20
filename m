Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA7E46EF75
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986146; cv=none; b=E3s6pekptFs4BEF/smHWls6RJyqLMxhGZK3AWBfj66vVBeLQDG64hX85rxZpu7iOE2odNCnp0Gct4vjK5DGTY+QPPASjInM8HxIynotjaHIK5gfbe64re8r4iE6ZaOz6/MBkh8u7IlVbI7B9FR4EMSQY5696QEKz0230DhJFCe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986146; c=relaxed/simple;
	bh=ODZSExUO2jYS4Aa8JFvW4pav/cJ1RP56cjxn5Ad9FLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qxw9sfEw9Rrd/VwqOnD/o5FjtS1cT15gWJcx9aG5HL92Telu5SfKB23HMs5HEgqvX3v9sROerciInhQ0mTws8Fh2bjetSEtjXT5lHGvOi0Kcv+M0vQqDkG5PKvw9ZlvvJbThOcNJ9FzDNJGutMFi66NXE1YkrDQkCwvO5jjWpyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KYp9T4hm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KYp9T4hm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0DC919F0;
	Mon, 21 Sep 2026 03:22:20 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4421B3F86C;
	Mon, 21 Sep 2026 03:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789986144; bh=ODZSExUO2jYS4Aa8JFvW4pav/cJ1RP56cjxn5Ad9FLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KYp9T4hmIDZOM1kGbY+uRJDxXXK06qsaeLJUXRd7caBrnRo7wP27wV8efAGj/wevn
	 5Uy91qPOZXvFEDQ6wt+4Ss9AWS6lqU1292eXv1M+cui/hWXBy0CK89CBj7CfnpvZQI
	 /gx7XZPpmBRqLrh3WUf5rWE/cxBFvi5bdyQjl0cE=
Message-ID: <7ff818b9-77b9-4ac8-9132-98fec40ab0ac@arm.com>
Date: Mon, 21 Sep 2026 11:22:20 +0100
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
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <94cb1f7b-0b78-4aec-8d57-7ae7e547cf36@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Reinette,

On 18/09/2026 23:47, Reinette Chatre wrote:
> Hi Ben,
> 
> On 9/11/26 3:09 AM, Ben Horgan wrote:
>> Hi Reinette, Fenghua,
>>
>> A couple more thoughts on emulation.
>>
>> On 10/08/2026 16:53, Reinette Chatre wrote:
>>> Hi Fenghua,
>>>
>>> On 8/9/26 7:55 PM, Fenghua Yu wrote:
>>>> On 8/3/26 22:26, Reinette Chatre wrote:
>>>> With minor MPAM changes, I can do simple tests on MPAM:
>>>> -               INIT_LIST_HEAD(&hw_ctrl->r_ctrl.emulated_by);
>>>> +               INIT_LIST_HEAD(&mpam_ctrl->r_ctrl.emulated_by);
>>>>
>>>> -               INIT_LIST_HEAD(&hw_ctrl->r_ctrl.emulated_by);
>>>> +               INIT_LIST_HEAD(&mpam_ctrl->r_ctrl.emulated_by);
>>>>
>>>> There is a branch resctrl/controls_rfc_v2.1. Seems no diff from controls_rfc_v2. Is either branch OK for base code?
>>>
>>> hmmm ... branch resctrl/controls_rfc_v2.1 should have the change you note above
>>> and would be the right branch for you to use.
>>> That is the only difference with resctrl/controls_rfc_v2.
>>>
>>>>
>>>>  * @emulated_by:List of controls that emulate this control. When set the containing
>>>>  *              struct resctrl_ctrl is likely a legacy control and @emulated_by
>>>>  *              are the finer grained hardware controls used to back the legacy
>>>>  *              control. This emulation is hidden from user in schemata file when
>>>>  *              rdt_resource::ctrl_mode is RESCTRL_CTRL_MODE_LEGACY and
>>>>  *              exposed when rdt_resource::ctrl_mode is
>>>>  *              RESCTRL_CTRL_MODE_NATIVE.
>>>>  */
>>>> struct resctrl_ctrl {
>>>> ...
>>>>         struct list_head        emulated_by;
>>>> };
>>>>
>>>> Does this mean a legacy resctrl control can be emulated by a few
>>>> resctrl controls (which is stored in the list)?
>>>>
>>>> e.g. legacy MB control can be emulated by a few controls? I thought
>>>> "MB:" line is emulated by only one native control. e.g. "MB:" line
>>>> is emulated by "MB_NODE:" line.
>>>
>>> As Chenyu highlighted this is to support region-aware. 
>>>
>>> While I did originally suggest MB_NODE to emulate MB I learned from Ben just
>>> how troublesome this can be. I am still trying to untangle how MPAM MSC and
>>> AMD GLBE can be supported in this new interface. Could you please consider the
>>> most recent message on this topic:
>>> https://lore.kernel.org/lkml/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
>>
>> For the emulation of MB. I think in the case where the MPAM driver currently uses the memory class
>> to back it (single L3/single NUMA node) then it would be most correct for the MB control to become
>> MB_NODE_MAX when switching from legacy to native. As previously discussed, in the other case when MB
>> is backed by a cache class then I don't think it makes sense for MB_NODE to emulate MB.
>>
>> I'm wondering if it would be best to make the legacy/native switch a mount option (--native). By not
>> being resource specific it allows controls to move between resources where that is appropriate. A
> 
> In the current design switching between legacy and native only involves changing which controls belonging
> to a resource are exposed to user space. No matter if legacy or native is active the controls remain
> associated with the same resource without ever changing the relationship between control and resource, nor
> changing the relationship between controls. Practically speaking: the info file hierarchy does not change.
> 
> Moving controls between resources sounds like something entirely different and a significant new change.
> 
> So far the model has been for the architecture driver to own and "build" the resources, their associated
> controls, and their control and monitoring domains. After the architecture establishes these relationships
> the data is shared with resctrl fs but architecture driver always owns it. Letting resctrl fs make adjustments
> to any of these relationships is unexpected to me. More so when this can change from mount to mount.
> 
> Changing the "shape" of a system seems to be something that the architecture should own?
> 
> Are you instead saying that resctrl should expose a node scoped control as that of a L3 scope control?

The problem is that this already happens, for MPAM, in the degenerate case. This is the consequence
of allowing memory MSC to pretend to be L3 scoped MSC and so represented by the MB resource. This
only happens when there is a single L3 and a single NUMA node with no caches in between so that the
traffic at either end of the path is effectively equivalent and the scope for both is global as you
can't turn off the last CPU or the only NUMA node. In want of a better term, let's call this "L3 is
NUMA". These shenanigans are what lead to the complexity of having more that one MPAM class backing
a resource which we discuss at [1]. The need for the association is that, where possible, the memory
allocation and memory bandwidth counters are exposed to the user using the existing resctrl
interface and, as such, existing software will continue to work.

What I was suggesting, is that in "native" mode we do away with any pretending. That is, memory MSC
always back resources with NODE scope even in the degenerate "L3 is NUMA" case. One benefit of this
is that the resctrl hierarchy can be more correct. I was about to write that a second benefit was
that if there is a L3 cache MPAM class and a memory MPAM class which both provide memory allocation
they could both be displayed in resctrl, MB and MB_NODE. The same consideration applies for memory
bandwidth counters. However, as the MPAM driver in the "L3 is NUMA" case, always chooses the L3 MPAM
class to back MB over other classes, the MPAM driver can just be extended to back MB_NODE with the
memory class that was not chosen. In this way it will works the same way as in the non-degenerate
cases and the same mechanism is in place for memory bandwidth counters.

Hence, the only benefit would be a slightly closer description of the hardware in resctrl in the "L3
is NUMA" case. In performing this exercise of laying out my reasons for allowing the native/legacy
control to move things across resources  I see it is unnecessary and so the native/legacy switch
should, as per your proposal, *not* move controls between resources. Thank you for your patience.

[1] https://lore.kernel.org/linux-arm-kernel/0b0eef2d-ce3b-48c8-af08-5889e7396e4f@arm.com/

> 
> I aimed to document how I understand the different scopes and how to communicate this to user space in: 
> 	https://lore.kernel.org/lkml/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
> 
> Are you instead saying that MPAM plans to create a control that pretends to be for a node scoped resource
> but placed under the L3 scoped resource like below?
> 
> info/
> └── MB/
>     └── schemata/
>         └── MB/
>             └── MB_NODE_MAX/
> 
> Something like above does not follow the relationships that the hierarchy aims to communicate, which
> is that the resource has L3 scope.

No.. I wasn't thinking of that.

> 
> If you are already considering scenarios where user space would need new mount options, would you
> perhaps consider instead some new command line parameter, similar to the existing "rdt=" ones that
> adjust how resources are exposed? With something like this MPAM driver can control which "shape"
> the system should have in resctrl.


Luckily, we don't need these. Out of interest, why is that consider mount options the last resort?

Thanks,

Ben

>
> 
>> mount option would also allow multiple user programs to interact with the schemata and size files
>> without worrying that the format would change under their feet. What do you think?
> Reinette
> 
> 

