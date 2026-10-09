Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04F24A2A44
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560709; cv=none; b=faTgdvO6Q0vbXaH+wRmYyF686GwDYhoTBLCTPoW2L4WqWDbKZBsksBOXnDpJjuGy1P/5zCwBVcSQMAnxHWfaeVGAWQZxLBnL4Ki0MYmy0R2V2S8RFF8bXDLCluLY3N/YJbvAWvK3Ewj2elSU91ujsedGhwOmumLgJt/+EzY07LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560709; c=relaxed/simple;
	bh=Tve2XROAAe8xmjuCKraOtEAF+e/Rpqih1v2EMZP5pdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WbxiEcmAxPpvTr8LloTKlEtEq4PB0e9QOl0wAID5GW5dyDwyzH5Xh3H33Lqqiv3UCdOkQjKFkYwTnf+VgkOSdU+5pbrxxpBAXMz/YmPdCAk4k+uheLrDyB2alMrfUiQ97hvAJGmF6xiouUN+ajsScfux2jEQymlOCpE5N1VrZ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=A7ky8vMo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="A7ky8vMo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADC1B1476;
	Fri,  9 Oct 2026 08:45:00 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.54.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0D843F763;
	Fri,  9 Oct 2026 08:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791560704; bh=Tve2XROAAe8xmjuCKraOtEAF+e/Rpqih1v2EMZP5pdU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A7ky8vMovcDRLrpIUQPJZ1rYoi1VL7KJreQzbd2Q55u5mNpS/3GkOjRzrqIgNU/rC
	 3NXI0NfhXrpahQpG6k1Prj8r5FV5/gds23Vodj3Uv3xfr2nzeKklM0wJXd5wlq+25K
	 0nu9FdN02/9lsSVqKJY8mWxHMrebPfuAhH78XZHg=
Message-ID: <ba24b3a3-d48f-4379-a33f-2c7c49aa1f31@arm.com>
Date: Fri, 9 Oct 2026 16:44:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v2 07/23] arm64: cpufeature: Read MPAMIDR_EL1 in
 __cpuinfo_store_cpu()
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 =?UTF-8?Q?=C8=98tefania_Ion?= <stefion@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Borislav Petkov
 <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Tarun Sahu <tarunsahu@google.com>, Fuad Tabba <fuad.tabba@linux.dev>,
 David Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>,
 Marc Zyngier <maz@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
 <20261009100738.31288-8-will@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261009100738.31288-8-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Will,

On 10/9/26 11:07, Will Deacon wrote:
> From: Fuad Tabba <fuad.tabba@linux.dev>
> 
> MPAMIDR_EL1 is the one ID register __cpuinfo_store_cpu() doesn't read.
> Its read was deferred to init_cpu_features() and update_cpu_features()
> because it traps on firmware that fails to enable MPAM. Only the
> sanitised ID_AA64PFR0_EL1 and ID_AA64PFR1_EL1 carried the arm64.nompam
> override for such firmware.
> 
> Store ID_AA64PFR0_EL1 through read_cpuid_with_overrides() as well. Then
> read MPAMIDR_EL1 in __cpuinfo_store_cpu() again, beside GMID_EL1, gated
> on this CPU's overridden ID_AA64PFR0_EL1 and ID_AA64PFR1_EL1. cpu_data
> is then complete before init_cpu_features() runs.
> 
> Other readers of the stored ID_AA64PFR0_EL1 see the override too. With
> arm64.no32bit_el0, __cpuinfo_store_cpu() no longer reads the AArch32 ID
> registers. Adding allow_mismatched_32bit_el0 no longer enables 32-bit
> EL0 either.
> 
> detect_ftr_has_mpam(), a system-wide test on the sanitised values,
> stays for the ARM64_MPAM capability.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Will Deacon <will@kernel.org>
> --->  arch/arm64/kernel/cpufeature.c | 10 +++-------
>  arch/arm64/kernel/cpuinfo.c    | 11 ++++-------
>  2 files changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 3161531ad401..9212f10c1d1a 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1248,10 +1248,8 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
>  		cpacr_restore(cpacr);
>  	}
>  
> -	if (detect_ftr_has_mpam()) {
> -		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
> +	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0) || id_aa64pfr1_mpamfrac(info->reg_id_aa64pfr1))
>  		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);

info->reg_mpamidr isn't useful if we aren't going to use MPAM so I
suppose all the info->reg_mpamidr accesses should be additionally
guarded with IS_ENABLED(CONFIG_ARM64_MPAM) as already done for MTE.
That's a separate change though and what you've got here looks good to
me. So, FWIW,

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> -	}
>  
>  	if (IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(info->reg_id_aa64pfr1))
>  		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
> @@ -1504,11 +1502,9 @@ void update_cpu_features(int cpu,
>  		cpacr_restore(cpacr);
>  	}
>  
> -	if (detect_ftr_has_mpam()) {
> -		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
> +	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0) || id_aa64pfr1_mpamfrac(info->reg_id_aa64pfr1))
>  		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
> -					info->reg_mpamidr, boot->reg_mpamidr);
> -	}
> +					      info->reg_mpamidr, boot->reg_mpamidr);
>  
>  	/*
>  	 * The kernel uses the LDGM/STGM instructions and the number of tags
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index d48167fe4218..0ae40b0c7b2f 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -495,7 +495,7 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  	info->reg_id_aa64mmfr2 = read_cpuid(ID_AA64MMFR2_EL1);
>  	info->reg_id_aa64mmfr3 = read_cpuid(ID_AA64MMFR3_EL1);
>  	info->reg_id_aa64mmfr4 = read_cpuid(ID_AA64MMFR4_EL1);
> -	info->reg_id_aa64pfr0 = read_cpuid(ID_AA64PFR0_EL1);
> +	info->reg_id_aa64pfr0 = read_cpuid_with_overrides(ID_AA64PFR0_EL1);
>  	info->reg_id_aa64pfr1 = read_cpuid_with_overrides(ID_AA64PFR1_EL1);
>  	info->reg_id_aa64pfr2 = read_cpuid(ID_AA64PFR2_EL1);
>  	info->reg_id_aa64zfr0 = read_cpuid(ID_AA64ZFR0_EL1);
> @@ -505,15 +505,12 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  	if (IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(info->reg_id_aa64pfr1))
>  		info->reg_gmid = read_cpuid(GMID_EL1);
>  
> +	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0) || id_aa64pfr1_mpamfrac(info->reg_id_aa64pfr1))
> +		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
> +
>  	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
>  		__cpuinfo_store_cpu_32bit(&info->aarch32);
>  
> -	/*
> -	 * info->reg_mpamidr deferred to {init,update}_cpu_features because we
> -	 * don't want to read it (and trigger a trap on buggy firmware) if
> -	 * using an aa64pfr0_el1 override to unconditionally disable MPAM.
> -	 */
> -
>  	if (IS_ENABLED(CONFIG_ARM64_SME) &&
>  	    id_aa64pfr1_sme(info->reg_id_aa64pfr1)) {
>  		/*

