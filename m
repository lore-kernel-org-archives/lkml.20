Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813854;
	b=Z84S0ykAmiRGpCBDpKj24+qnQLlq2axUAHAfcvhKo3Mc4IAXqfc0UsV84Nf7iTvitfwk
	 VBS6+CyubQSjhtERE5nEVPBPBLogUyh+4xGkpCf96yBdjLh39S0Bb3WsX2nG2nPkjX3zb
	 U3TyMBoxhiDgKqcWBnlu7p+oDExSQMPJqC/+BAGbJpckzgFIFQmh3kTkX+baPuWZvrnrM
	 xlLkMgJWF1OrmWFFp8GIbk4YzVKUr2gAc1foO80mBi1+iXqNJ3Uqzq8L8nGxGuSOQzKwF
	 hpgkunNOjb2kWiDw4mDp67AAjeeR9Ykh4cnJ/H65/kALt2K86D1BIGpSRCMAlud93ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813854;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=sVm5vm53TcuuiHKOjBSbO/ogRlTrTCzTLWf1Fg0Jk+M=;
	b=DgYPAk/HFAERtp1dcw/ZEUxr5a9WGutPJgX+5ey6OMW1u8X0UlTpxpX+TUiq9u+hE/z6
	 am6B0elkQj3/rbFPyiyWFZpGVeIjrIS4SbiBwchv0vBrzcGxdSIyr8/cpstXGfENWyFwc
	 ECJofUKdv2koF7B6uc9cVfACVJ0aXYngFBRDRpiu4jjNNwZ9pDJT8/MfUBxAvs4L+B37q
	 mXGn3b9pXIpfLxnGuWjGgjVmumrBh0PuGhqQ1QTEsKhjB6ytxgHhZZwzQjQJqb3oeM2+v
	 ZBinR5ySqQa2nGoPTeJH4tbOEdfKFGBq00bpsQEORq6obsqvSiU8uHa34xk02bYiXYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=f3KMWRYV;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C4D606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C4D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=f3KMWRYV
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EBD71BB2;
	Wed,  4 Nov 2026 09:37:30 -0800 (PST)
Received: from [10.57.90.115] (unknown [10.57.90.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F4203F673;
	Wed,  4 Nov 2026 09:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793813853; bh=FBb/TbKhVIoXQAmd1m4CKiunRWfUuceXTHGcjdsZEyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f3KMWRYV1SWzQkyLugtLAI/c/yVkDJFoo0FBPJWCCNqunjwaTJZv9YIFhry9sQReZ
	 JRCNFuz5tkzhe7L/UuGVwWe5P2DVL8shSKujBCwo0MzH8ibadvS1hHNL1S16G1MNHH
	 1OwhC3wXS4Eir2T7Pwe9p3CwjycllOaPL76mnxLk=
Message-ID: <e5ce1693-6f03-4a66-84da-7f64f48ef691@arm.com>
Date: Wed, 4 Nov 2026 17:37:29 +0000
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
Subject: Re: [PATCH 10/10] irqchip/gic-v5: Release ITS MMIO region on DT probe
 failure
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-10-743b61626fc5@arm.com>
 <auikDS0RE5E13z8I@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <auikDS0RE5E13z8I@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/11/2026 14:54, Lorenzo Pieralisi wrote:
> On Mon, Nov 02, 2026 at 01:33:03PM +0000, Sascha Bischoff wrote:
>> of_io_request_and_map() reserves the ITS configuration frame region.
>> If ITS initialisation fails after mapping it, the error path only
>> unmaps the registers and leaves the region reserved.
>>
>> Keep the resource description and release the region on that path.
>>
>> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> ---
>>   drivers/irqchip/irq-gic-v5-its.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
> 
> A minor note on coding style below, other than that:
> 
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>>
>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
>> index c0f3982229194..91abe63cb5cf9 100644
>> --- a/drivers/irqchip/irq-gic-v5-its.c
>> +++ b/drivers/irqchip/irq-gic-v5-its.c
>> @@ -1188,6 +1188,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
>>   
>>   static int __init gicv5_its_init(struct device_node *node)
>>   {
>> +	struct resource res;
> 
> FIR tree ordering.

Argh, yup. Missed that one when making this change. Fixed!

Thanks,
Sascha

> 
> https://docs.kernel.org/process/maintainer-tip.html
> 
>>   	void __iomem *its_base;
>>   	int ret, idx;
>>   
>> @@ -1197,6 +1198,11 @@ static int __init gicv5_its_init(struct device_node *node)
>>   		return -ENODEV;
>>   	}
>>   
>> +	/* Save the region to release if ITS setup fails after mapping it. */
>> +	ret = of_address_to_resource(node, idx, &res);
>> +	if (ret)
>> +		return ret;
>> +
>>   	its_base = of_io_request_and_map(node, idx, of_node_full_name(node));
>>   	if (IS_ERR(its_base)) {
>>   		pr_err("%pOF: unable to map GICv5 ITS_CONFIG_FRAME\n", node);
>> @@ -1213,6 +1219,7 @@ static int __init gicv5_its_init(struct device_node *node)
>>   
>>   out_unmap:
>>   	iounmap(its_base);
>> +	release_mem_region(res.start, resource_size(&res));
>>   	return ret;
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>

