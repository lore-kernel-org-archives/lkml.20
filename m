Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2322C3C9886;
	Thu, 27 Aug 2026 19:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787860079; cv=none; b=Op/ngZxx8Dq6ADGzlojMST/txJVj/g/Nu0qyrlmG/LUrzEAoINFbW/Zny6uDOLAMF0cg6ppVaX7Y9ghJ8Hri7yivqozfgNn4bkiiGqYyuEuuU5qa4AX2YI4BZy7ZQzTWXZgLX3CTOy03uv9XZU/73K2+DNg6vck7z4esfCNI0Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787860079; c=relaxed/simple;
	bh=H2qiEpZCqHPjQVHK+r2fSQ/lWXT2U/dWTjIZXALzNzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfWdYCCMLMU9qUHq/iK9s/z3EVVneyfIBmBAmEBwS7DAqVaDOp/w5W8J+AQONYG8Ilz8fLXikOeCRWNUuKRfIXkZ56YzChMnxylWRk1Iz8vkahYQ0AKuThd4GyyFsDJ33rPF3e3Z0RimUGy1vLK5ETw11VE52TKtc6McgWg/rVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoD1uaIX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoD1uaIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787860077; x=1819396077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H2qiEpZCqHPjQVHK+r2fSQ/lWXT2U/dWTjIZXALzNzM=;
  b=LoD1uaIXw49MVpR/1i/4xiYCGBTBrD9CnUVEWxCjiKOyN+VcnqWqB48n
   aLK70mMNmn9nSlBVTrDoCa/tXpMOrzxxQi2QacvNaxah2yBQOLHZYB+O0
   e77go2fOnmmxpI8B1TiL+xfyy3eEby32NBkugLXVhNzX26BeVPJBRg5GA
   3z1h5PcD0gYFAuhCAKJF6Q50RNE7s9uHMk4WtiXe+WuRE/hJ36RUGyzjE
   uLu7kuGfEhOhb8loA1HOzRH3+q9SGwCGyCUN2qoXErpLz+vCFm2WQbYfU
   TFXWEEA2JEQuNDc+Q80dp8NUUtMVwmqShnfGsxHyArJWgDCngvOsfj6GT
   A==;
X-CSE-ConnectionGUID: Ir3UI+eoSaKvNIOg6+8FpA==
X-CSE-MsgGUID: GtpDoe/dQq+SaB6/xKdyUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88421988"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88421988"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:47:51 -0700
X-CSE-ConnectionGUID: 1b5DHciEQiWWnq9Z4CQqMg==
X-CSE-MsgGUID: 846mXTZSTtSpRUzF3wimaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="266649844"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:47:46 -0700
Date: Thu, 27 Aug 2026 22:47:44 +0300
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
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/11] media: ov2740: Use C99 initializers for ACPI IDs
Message-ID: <apCUYB_6XFx97qs8@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-4-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827181756.2430054-4-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 08:17:48PM +0200, Maurizio Casciano wrote:
> Use designated initializers and the standard empty sentinel style
> before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


