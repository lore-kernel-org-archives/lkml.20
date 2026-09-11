Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C96E3E51FF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097926; cv=pass; b=cEB8Rm9Alb2wTOHY1G6ZsnCR0++ki4pSgvSLI5vPbEN3o+gHhh1qyuObOdKN8D+sivdOwFskkayE55/fPf7q1y7FMtmRavqfowIWYyLyyULntnItY4I/uDtZKMA63B8mPFHZpn5UpyrMTri7NymYBPuaHE4qCm6fpiGijos2LZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097926; c=relaxed/simple;
	bh=qEJ+ukjoG78HD66h0P0XQktHRahrfkPhgUIyOMSMoX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EA7X/4TUSnIZLQJsdzI+XHCN8gHxpq3XOB6G1/zxRyDPZCWtHUifG18WJpzIziSY0egE7U3q4e7m600KhQqzOP93kRho9jw3u90LBRDsb/RI9wkjACd4KSQsB8azBWNQOkg2gV0uqx4xv0Iu7PGRl/cX0IQpU7V9mywM64WW7JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=IkOmw4I2; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="IkOmw4I2"
ARC-Seal: i=1; a=rsa-sha256; t=1789097908; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LH+wdAhGMKHGPnRZ7DulAKxszW/AgAY8hiKmzVPtytdOUib62ri9nmVZWOgnofcisa/xjE2pU1Xucy7b6X+3IGjeh8J800MA9mrWTPKjpr6xiw+Nsx6l9a6A1U8CJF9qZPSnYxR0FUS8K4qqO04xLjCh4Ku/otZGCmDWcDDc51k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789097908; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ofQzn7xCkcrRXLlBde8hqgntbjn4o4+CwN0WRZTmd64=; 
	b=nH7K66XBZYMuq1JV4cJjQj8nEM/p7z++i11+crMjHn0YtPoaS8/QruchhbLfSAWd/hbCKRkRdnBjPAa0dhg3MteETWJk58ZeSWEN7nCWV5t62uWMeEcw49G/8bptHDB89V6zIfyE6PWp4fqgCClVJNyr/QkMcuLBQU+Asyk3olc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789097908;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=ofQzn7xCkcrRXLlBde8hqgntbjn4o4+CwN0WRZTmd64=;
	b=IkOmw4I2j7/2PviPGZiuuF8JHJ5Mv9rYQ/vEB+g0nGaN5//xVRvIRNSTrifi7zJm
	9q9vox/KnnjVlnfQF49KmGh6lcuCIu/GqgxCE9gYgNmw+JnTvztYS/3IPGA5CxeuGrT
	4JMBfQ3hvcvGpwKEFBmnl6DXIQD8iH2lca1GImcE=
Received: by mx.zohomail.com with SMTPS id 1789097907327889.4427999640113;
	Thu, 10 Sep 2026 20:38:27 -0700 (PDT)
Date: Fri, 11 Sep 2026 04:38:23 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/18] drm/panthor: Check AS state before disabling
Message-ID: <aqMKT6diaogngpdg@sobremesa>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
 <20260826-panthor-unplug-fixes-v4-10-982cc8f4234b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-panthor-unplug-fixes-v4-10-982cc8f4234b@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.74.40

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 26.08.2026 16:56, Boris Brezillon wrote:
> Use TRANSTAB == 0 as a way to detect if an AS slot is idle. This
> allows us to make panthor_mmu_as_disable() a NOP when it's called
> after a SOFT_RESET, which will be needed for our unplug rework.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 3d9f9bf29e1d..58f0bd2ac7a2 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -640,6 +640,10 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 slot,
>  
>  	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
>  
> +	/* The AS was disabled already, nothing to do. */
> +	if (!gpu_read64(mmu->iomem, AS_TRANSTAB(slot)))
> +		return 0;
> +
>  	panthor_irq_disable_events(&ptdev->mmu->irq,
>  				   panthor_mmu_as_fault_mask(ptdev, slot));
>  
> @@ -662,11 +666,17 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 slot,
>  	if (recycle_slot)
>  		return 0;
>  
> -	gpu_write64(mmu->iomem, AS_TRANSTAB(slot), 0);
> -	gpu_write64(mmu->iomem, AS_MEMATTR(slot), 0);
>  	gpu_write64(mmu->iomem, AS_TRANSCFG(slot), AS_TRANSCFG_ADRMODE_UNMAPPED);
> +	ret = as_send_cmd_and_wait(ptdev, slot, AS_COMMAND_UPDATE);
> +	if (ret)
> +		return ret;
>  
> -	return as_send_cmd_and_wait(ptdev, slot, AS_COMMAND_UPDATE);
> +	/* We reset the other fields late to ensure that, if something fails,
> +	 * the page table is considered active (TRANSTAB != NULL).
> +	 */
> +	gpu_write64(mmu->iomem, AS_MEMATTR(slot), 0);
> +	gpu_write64(mmu->iomem, AS_TRANSTAB(slot), 0);
> +	return 0;
>  }
>  
>  static u32 panthor_mmu_fault_mask(struct panthor_device *ptdev, u32 value)
> 
> -- 
> 2.55.0

Adrian Larumbe
