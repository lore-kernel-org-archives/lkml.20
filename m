Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372544;
	b=0LHskAzccNf3EhY+QSJwGYlYyWxDsCr6K5LUED7k2JyoHjRGNT/iszd1IcEAJJSDlltP
	 8jk1EQ5y6DpOGd0sLFgK1RnwGi9/r5SWSeY7O7kpbHZkYs7RmITYiwUKw+E87lA0sZIk5
	 pVFsCZM72BKOziQ9xgICnWwejwzdgO9hbxT2X8dGXt3WimbSxrmb5lBqSc5P7m85GWKoD
	 edyMflanwUS95PqMEaXwpXUHVz5OMA+7sWlaawDT95Sn8gy1TyDDyCLxDUJwC9H77NP2k
	 fnrA0BYv0iTf7BknnqSxBa32aOqNIQK4af+utoyJTHF3b5uNhbfxKw1LZpMh5T5Y02g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372544;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DUvFXZjTVEQdmAnOVmntyk8FGQctOS/EoRItd4IRe6s=;
	b=bs5cN7EwTnJvR9nGzZhuB6utu4r29Km0c0uTV5j+Mh0EE89qTKh3F+zicFsny3MCQroo
	 /rGhAHblnnnVYLCQTKXqe2yWsvcPMGnau/fxu2H189tCsNG66ISGyzLLARksjRHMuuolI
	 HQzC7RuCx5zdUAq8aupRGlHpOMPHmWr2R6gW/yEi73U5rfDPym+pZkXBRJLPoeb3JKGy6
	 AlUmmPp7qi1oDOfg5yx2fDqQ1YIxRdTMCpaX3Aw+57GNoiUnmUPzWl4h+3/VpXZvp0e/T
	 WWE0q/8y7GkdVUxdyQrrnM4p7alMy1/iS1ArennaZzo6v/sST8cQ2APE2SasteNNb5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Fc+9N4bW;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBC3606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EBC3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Fc+9N4bW
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 826951595;
	Fri, 30 Oct 2026 08:02:19 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB7B83F673;
	Fri, 30 Oct 2026 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793372542; bh=CZxgnVyRjXRn9YAc2m121NKnrgYVIhUEmkBY7pKCFiE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fc+9N4bWPFvfNIz3tGRw61J4y0ovn8o/dnATPLZlSrl5yEiHI87rfUiUVG6l7/WzG
	 S1VktRCw60jGWifnfz2tP3YL+bMRK4p4h8hVCYl8QYPY12Wvw1FIMx8MeRAY8VtVSB
	 +L/YbrHCkREQTT8DdiYTqnTHN2QVUnqzGDdOV44w=
Message-ID: <8950f9bc-8ca9-476c-a7d6-2b434908b80c@arm.com>
Date: Fri, 30 Oct 2026 15:02:20 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Warn when firmware leaves PARTIDs disabled
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261027083507.48226-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261027083507.48226-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 27/10/2026 08:35, Ping Li wrote:
> MPAMF_IDR.HAS_ENDIS indicates the MSC supports the MPAMCFG_EN_FLAGS
> PARTID enable/disable feature. Firmware is required to enable all
> PARTIDs at boot before handing over to software that is unaware of
> these registers. A PARTID left disabled silently ignores all resctrl
> schemata changes, as its traffic is treated as having no resources.
> 
> Debugging an IP that implements HAS_ENDIS but had no visible effect
> from resctrl took a while to root cause. The fix belongs in firmware,

I can see how this would be frustrating. In general, we can't rely on firmware to do the reset
correctly e.g. after a kexec. Hence, I'd rather enable all the PARTID as part of the mpam driver
initialization in the same way that we set all the controls to be non-throttling.

I do have a preliminary patch but there seems to be some contradictions in the specification so I
haven't posted it yet.

There are three points of confusion I'm aware of. Firstly, R-CSLHH says the enabled status is not
affected by narrowing and so just applies to the reqPARTID but the descriptions of MPAMCFG_EN and
MPAMCFG_EN_FLAGS indicate that it effects the intPARTID. Secondly, what happens if MPAMCFG_EN.PARTID
and PARTID_SEL are different? Thirdly, is ENDIS RIS-sensitive or a global setting for the MSC.

For the last one, the conclusion seems to be that it is a global insensitive setting but this is
still not fully reflected in the specification.

I'm not aware of how other ENDIS implementations behave. I have asked for internal clarification on
the points above but perhaps you could raise it with support@arm.com so that the architects are
aware this affects your design.

Thanks,

Ben

> but warn during probe so this misconfiguration is reported loudly
> instead of silently.
> 
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 16 ++++++++++++++++
>  drivers/resctrl/mpam_internal.h |  2 ++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..f03aa40faa0a 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1159,6 +1159,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  {
>  	int ret;
>  	u64 idr;
> +	u32 en_flags;
>  	u16 partid_max;
>  	u8 ris_idx, pmg_max;
>  	struct mpam_msc_ris *ris;
> @@ -1199,6 +1200,21 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  			ret = mpam_msc_read_idr(msc, &idr);
>  			if (ret)
>  				return ret;
> +
> +			/*
> +			 * Firmware must enable all PARTIDs before handing the
> +			 * system to software that is unaware of EN_FLAGS, so
> +			 * a disabled PARTID here means resctrl schemata
> +			 * changes silently have no effect.
> +			 */
> +			if (FIELD_GET(MPAMF_IDR_HAS_ENDIS, idr)) {
> +				u32 en_mask = GENMASK(FIELD_GET(MPAMF_IDR_PARTID_MAX, idr) % 32, 0);
> +
> +				ret = __mpam_read_reg(msc, MPAMCFG_EN_FLAGS, &en_flags);
> +				if (!ret && (en_flags & en_mask) != en_mask)
> +					dev_err_once(dev,
> +						     "firmware left PARTIDs disabled, schemata changes will not take effect\n");
> +			}
>  		}
>  
>  		partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1f86cc158100..008dc4e10f38 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -574,6 +574,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
>  #define MPAMCFG_MBW_MIN		0x0200  /* min mem-bw config */
>  #define MPAMCFG_MBW_MAX		0x0208  /* max mem-bw config */
>  #define MPAMCFG_MBW_WINWD	0x0220  /* mem-bw accounting window config */
> +#define MPAMCFG_EN_FLAGS	0x0320  /* partid enable flags config */
>  #define MPAMCFG_MBW_PBM		0x2000  /* mem-bw portion bitmap config */
>  #define MPAMCFG_PRI		0x0400  /* priority partitioning config */
>  #define MPAMCFG_MBW_PROP	0x0500  /* mem-bw stride config */
> @@ -608,6 +609,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
>  #define MPAMF_IDR_HAS_RIS		BIT(32)
>  #define MPAMF_IDR_HAS_EXTD_ESR		BIT(38)
>  #define MPAMF_IDR_HAS_ESR		BIT(39)
> +#define MPAMF_IDR_HAS_ENDIS		BIT(42)
>  #define MPAMF_IDR_RIS_MAX		GENMASK(59, 56)
>  
>  /* MPAMF_MSMON_IDR - MPAM performance monitoring ID register */

