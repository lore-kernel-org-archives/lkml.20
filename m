Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3DB4E1C7E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954307; cv=none; b=MoQeftWBIMgW3yFUoUUmF2v4Zm2o7aqCRKXBOmTYJaLlRy6ogc0e/NqISR4SnsoDmltdiHnJElDnigZ8AVnv72z30aPRrEfDSKAIWEnTHDtZ1svA2Jw4SU4pzvjWLrPBSbJ7uf2VTWckGr3sDDyFkp7MlK7mm/gfBUlq8wTQd90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954307; c=relaxed/simple;
	bh=YHkCkAvI2azuXQy+PgJBhLP0u3/q7PVdTH38e6wb0i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJIFg+YXCOs+qinBGGVicafZFESPjGJvZwe229eKUAM+rttG+ytDS3n2whCXhUBHYgNZUTIOqU7RWXgN6P4QLND25bnMkihPqEnAWl7+j/6njkjxwsvORQclmpb7FQO4frTGgqfykUkxlUivySTKOp18QSKnEK1A5Pxx5T/My7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hqQtFAEh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hqQtFAEh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9505C143D;
	Fri,  2 Oct 2026 08:18:22 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCFED3F85F;
	Fri,  2 Oct 2026 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954306; bh=YHkCkAvI2azuXQy+PgJBhLP0u3/q7PVdTH38e6wb0i0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hqQtFAEhY6zLjAb+OM/YPQYKPWIuccjUOUEav9q5KLka6+xdA/6QCD4JK0CqwRWSh
	 zS3NHqQd/+0nwrqaFy0JfLqvNAW6QfOwSuFrajaFNZwPpxJPqvahT8hjMmAu9GPLbT
	 vkoLmOQNsPN4Tz6sAShK2JzRgpB/7WaMfeL3N7WY=
Message-ID: <e1316f39-0c60-4331-9155-7b6c3fd7fdf5@arm.com>
Date: Fri, 2 Oct 2026 16:18:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] arm_mpam: Switch to kvzmalloc_objs() for
 allocation of component cfg
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-12-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-12-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> Each component cfg is sized by the size of a per-PARTID multiplied by the
> number of PARTIDs. On a platform sized to push the limits of the
> specification, the allocation using kzalloc_objs() will consistently
> fail. Change to use kvzmalloc_objs() so that large allocations fall back to
> vmalloc() based allocations.

Makes sense. We should do this for any allocation that could be larger than
a page.


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 10fc5168699b..d74292f8cdfd 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -157,7 +157,7 @@ static void mpam_free_garbage(void)
>  		if (iter->pdev)
>  			devm_kfree(&iter->pdev->dev, iter->to_free);
>  		else
> -			kfree(iter->to_free);
> +			kvfree(iter->to_free);

And kvfree() is safe to use with non-vmalloc'd memory that we use for things
like struct class, which get free'd here.


>  	}
>  }
>  
> @@ -2692,7 +2692,7 @@ static int __allocate_component_cfg(struct mpam_component *comp)
>  	if (comp->cfg)
>  		return 0;
>  
> -	comp->cfg = kzalloc_objs(*comp->cfg, mpam_partid_max + 1);
> +	comp->cfg = kvzalloc_objs(*comp->cfg, mpam_partid_max + 1);
>  	if (!comp->cfg)
>  		return -ENOMEM;
>  


Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James
