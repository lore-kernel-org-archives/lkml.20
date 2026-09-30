Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2495F51AED3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801465; cv=none; b=ZUeBU8MQ60hTrZp4vmzYYrd3lIzKJfwZUQgD1Fjh0vyaS3EM1n+T70pOSdmgjlBOIsGR3s153sIIjyVxz4lecnwehr2krw5NZGZ1E9g0PO20+pwt4lQLjxlSOk/seTRenOGwRdESbShWq48bIxS2/1u7SuGfgkGgv28+kNwq4vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801465; c=relaxed/simple;
	bh=o6JsEQle2TgBGXyra/fkAAW50pTRLJXiPJdy1imZk68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eb9Uxv3cjz1dVoD87AeQ4/HslOlDYHwSWNMo8U7xkdzkAIqia1yzYFKngxANQB+awzoPoE5FPuB8SEMT6tfvj4jScOELXDUeQ9Uy0SITuqAA7E4gyvVX+im83d4zXghzzXsnhUvR9DVfBTfO4MsqVQhivKCiLosVVHSYeMfIA/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HfXxO7UU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HfXxO7UU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31FD2497
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:50:57 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 679F93F85F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790801460; bh=o6JsEQle2TgBGXyra/fkAAW50pTRLJXiPJdy1imZk68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfXxO7UUjD8Bm3t+Sx6f9dO02Cb0BQ1HdQip/w+jyV5397NOtgWZeeRQNrfbVpL0/
	 I3Qb2X7erXt+9zKaEIGkPE3XINmRnDKcAFboB58j1ZTy/hUiVxhDUjFJz2ekVKrHup
	 ms4Fr38S7VOyv0rVPmoqqz7MLL3Sqs0kNNx6HWHo=
Date: Wed, 30 Sep 2026 21:50:51 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Weigang He <geoffreyhe2@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: vexpress: fix device_node refcount leak in
 vexpress_smp_dt_prepare_cpus()
Message-ID: <ar12K0NGkuO9_XK_@e142607>
References: <20260925173252.933705-1-geoffreyhe2@gmail.com>
 <20260925173252.933705-3-geoffreyhe2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925173252.933705-3-geoffreyhe2@gmail.com>

On Sat, Sep 26, 2026 at 03:32:52AM +1000, Weigang He wrote:
> vexpress_smp_dt_prepare_cpus() obtains a reference to the SCU device
> node via of_find_matching_node() and passes it to of_iomap(), but never
> calls of_node_put() on it. of_iomap() does not take ownership of the
> node, so the reference is leaked. The function is the .smp_prepare_cpus
> hook invoked once from the __init SMP bring-up path, so this is a
> one-shot leak of a single refcount during boot, with no functional
> impact.
> 
> Annotate scu with the __free(device_node) cleanup attribute so the
> reference is released when the function returns.
> 
> Found while reviewing a CodeQL report for vexpress_flags_set() on the
> same SMP bring-up path.
> 
> Fixes: d2606f81d563 ("ARM: vexpress: Simplify SMP operations for DT-powered system")
> Assisted-by: LLM codeql
> Signed-off-by: Weigang He <geoffreyhe2@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> 
> Notes:
>     Compile-tested only (ARCH=arm multi_v7_defconfig, W=1). Not tested on
>     hardware; I have no Versatile Express board.
>     
>     The CodeQL query behind this report was synthesized with LLM assistance,
>     and the fix and changelog were drafted with LLM assistance; I have
>     reviewed them.
> 
>  arch/arm/mach-versatile/platsmp-vexpress.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-versatile/platsmp-vexpress.c b/arch/arm/mach-versatile/platsmp-vexpress.c
> index 1ee3c45e71c99..b810ad50b98ce 100644
> --- a/arch/arm/mach-versatile/platsmp-vexpress.c
> +++ b/arch/arm/mach-versatile/platsmp-vexpress.c
> @@ -61,8 +61,8 @@ static const struct of_device_id vexpress_smp_dt_scu_match[] __initconst = {
>  
>  static void __init vexpress_smp_dt_prepare_cpus(unsigned int max_cpus)
>  {
> -	struct device_node *scu = of_find_matching_node(NULL,
> -			vexpress_smp_dt_scu_match);
> +	struct device_node *scu __free(device_node) =
> +		of_find_matching_node(NULL, vexpress_smp_dt_scu_match);
>  
>  	if (scu)
>  		scu_enable(of_iomap(scu, 0));
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
