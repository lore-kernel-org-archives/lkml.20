Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794517331;
	b=EUL0ikhS28VDhOdH+KDONS3Z60g0kR4g3hgmj5/ygS+0PGzdftGDKojmmewBnPJlq6fQ
	 AMC9Y1ye+r1bcHeSMyR6rpSSHYTpHEtS+PXOKSgzShx96FNAkzYBAtUn/ghhtqD7gEiI6
	 gGyhhTREDbaaIIW01GD/ELsOKGr5cXvRC7C4eLfajscjvkXG7Z3cKT3lw7Ste+x0hGuax
	 NszZZx6oQ5XEHeCvtKEUvdPHuQEWDB4spcGE8poy3Ov3OSWoPHaIX1AzM4fAULk5qt091
	 usSZFuhg5jCrGdHNhKmVU6yw4D79xogADuZ6d3sg8MlrPi/iYpQVDXSprzjzkyDb7Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517331;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mZUvmKDMAWg2GS+aWsVhXjonVWOcc4rZt1XSjbUmm7k=;
	b=aLPc4NvLTRiqFF5FqK8yTx/fxSHgn1UN9mX7tGaWRstCdZoIIgJ31++8dzumIwRnNtVd
	 MIMM+znooBjCavzeVLLolMZ0ibymvdqOVehQW0ZQgkY2a8ldfxTF2QSpvUsppBZlLxZRJ
	 lElXlKijtzNNQNRZmv3TLaeDbftC3qYMxmxD4gWM4vvEhu4zYWLPRDSXAgu2v8iIcfxgF
	 OmX7e/r0WG0JhmTbTio49OVqT6q0378P/Qu7t5YpSGGh8/v5MkNBrIR26fTreRk4jd3zo
	 vjbC+gLJU2tXO9LM/dMx+HCanBZ40Rxry8Ba/hYHYX10xvr7saKtOCNcft0gGvZEdlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="eoW7ke6/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57646606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57646606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eoW7ke6/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E82D11516;
	Thu, 12 Nov 2026 13:02:06 -0800 (PST)
Received: from [10.57.15.226] (unknown [10.57.15.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D0FA3F85F;
	Thu, 12 Nov 2026 13:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794517330; bh=kpE+vKitxl/WkaLdAORq01UZiNb0863ZWZuJw47idag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eoW7ke6/oz4f5/yEbcARpCDN2wynpoZ7uR+/+WJHGameM/ICwL6iuJqZB9MEXWamt
	 555Oe4giT0+VjXmfp4b6mZPwxnhtBtfN0GW+50B5+cNUjzS8Lw22d2S+6yQKjXQFNx
	 VM/CRgriF79RRBzFIE3bk9mzxRw7/mr8ZUsmSmeQ=
Message-ID: <45c2bb0c-5b5f-4290-9265-ed02a2c241d4@arm.com>
Date: Thu, 12 Nov 2026 21:02:06 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: topology: Reduce the skew for AMU feedback
 counter sampling
To: Beata Michalska <beata.michalska@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com, catalin.marinas@arm.com, will@kernel.org,
 suzuki.poulose@arm.com, xuewen.yan94@gmail.com, linux-kernel@vger.kernel.org
References: <20261112191211.3336725-1-beata.michalska@arm.com>
 <20261112191211.3336725-4-beata.michalska@arm.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261112191211.3336725-4-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 19:12, Beata Michalska wrote:
> With the FFH support for CPPC, the AMU feedback counters, core and const
> counter, are being sampled to measure CPU performance. Checking for errata
> (which can affect both counters) between the reads delays the second
> one and can skew the result.
> 
> Read both counters in succession if none is actually affected by HW
> errata.
> 
> And while at it, update the comments to be more accurate (or less
> inaccurate).
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>

Reviewed-by: Christian Loehle <christian.loehle@arm.com>

Testing this via the sysfs cpuinfo_cur_freq on orion o6 A520 (not
affected, both counters work) I get a p99 sampling error of:


  Reader / target workload             Before           Patch
  -------------------------------------------------------------
  Remote big CPU / idle                11.11             0.17
  Remote big CPU / busy                 2.22             0.22
  Another little CPU / busy             2.06             0.22
  Local / busy                         13.56             1.17

Nice!
Tested-by: Christian Loehle <christian.loehle@arm.com>

> ---
>  arch/arm64/kernel/topology.c | 38 ++++++++++++++++++++++--------------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 30a52659f15c..d00aec6354e4 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -384,10 +384,10 @@ enum cpc_ffh_ctr_id {
>  static void cpu_read_corecnt(void *val)
>  {
>  	/*
> -	 * A value of 0 can be returned if the current CPU does not support AMUs
> -	 * or if the counter is disabled for this CPU. A return value of 0 at
> -	 * counter read is properly handled as an error case by the users of the
> -	 * counter.
> +	 * Return 0 if the current CPU is affected by a HW erratum.
> +	 * Otherwise, return the AMU counter value.
> +	 *
> +	 * A counter value of 0 is treated as an error by callers.
>  	 */
>  	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
>  		      0UL : read_corecnt();
> @@ -397,10 +397,9 @@ static void cpu_read_constcnt(void *val)
>  {
>  	/*
>  	 * Return 0 if the current CPU is affected by a HW erratum.
> -	 * A value of 0 is also returned if the current CPU does not
> -	 * support AMUs or if the counter is disabled. A return
> -	 * value of 0 at counter read is properly handled as an error
> -	 * case by the users of the counter.
> +	 * Otherwise, return the AMU counter value.
> +	 *
> +	 * A counter value of 0 is treated as an error by callers.
>  	 */
>  	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
>  		      0UL : read_constcnt();
> @@ -460,15 +459,24 @@ bool cpc_ffh_supported(void)
>  static void amu_read_core_const_ctrs(void *val)
>  {
>  	struct amu_ffh_ctrs *ctrs = val;
> -
> +	bool corecntr_broken =
> +		this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT);
> +	bool constcntr_broken =
> +		this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT);
> +
> +	if (!corecntr_broken && !constcntr_broken) {
> +		ctrs->corecnt = read_corecnt();
> +		ctrs->constcnt = read_constcnt();
> +		return;
> +	}
>  	/*
> -	 * cpu_read_constcnt() incurs slight latency due to the
> -	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
> -	 * Read it first to minimize the sampling skew between the const
> -	 * and core counters.
> +	 * Return 0 if the current CPU is affected by a HW erratum.
> +	 * Otherwise, return the AMU counter value.
> +	 *
> +	 * A counter value of 0 is treated as an error by callers.
>  	 */
> -	cpu_read_constcnt(&ctrs->constcnt);
> -	cpu_read_corecnt(&ctrs->corecnt);
> +	ctrs->corecnt = corecntr_broken ? 0UL : read_corecnt();
> +	ctrs->constcnt = constcntr_broken ? 0UL : read_constcnt();
>  }
>  
>  static bool cpc_ffh_reg_valid(const struct cpc_reg *reg)

