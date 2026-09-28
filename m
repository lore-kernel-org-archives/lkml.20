Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65548302CC1;
	Mon, 28 Sep 2026 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599797; cv=none; b=auRs3e8YgIxCEiARwRWwtYozDmpliLqOxlE6p+nArnPuGT8qpN9s3zG6AjNl8XVPqAtRFD3gMFAyMtp/UDUjyjLGskEyUZAqZfgjuqI0YBWGA0S7ZERi3jiNQHUDK3EXGIh05SRS14WztnMCQfs6a53RTwkTGXBTR3hn1uq+uKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599797; c=relaxed/simple;
	bh=9ui8wOAGwqBSE2/0m8IaZ6FAQsSNjQ+1mm9+R4yja2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCbrsinTe3QepozQxqBjeo6JLD9PiKCdSp270wbC4xufqs+acIrkBcgJrrvvkvsBApp0+xJGURVdJxkIP+JMjsyMJOA5NfTO6MW0wEpX917caPSRZ6T2fFiSERmcGoTy92XrODeuwVTCBbqbRnYzw/cVGUUjqtEdkxK3huWqAsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JT86vmjP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JT86vmjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790599795; x=1822135795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ui8wOAGwqBSE2/0m8IaZ6FAQsSNjQ+1mm9+R4yja2s=;
  b=JT86vmjPqZEBOrs01+h8r1XFDB0DyRSesrIwGYuyPwKR5KcemUuPlWth
   Z1G3IMB1JXjCT/R0pGz/8bjif5faEpZu10SoSJQp7C9EX5V9LCyigtu2W
   3OwdbdgaJTiFoFnY+krJMXjapCUHywlx3+aqzsS3kMh+IEac8FxRUxP9Y
   VB2DijrXpJLESuHrn+tAesZ3ZYv+4xHWaJK99Gujx4XtpUZb9pUrBFy38
   VzrX4nR6YoByHA9EusQEfvEX9Nr/ciiijR2Dy/TtTAYskNdVRfG8Yg3bc
   dsneN7xykxXntIjB36m+iklpRvtnSW7NJhS2Q7uC/qr693Kxu8DFp4sx+
   g==;
X-CSE-ConnectionGUID: Ih20ZQUTSRG0COHtO2yXIA==
X-CSE-MsgGUID: MosLQ9wTSF2JyPI/qZ/NGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="108786997"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="108786997"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:49:54 -0700
X-CSE-ConnectionGUID: aWXxhip/QdGoIrz/iToTEQ==
X-CSE-MsgGUID: H7DTyoqiR2O1/qHpVzrBeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274267253"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2026 05:49:52 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 181C099; Mon, 28 Sep 2026 14:49:51 +0200 (CEST)
Date: Mon, 28 Sep 2026 14:49:51 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amber.kao@ite.com.tw
Cc: ite_pd@ite.com.tw, jeson.yang@ite.com.tw, Yaode.Fang@ite.com.tw,
	gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: ucsi: itepd: Add DisplayPort
 alternate mode support
Message-ID: <arpib-_yT8o6-hhg@black.igk.intel.com>
References: <20260918-ucsi-itepd-it527x-v2-0-7b2d9437cc72@ite.com.tw>
 <20260918-ucsi-itepd-it527x-v2-2-7b2d9437cc72@ite.com.tw>
 <arJgdmA9cWLMQpzV@black.igk.intel.com>
 <e0b87bb4960a4faa97078cb0cb9fdff1@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0b87bb4960a4faa97078cb0cb9fdff1@ite.com.tw>

On Wed, Sep 23, 2026 at 10:33:50AM +0000, amber.kao@ite.com.tw wrote:
> On Fri, Sep 18, 2026 at XX:XX, Heikki Krogerus wrote:
> > >  config UCSI_ITEPD
> > > -	tristate "UCSI Interface Driver for ITE IT8851/IT8853"
> > > +	tristate "UCSI Interface Driver for ITE IT885x and IT527x series"
> > >  	depends on I2C
> > > +	depends on DRM || !DRM
> > > +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> >
> > Please split this part into separate patch.
> 
> Hi Heikki,
> 
> Understood, thanks for the suggestion.
> 
> I will move the Kconfig prompt, help text and MODULE_DESCRIPTION
> updates out of the DisplayPort patch, so that the IT885x/IT527x
> support and the DisplayPort alternate mode support are separate
> patches.
> 
> Would it be fine to send both patches at the same time, or would you
> prefer that I send the DisplayPort alternate mode support after the
> IT885x/IT527x support has been accepted?

It does not matter to me.

Thanks,

-- 
heikki
