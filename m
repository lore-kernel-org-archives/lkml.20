Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F9F23909F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953264; cv=none; b=H3vs3A9IfYQTnXhBEJdqPBmgb0qSjxBQpuiQLqfFsnYKGBWb9BfeRVgwNoc61zkknm9xrVZR2SHY3qV2oG4m5dWnuFUcDj1mlmTT2W/xp1e6f/vPARqYE1soJHxADw7PFQurc26MxyurbT3TNJO5l5A7JVReduDebYYWMMtiQAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953264; c=relaxed/simple;
	bh=uxqPygSk0GGwoVEys1yQJfRGBwvr5j1o7nPshoPKQ6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InxV2EIa5Eh3XiK6tGqBTbzXfNDcyfgVEdiAWyxlSlUfXRC1yekKI07ks4drUxmQBOUtRwmqkXI/KmIJC+Uq0jrGjHHP3+3yaOQfj+sOvbNxWH5Tz7Gp4vleibUT9F53NLvmc1twJLlxNCUrqpif0FlxXsIORv0yWxbwxu+KuvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nlONrZvM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nlONrZvM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29CB2497;
	Fri,  2 Oct 2026 08:00:58 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 726F13F86F;
	Fri,  2 Oct 2026 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953261; bh=uxqPygSk0GGwoVEys1yQJfRGBwvr5j1o7nPshoPKQ6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nlONrZvMcFldHDQuNZw6xbP78m/l7Rr3fS5gmVSKT9GNhBSZ67iUUd8XSuFupRMY8
	 weIYqlKl81PU9/oiYsg0oP2Yt0YjKHtKE0JqZ66q+4kCZr+D+b//VczZd+fWJM7xmf
	 66LKfVlqbxte6zMTkwlUXTTvu7iSPd3fGyxaujLY=
Message-ID: <0be46f32-31d1-4f53-af39-db9acbbc1f47@arm.com>
Date: Fri, 2 Oct 2026 16:00:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] arm_mpam: Restore the error interrupt enable
 from mpam_cpu_online()
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-3-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-3-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> When all the associated CPUs to an MSC are offline, possibly caused by
> PSCI_CPU_OFF, the power supply to the MSC can be cut off and all the
> registers that are unknown out of reset, including MPAMF_ECR.INTEN, are
> lost.

Surely all the registers lose their value - and what we get back is the
architecture's reset values. MPAMF_ECR doesn't seem to have one, we can assume
its UNKNOWN.

(I've rephrased this)


> Afterwards, we need to explicitly set MPAMF_ECR.INTEN when the first
> associated CPU becomes online and the power supply to the MSC is recovered.
> 
> Restore MPAMF_ECR.INTEN in mpam_cpu_online() when the first associated CPU
> of the MSC becomes online.

You won't be surprised to know I didn't have a platform that generated interrupts
when this was written!


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 580d7ed38569..32bde94dfbc3 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1856,8 +1856,14 @@ static int mpam_cpu_online(unsigned int cpu)
>  		if (msc->reenable_error_ppi)
>  			_enable_percpu_irq(&msc->reenable_error_ppi);
>  
> -		if (atomic_fetch_inc(&msc->online_refs) == 0)
> +		if (atomic_fetch_inc(&msc->online_refs) == 0) {
> +			mutex_lock(&msc->error_irq_lock);
> +			if (msc->error_irq_hw_enabled)
> +				mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +			mutex_unlock(&msc->error_irq_lock);
> +
>  			mpam_reprogram_msc(msc);
> +		}
>  	}
>  
>  	if (mpam_resctrl_enabled)


Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James
