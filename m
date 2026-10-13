Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E695E42A168;
	Tue, 13 Oct 2026 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886939; cv=none; b=SnSsgt0G17W+qWQ/YxAzwfVqksPzvA3hNrGmKl1zLWgBKC4xWhowa20LDjANozr/b0r+NBi/FioBw76JR9Jo7vDtrWkH2g2B+w8/+0ccA8hR5y1WGXDz52rRvLO8Ol5HC6UxUKcxgp6k4BUPN97mU1s2TedWRA7N0cVWZU+jGIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886939; c=relaxed/simple;
	bh=aMS1BB0d/MNWHgqS5KZM6ST02OqDxPSjyy0t3fLAf/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTl7gJMqyB3tNzM2QtUhg+jErwht38GZA3uFUT/NLwQmSfngrqjSYmotie9FcjFt32MhMUJSDId3qcYmK6YsJyQumXDMnGapksQHurFj8v4IdB9SI+7RYaleALBMj+3sNgwLf7hsZ17jS6CrcwO2DsDPRruHp4/1vL+An6d92vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZTcjG8w5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZTcjG8w5"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C33491E4;
	Tue, 13 Oct 2026 12:20:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791886813;
	bh=aMS1BB0d/MNWHgqS5KZM6ST02OqDxPSjyy0t3fLAf/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTcjG8w5r2GzjJpMdjTohODbP9Q2Vcjjjs7PZ7KqQaozelNKf1x08nOKWtwj8hZgu
	 23dEQ3CFASe+fZFf2nJVKUan99lgDDusSLOHw3ikg1KjhA+AOTnNhbMAEleTGoaDzg
	 dnu9VdnSrf5upghqIjwExHesssmrvWXFi03hmKQM=
Date: Tue, 13 Oct 2026 12:21:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Louis Clinckx <clinckx.louis@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: skip bulk output URBs smaller than the
 payload header
Message-ID: <20261013102152.GF56180@killaraus.ideasonboard.com>
References: <20261013065335.2246959-1-clinckx.louis@gmail.com>
 <CANiDSCujghpaqP64tWnObOTMUmNTdQp3-6yb2C2MrOC9=48a4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCujghpaqP64tWnObOTMUmNTdQp3-6yb2C2MrOC9=48a4w@mail.gmail.com>

On Tue, Oct 13, 2026 at 05:53:55PM +0800, Ricardo Ribalda wrote:
> HI Louis
> 
> Thanks for your patch
> 
> On Tue, 13 Oct 2026 at 14:56, Louis Clinckx <clinckx.louis@gmail.com> wrote:
> >
> > For a bulk video output stream, uvc_video_encode_bulk() starts each
> > payload by writing a fixed 2-byte header with uvc_video_encode_header()
> > and subtracts it from a signed length counter initialised to the URB
> > size:
> 
> Out of curiosity, do you have a UVC output device? I would really like
> to test one out, but I could not find anything on the market.
> 
> >
> >         int len = stream->urb_size;
> >         ...
> >         len -= uvc_video_encode_header(...);    /* always returns 2 */
> >
> > An output device can describe a bulk endpoint with wMaxPacketSize 1 and
> > negotiate dwMaxPayloadTransferSize 1, which leaves stream->urb_size == 1.
> > len then becomes -1, and uvc_video_encode_data() casts it to unsigned:
> >
> >         nbytes = min((unsigned int)len, buf->bytesused - queue->buf_used);
> >
> > so (unsigned)-1 does not clamp and the following memcpy() copies the
> > whole frame past the one-byte URB buffer.
> >
> > A URB that cannot hold the 2-byte header cannot carry a payload, so skip
> > it instead of letting the length underflow.
> >
> > Signed-off-by: Louis Clinckx <clinckx.louis@gmail.com>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1701,7 +1701,14 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
> >         if (buf == NULL) {
> >                 urb->transfer_buffer_length = 0;
> >                 return;
> >         }
> >
> > +       /* The 2-byte payload header must fit; a smaller URB would make len
> > +        * underflow and uvc_video_encode_data() copy past the buffer. */
> > +       if (len < 2) {
> > +               urb->transfer_buffer_length = 0;
> > +               return;
> > +       }
> > +
> >         /* If the URB is the first of its payload, add the header. */
> >         if (stream->bulk.header_size == 0) {
>
> I'd also detect that the configuration is broken, maybe in
> uvc_init_video_bulk() ?

There's indeed no point in silently and unconditionally failing to
encode data when the issue can be detected when starting the stream (or
even better, at probe time). Thisis what the next version should do.

> and a bit nitpick. I think this is slightly more idiomatic than your check.
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c
> b/drivers/media/usb/uvc/uvc_video.c
> index ec76595f3c4b..03940b62b250 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1373,6 +1373,8 @@ static void uvc_video_decode_end(struct uvc_streaming *stream,
>  static int uvc_video_encode_header(struct uvc_streaming *stream,
>                 struct uvc_buffer *buf, u8 *data, int len)
>  {
> +       if (len < 2)
> +               return -ENOSPC;

If we reject invalid configurations this won't be necessary any more.

>         data[0] = 2;    /* Header length */
>         data[1] = UVC_STREAM_EOH | UVC_STREAM_EOF
>                 | (stream->last_fid & UVC_STREAM_FID);
> @@ -1656,6 +1658,10 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
>         /* If the URB is the first of its payload, add the header. */
>         if (stream->bulk.header_size == 0) {
>                 ret = uvc_video_encode_header(stream, buf, mem, len);
> +               if (ret < 0) {
> +                       urb->transfer_buffer_length = 0;
> +                       return;
> +               }
>                 stream->bulk.header_size = ret;
>                 stream->bulk.payload_size += ret;
>                 mem += ret;

-- 
Regards,

Laurent Pinchart
