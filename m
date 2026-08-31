Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA943BBA1A;
	Mon, 31 Aug 2026 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169951; cv=none; b=eUVH4hVPOU9omhnX9XDwX4LEkMwYpYhUr1PoNMt9iQ79G8lHOWfYC6tZhniOwMtfPfMxrsmZ7vchgmZ8pAfEmiTj1iF00wz/0Jda2WU7RZcFFNheuBQTcwb+Yyk8a3zSHLfDvRKOk1/OloMVQyFwAXtN/bncYJm2KxMKovgLoiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169951; c=relaxed/simple;
	bh=8ZhBrG5o2YTFdjXnGE8yGi6CPq/zAx4Dt/1seSwfoug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVVgAvmV0Fh/flIzik16RJ2AfB57+qmyjTvcesx+ydvfIhN+WETMfCIRynS8Rnx14ivImZEYHJnl44B1NCH4ftcEABVI6qr07t4hlgfQc2KeYG/kR42JjeYs1REpuKUNhJzAPsrgdOArZtCyM6qcBBr6HPhk+l9cLP2Pod0VJ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LP4PJ1Qb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LP4PJ1Qb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788169950; x=1819705950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ZhBrG5o2YTFdjXnGE8yGi6CPq/zAx4Dt/1seSwfoug=;
  b=LP4PJ1Qb6QqIsHi226LxekTklKfxHgNv55+6z4V8wFvdcqdZmqR3zGSr
   imS1rJx28gnmPxm9AtpvVGwWStTB/bPksp+gf+5gDOOD1XqOTc9ka8lvJ
   q5mKLjNRXVu+EDwLuYuSxqjX/oxWjzuXmOQyCmXfrh8j44xM2CX1lWI6C
   4zzz/gVt/O55Ma0IYeTtM1jFAmTpuJGv2AQVfhHFaBAGmsU+0M26GbAjO
   RDeI7gXLvclli7jPYRGv45T1rGL5ABoDbCYzwWpvfYa4rfIWh/TW0TuSQ
   Jlp8OEM3Nb7HwGmY/1MmSAZmowYiTYOEV8efQCiDvXH5xZH76hmICqfQ4
   Q==;
X-CSE-ConnectionGUID: PtWauo9XSRejHxqeyX2oGQ==
X-CSE-MsgGUID: hRoZcHEmRl2ByonCHnq6MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99236284"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99236284"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:52:29 -0700
X-CSE-ConnectionGUID: SPIvot9fTYSSuQXj1OHQQA==
X-CSE-MsgGUID: v0fgWiB0QSuugjJz8DROTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265036303"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:52:26 -0700
Date: Mon, 31 Aug 2026 12:52:23 +0300
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
Subject: Re: [PATCH v4 09/15] media: intel: ipu-bridge: allow sensor-specific
 link frequencies
Message-ID: <apVO1-vqhx_4I7Ke@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <2c2803b500ed244e59a98506c97eccc4f422cf7f.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c2803b500ed244e59a98506c97eccc4f422cf7f.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:51PM +0200, Maurizio Casciano wrote:
> A bridge-specific firmware parser may have more accurate link-frequency
> information than the generic ACPI hardware-ID table. Let it store link
> frequencies in the per-sensor bridge data and prefer those values when
> constructing the endpoint software node.
> 
> Existing bridges continue to use the hardware-ID table when no
> sensor-specific frequencies are supplied.

...

> Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/

Drop this.

...

> struct ipu_sensor {

We need to use common sense, AI sometimes produces a crap.

>  	u8 link;
>  	u8 lanes;
> +	u8 nr_link_freqs;
>  	u32 mclkspeed;
>  	u32 rotation;
>  	enum v4l2_fwnode_orientation orientation;
>  	const char *vcm_type;
> +	u64 link_freqs[MAX_NUM_LINK_FREQS];

I would orginise it as

	u64 link_freqs[MAX_NUM_LINK_FREQS];
	u8 nr_link_freqs;

// blank line here

	u8 link;
	u8 lanes;
	u32 mclkspeed;
	u32 rotation;
	enum v4l2_fwnode_orientation orientation;
	const char *vcm_type;


>  	struct ipu_property_names prop_names;
>  	struct property_entry ep_properties[5];

-- 
With Best Regards,
Andy Shevchenko


