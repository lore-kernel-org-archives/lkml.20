Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3393D283FDC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874253; cv=none; b=IJfDLAM6n9/ZFSa8S2Q3FD3q7fgmGeOzd6mTksnC3u4ZwE0Bh1eqWohv+/1+5Bfzr+LBmMxe1eYs2fg2shN9JrNEIxStivBY7T8PswCeA4AXOKT/wwYTq5RTIarI7pORsn7B4do63kc4hVOAGDAdGbs5u/zwidRqPxcHknX5f88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874253; c=relaxed/simple;
	bh=VgEfqg5hvHX0CcKzKwlhvK+zNr9FM2P8Sp3M8ToIVDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyW+iGtdpbehNgGeC7alCH8KfqjZEfaWZEaGFr24X4Mes7ZBI+DParfYlE55YoNJezvwjs9xMvnY00E29mfYqh2tezdQ09XJGOAgEtfzObEBdC7rpWX27NML1QIgxIL4gmUa5nPLOAX4/5IuZI4EdKtZqLhfowX+mAACKyT0ZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ogpbmfmd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ogpbmfmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791874251; x=1823410251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VgEfqg5hvHX0CcKzKwlhvK+zNr9FM2P8Sp3M8ToIVDM=;
  b=Ogpbmfmd8sytJ/M8twlbO6nrFR1JM61yANj1hix9foecAo5P0LjUL7pF
   Duencvd9Rw3EmZ850BsXNu+2rZqc5Gm552mQxatN561OoWf35rpDK1E4q
   sQkPzwchmA3iyQZ2jboYpPWGjicHdMJ2Alwt8EzEyLsnJU2j/9fK91tYR
   XdlD7KQc/mKXAztyvHs+Mx9CI0DftaUtGJMRNi+MsvKUkP+2L3baH3+B0
   Q2ihB1qpRCBRDXdb9NKiR9sVqS5cpB9V6CLLPRVOPhWKk8ZfaxcjmAX+s
   DM1qJC2IEhmcP4nxVwGBxHM1IWTI72gN3BgDWNP8bQCx6IJVizIZ6aoxY
   g==;
X-CSE-ConnectionGUID: ehaJSkAxQaqiJN5dVi0QWA==
X-CSE-MsgGUID: gkorXQ2KTZui+jIgu2mglg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="476536"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="476536"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 23:50:50 -0700
X-CSE-ConnectionGUID: zSBlbNU4R5i4mf13FA9i3g==
X-CSE-MsgGUID: NxOJWSQIQXSLMZN4Cj66FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="2861658"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 23:50:48 -0700
Date: Tue, 13 Oct 2026 09:50:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: helpdesk@kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: Create printk@lists.linux.dev
Message-ID: <as3UxRboBZYY3oCH@ashevche-desk.local>
References: <asjrq9g8EoUGepcH@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asjrq9g8EoUGepcH@pathway.suse.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 09, 2026 at 03:27:07PM +0200, Petr Mladek wrote:
> Address    : printk@lists.linux.dev
> Description: Linux printk and kernel string formatting development
> Owners     : pmladek@suse.com, john.ogness@linutronix.de, andriy.shevchenko@linux.intel.com, rostedt@goodmis.org
> Allow HTML : N
> Archives   : Y
> 
> Reasons for the list and additional info:
> 
> Honestly, the main motivation is to allow sending Sashiko review
> for changes in PRINTK and VSPRINTF subsystems as a reply to
> the mailing list.
> 
> I have discussed this with John at Plumbers conference. We both
> agree that Sashiko review is useful and often has to be addressed.
> It is much easier to reply a mail than searching for the review
> via the WebUI, copy/paste it to a mail, and comment on it.
> 
> In addition, there are several people interested into printk and
> string formatting code. The mailing list would make it easier to get
> all interested people notified about new patches and problems
> in this area.
> 
> That said, printk and string formatting are related only to some
> degree. The printk() code is more about tricks how to store
> the messages and show them in various context. While the string
> formatting is about tricky buffer manipulation and helpers for
> generating a human readable output of various data structures.
> 
> There is only partial overlap of people interested into these
> two areas. Each group might deserve its own mailing list. But
> I would start simple with a common mailing list. We could always
> add another one when needed.

Fine by me. Should I do anything, or will I be subscribed automatically
(as an owner)?

-- 
With Best Regards,
Andy Shevchenko


