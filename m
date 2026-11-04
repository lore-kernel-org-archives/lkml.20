Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812904;
	b=Diu+1Bq9MN89QoAAbJCU1V7t7zNJ+fvVJ8anLzDl7HEM1NoLO8rX3JM7Fs1nmXQCndsi
	 hwvm9QlI+PVcWZElUgTCsrJd0mIf/OjxROVnmLIW44BfJJf+dctdp8CtQxVbfH8Fj+XFX
	 SNZPONOtCXjJyA6xo0kOS832d0qWRSbWN1VKKEw4AD46zjaLqOqsuJpJGthlVaJfG8BuT
	 ALMashWqVWW0EvkulEMduY8d6Reweh6ne5y3AIFkUgfFmv4DAIVwxRt8ctMpS/I8fI8rA
	 RSiZyFY5EjiycJz0FB/NJKu8/H3jOAXv+4jVPPkMBwmJ0FHRGbP7Du1gGkYkQrcBVuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812904;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=08rccn60fEOYc981H9C1ltNpnqL6fJwW23BZtUgvjTE=;
	b=g5h0Le5OiS3unK8ADwayFcb4MpYwGevMPyMVfjLd1Z7kB23svAuY8CVSXEEC6P6cuTxE
	 Zgz+WppMRrVtmCJ3k5IjsyDjYNXDo7HfGZbPDp2jyWXhW29PE5BdNbjOya0YMYhJP0FVI
	 Myx4GEaLbZpVp/tUZmOoh/8nDlfz9Q6P/2nGHn7ba01/Rkze9kGGVTOs5MTmaHz71DV/s
	 hUbaD8wPunJiwyzSOAaLQP4/6dOGSoUD7R8oWvbXUU1y3Je/OW8GMLgyf7d4a0NQ0vkHv
	 VPuObmtF21ctDPyQ5En07PfVwL65OeSx1BBVzqwEvvxGOk9hXpm5WkjI6+/YKLz3r5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Fwty6efh;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B8F606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B8F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Fwty6efh
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E2301BB0;
	Wed,  4 Nov 2026 09:21:40 -0800 (PST)
Received: from [10.57.90.115] (unknown [10.57.90.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CF5A3F673;
	Wed,  4 Nov 2026 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793812903; bh=SrqOHDbmlFGl5iJGPMkhsoS6OaPeU5qzTVxZubmsEOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fwty6efh0ml2t0oFiC9NHJQBOIP9Z2//15K9Gi44mqkE4wOlF23vPnQ+bb15z5d4k
	 4xOw2LHT54TLHhxBLFB/bz3Ukf7pdGT8JmPYKXsB4AE4WveGvGeNtMPfldE/IpaPHI
	 D0VuvEGncIDo7VYX4F14d494BWAEZ1FgiK+Fv+28=
Message-ID: <09b353d2-3615-4462-abe1-8e3c5a992a67@arm.com>
Date: Wed, 4 Nov 2026 17:21:39 +0000
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
Subject: Re: [PATCH 09/10] irqchip/gic-v5: Clean the allocated linear device
 table size
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-9-743b61626fc5@arm.com>
 <auiiK0ksqPMbHAmX@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <auiiK0ksqPMbHAmX@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2026 14:46, Lorenzo Pieralisi wrote:
> On Mon, Nov 02, 2026 at 01:33:02PM +0000, Sascha Bischoff wrote:
>> When the linear device table exceeds the kmalloc limit, the driver
>> caps the DeviceID width before allocation but keeps the original size
>> for cache maintenance. On a noncoherent ITS, this cleans beyond the
>> allocated table.
>>
>> Recalculate the size after capping the DeviceID width.
>>
>> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> ---
>>   drivers/irqchip/irq-gic-v5-its.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
>> index 4de07bbdc4923..c0f3982229194 100644
>> --- a/drivers/irqchip/irq-gic-v5-its.c
>> +++ b/drivers/irqchip/irq-gic-v5-its.c
>> @@ -601,6 +601,7 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
>>   		pr_warn("Limiting device ID bits from %u to %u\n",
>>   			device_id_bits, device_id_cap);
>>   		device_id_bits = device_id_cap;
>> +		sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
>>   	}
>>   
> 
> Or sz = KMALLOC_MAX_SIZE;
> 
> that's what we are doing after all.
> 
> I wonder whether moving:
> 
> sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
> 
> after the capping out of the if and do:
> 
> if (BIT_ULL(device_id_bits) * sizeof(*devtab) > KMALLOC_MAX_SIZE)
> 
> to check whether mem alloc should be capped makes this any easier
> to read.
> 
> Regardless, this patch is a fix and it is right to make it as small
> as possible:
> 
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 

I've reworked this a bit to make it clearer. Hence, I've left off your 
Acked-by tag on v2. I hope that's OK!

Thanks,
Sascha

>>   	devtab = kcalloc(BIT(device_id_bits), sizeof(*devtab), GFP_KERNEL);
>>
>> -- 
>> 2.34.1
>>

