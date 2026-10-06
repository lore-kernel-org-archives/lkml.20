Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF283BE156
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791319545; cv=none; b=evsslGvQRhPRD5PK8TWHEHcZaYbspbILWxrw1KK5FQvQpsE0toalWLB0XfgnlFOTJilUF3sO8CuDJaFdvPQWB88lEo7j4VlqmNknmStpOoOsq/BRPBQZ42ref9SRX0oLcb+W3qTzeN+ry2BKJRHiMQIzHqvDOCU9LvCWurdlu7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791319545; c=relaxed/simple;
	bh=/3t7EwWiM7LlTPc2Wvwag4ghLE4sethZxT0s8a++x80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rICmLAVAJhAKPgtxk9mKLWTCdf9fIyaNbB9+55u2iib8LBtZ+j9r3Q1/CmIEJ1sEKr98jVWz7B4+FAMswGeaNUe4uyI4M2JZb/9Xu65B4IOLJ7DbVDCwoXwEo8Bl8aG5X0yfsmONygoKOHyXux7uFjqy+a5zW4fH/tX11MI2mTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BsorEK0a; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BsorEK0a"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533930955a4so10264041cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791319542; x=1791924342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P5oV60tu11G0uGFi+HRm6VWRFiiotgHws8p5eyNsqFk=;
        b=BsorEK0aKiNYi+wt/CBvsXRVzAmCtdeGc3wFWWPGyTVx+NryPhzaDd6CPeuZ+V09/8
         YawWlnBxnlIcU/rmq7s1nx2pW6n4ps/vyY3D+yXPa0TI2uCjDx1Dc+0aE+/N81SukrLe
         lhXFd43XBoeosdr41v76/HnlFIHPd1WwX6QA5iUH6rBP6aVtG4BRc9bjFVbegqjzr780
         uB5S47bYxNUXIw5Or8G07/u666EGmDa56ZWQ5900Yoz+p0K9ncs+ZzmP4gFWmFKaDU+8
         NwOhu03d2Bh6BZe/LqaNnyiZmnUPFZAI/QJzbNCBcwHzefgpZBtaxW3bqtGCR0Srn1AK
         +aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319542; x=1791924342;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5oV60tu11G0uGFi+HRm6VWRFiiotgHws8p5eyNsqFk=;
        b=ocIpQG8SDdtZIgehCCdLga9vcN0Pm7qJg7zd4e/k+G8RVhT+vhV5aOiZA8Xa1Ree2X
         n3+6Da0mIpcAExU+DNXLOwawN0TNfenaA3hGaN5kARmuziED2qqVJCdqp4JGOI1yc03W
         GQxgv3+RcbreDJdlPZtuAohK+Mz5buMoCmOszqEg2sWUMCUilNKHpmy+c452AesRiyj7
         0dUUznCOYEGIsQskTmsXVYd9hU4ynVjdUe0bEaa0X979jK1wM1v4xyG5mffjrX7irtxr
         h2qnUwVGp+c53Px5OLG56eRt3jftyjo1AWRVvJ/ZS3QvlIGoau8i8b5O/Cdq+g+GFU61
         OSWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9j9Qx0JzG1rqCtj2eOfnWiWNfgmslMoP0Pr/zBVUHkwg+AhdG/dBTDWNKlYJ5JPLGIiBXfIJA2DlogWA=@vger.kernel.org
X-Gm-Message-State: AFuF++mUL5QHF1NSAm35noB8YRaIp0V406V4g8fKAAr9SRuri7nZkmbR
	V/ySVK8V8UxgpBEofvV6ol5rQZ4vwrlCPfZD7JjxBumkGIc10M+b/UtpIdjn9AG+OWLy1a6o4Ib
	87sT1Ww==
X-Gm-Gg: AYBFou3cgiG8+vEz+Wi8hjoygrQH/o5R54kZMqAMRWO4TAuGdfwehcVgMKm/R4i6BQR
	x1HRmYzhCbwwVQXa04iO+gd/I1yJO7xsYGV8CKDhCHjvq3k4t16eWsGc+kQoOlzixWIkG553b4b
	WhZL8C0ViBX9IKNAaqCITt2D/Plu/xRHp15EEoocu8OVf3WnYfeg3vaSMe2PuWqr5dhDZh+eI4b
	D6GtlANLLkCYqaBaOtWjxEYUI4RjhT1Jn1+0BQbd2DvB1aJgZnMzEoVR+Ex3z7lFhk0vSLW8QLG
	DBZYhMRqTtIaREiTuZUaake3z6CMBDUls9amkK8eWCDkiTusEQDRB/lI6ANpqOt/MC98giNb1to
	0o4ayoOOSfSoxTu6nDamiq5uvnV8s+++kMJDOeUMcu93F5zrIQJt+VDdLM4YCHGDUI11RXmRilE
	wVCN4Isl60+djKg/O9dD+9ef9wAhtDzlQtbInnebZ/swjTA96JDs0OXPLV4/nSD58kg5BlGXY=
X-Received: by 2002:ac8:570d:0:b0:535:2e3b:6885 with SMTP id d75a77b69052e-5357560d7eamr30491cf.48.1791319541733;
        Tue, 06 Oct 2026 13:45:41 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535721ec7b1sm4448851cf.30.2026.10.06.13.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:45:41 -0700 (PDT)
Date: Tue, 6 Oct 2026 16:45:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: PETER Mario <mario.peter@leica-geosystems.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] driver core: Take parent lock in async device attach
Message-ID: <db55e2bb-c2ec-4bcf-8cf6-39420449dd92@rowland.harvard.edu>
References: <20261006132335.4014316-1-mario.peter@leica-geosystems.com>
 <2026100658-stoic-unread-22c6@gregkh>
 <eb845da3-5799-4b0b-87d8-266ff57e84f3@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb845da3-5799-4b0b-87d8-266ff57e84f3@leica-geosystems.com>

On Tue, Oct 06, 2026 at 03:29:48PM +0000, PETER Mario wrote:
> Hi Greg,
> 
> On 10/6/26 16:38, Greg Kroah-Hartman wrote:
> 
> > On Tue, Oct 06, 2026 at 01:23:35PM +0000, Mario Peter wrote:
> >> On buses with need_parent_lock set (only USB), probe() must run with the
> >> parent device locked. A synchronous attach after device_add() gets this
> >> from the caller, e.g. usb_set_configuration() holds the udev lock while
> >> adding interfaces. __device_attach_async_helper() runs the probe from an
> >> async worker instead, where that lock isn't held, and only takes
> >> device_lock(dev).
> >>
> >> With async probing enabled for USB drivers (driver_async_probe=*,
> >> module.async_probe=1), hub_probe() of a multi-TT hub then races with
> >> usb_set_configuration() and both create the interface's endpoint
> >> devices. On an i.MX8MM board this hit 11 of 100 boots:
> >>
> >>   sysfs: cannot create duplicate filename '.../1-1/1-1:1.0/ep_81'
> >>   Call trace:
> >>    sysfs_warn_dup
> >>    usb_create_ep_devs
> >>    create_intf_ep_devs
> >>    usb_set_interface
> >>    hub_probe
> >>    usb_probe_interface
> >>    really_probe
> >>    __device_attach_async_helper
> >>    async_run_entry_fn
> >>
> >> Take the parent lock there as well, like __driver_attach_async_helper()
> >> does, and move __device_driver_lock/unlock() up for that. With this the
> >> warning was gone in 300 boots.
> >>
> >> Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for drivers")
> >> Assisted-by: LLM
> >> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> >> ---
> >> Seen and tested on 6.16.y, which has the same code here. On mainline
> >> only build-tested.
> > 
> > Please verify this on the latest tree, 6.16.y is _VERY_ old and
> > obsolete, lots has changed in the year it was released.
> 
> Moving this board to the latest kernel for a test isn't that easy, as
> its board support isn't upstream.

It should be fairly simple to run the verification on a standard PC 
using an up-to-date kernel.  Nothing in the bug description or fix is 
specific to i.MX8MM.

> But the affected code is still the
> same in v7.3-rc6. In dd.c, __device_attach_async_helper(),
> __device_attach() and __driver_attach_async_helper() are unchanged
> since v6.16. On the USB side, usb_set_interface() and
> create_intf_ep_devs() are unchanged, and usb_set_configuration() and
> hub_configure() only got the kmalloc_obj() conversions.
> 
> >> Not covered: deferred_probe_work_func() also re-probes via
> >> __device_attach() without the parent lock.
> >>
> >> Analysis and patch done with the help of Claude Code.
> > 
> > This feels really wrong, what bus is the host controller on for these?
> 
> The platform bus, it's the ChipIdea controller of the i.MX8MM:
>    /sys/devices/platform/soc@0/32c00000.bus/32e50000.usb/ci_hdrc.1/usb1/1-1/1-1:1.0
> 
> 1-1 is an onboard USB2514 hub (multi-TT). The host controller isn't

Does the fact that the onboard hub is multi-TT have any connection with 
the bug?  Not as far as I can see -- but I had to waste a minute 
thinking about it.  If you agree, please remove that irrelevant detail 
from the patch description.

> part of the race, both sides are in the USB core, for that one hub:
>   
> - usb_generic_driver_probe() of 1-1 calls usb_set_configuration(),
>   which holds the 1-1 lock, does device_add() for 1-1:1.0 and then
>   create_intf_ep_devs() for it.
>      
> - device_add() only queues the probe of 1-1:1.0. The async worker runs
>   hub_probe() -> usb_set_interface(hdev, 0, 1) -> create_intf_ep_devs()
>   with only the 1-1:1.0 lock held.
>      
> create_intf_ep_devs() checks and sets intf->ep_devs_created without a
> lock of its own, so both create ep_81. With a synchronous probe,
> hub_probe() runs inside device_add() with the 1-1 lock held, and this
> can't happen.

You should describe this race in more detail (like you just did here) in 
the patch description.  It will help explain exactly what it is you are 
fixing.

> The USB core relies on that lock. need_parent_lock is documented as
> "When probing or removing a device on this bus, the device core should
> lock the device's parent", and usb_driver_claim_interface() says
> "Callers must own the device lock, so driver probe() entries don't need
> extra locking". __driver_attach_async_helper() takes the parent lock,
> __device_attach_async_helper() doesn't.

FWIW, I agree that this is a real bug and your solution is the right 
approach for fixing it.

Alan Stern
