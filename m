Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247CF19C54E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513333; cv=none; b=SWUx39yj6N3Na761uNrjbKdjsF7JjZmYEKWS5BG399Yn1CFV+OtEmfVxCPn+bgBzdaI8ZwvLSYM3paX8MocT++TQzQ9pZjbcHgmKFvoylnWVPhkDHH83UIqkb8oWPo358iN6O4yCUDfzfALkop/OqIlqjSziX1Jyq6ATa6dDSzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513333; c=relaxed/simple;
	bh=R5NXZJqCVXMl3fMVgJejfyzwqnW9AkNvzaBL+3CjJCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ey9yuLRd5+smpMJIgDer+DQ4jrz287MchcmqWwrL7bBCj+buOlOEzAMxOZhGSVKdYDnekuiYtnaENbUHwux3qjcBrl1AR0P/sFYUGeii3RYeRj/Fc8oh9VnWluI6KjxNoa9PPILVvh1lWKgK8DqPSA0KmmpNv/J/BfDAmEQMEMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J5b9jkEl; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J5b9jkEl"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-475920b9ca2so166377fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788513331; x=1789118131; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMWzPa0juwBb1k6yY463W+ILZD/WKBScEKIEzPYh6cM=;
        b=J5b9jkElxIzNT3NJ+rA+/kMV6EMWEL1gAXkIgAwFkS2p+MxBg1QzwhMePfqYyE8HBG
         LzM4ioo41MoJVr797APwGFuWW5fZTvUk0WJGCwIItBIPZWuvqd7C0Bkc+UgurrzqBFZz
         JYlO43IkrANGM2lALMrqW6xLeOw63y9ew+5ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513331; x=1789118131;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uMWzPa0juwBb1k6yY463W+ILZD/WKBScEKIEzPYh6cM=;
        b=qCtlsOLCFYu/kpJTGIKGHTssFecxnLrE6yPeAh6eH8bKUYI9/WwsCbEUYaggooQxKz
         GOtjDAgl+j4tRzASZP4fY8eEHNEzJw6egELEwsHIcoMHtRQuoGT55+sNb99/4bFSfRdC
         wXinZLuGZxTfeBJbqU9Oimhu9JHnEfBJASuGHTQYGPIJd5bInkRvfHfVvNircGevgPSS
         gm/+LuJYShv7xxi9tgai/AAa412rVrbhvd81aomJoqoiX3iAspT+2k52KZ5qJuUdiFKm
         RwZ/FwrMAzOQAzG7KisaXNxKieo5xTcbRXe3nWcL4yTUBkna0pobN5/W5W5pqMa8CQjg
         iVXw==
X-Forwarded-Encrypted: i=1; AKwUvBwhNxW09GZnN6pWKJPyhFyeKXcbmTrhPXnuikQrIwzk2B7e5sgj8wJ3Dnz4N/rDiTCBGTIHG76ezvK7iDU=@vger.kernel.org
X-Gm-Message-State: AFuF++nVJtPoFARqICbyat7SPvB/AoXMNXmJc/ywmn4Xr1/pi8ZY2x5n
	8Ndak+39UxbQ24TC4ovWuJbn5O0pfZ4h7twTPGqaS5W3RmwthX+tnh8UgJcEmNc+UtABvTVowCf
	AK2v0TV1f
X-Gm-Gg: AYBFou3GsqpAnDVuNt+sDc3l9kIW2jSdLnr9Uqvkkc8NIKPGeXPSYIMTOwLxhKrTUPN
	zPwogEv+isOP+J4++dJz5ryO2B1YYM1JWNrvM28q8ihOZcXxCpc7up7DhXbs6VVYWTYCUBHHXrm
	Re3dLRXId2mbDyKtiN0A/45wBVyoQjP3onPb5398hbRGgyOjCZnoXOyyRSHIkRa67ST9CFID9Mv
	qg/0dkHpjlhWxKEUmDgXU6KGWNWyJwMOTyrSV6Xg+/ZTQaPWwL4tMga+RGZDblpdxTBMJIJO6Ll
	2VNY/fVwdUP7mFNmG+QjRZykJxFR/y5NfILCui5MnFtrBIfPL1SWfAJswaQznqt0FRAAopkMMko
	uDFG+N5HVSv96OMGBAYukt5SD9Ss5aOq+8cBZjSVCYV54OEFmZQPYXdXfjlOBvhOPQgbCue4EO7
	8wt6MDSAuVuKflMLqX8ajD53FtnK+3Kb1jSVfVXHTDd84Or6ABT9fxCrIpLl9jetNBs5UVowh2a
	utlTpd1fknK8jMDuL8PeJf3dA==
X-Received: by 2002:a05:687c:1d1:20b0:46a:e3fb:41ae with SMTP id 586e51a60fabf-47551591710mr2404522fac.11.1788513330939;
        Fri, 04 Sep 2026 02:15:30 -0700 (PDT)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47554935962sm1634568fac.12.2026.09.04.02.15.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:15:30 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b1b1cb72d0so376767eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:15:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvvsh+jEBsAGvsnBGdmcScm+E6hQ7z8IWapPSAKI6T0/H0yM3V1vePMaiF6+yLm6xELisosDHEcrg5g6M=@vger.kernel.org
X-Received: by 2002:a05:6820:1c88:b0:6b7:46e9:96f3 with SMTP id
 006d021491bc7-6b746e9a23bmr1781061eaf.35.1788513328426; Fri, 04 Sep 2026
 02:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903081145.8382-1-rh_king@163.com>
In-Reply-To: <20260903081145.8382-1-rh_king@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 4 Sep 2026 11:15:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCsqZzFY+KMKGBg06vm6rGR4FMy63hd0HShiHfb+vpqyqg@mail.gmail.com>
X-Gm-Features: AcwNN1XKHymeIA-S6Rs3lXgSMWA8Egd58BO-6mTYrvDxAlW9gnMLUcdDBBtKg2k
Message-ID: <CANiDSCsqZzFY+KMKGBg06vm6rGR4FMy63hd0HShiHfb+vpqyqg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera (30c9:0122)
To: Kean Ren <rh_king@163.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 10:58, Kean Ren <rh_king@163.com> wrote:
>
> The device binds cleanly but delivers no image data; USB autosuspend is
> suspending the streaming endpoint. Disable autosuspend for it.
>
> Issue found on Lenovo ThinkPad X13 (codename Zelda, Intel); confirmed
> working with this quirk.
>
Link: https://lore.kernel.org/linux-media/20260904090751.1814783-1-rh_king@163.com/T/#mf5306ef689ce38ed331a3098272cb0ac2588ed79
> Tested-by: Kean Ren <rh_king@163.com>
nit: I think we do not usually add the Tested-by: tag for authors. We
expect that it has been tested :)
> Signed-off-by: Kean Ren <rh_king@163.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..32bf353013a1 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3216,6 +3216,15 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Luxvisions Innotech Integrated RGB Camera (Lenovo laptops) */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x30c9,
> +         .idProduct            = 0x0122,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
The quirks are sorted by vid:pid. Sorry I did not notice this before.
>         /* Intel Realsense D435i depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.40.0
>
>


-- 
Ricardo Ribalda
