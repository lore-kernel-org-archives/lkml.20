Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407534;
	b=gBKBq4BAUZdgxapeeQkcjVS1LbC0z/3/ohMEqXEarasJ/pn6q6CyuVg3gT2y66vcj6OT
	 8a04kjr2SC1WUqqUnNRbnGKWnmCOuC3vxnqpuoF1wMte3Wzjblv2cERMnTXbTwv/lQuW4
	 0+fg8QmLMejdJ76Ad+j+ivCKgonc8si2u38JxhK2BFEV3KRYhETfWYkE4UxC7hhR6AWzj
	 YBPYVarLeFuFYsdCD0E7FMrSEjNGRKkKFrVuoHuO7iHsHWnY6MJ+C3ZA8/2cw4mK7X3fL
	 uLCmWmipNkGsajo6r6zEhQyg0/h42GdnB+laHehtPAzLAi9Hc4qHd+g6CY7rpmxzAhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407534;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GxiFxtFc5yCbNRZFS/UnbYGoqZahGzZhAZClmh3XRHQ=;
	b=emRah6OC3xJS8l3qdFa1wswmR7lbEjEx5+dpIn+eC7Xa+XDkxcSGpQdarGdugmAUN5H2
	 DvSH3PZFLOa/KtDNJUU+bg3waT/6J1dOtaZCTXOt5hZ4RkPp+R2Z1IPotLVBzEplSZZv9
	 gA7sDUpNOh3wlMpW4shUQv5C2SWcIFDSovSCy11J1Hz5Lgw/jeV8OXCGxsGz1/EpKnZQQ
	 TBRNANsoqmzpvQQJROTtBNUFtz5cPRHAaUnieknhIKvdAg3h2NGM2X1ip2gDYJp5kCAnY
	 53VkOAgB4OQjqIlERunqIIRFBOK1VdAoiAjPGPV3VlAY/Fe+y8GXl2fx5N4+g6ormyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FPQEXQ59;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A4A606A33D;
	Wed, 11 Nov 2026 14:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82A4A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FPQEXQ59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794407534; x=1825943534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JtVxkKTVgPD78NXQHLVs9qnh2GaoCFCwwjiS/QMXDQI=;
  b=FPQEXQ59QZhGVBdoyYew2UDwGMtRx93A+94JTiKrbCvrIRG22nekAsGp
   ZYdPXrSd8G0U1961spuQGXv65ct7BIgTTe4RCElWNj8wSI46rDgmPq1EE
   HRPxc5Rz+45MvGzsJY0bnXrwicFU0ko9MAAmlNmBX5Ap3YMpdRdmCNFDk
   YWFExAFcoHjFe/Msk6yCoKiKMwxoukCzzHXGBAxZOBkspu6jqeS63BNBW
   6a7baFwoRivTWoSzW9yvRVXTOxg0XtymsHSKpNmjxfx3XudYqVbf7OBZS
   qEQRcT+R3GyvHBCnWKuE8NFLEGBalRcgYEGVqb3VIkXGpt4kRqhrWn+nk
   Q==;
X-CSE-ConnectionGUID: 7A/S24gNR4KlFNsHsD2mvQ==
X-CSE-MsgGUID: 88dkUJdaQYmmsUKi6GYxwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3050557"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3050557"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:32:13 -0800
X-CSE-ConnectionGUID: Fj2Ke8c0R4q0DBfS09PbaQ==
X-CSE-MsgGUID: SgSX0yhSR0GgxlllIKrOOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8586158"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 11 Nov 2026 06:32:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8DBFB99; Wed, 11 Nov 2026 15:32:09 +0100 (CET)
Date: Wed, 11 Nov 2026 15:32:09 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stefan.ghetu@nxp.com, imx@lists.linux.dev, Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH] usb: typec: tcpm: allow external charger detection to
 set USB_TYPE
Message-ID: <avR8ad_Uo9hxYyAE@black.igk.intel.com>
References: <20261106115742.730704-1-daniel.baluta@nxp.com>
 <avR2GnwIdOKSrTlE@black.igk.intel.com>
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
In-Reply-To: <avR2GnwIdOKSrTlE@black.igk.intel.com>

On Wed, Nov 11, 2026 at 03:05:14PM +0100, Heikki Krogerus wrote:
> On Fri, Nov 06, 2026 at 01:57:41PM +0200, Daniel Baluta wrote:
> > From: Li Jun <jun.li@nxp.com>
> > 
> > Teach tcpm_psy_set_prop() to accept writes of
> > POWER_SUPPLY_PROP_USB_TYPE and store the value in port->usb_type, and
> > advertise the BC1.2 USB types (SDP/DCP/CDP/ACA) in
> > psy_desc.usb_types so power_supply_set_property() callers are not
> > rejected by power_supply_has_property().
> > 
> > This is a prerequisite for a follow-up PHY charger-detection driver
> > that calls power_supply_set_property() on the tcpm-backed power
> > supply once it determines the attached BC1.2 charger type.
> > 
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Ah, sorry. Sashiko found some issues with this it seems.

Thanks,

-- 
heikki
