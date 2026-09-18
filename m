Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B07628FFF6;
	Fri, 18 Sep 2026 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722805; cv=none; b=ZodcOG820Ih/6Ka1akEmhEfi89YI51WGt67MZOKKK4p6oLHZRbA2D9mk2ViAwCBVIt8tRclUx0RpDvtcXoJIefdP1jEaVD9LayMiCsBh7wA/li6x6NiczsvdfeTr+mwPAs+4D6zrlRS+VGBE/tDnk+H1H087OcAm1Dv0abmXqk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722805; c=relaxed/simple;
	bh=HSN6OUcadQ6p48VplFqTC3qeegwFq6SbpF7S2rpGGbg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Oh3O2HOcfK3dy0nAqzThCrwV0cx5XCmJybFRRgzpZ9VRMKgEZZw7nIyDMKnXodxn8my+IdO+V4isZUEOejn2VraYpVxN04AZz0dhN0Ah9JV37uQh7doAAg7tPC8DrjKf4jIHss5XSjYRB5hsrior79h6BrRSJadARD3sOhWvVPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UiUs1nAk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UiUs1nAk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C70D9168F;
	Fri, 18 Sep 2026 02:13:19 -0700 (PDT)
Received: from [10.41.4.144] (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD1073F882;
	Fri, 18 Sep 2026 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789722803; bh=HSN6OUcadQ6p48VplFqTC3qeegwFq6SbpF7S2rpGGbg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=UiUs1nAknVTTZqJd6p1FKPJi36Cxru2zHT5tFAh9A9BueBYDI9fjsdcdK3j20Mgy1
	 KFlKccCWspaqDmbD6qtWVhyxoefAUxd7IBOtNM+OwvuIxsvd93D423qChlUE3nzCUN
	 NC+X+NenfPTFz/PoNrBwihSNdNaoFsH35vtZnCCU=
Message-ID: <84f0862c-5333-4d53-b882-79b8e4c362ed@arm.com>
Date: Fri, 18 Sep 2026 11:13:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 2/8] firmware: smccc: Add support for Live Firmware
 Activation (LFA)
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
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-3-andre.przywara@arm.com>
 <20260717-bipedal-courageous-alpaca-4fb54d@sudeepholla>
Content-Language: en-GB
In-Reply-To: <20260717-bipedal-courageous-alpaca-4fb54d@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sudeep,

On 7/17/26 11:03, Sudeep Holla wrote:
> On Mon, Jul 06, 2026 at 03:44:42PM +0200, Andre Przywara wrote:
>> From: Salman Nabi <salman.nabi@arm.com>
>>
>> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
>> activating firmware components without a reboot. Those components
>> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
>> usual way: via fwupd, FF-A or other secure storage methods, or via some
>> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
>> at system runtime, without requiring a reboot.
>> The specification covers the SMCCC interface to list and query available
>> components and eventually trigger the activation.
>>
>> Add a new directory under /sys/firmware to present firmware components
>> capable of live activation. Each of them is a directory under lfa/,
>> and is identified via its GUID. The activation will be triggered by echoing
>> "1" into the "activate" file:
>> ==========================================
>> /sys/firmware/lfa # ls -l . 6c*
>> .:
>> total 0
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4
>>
>> 6c0762a6-12f2-4b56-92cb-ba8f633606d9:
>> total 0
>> --w-------    1 0        0             4096 Jan 19 11:33 activate
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_capable
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_pending
>> --w-------    1 0        0             4096 Jan 19 11:33 cancel
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 cpu_rendezvous
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 current_version
>> -rw-r--r--    1 0        0             4096 Jan 19 11:33 force_cpu_rendezvous
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 may_reset_cpu
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 name
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 pending_version
>> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *
>> grep: activate: Permission denied
>> activation_capable:1
>> activation_pending:1
>> grep: cancel: Permission denied
>> cpu_rendezvous:1
>> current_version:0.0
>> force_cpu_rendezvous:1
>> may_reset_cpu:0
>> name:TF-RMM
>> pending_version:0.0
>> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activate
>> [ 2825.797871] Arm LFA: firmware activation succeeded.
>> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #
>> ==========================================
>>
>> [1] https://developer.arm.com/documentation/den0147/latest/
>>
>> Signed-off-by: Salman Nabi <salman.nabi@arm.com>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/firmware/smccc/Kconfig  |  10 +
>>   drivers/firmware/smccc/Makefile |   1 +
>>   drivers/firmware/smccc/lfa_fw.c | 725 ++++++++++++++++++++++++++++++++
>>   drivers/firmware/smccc/smccc.c  |   5 +
>>   include/linux/arm-smccc.h       |  15 +
>>   5 files changed, 756 insertions(+)
>>   create mode 100644 drivers/firmware/smccc/lfa_fw.c
>>
>> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
>> index 15e7466179a6..7fd646d515f8 100644
>> --- a/drivers/firmware/smccc/Kconfig
>> +++ b/drivers/firmware/smccc/Kconfig
>> @@ -23,3 +23,13 @@ config ARM_SMCCC_SOC_ID
>>   	help
>>   	  Include support for the SoC bus on the ARM SMCCC firmware based
>>   	  platforms providing some sysfs information about the SoC variant.
>> +
>> +config ARM_LFA
>> +	tristate "Arm Live Firmware activation support"
>> +	depends on HAVE_ARM_SMCCC_DISCOVERY && ARM64
>> +	default y
>> +	help
>> +	  Include support for triggering a Live Firmware Activation (LFA),
>> +	  which allows to upgrade certain firmware components without a reboot.
>> +	  This is described in the Arm DEN0147 specification, and relies on
>> +	  a firmware agent running in EL3.
>> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
>> index 68bbff1407b8..cddf2c460ab9 100644
>> --- a/drivers/firmware/smccc/Makefile
>> +++ b/drivers/firmware/smccc/Makefile
>> @@ -2,3 +2,4 @@
>>   #
>>   obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= bus.o smccc.o kvm_guest.o
>>   obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
>> +obj-$(CONFIG_ARM_LFA) += lfa_fw.o
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> new file mode 100644
>> index 000000000000..b333b1e28c0d
>> --- /dev/null
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -0,0 +1,725 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 Arm Limited
>> + */
>> +
>> +#include <linux/arm-smccc.h>
>> +#include <linux/arm-smccc-bus.h>
>> +#include <linux/array_size.h>
>> +#include <linux/fs.h>
>> +#include <linux/init.h>
>> +#include <linux/kobject.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/psci.h>
>> +#include <linux/stop_machine.h>
>> +#include <linux/string.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/uuid.h>
>> +#include <linux/workqueue.h>
>> +
>> +#include <uapi/linux/psci.h>
>> +
>> +#undef pr_fmt
>> +#define pr_fmt(fmt) "Arm LFA: " fmt
>> +
>> +/* CALL_AGAIN flags (returned by SMC) */
>> +#define LFA_PRIME_CALL_AGAIN		BIT(0)
>> +#define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
>> +
>> +/* LFA return values */
>> +#define LFA_SUCCESS			0
>> +#define LFA_NOT_SUPPORTED		1
>> +#define LFA_BUSY			2
>> +#define LFA_AUTH_ERROR			3
>> +#define LFA_NO_MEMORY			4
>> +#define LFA_CRITICAL_ERROR		5
>> +#define LFA_DEVICE_ERROR		6
>> +#define LFA_WRONG_STATE			7
>> +#define LFA_INVALID_PARAMETERS		8
>> +#define LFA_COMPONENT_WRONG_STATE	9
>> +#define LFA_INVALID_ADDRESS		10
>> +#define LFA_ACTIVATION_FAILED		11
>> +
>> +/*
>> + * Not error codes described by the spec, but used internally when
>> + * PRIME/ACTIVATE calls return with the CALL_AGAIN bit set.
>> + */
>> +#define LFA_TIMED_OUT			32
>> +#define LFA_CALL_AGAIN			33
>> +
> 
> Why do you need this if it is purely internal in the driver ?
> What is the guarantee that LFA spec doesn't use these in the future ?
> It shouldn't be big problem, but I do expect things may get bit complicated
> during transition to a firmware version may start using it.

Yeah, I don't like it either ;-)
I now reworked the error numbers, so i switch to Linux errno numbers 
earlier, which means I can use -ETIMEDOUT and -EAGAIN here, and can 
avoid inventing artifical numbers. So those definitions just go away.
>> +#define LFA_ERROR_STRING(name) \
>> +	[name] = #name
>> +
>> +static const char * const lfa_error_strings[] = {
>> +	LFA_ERROR_STRING(LFA_SUCCESS),
>> +	LFA_ERROR_STRING(LFA_NOT_SUPPORTED),
>> +	LFA_ERROR_STRING(LFA_BUSY),
>> +	LFA_ERROR_STRING(LFA_AUTH_ERROR),
>> +	LFA_ERROR_STRING(LFA_NO_MEMORY),
>> +	LFA_ERROR_STRING(LFA_CRITICAL_ERROR),
>> +	LFA_ERROR_STRING(LFA_DEVICE_ERROR),
>> +	LFA_ERROR_STRING(LFA_WRONG_STATE),
>> +	LFA_ERROR_STRING(LFA_INVALID_PARAMETERS),
>> +	LFA_ERROR_STRING(LFA_COMPONENT_WRONG_STATE),
>> +	LFA_ERROR_STRING(LFA_INVALID_ADDRESS),
>> +	LFA_ERROR_STRING(LFA_ACTIVATION_FAILED)
>> +};
>> +
>> +enum image_attr_names {
>> +	LFA_ATTR_NAME,
>> +	LFA_ATTR_CURRENT_VERSION,
>> +	LFA_ATTR_PENDING_VERSION,
>> +	LFA_ATTR_ACT_CAPABLE,
>> +	LFA_ATTR_ACT_PENDING,
>> +	LFA_ATTR_MAY_RESET_CPU,
>> +	LFA_ATTR_CPU_RENDEZVOUS,
>> +	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
>> +	LFA_ATTR_ACTIVATE,
>> +	LFA_ATTR_CANCEL,
>> +	LFA_ATTR_NR_IMAGES
>> +};
>> +
>> +struct fw_image {
>> +	struct kobject kobj;
>> +	const char *image_name;
>> +	int fw_seq_id;
>> +	u64 current_version;
>> +	u64 pending_version;
>> +	bool activation_capable;
>> +	bool activation_pending;
>> +	bool may_reset_cpu;
>> +	bool cpu_rendezvous;
>> +	bool cpu_rendezvous_forced;
>> +	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
>> +};
>> +
>> +static struct fw_image *kobj_to_fw_image(struct kobject *kobj)
>> +{
>> +	return container_of(kobj, struct fw_image, kobj);
>> +}
>> +
>> +/* A UUID split over two 64-bit registers */
>> +struct uuid_regs {
>> +	u64 uuid_lo;
>> +	u64 uuid_hi;
>> +};
>> +
>> +/* A list of known GUIDs, to be shown in the "name" sysfs file. */
>> +static const struct fw_image_uuid {
>> +	const char *name;
>> +	const char *uuid;
>> +} fw_images_uuids[] = {
>> +	{
>> +		.name = "TF-A BL31 runtime",
> 
> This doesn't make any sense to me. Why do you want kernel to assign
> some random name base on UUID. Userspace is well place to deal with
> UUID and give it any fancy name it wants.

Well, the whole interface is quite usable without any accompanying user 
space tools, so just from the shell, but then identifying  firmware 
components by their GUID becomes a major pain and leaves users 
completely clueless.
And while we indeed will never be able to fully catch up with all the 
firmwares out there, especially not with vendor specific ones, there are 
some standard firmware components that I think warrant some name.
TF-A BL31 above (and TF-RMM) are good examples: these GUID is already in 
the mainline repository, and since BL31 is also an LFA agent, it's quite 
likely we encounter this component. Even when vendors typically use 
downstream TF-A ports, those GUIDs would stay the same.
So yes, it's more opportunistic than complete, but I think it would help 
to identify at least those well-known firmwares. Anything not named then 
would use the GUID, and can indeed be resolved by (a yet-to-be-written) 
userspace component.

> 
> [...]
> 
>> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
>> index 4de81848fe2e..956a5af96c70 100644
>> --- a/include/linux/arm-smccc.h
>> +++ b/include/linux/arm-smccc.h
>> @@ -304,6 +304,21 @@
>>   			   ARM_SMCCC_OWNER_STANDARD,		\
>>   			   0x53)
>>   
>> +/* Live Firmware Activation (LFA) calls (defined by ARM DEN0147) */
>> +#define ARM_SMCCC_LFA_FN_BASE					\
>> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
>> +			   ARM_SMCCC_SMC_64,			\
>> +			   ARM_SMCCC_OWNER_STANDARD,		\
>> +			   0x2e0)
>> +#define ARM_SMCCC_LFA_FN(n)		(ARM_SMCCC_LFA_FN_BASE + (n))
>> +#define ARM_SMCCC_LFA_GET_VERSION	ARM_SMCCC_LFA_FN(0)
>> +#define ARM_SMCCC_LFA_CHECK_FEATURE	ARM_SMCCC_LFA_FN(1)
>> +#define ARM_SMCCC_LFA_GET_INFO		ARM_SMCCC_LFA_FN(2)
>> +#define ARM_SMCCC_LFA_GET_INVENTORY	ARM_SMCCC_LFA_FN(3)
>> +#define ARM_SMCCC_LFA_PRIME		ARM_SMCCC_LFA_FN(4)
>> +#define ARM_SMCCC_LFA_ACTIVATE		ARM_SMCCC_LFA_FN(5)
>> +#define ARM_SMCCC_LFA_CANCEL		ARM_SMCCC_LFA_FN(6)
>> +
> 
> Do you expect these to be used outside of the driver(for now atleast) ?
> If not move it into the driver.

OK. I was under the impression that all SMCCC services would list their 
function IDs here, but that's probably only for those where we have 
multiple users (like TRNG in KVM and hw_random).
Moved them to the driver now.

Cheers,
Andre

> 
>>   /*
>>    * Return codes defined in ARM DEN 0070A
>>    * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
>> -- 
>> 2.43.0
>>
>>
> 

