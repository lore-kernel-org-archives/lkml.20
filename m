Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481659;
	b=DtP2xEqmoA441NXVgcO52sYuJjt/MjwCghhc1SRBuiG5r6Fqd2utwjknlThrJ++zqUK1
	 DbzRX2H4sDTH+C5AZyPcSZfUs0n6MBKoMw4vCO9flUQzlZjjFDOyb5KKgz+sncAPzzBNM
	 9XPwM7rIicQIUfIQB/uYScXED21m552UbgSnJLp0IAAsAarWjpMQXnMBmkBrmYIB88pjK
	 PY5ZP/tj73tfg8XKCaVHsa+R6PcHc1yLeFtzdY02rrB1gfzF6kNGsb+mMIYDdm/QXItHL
	 nNirIPYp6VtS84ZF+I48cDMXTgEpKAaT9oQkVwkyoH+ErpMFY5U+WzH1IEjTftPBFyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481659;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ws0rJ3BHKcyuqh88iur1fcc/LIJEujkm9TFhfxBE0eo=;
	b=Wuz55TX1T3LcLvkFXlrdqyHwH36hssLoIZAroHXDbteTXRY3V+8/pIHMQB9GSJri1pao
	 YniJ/ROfsVhIdn7YW1aOdLres95mFqwQXLF1mnOqOxqkIFnn5mqEc2+2Go8LQjkpdfnb6
	 JmsTzw32oVIPrxPo+lTiKxiqp3Pwl1s02P40A0yatXAp/f8KyvGw5ryEDwEa7xdM2c7UP
	 Gfdpo44rLbxFqHo56IqHjFOZEbxeMuDClXXE08myePZGlGoqHKSLC7xncrG92hcIu7J2I
	 JDYa8KKlrmdl8bQYvAZE0Owq396wsGV01oIGA03oDqIxFPt2vuQkrrpDQekgGG81EiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSGdUSl5;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8748606A334;
	Thu, 12 Nov 2026 11:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8748606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSGdUSl5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794481658; x=1826017658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TBghNC9ZtMX73TtTYTqP2zQ1cZeCo1aSnVvyXG7XBJw=;
  b=CSGdUSl56hEU/HBuurC/FY2kBGirHZ+B40i4CavB0nyW5vGWzA+7P97W
   muTpKxCQjCbr+yxtwVUhUpjogQKZ5d4/bB6xW7L18FMWF/cwZMyiz6H5n
   VGcgeIDUS1ZfXW++BmibcPW4QteQU8lOev3kOluLlYK9PgmbXqhGnf1if
   6AVQh79shyV9UopJl3o9lcOwPzJVyhX1Jzlg5pur5CnJ4NcbXmwLC3oap
   Z+LdeRnpO4lfsivlS8vyUMTvauUa/EqC2m/ELjd+guClJ0fcm2j1K29tJ
   VsQ/5iEVQjs0CNuyo2UCV9hKzDclLOb4SWAiBJUI3AO8iCvTt5i3v5t3g
   w==;
X-CSE-ConnectionGUID: 1O7vBXjNSLGVmTJh0T1hJQ==
X-CSE-MsgGUID: VoFU0s82RaKxhaajwofJAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3347570"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3347570"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:07:38 -0800
X-CSE-ConnectionGUID: mkIocnx1QE6BDfGL3qBxPw==
X-CSE-MsgGUID: aaOGbI5NRW2yONYMZsKaCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8962731"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:07:35 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3802A121B7C;
	Thu, 12 Nov 2026 13:07:35 +0200 (EET)
Date: Thu, 12 Nov 2026 13:07:35 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] media: Fault-Tolerant V4L2
Message-ID: <avWd9y7c1FVbUB7E@kekkonen.localdomain>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <xhkdby0boob5n.fsf@mkorpers-koolstof.csb>
 <685c60fb-f209-42e8-8d75-7e65ca5353c9@kernel.org>
 <avMM6a6xcDHT-zCR@houat>
 <5bb26065-d876-4ed9-bb80-a9567a369b5c@kernel.org>
 <avMgJ7MFks0sKD7T@houat>
 <eb8ac54c-a357-4378-8d85-d14855a094e8@kernel.org>
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
In-Reply-To: <eb8ac54c-a357-4378-8d85-d14855a094e8@kernel.org>

Hi Hans, others,

On Tue, Nov 10, 2026 at 03:43:59PM +0100, Hans Verkuil wrote:
> On 10/11/2026 15:17, Maxime Ripard wrote:
> > On Tue, Nov 10, 2026 at 02:30:51PM +0100, Hans Verkuil wrote:
> >> On 10/11/2026 13:33, Maxime Ripard wrote:
> >>> Hi Hans,
> >>>
> >>> On Tue, Nov 10, 2026 at 01:08:05PM +0100, Hans Verkuil wrote:
> >>>> On 23/10/2026 14:26, Mattijs Korpershoek wrote:
> >>>>> Hi everyone,
> >>>>>
> >>>>> On Thu, Oct 01, 2026 at 14:55, Mattijs Korpershoek <mkorpershoek@kernel.org> wrote:
> >>>>>
> >>>>>> On media-centric camera pipelines, every entity is known at boot time
> >>>>>> and described statically (for example via device-tree).
> >>>>>>
> >>>>>> The V4L2 framework assumes that every entity of the camera
> >>>>>> pipeline is always present. This is a reasonable assumption for
> >>>>>> integrated cameras in laptops or phones. However, in automotive systems,
> >>>>>> cameras (e.g. rear-view or surround-view) can be damaged or disconnected.
> >>>>>> When the framework assumes all sensors are present, a single missing
> >>>>>> camera can prevent the entire pipeline from operating.
> >>>>>
> >>>>> This series has been discussed at the Camera & ISP "unconference" in
> >>>>> Pragues (during Linux Plumbers)
> >>>>>
> >>>>> The notes can be found here:
> >>>>> https://lore.kernel.org/linux-media/20261021224119.GA383235@killaraus.ideasonboard.com/T/#u
> >>>>
> >>>> What is missing in this discussion is how userspace can indicate that it
> >>>> actually can handle partially instantiated pipelines.
> >>>>
> >>>> Today if one or more parts do not come up, the devices nodes are also not
> >>>> created. This is typically exactly what you want.
> >>>
> >>> That's very arguable? We have plenty of other examples where we allow to
> >>> show a software representation of something that isn't available in
> >>> hardware, starting with virtually any memory buffer allocation, but also
> >>> disabled CPUs, swapped pages, etc.
> >>>
> >>> For things a bit more related to drivers, things like USB root hubs are
> >>> also pretty analogous. The "root" device will always be created, even if
> >>> devices connected to it are non-functional, missing or whatever. It's
> >>> the primary interface that these devices might or might not attach to.
> >>>
> >>> So it's a bit hard to understand why the device nodes not showing up is
> >>> exactly what we always want.
> >>
> >> It's simply how V4L2 works today: video devices do not appear until
> >> all components are instantiated.

I think I've mentioned this before, but I do it once more: there's no
concept of creating device nodes at the same time. It may happen roughly
around the same time, but not atomically. There's always a chance that
accessing device nodes of a device exposing multiple nodes fails for a
reason or another. It may also be udev rules used different permissions for
different set of nodes so the application can only access some of them.

> > 
> > Sure but that's exactly what we're trying to change.
> > 
> >> Most video devices consist of multiple devices (bridges, i2c devices,
> >> etc.) and unless all are found and initialized, you can't capture. So
> >> bridge drivers postpone creating the video/media devices until
> >> everything is there.

That's not the case obviously. If you have, say, three different cameras
and one of them happens to be missing a driver in Kconfig, there's nothing
that would technically prevent streaming video from the two others: it's a
policy.

And supposedly, there could be an application that *needs* all these three
cameras to function, but does it then matter how that application is going
to fail, is it because it lacks access to all of the hardware or just one
piece of it?

I'm in favour for making this reasonably easy for the user space to figure
out, but we currently have no APIs that cover this (and so could be used by
existing applications) so it's new behaviour that we're introducing. If we
can't do better, then I'd introduce a Kconfig option, but I'd select that
by default. I've seen tonnes of issues because of the current behaviour but
no evidence creating device nodes proactively could be actually harmful.

So what I'd concentrate on is to provide information to the userspace on
the device readiness status, so the userspace can figure out all devices in
a Media device complex have been registered.

Functional safety adds the requirement of detecting failures and how that
is being done is probably fairly implementation specific. New APIs will
very probably be needed for that as well (and they indeed should be behind
a specific Kconfig option).

> >>
> >> That also means that applications can safely assume that if a video device appears,
> >> it is functioning.
> > 
> > Ish. The only safe assumption you can make about this is that it was
> > functional at probe time. Anything after that is very much up in the
> > air. If the device broken after probe for example, or if we have no way
> > to tell if it's functional to begin with, that assumption is no longer
> > true. So sure, that's what applications have been doing so far because
> > there was no better way to do it, but I wouldn't qualify it as a "safe"
> > assumption.
> > 
> >> If we add fault tolerance, and you allow video devices to appear even if they are
> >> not functioning (or partially functioning), then that contract breaks.
> >>
> >>>
> >>>> But here you allow partial instantiation, and how does userspace
> >>>> signal that? It must be an 'opt-in' mechanism, but how is that done?
> >>>> There are no devices yet, so that can't be used, so what alternatives
> >>>> are there?
> >>>>
> >>>> We've been discussion Fault Tolerant V4L2 for many years now, and every time
> >>>> I raise this issue, but I never received any proposals.
> >>>>
> >>>> This must be solved.
> >>>
> >>> Is there any way to? You're saying at the same time that we must not
> >>> create the device, but that an application would need to signal to that
> >>> device that it can indeed be created. It's a circular dependency that
> >>> cannot be solved on a per-device basis.
> >>>
> >>> During the meeting, we had a discussion that the media device should be
> >>> created as a "skeleton", and then as other devices probe they would fill
> >>> in the blanks. How would that not work? Also what is your main concern
> >>> exactly that makes you ask to not do that in the first place (or make it
> >>> opt-in)?
> >>
> >> Applications today assume that everything works when the device nodes appear.
> >>
> >> If you change the behavior, then they just see a skeleton driver and how
> >> would they know that they need to wait until all components are found and
> >> it is ready for use? Or what to do if some parts are faulty?
> > 
> > I really think that this discussion is not solely about probe. It's
> > something we discussed during the meeting, but I think we should try to
> > handle "my device was broken at probe" and "my device became broken
> > while the system was up" exactly the same way.
> 
> If the HW breaks after probe, then you get EIO etc. errors. It's very rare and
> the only requirement in that case is that you return an error and don't crash
> the kernel. It's accepted that if the HW breaks, the application breaks as well.
> And you have to replace your hardware.
> 
> It's been working like that for >23 years (that's when I started working with
> V4L). This also means that for >23 years applications have exactly this expectation
> of how video devices behave. It's really part of the uAPI even though I don't
> think it is ever explicitly stated.

Do you mean things like VBI with this? MC was introduced around 15 years
ago.

> 
> To be clear: I really want to see Fault Tolerant V4L2 happening. It's clearly
> very useful for a specific type of use-case.
> 
> But first we need a solution for this specific uAPI issue. Note that this is
> now to opt-in to Fault Tolerance, but in the future we might have other opt-ins
> as well that modify the behavior.

I'd try to separate the early registration of devices from fault tolerance.
The former probably is still a hard requirement for latter.

-- 
Kind regards,

Sakari Ailus
