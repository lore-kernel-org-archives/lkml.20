Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08DD3CAA50
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121371; cv=none; b=pdEu4ydD5itDLX9cHDrXa6gzvxO8erw7kOa3ktSsnme7G3UOzd2tjfWrXZG0Tj/6Cq8cp2TH6/s/kHkmpQc8XVTeR595tjX/bI0pORtquahO/TQ5e7n6F5B3kOcLRiVok391XXtrh9izzWOPaNDVJI/QS2N08JVzZX8UU9wKDcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121371; c=relaxed/simple;
	bh=X35d2sCJ1bMzS/xHTowMNlqo73R5W1wzBnB8ogjZpqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kl6v64Fjn0Y0WypanHywq2MDUKh8Nfv8OE9GFqx+1xpuHRAPsDsjq/uXT7jZNJdUZQ5feqN0xwtAxU6J6PkltR32k0kMjgz/FTV/5yBP53yfnXCA3cPdw+p0h/OlLSU5JfY5HB7rK3iPCAxXGLpdXoyZLxGXfZl7DQ954FA+hHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sOIkc+/D; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sOIkc+/D"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BD991655;
	Fri, 11 Sep 2026 03:09:23 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58F8A3F7B4;
	Fri, 11 Sep 2026 03:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789121367; bh=X35d2sCJ1bMzS/xHTowMNlqo73R5W1wzBnB8ogjZpqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sOIkc+/DOWgnwU7l7WDtETNyCXHfZ2a/LqiWv6TxLJuOuOezEkOwH/FmHb4zlxG8/
	 rnMGqj0hE7NhTVnsiNFCo52W37p7SF+YMwf3OPDc6zAfmOiaJq0vEmd59y1r+ePDUA
	 7VEvs7t5WPDqK9fq8iWwBbkMgts/VLEtCCZAuRyg=
Message-ID: <3f39918f-91c0-4411-88d2-1ab1db3f12d8@arm.com>
Date: Fri, 11 Sep 2026 11:09:23 +0100
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
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <6cf3efa5-697f-476d-9f8b-0c97bebd706b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Reinette, Fenghua,

A couple more thoughts on emulation.

On 10/08/2026 16:53, Reinette Chatre wrote:
> Hi Fenghua,
> 
> On 8/9/26 7:55 PM, Fenghua Yu wrote:
>> On 8/3/26 22:26, Reinette Chatre wrote:
>> With minor MPAM changes, I can do simple tests on MPAM:
>> -               INIT_LIST_HEAD(&hw_ctrl->r_ctrl.emulated_by);
>> +               INIT_LIST_HEAD(&mpam_ctrl->r_ctrl.emulated_by);
>>
>> -               INIT_LIST_HEAD(&hw_ctrl->r_ctrl.emulated_by);
>> +               INIT_LIST_HEAD(&mpam_ctrl->r_ctrl.emulated_by);
>>
>> There is a branch resctrl/controls_rfc_v2.1. Seems no diff from controls_rfc_v2. Is either branch OK for base code?
> 
> hmmm ... branch resctrl/controls_rfc_v2.1 should have the change you note above
> and would be the right branch for you to use.
> That is the only difference with resctrl/controls_rfc_v2.
> 
>>
>>  * @emulated_by:List of controls that emulate this control. When set the containing
>>  *              struct resctrl_ctrl is likely a legacy control and @emulated_by
>>  *              are the finer grained hardware controls used to back the legacy
>>  *              control. This emulation is hidden from user in schemata file when
>>  *              rdt_resource::ctrl_mode is RESCTRL_CTRL_MODE_LEGACY and
>>  *              exposed when rdt_resource::ctrl_mode is
>>  *              RESCTRL_CTRL_MODE_NATIVE.
>>  */
>> struct resctrl_ctrl {
>> ...
>>         struct list_head        emulated_by;
>> };
>>
>> Does this mean a legacy resctrl control can be emulated by a few
>> resctrl controls (which is stored in the list)?
>>
>> e.g. legacy MB control can be emulated by a few controls? I thought
>> "MB:" line is emulated by only one native control. e.g. "MB:" line
>> is emulated by "MB_NODE:" line.
> 
> As Chenyu highlighted this is to support region-aware. 
> 
> While I did originally suggest MB_NODE to emulate MB I learned from Ben just
> how troublesome this can be. I am still trying to untangle how MPAM MSC and
> AMD GLBE can be supported in this new interface. Could you please consider the
> most recent message on this topic:
> https://lore.kernel.org/lkml/bccb1249-e722-451a-9c75-8aa846713045@intel.com/

For the emulation of MB. I think in the case where the MPAM driver currently uses the memory class
to back it (single L3/single NUMA node) then it would be most correct for the MB control to become
MB_NODE_MAX when switching from legacy to native. As previously discussed, in the other case when MB
is backed by a cache class then I don't think it makes sense for MB_NODE to emulate MB.

I'm wondering if it would be best to make the legacy/native switch a mount option (--native). By not
being resource specific it allows controls to move between resources where that is appropriate. A
mount option would also allow multiple user programs to interact with the schemata and size files
without worrying that the format would change under their feet. What do you think?

Thanks,

Ben

> 
> You can find more context in thread starting at
> https://lore.kernel.org/lkml/4ef15dde-2fbb-4763-93b6-4333b02d6859@arm.com/
> 
> Thank you very much.
> 
> Reinette

