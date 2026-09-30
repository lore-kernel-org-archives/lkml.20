Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56962246783
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745221; cv=none; b=mUYRTfQTht9wN4voC9c032l8ZKREhfdGl9ojKDjoKmJrC4KXDZEo+ZmH6t9HY1NlRZvAnYI7jD5ibTeBCHZg61xnRERPq+UCQ7nEZIPUfTdqyNNcmPV7l3UQXd82r9+4OkpyAzUfn1zI2GyMVQloWi8IsV+44Kb4NFJcq7OV0Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745221; c=relaxed/simple;
	bh=0VwICtUH5NvpaDbe9DoXbn5Z54tn5XhVjnIRjhSAT0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c19zsds4FajBxLIKUm5hw6x0J06bArvxiBWzd9EJ6oTDTEfPoJo4qe6J8z+s0Rns6MZ5/ImTzpk5MCue5oyWzAI0mrHokpunM6dorgsrqnHx+Vy850pa9VeinBwgSRdhbbM3vvoqBpvnatVoI5dB7qdS/bkn0qD3fTTxXn36xcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IeRhwrK1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IeRhwrK1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E3722F;
	Tue, 29 Sep 2026 22:13:36 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 187F13F763;
	Tue, 29 Sep 2026 22:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790745219; bh=0VwICtUH5NvpaDbe9DoXbn5Z54tn5XhVjnIRjhSAT0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeRhwrK1zaH22wjoEotiIOUpFEMxZyWQlX52tsrT6FL1H/QwQRPryQEsdTqnvX7co
	 SrpnS2UC/UlNm6EbfrT1OGXdy/NuhU1vKTzUv7t8sszsLIpPfIcYaKbZc2vGNJFXLJ
	 kxouD00MyhpRltBN1P2HIeS9lSTfynnHOhipVptk=
Date: Wed, 30 Sep 2026 06:13:35 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 1/3] arm64: rsi: Add helpers for Arm CCA measurement
 register operations
Message-ID: <aryafzI-M06aZ4bZ@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-1-1d98bba187fd@arm.com>
 <arxrOt1HEYeG6GJx@FCCLS0092175.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arxrOt1HEYeG6GJx@FCCLS0092175.localdomain>

> On 09/29 17:57, Yeoreum Yun wrote:
> > From: Sami Mujawar <sami.mujawar@arm.com>
> > 
> > Add static inline helper functions to support reading the Realm
> > Initial Measurement (RIM) and reading/extending the Realm
> > Extensible Measurement (REM) registers.
> > 
> > The indices of the Arm CCA measurement registers, as defined by
> > the Realm Management Monitor specification, are as follows:
> >     Index    Register
> >     0        RIM
> >     1 - 4    REM[0 - 3]
> > 
> > The rsi_measurement_extend() function allows extending REM[0–3]
> > registers with a caller-provided digest (up to 64 bytes).
> > Index 0 (RIM) is read-only and cannot be extended.
> > 
> > The rsi_measurement_read() function allows reading measurement
> > values from RIM (index 0) or REM[0–3] (indices 1–4). The returned
> > digest is expected to be 64 bytes.
> > 
> > Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> > ---
> >  include/linux/arm-rsi-cmds.h | 105 ++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 104 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/arm-rsi-cmds.h b/include/linux/arm-rsi-cmds.h
> > index 3f7a6a833993..608343266d81 100644
> > --- a/include/linux/arm-rsi-cmds.h
> > +++ b/include/linux/arm-rsi-cmds.h
> > @@ -1,6 +1,6 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> >  /*
> > - * Copyright (C) 2023 ARM Ltd.
> > + * Copyright (C) 2023 - 2025 ARM Ltd.
> >   */
> >  
> >  #ifndef __LINUX_ARM_RSI_CMDS_H_
> > @@ -36,6 +36,26 @@ static inline bool is_realm_world(void) { return false; }
> >  #define RSI_GRANULE_SHIFT		12
> >  #define RSI_GRANULE_SIZE		(_AC(1, UL) << RSI_GRANULE_SHIFT)
> >  
> > +/*
> > + * Maximum measurement data size in bytes.
> > + * According to the RMM Specification, the width of the RmmRealmMeasurement type
> > + * is 512 bits.
> > + */
> > +#define RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES  64
> > +
> > +/*
> > + * Indices for the Realm Initial Measurement register (RIM) and the Realm
> > + * Extensible Measurement registers (REMs).
> > + * According to the RMM Specification, Realm attributes of a Realm include
> > + * an array of measurement values. The first entry in this array is a RIM.
> > + * The remaining entries in this array are REMs.
> > + */
> > +#define RSI_INDEX_RIM		0
> > +#define RSI_INDEX_REM0		1
> > +#define RSI_INDEX_REM1		2
> > +#define RSI_INDEX_REM2		3
> > +#define RSI_INDEX_REM3		4
> > +
> >  enum ripas {
> >  	RSI_RIPAS_EMPTY = 0,
> >  	RSI_RIPAS_RAM = 1,
> > @@ -236,4 +256,87 @@ static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
> >  	return res.a0;
> >  }
> >  
> > +/**
> > + * rsi_measurement_extend - Extend the measurement value to the Realm Extensible
> > + * Measurement (REM).
> > + *
> > + * @idx:		Index of the REM register.
> > + *				Where:
> > + *				Index	Register
> > + *				1 - 4	REM[0-3]
> > + * @digest:		The digest data to be extended.
> > + * @digest_size:	Size of the digest data in bytes.
> > + *
> > + * Returns:
> > + *  On success, returns RSI_SUCCESS.
> > + *  Otherwise, -EINVAL
> > + */
> > +static inline unsigned long rsi_measurement_extend(u32 idx,
> > +						   const u8 *digest,
> > +						   unsigned long digest_size)
> > +{
> > +	struct arm_smccc_1_2_regs regs = { 0 };
> > +
> > +	/*
> > +	 * Index 0 is for RIM (which is Read Only), while
> > +	 * REM[0-3] are indexed from 1 - 4.
> > +	 * The digest size can be at the most 64 bytes.
> > +	 */
> > +	if (!digest || idx < RSI_INDEX_REM0 || idx > RSI_INDEX_REM3 ||
> > +	    digest_size == 0 || digest_size > RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES)
> > +		return -EINVAL;
> > +
> > +	regs.a0 = SMC_RSI_MEASUREMENT_EXTEND;
> > +	regs.a1 = idx;
> > +	regs.a2 = digest_size;
> > +	memcpy(&regs.a3, digest, digest_size);
> 
> With CONFIG_FORTIFY_SOURCE=y, FORTIFY reports the following warning for
> this memcpy:
> 
>   [  899.918673] ------------[ cut here ]------------
>   [  899.918806] memcpy: detected field-spanning write (size 32) of single field "&regs.a3" at ./include/linux/arm-rsi-cmds.h:292 (size 8)
>   [  899.919277] WARNING: ./include/linux/arm-rsi-cmds.h:292 at rsi_measurement_extend+0x104/0x118, CPU#0: dd/123
>   [  900.672180] Modules linked in:
>   [  900.769378] CPU: 0 UID: 0 PID: 123 Comm: dd Not tainted 7.3.0-rc4+ #6 PREEMPT(full)
>   [  901.034515] Hardware name: linux,dummy-virt (DT)
>   [  901.194939] pstate: 61402005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>   [  901.390491] pc : rsi_measurement_extend+0x104/0x118
>   [  901.530657] lr : rsi_measurement_extend+0x104/0x118
>   [...]
>   [  903.770326] Call trace:
>   [  903.893102]  rsi_measurement_extend+0x104/0x118 (P)
>   [  904.056234]  arm_cca_mr_extend+0x40/0x58
>   [  904.270991]  tm_digest_write+0x90/0x1d8
>   [  904.439429]  sysfs_kf_bin_write+0x98/0xc8
>   [  904.596599]  kernfs_fop_write_iter+0x150/0x1e8
>   [  904.779881]  vfs_write+0x29c/0x450
>   [...]
> 
> Would it make sense to use a union to overlay the struct
> arm_smccc_1_2_regs with an RSI-specific argument layout and copy the
> digest into an explicit 64-byte array, as in commit 221049874b6a
> ("arm64: RSI: fix field-spanning write warning in attestation token
> init")?

Thanks for reporting and suggestion. I'll fix at next-spin.


-- 
Sincerely,
Yeoreum Yun
