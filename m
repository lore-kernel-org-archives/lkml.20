Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3C33385A5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.139.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733979; cv=none; b=TOhc6+qA/xFtAX46wm9DoKbpDfUGKPEZN3V8h5S88If8dCxlHBM62U6ifN8UeGb+r9eABog5sp3Zzl4WHyjRbQhTR38xhp6T4O++GuzWf82pf0BTUsiYQDM9aWtMhnQZZjvxhL0cs5j8v44dkTmc7eCkH/TDzwnWih4iAWRh2oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733979; c=relaxed/simple;
	bh=GwkVQNzgUjv+Kg4ssvph3rWzuiQanbDbfsmCFjgCyDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDR0KBcfexqjuZKVT5/GqX18PVS8SOJTy7qx31CEXZKQan88AcXgKLTkAvyB8y/hpdzJ3EY7QM95YDEDsQG6WiMPjtYP7wcNODwWeDNcSZtU5zyrUklJG6UuE0aoskeRMhlukJpPMnuHvW9v6yffAu8P+PGtQsBBkRquaOY5I/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=COyESGh7; arc=none smtp.client-ip=68.232.139.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="COyESGh7"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790733982; x=1822269982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GwkVQNzgUjv+Kg4ssvph3rWzuiQanbDbfsmCFjgCyDU=;
  b=COyESGh7MC1JygR9GIQSdpXV91EwwPDOK/mpXW6QFKtuVOC1Y9kL5ESW
   5uEQl6BZG8eI4ff3rrt5CGoilKMrBO5gwFBnu8F/3bhHqTeZt6xXbs2YI
   2djNZsTSO3D9yZP3lAF4lPGvbqv8IjM8ms1tYcaBc2oHyWIfCuE4OsvP4
   HKwL/vFpOg+TViEf0oEtfGNs4xSA9WxdCYnuA2VXblR2pQCDeTk0C2hee
   JI29/eHzalIR5iRzK2jVccbXqQFgDzN2+tFqVe81LMMqR1gIzvc+T2eeA
   2AxK+iwUNkmgdXGs/K+lIvpzZnic20Ni84EOQnUEbT+EbTFqsk+TQ/6zk
   A==;
X-CSE-ConnectionGUID: pNfiNipZQ+iZron9h+mv8Q==
X-CSE-MsgGUID: Zl305GXLRJGG0gy+ag77tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="260432324"
X-IronPort-AV: E=Sophos;i="6.27,130,1786978800"; 
   d="scan'208";a="260432324"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 11:05:05 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 74FBE100035F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:05:05 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 27FBA1C00116
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:05:05 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.20.173])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 167CF1000367;
	Wed, 30 Sep 2026 02:05:00 +0000 (UTC)
Date: Wed, 30 Sep 2026 11:04:58 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Suzuki Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, 
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 1/3] arm64: rsi: Add helpers for Arm CCA measurement
 register operations
Message-ID: <arxrOt1HEYeG6GJx@FCCLS0092175.localdomain>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-1-1d98bba187fd@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929-arm_cca_mr-v2-1-1d98bba187fd@arm.com>

On 09/29 17:57, Yeoreum Yun wrote:
> From: Sami Mujawar <sami.mujawar@arm.com>
> 
> Add static inline helper functions to support reading the Realm
> Initial Measurement (RIM) and reading/extending the Realm
> Extensible Measurement (REM) registers.
> 
> The indices of the Arm CCA measurement registers, as defined by
> the Realm Management Monitor specification, are as follows:
>     Index    Register
>     0        RIM
>     1 - 4    REM[0 - 3]
> 
> The rsi_measurement_extend() function allows extending REM[0–3]
> registers with a caller-provided digest (up to 64 bytes).
> Index 0 (RIM) is read-only and cannot be extended.
> 
> The rsi_measurement_read() function allows reading measurement
> values from RIM (index 0) or REM[0–3] (indices 1–4). The returned
> digest is expected to be 64 bytes.
> 
> Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> ---
>  include/linux/arm-rsi-cmds.h | 105 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 104 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/arm-rsi-cmds.h b/include/linux/arm-rsi-cmds.h
> index 3f7a6a833993..608343266d81 100644
> --- a/include/linux/arm-rsi-cmds.h
> +++ b/include/linux/arm-rsi-cmds.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) 2023 ARM Ltd.
> + * Copyright (C) 2023 - 2025 ARM Ltd.
>   */
>  
>  #ifndef __LINUX_ARM_RSI_CMDS_H_
> @@ -36,6 +36,26 @@ static inline bool is_realm_world(void) { return false; }
>  #define RSI_GRANULE_SHIFT		12
>  #define RSI_GRANULE_SIZE		(_AC(1, UL) << RSI_GRANULE_SHIFT)
>  
> +/*
> + * Maximum measurement data size in bytes.
> + * According to the RMM Specification, the width of the RmmRealmMeasurement type
> + * is 512 bits.
> + */
> +#define RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES  64
> +
> +/*
> + * Indices for the Realm Initial Measurement register (RIM) and the Realm
> + * Extensible Measurement registers (REMs).
> + * According to the RMM Specification, Realm attributes of a Realm include
> + * an array of measurement values. The first entry in this array is a RIM.
> + * The remaining entries in this array are REMs.
> + */
> +#define RSI_INDEX_RIM		0
> +#define RSI_INDEX_REM0		1
> +#define RSI_INDEX_REM1		2
> +#define RSI_INDEX_REM2		3
> +#define RSI_INDEX_REM3		4
> +
>  enum ripas {
>  	RSI_RIPAS_EMPTY = 0,
>  	RSI_RIPAS_RAM = 1,
> @@ -236,4 +256,87 @@ static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
>  	return res.a0;
>  }
>  
> +/**
> + * rsi_measurement_extend - Extend the measurement value to the Realm Extensible
> + * Measurement (REM).
> + *
> + * @idx:		Index of the REM register.
> + *				Where:
> + *				Index	Register
> + *				1 - 4	REM[0-3]
> + * @digest:		The digest data to be extended.
> + * @digest_size:	Size of the digest data in bytes.
> + *
> + * Returns:
> + *  On success, returns RSI_SUCCESS.
> + *  Otherwise, -EINVAL
> + */
> +static inline unsigned long rsi_measurement_extend(u32 idx,
> +						   const u8 *digest,
> +						   unsigned long digest_size)
> +{
> +	struct arm_smccc_1_2_regs regs = { 0 };
> +
> +	/*
> +	 * Index 0 is for RIM (which is Read Only), while
> +	 * REM[0-3] are indexed from 1 - 4.
> +	 * The digest size can be at the most 64 bytes.
> +	 */
> +	if (!digest || idx < RSI_INDEX_REM0 || idx > RSI_INDEX_REM3 ||
> +	    digest_size == 0 || digest_size > RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES)
> +		return -EINVAL;
> +
> +	regs.a0 = SMC_RSI_MEASUREMENT_EXTEND;
> +	regs.a1 = idx;
> +	regs.a2 = digest_size;
> +	memcpy(&regs.a3, digest, digest_size);

With CONFIG_FORTIFY_SOURCE=y, FORTIFY reports the following warning for
this memcpy:

  [  899.918673] ------------[ cut here ]------------
  [  899.918806] memcpy: detected field-spanning write (size 32) of single field "&regs.a3" at ./include/linux/arm-rsi-cmds.h:292 (size 8)
  [  899.919277] WARNING: ./include/linux/arm-rsi-cmds.h:292 at rsi_measurement_extend+0x104/0x118, CPU#0: dd/123
  [  900.672180] Modules linked in:
  [  900.769378] CPU: 0 UID: 0 PID: 123 Comm: dd Not tainted 7.3.0-rc4+ #6 PREEMPT(full)
  [  901.034515] Hardware name: linux,dummy-virt (DT)
  [  901.194939] pstate: 61402005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
  [  901.390491] pc : rsi_measurement_extend+0x104/0x118
  [  901.530657] lr : rsi_measurement_extend+0x104/0x118
  [...]
  [  903.770326] Call trace:
  [  903.893102]  rsi_measurement_extend+0x104/0x118 (P)
  [  904.056234]  arm_cca_mr_extend+0x40/0x58
  [  904.270991]  tm_digest_write+0x90/0x1d8
  [  904.439429]  sysfs_kf_bin_write+0x98/0xc8
  [  904.596599]  kernfs_fop_write_iter+0x150/0x1e8
  [  904.779881]  vfs_write+0x29c/0x450
  [...]

Would it make sense to use a union to overlay the struct
arm_smccc_1_2_regs with an RSI-specific argument layout and copy the
digest into an explicit 64-byte array, as in commit 221049874b6a
("arm64: RSI: fix field-spanning write warning in attestation token
init")?

Thanks,
Kohei

> +	arm_smccc_1_2_smc(&regs, &regs);
> +
> +	if (regs.a0 != RSI_SUCCESS)
> +		return -EINVAL;
> +
> +	return regs.a0;
> +}
> +
