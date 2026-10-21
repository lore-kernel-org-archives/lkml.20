Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576686;
	b=qvx41HbekO/HrdPsDivg9TpNkkCbOaBLYn3f9zhxtV4o/c64uceCtk1xz8++esWepePo
	 nLfjUFxXAhNGoa7F0HQHKFO5ZlXP4AOEiWRsjWcNDncXyQEsAhDD7dn8A67Pamiham7eA
	 LHbcbxYE+navcHI2c22+VjxszrI/mnj+mx8diUIzDfW3vK1FlnjvKkQhqbEePPeKFhNWx
	 +LvpP0C6/p3aPBFC35YR0TTJK2gNhpT0rW7u+22i38+7zflW+vffav29xkKI0bxSxkpoE
	 V3wOQRWwlVEs/oZtmTnj5F+7mCHaUj18YaO6XDrl7Zb/nQEE7nspcaAoM9RKYenmihA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576686;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=Zoi2YkoIf+uTpOt10EF9wNlEwLR3Zk9CW+IQ44/jYk0=;
	b=fIyS8sc52GCrsHJqFDg14Jx/Xu/BHvnRbR49qDqiDqp6/ya/xNXtdJe8A/vbDQgeJqiK
	 +dlaoJn89VrLxz3Bzr5FyXOoeVpfE41CERZjELXz46FX8m8ILbwy4fVKqK2abrpsdDVm7
	 rHoMlUIFezdhUkJ6ej273R8rwwzHKMAW25e6YVVHnX/jYwHfyKQ5nhqfiO/RiAH+DfXjX
	 BPOnQW2wP5+o90aC1ndXwUQGkvSZtY7jfa98hIMsK0BZaQ6VdsUOEgSuVYBSXlTOiMN7I
	 LPYi3iN4rf0AmMjjEy9aKcNR2PFAiLPgmwGWUV2kdUx11UJXFw/065fvqrzm3fxbN3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yWtBfvaL;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B8E606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3B8E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yWtBfvaL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3DF004E4125C;
	Wed, 21 Oct 2026 09:58:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E876606E3;
	Wed, 21 Oct 2026 09:58:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D296C10328934;
	Wed, 21 Oct 2026 11:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792576681; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Zoi2YkoIf+uTpOt10EF9wNlEwLR3Zk9CW+IQ44/jYk0=;
	b=yWtBfvaLHer9waGUO8l3Djdfg0MRxi8AYaWr8qxlZK5oKPnCOxAMxulmPyXHqu9StyMw0S
	YNyi8O0SVY1C2yqFPafpenIRJBxGd6bB92byO/mXJZ77aOGEcgqlKRDlF5PGet2ejtN6tK
	qZPYFVthNuv5zzMhcfld9B6tpWJNYx6GmB/0xl8mDdELLGefQ6ESoN2cTVWeXv7dGavPBf
	WevUeGfsvbkUsYxDYq861rRrc/lb7zoBQmfqE/xq9PJEQK3SZPf1f40wdcK9qbCs1GU79J
	FqDkJCZJ35nY3hm/dFr3dAKXDf+W6IbW6079J2oHHgHPTzx4vdTUxfI+eou3aA==
Date: Wed, 21 Oct 2026 11:57:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
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
Message-ID: <202610210957562f3f6511@mail.local>
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
X-Last-TLS-Session-Version: TLSv1.3

On 20/10/2026 14:20:16-0700, Sam Agazaryan wrote:
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
> 
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
> 
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
> without rebuilding the kernel. Also, I3C drivers match against a
> target's MIPI-assigned DCR or 48-bit PID (Manufacturer ID + Part ID),
> so a driver for a simple device will not accidentally match a different
> chip's PID or a dedicated DCR like 0xBD.
> 
> > P.S> Still not convinced, that this has to be an ABI. For debugfs and something
> > like this, no objections, but ABI.
> 
> Production BMC recovery daemons cannot rely on debugfs, which is
> optional and restricted or unmounted on production builds. A character
> device in /dev/bus/i3c/* provides the stable ioctl those tools need and
> integrates with udev so non-root daemons can be granted access to
> specific target nodes (e.g. matching on DCR 0xBD), similar to spidev
> and hidraw.
> 
> 
> > Forgot to ask, but do they interfere?
> 
> Is this in reference to i2c devices on the i3c bus? No, I3C transfers
> and legacy
> I2C transfers on a mixed-mode bus do not interfere:
> 
> 1. Both i3c_device_do_xfers() and i3c_master_i2c_adapter_xfer() acquire
> i3c_bus_normaluse_lock(&master->bus), so I3C and I2C transactions on
> the same bus are serialized by the I3C core.
> 
> 2. Attached I2C client addresses are marked as I3C_ADDR_SLOT_I2C_DEV in
> the bus address slot table, preventing DAA from assigning an I2C
> device's address to an I3C target.

On my side, I believe i3cdev can be added to the kernel and that it is
way safer than i2cdev but I agree that the ABI has to be properly
designed, maybe we need to version it or have a way to probe for
supported features so we can update safely later on. It is failry simple
right now but I feel like we are going to see people with more needs
than initiating transfers.

Also, I think this should not bind to any devices by default and make
binding explicit.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
