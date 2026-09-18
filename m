Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2513B43C7DF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789763021; cv=none; b=Dhfjlhekex2Ki1uzGKYHKd7V0x+MijW+128/sTon28X95/N6LgBeqAV/3lSopmaeKV4m0hSfB+kg5Q9VEmy5CZnxpoHRiNO2CxX44JwEEc6TRbELqw4hKYUTCLJ4tJtehgsa3+UP0FwnffCuksXOSvxdqTBJu3LaOvnMA1Bn4o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789763021; c=relaxed/simple;
	bh=QgehnIozSTGke/zPxcVVgBvdo/Q5jNnoUGACrGc8nKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sahANi7pFioOB/CxuLQG5yVZ7HJK5ASy52lKNzgE1LYw27eDzZs36lHeRs+ynDVSY4hAsaY6JZxLjmh1GhKXjO+Ni12EKg6n4aQLgqNXFU7iyjra4BjIhOe6yF/rI6lGXQ8aQjsl3h/kj06eTZpBY8ROZ1znkYGZIAXcwBFJQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Pyln+jy3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Pyln+jy3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAD01F000FF;
	Fri, 18 Sep 2026 20:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789763019;
	bh=3Qz/tBkzzeq47UthVPnETh1v8jcI4ylHmSJ+mTm3EqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pyln+jy3vgoqCXoYdZezSXhpxbKeJ6M3ytcvhOewdUJOfusYNcAEiVa/6DZNpzYO9
	 aJE3r3RyDMwJk7FA6zHdLjS6SqgBzi64+bn1m29ihiHTENoS2BDJqXKsNL5JnzJfY+
	 UUoMWTfL7924CsSbDl8MSjJ5FPx/rL+HIdwOKQHA=
Date: Fri, 18 Sep 2026 21:21:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: Sam Agazaryan <samagazaryan@google.com>, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org, tgopinath@linux.microsoft.com,
	boris.brezillon@collabora.com
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <2026091834-bats-palpitate-5614@gregkh>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com>
 <20260911-d0e2d97df458cbf24fa42089@linux.microsoft.com>
 <CAHreonH0b=spgb2LuUbVvWHarJWf3MOyL8qS5k_1X6gb_mjVkg@mail.gmail.com>
 <20260917-b3831e748e890287325aae49@linux.microsoft.com>
 <20260918-bc8077794cfb7321acf66420@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-bc8077794cfb7321acf66420@linux.microsoft.com>

On Fri, Sep 18, 2026 at 11:59:02AM -0700, Meagan Lloyd wrote:
> On Thu, Sep 17, 2026 at 03:27:38PM -0700, Meagan Lloyd wrote:
> > On Fri, Sep 11, 2026 at 05:12:40PM -0700, Sam Agazaryan wrote:
> > > Hey Meagan,
> > > 
> > > Thanks for sharing your patch series.
> > > 
> > >  The reason we have the bus notifier system here is
> > >  1. Dynamic module loading is handled automatically: if i3cdev is built-in and
> > >     a specialized driver module loads later, the bus notifier receives
> > >     BUS_NOTIFY_BIND_DRIVER and immediately calls i3cdev_detach().
> > 
> > I think the bus notifier approach has the potential to hit some race
> > conditions with other drivers.
> > 
> > For example, drivers/base/dd.c, really_probe is the only spot in the
> > source code that BUS_NOTIFY_BIND_DRIVER event occurs:
> >     really_probe
> >         driver_sysfs_add <- where BUS_NOTIFY_BIND_DRIVER occurs
> >         call_driver_probe
> > 
> > If a specialized driver's probe sets dev->driver_data, and i3cdev_detach
> > gets to run afterwards, wouldn't it overwrite driver_data with
> > NULL and clobber the driver_data?
> > 
> > Similarly, a driver setting dev->driver_data could cause you to lose
> > your i3cdev_data pointer - which you need for teardown in i3cdev_detach.
> > 
> > The use of the dev->driver_data field when i3cdev isn't a registered 
> > device driver was one of the feedback points flagged in v3 (2020).
> 
> I made an assumption in my previous analysis. I assumed that the
> notification would be dispatched in its own thread. Digging more,
> bus_notify just invokes all the registered .notifier_call callbacks, so
> i3cdev_detach would be guaranteed to run before call_driver_probe.
> 
> Please disregard my previous comment and apologies for the confusion.
> 
> > 
> > >  2. No cross-subsystem changes needed. The bus notifier avoids touching other
> > >     subsystems entirely.
> > 
> > That's true and certainly a plus!
> > 
> > >  3. Boot-time recovery flows: For OCP Secure Firmware Recovery
> > >     devices come up unbound and need /dev/bus/i3c/<device> available
> > >     immediately without requiring udev rules or sysfs writes first.
> > > 
> > 
> > Why can't you use udev rules?
> > 
> > You can use them to automatically set driver_override & bind to i3cdev.
> > Once the rules are in-place, the setup of character device files in
> > /dev/bus/i3c/<device> will be immediate and automatic on-boot and for any
> > devices that join later.
> > 
> > You can also do it for all I3C devices if that's what you want.
> >
> 
> FWIW, your solution will also work for me. I'm looking to query SKU
> information over I3C and then configure I3C Hubs according to the
> hardware path.

Note that manually using bind will taint the kernel in the near future,
so NEVER rely on that to do anything that you rely on (i.e. normal
operations.)  The bind/unbind and driver_override stuff is there for
debugging stuff, not for normal hardware support.  Do it properly and
don't attempt to abuse that interface please.

thanks,

gre gk-h
