Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476507;
	b=BP+s235s86xuiHxqou6sH9ZFvZoo4QU30wJaWQF+9Cp+qOYZmV24U9/cAvXGM05Uo6p6
	 H3MV55cqrYpX5Dh8SGJGT0WvhTSeoDm9RjYamjM4Iy8rO/UBDUmT2LBrIo4BpDWmnNC8Q
	 n+W1K+j5eF46RDVp5cS3sn+pa/fSbtzbBvJ8wFUGmriEGSNdLNMbzJGIno+UVShgbXLM7
	 DxbSC/8PcFxDfzTw9tqJuaY8F6AUEKXBCjTfY9TLTqMeqyjDjxEUcCh9G41miFMtJgk8R
	 nF1lihsmHwUBHMAT8eTpE7ak8XJnMscdCIFlWazsaGfmi9ZwczMSKv+YXF9jKbEo+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476507;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=059CCFFzEVHvGsNex5duvrj7Tz6Yz5B+WTMacZsba1M=;
	b=S6t+cB5LTrn++cTkYP5M8bWUdWNoQynKghlUd1jAGOBtevXPhL0i8EthkKTMUr01pFSR
	 ZGjfJ4+/vrIlFI1YJVwYHrnS2JBlS2pxM7AMQzMytAnHXxHMaPbkFTPp4RZy+A8ks/VHV
	 usSuw5TXqCBFv1oeF37r7uCGbfYw/efCFXe/jn5jhWdUWM8M6GnIaj40LIrR8GG2ceQwI
	 aRmG7kWG/xEgdsUpzZROXvXS6IQbbfxSJYkly/oy7Mg0jjzaDogAL2+Ba+LMMNCpKLRS8
	 drxrmVhKgi5PzGFjGAQoGW0rw3U1X/DWpD7jJOLvuO7aO4F2iH2Dd2ZnHuKkZZ1LNyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=o66uRwTK;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEAB60A3822
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACEAB60A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=o66uRwTK
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C03114E4157E;
	Thu, 12 Nov 2026 09:41:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B5EB5FF85;
	Thu, 12 Nov 2026 09:41:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87C5C11BC02FB;
	Thu, 12 Nov 2026 10:41:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794476502; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=059CCFFzEVHvGsNex5duvrj7Tz6Yz5B+WTMacZsba1M=;
	b=o66uRwTKg5QwneU8X8Z8uChZl6txo+7p+yOjSrmsrV4IpG6sCeYvm7VGbULxQ2eBCeGnon
	dwqGMSP8D0OZcko4gnRkbK5DBTpYkyKdQsP8vkJskU1uRDbdHGlixRBpbJe3++N+1uVSUV
	+yB7wCShn0/GBHqe3C3TBYPsN8cDWXiDbRHenyE6yqK4C7jC7XXYqJqA7FIqfliclyLuQ2
	HMLwJo9RN2ohn8h1PS5yPiAeyy/mz798oIKG8JnCMnfIP71uJ/n8hABltb2K+djhpoLmw5
	MFyB/WnSwEnKFU0yNcRxG8Wt2VzNQTlLgk4s63QjlfX27Wuc/iwCzgKe68nnWA==
Date: Thu, 12 Nov 2026 10:41:37 +0100
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
Message-ID: <202611120941378508d6e0@mail.local>
References: <arY6DfVf_9tZ_TCu@black.igk.intel.com>
 <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local>
 <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local>
 <CAHreonH0maC6iU1fkwv9VvWzZfh=W_ybB8R6CLbXQmKQL+x-=g@mail.gmail.com>
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
In-Reply-To: <CAHreonH0maC6iU1fkwv9VvWzZfh=W_ybB8R6CLbXQmKQL+x-=g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On 22/10/2026 17:17:20-0700, Sam Agazaryan wrote:
> > On my side, I believe i3cdev can be added to the kernel and that it is
> > way safer than i2cdev but I agree that the ABI has to be properly
> > designed, maybe we need to version it or have a way to probe for
> > supported features so we can update safely later on. It is failry simple
> > right now but I feel like we are going to see people with more needs
> > than initiating transfers.
> 
> For feature probing and ABI extension, what do you think of:
> 
> 1. Adding an extensible I3C_IOC_GET_CAPS ioctl:
> 
>    struct i3c_ioc_caps {
>        __u32 size; /* sizeof(struct i3c_ioc_caps) */
>        __u32 pad;  /* must be 0 */
>        __u64 caps; /* Bitmask of supported I3C_CAP_* features */
>    };
> 
>    Today caps can report the transfer modes supported by the controller
>    and target (I3C_CAP_SDR, I3C_CAP_HDR_DDR, I3C_CAP_HDR_TSP,
>    I3C_CAP_HDR_TSL), and new bits in caps (or new fields appended to
>    the end of the struct) can advertise future capabilities beyond basic
>    transfers.

This works but my point was also that we need to expose the i3cdev
capabilities so userspace can discover what is available. I guess we can
assume .read and .write are going to always be available and so this is
fine for now.

> 
> 2. In struct i3c_ioc_xfer, we already have __u8 pad[2] at the end which
>    is strictly checked to be 0 (-EINVAL if non-zero), reserving 16 bits
>    for future per-transfer flags without changing the struct size.
> 
> > Also, I think this should not bind to any devices by default and make
> > binding explicit.
> 
> This seems to be the consensus so far. I can convert i3cdev from a bus
> notifier into a standard struct i3c_driver so it does not auto-attach
> to all unbound targets on boot or on unbind while dropping patches 1
> and 2.
> 
> Since Greg KH noted earlier [1] that driver_override / manual sysfs
> bind is only for debugging and will taint the kernel in the near
> future, what do you think of:
> 
> Matching explicit opt-in entries in i3cdev's i3c_device_id table (starting
> with 0xBD for OCP Secure Firmware Recovery), and optionally
> exposing a new_id sysfs attribute on the i3cdev driver for dynamically
> adding target IDs at runtime? That also keeps everything self-contained
> in i3cdev without needing cross-subsystem changes to hwmon/iio drivers.
> 

We can add new_id later if necessary.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
