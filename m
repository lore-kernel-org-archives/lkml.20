Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B591DF980
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895225; cv=none; b=Kk9MBa+7kpCV83MPoq26PMq0A+o+wvLjgulJntFMm2nLrExQQTNPJjr6G/60NkjiWuxmtGg3DY3MBbzxFJqGluYlU3AIcvNgylsHa5O7g7rvgB4Ccf93En06ZxuGY9H+ZUwgGKdT0uvBSmIYcsmOXeojHpSVenxf7ySmcki0YWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895225; c=relaxed/simple;
	bh=m57KIRJgsGLVC+8qu0NB/QkOahZKDItsSgJ6WcQKKO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgF47m4mCNK7eddZeQV8K4C9nr+YYPOG3ptlYwpwxxAPEGbw/nqTV+IQYfDL4oF8AYrmuIVG+MjwaBh0OpmI1X2BDhkDpxERpgUWxH6dozHRre5MIy384v/GGe0Hyi8Rn5MBy2l5SzcUjty4MY73PwFE1yPtoipDK1foAws+npM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SD1Ydzzw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SD1Ydzzw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e608cd460eso14842555ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791895224; x=1792500024; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltMnIOP2nOYvYd7LoZiQDXdhGDBwlJ2oi6mkT/rek5g=;
        b=SD1YdzzwDAZOamiig7kjq5wXuiHl9cbsxLdLfdOxIE9w1zBe/OX9GUKMRnmQQ5K+Ef
         QlfI6bBCaSKb0WaJ3PADS0moXvVdV0BzW0xKGdzUik+7DKvzfMWdpNktodRrphjtv31p
         exDOZO8jMuVTGBjrSOArVLdIV55PHOcwraZfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895224; x=1792500024;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ltMnIOP2nOYvYd7LoZiQDXdhGDBwlJ2oi6mkT/rek5g=;
        b=WgIgjQnX+HF95JgsXkU3haK4ah5USU9tr5X+S4oTAiVj+oUWLu7f17HCOVKlXwy4fU
         D4Zi3f6IfPR+dRdsLxYWUg/KyRBUThWFX7aFIuqmCwfQZXli3EcIwQhnxqJfidXRLvyM
         KqkCmn5KCuAWPjLbWB+pfa5hUCOX/xRxTX2WyTRwjtIy+8pQFI5d21yoPOXtAa2spfEx
         zYn9aTypfB4JJ0nsny/MKkdMSmlTm6z7D9nUgCZXzanAk58ym3Ihm0X3Hv/Ou4/sJeE8
         3X8FSN+dsgnNW+HdmA7dBRH3kt9opw+oDjmAENWZhz/6x/t7KwCK5B7QB5bxbglHNyAk
         x3Fg==
X-Forwarded-Encrypted: i=1; AKwUvBx2U3dZIGHeKQUTFxXZhutHCFlGgRMMf5kDBqjQEP0VlFdbqVUMawZ0nukW4KOMh0CrHJ64KpPIItjCFoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeIA8GSZthxzpVr/x8dfmtL1rORdf30OdJbYoZE66GbR3QqFdh
	tmKaF0aYbruEYHZLTYREugC5fL0Ba/0RPKCy+aU8KJvYM6TXH+86ot5DA9R1jZtJdpkZqynSt5N
	4vClZoQ==
X-Gm-Gg: AYBFou0xZqWuyU7ZaMP4qk38wTj2c2VsW5onqfJaBhpnov86zkOkRiA4QROW43HMKLn
	Am+XbiKS39Ly42ceQ1ZoADTpbsVfWfZa63GptsRM0kFYOBgSmMfqBPBRIw+AFJ2mBbCFGhSYCOk
	9awHnP4yh5+HzAZR9Q8OOPWk6Eb+CpgyV3Z9kUzuy8DRTufceJAV1/szo5FH6ozc0cNPFkmbq52
	UiWtMqFwrmKrcvRoBrmjJq7OKHTWaXIyJBiuPXHaETykMvN0p9tNaZ8nCqTS8nCEhxRPcDBY8c9
	wT6A1kOtfE1FDdZkVBLm2Pwgvpk6GhzfqAvoBWDRJCjIlL438RX7XkQk72A+aeYRNG8wn5TaMnF
	OqFWdn/WV3a/PE3cCBqbWslawqHGRoLSN5fDKCREr/IIcuPkR66cvlkMJiEI4kKkMeMEPax/Kp0
	RDJWEFyImoTMXyNSl9JvCtfHfspX4E7T/u7KhxZAx/dJhfpNPhyVMKNQL/LQZXUemaBGM5feiNg
	rxYpOrfXMRtV+pPmTxWrKk2FCPdn13vxn8=
X-Received: by 2002:a17:903:228c:b0:2e5:e73c:871b with SMTP id d9443c01a7336-2e842bd4e89mr112533555ad.63.1791895223810;
        Tue, 13 Oct 2026 05:40:23 -0700 (PDT)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com. [74.125.82.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e74asm55217645ad.29.2026.10.13.05.40.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:40:23 -0700 (PDT)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so5541865c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:40:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4OR7mLEW/MDMgSIknEZZ7EOnECJ4kehyzr4hALD+5DGs4og4bHo6+9vVi9WGwkbAFjv9nOgusWm1zups=@vger.kernel.org
X-Received: by 2002:a05:701b:2605:b0:153:21e5:4328 with SMTP id
 a92af1059eb24-16a5d6403e9mr18801883c88.17.1791895221502; Tue, 13 Oct 2026
 05:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013103041.145445-1-clinckx.louis@gmail.com>
In-Reply-To: <20261013103041.145445-1-clinckx.louis@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Oct 2026 20:40:07 +0800
X-Gmail-Original-Message-ID: <CANiDSCsT546cV8F4XiriArF9n-ESC0nFFQu7dzcjqO7iJfQj+w@mail.gmail.com>
X-Gm-Features: AclHuK8mIYN_KuyoSL5jnzS_fT52N05tBS78HT8rCrgqoFCz8zUH21MlXCbAwC0
Message-ID: <CANiDSCsT546cV8F4XiriArF9n-ESC0nFFQu7dzcjqO7iJfQj+w@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: reject bulk output payloads too small
 for the header
To: Louis Clinckx <clinckx.louis@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

HI Louis

On Tue, 13 Oct 2026 at 19:53, Louis Clinckx <clinckx.louis@gmail.com> wrote:
>
> A bulk video output stream prefixes each payload with a fixed 2-byte
> header written by uvc_video_encode_header(). The per-URB length counter
> in uvc_video_encode_bulk() is a signed int initialised to the URB size:
>
>         int len = stream->urb_size;
>         ...
>         len -= uvc_video_encode_header(...);    /* returns 2 */
>
> An output device can describe a bulk endpoint with wMaxPacketSize 1 and
> negotiate dwMaxPayloadTransferSize 1, leaving stream->urb_size == 1. len
> then becomes -1, and uvc_video_encode_data() casts it to unsigned
> (nbytes = min((unsigned int)len, ...)), so (unsigned)-1 defeats the
> clamp and the following memcpy() copies the whole frame past the
> one-byte URB buffer.
>
> Rather than guard the encode path, reject the invalid configuration when
> the stream is started: the negotiated maximum payload transfer size must
> be able to hold the 2-byte payload header. Requiring size >= 2 also
> guarantees urb_size = psize * npackets >= 2, so the encode path can no
> longer underflow.
>
> Signed-off-by: Louis Clinckx <clinckx.louis@gmail.com>
> ---
> v1 -> v2: per review (Ricardo Ribalda, Laurent Pinchart), reject the bad
>           configuration at stream start in uvc_init_video_bulk() instead
>           of adding a guard to the encode path. Can move the check to
>           probe/commit (uvc_fixup_video_ctrl) if preferred.
>
>  drivers/media/usb/uvc/uvc_video.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1942,6 +1942,16 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
>         size = stream->ctrl.dwMaxPayloadTransferSize;
>         stream->bulk.max_payload_size = size;
>
> +       /*
> +        * Output payloads start with a 2-byte header (see
> +        * uvc_video_encode_header()), so a device negotiating a maximum
> +        * payload transfer size smaller than that would make the encode
> +        * path underflow its signed length counter. Reject it here.
> +        */
> +       if (stream->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
> +           stream->bulk.max_payload_size < 2)
> +               return -EINVAL;

nit: I'd replace the 2 with a #define and use it also in
uvc_video_encode_header() for the return



And I know that Laurent said otherwise, but probably due to my rust
intoxication, I still recommend applying the check that I recommended
in the previous version. It is pretty cheap. Otherwise If the size is
not important, why do we pass it to uvc_video_encode_header()?

In fact I think that if usb_endpoint_maxp()==1 and
stream->bulk.max_payload_size==2 with memory pressure your code could
fails

> +
>         npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
>         if (npackets == 0)
>                 return -ENOMEM;
>

ps: Sorry to repeat myself; this isn't related to accepting or not the
patch... Do you have a usb bulk output "camera" . I want one for my
collection :)
-- 
Ricardo Ribalda
