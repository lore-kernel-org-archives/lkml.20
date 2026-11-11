Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405920;
	b=Pu8+bOTTpwpp658JwHPmP4M2TEEo4JNwYX0oNIlTKnMFLfiKx3yHIMmhbXxtp1K5Dbjp
	 WlUAr9OAdqEa9dLJWm0eRv777PyqJzm5DiYZ47iNvLMjFg434U8U+pYwMfl3ykv3vJhHK
	 QYo/YGxQeBs3uUuraMF4MWsPK+VHGfcrijkCmmBEEgOM5EoIrGCGwbZI+XFSy/GL1lu3P
	 L671rdpnkApvyrzhYJFMPruPl31Nd4JcXJkBfIbzvAqr8JntHS0OKy279QT3Yryzg/anL
	 1OGivdCPMH5jalB2f/NRlskBMjN2Shwgiley17FuOlOnPVaAGxp7iYbz7G02yqEASUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405920;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kO0azMBxoXq9M5QT/qyEj+5H+3IMTlm3RJDmjb9koLA=;
	b=TpPKb6uEoOVMlirKMMiFsK2Z/aXh30L0EM04Ca9WoKDiJv3jtRBGaAflh8BG6BN7WCkv
	 oelmdzoBu9OoqvpcJS/7q8OSUL2Nb2haYGdwUf1Utqgrhn9rP8BDJvrCn4AsFLNlnvPEx
	 jOk11iXtAAS4La7ouWsoUWSCaVqKlHVX7yrixdXb5FmEhnhe8f8som12QNw4n183K4TE5
	 u5EXUWWzQKFDKSt5ONThZV5a1VVPMjOFVneFZrVZZff/a1ABnsHeH6P1xGTNgp7t4lQMa
	 QTbM9JfC/ubRQuK2Pd77QjrIzRvuiVQN01O+Q7KXJ1ncp91Lt1nao9zB6JgqWJKyACA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHn03s9l;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37B606A336;
	Wed, 11 Nov 2026 14:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E37B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHn03s9l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794405921; x=1825941921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sNjZft24xr7laXif2MdlCiMuF0+/w6pJG+fNtzq7h+c=;
  b=AHn03s9lY7UDrNQq6IpuNnojyvUVzqcP8R3+nb+STTtPbcOyjGyS6nbm
   RHrarDoyHdSNG93xthXRUCBj/gBISNhYyIeaeIa2WJ2z+KFOvf8r8Xuka
   XHZnWa1Tav9yBq1tXdOKKMCz62j6i8NRdmt4OIboK0p9gPDpepV21XVNg
   16w9BAgkDFa4tQzaXxKZWkZB6jFFR8UOLxkLMUAQd/rrQOvmpt/SQDuyn
   dRuyoSgUKJbm/tUMI001fcNLneWj0I6SNzI4Vmp8hhfQBHhjOSYACeROf
   gVVw6ViNE8+QI/HMwHOmgtSjSUL9fLMw+I9lMqrSTUrMteexSUedknifV
   A==;
X-CSE-ConnectionGUID: rEB7VqG/RUaFc56cV1GxKw==
X-CSE-MsgGUID: ImyaIjEtRs28lV1QxTpsQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3261549"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3261549"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:05:17 -0800
X-CSE-ConnectionGUID: oT9Cbor5Qni6BQCUdyKTLg==
X-CSE-MsgGUID: 0F6K0J6gQBqAceNzhSvsFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8999654"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 11 Nov 2026 06:05:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 25CCF99; Wed, 11 Nov 2026 15:05:14 +0100 (CET)
Date: Wed, 11 Nov 2026 15:05:14 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stefan.ghetu@nxp.com, imx@lists.linux.dev, Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH] usb: typec: tcpm: allow external charger detection to
 set USB_TYPE
Message-ID: <avR2GnwIdOKSrTlE@black.igk.intel.com>
References: <20261106115742.730704-1-daniel.baluta@nxp.com>
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
In-Reply-To: <20261106115742.730704-1-daniel.baluta@nxp.com>

On Fri, Nov 06, 2026 at 01:57:41PM +0200, Daniel Baluta wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> Teach tcpm_psy_set_prop() to accept writes of
> POWER_SUPPLY_PROP_USB_TYPE and store the value in port->usb_type, and
> advertise the BC1.2 USB types (SDP/DCP/CDP/ACA) in
> psy_desc.usb_types so power_supply_set_property() callers are not
> rejected by power_supply_has_property().
> 
> This is a prerequisite for a follow-up PHY charger-detection driver
> that calls power_supply_set_property() on the tcpm-backed power
> supply once it determines the attached BC1.2 charger type.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index d721baef52104..24f4e8854f37f 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -8766,6 +8766,10 @@ static int tcpm_psy_set_prop(struct power_supply *psy,
>  	case POWER_SUPPLY_PROP_CURRENT_NOW:
>  		ret = tcpm_aug_set_op_curr(port, val->intval / 1000);
>  		break;
> +	case POWER_SUPPLY_PROP_USB_TYPE:
> +		port->usb_type = val->intval;
> +		ret = 0;
> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -8807,7 +8811,11 @@ static int devm_tcpm_psy_register(struct tcpm_port *port)
>  		 port_dev_name);
>  	port->psy_desc.name = psy_name;
>  	port->psy_desc.type = POWER_SUPPLY_TYPE_USB;
> -	port->psy_desc.usb_types = BIT(POWER_SUPPLY_USB_TYPE_C)  |
> +	port->psy_desc.usb_types = BIT(POWER_SUPPLY_USB_TYPE_SDP) |
> +				   BIT(POWER_SUPPLY_USB_TYPE_DCP) |
> +				   BIT(POWER_SUPPLY_USB_TYPE_CDP) |
> +				   BIT(POWER_SUPPLY_USB_TYPE_ACA) |
> +				   BIT(POWER_SUPPLY_USB_TYPE_C)  |
>  				   BIT(POWER_SUPPLY_USB_TYPE_PD) |
>  				   BIT(POWER_SUPPLY_USB_TYPE_PD_PPS) |
>  				   BIT(POWER_SUPPLY_USB_TYPE_PD_PPS_SPR_AVS) |
> -- 
> 2.45.2

-- 
heikki
