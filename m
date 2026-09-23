Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD03043CEFE;
	Wed, 23 Sep 2026 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164034; cv=none; b=HmrznCts3dQz4vjJ4zGT+UmVvqaNeulCrCAEpa6/VlF58kzb0jbn9u4FRrfw0WLCzHxxwpQWbBlbCcJkex70324LkL+SKuFvVAwcmvdjVFdOvEmruFgj2aWYGaWR9tB9bCN+hIc4GpX1T9jzjKCJrX06eWgaTUeNDTz0Y7Ve9E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164034; c=relaxed/simple;
	bh=307wYJKvpGdWUXMXqEwGjZsNBE4CLWfkYtC2x0RgiSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfqMPi0I+WEgWUKHIgeKur5WRiW4G3HTlN7H3X3SLECEXSy1XfhwmnV1KRTKTaIHLIaMVWbCPwZl9JUJt120YEg/QPnzz0yG5NylNTH+uKdIYqFEHd5jIrSi5nuXsmz2BrLCwXbY5nSEhzVt9x3hJzAqMF5yo/ZKEGbtR+TKAdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JtNXBjGx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JtNXBjGx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2459152B;
	Wed, 23 Sep 2026 04:46:55 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D98CA3F86F;
	Wed, 23 Sep 2026 04:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790164019; bh=307wYJKvpGdWUXMXqEwGjZsNBE4CLWfkYtC2x0RgiSI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JtNXBjGxRQrJ+/btvW6YqORoehhF5D02a2R3lQhhfMhPqQgosqLCWR1QmL4kvI4ZT
	 GurVYlyLD0dZCooRSYU6BGXE3Prv9nqiXOu0EMzz3ifpJBb5UrexT/rLTfL2KET+PN
	 ZSCxB7OADd7/vmz/D0zoZIw8ILfiWlc91p+Lyo3A=
Message-ID: <1b87219a-dd52-4270-9127-ec68333ab814@arm.com>
Date: Wed, 23 Sep 2026 13:46:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] firmware: smccc: Add support for Live Firmware
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
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-3-andre.przywara@arm.com>
 <20260921-ubiquitous-brawny-hyena-ff6ee9@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260921-ubiquitous-brawny-hyena-ff6ee9@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sudeep,

many thanks for having a look!

On 9/21/26 17:32, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 04:11:05PM +0200, Andre Przywara wrote:
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
>>   drivers/firmware/smccc/lfa_fw.c | 766 ++++++++++++++++++++++++++++++++
>>   drivers/firmware/smccc/smccc.c  |   5 +
>>   include/linux/arm-smccc.h       |  15 +
>>   5 files changed, 797 insertions(+)
>>   create mode 100644 drivers/firmware/smccc/lfa_fw.c
>>
> 
> [...]
> 
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> new file mode 100644
>> index 0000000000000..7cf847e102d5a
>> --- /dev/null
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -0,0 +1,766 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 Arm Limited
> 
> 2026 ?

Does that really matter? The bulk of this was indeed written last year, 
and I think what counts is a) the license and b) the first appearance of 
the code, to fight prior art claims.
I can surely make it 2025-2026, but I wasn't aware that the kernel was 
typically involved in those updates...

> 
> [...]
> 
>> +
>> +/* A list of known GUIDs, to be shown in the "name" sysfs file. */
>> +static const struct fw_image_uuid {
>> +	const char *name;
>> +	const char *uuid;
>> +} fw_images_uuids[] = {
>> +	{
>> +		.name = "TF-A BL31 runtime",
>> +		.uuid = "47d4086d-4cfe-9846-9b95-2950cbbd5a00",
>> +	},
>> +	{
>> +		.name = "BL33 non-secure payload",
>> +		.uuid = "d6d0eea7-fcea-d54b-9782-9934f234b6e4",
>> +	},
>> +	{
>> +		.name = "TF-RMM",
> 
> Names must go as mentioned earlier. And won't the GET_INVENTORY provide
> you the list of UUIDs which IMO should eliminate the needs for such static
> information in the driver, no ?

Yes, I removed that whole array. And yes, the UUIDs come from the 
firmware, listing them here was just to tie the name to one firmware 
component: that array here was just used to match the just discovered 
UUID with an associated name.

>> +		.uuid = "6c0762a6-12f2-4b56-92cb-ba8f633606d9",
>> +	},
>> +};
>> +
> 
> [...]
> 
>> +static unsigned long get_nr_lfa_components(void)
>> +{
>> +	struct arm_smccc_1_2_regs reg = { 0 };
>> +
>> +	reg.a0 = ARM_SMCCC_LFA_GET_INFO;
>> +	reg.a1 = 0; /* lfa_info_selector = 0 */
>> +
> 
> 
> DEN0147, Section 2, also says that the caller must use LFA_FEATURES
> to ensure that every function other than LFA_VERSION and LFA_FEATURES is
> implemented before calling it. This driver defines the LFA_FEATURES
> function ID, but never invokes it before using GET_INFO, GET_INVENTORY,
> PRIME, ACTIVATE, and CANCEL.
> 
> Could probe query all five functions and reject the device if any function
> required by the driver is absent?

Yes, oddly enough the spec indeed says to verify all functions, I think 
other SMCCC specs make the core functions mandatory.
Added a check into probe().

>> +static ssize_t pending_version_show(struct kobject *kobj,
>> +				    struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct fw_image *image = kobj_to_fw_image(kobj);
>> +	struct arm_smccc_1_2_regs reg = { 0 };
>> +
>> +	/*
>> +	 * Similar to activation pending, this value can change following an
>> +	 * update, we need to retrieve fresh info instead of stale information.
>> +	 */
>> +	reg.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
>> +	reg.a1 = image->fw_seq_id;
>> +	arm_smccc_1_2_invoke(&reg, &reg);
>> +	if (reg.a0 == LFA_SUCCESS) {
>> +		if (reg.a5 != 0 && image->activation_pending) {
> 
> Why are you not testing/checking the activation_pending bit in the fresh
> reg.a3 value instead of the cached image flag?
> 
> Table 2.4.5 makes X5 valid according to the flags returned by the same
> LFA_GET_INVENTORY call.
> 
> If a component becomes pending after enumeration,reading pending_version
> before activation_pending will incorrectly return "N/A" despite the
> fresh call reporting a valid X5.
> 
> So, I think this needs fixing ?

Ah, yes, looks like it, thanks for catching this. The pending_version is 
a recent addition to the spec, so I think this was just overlooked.

>> +
>> +static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>> +{
>> +	struct arm_smccc_1_2_regs reg = { 0 };
>> +	int err;
>> +
>> +	reg.a0 = ARM_SMCCC_LFA_GET_VERSION;
>> +	arm_smccc_1_2_invoke(&reg, &reg);
> 
> Check if SMCCC >= v1.2 before using these functions.

Yes, good point, done.

>> +
>> +MODULE_DESCRIPTION("ARM Live Firmware Activation (LFA)");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
>> index 5ea3478be9d3c..d7cd01e5c92b8 100644
>> --- a/drivers/firmware/smccc/smccc.c
>> +++ b/drivers/firmware/smccc/smccc.c
>> @@ -94,6 +94,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>>   		.requires_smc   = false,
>>   		.device_name    = "arm-smccc-trng",
>>   	},
>> +	{
>> +		.func_id        = ARM_SMCCC_LFA_GET_VERSION,
>> +		.requires_smc   = false,
>> +		.device_name    = "arm-smccc-lfa",
>> +	},
>>   };
>>   
> 
> DEN0147, Section 2.1.2, says that the caller must determine that
> the SMCCC version is at least 1.2 before calling LFA_VERSION.  The generic
> SMCCC probing path only checks that a conduit exists before invoking this
> function ID. That could break our SMCCC bus logic. Assuming the firmware
> can cope up, it is always good to check the SMCCC version >=v1.2 in the
> probe which is not done currently.

So as said above, I am checking this in lfa_smccc_probe() now. If I get 
you right, then that's the right place to do? Or are you suggesting we 
should move that check into the SMCCC bus code? I think the version call 
is compliant with the SMCCC v1.0 calling convention, so should be safe 
to call in any case?

Cheers,
Andre
