Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4981E7C02;
	Fri,  2 Oct 2026 00:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790901977; cv=none; b=ulhLs7vJmmWW3f6c3QRwlQ5/NsLJt04aYBKrj7ZXWUYnLJI+qT1t5GOPh3aeZRQiVXkAvVsjS4hm4K5w474MHGSegvv3LlgegwWWhOjHlCGqaqp0S0ZjzwiU8n/8FZiKLNqETw2xikEaPWhcFu2/yzAipp26EFrooFCG6Wnneuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790901977; c=relaxed/simple;
	bh=PcC4+i1BIA7mLgzrrNBlxDVyVOgE349YKMBe02sPNW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKLVQUZ7fkQp+CI/oN7/3nDk7SbmmaaMNqkHJ8bblz/im0W0x1+HKx/L/b1uBNGgxGEhg2vgoNRHOIebmKzEX3siAotETIT19aLOYhnqIWK0a4N+CCLRu5wQW19YVuEJQclL56GSAP4xw3TXLwBKrg5gAYn9lfgI5UH5EyWOu2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YefgREo1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YefgREo1"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DBB3929;
	Fri,  2 Oct 2026 02:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790901861;
	bh=PcC4+i1BIA7mLgzrrNBlxDVyVOgE349YKMBe02sPNW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YefgREo1PTGia+9aO8smHAmVvpXJfyGJ0VXvSMDndPKP7wHMAu8u0RiTPuAbVIyeh
	 qEuHoM/cNAygh5mt9DlA/B6CIjd7qSb1IxBA5c3u3fKKlsKZHwKR1ttq0gqxrBUpjc
	 xxvg8S1lbnFr23xFzjc8Br35hx3dPNgxw9kvhuOI=
Date: Fri, 2 Oct 2026 03:46:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Remove unused active field
Message-ID: <20261002004613.GB33700@killaraus.ideasonboard.com>
References: <20260630-uvc-remove-active-v1-1-ed1421b99429@chromium.org>
 <20260630104039.GB3199975@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630104039.GB3199975@killaraus.ideasonboard.com>

On Tue, Jun 30, 2026 at 01:40:39PM +0300, Laurent Pinchart wrote:
> On Tue, Jun 30, 2026 at 10:28:50AM +0000, Ricardo Ribalda wrote:
> > The active field in struct uvc_streaming is not used anymore, drop it.
> 
> Easy one, I like that :-)
> 
> > Reported-by: Hans de Goede <hansg@kernel.org>
> > Closes: https://lore.kernel.org/linux-media/20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org/T/#m3078f0d5fd71435b5cfacaa5c99f23a446db581f
> > Fixes: c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop helpers")

CI has flagged that this requires a Cc: stable. As I don't think there's
a need to backport this, I'll drop the Fixes tag.

> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 2 --
> >  drivers/media/usb/uvc/uvcvideo.h  | 1 -
> >  2 files changed, 3 deletions(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index fc3536a4399f..0167f0f8e846 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -2229,8 +2229,6 @@ int uvc_video_init(struct uvc_streaming *stream)
> >  		return -EINVAL;
> >  	}
> >  
> > -	atomic_set(&stream->active, 0);
> > -
> >  	/*
> >  	 * Alternate setting 0 should be the default, yet the XBox Live Vision
> >  	 * Cam (and possibly other devices) crash or otherwise misbehave if
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index b6bcee4a222f..021fd9af78b5 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -456,7 +456,6 @@ struct uvc_streaming {
> >  	struct list_head list;
> >  	struct uvc_device *dev;
> >  	struct uvc_video_chain *chain;
> > -	atomic_t active;
> >  
> >  	struct usb_interface *intf;
> >  	int intfnum;
> > 
> > ---
> > base-commit: 253355887a1ab0ac8f33b356c7c1140eee554d18
> > change-id: 20260630-uvc-remove-active-8843181bcbb4

-- 
Regards,

Laurent Pinchart
