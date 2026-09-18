Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473B43FE344
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732826; cv=none; b=oPfxCmbymwGHIJ/UkM93DZEGCCijstmdY0jzTVrBsniMq5Xnsijc2Nq77UViSTxIrCHu1CXBncJh1PQXDRfafQTRNU25gzT5FKbt7yJuHPjbGGa3UBjvt89IRsHqPws4iQbWnv+U0MQ2t6dzPTz645ofN2el9mE1g869ZYcodjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732826; c=relaxed/simple;
	bh=bM7kA5yXVpAe2N81reCqQxQTOv0RJe1wxSCWH8EsWr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpHzMkrUg4+ap1sIwfp7TGINED5uAOPv5F6wQUbYxYB8qoj3ImuZ72sN+wOfanpdGZMlMHChw5JCb59vzMdC4GLDKKMezNyxVfdCErvfyzZ6AqkBeYmiwGeShVDjxSA7y8b8bj0u5o4VXs22/UP1J2RqUr9bYQ0Msf+T1/t4jCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XkEDabmB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XkEDabmB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C284143D;
	Fri, 18 Sep 2026 05:00:20 -0700 (PDT)
Received: from [10.41.4.144] (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED1AB3F882;
	Fri, 18 Sep 2026 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789732823; bh=bM7kA5yXVpAe2N81reCqQxQTOv0RJe1wxSCWH8EsWr8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XkEDabmBheiCe+/LaTlra5Vgi0cko0/XOIWyrmpjZSq+2fx3JjNly9HRswxfFDJ8D
	 QCJkqQ9h5uNJ65tgfG+ovxBfylbiwy/IA/69AlPOrJoa+lPSPvIc5MQDXTTuKK9Mxp
	 fYBqHrIco/556kXQKvnR6cpLIs+1WlhFKgG1/pdo=
Message-ID: <830ad111-e819-43c2-b0a2-248e0542d7f2@arm.com>
Date: Fri, 18 Sep 2026 14:00:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] firmware: smccc: lfa: Add timeout and trigger
 watchdog
To: Nirmoy Das <nirmoyd@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Salman Nabi <salman.nabi@arm.com>,
 Vedashree Vidwans <vvidwans@nvidia.com>,
 Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, vsethi@nvidia.com,
 Varun Wadekar <vwadekar@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-4-andre.przywara@arm.com>
 <20260710100830.65336-1-nirmoyd@nvidia.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260710100830.65336-1-nirmoyd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 7/10/26 12:08, Nirmoy Das wrote:
> On Mon, 6 Jul 2026 15:44:43 +0200, Andre Przywara wrote:
> 
> Hi Andre,
> 
>> From: Vedashree Vidwans <vvidwans@nvidia.com>
>>
>> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
>> timeout mechanism. This update ensures that any potential hangs are
>> detected promptly and that the LFA process is allocated sufficient
>> execution time before the watchdog timer expires. These changes improve
>> overall system reliability by reducing the risk of undetected process
>> stalls and unexpected watchdog resets.
>>
>> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/firmware/smccc/lfa_fw.c | 43 ++++++++++++++++++++++++++++++---
>>   1 file changed, 39 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> index b333b1e28c0d..357e41f95206 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -6,11 +6,14 @@
>>   #include <linux/arm-smccc.h>
>>   #include <linux/arm-smccc-bus.h>
>>   #include <linux/array_size.h>
>> +#include <linux/delay.h>
>>   #include <linux/fs.h>
>>   #include <linux/init.h>
>>   #include <linux/kobject.h>
>> +#include <linux/ktime.h>
>>   #include <linux/list.h>
>>   #include <linux/module.h>
>> +#include <linux/nmi.h>
>>   #include <linux/psci.h>
>>   #include <linux/stop_machine.h>
>>   #include <linux/string.h>
>> @@ -27,6 +30,11 @@
>>   #define LFA_PRIME_CALL_AGAIN		BIT(0)
>>   #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
>>   
>> +#define LFA_PRIME_BUDGET_MS		30000		/* 30s cap */
>> +#define LFA_PRIME_DELAY_MS		10		/* 10ms between polls */
>> +#define LFA_ACTIVATE_BUDGET_MS		10000		/* 10s cap */
>> +#define LFA_ACTIVATE_DELAY_MS		10		/* 10ms between polls */
>> +
>>   /* LFA return values */
>>   #define LFA_SUCCESS			0
>>   #define LFA_NOT_SUPPORTED		1
>> @@ -276,6 +284,7 @@ static int call_lfa_activate(void *data)
>>   	struct fw_image *image = data;
>>   	struct arm_smccc_1_2_regs reg = { 0 }, res;
>>   
>> +	touch_nmi_watchdog();
>>   	reg.a0 = ARM_SMCCC_LFA_ACTIVATE;
>>   	reg.a1 = image->fw_seq_id;
>>   	/*
>> @@ -299,6 +308,7 @@ static int call_lfa_activate(void *data)
>>   
>>   static int activate_fw_image(struct fw_image *image)
>>   {
>> +	ktime_t end = ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
>>   	int ret;
>>   
>>   retry:
>> @@ -314,8 +324,14 @@ static int activate_fw_image(struct fw_image *image)
>>   	}
>>   
>>   	/* SMC returned with call_again flag set, or with LFA_BUSY */
>> -	if (ret == -LFA_CALL_AGAIN || ret == -LFA_BUSY)
>> -		goto retry;
>> +	if (ret == -LFA_CALL_AGAIN || ret == -LFA_BUSY) {
>> +		if (ktime_before(ktime_get(), end)) {
>> +			msleep_interruptible(LFA_ACTIVATE_DELAY_MS);
>> +			goto retry;
>> +		}
>> +
>> +		ret = -LFA_TIMED_OUT;
>> +	}
> 
> msleep_interruptible()'s return is ignored (here and in the PRIME
> loop), so a pending signal can turn this into premature retries.

Ah, thanks, that's a good point. I fixed that now. I don't think it 
really matters for the 10ms delay here, but it would break the outer 
timeout as well, which is a couple of seconds.

Cheers,
Andre

>>   
>>   	lfa_cancel(image);
>>   
>> @@ -328,6 +344,7 @@ static int activate_fw_image(struct fw_image *image)
>>   static int prime_fw_image(struct fw_image *image)
>>   {
>>   	struct arm_smccc_1_2_regs reg = { 0 }, res;
>> +	ktime_t end = ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
>>   
>>   	if (image->may_reset_cpu) {
>>   		pr_err("CPU reset not supported by kernel driver\n");
>> @@ -335,6 +352,8 @@ static int prime_fw_image(struct fw_image *image)
>>   		return -EINVAL;
>>   	}
>>   
>> +	touch_nmi_watchdog();
>> +
>>   	reg.a0 = ARM_SMCCC_LFA_PRIME;
>>   retry:
>>   	/*
>> @@ -353,8 +372,24 @@ static int prime_fw_image(struct fw_image *image)
>>   		return res.a0;
>>   	}
>>   
>> -	if (res.a1 & LFA_PRIME_CALL_AGAIN)
>> -		goto retry;
>> +	if (res.a1 & LFA_PRIME_CALL_AGAIN) {
>> +		int ret;
>> +
>> +		/* SMC returned with call_again flag set */
>> +		if (ktime_before(ktime_get(), end)) {
>> +			msleep_interruptible(LFA_PRIME_DELAY_MS);
>> +			goto retry;
>> +		}
>> +
>> +		pr_err("LFA_PRIME for image %s timed out",
>> +		       get_image_name(image));
>> +
>> +		ret = lfa_cancel(image);
>> +		if (ret != 0)
>> +			return ret;
>> +
>> +		return -ETIMEDOUT;
>> +	}
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.43.0
> 
> Regards,
> Nirmoy

