Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574563;
	b=watdcXHYO/WSW/cRMj0f1JF5d07IHH90bkkRQqBo+h61jbG4cE4kS+tQ6LVRgH84WA94
	 JtS2DioC1odvqJoXsicNTOs2f/LDJQlPOXbTAlYdLuxqDaCn9uJGA0SBfE7fEeEROf1UL
	 +6drIE5gOhhmdpshapsKnRmx/frC5Ymlp4KJVyY6SuPnRGwW8hc8akqhZjLgYwBOGZBy2
	 2I24nK93RRCO5lr0wJj0ShE9obA+JdMTzu1TRBGrq6u9QEzqVgxumyc5IUSD+YdnKsy/p
	 wH+KKkZgY/UHYNryE0uOv80e0SZcK9glg0TAzBVJlROeMortTDyGEDZwega1CvBHTpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574563;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Vk9aY89s6pA92E0vNLbihIZuEhO+Ko3Gi7DBOGllVjg=;
	b=cEEZCs3ILpv4VhKcRTEWd2ZtHusbIHu93MUdaj5zO+bR5qeAtU3PKTfmaJrEWjbHvwTZ
	 cpO3Owcwj3p+IgWcGqPDKgtq0mFBHw81teSEuXI0NrkR+a9r4/mERQVwsxevCJeE39y55
	 mOuxK7RaB1B4JQRWK7TtjeEa+mKzMH2TyaGwJsy6SUrjt4LkEeEjoaI7nfCHkHyA0uDvL
	 BdPB2i9QDyhaijsypwlobKoAkBU3W8ukclEBIScRk0iIIcWDurwfNA2qmzfMgyhyA2/Tb
	 GTfeC5wetp3edWje8ztHDizED/sgNZCsbjfTr5tHKUP932kD7ftP2N4EEHZrefp/TYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ennI8oYI;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C293606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C293606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ennI8oYI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792574563; x=1824110563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5qHWRgEcu0Y/DgoMW0RSVisnKQgZcxLOOX3IPrGwqvA=;
  b=ennI8oYIOChSJHl0K89GJTB55dPN8BbpaHptZxy9LZMdrIn9pMrzfDVC
   SZO9xPGTiGLTrKxj6tU2RAM+gLgtCl5+EvLYbti7eWK89UyUq9A97mU5+
   eJ+OgP0F4SrYdQ+oMUheNXYkoM60V9Q30CMKaiwzORPBsD70A6Gtqway2
   siBUGSEgOhsfPGSxOz+aCAFBqDvRJOrKjRWpyXF06w1P3MrpiFKj1vVjy
   zH0nQYjv4EyO9VxG12cOg88Bo/qf1Ys78X0p3WVnks+ppkxZfkpEwbbkB
   GeF5nLUuiAGjO/B/L4GULuNMUnn65Ki52uLEoDZDOvg+sfcShjB5kRm8K
   g==;
X-CSE-ConnectionGUID: YPGdXZkmRhOA23CsPFTiGw==
X-CSE-MsgGUID: Yx5G29urS9OtzqiOmsSrvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1304890"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1304890"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 02:22:43 -0700
X-CSE-ConnectionGUID: SOPGbBhsReCKTwJdx0sZdA==
X-CSE-MsgGUID: h4RsZ1+BSkSOPtR+bPhULw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3440922"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 02:22:40 -0700
Date: Wed, 21 Oct 2026 12:22:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/vsprintf: Preserve the sign of seconds in %ptSp
Message-ID: <atiEXdNApPHi5ObO@ashevche-desk.local>
References: <20261020220243.67919-1-dennylin0707@gmail.com>
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
In-Reply-To: <20261020220243.67919-1-dennylin0707@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 20, 2026 at 10:02:43PM +0000, Hungyu Lin wrote:
> The documentation defines %ptSp as equivalent to %lld.%09ld, but
> timespec64_str() formats tv_sec with default_dec_spec, which does not
> have SIGN set. Negative seconds are therefore printed as unsigned
> values: {-1, 0} produces "18446744073709551615.000000000" instead of
> "-1.000000000".
> 
> Negative values can arise from time differences, for example in
> fnic_get_stats_data() after the realtime clock steps backwards.
> 
> Use signed decimal formatting for the seconds and add printf KUnit
> coverage for zero, negative seconds and the signed limits.

Thanks for the report and the patch. My comment below.

...

> -	if (fmt[2] == 'p')
> -		buf = number(buf, end, ts->tv_sec, default_dec_spec);
> -	else
> +	if (fmt[2] == 'p') {
> +		spec = default_dec_spec;
> +		spec.flags |= SIGN;
> +		buf = number(buf, end, ts->tv_sec, spec);

Instead, add a new default_signed_dec_spec above and use it here.
While at it, make field_width to be explicitly -1, so

static const struct printf_spec default_signed_dec_spec = {
        .base = 10,
        .field_width = -1,
        .precision = -1,
	.flags = SIGN,
};

> +	} else {
>  		buf = time64_str(buf, end, ts->tv_sec, spec, fmt);
> +	}

-- 
With Best Regards,
Andy Shevchenko


