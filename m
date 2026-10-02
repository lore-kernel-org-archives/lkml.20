Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069C047B432
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954277; cv=none; b=fhvurv9pD71x0Lu7u3cPRYljLHVZ28+mjSMqjxkjbaPPqLb9Bwl+D9ETIN4AV/1YT+UUgygfSTs+fK/SV+hdxfINMGei/RWAuORwFWk4Hv2GQoE3KWDbIsye76C/y853Zvpg/wLUrjcFkD5nK5AB4tREuQqbf+qtIbkXCnLNRMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954277; c=relaxed/simple;
	bh=4/fl//FzQwWFZWipdtig+n4zBqLbuWVE2d0wceY0kSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLzIYMWmJB4Do0d8j1lwzK/jjUrdlMN+MDC/I0fvVVCF05oH6GHcZfUCc4YcQAZtYn5GT+SxUbHR7c9DOObQXrpqNuq72YVgzYJm/BAFZMyYa9GKisMPU9EotDvxC5UXNDS8eMtAw4vcVY9zIDrqzh0LFDHeJJATKc9dmDqHxT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vZKgAgXc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vZKgAgXc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E90A5143D;
	Fri,  2 Oct 2026 08:17:46 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BF153F85F;
	Fri,  2 Oct 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954270; bh=4/fl//FzQwWFZWipdtig+n4zBqLbuWVE2d0wceY0kSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vZKgAgXcUAeGhpzelqjlTDkjiRiHifpYKdaWEwV89WXwe6Q/u95WZTSGjtY6J2NaN
	 fERGN4oIlA6Hdju+yxDSisAuLRFSAkMTux+wayOVOasnFwpIKwQBc2yIYr2P7MTRa3
	 0mcgVeDwHTpVWJm9mdbqaDDnvLsXNMyH4xWzZweM=
Message-ID: <71c0021a-1438-416d-9d72-988b8ea3eef7@arm.com>
Date: Fri, 2 Oct 2026 16:17:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] arm_mpam: resctrl: Make read_mon_cdp_safe() self
 consistent
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-10-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-10-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> When read_mon_cdp_safe() is called with cdp_enabled equal to false then the
> reading returned in val is the sum of the monitor values for the given
> component. However, when cdp_enabled equal to true it is again the sum of
> the monitor values but with the initial value of val also added. Both
> resctrl_arch_cntr_read() and resctrl_arch_rmid_read() call
> read_mon_cdp_safe() and are documented to return the val directly without
> consideration of the older value.
> 
>  The val is always zeroed before read_mon_cdp_safe() is called except in
>  __check_limbo() and __l3_mon_event_count_sum() but the latter is not
>  relevant on MPAM systems.  The extra accumulation in __check_limbo() means
>  when there are multiple RMIDs in limbo some of them may be marked dirty
>  when they are already clean.
Weird indenting - I'll fix that.


> Change the cdp_enabled equals true case to match the false case and the
> documentation of the resctrl arch hooks.

Nothing about the documentation of the resctrl arch hooks here...
I'll drop this part of the commit message.


> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index b825bd90d4bd..321741a702fe 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -497,7 +497,7 @@ static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component
>  		if (err)
>  			return err;
>  
> -		*val += code_val + data_val;
> +		*val = code_val + data_val;
>  		return 0;
>  	}

I mistakenly thought mpam_msmon_read() was summing, so did the same here. But its not.

Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James



