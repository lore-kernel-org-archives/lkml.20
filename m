Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3E84E0201
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954143; cv=none; b=TjEgjp4E03kXZAnBfoiskZWmagX8DFt7EnZFXtlK00ReF0Cis4E5bHkR5M7Zr9stFrH1Mmq9d0eBWF89S1ANJt9fBYUcn4VrHWMfGCZumSvgqkCFd0A8hAOYWIel62m2hxz0W8efIdk7a25xysyOdTYD0gQ7rxt3eaGbdGGSd+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954143; c=relaxed/simple;
	bh=hvT7wfdq8QbGghllrNLZ5Dz9q8dq+/FpN7x2LzVn26A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+OM/6VCT6Qzi9SNSr446g2gjRpZH2orWFI7zkhqLTEnLZOy7vr/LHI30MMEAwIB6ZIEiJmUc4nNfuUQFdDisDvOBzKsW87orr4tyr40lbaLoQ4UgZy+301FLsXING5na0InoyMK5PoB5yAqCQgnno4eBVhH1O+w+6GtQKND36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PVbP+SnB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PVbP+SnB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F08C143D;
	Fri,  2 Oct 2026 08:15:33 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CACE53F85F;
	Fri,  2 Oct 2026 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954136; bh=hvT7wfdq8QbGghllrNLZ5Dz9q8dq+/FpN7x2LzVn26A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PVbP+SnBZHuTbLZew0Lw2S5JCWmg7Q4cyUjAZGasaoUHKYN39cDNwRnICqMT2BLzh
	 LJtS2u3QHbPBpVWC69MzF5bvKXaWEJdNR0m/STP1rQCzJJl3yPQHvG0ycuUNJ5Ywz+
	 /ZB+xWxnHQfUAdG0rBG+jbiHlNIIoiLzP6AY/oFs=
Message-ID: <32c85a0b-48f3-407f-bc60-a58255806683@arm.com>
Date: Fri, 2 Oct 2026 16:15:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] arm_mpam: Use __ris_msmon_read() for saving MBWU
 state
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-7-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-7-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> mbwu_save_mbwu_state() reads the MBWU counters and adds that to a saved
> correction value. However, the type of counter to read is determined by the
> RIS rather than the class and overflow is not taken into account. Fix this
> and mitigate against further divergence by using a locked variant of the
> same helper used for user monitor reads, __ris_msmon_read(). Using the
> locked variant avoids having to drop and retake the mon_sel lock. If the
> lock was dropped, an interleaved monitor read which detects overflow would
> cause the overflow not to be accounted for in the saved value of
> mbwu_state->correction. The correction is no longer updated for disabled
> counters but this has no effect as the saved values are not expected to be
> useful for disabled counters.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 6cba3ef21cc8..62562ce2f9aa 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c


> @@ -1688,10 +1693,12 @@ static int mpam_save_mbwu_state(void *arg)
>  	int i;
>  	u64 val;
>  	struct mon_cfg *cfg;
> +	struct mon_read mbwu_arg;
>  	u32 cur_flt, cur_ctl, mon_sel;
>  	struct mpam_msc_ris *ris = arg;
>  	struct msmon_mbwu_state *mbwu_state;
>  	struct mpam_msc *msc = ris->vmsc->msc;
> +	struct mpam_class *class = ris->vmsc->comp->class;
>  
>  	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>  		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> @@ -1707,17 +1714,31 @@ static int mpam_save_mbwu_state(void *arg)
>  		cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
>  		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);

>  		cfg->mon = i;
>  		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
>  		cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
>  		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>  		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
> +
> +		if (!mbwu_state->enabled) {
> +			mpam_mon_sel_unlock(msc);
> +			continue;
> +		}
> +
> +		val = 0;
> +		mbwu_arg = (struct mon_read) {
> +			.ris = ris,
> +			.ctx = cfg,
> +			.type = mpam_msmon_choose_counter(class),
> +			.val = &val,
> +		};
> +
> +		__ris_msmon_read_locked(&mbwu_arg);
> +
> +		mbwu_state->reset_on_next_read = true;
> +		if (!mbwu_arg.err)
> +			mbwu_state->correction = val;

+= val?

If the same CPU is offlined twice, the correction should hold the sum of both values.
The idea is the 'correction' is anything that has been consumed, and isn't in the hardware
register. (e.g. due to overflow or reset)

With that:
Reviewed-by: James Morse <james.morse@arm.com>


> +
>  		mpam_mon_sel_unlock(msc);
>  	}
>  


Thanks,

James
