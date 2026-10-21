Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573300;
	b=AMiB1B9mehZslT/nUiA+CVKc0kxJxAsIPGg8ZDG6Dggpt1rXgxhD3qiRiarhQy1/arXB
	 5bTdjtG3GitK/a7I849zktjxeXH0f1hOYj2ACqNPPZF7pPzZxVXMLPbXMpVYhk5R6jp/g
	 o8H4l1Jcmkaht+qRon85LeTFRjMHA16q4mATvpN9Tnu5h7abLAvhXNUWZFR6MoL72Adoy
	 3BoPf9SKy7Ev1mPIFWTRBdlPMdazk/CnmM70pN+l69dXyVe/GIkgA13+hJ28ADimHSrh/
	 NgwGolmTUJAw9lG1XJeBytzIcRWYvalknBmxmKrO9HIaa7SzZCh8+vAWvzKZ4Py7yRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573300;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZIYBFbjC/JqHo0qDK7NxuyTwTfuFB9bR24RyXwEbtJw=;
	b=gW+nDrGRKKLVnhZSopUesO+68LQYsg+GilqM4MYhdrqr2Cz6ELhAgD+3y7ggG4CNyovo
	 ZFgxAnJy9T0atK5ZbJm8wLtViSp+0TxGR9IvyWDub79FLH41JgK38WUtrm1sIlfNeL9I6
	 KOJjjydth5IqRqKYU72B0hhdmhrkVpCbXDYTSTIE6kPWQscves0fRuLbsfFZQ53MmZ88X
	 IkJyGwGkvfxa7GAQa6osIvvrSQfdgQ/I7RSLqxRpNyYESt6IoMeR5tHdYwyipQNI3KtCr
	 KWexYOwKlFhKURt+L2HiqtVb/rOVvP6g4PmHUPL0T3iWoquxHl8qiV6TmKcQa3u9S9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CtwAc54H;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA4A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA4A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CtwAc54H
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1898C1476;
	Wed, 21 Oct 2026 02:01:36 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 423013F7B4;
	Wed, 21 Oct 2026 02:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792573299; bh=IF9maRMh0ugYhaWVRkx0qEpMGhQizVGkaK12H+FqOb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CtwAc54HU8054fUIqwxPvGqgDv1y8BiPTMukHE8vK7E3wsJAPqkZVb4s19U8s5WyL
	 r/cDYTKzp2qSTXixDwHCWkXzNrV/0xX0IUGLysYCa7DlSmdDe8MrLQRXs5LWaik5Pa
	 /thsOstjqTY2LxEUh1k4dkl8p/uYx8Q1VSfnYMrQ=
Message-ID: <f73ab1cf-490e-4e81-8307-92f5eaae12c7@arm.com>
Date: Wed, 21 Oct 2026 10:01:36 +0100
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
Subject: Re: [PATCH] arm_mpam: Release the mon_sel lock on
 mpam_save_mbwu_state() errors
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: andre.przywara@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, reinette.chatre@intel.com,
 fenghuay@nvidia.com
References: <20261020114807.3915705-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261020114807.3915705-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 20/10/2026 12:48, Ping Li wrote:
> mpam_save_mbwu_state() takes the mon_sel lock at the top of each loop
> iteration, but the four error paths that return after failed
> MPAMF_MON_SEL register accesses do so without releasing it.
> 
> Take the lock with the conditional mon_sel_lock guard class instead,
> so all exit paths release it.
> 
> Fixes: a3a94c13c442 ("arm_mpam: propagate MSC access errors for state saving function")
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>

Thanks for this. Looks like this was a result of the conflict between the MPAM-Fb series and my
minor fixes series.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Cheers,

Ben

> ---
>  drivers/resctrl/mpam_devices.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..c067b6d57d71 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2037,8 +2037,10 @@ static int mpam_save_mbwu_state(void *arg)
>  	struct mpam_class *class = ris->vmsc->comp->class;
>  
>  	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
> -		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> -			return -EIO;
> +		ACQUIRE(mon_sel_lock, guard)(msc);
> +		ret = ACQUIRE_ERR(mon_sel_lock, &guard);
> +		if (ret)
> +			return ret;
>  
>  		mbwu_state = &ris->mbwu_state[i];
>  		cfg = &mbwu_state->cfg;
> @@ -2061,10 +2063,8 @@ static int mpam_save_mbwu_state(void *arg)
>  		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>  		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
>  
> -		if (!mbwu_state->enabled) {
> -			mpam_mon_sel_unlock(msc);
> +		if (!mbwu_state->enabled)
>  			continue;
> -		}
>  
>  		val = 0;
>  		mbwu_arg = (struct mon_read) {
> @@ -2088,8 +2088,6 @@ static int mpam_save_mbwu_state(void *arg)
>  		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>  		if (ret)
>  			return ret;
> -
> -		mpam_mon_sel_unlock(msc);
>  	}
>  
>  	return 0;
> 
> base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad

