Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECE5345ECC;
	Tue,  1 Sep 2026 11:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261897; cv=none; b=uzCj/AueiKKjeP3tb7is6dyhrcZz+PvAqUx+oR3jDuRWf7CJHbC+K7tLs504MMH4jUMQDfX1b32mC8+381RoORQcvgfpoa9dbm3+4txnj6wi7CT28woICnFizy82qjXQZ8Cc5nR/rizQdn29hFhfspn3sfdVxJ8uuGY52xhV54o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261897; c=relaxed/simple;
	bh=XW2dwApA0a329Z5E7Ie15jEWR+nXLdDXttO3vc+pxwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWppjeihbMmMUjayNwmW6GB25TjOyBDgzTok3a+UkIB36/KOoqypIbxksSuRhkZEyl28siHgZ9l1flfiUJWxtcq0ivdKaG1nzF6+mSczDPH1Shcti07MaSHhX+Sof45JARotcSg4NdKCRTRPztzvWbKxq3urg6MI8B1ZVNUgenY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LILcLUfI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LILcLUfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788261896; x=1819797896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XW2dwApA0a329Z5E7Ie15jEWR+nXLdDXttO3vc+pxwQ=;
  b=LILcLUfIgTv/BQRtTluxloav04picz1wqXFcKvfw+LSA274Pk6JKYB0r
   fXHBhumwXywcJl3JgwWEaMqq9YR5tTrvQndXXpyXP0ShpIyFPZ4c4nxvb
   2XG4x7TMKhBaJvMOpUUu87fSuUJOoTErIsKmKVmIeKqzoQdjiwygJ2Yvd
   OD82f56qg+3qOyVb/ayw7ipu90a+uXC8VYWQOdJ3HfC2YRAIxYD8aHv/a
   q2LY35wgOw1m3M20bgH0/6+ysIo2wYBFhMvBExkakzkVqLknRxuW8KnwJ
   aVAOehfzmBU1HzzRHEOlHEtLjpIvruM/SagcFfyzf3ZzKObx5S3nIKrd6
   Q==;
X-CSE-ConnectionGUID: zu/5bxvdQjm9OuUlp+hTNw==
X-CSE-MsgGUID: d9cfoD+KQwmKZNJ1dmaJKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="114225712"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="114225712"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:24:55 -0700
X-CSE-ConnectionGUID: 6lMX8GZFRy2X+RMFr28l+A==
X-CSE-MsgGUID: Uxo+ltewS3mtiG1hVBxKHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="267756790"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:24:52 -0700
Date: Tue, 1 Sep 2026 14:24:49 +0300
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
Subject: Re: [PATCH v5 02/16] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <apa2AYWacrGWLl-7@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
 <20260831180101.3109854-3-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831180101.3109854-3-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 08:00:47PM +0200, Maurizio Casciano wrote:
> The Yoga Book drives its OV8858 from a 19.2 MHz platform clock, while
> the existing mode tables program the sensor PLL for 24 MHz. Reusing
> those settings produces incorrect internal and CSI-2 clocks.
> 
> Accept both input rates and use the actual rate for the reset delay. For
> 19.2 MHz, apply the Cherry Trail MRD PLL and black-level settings after
> the generic mode table.
> 
> The 19.2 MHz platform uses the per-channel manual white-balance
> registers for digital gain. Program registers 0x5032, 0x5034 and 0x5036
> and expose their 1x-to-4x range, while retaining the existing
> long-exposure gain block for 24 MHz systems.
> 
> The manual white-balance register definitions and programming follow
> the GPL-2.0 Intel OV5670 driver, so retain its 2017 Intel copyright
> notice in this file. No proprietary source or tuning binary is included.
> 
> Tested on the Lenovo Yoga Book YB1-X91L OV8858 with full-range test bars
> and real 10-bit Bayer frames.

...

> -#define OV8858_LINK_FREQ		360000000U
> -#define OV8858_XVCLK_FREQ		24000000
> +#define OV8858_LINK_FREQ		(360 * HZ_PER_MHZ)
> +#define OV8858_XVCLK_FREQ		(24 * HZ_PER_MHZ)
> +#define OV8858_XVCLK_FREQ_19_2MHZ	(192 * HZ_PER_MHZ / 10)

No. I told you already few times this...

In the given context of the change I expect to see either all in plain numbers

#define OV8858_LINK_FREQ		360000000U
#define OV8858_XVCLK_FREQ_24MHz		24000000
#define OV8858_XVCLK_FREQ_19_2MHz	19200000

or only first one converted

#define OV8858_LINK_FREQ		(360 * HZ_PER_MHZ)
#define OV8858_XVCLK_FREQ_24MHz		24000000
#define OV8858_XVCLK_FREQ_19_2MHz	19200000

And better to name XVCLK definitions less ambiguous.

(Also read this https://gruhn.me/blog/2026-08-03/)

-- 
With Best Regards,
Andy Shevchenko


