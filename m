Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3314D7D37
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406085; cv=none; b=YgkBWM7zCH4rHQDc/L2z92NocrYutTbyHf/Dnj25dHcOaBqKvpDyf/7UnhnawHCj2nthYKZE5lXfIOZRgRwlRwBAHFW37tFl64p3oI3L6Uc+IJDPbmGL2iSxHOZ13BTgVMq1TzO9w+0S1oavEnUmPpiEu/Uo1FK4OX021iUv+wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406085; c=relaxed/simple;
	bh=7LOZMQg9Q/q4SwwZSVBrl9lvTCUFPcpckixpwWRhCiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZagoMfBnfGQVnq+drKLKkrTeJDxGAlolDp4oQTE0OwrW35ZnDeALbMn+e5puNJi/YDlSdCKIjQ/16w47m1154CCBH17C86qq1mRg6cH5xDqImFfrvZ20mLIzM0w+k3hctYpOs4Iy3MuCijsb3OWHQtWMp0Xs07db7VufJyWDcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDcwq0le; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDcwq0le"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792406084; x=1823942084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7LOZMQg9Q/q4SwwZSVBrl9lvTCUFPcpckixpwWRhCiE=;
  b=GDcwq0le7aJSpbn0BBDBS/zNqELJ4DWesk67uq/unML+wrNFozd5koQJ
   Q9AaSN0onh1G4hgrktlvQQQ3ByKBhVUIV6ixjjYpr8VGacQ9h+mClcGgh
   mGgpxgGdsqkf+YuNR/v0p9m7wJ4jE5gSq6meygyAmQb7tQiKWjhiDy/Pw
   MpGQXmCyybmZER+DR6UBr5PU1j2UZyQgHos0GlncyD4IAZZaD/hFIv6T7
   /dmdEsORHk1EOqFytTtRrYsbMUeIqxFrn9UwDnNX5cwNfWkE6rUrtu94r
   /SNf6SNkr4E5bthGe6yD5LCILPnDTaCC0UeZLHroxpGEyYZUUUETTTxFI
   A==;
X-CSE-ConnectionGUID: aMbKWjjrQ5WruKQN0hOMKQ==
X-CSE-MsgGUID: VXPC60YISJ+OQzny78NwQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="977602"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="977602"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 03:34:40 -0700
X-CSE-ConnectionGUID: 7Dbh0Om6R6O9cYl76NF7CA==
X-CSE-MsgGUID: LOuld1yrQsmCrGUoum0e+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2565311"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 03:34:38 -0700
Date: Mon, 19 Oct 2026 13:34:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v4 2/2] kallsyms: Don't leak pointers for unresolved
 symbols
Message-ID: <atXyO26fEVPx2qDP@ashevche-desk.local>
References: <20261019-vsprintf_kallsym-v4-0-ffd3c012d00c@linutronix.de>
 <20261019-vsprintf_kallsym-v4-2-ffd3c012d00c@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-vsprintf_kallsym-v4-2-ffd3c012d00c@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 19, 2026 at 12:21:51PM +0200, Sebastian Andrzej Siewior wrote:
> __sprint_symbol() is supposed to resolve the passed address to a symbol
> name. If the symbol can not be resolved it will print the actual pointer
> that was passed. The pointer policy is to not reveal actual pointer
> values.
> For post-mortem analysis the pointer in the backtrace shouldn't be
> relevant. In BUG(), WARN() and panic() related backtraces the PC
> register will contain the actual value.
> 
> Add snprintf_default_pointer() as a wrapper around default_pointer() and
> use it __sprint_symbol() if the pointer has not been resolved.

...

> +int snprintf_default_pointer(char *buf, unsigned int len, const void *ptr)
> +{
> +	struct printf_spec spec = {
> +		.base = 10,
> +		.precision = -1,
> +		.field_width = -1,
> +	};

Isn't it the same as default_dec_spec?

> +	unsigned int w;
> +	char *endp;
> +
> +	endp = default_pointer(buf, buf + len, ptr, spec);
> +	w = min_t(unsigned int, len - 1, endp - buf);

May we avoid min_t()?

> +	buf[w] = '\0';
> +	return endp - buf;
> +}

-- 
With Best Regards,
Andy Shevchenko


