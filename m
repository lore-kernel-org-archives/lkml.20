Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587791;
	b=DTljQkQtN3iVUib3GdreNR3YbdM/WyiawrQn8EW9tyb9udVPeTF5yrTHxJsHP+HxP25d
	 wkwBsaYLanhmOwEkPrnFxgX1AoXKbZxZZ10rIPLvIlkQpCu//QGbxlyLlA5rX4B20dIyK
	 Tj0gjuLXN6pQ7oyLzRQLcJKz+HDdVad8950o6IuREimfUjv3TLAr+AOZ6SXW9WS5UczP5
	 s6TwU+L5I1vg8UZSQo4+PZsHvKQGfQLPF5rutaTNbaLNecM8IUnWfxOs9JrDc+NI4kQql
	 o4z15MfxOvtCVNHPe0GuRJkyhS8LNZQ0Xujyq4EHdpLs4pWKrxylo7RDk4fzLsi2Psg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587791;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=BBo6nJZDGaZdzMupg9p80YZ87I6DpqEFrG2RfDENvOM=;
	b=l9Io3cBbt+Kc5zIJYonpEml7hL4IjO8DMK0lkM0wFnw5XNgBCkg3L9xk2FbnaX1MPBIK
	 kY2JR8JRSc9CadEi9b7eFg+R1jQXrKrU8rJ9XPszkJGV9/MbfXcs8Qn73NYIzw3Wjb9ko
	 QvT9la7bPJJ0hh5cm7qQvLb95/+FzypkuTdt97sJYUidFxUspr0TS8NVZAIZPM3Q4sfde
	 Wg/3cA5vES0Oc67o+PQkWzaPaoUxMl/Ma92tDUe9q39jnb/mtkFV+pLd1CrWNfMfmE9VS
	 rj7BB72KNq8DmfHlEUFBootToHv42J9s08c++ctVgiYvfSYnvQZX54ITbLqqutXHdow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RGvUV3Wc;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C1A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C1A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RGvUV3Wc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792587789; x=1824123789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1ORT0tjK0c2r1UtF2vEYJ2mzd1Ob03HwCzlzEcEcpmI=;
  b=RGvUV3Wc4ruQm0FofP3/DUxhLrdgao8vlAjXuSiFi8ILpIIPWXLO9G06
   4TZ/FyJBAtxl+6umixHKngU26N9VcjuKnsEUo/sbsk3r69V8Gsg0uMk8m
   poL4cMchKASxp6RQZCkgMHgEtVFe0KeF1/FmdwHInXMpfpFh/VDJIgJ0L
   4m5euQ0aY2/Cul6yZT2zbsGGkwouQSSDMX4f2IenzPWj2lsWB4hnj9LGQ
   WKKaAZzIhZ0vAsgri/yk/1/3B2WfmmlkNpcucLCENoJFp+myLHaxAPN1e
   cPevjy3e4/czRsjbyAuhi3nVeRtrp/lCxe6+rjCu5KFhHtjG4cThJFufA
   g==;
X-CSE-ConnectionGUID: AOmpNsUfTV6K+1JhHCqpfQ==
X-CSE-MsgGUID: m1uUI/YzSF+CVizzTdflyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1321175"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1321175"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 06:03:09 -0700
X-CSE-ConnectionGUID: /jP1GDWuRdeVAyCf+CaKNw==
X-CSE-MsgGUID: yTfWaygqSMuOYFJZCb470g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3140257"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 06:03:05 -0700
Date: Wed, 21 Oct 2026 16:03:03 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sam Agazaryan <samagazaryan@google.com>,
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
Message-ID: <ati4B33tnKsCD4c_@ashevche-desk.local>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com>
 <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local>
 <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local>
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
In-Reply-To: <202610210957562f3f6511@mail.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 11:57:56AM +0200, Alexandre Belloni wrote:
> On 20/10/2026 14:20:16-0700, Sam Agazaryan wrote:
> > > Did I miss this in the initial explanation? If not, please add it next time.
> > 
> > That is just how the existing I3C core enumerates targets during DAA,
> > not something added by this series. I will add a sentence to the
> > cover letter and Patch 4 commit message in v6 contrasting it with
> > i2c-dev to make that context clear.
> > 
> > > Do we have such use cases IRL? Do we have tooling support (at least pending)
> > > somewhere? Why does it require user space interaction in _this_ way (meaning
> > > IOCTL and /dev node)?
> > 
> > Yes, this is used in real systems today:
> > 
> > 1. Tooling & production users:
> > 
> > - i3ctransfer (Patch 5/5 of this series, and carried out-of-tree in
> > AspeedTech-BMC/i3c-tools and vendor OpenBMC BSPs for several
> > years).
> > 
> > - OCP Secure Firmware Recovery (DCR 0xBD) [1] and Caliptra Root-of-Trust
> > recovery agents on OpenBMC/gBMC platforms (e.g., AST2700 / Caliptra
> > MCU recovery tooling and BMC recovery daemons). Because Vitor's
> > original i3cdev series was not merged in 2019, multiple silicon
> > vendors and OpenBMC trees have been carrying out-of-tree forks of i3cdev;
> > upstreaming consolidates those diverging implementations.
> > 
> > 2. Why an ioctl is required over a read and write:
> > 
> > - In the OCP Secure Firmware Recovery v1.1 specification (Section
> > 8.4, "Recovery I3C Interface Block Read via Private Write and
> > Private Read"), every recovery command read is a combined transaction
> > consisting of a Private Write with no STOP, followed by a Repeated START,
> > followed by a Private Read, and finally a STOP.
> > 
> > - Because write() and read() only submit a single transfer at a time
> > (nxfers = 1), the controller emits a STOP condition on the wire
> > at the end of write() and drops the bus lock. Submitting multiple
> > i3c_ioc_xfer descriptors in a single I3C_IOC_XFER(N) ioctl is
> > required so i3c_device_do_xfers() queues them together under one
> > bus lock acquisition and the controller emits a Repeated START
> > between messages (as well as passing HDR mode/cmd parameters).
> > 
> > [1] https://www.opencompute.org/documents/ocp-recovery-document-1p1-final-pdf
> > 
> > > So, imagine that someone submits a kernel driver for a simple device, while
> > > another person already uses the driver for multi-functional device where the
> > > former one is driving only part of it. Strictly speaking the kernel driver
> > > submission becomes a user space regression. Which effectively means that whenever
> > > you open i3cdev, no other kernel drivers may appear. Yes, I understand that
> > > a poor victim of such an unlikely course of events may recompile the kernel,
> > > disable driver, et cetera, but this still raises the same question, why do
> > > we do that to the mere users?
> > 
> > Note that a user does not need to recompile the kernel if a kernel
> > driver binds to a device they wish to access via i3cdev. Because i3cdev
> > handles BUS_NOTIFY_UNBOUND_DRIVER, unbinding the kernel driver at
> > runtime via sysfs:
> > 
> > echo <dev> > /sys/bus/i3c/devices/<dev>/driver/unbind
> > 
> > automatically triggers i3cdev_attach() and exposes /dev/bus/i3c/<dev>
> > without rebuilding the kernel. Also, I3C drivers match against a
> > target's MIPI-assigned DCR or 48-bit PID (Manufacturer ID + Part ID),
> > so a driver for a simple device will not accidentally match a different
> > chip's PID or a dedicated DCR like 0xBD.
> > 
> > > P.S> Still not convinced, that this has to be an ABI. For debugfs and something
> > > like this, no objections, but ABI.
> > 
> > Production BMC recovery daemons cannot rely on debugfs, which is
> > optional and restricted or unmounted on production builds. A character
> > device in /dev/bus/i3c/* provides the stable ioctl those tools need and
> > integrates with udev so non-root daemons can be granted access to
> > specific target nodes (e.g. matching on DCR 0xBD), similar to spidev
> > and hidraw.
> > 
> > 
> > > Forgot to ask, but do they interfere?
> > 
> > Is this in reference to i2c devices on the i3c bus? No, I3C transfers
> > and legacy
> > I2C transfers on a mixed-mode bus do not interfere:
> > 
> > 1. Both i3c_device_do_xfers() and i3c_master_i2c_adapter_xfer() acquire
> > i3c_bus_normaluse_lock(&master->bus), so I3C and I2C transactions on
> > the same bus are serialized by the I3C core.
> > 
> > 2. Attached I2C client addresses are marked as I3C_ADDR_SLOT_I2C_DEV in
> > the bus address slot table, preventing DAA from assigning an I2C
> > device's address to an I3C target.
> 
> On my side, I believe i3cdev can be added to the kernel and that it is
> way safer than i2cdev but I agree that the ABI has to be properly
> designed, maybe we need to version it or have a way to probe for
> supported features so we can update safely later on. It is failry simple
> right now but I feel like we are going to see people with more needs
> than initiating transfers.

Yeah, I really think that i2cdev was a pure mistake (as to be an ABI).
I don't want to repeat it now, when we learnt about that case a lot.
If we ever going to have i3cdev (which justification I also put in doubts)
it needs to be very strict of what can be done and how.

> Also, I think this should not bind to any devices by default and make
> binding explicit.

Yes, this is quite dangerous "feature".

-- 
With Best Regards,
Andy Shevchenko


