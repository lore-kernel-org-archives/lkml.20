Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3672F493D48;
	Fri,  2 Oct 2026 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948270; cv=none; b=oseNfiZ/PeOijZo0NM4aBLNWdKebHFzqFmpXY4q+6anmGoXIDJHtnkPzagizNoLX/LCNf5PlRCcnYgPqAXg5UBaY/5bGlfr3rCDk4b0EPxtQWN1JBGNT1gVHhtQ3EvnQgoUcBLWxxXNyLVaMTjfCGDQhlahRlc7WNgswRsoTsNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948270; c=relaxed/simple;
	bh=gwlZA5XW07l9+TTi1JniezJYGGNz9ylLLm2mV2dTelk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AToEXriv5MCo3rCShOJ9UYUGK/rWjti20ACXqu2v6qOVz7YGQNNqqw1UveKDyI8qcFfS43XujsF3hhISAQQzSGoom5aejEwBFYC4Jw1wG3zgH2iLTqTTbsdwXIZgT7svzAao8LobtVnw4764/NcZlaVjWyMDdjrk+qRCwl3PxIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vHNgvmx9; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vHNgvmx9"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 350B7497;
	Fri,  2 Oct 2026 06:37:44 -0700 (PDT)
Received: from [10.57.55.104] (unknown [10.57.55.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A6463F85F;
	Fri,  2 Oct 2026 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790948267; bh=gwlZA5XW07l9+TTi1JniezJYGGNz9ylLLm2mV2dTelk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vHNgvmx9AqGWDVfBsgLcC6HIEBGPnXE/En5DZY4jr6GyRHem+0pGXkSeutcjtFNfm
	 cqJEW/C2WQDG0Cj2J+690qJr1NdEeY3PtBU+txiqKzBeN1xxXGaFxQdvujoHmQBipr
	 ZaLdYABRCYLseHrB+8gfJcO9a6x3FtDOwXgKRdbY=
Message-ID: <135e085a-68c0-4790-bad2-d87808d08e6f@arm.com>
Date: Fri, 2 Oct 2026 15:37:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] firmware: smccc: lfa: Register ACPI notification
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
 <20260918141112.2115555-5-andre.przywara@arm.com>
 <20260921-smiling-rare-salamander-6c442d@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260921-smiling-rare-salamander-6c442d@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sudeep,

On 9/21/26 18:04, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 04:11:07PM +0200, Andre Przywara wrote:
>> From: Vedashree Vidwans <vvidwans@nvidia.com>
>>
>> The Arm LFA spec describes an ACPI notification mechanism, where the
>> platform (firmware) can notify an LFA client about newly available
>> firmware imag updates ("pending images" in LFA terms).
>>
>> Add a faux device after discovering the existence of an LFA agent via
>> the SMCCC discovery mechnism, and use that device to check for the ACPI
>> notification description. Register this when one is provided.
>>
>> The notification just conveys the fact that at least one firmware image
>> has now a pending update, it doesn't say which, also there could be more
>> than one pending. Loop through all images to find every which needs to
>> be activated, and trigger the activation. We need to do this is a loop,
>> since an activation might change the number and the status of available
>> images.
>>
>> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
>> [Andre: convert from platform driver to smccc bus]
>> Signed-off-by: Andre Przywara <andre.przywar@arm.com>
>> ---
>>   drivers/firmware/smccc/lfa_fw.c | 122 +++++++++++++++++++++++++++++++-
>>   1 file changed, 121 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> index b6ce478d3fc01..bb89fffde6856 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -3,12 +3,14 @@
>>    * Copyright (C) 2025 Arm Limited
>>    */
>>   
>> +#include <linux/acpi.h>
>>   #include <linux/arm-smccc.h>
>>   #include <linux/arm-smccc-bus.h>
>>   #include <linux/array_size.h>
>>   #include <linux/delay.h>
>>   #include <linux/fs.h>
>>   #include <linux/init.h>
>> +#include <linux/kernel.h>
>>   #include <linux/kobject.h>
>>   #include <linux/ktime.h>
>>   #include <linux/list.h>
>> @@ -18,11 +20,13 @@
>>   #include <linux/stop_machine.h>
>>   #include <linux/string.h>
>>   #include <linux/sysfs.h>
>> +#include <linux/types.h>
>>   #include <linux/uuid.h>
>>   #include <linux/workqueue.h>
>>   
>>   #include <uapi/linux/psci.h>
>>   
>> +#define DRIVER_NAME	"ARM_LFA"
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "Arm LFA: " fmt
>>   
>> @@ -733,6 +737,112 @@ static int update_fw_images_tree(void)
>>   	return 0;
>>   }
>>   
>> +/*
>> + * Go through all FW images in a loop and trigger activation
>> + * of all activatible and pending images.
>> + * We have to restart enumeration after every triggered activation,
>> + * since the firmware images might have changed during the activation.
>> + */
>> +static int activate_pending_image(void)
>> +{
>> +	struct kobject *kobj;
>> +	bool found_pending = false;
>> +	struct fw_image *image;
>> +	int ret;
>> +
>> +	spin_lock(&lfa_kset->list_lock);
>> +	list_for_each_entry(kobj, &lfa_kset->list, entry) {
>> +		image = kobj_to_fw_image(kobj);
>> +
>> +		if (image->fw_seq_id == -1)
>> +			continue; /* Invalid FW component */
>> +
>> +		update_fw_image_pending(image);
>> +		if (image->activation_capable && image->activation_pending) {
>> +			found_pending = true;
>> +			break;
>> +		}
>> +	}
>> +	spin_unlock(&lfa_kset->list_lock);
>> +
>> +	if (!found_pending)
>> +		return -ENOENT;
>> +
>> +	ret = prime_fw_image(image);
>> +	if (ret)
>> +		return ret;
>>
>> +	ret = activate_fw_image(image);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pr_info("%s: automatic activation succeeded\n", get_image_name(image));
>> +
>> +	return 0;
>> +}
>> +
>> +#ifdef CONFIG_ACPI
>> +static void lfa_acpi_notify_handler(acpi_handle handle, u32 event, void *data)
>> +{
>> +	int ret;
>> +
> 
> DEN0147, Appendix "LFA updates", assigns notification value 0x80 to new
> LFA updates. The handler should ignore all events other than 0x80 before
> attempting automatic activation.

Ah, yeah, I missed that bit. Fixed now.

>> +	while (!(ret = activate_pending_image()))
>> +		;
> 
> Some timeout mechanism needed ? Otherwise can we loop for ever if there is
> a firmware bug ?

Yeah, that's a tricky one. The problem is that an activation could 
change the whole list of firmware components, so we cannot easily 
traverse over the existing list of components and just activate each one 
that is pending. So the idea was to just repeat this exercise with the 
updated list each time, which ideally should converge at some point.

But I see the problem, and it's not far fetched to imagine a component 
forgetting to clear its pending bit, which would lead to it being 
repeatedly activated.
So what I would propose is to create a separate list of UUIDs that 
should be activated, once the IRQ handler starts, then iterate over that 
list and activate each of them. That is definitely bounded, and would 
avoid any kind of infinite loop. If any component meanwhile becomes 
activate-able, that should trigger the interrupt handler later again, 
courtesy of the GIC's active+pending state. Not sure about the ACPI 
notification, though, do you know about the semantics of overlapping 
triggers?
In any case, that's a bit more code, and slightly less elegant, but I 
think worth it to avoid the infinite loop.

>> +
>> +	if (ret != -ENOENT)
>> +		pr_warn("notified image activation failed: %d\n", ret);
>> +}
>> +
>> +static int lfa_register_acpi(struct device *dev)
>> +{
>> +	struct acpi_device *acpi_dev;
>> +	acpi_handle handle;
>> +	acpi_status status;
>> +
>> +	acpi_dev = acpi_dev_get_first_match_dev("ARML0003", NULL, -1);
>> +	if (!acpi_dev)
>> +		return -ENODEV;
>> +	handle = acpi_device_handle(acpi_dev);
>> +	if (!handle) {
>> +		acpi_dev_put(acpi_dev);
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* Register notify handler that indicates LFA updates are available */
>> +	status = acpi_install_notify_handler(handle, ACPI_DEVICE_NOTIFY,
>> +					     lfa_acpi_notify_handler, NULL);
>> +	if (ACPI_FAILURE(status)) {
>> +		acpi_dev_put(acpi_dev);
>> +		return -EIO;
>> +	}
>> +
>> +	ACPI_COMPANION_SET(dev, acpi_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void lfa_remove_acpi(struct device *dev)
>> +{
>> +	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
>> +	acpi_handle handle = acpi_device_handle(acpi_dev);
>> +
>> +	if (handle)
>> +		acpi_remove_notify_handler(handle,
>> +					   ACPI_DEVICE_NOTIFY,
>> +					   lfa_acpi_notify_handler);
>> +	acpi_dev_put(acpi_dev);
>> +}
>> +#else	/* !CONFIG_ACPI */
>> +static int lfa_register_acpi(struct device *dev)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +static void lfa_remove_acpi(struct device *dev)
>> +{
>> +}
>> +#endif
>> +
>>   static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>>   {
>>   	struct arm_smccc_1_2_regs reg = { 0 };
>> @@ -769,11 +879,21 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>>   		destroy_workqueue(fw_images_update_wq);
>>   	}
>>   
> Looks like if update_fw_images_tree() failed, the kset and workqueue will be
> destroyed. The ACPI init below overwrites err, and both a successful
> registration and -ENODEV reach return 0(not sure if that is expected).
> Driver removal or a later notification or any activity will then use
> the destroyed global objects happily.

Yes, this misses the return err; now, which wasn't necessary before.

>> -	return err;
>> +	if (!acpi_disabled) {
>> +		err = lfa_register_acpi(&sdev->dev);
> 
> There is also no cleanup when lfa_register_acpi() returns another error after
> inventory setup succeeded. The probe needs some unwind path that returns
> the original enumeration error and releases the kset and workqueue on every
> later probe failure.

Ah, yeah, as this patch is extra, and both the main patch and this code 
evolved somewhat separately, this slipped through the cracks.
The solution is rather simple: just cleanup after an error is detected, 
this can even be shared with the DT interrupt code later.
Fixed now.

> How come the LLMs have not pointed out these issues
> already ? I see sashiko is unable to review this because of the way you have
> expressed the dependency. Or make SMCCC patches part of the series for review
> purposes.

Yes, I heard that Sashiko was about to fix that (but didn't yet?), and 
the SMCCC bus code was work in progress, changing every few days, so I 
didn't want to create confusion by prepending outdated patches. It seems 
like Aneesh's series is now queued, so I might just pick the two 
required two patches into this series, just for the sake of getting a 
Sashiko review.

Cheers,
Andre

