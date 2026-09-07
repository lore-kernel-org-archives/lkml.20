Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28704EC646
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789731; cv=none; b=kLyCBDwW97YuMI+6DeV+guXmpMqDAIT/1xaJNC6Wk3nM/PuXQipYQ8WTHuy2drVwAt37i3q7GiIuoz/hMZPWEdPfqPBynU5URdsWrAha0n0w4sdo+B2yhXVTmE+aJjt8YdE7cYrIGi6k0tjV/8hK4HeWYg6YysLHknEICkdq+K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789731; c=relaxed/simple;
	bh=oA/AdAjxhNjtwc1Lrk6qquh95AYfGVwGHutvBnoLC6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oj8mr+U+m+8B9yXT7A/TPGiAKOoZPWfy9Q2oNsHzJuWJwvrWbz453URgADKeHMdduusHR0JOrsV1t3q3FRW6vBqppuw4/HvD4UKzGlLpe+nBUuN4jiaAVUThDwjBf4G62f5OXDD4GIQdLg0bjMdSVvk+Qvhwv9De0ObLR3dOCjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ns5v0J2Y; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ns5v0J2Y"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06DCB1476;
	Mon,  7 Sep 2026 07:02:05 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3DD53F528;
	Mon,  7 Sep 2026 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788789728; bh=oA/AdAjxhNjtwc1Lrk6qquh95AYfGVwGHutvBnoLC6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ns5v0J2YvGYVoHRTTsZV9OtLrblHHZXXcaeylCj9DLtSNjaRqhaCUdWovQP79SbRT
	 ftFJxhipFotB29XIARYbwnVQf1IwOy/WTZ+cjn64T66fYIYvWATsoPofR+PtYHKDib
	 jav3MKmIaL6WIymr/t7JA6LQpqnptjVU+PSUj0JU=
Message-ID: <3e93f413-2d51-4647-bda4-f1aad6ad1820@arm.com>
Date: Mon, 7 Sep 2026 15:02:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Only schedule mpam_enable work after first
 successful MSC probe
To: "ping.li" <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, reinette.chatre@intel.com,
 fenghuay@nvidia.com, "ping.li" <ping.li@horizon.auto>
References: <20260818130646.663778-1-ping.li@horizon.auto_quarantine>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260818130646.663778-1-ping.li@horizon.auto_quarantine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

Thanks for the patch and sorry for the delay in replying; I had to dig this e-mail out of quarantine.

On 18/08/2026 14:06, ping.li wrote:
> mpam_discovery_cpu_online() sets new_device_probed unconditionally after
> processing each reachable MSC. Once an MSC has already been probed
> (msc->probed is true), later CPUs sharing it skip
> mpam_msc_hw_probe() but still leave err at its default value of 0.
> As a result, new_device_probed is still set to true, causing
> mpam_enable_work to be scheduled again even though no new hardware was
> probed.
> 
> Set new_device_probed only when mpam_msc_hw_probe() is called and
> succeeds.
> 
> Fixes: 8f8d0ac1da78 ("arm_mpam: Add cpuhp callbacks to probe MSC hardware")

Are the extra mpam_enable() calls causing any harm or can this be considered just an optimzsation?
If they aren't causing any real issues then there is no need for the fixes tag.

> Signed-off-by: ping.li <ping.li@horizon.auto>
> ---
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
> +		}>  		mutex_unlock(&msc->probe_lock);
>  
>  		if (err)
>  			break;
> -		new_device_probed = true;
>  	}
>  
>  	if (new_device_probed && !err)

The code change looks good to me.

Thanks,

Ben

