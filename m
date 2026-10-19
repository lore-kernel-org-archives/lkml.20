Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1404B4058
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403234; cv=none; b=OeHh6ec0HLZLx1IKgNavvdN4E0PVY39iNSLfPadrC6dYLJCQU+8CpZ2Zb0X+P1dM7G6KB2B/TZcE4+Dq0F+aN9v7O3UPthLWhz+NRy9VT357ox/jRVHiX4s7yw1uWkFGNNLff+3DV/532vfD22/Q6F9b1p9JEdgQ7DA3WCL18FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403234; c=relaxed/simple;
	bh=w4UHhObpYApuoYUrGBdsgMQGLO/WGyYDONI7l3vgqfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYvjqpZJenbx++QfY8QruNEm9EbdYU+VylWINRnrVN2WjUx9PwT4s8CYXVj/7U75EIuaNQVkzsvwBQrADO/SkrCXAQ8vzwbIefX6gkv4QyXcknhKPZ3oafbH+mvHqAtZJxFk8/wBBmoTfowWIc64D9IHQrGTZex2KKq/E7owG3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFqLrsI/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFqLrsI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792403233; x=1823939233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w4UHhObpYApuoYUrGBdsgMQGLO/WGyYDONI7l3vgqfk=;
  b=OFqLrsI/Y8lqAqFKbGrNvRfdbR0B13i1qFiE+bGdGn7FZkv3IAU9nKqZ
   D3EUOZwZlyZRFYQR/AqNQGuntSnBuAsARsrfl41bKbgRCcXSfm7JvO+Zh
   L4e03Q7UYtDXmVd/comSFI3GVRsSDETYAUsxb+cFAGs7NclVbedZ5MmN/
   IRuNasnmp6klIQW5B/0uLNIsy2TGK4YW/IbGtB7j2gozM2WHs3HrjCHu3
   T8cIll4tJurl5RL0Qy6fCOeljmgyh225RZINzX+MjmqM5rgTFIUfmfq8v
   UVJB94z1OmPc/xoZkORMe3slcO9T2UpfvrWOS4623Tvw3txpJ96RnfcU9
   w==;
X-CSE-ConnectionGUID: 0KwMWSKNQVCyqWohd0pvuQ==
X-CSE-MsgGUID: l8ApaA/sTtyqTZa1Ko5M7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="983656"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="983656"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:45:11 -0700
X-CSE-ConnectionGUID: PJQrtk4pTXW/F4y7qXJNDw==
X-CSE-MsgGUID: 4Ld0QSQnS6WRwwsnxgvfjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4252753"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:45:09 -0700
Date: Mon, 19 Oct 2026 12:45:06 +0300
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
Message-ID: <atXmovzepBLP8Mqo@ashevche-desk.local>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com>
 <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Oct 18, 2026 at 01:28:44PM -0700, Sam Agazaryan wrote:
> > Yes and more as this bus (i3c) is still non-discoverable (am I mistaken?).
> 
> I3C is a dynamically discoverable bus. During DAA each I3C target reports a
> Provisioned ID (PID), Bus Characteristic Register (BCR), and Device
> Characteristic Register (DCR), and is assigned a dynamic address by the
> controller.

Did I miss this in the initial explanation? If not, please add it next time.

> > This makes even less usefulness in my eyes. Immediate Q: if 4 already have the
> > proper driver in the kernel, what's wrong to make it for the fifth one?
> 
> 1. The original use case was hardware bring-up, silicon validation, and debug
> (i3ctransfer): Just like spidev, engineers need a debug interface
> to issue ad-hoc SDR/HDR transfers during bring-up or hardware validation before
> a driver exists.

Totally debug feature to me. Once you expose something in /dev (imply IOCTL),
it will become an ABI. And I'm fully against this.

> 2. Userspace firmware recovery / update tools (OCP Secure Firmware
> Recovery, Caliptra RoT):
> The recovery protocol is purely a polled request/response transport
> (no IBIs allowed per spec) used by userspace update tooling (fwupd / BMC
> recovery daemons) to parse signed firmware manifests, stream recovery image
> chunks to INDIRECT_FIFO_DATA, and poll RECOVERY_STATUS—similar to how
> userspace firmware updaters operate over spidev, hidraw, or USB/NVMe ioctls
> rather than putting firmware image parsing and update policy inside the
> kernel. In my response to Wolfram above I discussed this some more.

Do we have such use cases IRL? Do we have tooling support (at least pending)
somewhere? Why does it require user space interaction in _this_ way (meaning
IOCTL and /dev node)?

> > What if the device needs more? Or if this is a multi-functional device that
> > may have driver for only one part?
> 
> If a device needs more than basic transfers (such as IBIs,
> hot-join handling, or integration with a subsystem like hwmon/iio/mctp),
> it should use a dedicated kernel driver.
> 
> For multi-function devices, if the functions are exposed as MIPI I3C
> Targets (e.g. a device exposing both an mctp-i3c interface and
> an OCP recovery interface), each virtual target is assigned its own
> dynamic address and DCR during ENTDAA and is enumerated as a distinct
> i3c_device instance on the bus. Conversely, if multiple functions share
> a single I3C target address and register map, i3cdev intentionally does
> not allow userspace to access a target while a kernel driver is bound
> to it (avoiding the I2C_SLAVE_FORCE problem where userspace can race
> with a bound driver), so that case should be handled by an in-kernel
> MFD driver - but that is not the use case being targeted here with OCP
> recovery.

So, imagine that someone submits a kernel driver for a simple device, while
another person already uses the driver for multi-functional device where the
former one is driving only part of it. Strictly speaking the kernel driver
submission becomes a user space regression. Which effectively means that whenever
you open i3cdev, no other kernel drivers may appear. Yes, I understand that
a poor victim of such an unlikely course of events may recompile the kernel,
disable driver, et cetera, but this still raises the same question, why do
we do that to the mere users?

> > What to do with the i2c devices connected to i3c bus in the compatible mode?
> 
> I3C master controllers register an i2c adapter for i2c devices running on an
> i3c mixed mode bus - they are identified as i2c_bus_type, not i3c.

P.S> Still not convinced, that this has to be an ABI. For debugfs and something
like this, no objections, but ABI.

-- 
With Best Regards,
Andy Shevchenko


