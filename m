Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474780;
	b=fPICMcKokCn0eIRdfTxfxro6vZDUmmT3OV0GjWlVvEev7uT/u7XBQU+w2Lcqy69wY5PB
	 NhkST0CerEjyUc62HqJ0VdjuKJ3D9UvLqIvBeg45gbZ+4dK4PmIyNYz76u1jEY1w5cdlh
	 dG/WYXse5uEgNoZJ9AUPioDptfE3RML9oUx+69FG/H0+zmgEYs7OL/rK36KElh243Rt4l
	 M8N+3E5poxTM9s6BuLC83ANepjGKFGqKkfna9mTJYYP6tFKHG5HBAlyl2LKxim4Sfp86N
	 q+IiSRmDXW3n1caGGgwWQiV6IVobzk5A/R1JY2BECad86qpk27ZffRdB79h3ndzPDkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474780;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DYuNa/LHxO0TX6Glay1qpIEMz5l2cwp9PI6fevLRYNY=;
	b=O4VDOVbZ01DTvMXyPIJctp7gdrlm7ntNWqLqDkpIVrARL8lZdnL67/zc4P1kRa9wEik9
	 0pPDj/+zv3lcEFOT6DJ8PuhUu8gxwhGSPdVV2+Q6Vmu5QeAfnWbu0o30RncNowjwAuI7F
	 BOM1zVpwQuXGbTAG7cQtcwbRXH7SJNopFk28OAXIfcSTXtZQWTZB7KFJwIkfuJoFfqUND
	 KqEoSTq//IF3zRhNOCJ8sXt0uxJvM6dlCinlZzjksbtkOWFz6bxlDMXcU9QEAPtBH+mMX
	 CgxPqW7r52Jcn3dxJel6MZmn+AU4P05V7eA9hxIztEDr/YZBH43nVLHZD/heVz+X6Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qezyq1if;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9688606A31C;
	Thu, 12 Nov 2026 09:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9688606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qezyq1if
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794474780; x=1826010780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d6+TcS4KnD9yXbX+YxzG4orja4iS4l0lR0A+jt6enXg=;
  b=Qezyq1ifXnhmcNlULeRyJ4hqpC1T/Nd4oz5lkUZ2mTFGTXTwdc+BCUcg
   ka2a+qH66Y/tZX4H0GFCgwzbinhzs26ftAUVomx7GK14Md4Yu1bROZ7Vz
   mJ95LPNo447BUE6l2d8Q4hzvMlJ5Pxe4jG+pAcaON6z9fHj77UaC6AXbd
   mVWua2uYjzTZArJc3xArHOMJ/F9D3FHg516dDnU6+W1plqlv/2zTyUCTN
   WbHDQIpGuTQPp7NbH0urVPW/5iyEjYGZLYC8bjOH6x6GZQxZIuzhIGEAm
   RWmf9Lss4OyIBQ5yM+5X3QHGyMIgRovkoY7g4otkN0e00+Ci55CAmpl5s
   w==;
X-CSE-ConnectionGUID: Ebpvi2ujTJC2yd3ruFBYTQ==
X-CSE-MsgGUID: 3gpvI2BOSXqR3qVkSm5/Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3136068"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3136068"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 01:13:00 -0800
X-CSE-ConnectionGUID: xtfLNdbrSCu9QHNRLZDNDg==
X-CSE-MsgGUID: cgRuozDRQ0C7ZX9cw9Tlhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10381648"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 01:12:57 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5DC54121B7E;
	Thu, 12 Nov 2026 11:12:58 +0200 (EET)
Date: Thu, 12 Nov 2026 11:12:58 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Zixin Wang <w1355457260@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Biren Pandya <birenpandya@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: cx25840: guard media_entity_cleanup() calls
Message-ID: <avWDGi-IPsVEdyby@kekkonen.localdomain>
References: <20261112085251.734109-1-w1355457260@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112085251.734109-1-w1355457260@gmail.com>

Hi Zixin,

On Thu, Nov 12, 2026 at 04:52:51PM +0800, Zixin Wang wrote:
> sd->entity only exists when CONFIG_MEDIA_CONTROLLER is enabled, but the
> two media_entity_cleanup() calls added by commit 634be628b5cc
> ("media: i2c: cx25840-core: Add missing media_entity_cleanup()") are
> unconditional.  Building with CONFIG_MEDIA_CONTROLLER=n therefore fails:
> 
>   drivers/media/i2c/cx25840/cx25840-core.c:3964:41: error:
>   'struct v4l2_subdev' has no member named 'entity'

How about instead turning media_entity_cleanup() into a macro that does
nothing with the arguments if MC is disabled?

> 
> Guard both calls with #if defined(CONFIG_MEDIA_CONTROLLER), matching the
> existing media entity setup in cx25840_probe().
> 
> The failure was reproduced with CONFIG_MEDIA_CONTROLLER=n.  After the
> change the driver builds with both CONFIG_MEDIA_CONTROLLER=n and =y.
> 
> AI assistance: the fix and this changelog were drafted with the Qoder
> coding assistant; the sender reviewed the change and ran the builds.

This goes below the '---' line.

> 
> Fixes: 634be628b5cc ("media: i2c: cx25840-core: Add missing media_entity_cleanup()")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222245
> Signed-off-by: Zixin Wang <w1355457260@gmail.com>
> ---
>  drivers/media/i2c/cx25840/cx25840-core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
> index 7066b2252afd..91794ec59e2d 100644
> --- a/drivers/media/i2c/cx25840/cx25840-core.c
> +++ b/drivers/media/i2c/cx25840/cx25840-core.c
> @@ -3961,7 +3961,9 @@ static int cx25840_probe(struct i2c_client *client)
>  		int err = state->hdl.error;
>  
>  		v4l2_ctrl_handler_free(&state->hdl);
> +#if defined(CONFIG_MEDIA_CONTROLLER)
>  		media_entity_cleanup(&sd->entity);
> +#endif
>  		return err;
>  	}
>  	if (!is_cx2583x(state))
> @@ -3986,7 +3988,9 @@ static void cx25840_remove(struct i2c_client *client)
>  	cx25840_ir_remove(sd);
>  	v4l2_device_unregister_subdev(sd);
>  	v4l2_ctrl_handler_free(&state->hdl);
> +#if defined(CONFIG_MEDIA_CONTROLLER)
>  	media_entity_cleanup(&sd->entity);
> +#endif
>  }
>  
>  static const struct i2c_device_id cx25840_id[] = {

-- 
Regards,

Sakari Ailus
