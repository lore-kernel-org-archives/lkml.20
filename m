Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424823B47F1;
	Mon, 28 Sep 2026 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621459; cv=none; b=F0ZXGelB4w1cKyzuwzyPL/TXqz2emrd5eXy85CGuH+/FIUambHOt9z/xrdQW6QidtpR2pxrWWNwYT5hjD7Y6gmy5G/yjeRHRZZEqg4f0YahTiD3r36/Hgsqx9XzoLw8WfbJjkZqGYdbncggJfQVg/pEvNNjS5uxOXBpTbmRWDOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621459; c=relaxed/simple;
	bh=iFYpdYAHK6h8qOv0hPW1rsulAkmtdV2c0j/owvfdhVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+kaBN9XiDuK1KuW0FmfPK1ojOQ0n6IXukoBQqzGe4Tipf/gVQUHc92Y/piibDX69Jbd6lsVga+VJicAhZALxBwrbOgZGeHsRCbjNYcN9+qIQPWNbiWOIByhg2aFkncRrZr6Ml/tKYx76a8b3rYgp0AzJUHt9b9Xsmn1p0Nn8l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rhraeJks; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rhraeJks"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B60A98FD;
	Mon, 28 Sep 2026 20:48:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790621338;
	bh=iFYpdYAHK6h8qOv0hPW1rsulAkmtdV2c0j/owvfdhVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhraeJksBfl1tcrfAKPAExKZMkNpzXmlAElFHU5nz37neRKYLNWPj3U/sI4oiMseT
	 sqmtXDxSnZdr5RpducOSVTx39fKiaQJDE7v8s1a8sEQgMLL8JbMYhYGasGIkAVg/MI
	 /ZXQBgx74/pZjR8197DtHudiDMS38qEagzuik6Zw=
Date: Mon, 28 Sep 2026 21:50:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Kean Ren <rh_king@163.com>, linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera
 (30c9:0122)
Message-ID: <20260928185048.GG210522@killaraus.ideasonboard.com>
References: <20260903081145.8382-1-rh_king@163.com>
 <CANiDSCsqZzFY+KMKGBg06vm6rGR4FMy63hd0HShiHfb+vpqyqg@mail.gmail.com>
 <20260928132407.GG4406@killaraus.ideasonboard.com>
 <CANiDSCt8kntjSh4TWFb4N-DxwEpsbqtUUTtNJ-hOuGRofz791A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCt8kntjSh4TWFb4N-DxwEpsbqtUUTtNJ-hOuGRofz791A@mail.gmail.com>

On Mon, Sep 28, 2026 at 03:32:20PM +0200, Ricardo Ribalda wrote:
> On Mon, 28 Sept 2026 at 15:24, Laurent Pinchart wrote:
> > On Fri, Sep 04, 2026 at 11:15:15AM +0200, Ricardo Ribalda wrote:
> > > On Thu, 3 Sept 2026 at 10:58, Kean Ren <rh_king@163.com> wrote:
> > > >
> > > > The device binds cleanly but delivers no image data; USB autosuspend is
> > > > suspending the streaming endpoint. Disable autosuspend for it.
> > > >
> > > > Issue found on Lenovo ThinkPad X13 (codename Zelda, Intel); confirmed
> > > > working with this quirk.
> > > >
> > > Link: https://lore.kernel.org/linux-media/20260904090751.1814783-1-rh_king@163.com/T/#mf5306ef689ce38ed331a3098272cb0ac2588ed79
> >
> > When linking to the original thread on lore, the patch.msgid.link domain
> > is preferred (see Documentation/process/maintainer-tip.rst). That would
> > be
> >
> > Link: https://patch.msgid.link/linux-media/20260904090751.1814783-1-rh_king@163.com/
> >
> > Did you mean to specifically link to the descriptors though ? As they're
> > in the same mail thread, I think the link to the patch itself should be
> > enough. Do you prefer otherwise ?
> 
> I wanted to link the usb descriptors. I'd rather have them copy pasted
> in to the commit message or with a link to lore
> (For the usb descriptors I think the doc says that we have to use lore )

Do you mean for links other than the original patch series ? I don't
suppose the doc talks about USB descriptors explicitly :-)

> > > > Tested-by: Kean Ren <rh_king@163.com>
> > >
> > > nit: I think we do not usually add the Tested-by: tag for authors. We
> > > expect that it has been tested :)
> >
> > Maybe we shouldn't :-) We merge plenty of code that hasn't been tested
> > by the author, a prime example being API refactoring. Actually, reading
> > Documentation/, I can't see anything that explicitly approves or forbids
> > a Tested-by tag from the author.
> >
> > This being said, for driver patches like these I would certainly expect
> > the author to have tested the change.
> >
> > > > Signed-off-by: Kean Ren <rh_king@163.com>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index e289cc71ba98..32bf353013a1 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -3216,6 +3216,15 @@ static const struct usb_device_id uvc_ids[] = {
> > > >           .bInterfaceSubClass   = 1,
> > > >           .bInterfaceProtocol   = 0,
> > > >           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> > > > +       /* Luxvisions Innotech Integrated RGB Camera (Lenovo laptops) */
> > > > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > > +         .idVendor             = 0x30c9,
> > > > +         .idProduct            = 0x0122,
> > > > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > > > +         .bInterfaceSubClass   = 1,
> > > > +         .bInterfaceProtocol   = 0,
> > > > +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> > >
> > > The quirks are sorted by vid:pid. Sorry I did not notice this before.
> 
> Can we please add this to the CI? It is a bit of a waste of time to
> manually verify that they are properly sorted

It's a good idea.

> > I can handle this when applying.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > > >         /* Intel Realsense D435i depth camera */
> > > >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > >                                 | USB_DEVICE_ID_MATCH_INT_INFO,

-- 
Regards,

Laurent Pinchart
