Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792939908;
	b=tHLFpw2dboTKd+0DcgJxGN/oZZ629goQsMf5GaCuNUguPmVl0c91sOR+EyAxT8ReXY/V
	 u+agAAzTxKRuIfNsSf41CzGlZqcbE1nND/y5XNpCSgOhqSAvrVzlinX3C2EKFlaVaqKcX
	 GlnBjRkV1eWsC486YSuWn9WlK7PEb7TuAAC0RPG7y6vxArB/Z/X21ol7GTsYUawcN2i23
	 w4e1oLdBM5zbPEl6RYBCjDztfhPvtJpabJbqUKUsY2XJimvJcRM5HfPnQxf//1kyuMnjH
	 K1f3ob+01CUwviDnOjtpQoo1B9FhT09X1BRtSG66/c68yvQdgGno33y5QthXp67q1Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792939908;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=F4hxN0oc7wxx2KMpbjPD8CpwfkrR4/xJHGoFHdsI5Xk=;
	b=k149zDgdVm8qvLgzjYE/sfrjcL93EQ1Sp22QQsBrzwy9exquNkWzd/M+7C0QgbExrgsG
	 4C95juN9JqUPGvM01FnMpVG/2hlo5nhnvMsGvw7NPwCZnFSZNEppJ7Zgx7wklQc+tJsFi
	 3824U9jiuUqT1A8tn/xj4QvhQz1+0gBP8Us5+j7Wm3nb3a5sjuuFxzpJA8SKo50bx8DrY
	 JxPBUOfRzg3gWOil6AnS+iw2MQOZYBYa6ENmFUp1rSg2f5kLFCY8FMIgbAWZOIcw6u0mC
	 iKmAC+MG5czP/M7xNiSMIOW2CAYn8Lvq4xpAeLedGp6Su95Mz4rZCJBIDdySfpghqAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NDki8Xox;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7106C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7106C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NDki8Xox
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792939909; x=1824475909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pYGgnpLg5aHaxx50rDTxgKBAhPkeTpspeESOVCaqJfQ=;
  b=NDki8Xoxohf0aUzGFVqgOSvsTjHZHIjL94caJUwcg6Jdlgr4N+YQgPAz
   xbWGebJ1Lf83m3o2UZXidEv4fhIaLmL5jL+qpHgX6PexH7IWAMcW3x8zm
   TaVdWtYro14/afT+CPTVVHndHanaJ+pk/BeyKVoo4a1Qj8zWl+917A9FH
   W3ZI0vy18lEmX/VObIsgDieml0WI3pYczhDN0nBb3ZA+m+hY3YqSRxofU
   pxLSXPzhkD1JB8icEaTSC++drqQO1UZdVKfeNnbdVE2l5AOJr56YUMSwX
   QGiR8In4b2ic4kZk/zyBw+iXd/SqDyur4iH7FJ3g3spsmsB2MaZKQiGJI
   Q==;
X-CSE-ConnectionGUID: VIsVsn6LR7WRs2jq9E2OSg==
X-CSE-MsgGUID: GxjjMUmUT4+SLDWLT1H7mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1629026"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1629026"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 07:51:48 -0700
X-CSE-ConnectionGUID: uSlHMUvQTAqoB8t6qW3TfA==
X-CSE-MsgGUID: s4DwdcWASnOROlpuz89Q9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4095759"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 07:51:45 -0700
Date: Sun, 25 Oct 2026 16:51:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v5 2/2] kallsyms: Don't leak pointers for unresolved
 symbols
Message-ID: <at4Xf345aTRe9N7o@ashevche-desk.local>
References: <20261023-vsprintf_kallsym-v5-0-57ff92187c1d@linutronix.de>
 <20261023-vsprintf_kallsym-v5-2-57ff92187c1d@linutronix.de>
 <atyDTcu92iqtQ0h3@ashevche-desk.local>
 <20261024161029.a52VJ8Bg@linutronix.de>
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
In-Reply-To: <20261024161029.a52VJ8Bg@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 24, 2026 at 06:10:29PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-10-24 13:07:09 [+0300], Andy Shevchenko wrote:

...

> > > -		return sprintf(buffer, "0x%lx", address - symbol_offset);
> > > +		return sprintf(buffer, "0x%p", address - symbol_offset);
> > 
> > Hmm... Do we need a 0x here? I believe it's embedded into %p output, no?
> 
> No, it does not. The %p does a fix digit size (different between 64 and
> 32 bit) without the 0x prefix.

Thanks for checking that. I dunno why my memory is weak in this sense...

-- 
With Best Regards,
Andy Shevchenko


