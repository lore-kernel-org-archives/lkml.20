Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7853E832A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874322; cv=none; b=M+/EaxOF/uTVB0HMrDF40zrVRZqivXr0XJ9Pb6TTZu3jVJ6CIP3leZfv7Z3J0FTtvfzltNR72MzeG+xt5eK1dVgkZroqxs8jGDS15WRRmTV3XKiwz3LUDlOPHYyjQG1iNO8K6oeROBJ1VFC6MyiXXSU8jiOfyCusPWUBg1ZJs4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874322; c=relaxed/simple;
	bh=73XvLDAwaAAqGxd6pbOYsx79HOb5dOGxo4/Okig2YsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olNHK4mdz5rMdjkM6GKqaaqjgGIl5BYGkP2UdA3CXJY5B2E/KA7OcTNyhmMNTqQBIUbPQrdzN9mAGPC8ZQRE/PXsmyIKLRPFFTEWsCbobgP7CSaFZY+oDCDwvAmmH6m0cOg3SHSjM5YMdtC8BnoJ7WcFvleuO7k0SP+O6EOl9rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkkvoEU7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkkvoEU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791874321; x=1823410321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=73XvLDAwaAAqGxd6pbOYsx79HOb5dOGxo4/Okig2YsU=;
  b=PkkvoEU7huI+dCP7IX+7U6I8wkmb0ak1gaY1WrY5Iw2X4kVM2xAHDiun
   j+97J17p7os+bKJca2d7s61woBvQ1sCHz6jkWoj/rUeh7uFo/8GNyF9E3
   CwgyfZ3//bCEANpzx8ZJt0+zee1KIrs/godED3lmhmSdLLBry/vFPFOSv
   jFfryIahU36zQDWtwbEd1OsBwNeHKEosJ6Ud2nhU79XVlUkM9BKWVFKGm
   foj+51dIAXb+liAFSpAFXxKcWIPvmCMB2/hoDjEZ9QfFPt+jVnLtZOjP2
   IamVgv32PmplghASjAqd+SO75XaGloRUehf2uJgNXdCf/aG6+pgdyiohc
   A==;
X-CSE-ConnectionGUID: wbMlF6lDQjWWb1nGeTk0hg==
X-CSE-MsgGUID: yVLGRRe7TYiLY1qMMsVdAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="486696"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="486696"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 23:52:00 -0700
X-CSE-ConnectionGUID: bI0xKfbSSIyJf8+5KW1PHA==
X-CSE-MsgGUID: sB4p+EcQTmaDeLCW6FcrsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1012179"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 23:51:58 -0700
Date: Tue, 13 Oct 2026 09:51:55 +0300
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
Message-ID: <as3VC2TmhcRXg0Xj@ashevche-desk.local>
References: <asjrq9g8EoUGepcH@pathway.suse.cz>
 <as3UxRboBZYY3oCH@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as3UxRboBZYY3oCH@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 13, 2026 at 09:50:50AM +0300, Andy Shevchenko wrote:
> On Fri, Oct 09, 2026 at 03:27:07PM +0200, Petr Mladek wrote:
> > Address    : printk@lists.linux.dev
> > Description: Linux printk and kernel string formatting development
> > Owners     : pmladek@suse.com, john.ogness@linutronix.de, andriy.shevchenko@linux.intel.com, rostedt@goodmis.org
> > Allow HTML : N
> > Archives   : Y
> > 
> > Reasons for the list and additional info:
> > 
> > Honestly, the main motivation is to allow sending Sashiko review
> > for changes in PRINTK and VSPRINTF subsystems as a reply to
> > the mailing list.
> > 
> > I have discussed this with John at Plumbers conference. We both
> > agree that Sashiko review is useful and often has to be addressed.
> > It is much easier to reply a mail than searching for the review
> > via the WebUI, copy/paste it to a mail, and comment on it.
> > 
> > In addition, there are several people interested into printk and
> > string formatting code. The mailing list would make it easier to get
> > all interested people notified about new patches and problems
> > in this area.
> > 
> > That said, printk and string formatting are related only to some
> > degree. The printk() code is more about tricks how to store
> > the messages and show them in various context. While the string
> > formatting is about tricky buffer manipulation and helpers for
> > generating a human readable output of various data structures.
> > 
> > There is only partial overlap of people interested into these
> > two areas. Each group might deserve its own mailing list. But
> > I would start simple with a common mailing list. We could always
> > add another one when needed.
> 
> Fine by me. Should I do anything, or will I be subscribed automatically
> (as an owner)?

Ah, and it's better to have my andy@kernel.org address.

-- 
With Best Regards,
Andy Shevchenko


