Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB544F93AE;
	Fri, 18 Sep 2026 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745057; cv=none; b=eRYku3TFwfpbqbVS+IT4NTooKfcSh52XUm+CDv006az/tYs4peLfH26R1ehKo7jwBh8ZRk3MzkERcLaMcnvbCCtOfj/j8DhJ7kqCdxGnoWEvJ3Fj9xFiUIoGp7vwuhXrfmk9Fu3SnjNZHzfYtLvtlxOcHevCqAiNjg6brDNFU7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745057; c=relaxed/simple;
	bh=QEXJlDyXgTRNfVdIg/gcujnPjsSNgQiBcl0rt6qSV00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/qvKUv3hSiUSPHJ9WS2uifyehMdua7ISPWwlyX7uThzP1bWooANcQBpMfVEJnpVyUH09BLXRwZeroX0zGuqqWZC2F/UmipoRtXVWnyKTCxrr+sZnCs4QZw99X0IyrBMY2V5bS3fV2UI6S8b9ulwrOUFlVsniyIjvpmXmUH49Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LUToO6mp; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LUToO6mp"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9FD4168F;
	Fri, 18 Sep 2026 08:24:10 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7E983F7B4;
	Fri, 18 Sep 2026 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789745054; bh=QEXJlDyXgTRNfVdIg/gcujnPjsSNgQiBcl0rt6qSV00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUToO6mp3W4N1KlcxlP+mPUgIjMhAvfzvmzPpM1xE4XZ5vX8PMOX8Nsznc7gKHzZY
	 Q+iYMWHWb9xPbN/NpO+mdfBVOgiFihOmdstvAgzBxOKr/X2uwt7/70ulA5GQ1qbxTz
	 MV4R04acYq3ybAqiwyZIuk5Lko1s5S1P2aImmShc=
Date: Fri, 18 Sep 2026 16:24:09 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 2/8] firmware: smccc: Add support for Live Firmware
 Activation (LFA)
Message-ID: <aq1XmaBemuGybxp2@J2N7QTR9R3>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141112.2115555-3-andre.przywara@arm.com>

Hi Andre,

I have a bunch of comments below. Most of those are on the structure of
the kernel code; I haven't looked at LFA itself in detail, and so I
don't know how much sense that makes.

On Fri, Sep 18, 2026 at 04:11:05PM +0200, Andre Przywara wrote:
> From: Salman Nabi <salman.nabi@arm.com>
> 
> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
> activating firmware components without a reboot. Those components
> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
> usual way: via fwupd, FF-A or other secure storage methods, or via some
> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
> at system runtime, without requiring a reboot.
> The specification covers the SMCCC interface to list and query available
> components and eventually trigger the activation.

It'd be helpful to have a few basic concepts covered here or in the
code. For example, I have no idea what a "rendezvous" is, and it's not
at all obvious from the code.

> Add a new directory under /sys/firmware to present firmware components
> capable of live activation. Each of them is a directory under lfa/,
> and is identified via its GUID.

Nit: it's a UUID, not a GUID. Please use the term "UUID" consistently.

[...]

> +/* LFA return values */
> +#define LFA_SUCCESS			0
> +#define LFA_NOT_SUPPORTED		1
> +#define LFA_BUSY			2
> +#define LFA_AUTH_ERROR			3
> +#define LFA_NO_MEMORY			4
> +#define LFA_CRITICAL_ERROR		5
> +#define LFA_DEVICE_ERROR		6
> +#define LFA_WRONG_STATE			7
> +#define LFA_INVALID_PARAMETERS		8
> +#define LFA_COMPONENT_WRONG_STATE	9
> +#define LFA_INVALID_ADDRESS		10
> +#define LFA_ACTIVATION_FAILED		11

The spec has these as negative values, e.g. LFA_NOT_SUPPORTED is '-1'.

Other SMCCC specs (e.g. PSCI, FFA) follow that convention, and we match
that exactly in the Linux definitions, e.g.

| #define PSCI_RET_NOT_SUPPORTED                        -1

... and:

| #define FFA_RET_NOT_SUPPORTED      (-1)

Please do the same here. Match the spec, and update the code
accordingly. Doing differently is needlessly confusing and will lead to
bugs.

> +
> +#define LFA_ERROR_STRING(name) \
> +	[name] = #name
> +
> +static const char * const lfa_error_strings[] = {
> +	LFA_ERROR_STRING(LFA_SUCCESS),
> +	LFA_ERROR_STRING(LFA_NOT_SUPPORTED),
> +	LFA_ERROR_STRING(LFA_BUSY),
> +	LFA_ERROR_STRING(LFA_AUTH_ERROR),
> +	LFA_ERROR_STRING(LFA_NO_MEMORY),
> +	LFA_ERROR_STRING(LFA_CRITICAL_ERROR),
> +	LFA_ERROR_STRING(LFA_DEVICE_ERROR),
> +	LFA_ERROR_STRING(LFA_WRONG_STATE),
> +	LFA_ERROR_STRING(LFA_INVALID_PARAMETERS),
> +	LFA_ERROR_STRING(LFA_COMPONENT_WRONG_STATE),
> +	LFA_ERROR_STRING(LFA_INVALID_ADDRESS),
> +	LFA_ERROR_STRING(LFA_ACTIVATION_FAILED)
> +};

If you really need this, you can use a switch statement instead of an
array.

> +
> +static const char *lfa_error_string(long error)
> +{
> +	if (error > 0)
> +		return lfa_error_strings[LFA_SUCCESS];
> +
> +	error = -error;
> +	if (error < ARRAY_SIZE(lfa_error_strings))
> +		return lfa_error_strings[error];
> +
> +	return lfa_error_strings[LFA_DEVICE_ERROR];
> +}

Why map unknown errors to "LFA_DEVICE_ERROR" ?

Use a switch statement. Map unkown values to something like
"<UNKNOWN>". When you log a string, also log the numeric value in case
we don't have a string for that value e.g

	pr_info("LFA_FOO returned %d (%s), err, lfa_error_string(err));

> +
> +static const int lfa_error_map[] = {
> +	[LFA_SUCCESS]			= 0,
> +	[LFA_NOT_SUPPORTED]		= -EOPNOTSUPP,
> +	[LFA_BUSY]			= -EBUSY,
> +	[LFA_AUTH_ERROR]		= -EPERM,
> +	[LFA_NO_MEMORY]			= -ENOMEM,
> +	[LFA_CRITICAL_ERROR]		= -EACCES,
> +	[LFA_DEVICE_ERROR]		= -EIO,
> +	[LFA_WRONG_STATE]		= -EPROTO,
> +	[LFA_INVALID_PARAMETERS]	= -EINVAL,
> +	[LFA_COMPONENT_WRONG_STATE]	= -EPROTO,
> +	[LFA_INVALID_ADDRESS]		= -ENXIO,
> +	[LFA_ACTIVATION_FAILED]		= -EIO,
> +};
>
> +static int lfa_to_linux_errno(long lfa_error)
> +{
> +	if (lfa_error > 0)
> +		return -EINVAL;
> +
> +	if (-lfa_error > LFA_ACTIVATION_FAILED)
> +		return -EINVAL;
> +
> +	return lfa_error_map[-lfa_error];
> +}

Please use a switch statement as with psci_to_linux_errno(). 

That will handle negative values fine, and we can remove the unnecessary
negation I complained about above.

By construction that'll avoid a bunch of potential problems with using
an array (e.g. going out-of-bounds, failing to update bouns checks,
values in gaps being mapped to 0).

e.g. 

| static int lfa_to_linux_errono(long lfa_errno)
| {
| 	switch (lfa_errno) {
| 	case LFA_SUCCESS:
| 		return 0;
| 	case LFA_NOT_SUPPORTED:
| 		return -EOPNOTSUPP;
| 	...
| 	default:
| 		return -EINVAL;
| 	}
| }

> +
> +enum image_attr_names {
> +	LFA_ATTR_NAME,
> +	LFA_ATTR_CURRENT_VERSION,
> +	LFA_ATTR_PENDING_VERSION,
> +	LFA_ATTR_ACT_CAPABLE,
> +	LFA_ATTR_ACT_PENDING,
> +	LFA_ATTR_MAY_RESET_CPU,
> +	LFA_ATTR_CPU_RENDEZVOUS,
> +	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
> +	LFA_ATTR_ACTIVATE,
> +	LFA_ATTR_CANCEL,
> +	LFA_ATTR_NR_IMAGES
> +};
> +
> +struct fw_image {
> +	struct kobject kobj;
> +	const char *image_name;
> +	int fw_seq_id;
> +	u64 current_version;
> +	u64 pending_version;
> +	bool activation_capable;
> +	bool activation_pending;
> +	bool may_reset_cpu;
> +	bool cpu_rendezvous;
> +	bool cpu_rendezvous_forced;
> +	bool use_cpu_rendezvous;
> +	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
> +};
> +
> +static struct fw_image *kobj_to_fw_image(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct fw_image, kobj);
> +}
> +
> +/* A UUID split over two 64-bit registers */
> +struct uuid_regs {
> +	u64 uuid_lo;
> +	u64 uuid_hi;
> +};
> +
> +/* A list of known GUIDs, to be shown in the "name" sysfs file. */
> +static const struct fw_image_uuid {
> +	const char *name;
> +	const char *uuid;
> +} fw_images_uuids[] = {
> +	{
> +		.name = "TF-A BL31 runtime",
> +		.uuid = "47d4086d-4cfe-9846-9b95-2950cbbd5a00",
> +	},
> +	{
> +		.name = "BL33 non-secure payload",
> +		.uuid = "d6d0eea7-fcea-d54b-9782-9934f234b6e4",
> +	},
> +	{
> +		.name = "TF-RMM",
> +		.uuid = "6c0762a6-12f2-4b56-92cb-ba8f633606d9",
> +	},
> +};

As commented before, this has to go.

[...]

> +static void remove_invalid_fw_images(struct work_struct *work)
> +{
> +	struct kobject *kobj, *tmp;
> +	struct list_head images_to_delete = LIST_HEAD_INIT(images_to_delete);
> +
> +	/*
> +	 * Remove firmware images including directories that are no longer
> +	 * present in the LFA agent after updating the existing ones.
> +	 * Delete list images before calling kobject_del() and kobject_put() on
> +	 * them. Kobject_del() uses kset->list_lock itself which can cause lock
> +	 * recursion, and kobject_put() may sleep.
> +	 */

This is quite hard to parse.

In particular, the sentence starting "Delete list images" doesn't make
sense to me -- I think you're saying place those entries into "delete
list", but "Delete" at the start of the sentence reads as a verb.

> +	spin_lock(&lfa_kset->list_lock);
> +	list_for_each_entry_safe(kobj, tmp, &lfa_kset->list, entry) {
> +		struct fw_image *image = kobj_to_fw_image(kobj);
> +
> +		if (image->fw_seq_id == -1)
> +			list_move_tail(&kobj->entry, &images_to_delete);
> +	}
> +	spin_unlock(&lfa_kset->list_lock);
> +
> +	/*
> +	 * Now safely remove the sysfs kobjects for the deleted list items
> +	 */

Likewise, this comment is confusing.

> +	list_for_each_entry_safe(kobj, tmp, &images_to_delete, entry) {
> +		struct fw_image *image = kobj_to_fw_image(kobj);
> +
> +		delete_fw_image_node(image);
> +	}
> +}
> +
> +static void set_image_flags(struct fw_image *image, int seq_id,
> +			    u32 image_flags, u64 reg_current_ver,
> +			    u64 reg_pending_ver)
> +{
> +	image->fw_seq_id = seq_id;
> +	image->current_version = reg_current_ver;
> +	image->pending_version = reg_pending_ver;
> +	image->activation_capable = !!(image_flags & BIT(0));
> +	image->activation_pending = !!(image_flags & BIT(1));
> +	image->may_reset_cpu = !!(image_flags & BIT(2));
> +	/* cpu_rendezvous_optional bit has inverse logic in the spec */
> +	image->cpu_rendezvous = !(image_flags & BIT(3));
> +}
> +
> +static unsigned long get_nr_lfa_components(void)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };

Please use 'regs' to match the 'arm_smccc_1_2_regs' name.

Likewise for other instances.

> +
> +	reg.a0 = ARM_SMCCC_LFA_GET_INFO;
> +	reg.a1 = 0; /* lfa_info_selector = 0 */
> +
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 != LFA_SUCCESS)
> +		return reg.a0;
> +
> +	return reg.a1;
> +}
> +
> +static const char *get_image_name(const struct fw_image *image)
> +{
> +	if (image->image_name && image->image_name[0] != '\0')
> +		return image->image_name;
> +
> +	return kobject_name(&image->kobj);
> +}

As before, please just use the UUID.

I *assume* that we cannot have more than one image for a given
component, and hence we cannot have two entries for the same UUID? Is
that mandated by the LFA spec?

> +
> +static int lfa_cancel(void *data)
> +{
> +	struct fw_image *image = data;
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	reg.a0 = ARM_SMCCC_LFA_CANCEL;
> +	reg.a1 = image->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +
> +	/*
> +	 * When firmware activation is called with "skip_cpu_rendezvous=1",
> +	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
> +	 * cancelled.
> +	 */
> +	if (reg.a0 == LFA_SUCCESS) {
> +		pr_info("Activation cancelled for image %s\n",
> +			get_image_name(image));
> +	} else {
> +		pr_err("Activation not cancelled for image %s: %s\n",
> +		       get_image_name(image), lfa_error_string(reg.a0));
> +		return -EINVAL;
> +	}
> +
> +	return reg.a0;
> +}
> +
> +/*
> + * Try a single activation call. The smc_lock writer lock must be held,
> + * and it must be called from inside stop_machine() when CPU rendezvous is
> + * required.
> + * Returns a Linux error code, not an LFA one.
> + */
> +static int _lfa_activate(void *data)
> +{
> +	struct fw_image *image = data;
> +	struct arm_smccc_1_2_regs reg = { 0 }, res;

Elsewhere you used the same strucutre for input and output; why do you
need separate structures here?

> +
> +	reg.a0 = ARM_SMCCC_LFA_ACTIVATE;
> +	reg.a1 = image->fw_seq_id;
> +	/*
> +	 * As we do not support updates requiring a CPU reset (yet),
> +	 * we pass 0 in reg.a3 and reg.a4, holding the entry point and
> +	 * context ID respectively.
> +	 * Use the cached value of the rendezvous status, to be consistent
> +	 * with how we were called (via stop_machine() or not).
> +	 */
> +	reg.a2 = !image->use_cpu_rendezvous;

It is odd to have this comment in the middle of the set of parameters.

It'd be nicer to have:

	struct arm_smccc_1_2_regs regs = {
		/*
		 * One comment block for all the params.
		 */
		.a0 = ARM_SMCCC_LFA_ACTIVATE,
		.a1 = image->fw_seq_id,
		.a2 = !image->use_cpu_rendezvous,
		.a3 = 0, // entry point
		.a4 = 0, // context id
	};

> +	arm_smccc_1_2_invoke(&reg, &res);
> +
> +	if ((long)res.a0 < 0)
> +		return lfa_to_linux_errno((long)res.a0);
> +
> +	if (res.a1 & LFA_ACTIVATE_CALL_AGAIN)
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +
> +static int activate_fw_image(struct fw_image *image)
> +{
> +	int ret;
> +
> +retry:
> +	/*
> +	 * cpu_rendezvous_forced is set by the administrator, via sysfs,
> +	 * cpu_rendezvous is dictated by each firmware component.
> +	 */
> +	image->use_cpu_rendezvous = image->cpu_rendezvous_forced ||
> +				    image->cpu_rendezvous;
> +	if (image->use_cpu_rendezvous)
> +		ret = stop_machine(call_lfa_activate, image, cpu_online_mask);

What prevents cpu_online_mask changing under your feet here?

This looks odd given call_lfa_activate() doesn't seem to distinguish
secondaries from one another. Does LFA expect all callers to pass the
exact same arguments for a "rendezvous"?


> +	else
> +		ret = call_lfa_activate(image);
> +
> +	if (!ret) {
> +		update_fw_images_tree();
> +
> +		return 0;
> +	}

Odd whitespace here. There doesn't need to be a blank line before the
return.

> +
> +	/* SMC returned with call_again flag set, or with LFA_BUSY */
> +	if (ret == -EAGAIN || ret == -EBUSY)
> +		goto retry;

Should this be a do { ... } while (...) loop?

> +
> +	lfa_cancel(image);
> +
> +	pr_err("LFA_ACTIVATE for image %s failed\n", get_image_name(image));
> +
> +	return ret;
> +}
> +
> +static int prime_fw_image(struct fw_image *image)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 }, res;

Do you need separate input and output strutctures?

> +	int ret;
> +
> +	if (image->may_reset_cpu) {
> +		pr_err("CPU reset not supported by kernel driver\n");
> +
> +		return -EINVAL;
> +	}

Unnecessary newline again.

> +
> +	reg.a0 = ARM_SMCCC_LFA_PRIME;
> +retry:
> +	/*
> +	 * LFA_PRIME will return 1 in reg.a1 if the firmware priming
> +	 * is still in progress. In that case LFA_PRIME will need to
> +	 * be called again.
> +	 * reg.a1 will become 0 once the prime process completes.
> +	 */
> +	reg.a1 = image->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &res);
> +	if ((long)res.a0 < 0) {
> +		pr_err("LFA_PRIME for image %s failed: %s\n",
> +		       get_image_name(image),
> +		       lfa_error_string((long)res.a0));
> +
> +		return lfa_to_linux_errno((long)res.a0);
> +	}
> +
> +	if (res.a1 & LFA_PRIME_CALL_AGAIN)
> +		goto retry;

Should this be a loop?

> +
> +	return 0;
> +}

[...]

> +static ssize_t current_version_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct fw_image *image = kobj_to_fw_image(kobj);
> +	u32 maj, min;
> +
> +	maj = image->current_version >> 32;
> +	min = image->current_version & 0xffffffff;
> +

You can use upper_32_bits() and lower_32_bits() here.

> +	return sysfs_emit(buf, "%u.%u\n", maj, min);
> +}
> +
> +static ssize_t pending_version_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct fw_image *image = kobj_to_fw_image(kobj);
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	/*
> +	 * Similar to activation pending, this value can change following an
> +	 * update, we need to retrieve fresh info instead of stale information.
> +	 */
> +	reg.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
> +	reg.a1 = image->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 == LFA_SUCCESS) {
> +		if (reg.a5 != 0 && image->activation_pending) {
> +			u32 maj, min;
> +
> +			image->pending_version = reg.a5;
> +			maj = reg.a5 >> 32;
> +			min = reg.a5 & 0xffffffff;

You could use upper_32_bits() and lower_32_bits() here.

> +
> +			return sysfs_emit(buf, "%u.%u\n", maj, min);
> +		}
> +	}
> +
> +	return sysfs_emit(buf, "N/A\n");

Why a string rather than an error code?

[...]

> +static int lfa_smccc_probe(struct arm_smccc_device *sdev)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	int err;
> +
> +	reg.a0 = ARM_SMCCC_LFA_GET_VERSION;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if ((s32)reg.a0 == -LFA_NOT_SUPPORTED)
> +		return -ENODEV;
> +
> +	pr_info("Live Firmware Activation: detected v%ld.%ld\n",
> +		reg.a0 >> 16, reg.a0 & 0xffff);

You can use upper_16_bits() and lower_16_bits().

> +
> +	fw_images_update_wq = alloc_workqueue("fw_images_update_wq",
> +					      WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
> +	if (!fw_images_update_wq) {
> +		pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");
> +
> +		return -ENOMEM;
> +	}
> +	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
> +
> +	init_image_default_attrs();
> +	lfa_kset = kset_create_and_add("lfa", NULL, firmware_kobj);
> +	if (!lfa_kset) {
> +		destroy_workqueue(fw_images_update_wq);
> +
> +		return -ENOMEM;
> +	}
> +
> +	err = update_fw_images_tree();
> +	if (err != 0) {
> +		kset_unregister(lfa_kset);
> +		destroy_workqueue(fw_images_update_wq);
> +	}
> +
> +	return err;
> +}

There was an interrupt in the binding, not detected or used here. What's
going on?

Mark.
