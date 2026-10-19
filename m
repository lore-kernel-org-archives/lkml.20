Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C84495539
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403282; cv=none; b=iiU/ejdS56MMzxwKfEmpxIeFHgm2scfCHFmd0MfQGGryOCH3PAozQgFd5KGkqvz2pqS76dJf08A9YjyL0hvMhcvUwh+YBsKv1BaYmB3i135Id8P4XtWhlEkcmjX4qdEhU67rd7Bs+bz/ogfo0s7xWuNGh7CGDLrIuKnvWMLnMq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403282; c=relaxed/simple;
	bh=/G1UAEnFK4MlLGs+aNQVo/T6zfPVnBWeth+ol/F/i08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOx4bzODNOLNgTffGAiMgQqLhjTRQoH2mt2mcTkmj/AuwRP27oq6DRGCUzntCHjFvET+WV3X/KWXiylZKUqSO/3HCHyjjmCk/YBMKwIxOpXCXpisuqtT+guGpg52hFUgQeycKJNhoVFUm8BKvdRjqX91PCxJx0a7hRZLh1sfaFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZdUSOzR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZdUSOzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792403281; x=1823939281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/G1UAEnFK4MlLGs+aNQVo/T6zfPVnBWeth+ol/F/i08=;
  b=QZdUSOzR9Q8PLsc0Zlwg5r+T2wkQsVPbn0A9STQ82AcriqVRBMZyTFGq
   FvFLAIs96QId19fqE/fgBw5IU9G3DzRgDIHW7JsbHPl96Tt+rjXjQEN/+
   2UOicCLgbdV2+9ydG3NdUc79fMClcUCadr6sKVEIAvM+YbbdHgrpIfceH
   XnvMMvtyCm2YYAOZjM6ACixtqtvSIDkJR47fjivVMF7goMQTa2t2zi8HD
   r+AynuyKkidU5SP1BZ3J8xBQYFcT4a1bVePgABqCU7ozJ8qcSz7EDMOoe
   FFZUQm86Xh+xEsTjd/JS3563CwyBn9+F1a9c5qXLo5MnCElJ/ejpHP+tV
   w==;
X-CSE-ConnectionGUID: VvHswMF2Th2mKcxW4Jj63g==
X-CSE-MsgGUID: DkehX3zLRGyvk3uQ3xxalw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="951476"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="951476"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:48:00 -0700
X-CSE-ConnectionGUID: DcAcaTrVTIad6ooC1ISnuQ==
X-CSE-MsgGUID: l0WOJ4UzSTKfFTfq/WwKVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2558322"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:47:57 -0700
Date: Mon, 19 Oct 2026 12:47:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <atXnS1ZKGVfHDNEK@ashevche-desk.local>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com>
 <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atXmovzepBLP8Mqo@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 19, 2026 at 12:45:11PM +0300, Andy Shevchenko wrote:
> On Sun, Oct 18, 2026 at 01:28:44PM -0700, Sam Agazaryan wrote:
> > > Yes and more as this bus (i3c) is still non-discoverable (am I mistaken?).
> > 
> > I3C is a dynamically discoverable bus. During DAA each I3C target reports a
> > Provisioned ID (PID), Bus Characteristic Register (BCR), and Device
> > Characteristic Register (DCR), and is assigned a dynamic address by the
> > controller.
> 
> Did I miss this in the initial explanation? If not, please add it next time.
> 
> > > This makes even less usefulness in my eyes. Immediate Q: if 4 already have the
> > > proper driver in the kernel, what's wrong to make it for the fifth one?
> > 
> > 1. The original use case was hardware bring-up, silicon validation, and debug
> > (i3ctransfer): Just like spidev, engineers need a debug interface
> > to issue ad-hoc SDR/HDR transfers during bring-up or hardware validation before
> > a driver exists.
> 
> Totally debug feature to me. Once you expose something in /dev (imply IOCTL),
> it will become an ABI. And I'm fully against this.
> 
> > 2. Userspace firmware recovery / update tools (OCP Secure Firmware
> > Recovery, Caliptra RoT):
> > The recovery protocol is purely a polled request/response transport
> > (no IBIs allowed per spec) used by userspace update tooling (fwupd / BMC
> > recovery daemons) to parse signed firmware manifests, stream recovery image
> > chunks to INDIRECT_FIFO_DATA, and poll RECOVERY_STATUS—similar to how
> > userspace firmware updaters operate over spidev, hidraw, or USB/NVMe ioctls
> > rather than putting firmware image parsing and update policy inside the
> > kernel. In my response to Wolfram above I discussed this some more.
> 
> Do we have such use cases IRL? Do we have tooling support (at least pending)
> somewhere? Why does it require user space interaction in _this_ way (meaning
> IOCTL and /dev node)?
> 
> > > What if the device needs more? Or if this is a multi-functional device that
> > > may have driver for only one part?
> > 
> > If a device needs more than basic transfers (such as IBIs,
> > hot-join handling, or integration with a subsystem like hwmon/iio/mctp),
> > it should use a dedicated kernel driver.
> > 
> > For multi-function devices, if the functions are exposed as MIPI I3C
> > Targets (e.g. a device exposing both an mctp-i3c interface and
> > an OCP recovery interface), each virtual target is assigned its own
> > dynamic address and DCR during ENTDAA and is enumerated as a distinct
> > i3c_device instance on the bus. Conversely, if multiple functions share
> > a single I3C target address and register map, i3cdev intentionally does
> > not allow userspace to access a target while a kernel driver is bound
> > to it (avoiding the I2C_SLAVE_FORCE problem where userspace can race
> > with a bound driver), so that case should be handled by an in-kernel
> > MFD driver - but that is not the use case being targeted here with OCP
> > recovery.
> 
> So, imagine that someone submits a kernel driver for a simple device, while
> another person already uses the driver for multi-functional device where the
> former one is driving only part of it. Strictly speaking the kernel driver
> submission becomes a user space regression. Which effectively means that whenever
> you open i3cdev, no other kernel drivers may appear. Yes, I understand that
> a poor victim of such an unlikely course of events may recompile the kernel,
> disable driver, et cetera, but this still raises the same question, why do
> we do that to the mere users?
> 
> > > What to do with the i2c devices connected to i3c bus in the compatible mode?
> > 
> > I3C master controllers register an i2c adapter for i2c devices running on an
> > i3c mixed mode bus - they are identified as i2c_bus_type, not i3c.

Forgot to ask, but do they interfere?

> P.S> Still not convinced, that this has to be an ABI. For debugfs and something
> like this, no objections, but ABI.

-- 
With Best Regards,
Andy Shevchenko


