Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587642;
	b=Ei23c7CCtar52ajXeiZ0EtsqBcS1NBCwo9jqh/R24Ka/6znf3MuTVS2ZlNQUcl7jiYJO
	 yiCs//NkaXlirK93ABhQHNh1xLnASCRuU4vn4cwtm3p9X0FD/H4JwPOIIEqtyxnSCVQOg
	 DnbH+FWJmlm6t1dsiVN5F8wcpwGzpOx2Bbhky6r6M6ocFH9+oynLx5sQxdOrBSUFrJnFE
	 z2xD4Q8ViIrAuUINQfxV8nDkj8I2Rj6YdAwG6ZNM7Y2eFkOkOHoREme5oybYalU/3MvB0
	 qcCR+h6jgZEhl66PZgcIKd6RuguXKHIlcyHnI1oze+64ZJ/xTVg6+vj6hbIVi11dIjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587642;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=sZK5FmtMRARt/lzAz2jQ15vSUaGamCy2dbU//Pdja9I=;
	b=dq46nPqcVRCKOy0k2KFXDVWwBg5KfjdGiKuyhoIdVcdl2m1qwNVdGaq/o9QqID+zxUx+
	 jwnzhA1BdZb2jIOrUoj6G4QvfP807zlt7Cq5XCWFIbcU4g5Ki0gXVD7q0tgrVBPSz5bjO
	 7G+sJPCrwFECCa/ty3x8hyF47ydd3LdqjgORfOuWkE8sL6S70bw4MbJToNqrR8LqaH+1H
	 rqNiTr+5pkyx9NNIFIjkY1y2HqHZRnZLtUPOKz0XeqXhiHuKZdgfKexo4UBzbLAGPdKFW
	 psLoHeAQmIRPi+yeF+TFyYiyvHrOvIfdOiyeGjsrMeQKxXigcXgJCkMfbmCrnWD4tAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="MiDvAB/M";
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C6606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B9C6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MiDvAB/M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792587641; x=1824123641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wndod1zwL//u+Fa4ut5BTg4Fd5ihG9eNKTPtT6UL+fM=;
  b=MiDvAB/MBuzY7GrbgtsEs2FQEJJ+eeK/VDbEJcLuZwDm7cHoRSVabD+L
   uUJzVbV0SzMbjumGoFfKKV+raiW3Ahr5Lr/jWGL/B3Oqk8DCOpqi0+xV/
   0d1j//qJL1vAHsFNMCRYlq4vkFgRyC3sYMSpoVo1eALAudIh3FZ+QBOaa
   bHybIt65NACViEpT30eTu77GG7VIrMZiSKz349lbxAHILVIm0cbdJjZN+
   OJrtgQPbyFC7F3qcYAKLWDefGeAy5Ca6IYUalORptW9iC/exSEKMLbJQv
   PlzHMLgpo2kqZAK2qM4I6kzzg7q1w8/COWe7WHNodeQZLpdLqgODrUC2H
   Q==;
X-CSE-ConnectionGUID: BDdrF3AoTwOPzsoEoAarBA==
X-CSE-MsgGUID: +48e8HP4RKC6PuZMBY+Ncw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1320723"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1320723"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 06:00:40 -0700
X-CSE-ConnectionGUID: jefNf2lmQsOdJLmQDsucpg==
X-CSE-MsgGUID: kHQHxRSwQXuetHdHnxE0lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3551112"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 06:00:37 -0700
Date: Wed, 21 Oct 2026 16:00:35 +0300
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
Message-ID: <ati3c2JBNLGRnPen@ashevche-desk.local>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com>
 <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local>
 <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
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
In-Reply-To: <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 20, 2026 at 02:20:16PM -0700, Sam Agazaryan wrote:
> > Did I miss this in the initial explanation? If not, please add it next time.
> 
> That is just how the existing I3C core enumerates targets during DAA,
> not something added by this series. I will add a sentence to the
> cover letter and Patch 4 commit message in v6 contrasting it with
> i2c-dev to make that context clear.
> 
> > Do we have such use cases IRL? Do we have tooling support (at least pending)
> > somewhere? Why does it require user space interaction in _this_ way (meaning
> > IOCTL and /dev node)?
> 
> Yes, this is used in real systems today:
> 
> 1. Tooling & production users:
> 
> - i3ctransfer (Patch 5/5 of this series, and carried out-of-tree in
> AspeedTech-BMC/i3c-tools and vendor OpenBMC BSPs for several
> years).

So, nothing in production, meaning we can design that in kernel differently.

> - OCP Secure Firmware Recovery (DCR 0xBD) [1] and Caliptra Root-of-Trust
> recovery agents on OpenBMC/gBMC platforms (e.g., AST2700 / Caliptra
> MCU recovery tooling and BMC recovery daemons). Because Vitor's
> original i3cdev series was not merged in 2019, multiple silicon
> vendors and OpenBMC trees have been carrying out-of-tree forks of i3cdev;
> upstreaming consolidates those diverging implementations.
> 
> 2. Why an ioctl is required over a read and write:
> 
> - In the OCP Secure Firmware Recovery v1.1 specification (Section
> 8.4, "Recovery I3C Interface Block Read via Private Write and
> Private Read"), every recovery command read is a combined transaction
> consisting of a Private Write with no STOP, followed by a Repeated START,
> followed by a Private Read, and finally a STOP.
> 
> - Because write() and read() only submit a single transfer at a time
> (nxfers = 1), the controller emits a STOP condition on the wire
> at the end of write() and drops the bus lock. Submitting multiple
> i3c_ioc_xfer descriptors in a single I3C_IOC_XFER(N) ioctl is
> required so i3c_device_do_xfers() queues them together under one
> bus lock acquisition and the controller emits a Repeated START
> between messages (as well as passing HDR mode/cmd parameters).

Thanks, probably I was unclear, my specific question was why this needs a user
space to issue those recovery flows. And why it needs to be IOCTL-based and not
some higher level one.

> [1] https://www.opencompute.org/documents/ocp-recovery-document-1p1-final-pdf
> 
> > So, imagine that someone submits a kernel driver for a simple device, while
> > another person already uses the driver for multi-functional device where the
> > former one is driving only part of it. Strictly speaking the kernel driver
> > submission becomes a user space regression. Which effectively means that whenever
> > you open i3cdev, no other kernel drivers may appear. Yes, I understand that
> > a poor victim of such an unlikely course of events may recompile the kernel,
> > disable driver, et cetera, but this still raises the same question, why do
> > we do that to the mere users?
> 
> Note that a user does not need to recompile the kernel if a kernel
> driver binds to a device they wish to access via i3cdev. Because i3cdev
> handles BUS_NOTIFY_UNBOUND_DRIVER, unbinding the kernel driver at
> runtime via sysfs:
> 
> echo <dev> > /sys/bus/i3c/devices/<dev>/driver/unbind
> 
> automatically triggers i3cdev_attach() and exposes /dev/bus/i3c/<dev>
> without rebuilding the kernel.

Oh, that's quite a dangerous "feature"! Can we avoid doing that? Otherwise it
means any missed guard against unbind for the system controller related chips
may lead to real HW damage. I'm totally against this feature to be in any way
of an ABI. If you want that, do it exclusively via debugfs with a big fat
warning that this may lead to HW damages.

> Also, I3C drivers match against a
> target's MIPI-assigned DCR or 48-bit PID (Manufacturer ID + Part ID),
> so a driver for a simple device will not accidentally match a different
> chip's PID or a dedicated DCR like 0xBD.

Yes, but we are talking about opening a Pandora's box in user space, aren't we?

> > P.S> Still not convinced, that this has to be an ABI. For debugfs and something
> > like this, no objections, but ABI.
> 
> Production BMC recovery daemons cannot rely on debugfs, which is
> optional and restricted or unmounted on production builds. A character
> device in /dev/bus/i3c/* provides the stable ioctl those tools need and
> integrates with udev so non-root daemons can be granted access to
> specific target nodes (e.g. matching on DCR 0xBD), similar to spidev
> and hidraw.

But why recovery mechanism can't be kernel-driven? With some sysfs
(just as an example) knobs to say "I want to run now a recovery flow
on this bus", et cetera.

> > Forgot to ask, but do they interfere?
> 
> Is this in reference to i2c devices on the i3c bus? No, I3C transfers
> and legacy I2C transfers on a mixed-mode bus do not interfere:
> 
> 1. Both i3c_device_do_xfers() and i3c_master_i2c_adapter_xfer() acquire
> i3c_bus_normaluse_lock(&master->bus), so I3C and I2C transactions on
> the same bus are serialized by the I3C core.
> 
> 2. Attached I2C client addresses are marked as I3C_ADDR_SLOT_I2C_DEV in
> the bus address slot table, preventing DAA from assigning an I2C
> device's address to an I3C target.

Can i2c device require an i2c recovery flow on the bus? If so, how would
it be combined together with the i3c recovery flow(s)?

-- 
With Best Regards,
Andy Shevchenko


