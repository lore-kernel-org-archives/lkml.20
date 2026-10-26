Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039099;
	b=pw+YG4xDq1BgTdDQQ0UV9EtTIN7sph6iuXxQwLob8hB1hLX263d7g2yAcG1Cd1Yx6w1y
	 AO0UCXvADKTyHA2OY0tqhSk6+zpaBrk2tEGNNcLxsqEc5m1TgoKzV5+A06vse1HgQoZ1X
	 4V/WJ8Vdb0214E7fN74mwNGZbDWSqe0YqopNSrCE0vYsU4E3S7+7jTWT3sbbFVHGuuDt5
	 TjXXisjaKDRk8422wHEa75cmDIoYGRW2uC1tBR25mcnU2omzpJ+C1ajp6hsBYeX7B8PEj
	 dFL7V0/BG2cNDKW1QEQp3jaBcCTbFAh9H8w4K0VhUSE6fHH1bT/svj9nU8s5UwPuh/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039099;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=qUbRJlmWkhvylPx/TbM1Fpya1iPRWp6zlWLgDON4ctQ=;
	b=TyDMDerj8pM2IGQ9MOP4+26QCXxKRcEO6m8fIfQAZTLJTN1kAdvo0OVLPVuNlnL0bBYC
	 wlv260QOr/BwMeVcZqKo1QfElX6J494cFvrmTLxKOafkup6jBuxkZLkDdOnScIiwrX8Dg
	 Y24JNLkAHzwNofFwwYb6M+d4oy4CcLTsy9noLZJzq9Wu0zeOWHYjXWiMQb70gj2Uc9R8/
	 CHCw472hwGX4BylM5fZA4s4SoIwu4iBy9tpncRS4lhO6Hqf7Vuj9fNBG3s5ArbTyfuqNt
	 KS8sMLbcqGJ+VYqEZM6WoWwLVGcXeP4n0e+rn1JuhcVlBbACBVYLUbCpF1/x+hs1PFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K1rBSHrV;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382DA606A31A;
	Mon, 26 Oct 2026 18:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 382DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K1rBSHrV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793039100; x=1824575100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h62PHQmcgLrNQlAg50HsPeJkr/7hkbSJEPsnbKoo/HU=;
  b=K1rBSHrV9hhytINAd0APd50+Z8mws15HeKHQXZvmyURxYF6Ti/XDq1Yi
   DM3U4aqBD/wus3XE/eIiW+yAwXsXI+Yi9Yh81M6pOXt9eQh1yNTlPIok/
   5MkkOv9vndWn7TDlblJVY3+Cet/9/dYG/YvibNp+a0pegEfcBKTMHxfSd
   tNfDHcGgJquUdgItp6yk+AlQXgXKsGUcF+ZV/lzw5DiD81InTcXXOzlm8
   HsvllubzhegxK9W3YuYqU42LcfqSM5f9wY7Q90ZIpemdZCsxvvzyglBCf
   XdFZWQat+CCuYuG++YagOIF989hfZeR33WC5B/DmQsG54HMe68OHFDuWx
   A==;
X-CSE-ConnectionGUID: A3OOk6kMS9KClkdPAc59Ug==
X-CSE-MsgGUID: KMUUnB8nQzqVNwGAt1/TeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1614259"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1614259"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:24:59 -0700
X-CSE-ConnectionGUID: sfZ4uOEfQuGXzVmgdPqe3g==
X-CSE-MsgGUID: ZpnzTZT1TvyRLWLXbM4J9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6087515"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:24:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B8141121CBF;
	Mon, 26 Oct 2026 20:24:59 +0200 (EET)
Date: Mon, 26 Oct 2026 20:24:59 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT PULL for v7.4] media updates
Message-ID: <at-a-2wTtf7bJQwU@kekkonen.localdomain>
References: <20261024185058.20410953@foz.lan>
 <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>

Hi Linus, Mauro,

On Mon, Oct 26, 2026 at 07:34:12AM -1000, Linus Torvalds wrote:
> On Sat, 24 Oct 2026 at 06:51, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > Sakari Ailus (60):
> >       media: Don't hide I²C or SPI drivers by default
> 
> This needs to be fixed some way.
> 
> The kernel config is asking about ridiculous things that no sane user
> can know the answer to. And that change has made it worse.
> 
> Asking a user for random media drivers by chip ID is *NOT* ok. It
> needs to be hidden some way. If the old way didn't work, some new way
> needs to happen.
> 
> Guys, the kernel config phase is already *the* most annoying thing for
> people trying to build their own kernel. Don't make it worse by asking
> questions that make no sense to a normal user.

The patch in question puts camera sensors and related chips in line with
how the rest of the drivers are selected elsewhere.

The reason why I wrote the patch was that Arch Linux kernel missed enabling
these drivers, which given how the MEDIA_HIDE_ANCILLARY_SUBDRV option
worked before the patch was to be expected at some point (rather it's a
small miracle no-one had complained about this earlier). Raw camera sensors
are quite common in laptops these days and the only way to enable compiling
them before my patch was to enable CONFIG_EXPERT first.

I guess we could have an option to compile pretty much all media drivers as
modules (it may be hard to draw a line) and then require CONFIG_EXPERT to
allow choosing amongst them. I'm not sure I like that idea much though.

I wonder what others think.

Also cc Hans and Laurent.

-- 
Kind regards,

Sakari Ailus
