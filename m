Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08683403E9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955437; cv=none; b=Z3Fr0LZIDNu/i9yPrQplykgPsi39DD2R+TtKfHSZG9Goj1bqdIuoS3l4LlfMOOqGibYqZSuxE/UpmkdK8sKEkfQMhnFTiqwBXUcdC6r8B6x7Me7VIP96A+gKK8LzZaDrvJQj6eE0qZjROT/0BKLpb9k/B5WM9u/OAvJWTeE3glc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955437; c=relaxed/simple;
	bh=foa6XwYtr8xyzw32x0UaY54r5ooOR0Xwx4/wTj49JHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkDX5slAfIPBvku6R4LXXfiqls6WGq1msJyuN24B5SHVTZS/uFph4PAn+ZjfiNb0KY4AHBeDQRJ6bgRekLNccGr11W4pvzbaGXvcxLbFW043dxZM1oKzWhL6g9PurUqcl8ZkRA1yqmUMyzH4s0iqr7NGc98OewrGafzoERfgzkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RMAi+p1u; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RMAi+p1u"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9ED2143D;
	Fri,  2 Oct 2026 08:37:11 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.85.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7A793F85F;
	Fri,  2 Oct 2026 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790955435; bh=foa6XwYtr8xyzw32x0UaY54r5ooOR0Xwx4/wTj49JHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RMAi+p1uYvwpcb4tdmvngdBqFCAZkEc1A8CfLpANi736kw9NTfzbJRVQVwWQzuPz2
	 lqAEfDfBSZ6q+L/SD7MScIMOFbMEYvEaa3o7TCsJ5PL1IsDl82XSWJ85MaIJxkye7p
	 FDLuUJoWyZvNgpqSQqeGLn7/B6u5hVJ8+MHUFCW0=
Message-ID: <5e762f77-96a8-46c2-8f3b-04e8eed576dc@arm.com>
Date: Fri, 2 Oct 2026 16:37:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v12 09/13] arm_mpam: propagate MSC access errors in
 mpam_reset_class_locked()
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
 linux-acpi@vger.kernel.org--cc, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261001153439.3295416-1-andre.przywara@arm.com>
 <20261001153439.3295416-10-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261001153439.3295416-10-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andre,

On 01/10/2026 16:34, Andre Przywara wrote:
> The mpam_reset_ris() function can return an error, propagate this up
> through mpam_reset_component_locked() to mpam_reset_class_locked(),
> which is exported. The external caller is a void function, so cannot
> really handle the error at the moment, but at least we report everything
> on the MPAM interface side.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> ---
>  drivers/resctrl/mpam_devices.c  | 24 ++++++++++++++++++------
>  drivers/resctrl/mpam_internal.h |  2 +-
>  2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 60f6a39176ea1..c639aaa5f38e1 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -3007,7 +3007,7 @@ static void mpam_enable_once(void)
>  	       mpam_partid_max + 1, mpam_pmg_max + 1);
>  }
>  
> -static void mpam_reset_component_locked(struct mpam_component *comp)
> +static int mpam_reset_component_locked(struct mpam_component *comp)
>  {
>  	struct mpam_vmsc *vmsc;
>  
> @@ -3021,26 +3021,38 @@ static void mpam_reset_component_locked(struct mpam_component *comp)
>  				 srcu_read_lock_held(&mpam_srcu)) {
>  		struct mpam_msc *msc = vmsc->msc;
>  		struct mpam_msc_ris *ris;
> +		int ret;
>  
>  		list_for_each_entry_srcu(ris, &vmsc->ris, vmsc_list,
>  					 srcu_read_lock_held(&mpam_srcu)) {
> -			if (!ris->in_reset_state)
> -				mpam_touch_msc(msc, mpam_reset_ris, ris);
> +			if (!ris->in_reset_state) {
> +				ret = mpam_touch_msc(msc, mpam_reset_ris, ris);
> +				if (ret)
> +					return ret;
> +			}
>  			ris->in_reset_state = true;
>  		}
>  	}
> +
> +	return 0;
>  }
>  
> -void mpam_reset_class_locked(struct mpam_class *class)
> +int mpam_reset_class_locked(struct mpam_class *class)
>  {
>  	struct mpam_component *comp;
> +	int ret;
>  
>  	lockdep_assert_cpus_held();
>  
>  	guard(srcu)(&mpam_srcu);
>  	list_for_each_entry_srcu(comp, &class->components, class_list,
> -				 srcu_read_lock_held(&mpam_srcu))
> -		mpam_reset_component_locked(comp);
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		ret = mpam_reset_component_locked(comp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  static void mpam_reset_class(struct mpam_class *class)
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 68a6cf2b9cc73..09f8168fb4d2c 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -465,7 +465,7 @@ void mpam_enable(struct work_struct *work);
>  void mpam_disable(struct work_struct *work);
>  
>  /* Reset all the RIS in a class under cpus_read_lock() */
> -void mpam_reset_class_locked(struct mpam_class *class);
> +int mpam_reset_class_locked(struct mpam_class *class);
>  
>  int mpam_apply_config(struct mpam_component *comp, u16 partid,
>  		      struct mpam_config *cfg);

