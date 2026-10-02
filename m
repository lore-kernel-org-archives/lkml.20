Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605414E0B7C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954292; cv=none; b=nsiS1QB4nY3RvVqhzkS7RX1qvGhkri9PO28JYnkwVCsOXH9kQqJ5sRAT5pilBPoIIgSZ05F8hPj6di2sUxLpCv03+NGGaOizp3rgxoZkYPJhiKWyuYczwuQkplW4f17H1rH09/AvIB2B5QOCiMkpOm9M2G0vijvqTgbo1DsMPg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954292; c=relaxed/simple;
	bh=QY7JUXndpEa/tJCGaH2qcR+1m6vm1dEsYp+MGwdzjHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+39VKJWHfEKcDXulApGRdbdRMlE/goflk27nQ94Dlu2hpdRDiw+rQ+GUIo1l0Biez2DafIhhRx3b0JJvqx5ofK2a4oBKO/3Sa/TRA1vPXmDB+z+0NS2O2O6+VDiqJ87c4fh8Q2F5R4DGPOCaUKlAc0vgbofLn44DDffzxO8bMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tweEO7yz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tweEO7yz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C513143D;
	Fri,  2 Oct 2026 08:18:03 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3B433F85F;
	Fri,  2 Oct 2026 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954286; bh=QY7JUXndpEa/tJCGaH2qcR+1m6vm1dEsYp+MGwdzjHU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tweEO7yz7Qco3Mfyl6HiJkOw9TnKEfFX6StLOV0sHSjBPkL0JWAiCeTX2os4PYy0e
	 wCenOui266a9CbPN9oyFV7l5aRRJchK/GjqSVTfwhi8EsnBQDi1as5RNUUtL0OplfX
	 G32X2UL8qqo4Rn5Uliqp13NjdccMDGAjANjnbfGo=
Message-ID: <01e3c08b-8127-46ac-9d88-0e289f7ce2c1@arm.com>
Date: Fri, 2 Oct 2026 16:18:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] arm_mpam: Don't loop forever if there is the
 maximum possible amount of PARTIDs
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-11-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-11-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> On a theoretical platform with the maximum possible number of usable
> PARTIDs, 0XFFFF, the loops iterating over PARTID in mpam_reset_ris() and
> mpam_reprogram_ris() will never reach their termination condition leading
> to a system hang when register the cpu hotplug handlers when MPAM is
> enabling.
> 
> Fix these loops.

Ha! MPAM's mixture of num/max fields is really annoying.

Looks like we never loop over the PMG field.


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index cdc2d9d19e19..10fc5168699b 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1754,7 +1754,7 @@ static int mpam_save_mbwu_state(void *arg)
>   */
>  static int mpam_reset_ris(void *arg)
>  {
> -	u16 partid, partid_max;
> +	u16 partid_max;
>  	struct mpam_config reset_cfg = {};
>  	struct mpam_msc_ris *ris = arg;
>  
> @@ -1764,7 +1764,7 @@ static int mpam_reset_ris(void *arg)
>  	spin_lock(&partid_max_lock);
>  	partid_max = mpam_partid_max;
>  	spin_unlock(&partid_max_lock);
> -	for (partid = 0; partid <= partid_max; partid++)
> +	for (u32 partid = 0; partid <= partid_max; partid++)
>  		mpam_reprogram_ris_partid(ris, partid, &reset_cfg);
>  
>  	return 0;
> @@ -1811,7 +1811,6 @@ static int __write_config(void *arg)
>  
>  static void mpam_reprogram_msc(struct mpam_msc *msc)
>  {
> -	u16 partid;
>  	bool reset;
>  	struct mpam_config *cfg;
>  	struct mpam_msc_ris *ris;
> @@ -1835,7 +1834,7 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
>  		arg.comp = ris->vmsc->comp;
>  		arg.ris = ris;
>  		reset = true;
> -		for (partid = 0; partid <= mpam_partid_max; partid++) {
> +		for (u32 partid = 0; partid <= mpam_partid_max; partid++) {
>  			cfg = &ris->vmsc->comp->cfg[partid];
>  			if (!bitmap_empty(cfg->features, MPAM_FEATURE_LAST))
>  				reset = false;

Reviewed-by: James Morse <james.morse@arm.com>



Thanks,

James
