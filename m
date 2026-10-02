Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F76514776
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790962804; cv=none; b=hbcehP52JjCasaNzTBVm6dcIZhPRdw5d/1/QCRwqiqFApyhVmS4iU2j1fdsmkS2yVe0246Lp5W2mAqr9rVgEQXckA8tKRWPElhHr4+2OGBqGM5oSDu2arua1YWQwEp4OvFNMWDJGtDD0KsGjY169NG+fDTWOMNGVzqapqlfMxRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790962804; c=relaxed/simple;
	bh=8AOzxXFPkwZXoPCLFKcDeivji18LzJ50iTSm+cbY8ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cl/YBta4H+D8m3E0A3TPa3yVZtIz5qXB8m9z5HS5QAI+m3fIQBXjMaA2f0gjJ7osM+oNtiFqmRTNsq2YVl4qWmOEEJ8IwJ2cBxaCDTBXqKGAc/y+QkXBjCUEAgdEB3iP2xMoaiibxJj2mO5fs/vHGPxekPiF9DoLec2jeCf+bYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kjG7HIVx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kjG7HIVx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F9FC143D;
	Fri,  2 Oct 2026 10:39:29 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0093F3F85F;
	Fri,  2 Oct 2026 10:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962772; bh=8AOzxXFPkwZXoPCLFKcDeivji18LzJ50iTSm+cbY8ko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kjG7HIVxVIENDoXL11f0gaBtvKOuWmSfU1kJ5KeXEapofDmepwbGaBJ48wyelyrU5
	 Tm/DuKphEBpP7Vxww9OYm69SPICuNmwFu1utqna+g93kPHg2X/PxnmRpBughyB3cn8
	 sl7f9/Pc9LD14c3PGOD/J4VLg3HxhI/yZ6qctCJQ=
Message-ID: <0bedf04c-24ef-40de-909f-b41dd72b8e78@arm.com>
Date: Fri, 2 Oct 2026 18:39:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/13] arm_mpam: propagate MSC access errors for MBWU
 counters
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Ben Horgan <ben.horgan@arm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
 linux-acpi@vger.kernel.org--cc, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261001153439.3295416-1-andre.przywara@arm.com>
 <20261001153439.3295416-4-andre.przywara@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20261001153439.3295416-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andre,

I've picked up this series to send on to Catalin and Will ...

On 01/10/2026 16:34, Andre Przywara wrote:
> Allow the mpam_msc_read_mbwu_l() function to return an error, and
> propagate errors from the lower level up. This also changes the users
> of this function.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 3aefeab371788..583560798dd8b 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1327,10 +1338,12 @@ static void __ris_msmon_read(void *arg)
>  	struct mpam_msc *msc = m->ris->vmsc->msc;
>  	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
>  
> -	if (!mpam_mon_sel_lock(msc)) {
> +	ACQUIRE(mon_sel_lock, guard)(msc);
> +	if (ACQUIRE_ERR(mon_sel_lock, &guard)) {
>  		m->err = -EIO;
>  		return;
>  	}
> +
>  	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
>  		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
>  	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);


This conflicts with Ben's fixes [0] that turn this into __ris_msmon_read_locked().
I don't think the ACQUIRE buys us anything after that, as none of the callers need
to return early, and __ris_msmon_read_locked() can always just return.

The same thing happens in mpam_save_mbwu_state() where Ben's change means you no
longer need an early return after mpam_msc_read_mbwu_l().

Please double check I've not botched your patch when fixing up the conflict!
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/tag/?h=mpam/for-next/v7.4_v2

Thanks,

James


[0] https://lore.kernel.org/linux-arm-kernel/20260917145617.2202986-1-ben.horgan@arm.com/


> @@ -1423,7 +1438,6 @@ static void __ris_msmon_read(void *arg)
>  	default:
>  		m->err = -EINVAL;
>  	}
> -	mpam_mon_sel_unlock(msc);
>  
>  	if (nrdy)
>  		m->err = -EBUSY;
> @@ -1784,6 +1798,7 @@ static int mpam_save_mbwu_state(void *arg)
>  {
>  	int i;
>  	u64 val;
> +	int ret;
>  	struct mon_cfg *cfg;
>  	u32 cur_flt, cur_ctl, mon_sel;
>  	struct mpam_msc_ris *ris = arg;
> @@ -1794,7 +1809,8 @@ static int mpam_save_mbwu_state(void *arg)
>  		mbwu_state = &ris->mbwu_state[i];
>  		cfg = &mbwu_state->cfg;
>  
> -		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> +		ACQUIRE(mon_sel_lock, guard)(msc);
> +		if (ACQUIRE_ERR(mon_sel_lock, &guard))
>  			return -EIO;
>  
>  		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
> @@ -1805,7 +1821,9 @@ static int mpam_save_mbwu_state(void *arg)
>  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>  
>  		if (mpam_ris_has_mbwu_long_counter(ris)) {
> -			val = mpam_msc_read_mbwu_l(msc);
> +			ret = mpam_msc_read_mbwu_l(msc, &val);
> +			if (ret)
> +				return ret;
>  			mpam_msc_zero_mbwu_l(msc);
>  		} else {
>  			u32 val32;
> @@ -1821,7 +1839,6 @@ static int mpam_save_mbwu_state(void *arg)
>  		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>  		mbwu_state->correction += val;
>  		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
> -		mpam_mon_sel_unlock(msc);
>  	}
>  
>  	return 0;

