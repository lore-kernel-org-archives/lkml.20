Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C88B43BDD0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920838; cv=none; b=Kt3KPfur93mR+lwsU5hvZA72rE1h0j65oXC7ye8mttKIjJ2XlnBQtOnrf6U7BTBftlq+LhiJES3ElD7Ur7orGuD8aswCcZby0YVLH3U2ooN2aGhBalmGJDy74VFJnne7I5v6ZPMpSIvVfb8N/K2Giigpou9W3FnpH+amymtSeSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920838; c=relaxed/simple;
	bh=HJuQqMA4q8tSxuJu/goXmCkJ2O3/BBEzNNXTsEU7kCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mI8NeMe/s0Obzrs6T1gHshjJD11VbUbO+W32QXtD0hGi729eIIPNWbOAtVrtt/6ZIxOpY9wMgNfDBEHzObNGku6qwLRL3CjGt1ZCvfXaAzxn1iMlh1nlxIPTK9nduVP1q2rts1Sqa+Mq+H8+D3am+RWFvuDV922ILdSXb/UnsqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etv6FqTQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etv6FqTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791920837; x=1823456837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HJuQqMA4q8tSxuJu/goXmCkJ2O3/BBEzNNXTsEU7kCI=;
  b=etv6FqTQmG6uJo7JSRhg4W4mpfX6CFF56ZEhDIwAfW70s0rolrL3Gjmm
   AwIh2zz6TfGjMnnlgvqClVRa3glbiDcVm6dduM8l0IE7wvVFShqa6pr2z
   eZFMrc6C28EJOmfmBZIFpqIBU9WT8zQ0df1HSYtox3pUL9YgNjbQUsDBI
   oMMqim8jxPJ7Qr+5niaD5R+9cvrOdFT1bEWfHQDDL7peVgN8XllX11vmv
   cVd5hXUXpQtiM1396il0HtsApWBQJ/sJbbsescHUpzJrnNNSU80ZOvOjq
   B9usW+tkHcGhVFnzlRcYeXKzW0okGpoPbzDBXP0flpGxEMQe6tRKtbcBP
   A==;
X-CSE-ConnectionGUID: 4LSLrWJ/T4GkhKgNW41w3g==
X-CSE-MsgGUID: ktVZnoG9RIu8PXHQ3zJSsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="650328"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="650328"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:47:16 -0700
X-CSE-ConnectionGUID: /19LJbibRPi3oed3PgHAMA==
X-CSE-MsgGUID: FIHpLiVmRtmrmy4gn+EaTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1343501"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:47:14 -0700
Date: Tue, 13 Oct 2026 22:47:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <as6Kv9usOjhlx8zx@ashevche-desk.local>
References: <20260408211407.2295175-1-andriy.shevchenko@linux.intel.com>
 <20260409082611.73fac9ab@pumpkin>
 <addcJP2erqYh8pD2@wunner.de>
 <20260409122846.7d08d2b4@pumpkin>
 <ad41TpzL4onrcKzn@ashevche-desk.local>
 <87ik9cfm6g.fsf@bootlin.com>
 <ae-FLk1N3wJs8sTW@ashevche-desk.local>
 <87pl3jebsv.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pl3jebsv.fsf@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 28, 2026 at 10:20:16AM +0200, Miquel Raynal wrote:

I had some text here already written in response, but...

...

> >> >> > Stack usage is high here because of the three "map_word" types,
> >> >> > which can each be up to 256 unsigned longs (32 * 8), see the
> >> >> > definitions of MAX_MAP_LONGS, MAX_MAP_BANKWIDTH, map_word in
> >> >> > include/linux/mtd/map.h.
> >> >> 
> >> >> Ugg - that code is horrid.
> >> >> Returning structures by value isn't really a good idea.
> >> 
> >> Looks like the primary reason for the stack over usage, no? Isn't
> >> playing with inline and refactoring just a tiny fix that prevents
> >> problem by just a couple of bytes?
> >> 
> >> I haven't looked too carefully, but could we (Andy?) have a fix that
> >> reduces the number of map_word (as suggested, IIUC) and/or avoid passing
> >> them by value?
> >
> > I am not an expert for this particular change, I am afraid.
> 
> Surprising flannel from someone sorely insisting to force contributors
> into doing zillions more changes than they initially wanted, easily
> triggering iniquitously NACKs otherwise.

...after meeting you during Linux Plumbers and actually having a couple of
ideas how to solve that, I promised to answer to that thread sharing new
information.

> > Consider my patch
> > as a bug report that needs to be addressed, Currently it might break some
> > builds when `make W=1` is passed.
> 
> Hopefully you will remember that you have your own limits too. Maybe
> that will allow others to breeze next time there will be something that
> matters so much to you that you prefer to fully block their work.

As for the changes that reside in the lib/, which is tree wide and
has zillions of different users with different requirements, finding
a common ground is really hard.

> >> I can also take this cleanup if enclosed in a bigger
> >> series, I don't mind because it may make the code easier to read as
> >> well, but I feel like this is not a proper fix. If it is, please explain
> >> to me again :-)

-- 
With Best Regards,
Andy Shevchenko


