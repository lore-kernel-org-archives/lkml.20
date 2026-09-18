Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1464938DC4C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789757996; cv=none; b=daDR0vsIz3w/kptLt7qeSr3OdqsbAxvxFTduG08adfaLAzvV2+yc1limMWSoOcIwk7OZMEBhyJX7mVd9fdIxs8ollmjD4BuOYdJBA+SpJMCHkznBRdg6RMUNZUx5hpeCLZYOVgZijtiH4bAUlMeahjkTlN67LN2G5O2zCk5HJ7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789757996; c=relaxed/simple;
	bh=3D4mUmccY1gSSVh8IjsM/fbKEdztyh9h5nT+Unh5a0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rt1BodFFWcHNLF/bsSA3NnyUxPqCmJWIbLHmBgWbuGJyBhQy1CxUxVwOjNtBlrDTK6MPJy6pB1ajSHKaANuaaLFZLbxSiq7JYHD0PTpnSKYENrXpp20n232ST+HSBfYdhCr/DpaTVeryY1cCjGIvtywE/cv+qE7jO3e3VJ7teA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=qy236HlD; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="qy236HlD"
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 4975D20B7167; Fri, 18 Sep 2026 11:59:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4975D20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789757942;
	bh=NWP5nJlGeNfNnvCdGPJg7ce4Gk1dR1/uBDCKD594tXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qy236HlDVJt3f+FE0DVLrsA1zs2ius5LJIzoFXA3wHC+Hsxe/RrG+D8pNuMVZ3Vd1
	 Zkrkwclh5oQs4pNSaHsQQnwkePcdo9PbDJJte5uR8ArOfDC2vPScsJEGpWS8hhEhUu
	 8E67vB0NRHTrhorOkMBORXigfBHsmaU3x8O5tN+0=
Date: Fri, 18 Sep 2026 11:59:02 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org, tgopinath@linux.microsoft.com,
	boris.brezillon@collabora.com
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20260918-bc8077794cfb7321acf66420@linux.microsoft.com>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com>
 <20260911-d0e2d97df458cbf24fa42089@linux.microsoft.com>
 <CAHreonH0b=spgb2LuUbVvWHarJWf3MOyL8qS5k_1X6gb_mjVkg@mail.gmail.com>
 <20260917-b3831e748e890287325aae49@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b3831e748e890287325aae49@linux.microsoft.com>

On Thu, Sep 17, 2026 at 03:27:38PM -0700, Meagan Lloyd wrote:
> On Fri, Sep 11, 2026 at 05:12:40PM -0700, Sam Agazaryan wrote:
> > Hey Meagan,
> > 
> > Thanks for sharing your patch series.
> > 
> >  The reason we have the bus notifier system here is
> >  1. Dynamic module loading is handled automatically: if i3cdev is built-in and
> >     a specialized driver module loads later, the bus notifier receives
> >     BUS_NOTIFY_BIND_DRIVER and immediately calls i3cdev_detach().
> 
> I think the bus notifier approach has the potential to hit some race
> conditions with other drivers.
> 
> For example, drivers/base/dd.c, really_probe is the only spot in the
> source code that BUS_NOTIFY_BIND_DRIVER event occurs:
>     really_probe
>         driver_sysfs_add <- where BUS_NOTIFY_BIND_DRIVER occurs
>         call_driver_probe
> 
> If a specialized driver's probe sets dev->driver_data, and i3cdev_detach
> gets to run afterwards, wouldn't it overwrite driver_data with
> NULL and clobber the driver_data?
> 
> Similarly, a driver setting dev->driver_data could cause you to lose
> your i3cdev_data pointer - which you need for teardown in i3cdev_detach.
> 
> The use of the dev->driver_data field when i3cdev isn't a registered 
> device driver was one of the feedback points flagged in v3 (2020).

I made an assumption in my previous analysis. I assumed that the
notification would be dispatched in its own thread. Digging more,
bus_notify just invokes all the registered .notifier_call callbacks, so
i3cdev_detach would be guaranteed to run before call_driver_probe.

Please disregard my previous comment and apologies for the confusion.

> 
> >  2. No cross-subsystem changes needed. The bus notifier avoids touching other
> >     subsystems entirely.
> 
> That's true and certainly a plus!
> 
> >  3. Boot-time recovery flows: For OCP Secure Firmware Recovery
> >     devices come up unbound and need /dev/bus/i3c/<device> available
> >     immediately without requiring udev rules or sysfs writes first.
> > 
> 
> Why can't you use udev rules?
> 
> You can use them to automatically set driver_override & bind to i3cdev.
> Once the rules are in-place, the setup of character device files in
> /dev/bus/i3c/<device> will be immediate and automatic on-boot and for any
> devices that join later.
> 
> You can also do it for all I3C devices if that's what you want.
>

FWIW, your solution will also work for me. I'm looking to query SKU
information over I3C and then configure I3C Hubs according to the
hardware path.

Thank you,
Meagan
 
> > It looks like we're both going in the same direction for UAPI
> > integration too.
> > 
> > If you're open to collaborating, I think we can combine and converge
> > on a single i3cdev driver - adopting all necessary fixes and
> > ensuring the UAPI and features cover both of our use cases so we
> > have one unified series (and any other use cases or desires we may
> > want out of an i3cdev driver).
> 
> Yeah, I am up for that! :)
> 
> > I'd like to know what everyone thinks about taking that approach
> > also if there are any other use cases we may be missing here,
> > regardless of which patch set we choose.
> > 
> > I guess just to get things moving, if we go one way and choose to go
> > forward with the bus notifier approach, Meagan would you be okay
> > with me incorporating your Patch 2/3 for actual_len for the i3c
> > controller drivers? Of course with your authorship.
> 
> Sure. I should have mentioned is that I only have a Designware I3C
> controller, so hopefully we can source help to test actual_len for
> other controller drivers.
> 
> Thanks, Meagan
