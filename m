Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012159;
	b=V5nYYFsI8Ermagckyj7rpg5rntsHiWIR2bWVhezxJh5GFQaDS9+68xc6dh+75urAjBDr
	 UXyl4D3YAuHQR+MkIOAEL+Sm9T5IxUGihBbxWY9e2X07eVMpfgBuK+S9AtzJcz4EIoPse
	 koy2y92L2ou6/aq/jWEo0JXenbX1tZ4G1/AoozWN8ASYljM9Kknalc9Y3rf/LF4hN5YUQ
	 ce7/Um3XeMTwlJgQHyga4Tgt4ffBGuydlCE2YIdgPOxQuc2iBCl2miFWbAoakgAiVCEJ7
	 2lvlqmgqUrAejWsCf5VST+rgsG0JhxAX+w0gCgtnsxS0gKdAE3MVSaYgvygqMtKZJpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012159;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=kMz8lGrGwQqc5qjjDJayh5A0H/kNjZ7+ggYD1TiunRE=;
	b=2/xoKcRyiD4HvSzDetomUSzEHGJuT9H+oa07dQQQIGYuw9ORrB+KZjOsElEAFIK5k1IY
	 acpKKhdshPJj2WVWZWq/ORFMDKk+wkPFx73kag8bDF+g9CW37pUyzoAZcBTvoknGa+gjk
	 nCqWYoMXkkYOOHr1UP1ZfrNJkT2J17XfMmbHX5qvV0gIkTi5e2JThFHfw0iHqr04KLmcZ
	 03tQDvHOZ3jOJjku77JvnTQ8RbI52FFpf5WCpQYsSqI67B8NxUJpQ5gQxFfT13f0wmx2k
	 sd1jPLkxIwXEksuEkYKWy8v95mVs18ea1MAqjhugf9r5CUYC1LxCaV24xO7SwUMu2rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RwO00gDM;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C4B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C4B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RwO00gDM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793012158; x=1824548158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t+9BSrdqZH7slWhiluRxNvKz7htW0n1OoUMr/Yn1H1E=;
  b=RwO00gDMeBj0d8WOYGq23rJbxMsIqH1AH8SqHgiywzrqO/VMFh0ZKMXV
   1Gl30OSeDznKRu5zI85JU5J1x7qdQAwLba2S6ApgGSqQQ7EFR52l/jvQl
   26gSyIwGVNMkPpWkQmHnj2Om9y6HGUfTBAjpR1VaBE+G4l60AcVWtoWs1
   HGUnnS2Ljz0CUKUllfHALMwCYenpZgBXMCmg1hs2inHOEYn+FXLZOlir2
   vP/QnG5x5dC8qM4MlexAx1QEs2ndGoUrdIJ2N1PWQAVyUGPc30BRNqwb8
   2uxIRCySPeW5R6k4/3eetDgOdKi9BZrI8OZbVTH0cW9H8rSSStXDqLSyt
   Q==;
X-CSE-ConnectionGUID: hCVEnql5T0mxdMvvUiuPWA==
X-CSE-MsgGUID: DwVapD+NRxiAe54oQITPvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1687706"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1687706"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:55:58 -0700
X-CSE-ConnectionGUID: ZCYcyZaDRW2z9u4poHyPcQ==
X-CSE-MsgGUID: eSlMO/hiQvK7IdrlRx5Ing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6059573"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 03:55:55 -0700
Date: Mon, 26 Oct 2026 12:55:52 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <at8xuIWvvqLoicTg@ashevche-desk.local>
References: <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local>
 <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local>
 <ati4B33tnKsCD4c_@ashevche-desk.local>
 <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com>
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
In-Reply-To: <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 22, 2026 at 01:23:10PM -0700, Sam Agazaryan wrote:
> > > 1. Tooling & production users:
> > >
> > > - i3ctransfer (Patch 5/5 of this series, and carried out-of-tree in
> > > AspeedTech-BMC/i3c-tools and vendor OpenBMC BSPs for several
> > > years).
> >
> > So, nothing in production, meaning we can design that in kernel differently.
> 
> In hindsight I should have ordered that list differently, the second bullet
> right below that is the production use case: production BMC firmware update
> and recovery daemons running in OpenBMC server fleets (managing Caliptra
> Root-of-Trust and SoC recovery targets over I3C), as well as production
> server accelerator management daemons.

Okay, but they are not (obviously) use the upstream solutions for that.

> > But why recovery mechanism can't be kernel-driven? With some sysfs
> > (just as an example) knobs to say "I want to run now a recovery flow
> > on this bus", et cetera.
> 
> To make sure we're talking about the same thing: "OCP Secure Firmware
> Recovery" is not electrical bus recovery (like recovering an i2c or
> i3c bus itself by bit-banging to unstick a hung bus). It is device
> firmware recovery and provisioning (similar in concept to USB DFU) to
> recover and boot a target device that sits on the bus.

A-ha, so this is a device programming protocol on the top of the i3c bus.

> This lives in userspace because it is part of the BMC's Redfish/RoT
> firmware management stack (handling network image streaming, signing/key
> management, and chassis-level recovery policies), rather than a single
> "recover this bus" hardware toggle. And it uses I3C_IOC_XFER because
> each protocol register read/write requires combined Write + Repeated
> START + Read transfers (or HDR transfers) to that specific target node.

But it's still unclear to me why this can't be moved to the kernel space?
There is no user space that communicates with upstream kernel in the way
you described, they should have used a custom (out-of-tree) solutions, right?

> > Oh, that's quite a dangerous "feature"! Can we avoid doing that? Otherwise it
> > means any missed guard against unbind for the system controller related chips
> > may lead to real HW damage. I'm totally against this feature to be in any way
> > of an ABI. If you want that, do it exclusively via debugfs with a big fat
> > warning that this may lead to HW damages.
> 
> Agreed -- as Alexandre also suggested in his reply, it sounds like
> automatic binding isn't favored here due to risk of hardware damage.
> 
> > Can i2c device require an i2c recovery flow on the bus? If so, how would
> > it be combined together with the i3c recovery flow(s)?
> 
> If you mean electrical bus recovery, i3cdev doesn't perform
> bus-level electrical recovery. It only submits normal target-addressed
> transfers via i3c_device_do_xfers().

But how it will do if the i2c device blocks the i3c bus in mixed mode?
I mean, how will it affect the i3c transfers on the wire?

> If you mean OCP device firmware recovery on a mixed bus:
> 
> An I2C recovery target on a mixed bus uses standard SMBus Block
> Read/Write transactions through the controller's i2c_adapter (not
> i3cdev) while an I3C recovery target uses I3C Private Write/Read
> transfers via i3cdev. On a mixed bus, the Linux I3C core already
> configures the bus mode/SCL rate according to the I2C targets' LVR
> spike-filter capabilities and serializes both paths via
> i3c_bus_normaluse_lock(&master->bus).

Good to know, thanks!

-- 
With Best Regards,
Andy Shevchenko


