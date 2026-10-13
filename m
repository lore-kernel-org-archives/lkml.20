Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28F4EFFC0;
	Tue, 13 Oct 2026 16:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907599; cv=none; b=RLbdB1naqKk2e5BOS3F5UrSqYAES0UG/4ALeJYb5vEsBS9ETCUZWxHzlvHLZDFnQLuLiWY8WzR8A9tMiiJ1VedjfwlXct7CiYUan/2G/E+JbhAiHLYZWflY6bZSE9WSoOoFD9xRKUMw8R1iB2Z+Bm2As2goqLCMPGt22iX1qLDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907599; c=relaxed/simple;
	bh=5j4Fa2hEPLpkLUY9qXFZYhRQpuA8BKf6NX+W8FBXNrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtdnsFIFGES2uP8w8CJ53QoDy1daQ6NEvny2Pp68kCve/s9LtzFPD1FOXvn67jf8b6VIjp61mwwccDimkg4mcG1TULlUYxiXjsc1HFNjAwaKuqyohM+gild56JJwKQrxUZq5h7BY8Cqpco/jKBD0yS6e24mEj/tdNGmE5gBhdb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zmbdhl6I; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zmbdhl6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791907599; x=1823443599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5j4Fa2hEPLpkLUY9qXFZYhRQpuA8BKf6NX+W8FBXNrQ=;
  b=Zmbdhl6Iptgivv3afNlPC6f+Szz8XbrdFdPFvkg41SnouiNssz8TwcfS
   KlfdHtGkgV0l0omI2qr2l1YXJfcWj/xHo9TeObkDdDUpS6Z1iiukTqtL8
   xxx8cf8D7M2zymm5F1Q6Xes50+f3u+M4clR4yPkM6LL0KoSMuFNbhomek
   BJETZCZiNv97gpUQWK5LUYHryFHzr76bho1k4JY/5G7R23QVXHiXOlbJx
   F2E92D65Gww1k6LD3NYtv2Nck8k83UzeMqxcxi/36QkGzUxDF6N5bK6lY
   0xHnBScz2sQRHvhptxzBS0pj181pCqM3mt1EXAX6tcJy8Oi9QQRcQmEUw
   g==;
X-CSE-ConnectionGUID: 7AjMWjb0S9G8sxl2hx1rPw==
X-CSE-MsgGUID: iTY53SZ2SgKDPPf5Ba2mFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="539291"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="539291"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:06:38 -0700
X-CSE-ConnectionGUID: xdKiRcIdSqWf/Caf4ZhzPg==
X-CSE-MsgGUID: iSt42Bu5S6qLClbaI0gxZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1636088"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:06:35 -0700
Date: Tue, 13 Oct 2026 19:06:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: atomisp: sh_css_mipi: include
 assert_support.h directly
Message-ID: <as5XCB4qLykBYmEE@ashevche-desk.local>
References: <20261012230754.1914517-1-vladurares@gmail.com>
 <20261012230754.1914517-2-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012230754.1914517-2-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 12, 2026 at 11:07:50PM +0000, Rareș-Mihai Vladu wrote:
> sh_css_mipi.c uses assert() but only gets its definition indirectly
> through the circbuf headers. Include assert_support.h directly so the
> file does not depend on that include chain.

...

>  #include "sh_css_defs.h"
>  #include "sh_css_sp.h" /* sh_css_update_host2sp_mipi_frame sh_css_update_host2sp_num_mipi_frames ... */
>  #include "sw_event_global.h" /* IA_CSS_PSYS_SW_EVENT_MIPI_BUFFERS_READY */
> +#include "assert_support.h"

Keep it ordered by name.


-- 
With Best Regards,
Andy Shevchenko


