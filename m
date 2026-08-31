Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1983D1CAD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169020; cv=none; b=dSM0LCk5mL8rlJPRjxsmj1TA4jfVFiHgEMNbkCdJ3fRapeMxZGvV0ppaJcriVkmvnAI6Tzl0NbLcdLzyDbvRhIHnAq2nZ1PIDPQh+9FdKoubus63azXZo2LTGGXQJo4D4S8YpRnpmHRhKsIvs0j4WwOzIhChC1YRlSTuTbGK6gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169020; c=relaxed/simple;
	bh=OCbTK+iZQ7t9O9A/Nos604E0g+dwkmvk1PEanBMiZKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=psgqxyIqhej/nW6Ew5C4iu377EmTTKYe9Ep8BV6GV02OSu1U63D3uI88bTlQ9dPfI+wKex3pHu7gXPWuuhnH/1uvEiRsluQj+Ikxgf4wlSQ5PybXZtlXfWozEV+a8NwAVG/gicq3Aw+PRyUdPjBcNxr+weuHjL4QJvAXvQgqOwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MVKMCMtZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MVKMCMtZ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d712281f8bso35970295ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788169018; x=1788773818; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jxNSJlI7/xJYZETeCx1xokloCJgWDhRl4+gi5TQvFI=;
        b=MVKMCMtZ8a1Hmo90dkXpEMl/Jz71oIuXHxgQ3+rothnT5WDUh2KeU6pFK5btVJr8bG
         gOc9vPMmKXyWihH772sOxZvpw8CYa4bFoBElydQdp9YuSubcVBX1VhH4hzkXkz+6NFRW
         l1KpYSP/YsrEbmtQeiwbUsztZP1K0gX/hAAUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169018; x=1788773818;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4jxNSJlI7/xJYZETeCx1xokloCJgWDhRl4+gi5TQvFI=;
        b=M/p/zyD9PgoRRgbz2g9HcsU6Z0bZ6hPzBddgpgKJpLMlALyUwSLPJoBXQOvTJpEjEb
         dfN8e8Mf3bvVbetO19XF4n5NBd/X/Ynga082IJiODND+rzMa9YoEBilAuPNuyEAoLAMH
         on4QRsZGoJraiWAFS7Q5tKOZtKt26s2XXuWBvBhUmPiScMtl/5dqyrq/+ScFb3eqimwY
         Lq0DZflK6ZwVVQ9dz92xI4gVYUqjl2/LszEp1qq2I7Xf1Se1J1PPgdAJ4W7EDR5WSzhG
         Tb/T0dRF/R6E+0TjBidQOUe+AmDLM/YvU6ueE/E5ei3K6KZgRfOSclOFfdmUFDhrMpwz
         wslA==
X-Forwarded-Encrypted: i=1; AHgh+Rpxh242mOtuA3YkjQFmneac6tE4GGlkwDHj2+TLXglPHCFHGiKf6V8AkJ6c9s0RloaH3SpUCVoKymAbpU0=@vger.kernel.org
X-Gm-Message-State: AFuF++mnOJy8SatNCw4MWA62cO0rXDC//e7XplaVMVhUVB5pRPviswXM
	j0brpJ7GLAFH8MpbmLf+XrSe0SUCyF940G74oZp5X0OsxQ88bDRRLXll6D/r4N5yhSePAYWmvv8
	X7W84QhQt
X-Gm-Gg: AR+sD10+JFnD+rTmbbhkM3VYYcMPW8dHt9GyP9ReNSz0HJouQF/g/Lo+eHb9VQyhnm3
	nVB/IxO07Neu+GFFS31XAE8a5eXiVnRrPaBQliV9P3lVDm9Y8u4OtxufwX306ildOvID5uZfJqd
	A3jUZo5KwOmalcRiXE3FoVXSxTnTPl6oBj6w756Dg6j2IV8U0bIwTTgHPi7n+Ezu1pPYBVjDotY
	jdhHmEiBz2MORlXjKHTZZu8qAYw51onmxwcPC8CTDvN6q/xfU4pN99ILERKIi6waCSslY0hURF8
	Pe7oZR3BbKjO/9Vj4KP65sJl8oeT0A8p32pwd2ijPnDJqq7NeEMCUTMPNVJeCpj2mvTKkdGdmPv
	5kCkM72mFYVSV4pdfX26d/3Dj+m+dEToyS0n8NL7N30vmkKC+B0im5qi2/jfQXmN10YyUDbACKG
	BYFbG/d1iyzYJw/psVHUPNrZb7Y0j8gZs3c9S9ajJgxTWHW9hgjKBWZRE008koe8L7XwtsImdhD
	HJ3pVpOtp0/lYz8GKHAanx8SQ==
X-Received: by 2002:a17:903:2309:b0:2d9:43f5:b462 with SMTP id d9443c01a7336-2d943f5b514mr13833665ad.5.1788169018136;
        Mon, 31 Aug 2026 02:36:58 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8fdf63db8sm19016965ad.27.2026.08.31.02.36.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:36:57 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so3800236a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:36:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByuAAheazwC67oIlKlbMQ54rTGMQARqZH69Z+rq4rJ2bp4YC2XndX8aupRL7HFLaqZT88yRNrIMFTcxono=@vger.kernel.org
X-Received: by 2002:a17:90a:e190:b0:398:9be8:ea6c with SMTP id
 98e67ed59e1d1-398f8903eeamr3419790a91.25.1788169016691; Mon, 31 Aug 2026
 02:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828152557.653475-1-jordan.mymail@gmail.com> <20260828152557.653475-2-jordan.mymail@gmail.com>
In-Reply-To: <20260828152557.653475-2-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:36:41 +0200
X-Gmail-Original-Message-ID: <CANiDSCvrDUYkC3poVeGEEJz=G2iS7yr9Z-XXn=MUL6P0XKN2BA@mail.gmail.com>
X-Gm-Features: AcwNN1XcwakjEWy6PbNDrLprpPw6NBVd4ieA5cr4Yvi4JsrEU1UdN0sl2aRkuuY
Message-ID: <CANiDSCvrDUYkC3poVeGEEJz=G2iS7yr9Z-XXn=MUL6P0XKN2BA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uvcvideo: report AUTO_UPDATE controls as volatile
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael


On Fri, 28 Aug 2026 at 17:26, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> A control with UVC_CTRL_FLAG_AUTO_UPDATE is one whose value the device
> changes on its own: the driver never trusts its cached value for it,
> re-reading the device on every VIDIOC_G_EXT_CTRLS (the rollback at the
> end of the ioctl runs uvc_ctrl_commit_entity(), which clears ctrl->loaded
> for these controls) and re-reading it after each write. That is exactly
> what V4L2_CTRL_FLAG_VOLATILE describes to userspace, but the driver never
> reported it, so applications had no way to know that the value they read
> can change under them and that a fresh read is worth issuing.
>
> Report V4L2_CTRL_FLAG_VOLATILE for AUTO_UPDATE controls. The uAPI
> documents writes to a volatile control as ignored unless
> V4L2_CTRL_FLAG_EXECUTE_ON_WRITE is also set, and this driver sends every
> write of a writable control to the device, so report EXECUTE_ON_WRITE
> alongside it whenever the control is settable.
>
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3ca108b83..aceb26310 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1840,6 +1840,17 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
>             (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
>                 v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE) {
> +               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
> +               /*
> +                * Writes to a volatile control are documented to be ignored
> +                * unless EXECUTE_ON_WRITE is also reported. The driver sends
> +                * every write of a writable control to the device, so report
> +                * the flag accordingly.
> +                */
> +               if (ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)
> +                       v4l2_ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +       }
>
>         if (mapping->master_id)
>                 __uvc_find_control(ctrl->entity, mapping->master_id,
> --
> 2.43.0
>


-- 
Ricardo Ribalda
