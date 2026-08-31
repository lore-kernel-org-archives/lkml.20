Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2C3D092E;
	Mon, 31 Aug 2026 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169263; cv=none; b=QAbFp/83dfM7DXR+uGTkHE6TP00+/0Hi0PhfrEQiIhuCm6NQMC2mSWv3qY9HzYkSqYrRXVE8Bvqws5AiSnRhsqUz0hh9wWsV8hEklSl3QlvsQSQ+XCBP4oMwlD1DHTsoWwuS/MYhyphhBqteiufD6YXYO+fXw94C6mHLag9naMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169263; c=relaxed/simple;
	bh=A+1AuWH5q4++i7fiJolixzCdgay7Ft04qAqgv4KHHes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fe0WQ50t4siYL0ZjhzR6HJDxZ8hX0WdeLVJT/fXeTiSoJyAzxen8knZlEBjy9JBagdodZW/ZeEGqLTfoyKED7P4FUuQPoOcE9xbK+S5TG8hensKmBHjXKNFACSl4F/bxxVq3dV3LgMovlNLZ3YJoExIMHvBz13u0jT1pfnZy1Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XplwX/O/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XplwX/O/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788169262; x=1819705262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A+1AuWH5q4++i7fiJolixzCdgay7Ft04qAqgv4KHHes=;
  b=XplwX/O/oofRa5VpsVZ9TvEXkyrGfaf+3aaqIx1hfQ+I88jIo40PB698
   DR1ys1qiEPu0XX88aQhDYrg+VU5PuZEx+1/cizYIpYqQbVxjs+V0gXKGj
   gL04K0qmolbofo3gBpPx1xBrcqbrHXBD/KDNy3qKE/l6hYH9kHWSY1RRZ
   VJhlq+VPyP8q9Pjy5VvyPBW6JWD/rVkaBlT7A1zmdDKwyw6/ecrO16Qn1
   M+Mc6d6uUrwZd8Fw0Y4ikazlF4dR4Rj/icx8lCP7rheBEUoXMEdilnKdv
   Nc164PlCvQKWVQX+UH1yEMcjaUKyDDE+A4PY7Q1jqYnw7ITi4yGPt6FX1
   Q==;
X-CSE-ConnectionGUID: JCKlFrvdT76GrY+T4koo6Q==
X-CSE-MsgGUID: aH4VaaFxQmaL4CfSQA6A+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92437289"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="92437289"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:41:01 -0700
X-CSE-ConnectionGUID: 3y8zlOlBSeWDNS1l9+g6tw==
X-CSE-MsgGUID: qjjYhMTGR0OOgYngYInIZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="270676365"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:40:56 -0700
Date: Mon, 31 Aug 2026 12:40:54 +0300
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
Subject: Re: [PATCH v4 06/15] media: intel: ipu-bridge: Add Yoga Book camera
 sensors
Message-ID: <apVMJkJCO__onNqV@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <9b618d8076337f8129e235313cce90d86f95fc4c.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b618d8076337f8129e235313cce90d86f95fc4c.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:48PM +0200, Maurizio Casciano wrote:
> The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
> OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
> the sensor drivers when the IPU bridge constructs software endpoints.
> 
> This supplies endpoint data only; it does not establish that either
> sensor can stream on the Yoga Book hardware.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


