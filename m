Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFC53E49D2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955345; cv=none; b=pLXSXrMaXMkmuUzGgJTcgErCKD9SjeELsYyuFaUGFhFzRxvQQh0nORSUcIu47nW5YDsFJcHq5EgTN99m1bnFMUiMzBll8Dypzmx3+6kKrFOoq5wvVMEDNVwoAcWrCpALAFfbJWHNlri07M1lMZWFvVQ2Kll1rH/2B0xqnEPL5EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955345; c=relaxed/simple;
	bh=Ey7NB0qS8ZKugxYGyiBGHdk7OWdkE3p8zHjWGF3bJIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VemxGJk+FM4Ew6PQTS4Tf+osEUixD78fY9iu28iwSfdizzHcIknDGYgcduLwgCjw3QZwEB8PhHE7wfgBLpQuQYtdzjwCsTmB0IgHE4X/tGmUvmMyK0VMQv4GpWRJHwbHIP4y2veSw8jacCEFrvg8EUFXd94HbYZPAtc03T4l3FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DQs0wtCC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DQs0wtCC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 660BE143D;
	Fri,  2 Oct 2026 08:35:39 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.85.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 938703F882;
	Fri,  2 Oct 2026 08:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790955342; bh=Ey7NB0qS8ZKugxYGyiBGHdk7OWdkE3p8zHjWGF3bJIU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DQs0wtCCgfEpU67TSvbohdw6qNHUkNJsGw92h4qZqWNL0cUCqrQv85AdepTt58uCF
	 Bt0GMxEaN4JTO9wdQsnxKA3+CpF0o4pGW4CuSMBpopq4pelsJMalKLMKqhL5GYs/CB
	 OJ3URr3fW5C9idBqNqj7NeZ0I/Mqy8PfqUdd33Eg=
Message-ID: <99c7f8d2-b65a-4e8b-bb7e-1de16fed3190@arm.com>
Date: Fri, 2 Oct 2026 16:35:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v12 08/13] arm_mpam: propagate MSC access errors for
 interrupt control
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
 <20261001153439.3295416-9-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261001153439.3295416-9-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andre,

On 01/10/2026 16:34, Andre Przywara wrote:
> Allow the functions dealing with interrupt registration and enablement
> to check for and return errors, and propagate MSC read and write errors
> from the lower level up.
> This does not cover the IRQ handler yet, as this needs some more
> attention.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> ---
>  drivers/resctrl/mpam_devices.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b876f4d2e9a77..60f6a39176ea1 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1118,7 +1118,9 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  	}
>  
>  	/* Clear any stale errors */
> -	mpam_msc_clear_esr(msc);
> +	ret = mpam_msc_clear_esr(msc);
> +	if (ret)
> +		return ret;
>  
>  	spin_lock(&partid_max_lock);
>  	mpam_partid_max = min(mpam_partid_max, msc->partid_max);
> @@ -2681,9 +2683,7 @@ static int mpam_enable_msc_ecr(void *_msc)
>  {
>  	struct mpam_msc *msc = _msc;
>  
> -	__mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
> -
> -	return 0;
> +	return __mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
>  }
>  
>  /* This can run in mpam_disable(), and the interrupt handler on the same CPU */
> @@ -2691,9 +2691,7 @@ static int mpam_disable_msc_ecr(void *_msc)
>  {
>  	struct mpam_msc *msc = _msc;
>  
> -	__mpam_write_reg(msc, MPAMF_ECR, 0);
> -
> -	return 0;
> +	return __mpam_write_reg(msc, MPAMF_ECR, 0);
>  }
>  
>  static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
> @@ -2790,11 +2788,12 @@ static int mpam_register_irqs(void)
>  				return err;
>  		}
>  
> -		mutex_lock(&msc->error_irq_lock);
> +		guard(mutex)(&msc->error_irq_lock);
>  		msc->error_irq_req = true;
> -		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +		err = mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +		if (err)
> +			return err;
>  		msc->error_irq_hw_enabled = true;
> -		mutex_unlock(&msc->error_irq_lock);
>  	}
>  
>  	return 0;
> @@ -2815,8 +2814,8 @@ static void mpam_unregister_irqs(void)
>  
>  		mutex_lock(&msc->error_irq_lock);
>  		if (msc->error_irq_hw_enabled) {
> -			mpam_touch_msc(msc, mpam_disable_msc_ecr, msc);
> -			msc->error_irq_hw_enabled = false;
> +			if (!mpam_touch_msc(msc, mpam_disable_msc_ecr, msc))
> +				msc->error_irq_hw_enabled = false;
>  		}
>  
>  		if (msc->error_irq_req) {

