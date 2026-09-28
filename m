Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BFB288C81;
	Mon, 28 Sep 2026 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601851; cv=none; b=aVe5mjfVDkCpDZ6A8AaYdYl4k+pYsKuyXGbtTpqWqtft0VJPk9NgQZlMKvnorai9RbH4mGa87cqQGrvWJDwaK9p/F3l0l/VZ3EX+DSaqp4HsaFM7n1gESXMYkXB8rvBAvmSyrFXl0tKGoAVzIQuojQ0vaV1gTti3nCiQmI97YHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601851; c=relaxed/simple;
	bh=2/XiGhnOmAJot0tmxV/EjNScCzZCP2/aJWLF7Gkwr4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNrvfai39PwKSLLIhXrI2kagxr+71RttG0f4IcRpeBYH+J3LUc89Vb3ynZWoSiKSbdUqqddFVmdPFonHI7jb6z2PQ5OzDZnusVwgV+Uw3Q7OIwVzgBwGj3/RzGLWAsSo/bkRZVY1ScczEq14+DucSYxdcT8aWyGGGHzSGcb77Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ph6BzAZ2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ph6BzAZ2"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56F55B07;
	Mon, 28 Sep 2026 15:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790601738;
	bh=2/XiGhnOmAJot0tmxV/EjNScCzZCP2/aJWLF7Gkwr4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ph6BzAZ2HvdKy/rGdS2CQjxZyXXVuYg4J7myCZUAIxsNlMSU1PFCgr/+EYKiz+I85
	 bglpTP8IT18QBTVrBomhHRT+cH8+5L7y1sjLOXdULFI18JzB8x5JxXGALq2WyKN9nn
	 rep5Y6jtocl/IPMAMrUGzfh+h1MS52Yr2eF5e8bc=
Date: Mon, 28 Sep 2026 16:24:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Kean Ren <rh_king@163.com>, linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera
 (30c9:0122)
Message-ID: <20260928132407.GG4406@killaraus.ideasonboard.com>
References: <20260903081145.8382-1-rh_king@163.com>
 <CANiDSCsqZzFY+KMKGBg06vm6rGR4FMy63hd0HShiHfb+vpqyqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsqZzFY+KMKGBg06vm6rGR4FMy63hd0HShiHfb+vpqyqg@mail.gmail.com>

On Fri, Sep 04, 2026 at 11:15:15AM +0200, Ricardo Ribalda wrote:
> On Thu, 3 Sept 2026 at 10:58, Kean Ren <rh_king@163.com> wrote:
> >
> > The device binds cleanly but delivers no image data; USB autosuspend is
> > suspending the streaming endpoint. Disable autosuspend for it.
> >
> > Issue found on Lenovo ThinkPad X13 (codename Zelda, Intel); confirmed
> > working with this quirk.
> >
> Link: https://lore.kernel.org/linux-media/20260904090751.1814783-1-rh_king@163.com/T/#mf5306ef689ce38ed331a3098272cb0ac2588ed79

When linking to the original thread on lore, the patch.msgid.link domain
is preferred (see Documentation/process/maintainer-tip.rst). That would
be

Link: https://patch.msgid.link/linux-media/20260904090751.1814783-1-rh_king@163.com/

Did you mean to specifically link to the descriptors though ? As they're
in the same mail thread, I think the link to the patch itself should be
enough. Do you prefer otherwise ?

> > Tested-by: Kean Ren <rh_king@163.com>
> 
> nit: I think we do not usually add the Tested-by: tag for authors. We
> expect that it has been tested :)

Maybe we shouldn't :-) We merge plenty of code that hasn't been tested
by the author, a prime example being API refactoring. Actually, reading
Documentation/, I can't see anything that explicitly approves or forbids
a Tested-by tag from the author.

This being said, for driver patches like these I would certainly expect
the author to have tested the change.

> > Signed-off-by: Kean Ren <rh_king@163.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index e289cc71ba98..32bf353013a1 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -3216,6 +3216,15 @@ static const struct usb_device_id uvc_ids[] = {
> >           .bInterfaceSubClass   = 1,
> >           .bInterfaceProtocol   = 0,
> >           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> > +       /* Luxvisions Innotech Integrated RGB Camera (Lenovo laptops) */
> > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > +         .idVendor             = 0x30c9,
> > +         .idProduct            = 0x0122,
> > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   = 1,
> > +         .bInterfaceProtocol   = 0,
> > +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> 
> The quirks are sorted by vid:pid. Sorry I did not notice this before.

I can handle this when applying.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >         /* Intel Realsense D435i depth camera */
> >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,

-- 
Regards,

Laurent Pinchart
