Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88964C33EF
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953296; cv=none; b=OHE5Whb25KkOUfzT6gxe1y0mSmW3MUOYutH5FpUTI7NgCYAkDwfbmzFaPzOTLCzm6o5HtAJrk3BJ4fT0du7ett6NRgPnSfQw+VAoT06sqzrkgMZ/8osKBegIf8EZR9He2HkqB510EgLdGgiVyFyORMDvO252zV2/XPZEXhdf7qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953296; c=relaxed/simple;
	bh=CSPMny85UEPu5DAMEUzTlLa9GbYv296ddDiSXLN8qbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaZK/ZI84KOkKag26J+EqdCV/N+Zq0Tw7rigMS0PXtG6gMwCKZ26KtDSiRYdytnfWWrC1K8qFnaokbnJM2rDt8rGlOdiGTEL7KKNS98mnnYJCeZ2NkJVvtlF/ITtA547K5G/pvhKc9tNSgshSUXtUczGwY5hMRWm0HhrGmSlI+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EZdMJh0a; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EZdMJh0a"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85FF9497;
	Fri,  2 Oct 2026 08:01:30 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE7043F86F;
	Fri,  2 Oct 2026 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953293; bh=CSPMny85UEPu5DAMEUzTlLa9GbYv296ddDiSXLN8qbE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EZdMJh0aGT+xBbnYX3SZk2cZxFhlLx/bKWaq0iYVGvmVongZITAnp28emds7GNERB
	 fir79ce2ZqPLQGo6kV30/fqvYva/1TUFIxFreC1u3oPpyb//K09zqkMnukUnaiM/oD
	 oZWX6lPgxtSkWARWFxd69vl6mGqBmPH9fsb20tkE=
Message-ID: <4efe1c1e-5fef-410f-90c7-6638486706d0@arm.com>
Date: Fri, 2 Oct 2026 16:01:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] arm_mpam: Add missing mon_sel locking in MBWU
 save and restore
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-5-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-5-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> The mon_sel_lock is used to protect the mbwu_state, as well as h/w accesses
> that use MPAMCFG_MON_SEL. However, in mpam_restore/save_mbwu_state(),
> mbwu_state is accessed without holding the mon_sel_lock.

This is me being sloppy - I was only worried about concurrent writers, not
use of the array itself. But this is clearly better!


> Add the missing locking.


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index e349db525882..d39d210574a6 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1652,17 +1652,26 @@ static int mpam_restore_mbwu_state(void *_ris)
>  	u64 val;
>  	struct mon_read mwbu_arg;
>  	struct mpam_msc_ris *ris = _ris;
> +	struct mpam_msc *msc = ris->vmsc->msc;
>  	struct mpam_class *class = ris->vmsc->comp->class;
>  
>  	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
> -		if (ris->mbwu_state[i].enabled) {
> -			mwbu_arg.ris = ris;
> -			mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
> -			mwbu_arg.type = mpam_msmon_choose_counter(class);
> -			mwbu_arg.val = &val;
> +		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> +			return -EIO;
>  
> -			__ris_msmon_read(&mwbu_arg);
> +		if (!ris->mbwu_state[i].enabled) {
> +			mpam_mon_sel_unlock(msc);
> +			continue;
>  		}
> +
> +		mwbu_arg.ris = ris;
> +		mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
> +		mwbu_arg.type = mpam_msmon_choose_counter(class);
> +		mwbu_arg.val = &val;

> +		mpam_mon_sel_unlock(msc);
> +
> +		__ris_msmon_read(&mwbu_arg);

Dropping and re-taking the lock in __ris_msmon_read() means everything we cached
in mbwu_arg could in principle change. I don't think it does - but if we're trying
to be robust/unsurprising: we probably need a __ris_msmon_read_locked(), or because of
that cfg pointer - always get the caller to take the lock.

This is better - so we shouldn't let perfect be the enemy of good.

~

Turns out you clean this up in a few patches time. It's theoretical, so the order
doesn't matter.


>  	}
>  
>  	return 0;
> @@ -1680,12 +1689,12 @@ static int mpam_save_mbwu_state(void *arg)
>  	struct mpam_msc *msc = ris->vmsc->msc;
>  
>  	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
> -		mbwu_state = &ris->mbwu_state[i];
> -		cfg = &mbwu_state->cfg;

Yeah, I was only worried about concurrent writes. But this is clearly better.


>  		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>  			return -EIO;
>  
> +		mbwu_state = &ris->mbwu_state[i];
> +		cfg = &mbwu_state->cfg;
To check - do you agree we don't need to worry about the array being free()d?
Because the first thing teardown does is disable the static-key and unregister
the cpuhp callbacks, it shouldn't be possible to reach this code before the
array gets freed...


>  		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
>  			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
>  		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);


Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James
