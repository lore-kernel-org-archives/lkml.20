Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9076426438
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426016; cv=none; b=QVCcDa9vkPMQCocdsoI1BG7fbuMppXG6pkAXx1V4fXQvfoDBTNor+6Z7SP79rXV4LwYI+ee7yc9hjcajY1XDRyRx+CsVv0D/UGVGRVb3NR69yZg/zDl3+8sEbRRAlLxuIy0d4aRb8ZRPof7nGah5x0pXcaIItq5rve8S967cXZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426016; c=relaxed/simple;
	bh=wsgCzSiXdk/+t4Rrgioy4E6NaWX4RpZlqKj9ZRGWctI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bHOa6fHTcY9iL/xeCXRMtKz4xtElol2riNvQ5hNkYrCc8YdiFDY0AiLRNAwB1lmULYaqECB+b5sfnagOVnbJp2v58xtRfW8OUC0OetSfl2slOS/65rA8OmUFJhmjc/5uqCuQ2cbm+68yYAgk7Sf4JyA4FKUjekdzyZKgVnr/nZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PIh5bodt; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PIh5bodt"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso2447789a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788426014; x=1789030814; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnJlMpKIpQH6zlGOAWXNzpFk5ps3z1vbu6W8sefA4qM=;
        b=PIh5bodtkO8Jy483IR6ebJMRkF1UY5N7jbAHxrYMrZ0u1L+KsCEdY7IkTQkfjDtp0r
         ofw622VgaFxMfbp0P099SlNSEEt+5IOFU0WQTqiGvm03RjQkkyAz1IosQYLk9VWZp6J1
         JwccCDDz0GK9j/MJgOdypuzxBJNqSwdz4VgFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426014; x=1789030814;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SnJlMpKIpQH6zlGOAWXNzpFk5ps3z1vbu6W8sefA4qM=;
        b=sGPPekSTrrD+QeO00jhJFceRN/eW1hWwNk3tbbRlHMGdJkJ+ygbm/rm4wPiIYbGGTw
         MMdgktO9aoef0FTtxyR1U6w5q5YaVy5eXbZ12sfY/y4qtoX8UFok+bnVYGId218bg3/c
         AZUnrxivH4tfX4L7YPhpVLTU1O5hSwkKJD8gmnVRmy/XuCPIKQd3WNtVsuZm4nb+j6do
         kvapzSFN6Xs6tK9RYRr2i1/xTnRrNlkh8liRUJohNgcXB8L+S1BxPZdWV3mvvKXdXD7W
         oyo4lYsMBhuINyMK21CEDmjEbyRblZPxEJAhoQOYU4jYbsCv0v8cAb6ZNIc9u21ujz5a
         KbJA==
X-Forwarded-Encrypted: i=1; AKwUvBzL+Y+Pjwu51ZCihbYNfEOpDLldTd+ODn8WLqap65zO1iL/apKZIgRp6ilBFKphyGINEpbjNiUrSl+/1EA=@vger.kernel.org
X-Gm-Message-State: AFuF++mDaxO9IZStPpvkU+4ZdjZLS/C2vCFVelD8OhcC9p6wIB1um28x
	EXbnPz8KjMXSiTz/AuPLabWzRnGbKTI+EefK8oouBH7NvZAFaAXueZ9WyQC+Vsv3leHC3oTVHd7
	EHL3D0w==
X-Gm-Gg: AYBFou0TR8cbD+I/w//NpL7tK/ScPHq52FubneEshDZk+IWX5FISsOdonoJWz6KNM2B
	3Sd+n2gOoEI5dfSN+VzVrPUHbsbOJby0ucOQX3xo6nwfYANLa2mT7Mfvwei53rRxUVHqjwx8due
	Cp0Ku8eYStVLKrO27rX5mU8k7qToM27enxTWgs9afTICeJrnLmake68gmT4MqIxJl4nZubcRoAU
	84Ns8Y31PBx+3X2sDS1/8V5oSoP1dEkGAAIAm6c/bWTlUeqJSCUHxbT2NAd2pB+/6Q3a4IR57KV
	IgLDjH1Zo+fTS2n2y2xd+GPsTm/Z8YFRB7pm+AYXqWGzq1ay3W3O1iGCzSffvFgAmnfxeiYP3I6
	2xii4n2/L+H5/eGVQCK6O69IJklhcun1OtcStdzCn+zL/Tb4VdBv5+vxPnktvoBkGZf+1X+Chk2
	keCzmSSLWcZlZh6kGCSCQkvqWAOI0Dd3Wt5dZ1R6qEISktEtvVzbYHmdfoOik3rQshGVkZ/Jc+8
	5WkLhHjcsw2Z5AYCDPEv0wptA==
X-Received: by 2002:a17:90b:4c41:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39aedfb9a24mr13642207a91.10.1788426014016;
        Thu, 03 Sep 2026 02:00:14 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b1a807e0csm731950a91.2.2026.09.03.02.00.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:00:13 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2555914a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:00:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByy1Xc64Z22Q3vDK7EDuoyP/bbwMEy5pDPTA7RgT/Ge3wEvjNNrNSbFWojGyfDzs1fs5gtc3yM2nbAlUEs=@vger.kernel.org
X-Received: by 2002:a17:90b:53d0:b0:37d:f983:7b5 with SMTP id
 98e67ed59e1d1-39aedf779b3mr16502132a91.9.1788426012187; Thu, 03 Sep 2026
 02:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903081145.8382-1-rh_king@163.com>
In-Reply-To: <20260903081145.8382-1-rh_king@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Sep 2026 10:59:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCse5+Ke-Z2321F_QHJZX2suCKxnBy5WuNHE3m1wjoxX-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Xc-o8TlHLDY42LydtHhOD_RZgsehCqg15CxrkoOhqu9BeyzvXOGw7ipWo
Message-ID: <CANiDSCse5+Ke-Z2321F_QHJZX2suCKxnBy5WuNHE3m1wjoxX-Q@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera (30c9:0122)
To: Kean Ren <rh_king@163.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kean

Could you provide the whole output of lsusb -v 30c9:0122

Thanks!

On Thu, 3 Sept 2026 at 10:58, Kean Ren <rh_king@163.com> wrote:
>
> The device binds cleanly but delivers no image data; USB autosuspend is
> suspending the streaming endpoint. Disable autosuspend for it.
>
> Issue found on Lenovo ThinkPad X13 (codename Zelda, Intel); confirmed
> working with this quirk.
>
> Tested-by: Kean Ren <rh_king@163.com>
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
>         /* Intel Realsense D435i depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> --
> 2.40.0
>
>


-- 
Ricardo Ribalda
