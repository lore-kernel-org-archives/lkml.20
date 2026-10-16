Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F6658E2AC;
	Fri, 16 Oct 2026 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172633; cv=none; b=VadxohE0jXR94CKGFRVl5A0vK8ueN4GYOdtOU8Z9rL+Sw1YdyE7semxY2FQpOkW/kvouClE/8WOAu0pAR07uq0HB8oI4A0RhtSkHgxDOGlO118FttsXd9Y0TQBfSf7v9NOoQsD/wl9aNoJH3XvvVDZxTkL+QQ2XD99tWFIQBHPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172633; c=relaxed/simple;
	bh=iLl+pZEoD2Vsymgc38jkD3tbsIaYo6YNMK9eLraqZMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYtdx9NelTUnkaFOKwHomBj6T5jeXLKWO17Bn5hMHhrU981kCll9zYDKNb5x0roHqVdjlB2ipmDaybUiR9UhJxmkM9TK5EQCjHl4fNhUVKSWnKODZoPg8lW0ViRURTyuI71gB6mehLA8y6cAJFpYa8H69/sB4EbO+PH8zVOEXuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jA7KvQmo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jA7KvQmo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 169781477;
	Fri, 16 Oct 2026 10:43:48 -0700 (PDT)
Received: from [10.33.8.90] (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E85B3F673;
	Fri, 16 Oct 2026 10:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792172631; bh=iLl+pZEoD2Vsymgc38jkD3tbsIaYo6YNMK9eLraqZMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jA7KvQmo55cG34trJ2QczQIf6ukIMrcQfZT+hQotxxN3MDeoUVoNziIwKQKL5/1OY
	 HbubVGGQn3wsxR9EB9HIQYoSTzc0z1Syi/nD/LsezMHuafcly2dQ7eKPzdZURbYnPP
	 D9YkjaC6a118pHx3GmiQdKlITd/xKeIs4RZl/oXY=
Message-ID: <b5f4bdca-28e8-4b66-853d-7a3dbbbdca07@arm.com>
Date: Fri, 16 Oct 2026 18:43:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] firmware: smccc: lfa: Register DT interrupt
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Salman Nabi
 <salman.nabi@arm.com>, Vedashree Vidwans <vvidwans@nvidia.com>,
 Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
 Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
 Varun Wadekar <vwadekar@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-7-andre.przywara@arm.com>
 <20260921-aloof-sympathetic-python-54aa7d@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260921-aloof-sympathetic-python-54aa7d@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

(sorry, forgot to send the reply earlier, that goes together with the 
ACPI reply)

On 9/21/26 18:09, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 04:11:09PM +0200, Andre Przywara wrote:
>> The Arm Live Firmware Activation spec describes an asynchronous
>> notification mechanism, where the platform can notify the host OS about
>> newly pending image updates.
>> In the absence of the ACPI notification mechanism also a simple
>> devicetree node can describe an interrupt.
>>
>> Add code to find the respective DT node and register the specified
>> interrupt, to trigger the activation if needed.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/firmware/smccc/lfa_fw.c | 39 +++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> index 7a55b4a6785d8..a23df331ffde9 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -16,6 +16,8 @@
>>   #include <linux/list.h>
>>   #include <linux/module.h>
>>   #include <linux/nmi.h>
>> +#include <linux/of.h>
>> +#include <linux/of_irq.h>
>>   #include <linux/psci.h>
>>   #include <linux/stop_machine.h>
>>   #include <linux/string.h>
>> @@ -871,6 +873,37 @@ static void lfa_remove_acpi(struct device *dev)
>>   }
>>   #endif
>>   
>> +static irqreturn_t lfa_irq_handler_thread(int irq, void *dev_id)
>> +{
>> +	int ret;
>> +
>> +	while (!(ret = activate_pending_image()))
>> +		;
> 
> Yet again trusting firmware too much!

Yes, same problem as with the ACPI patch, and will be fixed by the same 
new code.
>> +
>> +	if (ret != -ENOENT)
>> +		pr_warn("notified image activation failed: %d\n", ret);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int lfa_register_dt(struct device *dev)
>> +{
>> +	struct device_node *np;
>> +	unsigned int irq;
>> +
>> +	np = of_find_compatible_node(NULL, NULL, "arm,lfa");
>> +	if (!np)
>> +		return -ENODEV;
>> +
>> +	irq = irq_of_parse_and_map(np, 0);
>> +	of_node_put(np);
>> +	if (!irq)
>> +		return -ENODEV;
>> +
>> +	return devm_request_threaded_irq(dev, irq, NULL, lfa_irq_handler_thread,
>> +					 IRQF_COND_ONESHOT, NULL, NULL);
> 
> And where can I find free_irq() ? Yes devm_() can do that for you but how
> does that work with races around removal of device for example. I prefer
> to have free_irq() at the very beginning of lfa_remove().

OK, added that.

> 
>> +}
>> +
>>   static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>>   {
>>   	struct arm_smccc_1_2_regs reg = { 0 };
>> @@ -913,6 +946,12 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>>   			pr_info("registered LFA ACPI notification\n");
>>   		if (err != -ENODEV)
>>   			return err;
>> +	} else {
>> +		err = lfa_register_dt(&sdev->dev);
>> +		if (!err)
>> +			pr_info("registered LFA DT notification interrupt\n");
>> +		if (err != -ENODEV)
>> +			return err;
> 
> More code addition with absolutely no error handling 🙁.

Right, but fixed now by the same code that fixed the ACPI part.

Cheers,
Andre

> 
> 
>>   	}
>>   
>>   	return 0;
>> -- 
>> 2.43.0
>>
> 

