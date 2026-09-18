Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB5B3876A1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740930; cv=none; b=B1jYPgEi398Tb3an6w3gYvL4/1n5bzjH1hBFz7fUK/Na5Pj1GHI1WZ8rn5L0DWvyPveROTYJnNpWzvNvf6QfkPoqK564T9bO9ZC5s19QovfGq9tO97cWB6G0jQx92D/FIp3zLIUfnFhC/kPT3BNygCX/hYk3rh70Wpuqmu8a65o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740930; c=relaxed/simple;
	bh=Sh6KgtQA7JqW8xAzFBw7sj89Paj3qp613tU3kW0Wuf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGdg6zBB+iHcezCRx/TEXww5i4HyMa2VSg+jgTncrflafzqHRk2yA7yDjUDGviNIR3FP0yMaH4EQmHl4l2t5A8354e2hYhL6R7bDDK6QA/qbsQkQIAhmiR/iy2Ok0A4rIvpxNslji9TjINE5Q+QD2FxQbw0xSJCHs1nMyaxWQyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BDDBtKw7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BDDBtKw7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEFA3168F;
	Fri, 18 Sep 2026 07:15:24 -0700 (PDT)
Received: from [10.41.4.144] (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78BC83F86C;
	Fri, 18 Sep 2026 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740928; bh=Sh6KgtQA7JqW8xAzFBw7sj89Paj3qp613tU3kW0Wuf4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BDDBtKw7cvqWJ1ClbeP3Z6jjwxU2R/V7fN8OGQMyWaJrpUeZLwaWnuGf3O0SNB+E2
	 TdTtcXhfYggvNWbgXzsLDY9Lc63+r3imQVLjZujAnTByCC8FsXbZMWkeinabcm4Nns
	 6+TlN7QdkiSQl3LGOfKy5eQ26q4B224XaKle+6EI=
Message-ID: <59d1947d-d3cd-4621-9377-b206afd18bd6@arm.com>
Date: Fri, 18 Sep 2026 16:15:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] firmware: smccc: lfa: Add auto_activate sysfs file
To: Nirmoy Das <nirmoyd@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Salman Nabi <salman.nabi@arm.com>,
 Vedashree Vidwans <vvidwans@nvidia.com>,
 Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, vsethi@nvidia.com,
 Varun Wadekar <vwadekar@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-6-andre.przywara@arm.com>
 <20260710140856.3323523-1-nirmoyd@nvidia.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260710140856.3323523-1-nirmoyd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nirmoy,

On 7/10/26 16:07, Nirmoy Das wrote:
> On Mon, 6 Jul 2026 15:44:45 +0200, Andre Przywara wrote:
> 
> Hi Andre,
> 
>> The Arm LFA spec places control over the actual activation process in
>> the hands of the non-secure host OS. An platform initiated interrupt or
>> notification signals the availability of an updateable firmware image,
>> but does not necessarily need to trigger it automatically.
>>
>> Add a sysfs control file that guards such automatic activation. If an
>> administrator wants to allow automatic platform initiated updates, they
>> can activate that by echoing a "1" into the auto_activate file in the
>> respective sysfs directory. Any incoming notification would then result
>> in the activation triggered.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/firmware/smccc/lfa_fw.c | 34 ++++++++++++++++++++++++++++++---
>>   1 file changed, 31 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> index 5b7f9b07f6c8..ce4f966db475 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -89,6 +89,7 @@ enum image_attr_names {
>>   	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
>>   	LFA_ATTR_ACTIVATE,
>>   	LFA_ATTR_CANCEL,
>> +	LFA_ATTR_AUTO_ACTIVATE,
>>   	LFA_ATTR_NR_IMAGES
>>   };
>>   
>> @@ -103,6 +104,7 @@ struct fw_image {
>>   	bool may_reset_cpu;
>>   	bool cpu_rendezvous;
>>   	bool cpu_rendezvous_forced;
>> +	bool auto_activate;
>>   	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
>>   };
>>   
>> @@ -550,6 +552,28 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
>>   	return count;
>>   }
>>   
>> +static ssize_t auto_activate_store(struct kobject *kobj,
>> +				   struct kobj_attribute *attr,
>> +				   const char *buf, size_t count)
>> +{
>> +	struct fw_image *image = kobj_to_fw_image(kobj);
>> +	int ret;
>> +
>> +	ret = kstrtobool(buf, &image->auto_activate);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t auto_activate_show(struct kobject *kobj,
>> +				  struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct fw_image *image = kobj_to_fw_image(kobj);
>> +
>> +	return sysfs_emit(buf, "%d\n", image->auto_activate);
>> +}
>> +
>>   static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
>>   	[LFA_ATTR_NAME]			= __ATTR_RO(name),
>>   	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
>> @@ -560,7 +584,8 @@ static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
>>   	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
>>   	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
>>   	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
>> -	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
>> +	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel),
>> +	[LFA_ATTR_AUTO_ACTIVATE]	= __ATTR_RW(auto_activate),
>>   };
>>   
>>   static void init_image_default_attrs(void)
>> @@ -631,6 +656,7 @@ static int update_fw_image_node(char *fw_uuid, int seq_id,
>>   	image->kobj.kset = lfa_kset;
>>   	image->image_name = image_name;
>>   	image->cpu_rendezvous_forced = true;
>> +	image->auto_activate = false;
> 
> Following up on our v2 discussion about the udev anchor after the
> SMCCC bus rework: I got a chance to try v3 on a real machine, and
> like the faux device in v2, the SMCCC bus device also works as the
> udev anchor:
> 
>    ACTION=="bind|change", SUBSYSTEM=="arm_smccc", KERNEL=="arm-smccc-lfa-*", \
>            RUN+="/usr/local/sbin/lfa-auto-activate"
> 
> Matching on "bind" instead of "add" worked better when I tried it,
> bind fires only after probe so /sys/firmware/lfa is already
> populated.

Ah, nice, thanks for staying on this!


> What is still missing is a notification when the image inventory
> changes at runtime. I tried the KOBJ_CHANGE approach from our v2
> discussion on top of v3, emitting from the SMCCC bus device after
> the image tree is refreshed, and it works: the same rule re-arms
> auto_activate when the event fires. What do you think about adding
> such a notification? I can send a patch on top once this series has
> landed,

I am not super excited about adding a global variable for the smccc bus 
device just for this, but it's not a showstopper either. Maybe just 
store the kobject we need?
In any case, can you please send a patch on top of v4 I just sent, maybe 
as a --in-reply-to to the cover letter? This would honour your 
contribution, and keep this patch close to the source and separate.

Cheers,
Andre


together with an example udev rule. This is what I tested:
> 
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -142,6 +142,7 @@
>   };
>   
>   static struct kset *lfa_kset;
> +static struct arm_smccc_device *lfa_sdev;
>   static struct workqueue_struct *fw_images_update_wq;
>   static struct work_struct fw_images_update_work;
>   static struct attribute *image_default_attrs[LFA_ATTR_NR_IMAGES + 1];
> @@ -229,6 +230,19 @@
>   
>   		delete_fw_image_node(image);
>   	}
> +
> +	/*
> +	 * Notify user space only after the firmware image tree has been
> +	 * fully reconciled, so that consumers reading /sys/firmware/lfa/
> +	 * see a settled inventory.
> +	 */
> +	if (lfa_sdev) {
> +		int ret = kobject_uevent(&lfa_sdev->dev.kobj, KOBJ_CHANGE);
> +
> +		if (ret)
> +			pr_warn("failed to send inventory change uevent: %d\n",
> +				ret);
> +	}
>   }
>   
>   static void set_image_flags(struct fw_image *image, int seq_id,
> @@ -925,6 +939,8 @@
>   	}
>   	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
>   
> +	lfa_sdev = sdev;
> +
>   	init_image_default_attrs();
>   	lfa_kset = kset_create_and_add("lfa", NULL, firmware_kobj);
>   	if (!lfa_kset) {
> @@ -966,6 +982,7 @@
>   	flush_workqueue(fw_images_update_wq);
>   	destroy_workqueue(fw_images_update_wq);
>   	clean_fw_images_tree();
> +	lfa_sdev = NULL;
>   	kset_unregister(lfa_kset);
>   }
> 
>>   	set_image_flags(image, seq_id, image_flags, reg_current_ver,
>>   			reg_pending_ver);
>>   	if (kobject_init_and_add(&image->kobj, &image_ktype, NULL,
>> @@ -700,7 +726,8 @@ static int update_fw_images_tree(void)
>>   
>>   /*
>>    * Go through all FW images in a loop and trigger activation
>> - * of all activatible and pending images.
>> + * of all activatible and pending images, but only if automatic
>> + * activation for that image is allowed.
>>    * We have to restart enumeration after every triggered activation,
>>    * since the firmware images might have changed during the activation.
>>    */
>> @@ -719,7 +746,8 @@ static int activate_pending_image(void)
>>   			continue; /* Invalid FW component */
>>   
>>   		update_fw_image_pending(image);
>> -		if (image->activation_capable && image->activation_pending) {
>> +		if (image->activation_capable && image->activation_pending &&
>> +		    image->auto_activate) {
>>   			found_pending = true;
>>   			break;
>>   		}
>> -- 
>> 2.43.0
> 
> Regards,
> Nirmoy

