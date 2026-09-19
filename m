Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AB328CF5F;
	Sat, 19 Sep 2026 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827129; cv=none; b=IZqr0H57synCqSfBUs2udSbYdL38ApBIvN1y0Qzm5AUO/HLOWT7N7PJKqPRZTPINGCC0RjlBIvvXsKgosYoU1BEsKLNfnSWSXt0NTuJ43v/gqgUlytAhQRF+FiWWCWG1eZrDYZa/AB0o7pPJMXncXgUZwQ9Q8HrXebUVxI42/4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827129; c=relaxed/simple;
	bh=oiT2W7xC0aeEfU8Ej8FsqhEh28h2sQJqmSzuWMxFGqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnO17b03z8/nwnimgY2WrrAzTH2WE5f/ukrOm+r53l9peVDTTRQp6goTVQ3vz+/PEtKGoREwOcH1Yjs1lKp2A0PrxuwIaG5L+j5MSPLHev+9KzTuCfzIM5i70r6NkQ9lRWDVfaI6G/KcRBRNRi7n63tbgw05r8S6TEJqSnmN1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COlwSANl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COlwSANl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789827127; x=1821363127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oiT2W7xC0aeEfU8Ej8FsqhEh28h2sQJqmSzuWMxFGqM=;
  b=COlwSANlB0Gu7ROhe91kuIjBhIQODr7Gotora/MP0VPD26T828d+zkha
   USvGi+BHd4dSb/7GArK18sOpjT1khBh/vQYlR3a/vh+wM2zv5IZYcLjhC
   zGK8xOOWJNV0HyPTWoomw4a17Alyq+R4XFIhwOpkYIgdU/UfmS+yCbCPA
   FKOLwkKygeTi7f0tB/oiUGNWgMmTRhAwmSDGAX0Sd/PIxparmhTq5Qw9/
   uO2NoyttyUhGu0OE573MMk5InMUcZW2d87SUMGhoSfygzUtcxsGJ0bFX4
   /4MrsbcJ2GW20RGGainZ/DioExL+CZ8mxrhppyBujXuh+uYHwvPa6d3eq
   Q==;
X-CSE-ConnectionGUID: 6FPnSvwZTaaO5QDwh7ACXg==
X-CSE-MsgGUID: WGems2+BQFyhQkMHiZpQBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="107858045"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="107858045"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 07:12:07 -0700
X-CSE-ConnectionGUID: 1akxsCysT8a4UURBig5DGQ==
X-CSE-MsgGUID: CWNV1mhdRZGJmmbfLFmvkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="268521340"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.50])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 07:12:04 -0700
Date: Sat, 19 Sep 2026 17:12:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: remove ia_css_circbuf_t typedef
Message-ID: <aq6YMsRFmACGZUF-@ashevche-desk.local>
References: <20260918214132.1135549-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918214132.1135549-1-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 18, 2026 at 09:41:32PM +0000, Rareș-Mihai Vladu wrote:
> Remove typedef ia_css_circbuf_t and use struct ia_css_circbuf_s
> directly, as per kernel coding style (chapter 5).

...

>  void ia_css_circbuf_create(
> -    ia_css_circbuf_t *cb,
> +	struct ia_css_circbuf_s *cb,
>      ia_css_circbuf_elem_t *elems,
>      ia_css_circbuf_desc_t *desc);

So, this is half baked patch. But even if it was the full one, the problem with
it that it does nothing useful. The useful change here is to refactor this to
use either circbuf or kfifo Linux kernel APIs.

...

TL;DR: Try more useful task first, please.

-- 
With Best Regards,
Andy Shevchenko


