Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793658673;
	b=Zfe0MgEf6Gl2Je75K3jrIfVLHmKlEO0NDJwb4zbcC/q/YG4o1C2a3iJ+bXe9xKFHPk70
	 e1J3Wz0yOIlJGNOPm9awL7Z3dmFIRf30ZeV3RyljoAy/ziw0iCCtupwt07hJMMPSGh64y
	 0Nq9XbG5PEjMCwYymEj1rSwzWwH6N5zprxJSED3UXEkpFjz5PScVC1El9sMyFE122xV8L
	 pO2IeIHk9+YbX2B4I056uxCOz+FcFv3c34hD4ZkQV3sio4VYTCj5sq3gyEGs74T9Y5E90
	 cKlq34XF8FIYDZdTbPskwTthPtYC3mtthf5O3Bv37evfzRYaHhwe61kQVo5TH4k2uSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793658673;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:From:To:Cc:Subject:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=R7Ti+POVYRmFiOdQ4Y4Uy7gHiOv2s91inTgNzA6dzJU=;
	b=djAzx4zFh9lGCNl415/iiMVJbaGOT4fdEtsVKscF+J0s3FJ5i2u6mf6cQjrEePYyiK65
	 NlupDhz03rzEZSKt8rIELbLkwhyULz8n2PKl/AO2Wm4YcLNB2YNc3XQJzg3W/z/ON1VTp
	 j/3mE5A2ScjI5zUJila4LzBUnBGPfJFFglurdZ5asHe4L5Exo0ZXcoSRxw6XJAmLrfTDc
	 3gCA/JuPHPDQ0LTVvts4ePA+MLZLGmpSgAqX4Cve55fio3LiRio1Uba/t9hahiptGVseI
	 44FD9FUhs+zR9bo8MM0TVNTycn4Slvtv+PcajfQfdF7TR0QBpAJVZ/IH45AXaag2XSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=bCzx61Fv;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269AD606A329;
	Mon,  2 Nov 2026 22:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 269AD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=bCzx61Fv
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88416BA;
	Mon,  2 Nov 2026 23:28:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793658533;
	bh=qOsskXuotAXGitl2IFTjH5JfsMLu+PlNlN+J7/iF7Fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bCzx61FvJ+W3dH/5ACl5xwn+ZLOrZt0EPGX8rpk/H4fQ+tP7JYWQVBs9nvWKPkPND
	 CoR8vKa/kzJOQ+ih5Av48A0SvhOjE339KY12cGIdiOBZlO+i3HFrk6k2iygZXFTwgt
	 Oa4RHml0k2Bv2W8a8zqQJKE4KMjhBml6ZzSeEQ9Q=
Message-ID: <5ef6fa813a4f8d075a19b6a80abb0bbe@killaraus.ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Muhammad Waleed Badar <walid.badar@gmail.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 Muhammad Waleed Badar <walid.badar@gmail.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: uvcvideo: Handle payloads starting in the
 middle of a bulk URB
Date: Tue, 03 Nov 2026 00:31:06 +0200
In-Reply-To: <20261102220339.70218-1-walid.badar@gmail.com>
References: <20261025170220.42789-1-walid.badar@gmail.com>
 <20261102220339.70218-1-walid.badar@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hello,

This is an automated reply.

You have sent a patch or bug report that appears to have been generated
by an LLM. The commit message, code and/or problem description show
little to no real understanding of the issue and changes being proposed.

Such patches or reports require a large amount of work to handle. They
rely on maintainers to propose - and often even implement - a proper
design. The probability that the author will learn from the experience
to improve their future contributions is close to zero.

As a result, to make good use of maintainer time and keep the kernel
development process sustainable, your contribution has been rejected.

If you believe the change you proposed is important, take time to study
the problem, learn, and develop a solution without AI assistance.
Answering this e-mail or generating a new version of a patch by feeding
this reply to an LLM will only result in your e-mails being ignored.

Please note that if your patch attempted to address an important
problem, maintainers or other contributors can submit and merge a
similar or entirely different fix without crediting you.

Your contributions to the Linux kernel will be welcome if you genuinely
desire to invest your time and learn.

Thank you,

Laurent's mail bot

On Tue, 03 Nov 2026 03:03:36 +0500, Muhammad Waleed Badar <walid.badar@gmail.=
com> wrote:
> The bulk decoder assumes that every payload starts at the beginning of
> a URB. It detects the end of a payload either by a short URB or by the
> accumulated payload size reaching dwMaxPayloadTransferSize, and then
> decodes the start of the next URB as a new payload header.
>=20
> The Realtek USB Camera (0bda:579f) integrated in Razer Blade laptops
> sends payloads of dwMaxPayloadTransferSize bytes back to back without
> aligning them to URB boundaries, which is not compliant with the UVC
> specification. When a frame spans more than one payload, the next
> payload header lands in the middle of a URB. The driver then copies
> that header and the data that follows into the current frame, and
> parses frame data at the start of the next URB as a header. This shows
> up as "Marking buffer as bad (error bit set)" and "Dropping payload
> (out of sync)" trace messages, and most frames larger than one payload
> are returned empty or truncated. On this camera every MJPEG mode above
> 1280x720 is affected.
>=20
> Add a UVC_QUIRK_BULK_UNALIGNED_PAYLOAD quirk for this device. When it
> is set and a payload ends in the middle of a URB, split the URB at the
> payload boundary and decode the remainder as a new payload, provided
> that it looks like a payload header (EOH bit set and a header length
> that fits the data and covers the announced PTS and SCR fields).
> Otherwise the URB is processed as before. Print a non compliance
> warning once when the workaround is used.
>=20
> The quirk is limited to this device, and the header check is kept as a
> safeguard, because other non compliant bulk devices append trailer
> data to their payloads, and decoding that data as a payload header
> would break them. Devices without the quirk are unaffected. The quirk
> can be enabled for other devices with the quirks module parameter.
>=20
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D207045
> Assisted-by: Claude:claude-opus-5.5
> Signed-off-by: Muhammad Waleed Badar <walid.badar@gmail.com>
> ---
> Changes in v3:
> - Align the continuation line of the uvc_video_decode_bulk() declaration
>   with the open parenthesis, as reported by the Media CI checkpatch run.
> - Link to v2: https://lore.kernel.org/r/20261025170220.42789-1-walid.badar@=
gmail.com
>=20
> Changes in v2:
> - Limit the workaround to the Realtek 0bda:579f camera through a new
>   UVC_QUIRK_BULK_UNALIGNED_PAYLOAD quirk (Hans de Goede).
> - Only split a URB when the remainder looks like a valid payload header,
>   so devices that append trailer data are not affected, and print a
>   non-compliance warning once (Ricardo Ribalda).
> - Link to v1: https://lore.kernel.org/r/20261009165248.56440-1-walid.badar@=
gmail.com
>=20
>  drivers/media/usb/uvc/uvc_driver.c |  9 +++
>  drivers/media/usb/uvc/uvc_video.c  | 95 +++++++++++++++++++++++++-----
>  drivers/media/usb/uvc/uvcvideo.h   |  2 +
>  3 files changed, 90 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc=
_driver.c
> index e289cc71b..cfdcfd96a 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2887,6 +2887,15 @@ static const struct usb_device_id uvc_ids[] =3D {
>  	  .bInterfaceSubClass	=3D 1,
>  	  .bInterfaceProtocol	=3D 0,
>  	  .driver_info		=3D (kernel_ulong_t)&uvc_quirk_probe_minmax },
> +	/* Realtek USB Camera (Razer Blade) */
> +	{ .match_flags		=3D USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		=3D 0x0bda,
> +	  .idProduct		=3D 0x579f,
> +	  .bInterfaceClass	=3D USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	=3D 1,
> +	  .bInterfaceProtocol	=3D 0,
> +	  .driver_info		=3D UVC_INFO_QUIRK(UVC_QUIRK_BULK_UNALIGNED_PAYLOAD) },
>  	/* Sonix Technology Co. Ltd. - 292A IPC AR0330 */
>  	{ .match_flags		=3D USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_=
video.c
> index fc3536a43..8a1e4bc77 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1612,27 +1612,20 @@ static void uvc_video_decode_isoc(struct uvc_urb *u=
vc_urb,
>  	}
>  }
> =20
> -static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
> -			struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
> +static void uvc_video_decode_bulk_chunk(struct uvc_urb *uvc_urb,
> +					struct uvc_buffer **bufp,
> +					struct uvc_buffer **meta_bufp,
> +					u8 *mem, int len, bool short_urb)
>  {
> -	struct urb *urb =3D uvc_urb->urb;
>  	struct uvc_streaming *stream =3D uvc_urb->stream;
> -	u8 *mem;
> -	int len, ret;
> -
> -	/*
> -	 * Ignore ZLPs if they're not part of a frame, otherwise process them
> -	 * to trigger the end of payload detection.
> -	 */
> -	if (urb->actual_length =3D=3D 0 && stream->bulk.header_size =3D=3D 0)
> -		return;
> +	struct uvc_buffer *buf =3D *bufp;
> +	struct uvc_buffer *meta_buf =3D *meta_bufp;
> +	int ret;
> =20
> -	mem =3D urb->transfer_buffer;
> -	len =3D urb->actual_length;
>  	stream->bulk.payload_size +=3D len;
> =20
>  	/*
> -	 * If the URB is the first of its payload, decode and save the
> +	 * If the chunk is the first of its payload, decode and save the
>  	 * header.
>  	 */
>  	if (stream->bulk.header_size =3D=3D 0 && !stream->bulk.skip_payload) {
> @@ -1671,7 +1664,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc=
_urb,
>  	 * Detect the payload end by a URB smaller than the maximum size (or
>  	 * a payload size equal to the maximum) and process the header again.
>  	 */
> -	if (urb->actual_length < urb->transfer_buffer_length ||
> +	if (short_urb ||
>  	    stream->bulk.payload_size >=3D stream->bulk.max_payload_size) {
>  		if (!stream->bulk.skip_payload && buf !=3D NULL) {
>  			uvc_video_decode_end(stream, buf, stream->bulk.header,
> @@ -1684,6 +1677,76 @@ static void uvc_video_decode_bulk(struct uvc_urb *uv=
c_urb,
>  		stream->bulk.skip_payload =3D 0;
>  		stream->bulk.payload_size =3D 0;
>  	}
> +
> +	*bufp =3D buf;
> +	*meta_bufp =3D meta_buf;
> +}
> +
> +/*
> + * Check whether data looks like the start of a payload: a header with the
> + * EOH bit set, and a length that fits in the data and is large enough for
> + * the PTS and SCR fields it announces.
> + */
> +static bool uvc_video_bulk_is_header(const u8 *data, int len)
> +{
> +	unsigned int min_len =3D 2;
> +
> +	if (len < 2 || !(data[1] & UVC_STREAM_EOH))
> +		return false;
> +
> +	if (data[1] & UVC_STREAM_PTS)
> +		min_len +=3D 4;
> +	if (data[1] & UVC_STREAM_SCR)
> +		min_len +=3D 6;
> +
> +	return data[0] >=3D min_len && data[0] <=3D len;
> +}
> +
> +static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
> +				  struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
> +{
> +	struct urb *urb =3D uvc_urb->urb;
> +	struct uvc_streaming *stream =3D uvc_urb->stream;
> +	bool short_urb =3D urb->actual_length < urb->transfer_buffer_length;
> +	u8 *mem;
> +	int len;
> +
> +	/*
> +	 * Ignore ZLPs if they're not part of a frame, otherwise process them
> +	 * to trigger the end of payload detection.
> +	 */
> +	if (urb->actual_length =3D=3D 0 && stream->bulk.header_size =3D=3D 0)
> +		return;
> +
> +	mem =3D urb->transfer_buffer;
> +	len =3D urb->actual_length;
> +
> +	do {
> +		int chunk =3D len;
> +		int rem =3D stream->bulk.max_payload_size -
> +			  stream->bulk.payload_size;
> +
> +		/*
> +		 * Some devices (such as the Realtek 0bda:579f) start the next
> +		 * payload immediately after the previous one instead of in a
> +		 * new URB, so a payload boundary can fall in the middle of a
> +		 * URB. For those, split the URB at the payload boundary if
> +		 * the data that follows looks like a payload header. Other
> +		 * devices may append trailer data to a payload, which must
> +		 * not be decoded as a header, so leave them alone.
> +		 */
> +		if ((stream->dev->quirks & UVC_QUIRK_BULK_UNALIGNED_PAYLOAD) &&
> +		    len > rem && uvc_video_bulk_is_header(mem + rem, len - rem)) {
> +			uvc_warn_once(stream->dev, UVC_WARN_BULK_UNALIGNED,
> +				      "UVC non compliance - bulk payload starts in the middle of a URB=
. Enabling workaround.\n");
> +			chunk =3D rem;
> +		}
> +
> +		uvc_video_decode_bulk_chunk(uvc_urb, &buf, &meta_buf, mem,
> +					    chunk, short_urb && chunk =3D=3D len);
> +		mem +=3D chunk;
> +		len -=3D chunk;
> +	} while (len > 0);
>  }
> =20
>  static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvi=
deo.h
> index b6bcee4a2..59ad516ae 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -81,6 +81,7 @@
>  #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
>  #define UVC_QUIRK_MSXU_META		0x00040000
> +#define UVC_QUIRK_BULK_UNALIGNED_PAYLOAD	0x00080000
> =20
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001
> @@ -661,6 +662,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *fil=
p)
>  #define UVC_WARN_MINMAX		0
>  #define UVC_WARN_PROBE_DEF	1
>  #define UVC_WARN_XU_GET_RES	2
> +#define UVC_WARN_BULK_UNALIGNED	3
> =20
>  extern unsigned int uvc_clock_param;
>  extern unsigned int uvc_no_drop_param;
