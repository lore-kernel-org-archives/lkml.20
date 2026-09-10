Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95053D954F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032350; cv=none; b=TjY+JpG6S3q6CAUVmPBFo8telT9nvXHsJbPxUlnMJa5kHDipX+9dnlO3iAU8RgOE66L+onh9GV9peDhPnsHJeu4lfw/eWlBb7LqucxU1Fi1F6DhEQYteAtF2jv6cqRev/MR5zstt6Ato+b1IxujSloGe1pZ75J9Z0bakREcndkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032350; c=relaxed/simple;
	bh=UpAoE2j5YfS1kbfYmEi7NXnzNx7vCSlM0GC4iRWt4q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMg8vYfW8H/o6pX3+VVzPokclju6JNIKSteY5SSjKrK4ju8xbt8+86n8kzx17+01ts2+iBncYGMjgIUPOqNc78BqoBR2osFOa5cVqLbHNL6ANth2fPNzQfm1XIUogNrI643Aj+1PCjsce+8Kk3JXcRQk0tzFFOuTj4vFvTWvDxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CNitbpGV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CNitbpGV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 724D61570;
	Thu, 10 Sep 2026 02:25:40 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 805C03F528;
	Thu, 10 Sep 2026 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789032344; bh=UpAoE2j5YfS1kbfYmEi7NXnzNx7vCSlM0GC4iRWt4q0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CNitbpGVpyE1SAXs5mBXbrz3WueCVEfEULOInNSdz6DqP9R/viJ3o0d0FswdOd5LF
	 W5PRV6+giWYd1wb4xecOK4EXNjOsBb/+FmO8QdFvw/iiBoLQVrdGiGXUGW98ZD3OWv
	 ZmTXe06FQ/FESHlz4xf/QHe10lndoNtcG06K2MlY=
Message-ID: <558c0816-604a-49b6-8843-66ea5df28d3e@arm.com>
Date: Thu, 10 Sep 2026 10:25:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm_mpam: Only schedule mpam_enable work after first
 successful MSC probe
To: "ping.li" <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, reinette.chatre@intel.com,
 fenghuay@nvidia.com
References: <20260818130646.663778-1-ping.li@horizon.auto>
 <20260908024846.2063161-1-ping.li@horizon.auto>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260908024846.2063161-1-ping.li@horizon.auto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 08/09/2026 03:48, ping.li wrote:
> From: Ping Li <leeonion.muyu@gmail.com>
> 
> mpam_discovery_cpu_online() sets new_device_probed unconditionally after
> processing each reachable MSC. Once an MSC has already been probed
> (msc->probed is true), later CPUs sharing it skip
> mpam_msc_hw_probe() but still leave err at its default value of 0.
> As a result, new_device_probed is still set to true, causing
> mpam_enable_work to be scheduled again even though no new hardware was
> probed.

This patch is an improvement but, thinking again, it looks there is scope getting rid of
mpam_enable() altogether. Rather than walking the list after each hw probe we could increment an
atomic variable, similar to what is done in mpam_msc_drv_probe(), and then just schedule
mpam_enable_once(). What do you think?

Thanks,

Ben

> 
> Set new_device_probed only when mpam_msc_hw_probe() is called and
> succeeds.
> 
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
> Changes in v2:
> - Drop the Fixes: tag, as the extra mpam_enable() calls cause no real
>   harm: schedule_work() merges the duplicate work, and mpam_enable()
>   is a no-op until all MSCs have been probed. This is a cleanup, not a
>   bug fix.
> 
>  drivers/resctrl/mpam_devices.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 2f09f4b78bd3..fefdcf588932 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1866,13 +1866,15 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>  			continue;
>  
>  		mutex_lock(&msc->probe_lock);
> -		if (!msc->probed)
> +		if (!msc->probed) {
>  			err = mpam_msc_hw_probe(msc);
> +			if (!err)
> +				new_device_probed = true;
> +		}
>  		mutex_unlock(&msc->probe_lock);
>  
>  		if (err)
>  			break;
> -		new_device_probed = true;
>  	}
>  
>  	if (new_device_probed && !err)

