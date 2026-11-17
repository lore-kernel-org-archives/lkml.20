Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915484;
	b=ZbsUNOFdGR84s2LZWtyKQprwfUGs18/ASzhXoj44itZi/OluWv2yg9Czt2JAx3KABFXa
	 teQDw4lKDL9LoqtxzHPsBVb0VQOy/3I7ARX6oVjkOE04IKqRj/PbC3YUUjyRi3AVCfsnG
	 yjI0tCQRWecJp4vGOsBN0CUQhB9qnKfeFa9EHfbD7S5XLMtqd/KDIY34lEg5fkuT+dDd7
	 +J6AZJFpafzAbHkrTG9qfDROm9I7llbDbiIkp8S5PGBOJudpZ3r01PpZbIjqc15yQS7u2
	 7Ur1kAXnjLtkAXwF9PpvD+AjWXGOULH2NK2Ut01FK7uqWd/662a5XKnBPpeJ2SusmnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915484;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=eIYBOu8NOjBweHBBxJRRDa0T52jYDT0KDxk8L0BX5C8=;
	b=VXrWv8oXT09lZJvj0UVP0OWaj2S/DsWjwoKbu3KX0HfaFUUmh5obnNHpGI+Yc6fQQk0W
	 9RItFOuxY9YBmIe6BDUUC5xM463YgNih/ExkHHstj+Xb19AzTjyBakWxLsyOa6iVTkNjJ
	 fnqjFNmXcE6oySkTS93e81d1usZDFStelAUvcGw6Tj+go7Ww7VGQa65wE/vCchcKjXuCt
	 zeT4HYqoommKRd67N9DbPAc5T+R0K0TXOfRSgR5c+bQr/wi/mLG0us/Tu+LcgpQpzYIqt
	 mKN0bz0uGudq2fPronzyupWBrbjqn0r4HLDNcAn52aMZAp6rzPgqxH0iHYm6Lld/BOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=V6EarTva;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4489C606A31C;
	Tue, 17 Nov 2026 11:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4489C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=V6EarTva
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 730EE1476;
	Tue, 17 Nov 2026 03:38:00 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.17.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C27C3F763;
	Tue, 17 Nov 2026 03:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794915483; bh=BgAOTNAkBrQ6qkPH8d+k2fV/l3kdC26sO5jr0Y5R7A0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=V6EarTvaETOeLdQZd+aqGjlopQk+supKhGblViLgC0Wct0yYAcfhhYEVYxXZTyMKZ
	 akbmRoUdV2LV2RPvBuuelXC1MoEZhy9rqCuh5f18KmmM7ev0P0I3cPrQu8+hf9QHHm
	 3fxZZ8kCbomjDCvqRuT32if0Kw8P/Ms9ClYqrvOo=
Message-ID: <1defc561-e7bc-4864-90ad-6aa3fb6be7da@arm.com>
Date: Tue, 17 Nov 2026 11:37:57 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 5/9] fs/resctrl: Allow mba_MBps with assignable MBM
 counters
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, quic_jiles@quicinc.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
 <20261112131255.4043381-6-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261112131255.4043381-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 12/11/2026 13:12, Jinjie Ruan wrote:
> The controller needs a counter for the event selected by mba_MBps_event
> in every monitoring group, so mba_MBps is refused when MBM counters are
> assignable. On MPAM a group's monitor is assigned from a fixed pool
> when the group is created, and users can otherwise only pick a
> percentage of a maximum that firmware does not report.
> 
> Allow the controller when the architecture has a fixed assignment mode
> and assigns counters when a group is created. Keep mbm_assign_on_mkdir
> enabled while the controller is in use, restore its previous value
> when the controller is disabled, and refuse to unassign the
> controller's counter meanwhile.

I'm afraid there has been some miscommunication here. What I was trying
to suggest is that MPAM could when using the software controller use the
default mbm_assign_mode as is used in intel systems. All the counters
are allocated up front and there is one of each supported type per
monitor group. Using mbm_assign_on_mkdir doesn't always give you
guaranteed assigned counters as you point out in your
patch "arm_mpam: resctrl: Use the domain's counter ID". I haven't
thought through all the abi consideration but it seems plausible, what
do you think?

Thanks,

Ben

> 
> Only MPAM has this mode; other systems keep the previous behavior.
> 
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  Documentation/filesystems/resctrl.rst |  7 +++++--
>  fs/resctrl/monitor.c                  | 25 ++++++++++++++++++++++
>  fs/resctrl/rdtgroup.c                 | 30 +++++++++++++++++++++------
>  3 files changed, 54 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index b52795e03303..d70aec6f7096 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -471,7 +471,8 @@ with the following files:
>  	Determines if a counter will automatically be assigned to an RMID, MBM event
>  	pair when its associated monitor group is created via mkdir. Enabled by default
>  	on boot, also when switched from "default" mode to "mbm_event" counter assignment
> -	mode. Users can disable this capability by writing to the interface.
> +	mode. Users can disable this capability by writing to the interface. While the
> +	MBA software controller is enabled, auto assignment cannot be disabled.
>  
>  	"0":
>  		Auto assignment is disabled.
> @@ -704,7 +705,9 @@ When monitoring is enabled all MON groups may also contain:
>  	   mbm_total_bytes:0=e;1=e
>  	   mbm_local_bytes:0=e;1=e
>  
> -	Assignments can be modified by writing to the interface.
> +	Assignments can be modified by writing to the interface. While the
> +	MBA software controller is enabled, the counter of the event the
> +	controller uses cannot be unassigned.
>  
>  	Examples:
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 8f3b8c3e3010..5a67c8089615 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -1210,6 +1210,12 @@ ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of, char *buf
>  		goto out_unlock;
>  	}
>  
> +	if (!value && is_mba_sc(NULL)) {
> +		rdt_last_cmd_puts("mbm_assign_on_mkdir is required by the software controller\n");
> +		ret = -EBUSY;
> +		goto out_unlock;
> +	}
> +
>  	r->mon.mbm_assign_on_mkdir = value;
>  
>  out_unlock:
> @@ -1776,6 +1782,19 @@ static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r, char *n
>  	return NULL;
>  }
>  
> +/*
> + * Return the event the MBA software controller uses as its input for @rdtgrp.
> + * A monitor group has no event of its own: its bandwidth is summed into the
> + * parent control group, which is the group with the mba_MBps_event setting.
> + */
> +static enum resctrl_event_id rdtgrp_mba_mbps_event(struct rdtgroup *rdtgrp)
> +{
> +	if (rdtgrp->type == RDTMON_GROUP)
> +		return rdtgrp->mon.parent->mba_mbps_event;
> +
> +	return rdtgrp->mba_mbps_event;
> +}
> +
>  static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *d,
>  					struct rdtgroup *rdtgrp, struct mon_evt *mevt)
>  {
> @@ -1789,6 +1808,12 @@ static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *
>  		ret = rdtgroup_assign_cntr_event(d, rdtgrp, mevt);
>  		break;
>  	case '_':
> +		if (is_mba_sc(NULL) &&
> +		    mevt->evtid == rdtgrp_mba_mbps_event(rdtgrp)) {
> +			rdt_last_cmd_puts("Counter is in use by the software controller\n");
> +			ret = -EBUSY;
> +			break;
> +		}
>  		rdtgroup_unassign_cntr_event(d, rdtgrp, mevt);
>  		break;
>  	default:
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index b32831871f70..518d89b0c67d 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2610,10 +2610,9 @@ static void mba_sc_domain_destroy(struct rdt_resource *r,
>   * The MBA software controller is supported only if MBM is supported and MBA is
>   * in linear scale, and the MBM monitor scope is the same as MBA control scope.
>   *
> - * The software controller cannot be supported when the MBM counters are
> - * assignable.  There is no guarantee that MBM counters are assigned to the
> - * event backing the software controller in all monitoring domains of all
> - * monitoring groups.
> + * The controller needs a counter for its event in every monitoring group.
> + * With assignable counters that requires a fixed assignment mode, with
> + * counters assigned automatically while the controller is in use.
>   */
>  static bool supports_mba_mbps(void)
>  {
> @@ -2623,9 +2622,13 @@ static bool supports_mba_mbps(void)
>  	return (resctrl_is_mbm_enabled() &&
>  		r->alloc_capable && is_mba_linear() &&
>  		r->ctrl_scope == rmbm->mon_scope &&
> -		!rmbm->mon.mbm_cntr_assignable);
> +		(!rmbm->mon.mbm_cntr_assignable ||
> +		 rmbm->mon.mbm_cntr_assign_fixed));
>  }
>  
> +/* mbm_assign_on_mkdir before the software controller forced it on. */
> +static bool mba_sc_saved_assign_on_mkdir;
> +
>  /*
>   * Enable or disable the MBA software controller
>   * which helps user specify bandwidth in MBps.
> @@ -2633,6 +2636,7 @@ static bool supports_mba_mbps(void)
>  static int set_mba_sc(bool mba_sc)
>  {
>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
> +	struct rdt_resource *rmbm = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>  	u32 num_closid = resctrl_arch_get_num_closid(r);
>  	struct rdt_ctrl_domain *d;
>  	unsigned long fflags;
> @@ -2643,6 +2647,20 @@ static int set_mba_sc(bool mba_sc)
>  
>  	r->membw.mba_sc = mba_sc;
>  
> +	/*
> +	 * The controller needs its event counted in every monitoring group:
> +	 * force automatic assignment on, and restore the user's setting when
> +	 * the controller is disabled.
> +	 */
> +	if (rmbm->mon.mbm_cntr_assignable) {
> +		if (mba_sc) {
> +			mba_sc_saved_assign_on_mkdir = rmbm->mon.mbm_assign_on_mkdir;
> +			rmbm->mon.mbm_assign_on_mkdir = true;
> +		} else {
> +			rmbm->mon.mbm_assign_on_mkdir = mba_sc_saved_assign_on_mkdir;
> +		}
> +	}
> +
>  	rdtgroup_default.mba_mbps_event = mba_mbps_default_event;
>  
>  	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
> @@ -3352,7 +3370,7 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
>  		ctx->enable_cdpl2 = true;
>  		return 0;
>  	case Opt_mba_mbps:
> -		msg = "mba_MBps requires MBM (mbm_event mode not supported) and linear scale MBA at L3 scope";
> +		msg = "mba_MBps requires MBM and linear scale MBA at L3 scope";
>  		if (!supports_mba_mbps())
>  			return invalfc(fc, msg);
>  		ctx->enable_mba_mbps = true;

