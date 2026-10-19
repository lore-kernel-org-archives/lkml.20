Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC649BB65
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407962; cv=none; b=G1DCP/CEVgIAoPyCGhiXzlZPYKhdc1nYe5qdPCe7qJbNLMZ+88nbY/nFBrt1jhOauCvHNK8CgJmArg26QHE12pEozQsjNhXaUmdcnRpPUu9ONM5gOIED4mmh7Ka+AbpCzPJqsxq+/bDFYK5gTEgce7TEYk2Xj6SrQSABC41AsvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407962; c=relaxed/simple;
	bh=EK1L5/upnuIpVwUbkV1WZDXtKzkL6enxHVYpa/RxkyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8JBFAcnrH8AuMkrLJCJtnjnZNs7qGIj0N6Er97H0Qyav9pzz5aZztM0q2AsEiOydsdCTADy/QFaAJ6Ga1dvj8q26tfVRovURTjRBXnDmuNe1hVkg5PU7aNHlubqo6vmSCyuIDSF7x5X3DlqqHkaWk2KXBBEgg8J7TELjjHP6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/l1URbb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/l1URbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792407961; x=1823943961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EK1L5/upnuIpVwUbkV1WZDXtKzkL6enxHVYpa/RxkyA=;
  b=f/l1URbbN+hBaVztDhSbUJ1aUn9wTl07fwhDvtiH77TvRiJ7AtMUMElM
   x7iixU7LCgsJb4coWfGtLoRYd9zNjZs4PzVRKIgMuB/3ZqndrzYR58xHm
   B8mxBMFG2PYVAbfVVe/AaafMzE2bwe8oZ27sihPSSdzo4k+kj5SGnjQOD
   G7uye3Ex+g/cXYG0uBAcF3eccxBWy6CDrDCgU5UTPi8dxVGN+jnrzsREu
   kwdPpmBRTrYTCYvV7nmHQohDd5mjuAI1DYtHV/JFNSoBF6utWR/NJFmST
   xJAlFR3sOvLd32ral5/xDNirEVRVDzdCzitU9XThsqU4L8c+onfdbxNU+
   w==;
X-CSE-ConnectionGUID: Ru38/NfqT7CDi/OrfE5VKg==
X-CSE-MsgGUID: 5K5kdU5GTaqSROsf16whdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1111385"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1111385"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 04:06:01 -0700
X-CSE-ConnectionGUID: bObFOTqeQA2EXCCutklAlw==
X-CSE-MsgGUID: +agKhYjrToKrqBh54NgL4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2509816"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 04:05:58 -0700
Date: Mon, 19 Oct 2026 14:05:55 +0300
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
Message-ID: <atX5kxXueI5tjoYa@ashevche-desk.local>
References: <20261019-vsprintf_kallsym-v4-0-ffd3c012d00c@linutronix.de>
 <20261019-vsprintf_kallsym-v4-2-ffd3c012d00c@linutronix.de>
 <atXyO26fEVPx2qDP@ashevche-desk.local>
 <20261019105025.igQtXzuZ@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019105025.igQtXzuZ@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 19, 2026 at 12:50:25PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-10-19 13:34:35 [+0300], Andy Shevchenko wrote:
> > > +int snprintf_default_pointer(char *buf, unsigned int len, const void *ptr)
> > > +{
> > > +	struct printf_spec spec = {
> > > +		.base = 10,
> > > +		.precision = -1,
> > > +		.field_width = -1,
> > > +	};
> > 
> > Isn't it the same as default_dec_spec?

> Except for .field_width, yes.

You can update it there. I think in all other cases (I briefly checked, but
haven't run any smoke test with KUnit) it should be an equivalent.

> > > +	unsigned int w;
> > > +	char *endp;
> > > +
> > > +	endp = default_pointer(buf, buf + len, ptr, spec);
> > > +	w = min_t(unsigned int, len - 1, endp - buf);

This also won't properly work for len = 0, I assume? So one can't make
something like kasprintf() on top of this.

> > May we avoid min_t()?
> 
> min() complains about signedness (len unsigned and ptr diff signed).
> endp is >= buf so it will be unsigned.
> An alternative would be manual comparison if the buffer size has been
> exceeded or not and act upon it but this looks simpler.

It looks simpler, it looks wrong :-)

> > > +	buf[w] = '\0';
> > > +	return endp - buf;
> > > +}

-- 
With Best Regards,
Andy Shevchenko


