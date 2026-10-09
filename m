Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7F03806C9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561081; cv=none; b=JbN90NDTtwR47yX4YLuICwHYGWyP6ju5wSgh2jZC4LcjQA6LcVv0unHLAer0LYaNQuWl/6WYxyu6sAnmuCMuL0Wgh7tz64U/gP3kFlSxxAWR+YlHNYq4CR3hzOwCg6mGYvuqbJZThwt5MXVSWP8wm2/2LK5p4sCK+o/AvI8EPv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561081; c=relaxed/simple;
	bh=5feYH3+pbVTgr2fGF5M7AvFuJa8U8vWQ+HLCanQrhAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCT8Arqpz0zAD78EJAE+/PoYkODWY8mTBPPuNicpFaQBUtT7oQTr8GBgwg1fD3404SPcJEywisxdN/VCm2YI0ltVlRWkvcs4xBEcc3QwTF6Th6zfgcuG0gJgUk/hFysDoQx6F7a+xom6zgYOdGuwkQX02OLwBWcvzwO9Eiqup8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FPTNnYX7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FPTNnYX7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EE7C1EA6;
	Fri,  9 Oct 2026 08:51:15 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.54.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1925C3F763;
	Fri,  9 Oct 2026 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791561078; bh=5feYH3+pbVTgr2fGF5M7AvFuJa8U8vWQ+HLCanQrhAA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FPTNnYX7zZFTTJCyQPGAmjHeQa2rVc1EDVWcM6O+UjiE7YdAMfA8o3nOJ9cdCAKzo
	 sC5ZYKzeqGVEajDT7sVKkWNc9uanX0/6uJoUxi0ka4Gz8TOsyVCu5+g0vPNT5LYg4G
	 igIO8qcu7W/QRTkCJgDEw0Zg2dqnR90lhNz+Okok=
Message-ID: <814a1d78-73df-4b8c-b596-65fb82f7cceb@arm.com>
Date: Fri, 9 Oct 2026 16:51:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v2 08/23] arm64: cpufeature: Store every ID register with
 its overrides applied
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
 <20261009100738.31288-9-will@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261009100738.31288-9-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Will,

On 10/9/26 11:07, Will Deacon wrote:
> From: Fuad Tabba <fuad.tabba@linux.dev>
> 
> __cpuinfo_store_cpu() stores ID_AA64PFR0_EL1 and ID_AA64PFR1_EL1 with
> their overrides applied and every other register raw. Store the rest
> the same way. Everything read with read_cpuid() goes through
> read_cpuid_with_overrides(). CTR_EL0 and CNTFRQ_EL0, which are read
> otherwise, go through arm64_ftr_reg_override(). It returns a register
> with no override unchanged, so an override added to one later takes
> effect without a change here.
> 
> init_cpu_ftr_reg() then gets values that already carry every valid
> override, so its code to apply one is dead. Remove that code.
> init_cpu_ftr_reg() still removes an unsafe override, so the same
> overrides are rejected and sys_val is unchanged. Only its log changes.
> The raw value is gone, so it logs an override equal to that value as
> "forced" rather than "already set".
> 
> Secondaries are compared with the boot CPU on their stored values, so
> CPUs that differ only in a field the command line turned off no longer
> taint the kernel.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 17 +++----
>  arch/arm64/kernel/cpuinfo.c    | 82 +++++++++++++++++-----------------
>  2 files changed, 46 insertions(+), 53 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9212f10c1d1a..d69a5b8304b6 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1043,6 +1043,8 @@ void __init validate_ftr_regs(void)
>   * Also initialises the strict_mask for the register.
>   * Any bits that are not covered by an arm64_ftr_bits entry are considered
>   * RES0 for the system-wide value, and must strictly match.
> + * @new has been through arm64_ftr_reg_override(), so a valid override is
> + * already applied to it. Only an unsafe one is left to remove here.
>   */
>  static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
>  {
> @@ -1063,29 +1065,20 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
>  		s64 ftr_ovr = arm64_ftr_value(ftrp, reg->override->val);
>  
>  		if ((ftr_mask & reg->override->mask) == ftr_mask) {
> -			s64 tmp = arm64_ftr_safe_value(ftrp, ftr_ovr, ftr_new);
> -			char *str = NULL;
> +			char *str = "forced";
>  
> -			if (ftr_ovr != tmp) {
> +			if (arm64_ftr_safe_value(ftrp, ftr_ovr, ftr_new) != ftr_ovr) {
>  				/* Unsafe, remove the override */
>  				reg->override->mask &= ~ftr_mask;
>  				reg->override->val &= ~ftr_mask;
> -				tmp = ftr_ovr;
>  				str = "ignoring override";
> -			} else if (ftr_new != tmp) {
> -				/* Override was valid */
> -				ftr_new = tmp;
> -				str = "forced";
> -			} else {
> -				/* Override was the safe value */
> -				str = "already set";
>  			}
>  
>  			pr_warn("%s[%d:%d]: %s to %llx\n",
>  				reg->name,
>  				ftrp->shift + ftrp->width - 1,
>  				ftrp->shift, str,
> -				tmp & (BIT(ftrp->width) - 1));
> +				ftr_ovr & (BIT(ftrp->width) - 1));
>  		} else if ((ftr_mask & reg->override->val) == ftr_mask) {
>  			reg->override->val &= ~ftr_mask;
>  			pr_warn("%s[%d:%d]: impossible override, ignored\n",
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 0ae40b0c7b2f..1b92e52989b1 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -443,33 +443,33 @@ static void cpuinfo_detect_icache_policy(struct cpuinfo_arm64 *info)
>  
>  static void __cpuinfo_store_cpu_32bit(struct cpuinfo_32bit *info)
>  {
> -	info->reg_id_dfr0 = read_cpuid(ID_DFR0_EL1);
> -	info->reg_id_dfr1 = read_cpuid(ID_DFR1_EL1);
> -	info->reg_id_isar0 = read_cpuid(ID_ISAR0_EL1);
> -	info->reg_id_isar1 = read_cpuid(ID_ISAR1_EL1);
> -	info->reg_id_isar2 = read_cpuid(ID_ISAR2_EL1);
> -	info->reg_id_isar3 = read_cpuid(ID_ISAR3_EL1);
> -	info->reg_id_isar4 = read_cpuid(ID_ISAR4_EL1);
> -	info->reg_id_isar5 = read_cpuid(ID_ISAR5_EL1);
> -	info->reg_id_isar6 = read_cpuid(ID_ISAR6_EL1);
> -	info->reg_id_mmfr0 = read_cpuid(ID_MMFR0_EL1);
> -	info->reg_id_mmfr1 = read_cpuid(ID_MMFR1_EL1);
> -	info->reg_id_mmfr2 = read_cpuid(ID_MMFR2_EL1);
> -	info->reg_id_mmfr3 = read_cpuid(ID_MMFR3_EL1);
> -	info->reg_id_mmfr4 = read_cpuid(ID_MMFR4_EL1);
> -	info->reg_id_mmfr5 = read_cpuid(ID_MMFR5_EL1);
> -	info->reg_id_pfr0 = read_cpuid(ID_PFR0_EL1);
> -	info->reg_id_pfr1 = read_cpuid(ID_PFR1_EL1);
> -	info->reg_id_pfr2 = read_cpuid(ID_PFR2_EL1);
> +	info->reg_id_dfr0 = read_cpuid_with_overrides(ID_DFR0_EL1);
> +	info->reg_id_dfr1 = read_cpuid_with_overrides(ID_DFR1_EL1);
> +	info->reg_id_isar0 = read_cpuid_with_overrides(ID_ISAR0_EL1);
> +	info->reg_id_isar1 = read_cpuid_with_overrides(ID_ISAR1_EL1);
> +	info->reg_id_isar2 = read_cpuid_with_overrides(ID_ISAR2_EL1);
> +	info->reg_id_isar3 = read_cpuid_with_overrides(ID_ISAR3_EL1);
> +	info->reg_id_isar4 = read_cpuid_with_overrides(ID_ISAR4_EL1);
> +	info->reg_id_isar5 = read_cpuid_with_overrides(ID_ISAR5_EL1);
> +	info->reg_id_isar6 = read_cpuid_with_overrides(ID_ISAR6_EL1);
> +	info->reg_id_mmfr0 = read_cpuid_with_overrides(ID_MMFR0_EL1);
> +	info->reg_id_mmfr1 = read_cpuid_with_overrides(ID_MMFR1_EL1);
> +	info->reg_id_mmfr2 = read_cpuid_with_overrides(ID_MMFR2_EL1);
> +	info->reg_id_mmfr3 = read_cpuid_with_overrides(ID_MMFR3_EL1);
> +	info->reg_id_mmfr4 = read_cpuid_with_overrides(ID_MMFR4_EL1);
> +	info->reg_id_mmfr5 = read_cpuid_with_overrides(ID_MMFR5_EL1);
> +	info->reg_id_pfr0 = read_cpuid_with_overrides(ID_PFR0_EL1);
> +	info->reg_id_pfr1 = read_cpuid_with_overrides(ID_PFR1_EL1);
> +	info->reg_id_pfr2 = read_cpuid_with_overrides(ID_PFR2_EL1);
>  
> -	info->reg_mvfr0 = read_cpuid(MVFR0_EL1);
> -	info->reg_mvfr1 = read_cpuid(MVFR1_EL1);
> -	info->reg_mvfr2 = read_cpuid(MVFR2_EL1);
> +	info->reg_mvfr0 = read_cpuid_with_overrides(MVFR0_EL1);
> +	info->reg_mvfr1 = read_cpuid_with_overrides(MVFR1_EL1);
> +	info->reg_mvfr2 = read_cpuid_with_overrides(MVFR2_EL1);
>  }
>  
>  static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  {
> -	info->reg_cntfrq = arch_timer_get_cntfrq();
> +	info->reg_cntfrq = arm64_ftr_reg_override(SYS_CNTFRQ_EL0, arch_timer_get_cntfrq());
>  	/*
>  	 * Use the effective value of the CTR_EL0 than the raw value
>  	 * exposed by the CPU. CTR_EL0.IDC field value must be interpreted
> @@ -478,35 +478,35 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  	 * effective value of the CTR_EL0 in our internal records for
>  	 * accurate sanity check and feature enablement.
>  	 */
> -	info->reg_ctr = read_cpuid_effective_cachetype();
> -	info->reg_dczid = read_cpuid(DCZID_EL0);
> +	info->reg_ctr = arm64_ftr_reg_override(SYS_CTR_EL0, read_cpuid_effective_cachetype());
> +	info->reg_dczid = read_cpuid_with_overrides(DCZID_EL0);
>  	info->reg_midr = read_cpuid_id();
>  	info->reg_revidr = read_cpuid(REVIDR_EL1);
>  	info->reg_aidr = read_cpuid(AIDR_EL1);
>  
> -	info->reg_id_aa64dfr0 = read_cpuid(ID_AA64DFR0_EL1);
> -	info->reg_id_aa64dfr1 = read_cpuid(ID_AA64DFR1_EL1);
> -	info->reg_id_aa64isar0 = read_cpuid(ID_AA64ISAR0_EL1);
> -	info->reg_id_aa64isar1 = read_cpuid(ID_AA64ISAR1_EL1);
> -	info->reg_id_aa64isar2 = read_cpuid(ID_AA64ISAR2_EL1);
> -	info->reg_id_aa64isar3 = read_cpuid(ID_AA64ISAR3_EL1);
> -	info->reg_id_aa64mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
> -	info->reg_id_aa64mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
> -	info->reg_id_aa64mmfr2 = read_cpuid(ID_AA64MMFR2_EL1);
> -	info->reg_id_aa64mmfr3 = read_cpuid(ID_AA64MMFR3_EL1);
> -	info->reg_id_aa64mmfr4 = read_cpuid(ID_AA64MMFR4_EL1);
> +	info->reg_id_aa64dfr0 = read_cpuid_with_overrides(ID_AA64DFR0_EL1);
> +	info->reg_id_aa64dfr1 = read_cpuid_with_overrides(ID_AA64DFR1_EL1);
> +	info->reg_id_aa64isar0 = read_cpuid_with_overrides(ID_AA64ISAR0_EL1);
> +	info->reg_id_aa64isar1 = read_cpuid_with_overrides(ID_AA64ISAR1_EL1);
> +	info->reg_id_aa64isar2 = read_cpuid_with_overrides(ID_AA64ISAR2_EL1);
> +	info->reg_id_aa64isar3 = read_cpuid_with_overrides(ID_AA64ISAR3_EL1);
> +	info->reg_id_aa64mmfr0 = read_cpuid_with_overrides(ID_AA64MMFR0_EL1);
> +	info->reg_id_aa64mmfr1 = read_cpuid_with_overrides(ID_AA64MMFR1_EL1);
> +	info->reg_id_aa64mmfr2 = read_cpuid_with_overrides(ID_AA64MMFR2_EL1);
> +	info->reg_id_aa64mmfr3 = read_cpuid_with_overrides(ID_AA64MMFR3_EL1);
> +	info->reg_id_aa64mmfr4 = read_cpuid_with_overrides(ID_AA64MMFR4_EL1);
>  	info->reg_id_aa64pfr0 = read_cpuid_with_overrides(ID_AA64PFR0_EL1);
>  	info->reg_id_aa64pfr1 = read_cpuid_with_overrides(ID_AA64PFR1_EL1);
> -	info->reg_id_aa64pfr2 = read_cpuid(ID_AA64PFR2_EL1);
> -	info->reg_id_aa64zfr0 = read_cpuid(ID_AA64ZFR0_EL1);
> -	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
> -	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
> +	info->reg_id_aa64pfr2 = read_cpuid_with_overrides(ID_AA64PFR2_EL1);
> +	info->reg_id_aa64zfr0 = read_cpuid_with_overrides(ID_AA64ZFR0_EL1);
> +	info->reg_id_aa64smfr0 = read_cpuid_with_overrides(ID_AA64SMFR0_EL1);
> +	info->reg_id_aa64fpfr0 = read_cpuid_with_overrides(ID_AA64FPFR0_EL1);
>  
>  	if (IS_ENABLED(CONFIG_ARM64_MTE) && id_aa64pfr1_mte(info->reg_id_aa64pfr1))
> -		info->reg_gmid = read_cpuid(GMID_EL1);
> +		info->reg_gmid = read_cpuid_with_overrides(GMID_EL1);
>  
>  	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0) || id_aa64pfr1_mpamfrac(info->reg_id_aa64pfr1))
> -		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
> +		info->reg_mpamidr = read_cpuid_with_overrides(MPAMIDR_EL1);
>  
>  	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
>  		__cpuinfo_store_cpu_32bit(&info->aarch32);

For completeness shouldn't read_cpuid(SMIDR_EL1) change to
read_cpuid_with_overrides(SMIDR_EL1)?

Thanks,

Ben


