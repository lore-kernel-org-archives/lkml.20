Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF5B4718E9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994361; cv=none; b=FS33zMD/42dKxivs8/1tthRuGzILKpDo0p7c3qFFs+1VktIJGxDWW+p6s2d2kKxAMBTVT0ja92wJ1uYy/Is3719ltwqCuRGMjuCIwzjEWumwp4ncfmPgNB9slZAvju1Q2RQSjIdXCm5ejptHYCJvV+g22x6vHEUYDW8OAwC/VD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994361; c=relaxed/simple;
	bh=5Lbhx6JBnNO5/RF3ECKwLNQ3548X6W4VlpUH5tW70Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5rgJCsBJTeGLdiMTZyqrwHzIMr1d8gdJB6eW16dTuwPpPmJvFJGehM9WLbPSR/W2GU1sePvRNclFOzvwJGKih7OeKT6Lv/dwbR2IbiNYvWqi8SSI4Qvu2+7vq1xyON9wGwVMiMlEzx+Hqi8+E+QhpV5kHepTnuOHpjRTPAqWdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ng8zSTmv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ng8zSTmv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D68D41595;
	Mon, 21 Sep 2026 05:39:07 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 857DD3F86C;
	Mon, 21 Sep 2026 05:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789994351; bh=5Lbhx6JBnNO5/RF3ECKwLNQ3548X6W4VlpUH5tW70Mk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ng8zSTmvcfVmk0lOTejir6GhScEYY4Gk37zoqBG3CZ9GWprzs/7Kadx5wrziP5LCd
	 Ksvh0nvBg+ycu6UXY9NTNtgPpCLYAeTa3xGXMTU4KjJjcXDBlsg/pQdbey8vQQXYus
	 0DdJPXDEnGTli2IODOlczSbbWzxWGWUubKkDp8D0=
Message-ID: <b85e2d57-13f2-4c24-b880-e6dde5a69a29@arm.com>
Date: Mon, 21 Sep 2026 13:39:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm_mpam: Only schedule mpam_enable work after first
 successful MSC probe
To: Yin Li <yin.li@oss.qualcomm.com>, "ping.li" <leeonion.muyu@gmail.com>,
 james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, reinette.chatre@intel.com,
 fenghuay@nvidia.com, Andre Przywara <andre.przywara@arm.com>
References: <20260818130646.663778-1-ping.li@horizon.auto>
 <20260908024846.2063161-1-ping.li@horizon.auto>
 <558c0816-604a-49b6-8843-66ea5df28d3e@arm.com>
 <5f3f2dba-17c0-49e6-a0cc-df92436d26e7@oss.qualcomm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <5f3f2dba-17c0-49e6-a0cc-df92436d26e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Yin,

On 17/09/2026 10:19, Yin Li wrote:
> 
> 
> On 9/10/2026 5:25 PM, Ben Horgan wrote:
>> Hi Ping,
>>
>> On 08/09/2026 03:48, ping.li wrote:
>>> From: Ping Li <leeonion.muyu@gmail.com>
>>>
>>> mpam_discovery_cpu_online() sets new_device_probed unconditionally after
>>> processing each reachable MSC. Once an MSC has already been probed
>>> (msc->probed is true), later CPUs sharing it skip
>>> mpam_msc_hw_probe() but still leave err at its default value of 0.
>>> As a result, new_device_probed is still set to true, causing
>>> mpam_enable_work to be scheduled again even though no new hardware was
>>> probed.
>>
>> This patch is an improvement but, thinking again, it looks there is scope getting rid of
>> mpam_enable() altogether. Rather than walking the list after each hw probe we could increment an
>> atomic variable, similar to what is done in mpam_msc_drv_probe(), and then just schedule
>> mpam_enable_once(). What do you think?
>>
> 
> Hi Ben,
> 
> Seeing another atomic-counter based sequencing mechanism in this patch reminded me of a similar
> issue I explored while working on MPAM DT support.
> 
> At the time, I experimented with removing the fw_num_msc pre-counting logic and moving the discovery
> callback registration to a late_initcall() stage. The motivation was to avoid separate DT/ACPI
> counting paths and allow discovery to proceed based on successfully probed MSCs.
> 
> However, I eventually dropped that approach because it relied on synchronous probing and would not
> behave correctly in deferred-probe or future asynchronous-probe scenarios.
> 
> That made me curious about the motivation behind this change:
>   - Is MPAM intentionally designed around the assumption that all firmware-described MSCs must probe
> successfully before discovery can proceed?

James wrote the code but here's how I see it. The important point of synchronization is for MPAM
enabling after the h/w probe rather than before discovery. This allows the number of usable PARTID
and PMG to be calculated and allows the ris/comp/class lists to be considered read only after this
point (except if MPAM is being disabled). For discovery I expect the MSC still be considered
independently. However, the synchronization is convenient at discovery as it allows for cpu hotplug
callbacks to do the initialisation, first for all MSC that have online affine CPUs and then as those
CPUs come online.

>   - Is the count-and-compare model primarily retained to guarantee correct ordering under deferred/
> asynchronous probing?

Deferred probing for the discovery will possibly be required for enabling interrupts with GICv5.

Thanks,

Ben

> 
> I'm not suggesting changing the implementation, just interested in understanding the design rationale.
> 
> Thanks,
> Yin
> 
> 
>> Thanks,
>>
>> Ben
>>
>>>
>>> Set new_device_probed only when mpam_msc_hw_probe() is called and
>>> succeeds.
>>>
>>> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Drop the Fixes: tag, as the extra mpam_enable() calls cause no real
>>>    harm: schedule_work() merges the duplicate work, and mpam_enable()
>>>    is a no-op until all MSCs have been probed. This is a cleanup, not a
>>>    bug fix.
>>>
>>>   drivers/resctrl/mpam_devices.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 2f09f4b78bd3..fefdcf588932 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -1866,13 +1866,15 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>>>               continue;
>>>             mutex_lock(&msc->probe_lock);
>>> -        if (!msc->probed)
>>> +        if (!msc->probed) {
>>>               err = mpam_msc_hw_probe(msc);
>>> +            if (!err)
>>> +                new_device_probed = true;
>>> +        }
>>>           mutex_unlock(&msc->probe_lock);
>>>             if (err)
>>>               break;
>>> -        new_device_probed = true;
>>>       }
>>>         if (new_device_probed && !err)
>>
> 

