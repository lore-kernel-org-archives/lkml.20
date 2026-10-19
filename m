Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A61B49B214
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398504; cv=none; b=VbD/nnxsYm6hjwL1BJp03EE5Rq72eF8BlFLelFV3VCviSmqEJochXDWIc4qc9zAih7EN6Txpz46eoVv5RmF4jKR0COd7A8H6c0p7q4qhw5TfV5rkh0LnktzdYyXRO6XJlMhyu7eOIdvcj/OjEp6pNkHoiNl5pTyz0p1Jrq79qAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398504; c=relaxed/simple;
	bh=MAMUsD+Btunbqy7h1FViP4OU1XWynBdWUjrCe2oaCq8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Ysey8DLvSDzqpq5vjooqtLVgDqJW2Vx6Cb0Fjtzl3F8qxRnOfVCNJRknf93OYsyEZXNX6owQjAVr73m1w3O/zyGP0EzA52T3UEaiSCIWb742PuDQTl6w9C6hG/E9q460RfMX18b2CNiEDBzY53Z7uOpr0tgSEgx/rly8kgw3VCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Z2fJ6oI+; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Z2fJ6oI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792398497; bh=1eWzC9mzeR1/sgH7aWs/Gc+4B6SEy/5agZYESlxaQ/I=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=Z2fJ6oI+ZgDcY7wdNoSv+YDhS8Ke6P9369nr7oQ2uC8yBHpz6/GiPzt4E+4JLQRz6
	 /qNgt652m1JeSTj68MDWK1KtwSHJWq9WkXNZnQ14sYXF7nyFe6ud8ZdjgLXQguLjWK
	 bd9olEVP+dxUCemJ9YGvKooK3Lef73lwY1j17WbM=
Received: from [100.125.153.207] ([139.159.170.67])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 70D8326E; Mon, 19 Oct 2026 16:28:13 +0800
X-QQ-mid: xmsmtpt1792398493tv357kcia
Message-ID: <tencent_05A406672A8ECB56ECD31E27A610216FD709@qq.com>
X-QQ-XMAILINFO: ODukwAJJE14zFcEh1t+NCfbs+uwzgAHuNFKbkZjSNbLxFb5LbX1dBUpxfZLU5k
	 acgsIWdlHnT8iJTBvb9Bq6CsUOvG14g/eYP18W7KlSb46ELHoKoN63mMRpBGsyQYLA4KwmA7D2s8
	 Efaptbqvda9zVN5y9smJgEqzw6DnpnuGpzM12/ypQKSJN7xO5mjR0eg34rOqWi2GVSqJ67AvGak0
	 aZyedI216YN7kB2znYkWR0rkuSetQiLbSVcunfSpirYU7xTpshgXzbV+oLZmLYAi8nJr5IG7niuq
	 cOMdQJw8AeBmoKPzcXbXPMeXWNSqL+bZbIiQZPeUwm79PsA3ta2CWkhwPZlagGIWFMqc2tNotLoC
	 4vwRKoahXWVdHmscxDzBXkHyEByQdnpv30LNBP4yc3/oifHxB4ZeR8Y0tbBp6jOkWSb5ZWIVzmPI
	 qjGnnausgE7hXVhGByJVuzQyXHxdSF3zG7W5dNba3JlA66oxkaucwU/X8ckkdk/ChyXGGM0RdhDl
	 yxYWAC9UUho0xwQrRqwd4w5Y3YDf8v73Je0XQdsBYWFRX7LlMxj5H8miCiUPaYPZ/Swh66BBiSc+
	 ta+tQsukV1YpXdu38le1OShTqKf86GPZyckL317vovlXK1aS9qMjbykZotTs6fh3vS8mI6+C6grn
	 WELyvgos16lgm1kKyXY6dRLPP/QGVSe3lN6zH/8upEICTvzoi/6Aa/kk3H+jdrP9sgD0MERso7jw
	 gP4Tb7kLo8OPd/zgazAcsXAclerSVV/EcJ9VIPwdS6W0/fma8bwuxcVeUpQJwPS0wbZ7wYrmnAwy
	 AFGZGHwkzsRbY2gxUvHiXic4+YbPZi/SRuLX/DMG4DpR78BNmc6NLmYdc8iNutjR6DgMgJvefQOX
	 ZexQdcZEQH6JHPSDsPMN0qLKLnnZncSF3BaR62/ogBXsYLOasOb+JHUBCvPe6+q99h5/0x48Hi7X
	 3LoYeAxs/JuJh+XpdfC9axuPIcFDY/UO8vsTuamTOqPLE/aRC2wnqY/fm38z31ITE86UT66eI+hw
	 rUlynt8yydEzq9Ljx6XnPt0EaliKH3CJiNHOgmVPfYbLt3AfN/LZmqXd8yTt+ayAwmDVh3eVVL7R
	 n4QjGT5rIq+2V9IqaXpi5B2tpm8A==
X-QQ-XMRINFO: MSVp+SPm3vtS/4gKaUdy9frqKIjLWAAWuQ==
X-OQ-MSGID: <c9b9ddd4-754c-4347-b543-b5d5d544b283@qq.com>
Date: Mon, 19 Oct 2026 16:28:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 14/15] arm_mpam: Use the request PARTIDs beyond the
 internal range
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com, ben.horgan@arm.com, bp@alien8.de,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, Dave.Martin@arm.com,
 fenghuay@nvidia.com, gshan@redhat.com, hpa@zytor.com, james.morse@arm.com,
 jic23@kernel.org, mingo@redhat.com, reinette.chatre@intel.com,
 ruanjinjie@huawei.com, tan.shaopeng@fujitsu.com, tglx@kernel.org,
 tony.luck@intel.com, zengheng4@huawei.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261019074609.2144405-1-2118537295@qq.com>
 <tencent_8B0A4E9AF24412E2F6ADAC94C84CC231FA06@qq.com>
Content-Language: en-US
In-Reply-To: <tencent_8B0A4E9AF24412E2F6ADAC94C84CC231FA06@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

This patch is part of the v10 series. For the main thread, see:

https://lore.kernel.org/all/tencent_28FE31D80A7A9AEEC43B22D0AD8894E30C06@qq.com/#t

在 2026/10/19 15:46, Jinjie Ruan 写道:
> From: Jinjie Ruan <ruanjinjie@huawei.com>
>
> A class that implements PARTID narrowing maps several request PARTIDs
> onto one internal PARTID. The internal PARTIDs hold its controls, and
> the request PARTIDs can each be a monitoring group. This gives one
> control group more monitoring groups than the PMG count alone allows.
>
> The extra request PARTIDs can only be used when no class would lose a
> non-aliasing control: its value can not be written to every PARTID of a
> control group, whereas an aliasing control's value can. Every class is
> considered, including the ones resctrl does not use, so that an unknown
> class can still gain a resctrl schema later. This is decided once,
> before resctrl_init(), and there is no user interface for it.
>
> The driver stops reducing msc->partid_max, so the full request PARTID
> range is available, and the resctrl glue code starts handing out the
> extra ones. A control group's configuration is written to every request
> PARTID that maps onto it.
>
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Fenghua Yu <fenghuay@nvidia.com>
> Suggested-by: James Morse <james.morse@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v9->v10:
>   - Wrap the intpartid mapping into the internal PARTID range when resctrl
>     is not managing the mapping
> ---
>   drivers/resctrl/mpam_devices.c  | 25 +++++++++++-
>   drivers/resctrl/mpam_internal.h |  2 +
>   drivers/resctrl/mpam_resctrl.c  | 72 ++++++++++++++++++++++++++++++++-
>   3 files changed, 96 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index f81a2df11428..79bc3339a762 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -74,6 +74,18 @@ static DEFINE_SPINLOCK(partid_max_lock);
>   static u32 mpam_num_closid;
>   static u32 mpam_num_partid;
>   
> +void mpam_partid_map_init(u32 num_partid, u32 num_closid)
> +{
> +	mpam_num_partid = num_partid;
> +	mpam_num_closid = num_closid;
> +}
> +
> +void mpam_partid_map_exit(void)
> +{
> +	mpam_num_closid = 0;
> +	mpam_num_partid = 0;
> +}
> +
>   /*
>    * Map a request PARTID onto its owning control group using modulo
>    * interleaving. Without resctrl active, every PARTID maps 1:1 onto itself.
> @@ -959,6 +971,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>   	 * A RIS that implements PARTID narrowing has one configuration per
>   	 * internal PARTID, and several request PARTIDs share it. Record both
>   	 * limits in the resource properties.
> +	 * Keep msc->partid_max at the full request PARTID range. The resctrl
> +	 * glue code will broadcast a control group's configuration to every
> +	 * request PARTID that maps onto that group's internal PARTID.
>   	 */
>   	props->partid_max = msc->partid_max;
>   	props->intpartid_max = msc->partid_max;
> @@ -969,7 +984,6 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>   
>   		mpam_set_feature(mpam_feat_partid_nrw, props);
>   		props->intpartid_max = min(props->intpartid_max, intpartid_max);
> -		msc->partid_max = min(msc->partid_max, intpartid_max);
>   	}
>   }
>   
> @@ -1581,6 +1595,15 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>   		/* Update the intpartid mapping */
>   		u16 intpartid = mpam_partid_to_intpartid(partid);
>   
> +		/*
> +		 * Without resctrl managing the mapping, the fallback maps
> +		 * every PARTID 1:1, which can exceed the internal PARTID
> +		 * range. Wrap onto an internal PARTID, like the narrowing
> +		 * mapping resctrl programs.
> +		 */
> +		if (intpartid > rprops->intpartid_max)
> +			intpartid %= (u32)rprops->intpartid_max + 1;
> +
>   		mpam_write_partsel_reg(msc, INTPARTID,
>   				       MPAMCFG_INTPARTID_INTERNAL | intpartid);
>   
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index a4f2fdf7ac95..b62a0ecdd69f 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -478,6 +478,8 @@ extern u16 mpam_partid_max;
>   extern u8 mpam_pmg_max;
>   
>   u16 mpam_partid_to_intpartid(u16 partid);
> +void mpam_partid_map_init(u32 num_partid, u32 num_closid);
> +void mpam_partid_map_exit(void);
>   
>   /* Scheduled work callback to enable mpam once all MSC have been probed */
>   void mpam_enable(struct work_struct *work);
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index d60dea846486..fb997b9d41d6 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -62,6 +62,9 @@ static DEFINE_MUTEX(domain_list_lock);
>    */
>   static bool cdp_enabled;
>   
> +static u32 resctrl_num_closid = 1;
> +static u32 resctrl_num_mon_partid = 1;
> +
>   /* If resctrl is leveraging extra request PARTIDs for monitoring. */
>   static bool resctrl_using_extra_partids;
>   
> @@ -269,12 +272,12 @@ static bool mpam_resctrl_hide_cdp(enum resctrl_res_level rid)
>    */
>   u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
>   {
> -	return mpam_partid_max + 1;
> +	return resctrl_num_closid;
>   }
>   
>   u32 resctrl_arch_system_num_rmid_idx(void)
>   {
> -	return (mpam_pmg_max + 1) * (mpam_partid_max + 1);
> +	return (mpam_pmg_max + 1) * resctrl_num_mon_partid;
>   }
>   
>   /* The request PARTID and PMG a resctrl RMID maps onto. */
> @@ -1931,6 +1934,65 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
>   	}
>   }
>   
> +/*
> + * Decide how the PARTID space is presented to resctrl. This runs once the
> + * classes are known, and before resctrl_init() advertises any limits to
> + * user-space.
> + *
> + * The extra request PARTIDs on a class that implements narrowing can be used
> + * as monitoring groups. That is only safe when no class would lose a
> + * non-aliasing control: its value can not be written to each PARTID of a
> + * control group, whereas an aliasing control's value can. A class that
> + * implements narrowing doesn't have the problem, as its PARTIDs are already
> + * configured as one.
> + *
> + * Every class is considered, including the ones resctrl doesn't use. An
> + * unknown class may gain a resctrl schema later, and using the extra PARTIDs
> + * would prevent that.
> + */
> +static void mpam_resctrl_configure_partids(void)
> +{
> +	u32 num_closid = (u32)mpam_partid_max + 1;
> +	bool can_expand = false, blocked = false;
> +	struct mpam_class *class;
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		struct mpam_props *cprops = &class->props;
> +
> +		num_closid = min(num_closid, (u32)cprops->intpartid_max + 1);
> +
> +		if (mpam_has_feature(mpam_feat_partid_nrw, cprops)) {
> +			if (cprops->intpartid_max < cprops->partid_max)
> +				can_expand = true;
> +		} else if (mpam_props_has_non_aliasing_controls(cprops)) {
> +			pr_debug("class %u has non-aliasing controls without narrowing\n",
> +				 class->level);
> +			blocked = true;
> +		}
> +	}
> +
> +	if (!num_closid)
> +		num_closid = 1;
> +
> +	resctrl_num_closid = num_closid;
> +	if (can_expand && !blocked) {
> +		resctrl_using_extra_partids = true;
> +		resctrl_num_mon_partid = (u32)mpam_partid_max + 1;
> +	} else {
> +		resctrl_using_extra_partids = false;
> +		resctrl_num_mon_partid = num_closid;
> +	}
> +
> +	/* Tell the driver how the request PARTIDs map onto control groups. */
> +	mpam_partid_map_init(resctrl_num_mon_partid, resctrl_num_closid);
> +
> +	pr_debug("PARTIDs: monitor=%u closid=%u extra=%u\n",
> +		 resctrl_num_mon_partid, resctrl_num_closid,
> +		 resctrl_using_extra_partids);
> +}
> +
>   int mpam_resctrl_setup(void)
>   {
>   	int err = 0;
> @@ -1952,6 +2014,9 @@ int mpam_resctrl_setup(void)
>   	mpam_resctrl_pick_caches();
>   	mpam_resctrl_pick_mba();
>   
> +	/* Decide how the request PARTIDs map onto the control groups */
> +	mpam_resctrl_configure_partids();
> +
>   	/* Initialise the resctrl structures from the classes */
>   	for_each_mpam_resctrl_control(res, rid) {
>   		if (!res->class)
> @@ -2007,6 +2072,9 @@ void mpam_resctrl_exit(void)
>   
>   	WRITE_ONCE(resctrl_enabled, false);
>   	resctrl_exit();
> +
> +	/* resctrl is gone: forget how the PARTIDs were grouped. */
> +	mpam_partid_map_exit();
>   }
>   
>   static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_class *class)

