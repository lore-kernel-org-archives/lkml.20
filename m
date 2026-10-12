Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5931F223328
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791770061; cv=none; b=ZJzACj5CfH1H5SgjyCstmzViZxZXZa9CXHI+41Jdn9CaQp7sMVga83ybAqhmXKJ7fRN0nTgLk3wpnlrg9FvQnEzF4+4WvdHRazlNL6X/SWZ08zgW/LgnlsAiJz/cIvWGYKlMxm1uL2f0TM2nsYkvuUom8QCbyJ9/TuTI5tFJ/Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791770061; c=relaxed/simple;
	bh=fuIFDJ09YT2y/gdrngPJBXsjaz5KcU6XyqRitxLnvns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLtKptPZbmz3hweOKg4FJmr80U31HYfejj1QKcIrFUm/tW2VLKrYbojNhDxK3TA0Riw5twfmfCBAmGQvwVl+0UcPUzRqOnP2e0cyseJBMzjRVQjS44xpQjR1R9jRgdcvuGXB6B6vAX1tn4Qag7hXM1zoo6Lv7PRuAnFoqMQsUzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NuleTeF8; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NuleTeF8"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-88bc25fcd0eso1064269b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791770060; x=1792374860; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBRH9zb+DpmAXh0LEaeO6lRXEj5Ct3w3C8zKVqnBWE4=;
        b=NuleTeF8OE3wSGNaauE2nHPenvQlN9J/dCv7K01KY7RsVj1Q6ihfVVrVNXFVnYK5AX
         j72FyKA4YmPB/fFAuFQouS5n66/srM0GT1AuxB4POD1qxhz8krS5ESk27DPTJLHKmdod
         p89R7t0y1u/4Rkcd+ktQhtvr4mD6kRvYMHDnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791770060; x=1792374860;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TBRH9zb+DpmAXh0LEaeO6lRXEj5Ct3w3C8zKVqnBWE4=;
        b=OY/+Wzx4I1o5kC/M5GGOUz4h+U/rT1C9gr9koeQTgKfJn8oQBUF7MGj6oLe3q/i816
         jRgs8+NYVTjtxeIW3XJAQxcNZGSoKutRcnLjmbvRQbJ3n/oB9mcPZSBude6ugXobmpgb
         lZD6Ia4QmMtM4QIW3MRddn4TouTs7O6k4Uynpnq0LvRmOCwLsKm/OAT0yufdFVZhiWNB
         Rqvjw9jwotRLuAPgYmsE8WoejeDSDm1ejp9CsX7FWkVPrWvOyU9BjERdOSNXznVEPsdx
         drVWNxt1egiNkGN2f14NlcqICyIXa0au30frOlmvi8NTH4/K1y/EWT2VOsSn7pbmlAFV
         dl7w==
X-Forwarded-Encrypted: i=1; AKwUvBzGhA/4Hef+k2oCloznHw3q+pPRTiJ1fCjBodyJ5wYxqBZ10bxv9mAWJ3zS6tJclV3vcOlGihwHT0yOUI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLmKvJnkrH9AqqOK0HuQfaQV7/LebIEwXFvjuOcW5xVi9Q4qUb
	HKmgydTn8PIOA0O/pgtzy+WASwXyk7S0S7j4rxq1y4zi0RCSm8pGaaSsO4M1rs5GjYpBgpfZHqI
	jAtykwg==
X-Gm-Gg: AYBFou3BLdRJvUpJ97VkHqQAjXseaXf3H+VdiBUH7uKbJPzL/rKM0tQ0XtXrRcXmLQt
	qpf44Vsn25CNOa3xvSnyXyXGF96b6bv7jzw3D7FjQzbsBsL7d5EJVSAvTuMQfdEpZQkP65228LP
	I0iI54CPHkSkJAs2HAWomqovyASimF4IourVuDurASJIzQo9YVhOrnzgd/bncEaFV2CR0MOplX+
	H0AnFcFRbcRYNqQQUy4WO0zgvru9KIWbwrkgWzF+xlIq+x6aam5DGGer6VUEzWiHuvcbqOwma9J
	z587rIiIth7iZLw7T5WsGbe2OVP3TAfWut7gos3fmh1ley5S3TJ3edokctMmcAKqhlAYzrsvnRB
	usWfmk9BuCcDsaRowC9rUi7C0qg9HlBtZawAKTD0cBi/MWIyvpYjXHWKoAN1yoMFXQtTUlqcxSz
	KA5TRnXiePbroPPxz5C3tQxSyuBLhksGSKIAa6bvOlV6tPPf6vbDhvs+013LzVfyNhmELvcn/cz
	Oaec+zWDm97qs0A9Cokbvhclmx2VjZnKOnyTlo=
X-Received: by 2002:a05:6a00:22c7:b0:882:89ee:a898 with SMTP id d2e1a72fcca58-897c7fc3b62mr7985582b3a.46.1791770059714;
        Sun, 11 Oct 2026 18:54:19 -0700 (PDT)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3ccc67asm3542715b3a.32.2026.10.11.18.54.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 18:54:19 -0700 (PDT)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so1702369eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:54:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1ciJx2VelCcIxQpVhKzm9etbOm4QOUv/kNY3AdfsZ2gh0Wb0YxiCQUo61o/uIWkm7Pz4zjhih8PyImgg=@vger.kernel.org
X-Received: by 2002:a05:7022:7f1b:b0:15b:722b:4bfc with SMTP id
 a92af1059eb24-16a6043ce08mr13693926c88.31.1791770057521; Sun, 11 Oct 2026
 18:54:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009165248.56440-1-walid.badar@gmail.com>
In-Reply-To: <20261009165248.56440-1-walid.badar@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 12 Oct 2026 03:54:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCtSo2nmbjzWC8CC3GAg2vsh-OBBW1-Skogb4tFpZ240-w@mail.gmail.com>
X-Gm-Features: AclHuK_S1QeR_jD5dyFFbqrBJmDHlUxppmKUPKoi59KTHhBZ-WyZFIAv6WQBKis
Message-ID: <CANiDSCtSo2nmbjzWC8CC3GAg2vsh-OBBW1-Skogb4tFpZ240-w@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Handle payloads starting in the middle
 of a bulk URB
To: Muhammad Waleed Badar <walid.badar@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Muhammad

I understand that this is a RFC. Let's focus on the problem before we
discuss the code.

Currently, both for isoc and bulk, if the camera appends some data at
the end of the frame (let's call it trailer data) it is silently
discarded. With your proposal, this trailer data will be considered
part of the next frame.

The trailer data is out of spec (check figure 2-12 of the spec), but
having multiple frames in the same bulk package is also out of spec
(For some reason the bulk cameras are the worst at following the spec,
no idea why).

Your proposal (again, not looking at the code yet), will fix the
problem for some of the broken cameras but ti will completely break
the driver for other family of broken cameras (the ones that have
trailer data).

If we want to automatically handle your family of broken cameras we should:

- Add heuristics to also handle the camera with trailer camera (does
the extra data look like a uvc header?)
- Add a non compliance warning so the vendors have some feedback about
their wrongness.

Regards!




On Sat, 10 Oct 2026 at 00:58, Muhammad Waleed Badar
<walid.badar@gmail.com> wrote:
>
> The bulk decoder assumes that every payload starts at the beginning of
> a URB. It detects the end of a payload either by a short URB or by the
> accumulated payload size reaching dwMaxPayloadTransferSize, and then
> decodes the start of the next URB as a new payload header.
>
> Some devices, such as the Realtek USB Camera (0bda:579f) integrated in
> Razer Blade laptops, send payloads of dwMaxPayloadTransferSize bytes
> back to back without aligning them to URB boundaries. When a frame
> spans more than one payload, the next payload header lands in the
> middle of a URB. The driver then copies that header and the data that
> follows into the current frame, and parses frame data at the start of
> the next URB as a header. This shows up as "Marking buffer as bad
> (error bit set)" and "Dropping payload (out of sync)" trace messages,
> and most frames larger than one payload are returned empty or
> truncated. On this camera every MJPEG mode above 1280x720 is affected.
>
> Fix it by splitting URBs at payload boundaries and decoding each part
> separately, so that a payload ending in the middle of a URB is
> completed and the remainder of the URB is decoded as a new payload.
> Devices whose payloads end on URB boundaries are unaffected, as the
> whole URB is then processed in a single iteration.
>
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=207045
> Assisted-by: LLM
> Signed-off-by: Muhammad Waleed Badar <walid.badar@gmail.com>
> ---
>
> Notes:
>     Tested on a Razer Blade with the integrated Realtek 0bda:579f camera
>     (bulk endpoint, wMaxPacketSize 512), on Fedora kernel 7.1.10 with the
>     patch applied to the matching uvcvideo sources. 150 MJPEG frames were
>     captured per mode with ffmpeg and checked for a valid JPEG EOI marker:
>
>       mode        before          after
>       1920x1080   25-36 valid     150 valid
>       1280x1024   37 valid        150 valid
>       1280x800    38 valid        148 valid
>       1280x720    150 valid       150 valid
>       640x480     150 valid       150 valid
>
>     GNOME Snapshot (PipeWire) no longer reports JPEG decode errors at
>     1920x1080. The patch also builds against 7.2.8. It has not been tested
>     on other bulk-mode UVC cameras.
>
>     The root cause analysis and the patch were produced with an AI coding
>     assistant (Claude Code) and reviewed by me.
>
>  drivers/media/usb/uvc/uvc_video.c | 70 ++++++++++++++++++++++++-------
>  1 file changed, 54 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index fc3536a43..fe1714ccc 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1612,27 +1612,20 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
>         }
>  }
>
> -static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
> -                       struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
> +static void uvc_video_decode_bulk_chunk(struct uvc_urb *uvc_urb,
> +                                       struct uvc_buffer **bufp,
> +                                       struct uvc_buffer **meta_bufp,
> +                                       u8 *mem, int len, bool short_urb)
>  {
> -       struct urb *urb = uvc_urb->urb;
>         struct uvc_streaming *stream = uvc_urb->stream;
> -       u8 *mem;
> -       int len, ret;
> -
> -       /*
> -        * Ignore ZLPs if they're not part of a frame, otherwise process them
> -        * to trigger the end of payload detection.
> -        */
> -       if (urb->actual_length == 0 && stream->bulk.header_size == 0)
> -               return;
> +       struct uvc_buffer *buf = *bufp;
> +       struct uvc_buffer *meta_buf = *meta_bufp;
> +       int ret;
>
> -       mem = urb->transfer_buffer;
> -       len = urb->actual_length;
>         stream->bulk.payload_size += len;
>
>         /*
> -        * If the URB is the first of its payload, decode and save the
> +        * If the chunk is the first of its payload, decode and save the
>          * header.
>          */
>         if (stream->bulk.header_size == 0 && !stream->bulk.skip_payload) {
> @@ -1671,7 +1664,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
>          * Detect the payload end by a URB smaller than the maximum size (or
>          * a payload size equal to the maximum) and process the header again.
>          */
> -       if (urb->actual_length < urb->transfer_buffer_length ||
> +       if (short_urb ||
>             stream->bulk.payload_size >= stream->bulk.max_payload_size) {
>                 if (!stream->bulk.skip_payload && buf != NULL) {
>                         uvc_video_decode_end(stream, buf, stream->bulk.header,
> @@ -1684,6 +1677,51 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
>                 stream->bulk.skip_payload = 0;
>                 stream->bulk.payload_size = 0;
>         }
> +
> +       *bufp = buf;
> +       *meta_bufp = meta_buf;
> +}
> +
> +static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
> +                       struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
> +{
> +       struct urb *urb = uvc_urb->urb;
> +       struct uvc_streaming *stream = uvc_urb->stream;
> +       bool short_urb = urb->actual_length < urb->transfer_buffer_length;
> +       u8 *mem;
> +       int len;
> +
> +       /*
> +        * Ignore ZLPs if they're not part of a frame, otherwise process them
> +        * to trigger the end of payload detection.
> +        */
> +       if (urb->actual_length == 0 && stream->bulk.header_size == 0)
> +               return;
> +
> +       mem = urb->transfer_buffer;
> +       len = urb->actual_length;
> +
> +       /*
> +        * Some devices (such as the Realtek 0bda:579f) start the next payload
> +        * immediately after the previous one instead of in a new URB, so a
> +        * payload boundary can fall in the middle of a URB. Split the URB at
> +        * payload boundaries and decode each piece separately.
> +        */
> +       do {
> +               int chunk = len;
> +
> +               if (stream->bulk.payload_size + chunk >
> +                   stream->bulk.max_payload_size)
> +                       chunk = stream->bulk.max_payload_size -
> +                               stream->bulk.payload_size;
> +               if (chunk <= 0)
> +                       chunk = len;
> +
> +               uvc_video_decode_bulk_chunk(uvc_urb, &buf, &meta_buf, mem,
> +                                           chunk, short_urb && chunk == len);
> +               mem += chunk;
> +               len -= chunk;
> +       } while (len > 0);
>  }
>
>  static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
> --
> 2.55.0
>
>


-- 
Ricardo Ribalda
