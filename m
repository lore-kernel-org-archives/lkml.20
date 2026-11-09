Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260961;
	b=CDuJHmrIv9E8kkbKO+Jo0y+S72KZMw7Hsr4jJ10S1L1d8I8d5aI14ev1kQFx1NVAnuPR
	 ldBRKNrUk0uzcGAXke8SPiplGhKWj8pMB+fB7ev2Ynn69VzEFpwvUNS5ZjqpnhlT8ZT86
	 VsyTlCbjnf6X/DxKsv9sF5Jx32FTT+oDb/+4ojG3zcoxPqxNVKhilGFW54ICe2H0D2uph
	 76IgnCcIoxY6jrlj9aswLPM8bwZoB6dfWz4y+F58dGlVFB1zOC4QopQ0DQ3F5VojBaTCW
	 7xQFHlQFKIS9IS2QR8E4Mr7hAfHOw9t6VOhzHDTmFVm6Zppqm8qlp4SQ80cpf1dr70Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260961;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=UxDjvppQo/SrqEXKDKs+D5fmThARf1TnPkDI8HYKfsw=;
	b=zpU3CgAFjURUgjitZfQ9pA6yEoBuRggu/Jgf1nzpqlPeeB5WSKL3VCfqG1H1j84+jmT7
	 4prM/R/99ItxM6a6w//y7KVvYQAZ2Ekx4rp64VvN/ZTsltn5xcGtSBWP4l4SETbPSFdvE
	 p4wMTWX86ZPABhdTdlxk0+ZGIYINyRb450PWzKS/57czBv6WpDMAMuNVV2p1noVc0S/5Y
	 +26KUxXKuDr/pX1/rtKcRSl+RBXeFCovvSGFv9mhCZ8kOhQV2ODfpN0QeKRFnitXHfmOM
	 Aaf9ZIlOHXLsB+XU1C6b4Pq3n7Ms2jHKHP75OKyU9R1gfiX70ltOPmR/gGiqW3tbFyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WhNLbKUt;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CD5606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0CD5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WhNLbKUt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794260960; x=1825796960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q2UzRyhaM40DLj8CMTHMez0m2szpSS2h1gwd08COTzQ=;
  b=WhNLbKUtjxbarDdncnIRkZbAJaTnxFjZAAIewU+roMBberNYLn5sl6ed
   fmXfBbJq7di1jU3WXW01Scf7SrMFpQzewiihcxgiyh5zGWKekRv3ih88q
   k3HA58ktxnNoGGn3XhuwFphN55jrmiKde3HzzX1OuUrRSIi1+MWvdZ7Ku
   aa4Mroy8XI3crPwCoU3iQuCvJJwjHddwyXwvTLEvpV/bAcKvx1PRa63Ug
   6v0doPYirzXiTynpZXeaVmKFhVEiw1EvvWYBRHw7z9i7z1hcn4lohyEQh
   pXAtMSHHmbig9ma5FofYbNBgHcY+kqkQTipoNaCBMxass1T1LEDotGLSS
   w==;
X-CSE-ConnectionGUID: viP/488SSDyUQw2XM1ldGQ==
X-CSE-MsgGUID: 2l02TcVlT4SRSAypefSxyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3023904"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3023904"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:49:19 -0800
X-CSE-ConnectionGUID: sLzjHxyhRkGJ3Fqvas8SXg==
X-CSE-MsgGUID: DDsrY47BTsaSpcaHsy4PjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8116535"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:49:16 -0800
Date: Mon, 9 Nov 2026 23:49:13 +0200
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
Message-ID: <avI_2ddihPu_sxCe@ashevche-desk.local>
References: <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local>
 <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local>
 <ati4B33tnKsCD4c_@ashevche-desk.local>
 <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com>
 <at8xuIWvvqLoicTg@ashevche-desk.local>
 <CAHreonEjSXs7ecOrCtqXh3gXdkGeqK=8mgjTUHLk3q0aOuP4pA@mail.gmail.com>
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
In-Reply-To: <CAHreonEjSXs7ecOrCtqXh3gXdkGeqK=8mgjTUHLk3q0aOuP4pA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Nov 08, 2026 at 10:11:52PM -0800, Sam Agazaryan wrote:

[...]

> > > production BMC firmware update and recovery daemons running in OpenBMC
> > > server fleets (managing Caliptra Root-of-Trust and SoC recovery targets
> > > over I3C), as well as production server accelerator management daemons.
> >
> > Okay, but they are not (obviously) use the upstream solutions for that.
> 
> Right, they run on vendor kernels carrying out-of-tree i3cdev patches
> based on an earlier version of this series, so there is no upstream ABI
> to stay compatible with. This series already departs from that ABI
> and v6 will change it further based on the review in this thread.
> 
> > But it's still unclear to me why this can't be moved to the kernel space?
> > There is no user space that communicates with upstream kernel in the way
> > you described, they should have used a custom (out-of-tree) solutions, right?
> 
> It could be, and the closest in kernel fit would be an OCP recovery
> i3c_driver exposing fw_upload. But pushing an image is only one part of
> the spec, and an in kernel driver would have to cover all of it, not
> just the subset one recovery agent happens to use:
> 
> - status and identity: PROT_CAP, DEVICE_ID, DEVICE_STATUS (with
>   recovery reason codes), RECOVERY_STATUS and HW_STATUS
> - reset and boot control: DEVICE_RESET with forced recovery and
>   flashless boot, and multi-stage activation through RECOVERY_CTRL
> - memory spaces: code, critical logging and vendor-defined CMS
>   regions, through either the indirect window or the FIFO interface
> - the VENDOR command and vendor-specific status, which differ per
>   SoC vendor

Good. We can see that being implemented step-by-step.

> Which of these an agent uses, when to trigger recovery, and which image
> goes with each stage all vary by platform, and the BMC's userspace
> already makes those decisions.

Based on the absence of any interface in the kernel before, there is no chance
to regress anything. It might be just a good will to try hard to support
existing out-of-tree solutions.

> An in-kernel driver would need new sysfs ABI for this, and that ABI
> would have to grow as the spec evolves: v1.1 alone added multi-stage
> activation, flashless boot and the indirect FIFO interface. With a
> target-scoped transfer interface, none of that needs kernel changes.
> fw_upload and lib/pldmfw fit well where a kernel driver already owns
> the device; here the only consumer is the BMC's management stack.

Yes, and I see no issues with that. Opening the whole i3cdev just for the same
reason sounds like an overkill. Especially if we do *not* expect any more users.

> The kernel already splits things this way on I3C for MCTP: mctp-i3c
> binds by DCR and provides the transport, while PLDM firmware update
> runs in userspace. i3cdev could be made to bind the same way, by the
> OCP recovery DCR, instead of binding to every unbound target. Outside
> I3C it is the same pattern: nvme-cli does NVMe firmware download/commit
> through the passthrough ioctls, and fwupd updates devices over hidraw,
> usbfs and drm_dp_aux_dev.
> 
> So the kernel side stays a small mechanism consisting of target-scoped
> transfers to explicitly bound devices, and the recovery policy stays
> in userspace, where it can follow new spec revisions without new kernel
> ABI.

If there are success stories, those examples might help to justify your
approach. It makes sense to mention that in the cover letter with the
summary on their designs (and split).

> > > If you mean electrical bus recovery, i3cdev doesn't perform
> > > bus-level electrical recovery. It only submits normal target-addressed
> > > transfers via i3c_device_do_xfers().
> >
> > But how it will do if the i2c device blocks the i3c bus in mixed mode?
> > I mean, how will it affect the i3c transfers on the wire?
> 
> Electrically speaking, SDA and SCL are shared, so an I2C target that
> holds SDA low blocks every transfer on that bus, I3C and I2C alike,
> regardless of which driver issued it. The controller reports the failure
> as a NACK, arbitration loss or timeout, depending on the controller.
> i3c_device_do_xfers() returns the error, and i3cdev passes it back to
> userspace from the ioctl.
> 
> So i3cdev behaves the same as any in kernel I3C driver on that bus
> since it uses the same transfer path. Getting a stuck bus released is
> up to the controller driver rather than i3cdev. For what it's worth,
> section 8.4.1 of the OCP recovery spec recommends a pure I3C bus for
> critical recovery paths, and for mixed buses requires validating that
> I2C targets have spike filters and considering isolating or
> disabling the ones that can't. I2C devices on a mixed bus are also not
> allowed to stretch the clock.

-- 
With Best Regards,
Andy Shevchenko


