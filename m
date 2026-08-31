Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1D03DB64D;
	Mon, 31 Aug 2026 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168735; cv=none; b=FDyLj31Zm5Fgc6EWvvnkO3F4hfZWOWU2Q/qDMDNkME4oppKzCtduwBrO9z0GDW9hmSELuQ5zERs29QWvj/wHn+3ttLF22CkOO22u+DAKQwst1mOGgNXE7Wzje+AYL8bL2k40mHXQ1hr57FuBvJJH3+dlNxZxBO+yQ4Vq/FJ0/PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168735; c=relaxed/simple;
	bh=kYFY1a0Km/MA/WbUGgeqey1AxwgJqE9ciOIuHC/0EBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ln3t544umfwu6J1ycfG2q8fRrfsLK6bUF6gpRaijma3Ie7p6d4qIFGEEpbeNxQb9z/DZ2nA+x6IbVy4H61+I8SG6EzizfKynbydH07CZhWNekGwIBnJNN1fVcOrxk4c7SClI3wQWQYCuUTShQtWQJLLB26OnNYMlgdvWLzzQFv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgfcXBv+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgfcXBv+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168733; x=1819704733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kYFY1a0Km/MA/WbUGgeqey1AxwgJqE9ciOIuHC/0EBM=;
  b=lgfcXBv+VTb9Wpy/HPr4S6xqYAzT+6ZDoZHmIhtoDRh+wmR7dhtko9FW
   dx52bXoybamkMQaLZpb067f1vLfbpb7xunwKuPB8+BdqGS7pXDe4jkCke
   92CGlosUitxMji/er7iO3tvp6IE0xWJQ6FUrTpJvDANV3KCwaGTh7nrpS
   8QbLaFJziyXTZNl9roE5zNX/UHuSyrIAt818kO47ASPzb31wUlJWX4Kco
   JTHT2ZrAOvltuZ2KEeBt5jkgrOPLOjpLO4Np/j2/8dcZcCzgzjBQ5cJ5A
   K0UpbNCkl8VyZjgsKD9LkUUdA/WtCKt8AWUI2YiiqKyz5xPNb+XkSa3JJ
   w==;
X-CSE-ConnectionGUID: /uZZ91+URVOoL3mo2zHttg==
X-CSE-MsgGUID: pc3/FmnuRI2KbgUv8yb1hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="98908153"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="98908153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:32:06 -0700
X-CSE-ConnectionGUID: ZelpqDcMT/a4r/B7IsNdVw==
X-CSE-MsgGUID: H9UWajU5TtuPmfLtlYReUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272941824"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:32:03 -0700
Date: Mon, 31 Aug 2026 12:32:00 +0300
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
Subject: Re: [PATCH v4 01/15] media: ov8858: Extract digital gain programming
Message-ID: <apVKEJ63Ew6qDWrn@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <1a7c8fba6835b2191b71ae1d903734621626e1f6.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a7c8fba6835b2191b71ae1d903734621626e1f6.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:43PM +0200, Maurizio Casciano wrote:
> Move the existing packed digital-gain register programming into a helper so
> clock-specific gain handling can be added separately.

My comment was ignored, I am not sure why...

...

> +static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
> +{
> +	u16 long_gain;
> +
> +	/*
> +	 * Digital gain is assembled as:
> +	 * 0x350a[7:0] = dgain[13:6]
> +	 * 0x350b[5:0] = dgain[5:0]

This comment most likely has a typo as I pointed out earlier.

> +	 * Reassemble the control value to write it in one go.
> +	 */
> +	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
> +		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
> +		     OV8858_LONG_DIGIGAIN_H_SHIFT);
> +
> +	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
> +}

-- 
With Best Regards,
Andy Shevchenko


