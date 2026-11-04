Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791294;
	b=vtWdSbTId+brSElH2zvcKHnhJmPmKjund0u75aAwsTaX7YkFnN9r8Z2EOJmNZPJ+TvRN
	 jcXaBqO+fQq13Yft69yIzQ04mTDUN0Jd+aTdMAmrmQ2hBzu+tuxYXYlKD+dYah+k7ILeb
	 iHi1lrtEaDyPydV9u0/xTzIKtrvoczVGQ0bdmZG5+UsmjijVBSNTwBFnvH39Uf3tEln+Y
	 1PrGH18LyL52t1YWizdl+/ylkcSMVfx7lGREziaVRxK0xhHD0bkmqMWVJgU4UGQL/NShY
	 Bp5dKq6NY1eIKQ4V/ranr8de4RbWtdEXmxXnrGTDeV31iYBUAXJhlBTp1rRrkxWS9ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791294;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=u+foQgDZkWrHkKQBx0bvyWV25TtNNT4zfUBVT49zaP8=;
	b=UxyjwEXttNCh5uw5NiFh1xQW+oVDpIkNqBnQIoMkTcic1hEBZclJzOqJ+PQxmy8InK4R
	 07Do4bjAgS5RNag17mf6gvzUOqTWwRH2DBSmZIPK6MUwPShYqG4sqHTlPl9DhWpmN8z9b
	 Srg5SfYOQfJMCb6BGL0kOiS1Cu70TBfQArHFizuLjTY82s+IryF1UgIb76hY18xqU3oVC
	 VNxHNJnHvpxxIl0osVAqeN0oA+40ZU3AA02DIUZJLy0nXd/RKbtN9UKHOh68wDVcDHSqQ
	 v0puP0Qo0rO85wr/XCd+6jSf9he8w/yJcpNdlhTuYBU3ivRTxc8HYZE61h+an79KWCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b="PwyI9/9e";
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B6E606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B6E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=PwyI9/9e
Received: from [192.168.1.10] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id A8DDB20B7166;
	Wed,  4 Nov 2026 03:21:15 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A8DDB20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793791278;
	bh=u+foQgDZkWrHkKQBx0bvyWV25TtNNT4zfUBVT49zaP8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=PwyI9/9eBIlcYIEGJgioMFRBfJW+1zfgWp7hfPyi+uePu6rLPrZ2mePdxUWLqyUfU
	 Ty+s22sa0kTHr49CCc+KaGT8RgFWLGLJrnYX6gvD93AOUwyGdZAcGheCWHMciSofEQ
	 +D3Zpt5n0tPsU1Y652bkAiEUedd8lb2u7epaZm1k=
Message-ID: <439409ae-bd42-459e-9c0d-21fc5629f635@linux.microsoft.com>
Date: Wed, 4 Nov 2026 16:51:28 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
To: "Pandey, Radhey Shyam" <radheys@amd.com>, jassisinghbrar@gmail.com,
 michal.simek@amd.com, tanmay.shah@amd.com, saeed.nowshadi@amd.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ssengar@linux.microsoft.com, tgopinath@linux.microsoft.com,
 srivatsa@csail.mit.edu
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
 <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Radhey Shyam,

Thanks for reviewing this.

On 04-11-2026 11:23, Pandey, Radhey Shyam wrote:
> On 11/3/2026 11:50 AM, Prasanna Kumar T S M wrote:
>> On driver removal, the CPUHP_AP_ONLINE_DYN CPU hotplug state is removed
>> instead of the its actual state. This can leave the mailbox driver
>> callbacks dangling. Use the actual CPU hotplug state during driver
>> removal.
>>
>> Hotplug registration failures are also ignored, allowing probe to
>> succeed without the callbacks needed to enable interrupts on CPUs
>> brought online later.
>>
>> Fixes: 6ffb1635341be ("mailbox: zynqmp: handle SGI for shared IPI")
> 
> Nit - only first 12 characters of the SHA-1 ID are sufficient.

Sure, I will update.

> 
> Also describe the failure signature and how the error is reproduced.
> 
> 
>> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
>> ---
>>   drivers/mailbox/zynqmp-ipi-mailbox.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/ 
>> zynqmp-ipi-mailbox.c
>> index 42d2583e44ca..b0643ee75db0 100644
>> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
>> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
>> @@ -136,6 +136,7 @@ struct zynqmp_ipi_pdata {
>>       unsigned int method;
>>       u32 local_id;
>>       int virq_sgi;
>> +    enum cpuhp_state hp_state;
> 
> Warning: drivers/mailbox/zynqmp-ipi-mailbox.c:141 struct member 
> 'hp_state' not described in 'zynqmp_ipi_pdata'

I will update this in v2.

> 
>>       int num_mboxes;
>>       struct zynqmp_ipi_mbox ipi_mboxes[] __counted_by(num_mboxes);
>>   };
>> @@ -863,15 +864,22 @@ static int xlnx_mbox_init_sgi(struct 
>> platform_device *pdev,
>>       irq_set_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
>>       /* Setup function for the CPU hot-plug cases */
>> -    cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mailbox/sgi:starting",
>> -              xlnx_mbox_cpuhp_start, xlnx_mbox_cpuhp_down);
>> +    pdata->hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>> +              "mailbox/sgi:starting", xlnx_mbox_cpuhp_start,
> 
> what is :starting here ?

I used the existing string.

> 
>> +              xlnx_mbox_cpuhp_down);
>> +    if (pdata->hp_state < 0) {
>> +        irq_clear_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
>> +        free_percpu_irq(pdata->virq_sgi, &per_cpu_pdata);
>> +        irq_dispose_mapping(pdata->virq_sgi);
>> +        return pdata->hp_state;
> 
>   1. The new error path double-frees and then hits BUG().
> Please reconfirm.
> 
> zynqmp_ipi_probe() sets pdata->irq_type before calling 
> xlnx_mbox_init_sgi(), and its only error label runs
>    zynqmp_ipi_free_mboxes() → xlnx_mbox_cleanup_sgi() whenever irq_type 
> == IPI_IRQ_TYPE_SGI. So the new unwind runs, then the caller's unwind 
> repeats
>    irq_clear_status_flags(), free_percpu_irq() and 
> irq_dispose_mapping(). Before any of that, cleanup calls 
> cpuhp_remove_state(pdata->hp_state) with the negative errno still in the 
> field, and _cpuhp_remove_state_cpuslocked() opens with 
> BUG_ON(cpuhp_cb_check(state)), which rejects anything <= CPUHP_OFFLINE. 
> A failed hotplug registration now panics instead of failing probe.
> 

I will fix this in v2.

> 
>> +    }
>>       return ret;
>>   }
>>   static void xlnx_mbox_cleanup_sgi(struct zynqmp_ipi_pdata *pdata)
>>   {
>> -    cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
>> +    cpuhp_remove_state(pdata->hp_state);
>>       on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);

Thanks,
Prasanna Kumar
