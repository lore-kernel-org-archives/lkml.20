Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099025;
	b=OmkaoXfgsR4114Xzhzz92Qb3GXKWqSdcYTO2niajJ3siFdAtJr+iFUMyia0xUFhK6RN/
	 xP0QbbqTbP8zQJqMzGULGs1U4VfAXQP98F3spETP3GUxixIkhC3Xrw/lXoPbDQaVEXGAl
	 t3Hg0O5A6tmEHyQKkwqP4/GHv1/SE2pv0H3nCiLHYFN0GVfvaMAVsUw8bWvOOB+FovZUU
	 Uk+VNzwtgwwcuV1WOWq2Pl3+/8W1CkSEaO609jeI4Rn6pqPWShPuegFy8XAa5UZJp0cin
	 0tlMCIMIXjuDwW+8BdZDm4EpLO4nshyxARYJCIZTK6SQ9T2ZC4vdOPq8V7xtmaqZcBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099025;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7S6cXbjBDEKp/Ahh32nzeWUw71ZhIcQbMCsW7BdSBhE=;
	b=Js6cWJvvKCdw+e9ncZFxvKsYsG2Szl5IdBGD0yQOoFOhzss+Lp8x0yruO++2cHu1yiEx
	 ug00IEKs5vGInfW2VtAyOLke8+lUrApwT/yWeVzWruRl6PTKAsAJqMmIU/FIQt2lFQBkE
	 zys+tlzuOfmJvLxOxauseQ2yX4uIbhvS1f9GJvAUbjlaenwgIVLN6BBoDveJaFjgrTPjb
	 kO6YkkKqC21BaAKZ4bh5LVEPVItE6q4BvRNIWA51iAdWJmIk9jArtOInh1IzBT9bVkNoN
	 oloaNINt4buYKS4VtPiAIbkSqUTn8iNvwq4YHOgkq4bgff5746LwATKpvvX9iESVPhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Y0e98/sY";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A57B606A320;
	Tue, 27 Oct 2026 11:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A57B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y0e98/sY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793099025; x=1824635025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pHHp8p2GHvOE2J4YEoEifdCxY3BU56aeUtaakbjlkYU=;
  b=Y0e98/sYkTYpM4iEPAGlWXfv3ScC8X1cHLkQmoV9aRJh0TmR1f67EphK
   LSCP51SWMeRd9+DHzlKdPfRSSt1wQ/2ZY2Oi5qPuhwCYLr0tHNP9b9MEG
   +4A9fvq071zZzxo1aSNQUbW+NLdl9jaTi3O+4X98gWI9z4hn1SexwEFhR
   csuCG75arWRlGUlVfRCXhiO5j6WrIrGWq8gX5gL34F/v5ZplcIt+cJp9y
   gry42v1v/AeEVG+kimOb+K3KbVY7kRkcbYw7Eaq/otnCu4xjnTbueDMuw
   0rXM4CHCmTxSWetDYs5YPYEv0qFfYc3KC4coJq0u7YnJ89hBcbHvXiv5q
   A==;
X-CSE-ConnectionGUID: cI7v+cYCQ6e8smX8gp8kfw==
X-CSE-MsgGUID: /VrZ+6a1Rh+P1cPrTUouRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1812610"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1812610"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:03:44 -0700
X-CSE-ConnectionGUID: B/NeDwoeQrGXW8StRJCSGQ==
X-CSE-MsgGUID: 0gTJzY6nTGivPLxl+rn7qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4627121"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.2])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:03:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3A25F121CEC;
	Tue, 27 Oct 2026 13:03:45 +0200 (EET)
Date: Tue, 27 Oct 2026 13:03:45 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/1] Revert =?iso-8859-1?B?Im1l?=
 =?iso-8859-1?Q?dia=3A_Don't_hide_I=B2C?= or SPI drivers by default"
Message-ID: <auCFEee3ogsbaw2f@kekkonen.localdomain>
References: <CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
 <20261027100916.4053512-1-sakari.ailus@linux.intel.com>
 <20261027101946.GA2106796@killaraus.ideasonboard.com>
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
In-Reply-To: <20261027101946.GA2106796@killaraus.ideasonboard.com>

On Tue, Oct 27, 2026 at 12:19:46PM +0200, Laurent Pinchart wrote:
> On Tue, Oct 27, 2026 at 12:09:16PM +0200, Sakari Ailus wrote:
> > This reverts commit 3bf8c26a085c7b00dbec67a919b93fa8b7ad70e0.
> > 
> > In order to avoid exposing fairly rarely needed drivers to ordinary users,
> > revert this patch. People needing these drivers will need to enable
> > CONFIG_EXPERT until we have a better solution for this.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> This is a low-energy short term workaround that will give us time to
> find a better solution.
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, Laurent!

> > base-commit: f39567cc92272f987c056d8c92f7c93f3fdf53ef
> > prerequisite-patch-id: a907c42a90ccc410e6fffdee8c9300233a5cd4be
> > prerequisite-patch-id: 82ecd20999da94a7472cd1061a0fdf8cffbac325
> > prerequisite-patch-id: 7d09c7afa4c3d4109642db3fd8435b21605854c6
> > prerequisite-patch-id: f9e361e419752c2c3b2d845b535e33407c7544f6
> > prerequisite-patch-id: 48a068cfdcbf7d53806dd8ff9e48f5de529fc67c
> > prerequisite-patch-id: ba262f258d655a87b99432ebce1e579594a16950
> > prerequisite-patch-id: 64c1f90be9a61ce4b6ee3988606ab0a24e630d42
> > prerequisite-patch-id: 69ddc210ad98238341ef358dfddb0a42f20b9ea0

This bit can be ignored, I missed there were already other patches in the
branch.

-- 
Sakari Ailus
