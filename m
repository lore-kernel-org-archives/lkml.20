Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BB53DD52B;
	Mon, 31 Aug 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169523; cv=none; b=iME5NZMUbjPzbgMuWUUuTpPQUC32db4IScr9Bu7w7DnVcFwVkeAXrKTN5Gde1gheniRmMtWLVfm7EvMvU6wqbXL+ky8q3r81+UuaerRigStCCmQ17qImTIFa6sHWyzA5yf5mWrP9IHwdcDUPFhqjWc0Vmxp5+VfcJHrBZbQ/oVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169523; c=relaxed/simple;
	bh=gQzwm5noWbz01jvLjFXEAsShIdISx+9ix3zb5X2dSrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQW2WkOC5spZCr7ZWH1KVRLcSd2kFZ2s4xobuKgfOnKXIWqvKGrlMrLYCKv4fMSWz8vdyWlGl+1xSsAOhANZa6bg7vAcfoz8IWl66eMKc4XlKWsT26cUQY5MTQw7XcuUz8TH9yw+7jPXGp64ApqqhV6HLK681beugwpE1YjcpRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2LYsv7l; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2LYsv7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788169521; x=1819705521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gQzwm5noWbz01jvLjFXEAsShIdISx+9ix3zb5X2dSrE=;
  b=M2LYsv7lNV9FNtMagvDPoef9+XncfblZQ4q5YmX4pSqaSv/X7D/a/73l
   KkCJf3IHGI57c4zvLDPBG8H4TzlYbUz+vX9ivmn3ulHM0i2qFiJ5CIELP
   5ezojDg0e06D+LGuTJXRzzlDP74Avfmlbnx/vdB28IY8OTWCA6ItLQ1kO
   CcBY/GUz4eMCgTvfNJ+HqZ8h3fw3aEiGFSc2fDC6ntp+vjG2dSCPlYlWy
   45I3+oNhxBsYz+sUm+wscAm/i2SqIJiboK+ydkTzDewYY+tQEEq0SX6ID
   P6Nl+CVNQAwJyRSulJCX6hNOU032gZJqFissYgajL2zdajjlCfkpnBm7V
   Q==;
X-CSE-ConnectionGUID: RYoDw1zZSkK0kTBju063Jg==
X-CSE-MsgGUID: 351rfqVmRcyHfrNLpMyg1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88777428"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88777428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:45:21 -0700
X-CSE-ConnectionGUID: BNZz5EiFTC+iTEauNgBqDg==
X-CSE-MsgGUID: vOpY7dZkQvKpgiPqmadaDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="266170805"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:45:17 -0700
Date: Mon, 31 Aug 2026 12:45:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/15] media: ov2740: support 288 MHz link frequency
Message-ID: <apVNK1OpZewyp2zM@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <8ad0d4958d140486e69c05e55865df49e55cd5b9.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ad0d4958d140486e69c05e55865df49e55cd5b9.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:50PM +0200, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91 front camera uses two CSI-2 lanes at a
> 288 MHz link frequency. Add the matching PLL configuration and mode
> timing.
> 
> Reuse the existing 1932x1092 crop and mode register list so the Bayer
> order remains SGRBG across link frequencies. Cropping the CSI-2
> receiver output to a smaller processed frame is a userspace pipeline
> decision.

> Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
> Link: https://lore.kernel.org/linux-media/apF0Cds9fnqQ7XRg@kekkonen.localdomain/

No, you shouldn't add these tags. You can refer to the URLs in a free form in
the comment block, and not in the commit message.

> Assisted-by: Codex:gpt-5.6-sol sparse
> ---

Comment block is here.

...

>  #define OV2740_SCLK			72000000LL
> -#define OV2740_MCLK			19200000
> +#define OV2740_MCLK			(192 * HZ_PER_MHZ / 10)

720 is left untouched so should this.

-- 
With Best Regards,
Andy Shevchenko


