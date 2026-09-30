Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984953ACEFB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745004; cv=none; b=gGB8QXY1/46T31STSHlkJ3zc0A+csOrQXdx+Mstk3xYETufNIlXPAWsCuuW5ggZDoRo6Wr9ry5p/ywo84jqLlBqhs2DkuNniZoC03jT+N6W/FCjOxjaIiYxo4J4LoGOAzIcomi4X4+A3HPck32A9gZzIrq0rQma7ywNkH8lP1M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745004; c=relaxed/simple;
	bh=njaPmYQiYMnynRy6Bo78DU6/b6J8O1j5Jz4reRddmaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYFF7o7bj1cByXVDP9xC9pVCRydmzXQi/B/TO+W/YzQHcVTmiQg1YLo7f+HfwmWr9zQdYU/COdcNdMnzN0bMkoKmqRGJNvBrGcBAnNgCAka8ramWf3zIALRNuWnlwrG0E3VTJm+mQ2Zxs8/hqjZzPhlwEsATyfkz9dCjId9P4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N79x74zB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N79x74zB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BE901477;
	Tue, 29 Sep 2026 22:09:50 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EB0A3F763;
	Tue, 29 Sep 2026 22:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790744993; bh=njaPmYQiYMnynRy6Bo78DU6/b6J8O1j5Jz4reRddmaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N79x74zBOAfpBYm1NMrqKru9A5eM2kEm0yqRa4wHVZaUJaM13sY0aUzPeBctBnl5E
	 e+gSdUg/0FyZVBJgnmT4cdklecIg4jCtbu/VhJGfBXjxtEp0lvkFcDyaXJNmnEF/Vg
	 SZZyI4Uayz4ZO4Qdn2aViRSbbYoRwLz9ZwYXs13E=
Date: Wed, 30 Sep 2026 06:09:50 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <aryZnqqBAjKw5xaP@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>

On Wed, Sep 30, 2026 at 12:24:08PM +0900, Kohei Enju wrote:
> Hi Yeoreum, Sami,
> 
> On 09/29 17:57, Yeoreum Yun wrote:
> > From: Sami Mujawar <sami.mujawar@arm.com>
> > 
> > Add support for Arm CCA measurement registers (MRs), enabling attestation
> > and runtime integrity tracking from guest Realms.
> > 
> > This implementation registers a measurement configuration with the TSM
> > framework and exposes measurement register values via sysfs using a
> > misc device. The supported registers include the Realm Initial
> > Measurement (RIM) and four Runtime Extensible Measurement Registers
> > (REM0–REM3), each using SHA-256 or SHA-512 depending on Realm
> 
> Is SHA-384 intentionally out of scope for this series?
> 
> Although TF-RMM does not support it yet, the RMM specification defines
> RSI_HASH_SHA_384. A platform using a custom RMM implementation could
> therefore launch a Realm configured to use SHA-384. I think the Realm
> guest driver should support it rather than fail initialization.

Fair enough. Let's change in next-spin.

> 
> > configuration.
> > 
> > The measurement registers are located under the following sysfs node:
> >     /sys/devices/virtual/misc/arm_cca_guest/measurements/
> >        -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem0:sha512
> >        -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem1:sha512
> >        -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem2:sha512
> >        -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem3:sha512
> >        -r--r--r-- 1 0 0 64 Jul 21 11:46 rim:sha512
> > 
> > As seen above the attributes for the REMs are 'rw' indicating they can
> > be read or extended. While the attributes for RIM is 'r' indicating
> > that it can only be read and not extended.
> > 
> > The sysfs node suffix for the measurement register (i.e. ':sha512')
> > indicates the hash algorithm used is sha512. This also reflects
> > that the Realm was launched with SHA512 as the measurement algorithm.
> > 
> > Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> > ---
> >  .../sysfs-devices-virtual-misc-arm_cca_guest       |  38 +++
> >  drivers/virt/coco/arm-cca-guest/Kconfig            |   1 +
> >  drivers/virt/coco/arm-cca-guest/main.c             | 282 ++++++++++++++++++++-
> >  3 files changed, 319 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-devices-virtual-misc-arm_cca_guest b/Documentation/ABI/testing/sysfs-devices-virtual-misc-arm_cca_guest
> > new file mode 100644
> > index 000000000000..878dc54e48f8
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-devices-virtual-misc-arm_cca_guest
> > @@ -0,0 +1,38 @@
> > +What:		/sys/devices/virtual/misc/arm_cca_guest/measurements/MRNAME[:HASH]
> > +Date:		July, 2025
> > +KernelVersion:	v6.16
> 
> I think this Date and KernelVersion are stale and they should be
> updated.

Oh. I missed it. I'll update in next-spin.

> 
> > +Contact:	linux-coco@lists.linux.dev
> > +Description:
> > +		Value of a Arm CCA Realm measurement register (MR). The optional
> 
> If the :HASH suffix actually optional for Arm CCA?
> It appears that the driver always associates a hash algorithm with each
> register.
> 
> > +		suffix :HASH is to represent the hash algorithms associated with
> > +		the MRs. See below for a complete list of Arm CCA Realm MRs exposed
> > +		via sysfs. Refer to the Arm Realm Management Monitor (RMM)
> > +		Specification for more information on the Realm Measurement registers.
> > +
> > +		The Arm Realm Management Monitor Specification can be found at:
> > +		https://developer.arm.com/documentation/den0137/latest/
> > +
> > +		See also:
> > +		https://docs.kernel.org/driver-api/coco/measurement-registers.html
> > +
> > +What:		/sys/devices/virtual/misc/arm_cca_guest/measurements/rim:[sha256|sha512]
> > +Date:		July, 2025
> > +KernelVersion:	v6.16
> > +Contact:	linux-coco@lists.linux.dev
> > +Description:
> > +		(RO) RIM - [32|64]-byte immutable storage typically used to represent
> > +		the Realm Initial Measurement (RIM) which is the measurement of
> > +		the configuration and contents of a Realm at the time of activation.
> > +
> > +What:		/sys/devices/virtual/misc/arm_cca_guest/measurements/rem[0123]:[sha256|sha512]
> > +Date:		July, 2025
> > +KernelVersion:	v6.16
> > +Contact:	linux-coco@lists.linux.dev
> > +Description:
> > +		(RW) REM[0123] - 4 Run-Time extendable Measurement Registers that
> > +		represent the Realm Extensible Measurement (REM) registers which
> > +		can be extended during the lifetime of a Realm.
> > +		Read from any of these returns the current value of the corresponding
> > +		REM. Write extends the written buffer to the REM. All writes must start
> > +		at offset 0 and be maximum 64 bytes in size. Attempting to write more
> > +		than 64 bytes will result in EINVAL returned by the write() syscall.
> > diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
> > index 0d4ce72e2d86..3693d3bc90c6 100644
> > --- a/drivers/virt/coco/arm-cca-guest/Kconfig
> > +++ b/drivers/virt/coco/arm-cca-guest/Kconfig
> > @@ -3,6 +3,7 @@ config ARM_CCA_GUEST
> >  	depends on ARM_RMM_RSI
> >  	depends on HAVE_ARM_SMCCC_DISCOVERY
> >  	select TSM_REPORTS
> > +	select TSM_MEASUREMENTS
> >  	help
> >  	  The driver provides userspace interface to request and
> >  	  attestation report from the Realm Management Monitor(RMM).
> > diff --git a/drivers/virt/coco/arm-cca-guest/main.c b/drivers/virt/coco/arm-cca-guest/main.c
> > index f97f593da6e3..9bbad43c4669 100644
> > --- a/drivers/virt/coco/arm-cca-guest/main.c
> > +++ b/drivers/virt/coco/arm-cca-guest/main.c
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> > - * Copyright (C) 2023 ARM Ltd.
> > + * Copyright (C) 2023 - 2025 ARM Ltd.
> >   */
> >  
> >  #include <linux/arm-rsi-cmds.h>
> > @@ -9,11 +9,280 @@
> >  #include <linux/cc_platform.h>
> >  #include <linux/kernel.h>
> >  #include <linux/device-id/platform.h>
> > +#include <linux/miscdevice.h>
> >  #include <linux/module.h>
> >  #include <linux/smp.h>
> >  #include <linux/tsm.h>
> > +#include <linux/tsm-mr.h>
> >  #include <linux/types.h>
> >  
> > +#include <crypto/hash.h>
> > +
> > +/* MR buffer */
> > +static u8 *arm_cca_mr_buf;
> > +
> > +/**
> > + * arm_cca_mrs - ARM CCA measurement register set.
> > + *
> > + * Defines a static array of measurement registers used by the ARM
> > + * Confidential Compute Architecture (CCA). These registers are used
> > + * for attestation and runtime integrity tracking.
> > + *
> > + * Register types:
> > + *   - rim: Realm initial measurement register (RIM)
> > + *   - rem0–rem3: Runtime extensible measurement registers (REMs)
> > + */
> > +static struct tsm_measurement_register arm_cca_mrs[] = {
> > +	{ TSM_MR_(rim, SHA256)  | TSM_MR_F_READABLE },
> > +	{ TSM_MR_(rem0, SHA256) | TSM_MR_F_RTMR },
> > +	{ TSM_MR_(rem1, SHA256) | TSM_MR_F_RTMR },
> > +	{ TSM_MR_(rem2, SHA256) | TSM_MR_F_RTMR },
> > +	{ TSM_MR_(rem3, SHA256) | TSM_MR_F_RTMR }
> > +};
> > +
> > +/**
> > + * arm_cca_mr_refresh - Refresh measurement registers for ARM CCA.
> > + *
> > + * @tm: Pointer to a struct tsm_measurements containing measurement registers.
> > + *
> > + * Iterates through all measurement registers in @tm and refreshes those
> > + * marked with TSM_MR_F_LIVE or TSM_MR_F_READABLE by invoking
> > + * rsi_measurement_read() for each.
> > + *
> > + * Return: 0 on success, or -EINVAL if @tm is NULL or a read operation fails.
> > + */
> > +static int arm_cca_mr_refresh(const struct tsm_measurements *tm)
> > +{
> > +	int retval;
> > +	int index = 0;
> > +	const struct tsm_measurement_register *mr;
> > +
> > +	if (!tm)
> > +		return -EINVAL;
> > +
> > +	while (index < tm->nr_mrs) {
> > +		mr = &tm->mrs[index];
> > +
> > +		/* Skip if the MR is not Live or Readable. */
> > +		if ((mr->mr_flags & (TSM_MR_F_LIVE | TSM_MR_F_READABLE)) != 0) {
> > +			retval = rsi_measurement_read(index,
> > +						      mr->mr_value,
> > +						      mr->mr_size);
> > +			if (retval != 0)
> > +				return -EINVAL;
> > +		}
> > +
> > +		index++;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * arm_cca_mr_extend - Extend a measurement register with new data.
> > + *
> > + * @tm:   Pointer to the tsm_measurements structure containing measurement
> > + *        registers.
> > + * @mr:   Pointer to the specific measurement register to extend.
> > + * @data: Pointer to the data to be used for extension.
> > + *
> > + * This function extends a measurement register with new input data.
> > + *
> > + * Return: 0 on success, or a negative error code (e.g., -EINVAL for invalid
> > + * arguments).
> > + */
> > +static int arm_cca_mr_extend(const struct tsm_measurements *tm,
> > +			     const struct tsm_measurement_register *mr,
> > +			     const u8 *data)
> > +{
> > +	if (!tm || !mr || !data)
> > +		return -EINVAL;
> > +
> > +	return rsi_measurement_extend((mr - tm->mrs), data, mr->mr_size);
> > +}
> > +
> > +/**
> > + * arm_cca_measurements - ARM CCA measurement configuration instance.
> > + *
> > + * This defines the measurement set and behavior for the ARM
> > + * Confidential Compute Architecture, enabling measurements
> > + * for attestation and runtime validation.
> > + */
> > +static struct tsm_measurements arm_cca_measurements = {
> > +	.mrs = arm_cca_mrs,
> > +	.nr_mrs = ARRAY_SIZE(arm_cca_mrs),
> > +	.refresh = arm_cca_mr_refresh,
> > +	.write = arm_cca_mr_extend,
> 
> From the RMM specification and the commit message, I understand that a
> REM can be extended with a measurement value of up to 64 bytes,
> regardless of the selected hash algorithm (for example, SHA-256 or
> SHA-512).
> 
> However, when SHA-256 is selected, this interface does not allow a REM
> to be extended with a 64-byte value. The write partially succeeds: the
> REM is extended with the first 32 bytes, and then the write of the
> remaining 32 bytes fails with -EFBIG.
> 
> As far as I can tell, the write is truncated to the sysfs binary
> attribute size, which is set to the SHA-256 digest size (32 bytes). The
> subsequent write at offset 32 is then rejected by sysfs_kf_bin_write()
> with -EFBIG.
> 
> I do not see a straightforward fix because the TSM measurement register
> interface currently uses mr_size both as the readable digest size and as
> the required write size.
> 
> [Realm VM]
>   ~ # export REM3=/sys/devices/virtual/misc/arm_cca_guest/measurements/rem3:sha256
>   ~ # dd if=/dev/urandom bs=64 count=1 of=$REM3
>   dd: error writing '/sys/devices/virtual/misc/arm_cca_guest/measurements/rem3:sha256': File too large
>   1+0 records in
>   0+0 records out
> 
> [RMM]
>   SMC_RSI_MEASUREMENT_EXTEND        4 20 3cfcaa635bca042d c148121346b6e1b5 7342800b438d20d7 3dc7a25048cbbad8 0 0 0 0 > RSI_SUCCESS
> 
> Do you have any thoughts on how the TSM interface should represent the
> maximum extend input size separately from the digest size?

I don't think we need to represent the maximum extend input size separately.

The TSM measurement register interface is intended to expose PCR-like
semantics, where the value being extended is a measurement digest whose size
is determined by the selected hash algorithm.

In other words, the extend operation is conceptually:

new_digest = Hash(old_digest || measurement_digest)

Therefore, for a SHA-256 measurement register, the extend value should be
32 bytes, and rejecting a value larger than 32 bytes with -EFBIG seems
correct to me and intended. A 64-byte extend value would only be valid for
a register using a 64-byte digest, such as SHA-512.

Although the RMM interface may allow a measurement value of up to 64 bytes
independently of the REM hash algorithm, I don't think that capability
needs to be exposed through the generic TSM measurement register interface
in point of viewt to preserve PCR-like semantics.

> 
> > +};
> > +
> > +/**
> > + * arm_cca_attr_groups - Attribute groups for the arm_cca_misc_dev miscellaneous
> > + * device.
> > + *
> > + */
> > +static const struct attribute_group *arm_cca_attr_groups[] = {
> > +	NULL, /* measurements */
> > +	NULL
> > +};
> > +
> > +/**
> > + * arm_cca_misc_dev - Miscellaneous device for ARM CCA functionality.
> > + *
> > + */
> > +static struct miscdevice arm_cca_misc_dev = {
> > +	.name = KBUILD_MODNAME,
> > +	.minor = MISC_DYNAMIC_MINOR,
> > +	.groups = arm_cca_attr_groups,
> > +};
> > +
> > +/**
> > + * arm_cca_get_hash_algorithm - Get the hash algorithm and digest size for
> > + * a Realm.
> > + *
> > + * @hash_algo:   Pointer to an int to receive the internal hash algorithm ID
> > + *               (e.g., HASH_ALGO_SHA256 or HASH_ALGO_SHA512).
> > + * @digest_size: Pointer to an int to receive the digest size in bytes
> > + *               (e.g., SHA256_DIGEST_SIZE or SHA512_DIGEST_SIZE).
> > + *
> > + * This function retrieves the hash algorithm used in a Realm's configuration
> > + * by invoking the `rsi_get_realm_config()` interface.
> > + *
> > + * Return:
> > + * * %0        - Success. The hash algorithm and digest size are returned.
> > + * * %-ENOMEM  - Memory allocation failed.
> > + * * %-EINVAL  - Configuration fetch failed or algorithm is unsupported.
> > + *
> > + */
> > +static int arm_cca_get_hash_algorithm(int *hash_algo, int *digest_size)
> > +{
> > +	int ret = 0;
> > +	unsigned long result;
> > +	struct realm_config *cfg = NULL;
> > +
> > +	cfg = alloc_pages_exact(sizeof(*cfg), GFP_KERNEL);
> > +	if (!cfg)
> > +		return -ENOMEM;
> > +
> > +	result = rsi_get_realm_config(cfg);
> > +	if (result != RSI_SUCCESS) {
> > +		ret = -EINVAL;
> > +		goto exit_free_realm_config;
> > +	}
> > +
> > +	switch (cfg->hash_algo) {
> > +	case RSI_HASH_SHA_512:
> > +		*hash_algo = HASH_ALGO_SHA512;
> > +		*digest_size = SHA512_DIGEST_SIZE;
> > +		break;
> > +	case RSI_HASH_SHA_256:
> > +		*hash_algo = HASH_ALGO_SHA256;
> > +		*digest_size = SHA256_DIGEST_SIZE;
> > +		break;
> > +	default:
> > +		/* Unknown/unsupported algorithm. */
> > +		ret = -EINVAL;
> 
> Would it make sense to add an error message here? For example:
>   pr_err("Unknown/unsupported Realm hash algorithm: %u\n", cfg->hash_algo);
> 
> For context, I tested your v1 series in the past and found that this function
> sometimes failed due to wrong definition of realm_config::hash_algo [0].
> Therefore, I think a diagnostic message including the returned value
> would be useful.
> 
> [0] https://lore.kernel.org/all/20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com/

Fair enough. I'll add the error log.

Thanks!

-- 
Sincerely,
Yeoreum Yun
