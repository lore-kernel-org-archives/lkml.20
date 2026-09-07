Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EA04746BF;
	Mon,  7 Sep 2026 10:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778420; cv=none; b=SbfCk8TEx3J8sRkuWlOjUMvoFVOnQj2ZPxleVmc33Is+bHpivGcQW/7VbhhJoqnk3C0xlxic6zJAM8D1ajOrt4AOrqiyXWnEvqGPyBtsQq2m7SiqkqzLEFeSbw/lJTaHmVUdnZ5rjrfhstv89HFsK0bUmI4yP8/vm99p96pxE7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778420; c=relaxed/simple;
	bh=HVGcZF8Q/ZEdDc1P8SbQdecxk3+rmU/h4yuXHPhDcZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caDVYs5/p3Zm0UPgLkbWO54UuTM9xkHioalOgysykVn10GNX/nSbDteGFggHmzO8OeteJynvsKI/0ask4NyLSaUcY/AaInOs4umgcRYdtaYSBT6FZYbSriQP//Ts/rOonEFswBaXx3MtqaVEfLt8S3PrSKBT6EotlkkCH5gdWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ToED8y72; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ToED8y72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788778419; x=1820314419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HVGcZF8Q/ZEdDc1P8SbQdecxk3+rmU/h4yuXHPhDcZc=;
  b=ToED8y72trk1V7IA9LOak4nPNvJ1K1b4coR8BN8fXWtc7bMmGe9n9gLd
   +nkmWaq0DrPyPAh2XU1OKzTt8OSvhg5i1ydFckM5t6qt4w5x7ZbdWwV/K
   9AHWGoEbyMY1/rew6u+fpIETczlJLxeAl6KG+sMmjz/IknV7Fk4n8Tnyh
   Il8bFvD6RyoIC+2l5Ts2FpW0ryQYSWf3TsZSAiTukuIqRF4otMKOVDeAV
   DbgnQsC+zqnEzvP8m2R7SuTx72K3xyI7UFtKQqoA4Qp9EPTUehDiBQ4o3
   rSg34yl49HdHSD8/g+47Ior5HcedMpw7ziTaBLV6rqPhqY5RtT8hS3Q71
   Q==;
X-CSE-ConnectionGUID: KVjPBCm/QI659y0bVc3e+A==
X-CSE-MsgGUID: 815l+igGQqu8jyY9kno20A==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89213464"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89213464"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 03:53:38 -0700
X-CSE-ConnectionGUID: o1nNYw9yTpejgXV5VsJ+DA==
X-CSE-MsgGUID: IBFHA4xuQ/Oc0hdo5jY4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="274191711"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 07 Sep 2026 03:53:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9993B99; Mon, 07 Sep 2026 12:53:35 +0200 (CEST)
Date: Mon, 7 Sep 2026 12:53:35 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xin Ji <xji@analogixsemi.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: anx7411 - stop the IRQ before destroying the
 workqueue
Message-ID: <ap6Xr5X64V6evYjz@black.igk.intel.com>
References: <20260903082254.1540271-1-gonglinkai@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903082254.1540271-1-gonglinkai@kylinos.cn>

On Thu, Sep 03, 2026 at 04:22:54PM +0800, Linkai Gong wrote:
> The IRQ is devm-managed, so it can still queue plat->work while
> remove() is tearing the queue down. Disable it first.
> 
> Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
>  drivers/usb/typec/anx7411.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index 41df115912b9..c3d36da692e4 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -1566,8 +1566,11 @@ static void anx7411_i2c_remove(struct i2c_client *client)
>  	anx7411_partner_unregister_altmode(plat);
>  	anx7411_unregister_partner(plat);
>  
> -	if (plat->workqueue)
> +	if (plat->workqueue) {
> +		disable_irq(plat->intp_irq);
> +		cancel_work_sync(&plat->work);
>  		destroy_workqueue(plat->workqueue);
> +	}

Is the workqueu necessary at all? It's threaded irq.

Thanks,


>  	i2c_unregister_device(plat->spi_client);
>  
> -- 
> 2.25.1

-- 
heikki
