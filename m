Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E727488203
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675980; cv=none; b=Az1RIUhzIr5P5YM+pnPShWVwS7plnxuhO6c+XhtX1ScYIkw4o7oBp6lnNhmmNCpiqamYMGw3oFZqNRrMGOd506SvpOv/f27o+pFVY+Q8K3MIM1jTVfuTLrHvkc1Wk48HbNWmr1ZE3CplVEeKe2CTt+/bmkEXH14HIVmQpQu36Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675980; c=relaxed/simple;
	bh=MItVxbonx0GBF8xjgQU/JLV54KRBzxa2wfW8Y6UYxiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRm/vpY3DBwbV+xw2LXE4ewGI6ZbXjPTKB6Msr2I2FmgkF+7Ob+2lotN6WP4XZhFxWfObBEOm7toLdlNrTihhrhWw7t7dnJ2RXeWaqFWzTaVp305yHVSyaJXey3FK4SuoPUbIUV+SQ2C+iZY0z1ry+lDBp/Lgls4KjxqaBd662c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSmcbUFo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSmcbUFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789675975; x=1821211975;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MItVxbonx0GBF8xjgQU/JLV54KRBzxa2wfW8Y6UYxiI=;
  b=TSmcbUFotR9x0UBZSC8U86/CHSaF8JwOhCjp9Kh3XktdbPZPwVS94NZH
   nDDwExN/aJuN6nJVVggMg1yzQB6C8D82fzGuPHtgQmuPrf7OLatcyrxe2
   bxrnuA8twsWkkfUTWgQP7I3CcISzxsZ4y1MMfHsQiC5wTZj5L4o8qHVYX
   QhAUlQiNiq4WOx7pdWgnEGqd5ZSK7LconAYO5mU1tLRr5/Kv9mC4ChIE0
   4TUtlE2qm1f6acmB3URgMipvlpnkCakYgc2cHsagEVaPOIziuZ94UDGdU
   MhY5dnTSoHD/P5ebu5ssqI3KkEffi+vUnl4S7/oB4v7StfqmdD2MdT3qC
   Q==;
X-CSE-ConnectionGUID: RkMU2P5RQBmHW9YZGFkRCQ==
X-CSE-MsgGUID: Ga2sUtpCSIyv8vmdg3jkVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93973016"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93973016"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:12:52 -0700
X-CSE-ConnectionGUID: COg2Otv7TkKNRQh0nOsBCw==
X-CSE-MsgGUID: VI2n0fE+TnOHmdMqgRQ1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2432467"
Received: from vverma7-desk1.amr.corp.intel.com (HELO [10.125.109.63]) ([10.125.109.63])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:12:52 -0700
Message-ID: <ef1d2815-e284-4950-a485-792247588fb1@intel.com>
Date: Thu, 17 Sep 2026 13:12:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] NTB: ntb_transport: replace direct ->device_prep*()
 calls with standard DMA engine API
To: Frank.Li@oss.nxp.com, Jon Mason <jdmason@kudzu.us>,
 Allen Hubbe <allenbh@gmail.com>,
 "open list:NTB DRIVER CORE" <ntb@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev, vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20260917190831.1194795-1-Frank.Li@oss.nxp.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20260917190831.1194795-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/17/26 12:08 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> DMA engine consumers must not call the channel's device_prep_*() function
> pointers directly. Use the standard dmaengine wrapper APIs instead.
> 
> Assisted-by: LLM
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/ntb/ntb_transport.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
> index f9caa1a653c5b..45144abfb7aad 100644
> --- a/drivers/ntb/ntb_transport.c
> +++ b/drivers/ntb/ntb_transport.c
> @@ -1551,9 +1551,9 @@ static int ntb_async_rx_submit(struct ntb_queue_entry *entry, void *offset)
>  
>  	unmap->from_cnt = 1;
>  
> -	txd = device->device_prep_dma_memcpy(chan, unmap->addr[1],
> -					     unmap->addr[0], len,
> -					     DMA_PREP_INTERRUPT);
> +	txd = dmaengine_prep_dma_memcpy(chan, unmap->addr[1],
> +					unmap->addr[0], len,
> +					DMA_PREP_INTERRUPT);
>  	if (!txd)
>  		goto err_get_unmap;
>  
> @@ -1884,8 +1884,8 @@ static int ntb_async_tx_submit(struct ntb_transport_qp *qp,
>  
>  	unmap->to_cnt = 1;
>  
> -	txd = device->device_prep_dma_memcpy(chan, dest, unmap->addr[0], len,
> -					     DMA_PREP_INTERRUPT);
> +	txd = dmaengine_prep_dma_memcpy(chan, dest, unmap->addr[0], len,
> +					DMA_PREP_INTERRUPT);
>  	if (!txd)
>  		goto err_get_unmap;
>  

