Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583818;
	b=LQpP93/lk0P/ydsnkIQcPvwVBbnG8voNvxatTZcyMbx8Hi0M9uxNA4hcrQ5fCCqIaw9I
	 FBWHSG5fMIk4b69/21RRTaBqSloJVO2ST+7YFzxGTm1Q3oQeO/McHo4DMYb6MkSmXX5eC
	 gn3LVSScN2+j+sSPUGpRz2gXGQ40NfChEAzUNfcXirc3HHebKB28YdvbXGoInDM51SBmO
	 aRUr+tCVZErhB5RkiUp74fIrLivamj+e64Q2jzWP86HxyEXs+Hs2tAPSmdux0Iq5/pUD/
	 afJxzkSWivY0RhDwYelemST3GdOpY2kdqgmCpu0TBdDsTXc8k5WIJnqUieb8PCxl1vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583818;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=y3Cc8X3faZNr+lrlR0PCJw4R41q5ZFzAd48ZePxA2zI=;
	b=MN151s2JQqG5ixdUXaYprZbQGi9fNq+xFhc0qsPY7ueLBuJdVehLg+UZacnBUSKpgKWY
	 L9awRGhlCadhfloJEBZm5GKuLn8VyWaYudFEM/qUpj6+Zs6BGX3W231bLE8WCuWHAZpw2
	 3vzU68hbhwvofBiBgZ1oaUZJCbPjqTzKhUFJ3xBJBbgbXIkmZN68/qG7wp8plY8zTNPVb
	 3T4hZQB2HJZlJBZift3J/y7uWymCI2nK/6ZnFn1NVnKBII3Ffkhr+w+kve64FH3bYfyua
	 ZXHKR7zYtKcdrNr77Ljw0R1hYOxiGo0Yb2yEu4pcLdtfnb4yhXOvhqM8/e/2xZgd7RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Jg5Xm/01";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71170606A339;
	Wed, 21 Oct 2026 11:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71170606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jg5Xm/01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792583818; x=1824119818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ByEZCJarc35j8etN817/zawqOpUCF7BCj7+jhbOovh4=;
  b=Jg5Xm/01qsRhU3+tuuPoEfxbVJP7qvUh/utjebEsPjKdXll24YmhkOCn
   lpA5zWtbIQgxaYTifOWfO99KY7+eFRsh4uz0zE2qAxUDIvpjxOcW8kYxo
   bPLYL14DvGs7klscCxR2/rhBZleboTYJ9pH8CagD3Zishx0Wz15z5dtHy
   3XzCk6GobQGHJpWcs8TrnWPAyBj5BXHPv4P8mMAOGsLhKiRog2EQiwLcp
   gfXyunrzTwntuBf3JhkCfgvt6glcfGEBRHVr9UtHJ5E9ODe6hmV6e7Cdd
   zt3mrms/Zf2GHRKRw8pyAQ9WJgWl33lwtKKImq+Z4ufUTcKD4s44Xu4em
   A==;
X-CSE-ConnectionGUID: /DEbY/DWSdGQJh06CjtLng==
X-CSE-MsgGUID: aBAIa6wWRyW6VEJ582RB5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1308322"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1308322"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:56:57 -0700
X-CSE-ConnectionGUID: 1gT5+YYCS9aXRy9tOfDgUg==
X-CSE-MsgGUID: 472FMWH4Tamdlnmo78nZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4868026"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.43])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:56:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B2E5C121BC4;
	Wed, 21 Oct 2026 14:56:50 +0300 (EEST)
Date: Wed, 21 Oct 2026 14:56:50 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org,
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kieran.bingham@ideasonboard.com,
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com,
	Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com,
	Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: Add Sony IMX908 image sensor driver
Message-ID: <atiogo14sCFw4xlT@kekkonen.localdomain>
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com>
 <atdGr8S2sf1kZFUw@kekkonen.localdomain>
 <20261020125630.GA158670@killaraus.ideasonboard.com>
 <CAPY8ntBUncMWB2DqFG+iS9gFgW2aaeyMrD6x-c_4Da7rJDv6Mg@mail.gmail.com>
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
In-Reply-To: <CAPY8ntBUncMWB2DqFG+iS9gFgW2aaeyMrD6x-c_4Da7rJDv6Mg@mail.gmail.com>

Hi Dave, Laurent,

On Tue, Oct 20, 2026 at 03:50:09PM +0100, Dave Stevenson wrote:
> Hi Sakari and Laurent
> 
> On Tue, 20 Oct 2026 at 13:56, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hello Sakari,
> >
> > On Tue, Oct 20, 2026 at 01:47:11PM +0300, Sakari Ailus wrote:
> > > On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
> > > > The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> > > > output interface. The driver supports RAW10 and RAW12 output formats,
> > > > exposure and analogue gain controls, image flipping, blanking controls
> > > > and test pattern generation.
> > >
> > > The imx908 appears to be a Starvis 3 sensor. How close is it to the Starvis
> > > 2, for which Dave (Cc'd) is working on a driver (see
> > > <URL:https://lore.kernel.org/linux-media/atdAsDGw_jvhaydM@kekkonen.localdomain/T/#m0c50ea017ef9ae0d3d76a36b840db9b6f7ac296c>)?
> > > The register defines in the two drivers appear to be quite well aligned.
> 
> Asked and answered at v1
> https://lore.kernel.org/linux-media/TY6PR01MB17839FF48671E744E7E23A93E92D42@TY6PR01MB17839.jpnprd01.prod.outlook.com/
> 
> > The current version of the driver implements very few features of the
> > IMX908 sensor, as crop support has been removed pending the raw camera
> > sensor model, and Clear HDR3 is being developed. I expect more
> > differences to appear when those features will be merged, so I believe
> > it makes sense to have a separate driver here.
> >
> > In the future, I expect the raw camera sensor model to open the door to
> > more code sharing and more drivers supporting a wider variety of
> > devices. We can decide then if the imx908 should stay a standalone
> > driver, support other sensors as well, possibly across the Starvis 2 and
> > 3 families. I'm willing to help with the refactoring at that point if
> > needed, the maintenance burden won't be on you (and I'm sure that
> > Lachlan and his team will of course maintain the code base).
> 
> Agreed.
> I have compared the datasheet for imx908 against the Starvis2 ones,
> and when we start looking at HDR modes they diverge a reasonable
> amount.
> 
> Even the later Starvis2 sensors (IMX585 and IMX676) have minor changes
> to the earlier ones, so adding Starvis3 would need some care.

There's quite a bit of this in the CCS driver, due to the variance it
allows for implementors. I don't see this being a problem as long as the
foundations are reasonably similar, albeit we can see whether this could be
further extended later on to other sensors.

I'm fine with having a separate imx908 driver for now. Dave's driver also
exposes the variant information through the media entity name so that
should be done by the imx908, too (at least if there can be multiple ones).

I'll review the driver properly soonish but I reckon it's in a pretty good
shape already.

-- 
Regards,

Sakari Ailus
