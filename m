Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2464156C6;
	Tue, 13 Oct 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895712; cv=none; b=cs/Or0PRTx96nhCHEryqgd/2l+h6Z4sYvOrFiJySGHx1eULZW7n2pG4z8DJ94bizzS99dHC/rvcM5VkrDfKSfvR8bcuS2mpQRa7m/YefQWBoxdh5+uK7GEvYkgbMjFExd0FGDcPhazKRAkSBznQEK1qjVv577MHmSK+GA7zV1oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895712; c=relaxed/simple;
	bh=KZbyAdoEtj+q8kvG2KiztH8H0vfcKsHRLXc8yY8N8l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzXoxHJ3gSL+r6XeKkvZ2RRfQBzMXgGzUfa3TDiqwL8Zbxi7OPjhRbSjVjnro4mRhtCffmqFOUiRssYcNbwtwF7ta+/SICVUY41sBwWAZo1K+ClrwFaNnsEmi3oKSoRdqam2BKCYDHofllk9ltCD+w3D8U0SWUg+K5MDIxi/4lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f+Al+W3M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f+Al+W3M"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C26F21E4;
	Tue, 13 Oct 2026 14:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791895588;
	bh=KZbyAdoEtj+q8kvG2KiztH8H0vfcKsHRLXc8yY8N8l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+Al+W3MiulmGSP55fmnP39zd7nCI/7ZDmwp+hCRtyCNWnrLUAfX7R2EpRDSSeTtl
	 cgQRn7EfuUwmReaV/njMfTzcmijQcitnYJYxCrjLF3ep/LehfBr9Dcp465UB5XKi9O
	 VynTFznoPX7ECN2JNSCDZECVgUoHuoqxm9GIT0Wc=
Date: Tue, 13 Oct 2026 14:48:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Louis Clinckx <clinckx.louis@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: reject bulk output payloads too
 small for the header
Message-ID: <20261013124817.GF4214@killaraus.ideasonboard.com>
References: <20261013103041.145445-1-clinckx.louis@gmail.com>
 <CANiDSCsT546cV8F4XiriArF9n-ESC0nFFQu7dzcjqO7iJfQj+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsT546cV8F4XiriArF9n-ESC0nFFQu7dzcjqO7iJfQj+w@mail.gmail.com>

On Tue, Oct 13, 2026 at 08:40:07PM +0800, Ricardo Ribalda wrote:
> On Tue, 13 Oct 2026 at 19:53, Louis Clinckx wrote:
> >
> > A bulk video output stream prefixes each payload with a fixed 2-byte
> > header written by uvc_video_encode_header(). The per-URB length counter
> > in uvc_video_encode_bulk() is a signed int initialised to the URB size:
> >
> >         int len = stream->urb_size;
> >         ...
> >         len -= uvc_video_encode_header(...);    /* returns 2 */
> >
> > An output device can describe a bulk endpoint with wMaxPacketSize 1 and
> > negotiate dwMaxPayloadTransferSize 1, leaving stream->urb_size == 1. len
> > then becomes -1, and uvc_video_encode_data() casts it to unsigned
> > (nbytes = min((unsigned int)len, ...)), so (unsigned)-1 defeats the
> > clamp and the following memcpy() copies the whole frame past the
> > one-byte URB buffer.
> >
> > Rather than guard the encode path, reject the invalid configuration when
> > the stream is started: the negotiated maximum payload transfer size must
> > be able to hold the 2-byte payload header. Requiring size >= 2 also
> > guarantees urb_size = psize * npackets >= 2, so the encode path can no
> > longer underflow.
> >
> > Signed-off-by: Louis Clinckx <clinckx.louis@gmail.com>
> > ---
> > v1 -> v2: per review (Ricardo Ribalda, Laurent Pinchart), reject the bad
> >           configuration at stream start in uvc_init_video_bulk() instead
> >           of adding a guard to the encode path. Can move the check to
> >           probe/commit (uvc_fixup_video_ctrl) if preferred.
> >
> >  drivers/media/usb/uvc/uvc_video.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1942,6 +1942,16 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
> >         size = stream->ctrl.dwMaxPayloadTransferSize;
> >         stream->bulk.max_payload_size = size;
> >
> > +       /*
> > +        * Output payloads start with a 2-byte header (see
> > +        * uvc_video_encode_header()), so a device negotiating a maximum
> > +        * payload transfer size smaller than that would make the encode
> > +        * path underflow its signed length counter. Reject it here.
> > +        */
> > +       if (stream->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
> > +           stream->bulk.max_payload_size < 2)
> > +               return -EINVAL;
> 
> nit: I'd replace the 2 with a #define and use it also in
> uvc_video_encode_header() for the return
> 
> And I know that Laurent said otherwise, but probably due to my rust
> intoxication, I still recommend applying the check that I recommended
> in the previous version.

Let's revisit that topic once the uvcvideo driver gets rewritten in rust
:-)

> It is pretty cheap. Otherwise If the size is
> not important, why do we pass it to uvc_video_encode_header()?

We can drop it.

> In fact I think that if usb_endpoint_maxp()==1 and
> stream->bulk.max_payload_size==2 with memory pressure your code could
> fails

The patch seems entirely wrong, checking max_payload_size only doesn't
make sense. And setting the limit to 2 also makes no sense, there would
be no space to encode any data.

> > +
> >         npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
> >         if (npackets == 0)
> >                 return -ENOMEM;
> >
> 
> ps: Sorry to repeat myself; this isn't related to accepting or not the
> patch... Do you have a usb bulk output "camera" . I want one for my
> collection :)

I doubt that. I've only seen one in the wild.

This patch started as a private LLM-generated security report. You can't
expect it to be tested on hardware, or even tested at all, and I have no
confidence that the author understands what they're doing.

-- 
Regards,

Laurent Pinchart
