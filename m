Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F04439EF20
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885254; cv=none; b=SDCEeClGGGVYEJ76ZoixBBNER/QH2XCThUd59PwbsU0sC2UViK3lP8kg4Lt45F0yNGEp7X9W4NMF2dU85H7fdyhInUuYiYCix8C8JFMY82o+E5MPve1bPTKX2Ra+DmezgbanGnbAQ+Awkgr5XQwj4UgNqMNXnDzQWpxKrKyxU6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885254; c=relaxed/simple;
	bh=bLkEdoC/s2ohCzLHE4r6Q3cM1e+diUmnTJyVdXz9CjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dlzAo6kVeF8gUf0Zq7agMmzbwhPiX6fdcwbPXBgXO6xrPXUQTwvL7x+KgqE6jQI11je5XYFr8W42kGoUoHzclOjUNt3h1w1KixqQNDl0DlXcYxacJtz2dykv+GI83OezKoA/4sdvFvJAd+vyMeg2QNBqT+cnLaI9JvmMTuQSCb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hGBrsswo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hGBrsswo"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8897e83332fso1941892b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791885253; x=1792490053; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7LIq4BnVsJhg0BWPrBY8yFOcAMplxkq0gIlyozRd1E=;
        b=hGBrsswo8QHV9iPuZ3uOH5flZa4IfS+WgEnXd24yEmJ00r9SOeZHBxFV759TuaR4Jc
         q8ZwTo9tEPUG6+iScSfr+LpoU+tz2NYLQJ0o7Sqatn3C6dse3D0+9JEffbJyUK+Y3Kxt
         ypK04HW2uYkaR0euGA0eFOp61eiOG26zU7gY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885253; x=1792490053;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w7LIq4BnVsJhg0BWPrBY8yFOcAMplxkq0gIlyozRd1E=;
        b=oGlRn8EeWgf5u3l8uzmX8wc/AMt0zhCrxmlDozB4hUb/XHRPnRJKOYTWg5T4eBRxlp
         gq0hyisAkBqFUWuLUjjn1oc2netodaTYwN+bpOz6auX9+QMdmZNyeA/u3ipMkYo3uTo4
         BC1Cq9wPNZbcZSj7Oq2ESmSduGtVshOI2U4uB5FmdS5QqF0N6yQilvDBNFWRrbu+K+n5
         SjBarvYwONsTXGbSxsNMpfywlZphfDykUaGpn7TjsiRaR6DINIMtPgZCATPplxRcqVQ9
         JQuzS1QfLRvxp9gxO4sm1JRAsDVVLBtOLAgp0L1xcWz7V+hyT5Y1WZ84um3WhwonOf1s
         UF1g==
X-Forwarded-Encrypted: i=1; AKwUvBzg2tMMuj4YxMGGxi1xkysLnqAB3TJPPU5s90/kyFV6KDqDn5i1bPW0CPDS/bs6P6BguNIrzUWYBGEroX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZlmGG3bXhfQGtTHNhxgHF5hhaqVId6kWOhKURj4Febgvle7f/
	cxDKa1pKZPz8C5o7Auz+ANtipOhAHmvR0TmXEI/dJl0zsqK4Oa39f1FnNxbKvcAVvdbRY5Hrr0K
	L3imECw==
X-Gm-Gg: AYBFou0CFTViq2iTZBP1zftAHYC8/+I2CqKpDEcHGE9Kvhh6bjLX2fMHVdlE6ACIncQ
	gouNfQIHzmY3/ZURLmucRsEkvC6FsgppJBs5pObi5W03DO8x8SyEEAqMwdtiik/0NH8ngy9Toc7
	2wla80vREZiKulJpoYFrX1U6qg1HagWbwOHE1KmqtsdgPe1wwZjz8LIoU1LKHDvw++JH6nr44fz
	uJjTfnnYEZqDxwVzzaLD0ZzQqOHHEBce3DnZBs7dsx6wvwPN/qODoPqFKw9Z0gOCpvnp+jpLZ25
	eny8Tvoya4z5Sz/BPgVkf1mzEpU4TK3M+FTt4e4HZHyWlYWkA/OsVXE9MKULRgGyQ2XueJUNEGw
	xwwiaXj/9Sg7VK6tr3d3IGVulyXkPgd9qhowlk+YnOXxKMLG7/Xe0Ogy8Wb53D0gqCZeKRcci0U
	qwC3j8L3hFdHxEGHJlK1z45bYNUNHiPF+eeMx0qTCXtY0PwoiKmTVjl0+HgbjuJGAB/du36ukpg
	lvdMNkq64L6gmCeFtGMVnoZmrv5e+13LxE=
X-Received: by 2002:aa7:8885:0:b0:87d:df30:d918 with SMTP id d2e1a72fcca58-897d5194b17mr7636961b3a.27.1791885252490;
        Tue, 13 Oct 2026 02:54:12 -0700 (PDT)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com. [74.125.82.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89a0724a045sm2525345b3a.45.2026.10.13.02.54.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:54:12 -0700 (PDT)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15756f82e8aso3701321c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:54:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfY79sqYCiHvBCek6ljtnUqEc+hH5GquqhUU9lluT98E2P3/h3uCLJnuKMiUf37frKX9uB/wodc2ssU4c=@vger.kernel.org
X-Received: by 2002:a05:701b:4510:20b0:15b:1439:1fcb with SMTP id
 a92af1059eb24-16a5b979b4bmr16261285c88.10.1791885249183; Tue, 13 Oct 2026
 02:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013065335.2246959-1-clinckx.louis@gmail.com>
In-Reply-To: <20261013065335.2246959-1-clinckx.louis@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Oct 2026 17:53:55 +0800
X-Gmail-Original-Message-ID: <CANiDSCujghpaqP64tWnObOTMUmNTdQp3-6yb2C2MrOC9=48a4w@mail.gmail.com>
X-Gm-Features: AclHuK_01jiEiqdsSns1DzgI9X840igUpsiES1nGyb81ZHSPK_oSApAFhO_Tx_Y
Message-ID: <CANiDSCujghpaqP64tWnObOTMUmNTdQp3-6yb2C2MrOC9=48a4w@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: skip bulk output URBs smaller than the
 payload header
To: Louis Clinckx <clinckx.louis@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

HI Louis

Thanks for your patch

On Tue, 13 Oct 2026 at 14:56, Louis Clinckx <clinckx.louis@gmail.com> wrote:
>
> For a bulk video output stream, uvc_video_encode_bulk() starts each
> payload by writing a fixed 2-byte header with uvc_video_encode_header()
> and subtracts it from a signed length counter initialised to the URB
> size:

Out of curiosity, do you have a UVC output device? I would really like
to test one out, but I could not find anything on the market.

>
>         int len = stream->urb_size;
>         ...
>         len -= uvc_video_encode_header(...);    /* always returns 2 */
>
> An output device can describe a bulk endpoint with wMaxPacketSize 1 and
> negotiate dwMaxPayloadTransferSize 1, which leaves stream->urb_size == 1.
> len then becomes -1, and uvc_video_encode_data() casts it to unsigned:
>
>         nbytes = min((unsigned int)len, buf->bytesused - queue->buf_used);
>
> so (unsigned)-1 does not clamp and the following memcpy() copies the
> whole frame past the one-byte URB buffer.
>
> A URB that cannot hold the 2-byte header cannot carry a payload, so skip
> it instead of letting the length underflow.
>
> Signed-off-by: Louis Clinckx <clinckx.louis@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1701,7 +1701,14 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
>         if (buf == NULL) {
>                 urb->transfer_buffer_length = 0;
>                 return;
>         }
>
> +       /* The 2-byte payload header must fit; a smaller URB would make len
> +        * underflow and uvc_video_encode_data() copy past the buffer. */
> +       if (len < 2) {
> +               urb->transfer_buffer_length = 0;
> +               return;
> +       }
> +
>         /* If the URB is the first of its payload, add the header. */
>         if (stream->bulk.header_size == 0) {
>
I'd also detect that the configuration is broken, maybe in
uvc_init_video_bulk() ?

and a bit nitpick. I think this is slightly more idiomatic than your check.


diff --git a/drivers/media/usb/uvc/uvc_video.c
b/drivers/media/usb/uvc/uvc_video.c
index ec76595f3c4b..03940b62b250 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1373,6 +1373,8 @@ static void uvc_video_decode_end(struct
uvc_streaming *stream,
 static int uvc_video_encode_header(struct uvc_streaming *stream,
                struct uvc_buffer *buf, u8 *data, int len)
 {
+       if (len < 2)
+               return -ENOSPC;
        data[0] = 2;    /* Header length */
        data[1] = UVC_STREAM_EOH | UVC_STREAM_EOF
                | (stream->last_fid & UVC_STREAM_FID);
@@ -1656,6 +1658,10 @@ static void uvc_video_encode_bulk(struct
uvc_urb *uvc_urb,
        /* If the URB is the first of its payload, add the header. */
        if (stream->bulk.header_size == 0) {
                ret = uvc_video_encode_header(stream, buf, mem, len);
+               if (ret < 0) {
+                       urb->transfer_buffer_length = 0;
+                       return;
+               }
                stream->bulk.header_size = ret;
                stream->bulk.payload_size += ret;
                mem += ret;

-- 
Ricardo Ribalda
