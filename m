Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305345;
	b=qCCIAK/liSUsVmo3njfnluzfSoj31pHZs8dolNYUUCgZGn+/z/qJSiCZdckbfo+VHVFp
	 K45AU+NoZ89j+lEnmjC3KMcIKrKflzLogYD/ILLBqydv+XXJP63pX/rjSDZh8FxZcY9Gy
	 u0FzAUWGXewLB6WTcBPUlBUJrG7uUucDICv0UjwZvJcC+2dAeOyy0RW4PvIjvMQG5e3+S
	 URLvwRRpN+9nplE8JWrvPEQBCQi3vz/CgXuFSS0Y49vxtPOnjbLaHfGljUNuvGTsq1tbB
	 uEbo5xic4MMx40KyaGuTMW4NY98hwyiYpCo0SP75OwvEuM8rSgnWdk8+wFSZYkjHspw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305345;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=TkBTbuy0DpeI8nIAcEwwOqJ2O7MQrrYCZJhG/k+EVe4=;
	b=vppV0VPoeCqUtOLbV8iDGE5Rwp2tzext4JYDOpxCPUJYAc/1LU0+e3eXN0njtFWa8kXI
	 p9LZuNwCLvlBTpYAzBSjdsms8ZwwLWEyLYJsKhcY8MxgN2zdFL+nQw56a8qyWgp/3qyiI
	 tahbVcdaQrzmY/9GUnjV/eFpR+Og86EuUwn2ljUXqStF9vWuL0H4Ogb1id2Nv7FfH6zvg
	 OyUnp3TMbiaAUG+qetcRD+8zY+AdEh4StPJqLkJALiIxfLB+bUGag03smvxJb8JxUqHkm
	 s9OCmkdgCeZMDl9y3PCt1B4IJBCx4NG2MIqp1X8+GnpK3aWobu7iVH+zKCCqoEDP29Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QORtUhbi;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6806F60710AA;
	Tue, 10 Nov 2026 10:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6806F60710AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QORtUhbi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794305344; x=1825841344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KnQUhoRluuFeY+pp23B3MM79eqJfQXr4D6zi3F4Tv+I=;
  b=QORtUhbiS/YSGZGhlCEJedYCjTqNq69seibLUStQzg7ZzM5KsEI+zeYk
   TliBDi6MzTMu/foF6N5DnhM25Z9bdTbVpGHugbMVsReIynt2UUaHTMNLe
   rOoYng+KBXYyJ6S6A/R8SHY7ZnZrfm4YrkxuLTiIoocLcIxQq6jhUTbBu
   PLnQmbD4CnTX2S0EO8M4zOa/PmtU7MklDoMM2rI/tsXRJQ7CNCRiMTVn/
   M+aVHRAH6hQzr94Xdo9dHDa/PCRwClc58YgCExuDt+Fg+k7wISplaogZu
   a8Bgw8HVeeYwSwDIHSSoa1jojkvbvuCRjFbId3EDOZzmNtspO7dOm3qPG
   A==;
X-CSE-ConnectionGUID: 5ibcnwqHQZaRnecMY4hUVA==
X-CSE-MsgGUID: +9aSGeZuTo6ZEhbe0vBUaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3071064"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3071064"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 02:09:03 -0800
X-CSE-ConnectionGUID: tba2USrHSJG8vIoXGFsvrw==
X-CSE-MsgGUID: ByJlKxEbSwiOu7TbyfXR5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="9893325"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.11])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 02:09:01 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C4420121B7B;
	Tue, 10 Nov 2026 12:09:00 +0200 (EET)
Date: Tue, 10 Nov 2026 12:09:00 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Marek =?iso-8859-1?Q?Konr=E1d?= <konrad.marek@seznam.cz>
Cc: linux-media@vger.kernel.org,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu6: Fix ISYS runtime PM race during probe
Message-ID: <avLtPItSlHcyNCXG@kekkonen.localdomain>
References: <20261105114311.49242-1-konrad.marek@seznam.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105114311.49242-1-konrad.marek@seznam.cz>

Hi Marek,

On Thu, Nov 05, 2026 at 01:43:09PM +0200, Marek Konrád wrote:
> ISYS and PSYS are auxiliary devices and PSYS is a child of ISYS.  In
> ipu6_pci_probe(), resuming PSYS to initialise the MMU and authenticate the
> firmware also resumes the ISYS parent.  However, ISYS probe has been
> deferred until bus_ready_to_probe is set, so ISYS is marked RPM_ACTIVE
> without its runtime_resume callback having run.
> 
> The driver then drops the PSYS reference using pm_runtime_put(), which only
> schedules the idle transition asynchronously.  When PSYS finally suspends,
> the runtime PM core queues an idle request for ISYS as well.  This request
> can run after the deferred ISYS probe has published dev->driver but before
> isys_probe() has called dev_set_drvdata(), making isys_runtime_pm_suspend()
> dereference a NULL isys pointer:
> 
>   BUG: kernel NULL pointer dereference, address: 000000000000031c
>   ...
>   isys_runtime_pm_suspend
>   bus_pm_runtime_suspend
>   rpm_callback
>   rpm_suspend
>   pm_runtime_work
> 
> Make both runtime PM transitions synchronous and complete them before
> bus_ready_to_probe is set.  pm_runtime_put_sync() waits for PSYS to be
> suspended, dropping the active child count of ISYS.  pm_runtime_suspend()
> then suspends ISYS while its driver is still unbound, so no suspend
> callback can run during the probe.  The first real runtime resume happens
> later, when the driver data is available.
> 
> Signed-off-by: Marek Konrád <konrad.marek@seznam.cz>

Thanks for the patch.

Does this patch
<URL:https://lore.kernel.org/linux-media/20261103163814.96980-1-arpith99@gmail.com/T/#u>
address your problem as well?

> ---
>  drivers/media/pci/intel/ipu6/ipu6.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index cdf812c02960..905b03b7e76d 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -827,7 +827,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	}
>  
>  	ipu6_mmu_hw_cleanup(isp->psys->mmu);
> -	pm_runtime_put(&isp->psys->auxdev.dev);
> +	pm_runtime_put_sync(&isp->psys->auxdev.dev);
> +	pm_runtime_suspend(&isp->isys->auxdev.dev);
>  
>  	/* Configure the arbitration mechanisms for VC requests */
>  	ipu6_configure_vc_mechanism(isp);

-- 
Regards,

Sakari Ailus
