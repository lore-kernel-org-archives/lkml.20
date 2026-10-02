Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686234D4898
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953995; cv=none; b=bVSNjb5gjjA7vQfToxGYx3jU81b9pBK4EsKGNoTgVobbSgFyFOOSe4coD0VtFTU8s906stU+9kvy6szxNHEgJeyuOSGhZl/3f1X92kWUf4DyE8lgsf62FHKtpe01Hk/u6aRy2AlMfViaCU+7SrYAf35WqoASXbI3Szt7uOACWks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953995; c=relaxed/simple;
	bh=jUwYm8A449oFyERTeHMiXV6Q+jSW+utHZmHcbtHiDIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeJyr+K44NZrJQR/0uQen9k3ZTgk+E+GswayE54BUWN2xKTV/Gu57zieNpIYBq8SUYNfEEw7MYsmZbk46iOfv+o1Ycrr6dNhl5Kk8B0oUaJ87fRt/yAtCNFJu2MsxU8bYBEOV2UipHR04U7W0GiJ5gralI0yzvHpdhb75Pptdo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PyVT89QG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PyVT89QG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7A3143D;
	Fri,  2 Oct 2026 08:13:08 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 253603F85F;
	Fri,  2 Oct 2026 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953992; bh=jUwYm8A449oFyERTeHMiXV6Q+jSW+utHZmHcbtHiDIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PyVT89QGatZIIud1XV+UTsOLiIwaLnnaGqTJevACKxSvJns+jdMbQSS0lulFkChIZ
	 WoZDkvYmg5SbAOznG34b7NpQDPc5r/hHWaQ5o38Vtwzdud/hh4BWRGGxfko9WWzduA
	 427KgUdySdoM2Whfrg02/+iyT4QBIPvMCNVaToCQ=
Message-ID: <b61f8b82-a872-4d50-88fc-845287305011@arm.com>
Date: Fri, 2 Oct 2026 16:13:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] arm_mpam: Ensure MBWU counters are reset on
 restore
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-6-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-6-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> When an MSC becomes inaccessible due to cpu offline CFG_MBWU_CTL is set to
> zero in mpam_save_mbwu_state(). This is very likely to mean that the config
> will mismatch when restoring and so the monitor will be reset. However, the
> state may have been lost and so there are no guarantees.

Power management and kexec are the reason this is done.

I have a niggling suspicion that some hardware engineer may allow 'running counters'
to inhibit power-down - which means the cache could stay on when all its CPUs are off.

We may kexec while these CPUs are off. Leaving the hardware in its reset state is
the least surprising thing to do, and also means we don't get bitten by the above
(theoretical) power management thing if the next kernel doesn't know about MPAM.


> Ensure the reset happens by setting the reset_on_next_read

Doing this makes it more robust,


> and remove the unnecessary writes from mpam_save_mbwu_state().

I think this is still a good thing to do.


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index d39d210574a6..6cba3ef21cc8 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1652,6 +1652,7 @@ static int mpam_restore_mbwu_state(void *_ris)
>  	u64 val;
>  	struct mon_read mwbu_arg;
>  	struct mpam_msc_ris *ris = _ris;
> +	struct msmon_mbwu_state *mbwu_state;
>  	struct mpam_msc *msc = ris->vmsc->msc;
>  	struct mpam_class *class = ris->vmsc->comp->class;
>  
> @@ -1659,16 +1660,20 @@ static int mpam_restore_mbwu_state(void *_ris)
>  		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>  			return -EIO;
>  
> -		if (!ris->mbwu_state[i].enabled) {
> +		mbwu_state = &ris->mbwu_state[i];
> +
> +		if (!mbwu_state->enabled) {
>  			mpam_mon_sel_unlock(msc);
>  			continue;
>  		}
>  
>  		mwbu_arg.ris = ris;
> -		mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
> +		mwbu_arg.ctx = &mbwu_state->cfg;
>  		mwbu_arg.type = mpam_msmon_choose_counter(class);
>  		mwbu_arg.val = &val;
>  
> +		mbwu_state->reset_on_next_read = true;
> +
>  		mpam_mon_sel_unlock(msc);
>  
>  		__ris_msmon_read(&mwbu_arg);
> @@ -1701,15 +1706,11 @@ static int mpam_save_mbwu_state(void *arg)
>  
>  		cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
>  		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);

> -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);

I plan to drop this line,


> -		if (mpam_ris_has_mbwu_long_counter(ris)) {
> +		if (mpam_ris_has_mbwu_long_counter(ris))
>  			val = mpam_msc_read_mbwu_l(msc);
> -			mpam_msc_zero_mbwu_l(msc);
> -		} else {
> +		else
>  			val = mpam_read_monsel_reg(msc, MBWU);
> -			mpam_write_monsel_reg(msc, MBWU, 0);
> -		}

But keep this. With reset_on_next_read the driver won't consume the stale value, and
that approach also covers the hardware resetting into unusual states.


Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James
