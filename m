Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793163438;
	b=gOh6PYGqIj3VwWkc9UtjhIAVXxnJj/5nS6vsamb68zn/6O5nnjHRM5DPWmqfCCnAJBKB
	 31wgP2fbwnnVZbHaRbWCM4oS4gqrbStWz85DMHHuD9v/Z5/peenorXHD/tUo1nvrYIcOu
	 ErWNvA896z6P3hOTyma4NvViAQhckG4Qbmilqt451b6R9dijxhzWwBi+u2m0MfLF6uyz9
	 rAax0MSOZwFihKaGV4Bu7SgpxM2EH5Nf+rVqTgvNa6dgiwNhFaS7hrGH0atP+S+jUmMhX
	 T7OiEZECF2StscTfS9eq5pIvcYqap0QvUi2bZ2sdKdeXy0NHz7QZ/IIxg2IiPSOHDBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OZDzrby98zAkp+RBN2RFww3mthQeJbbd06e824FJn0Y=;
	b=AHpsXlWhDjSr0c/yOrAWmTItU9GE0P6drsGfc2+otnNG6V0fLWBQj6KJ4J/hSq+mEF6b
	 HlUH0xqU9AkZDW2Y6IxQcNblBp6f01WMFKk5MFzcWeoiEQydR/WutFlm8mi79WbgOogx+
	 tp9p3yOblLNTY23K6E3sTdv4BQPmMDstHSk5cTtq8LX0COp+xitB0K8eVg+PB08JkJyWA
	 9rGxUuSAkBcWBbFcZCugKrr1VLyGKjz+VFq1rKWGZ7nhoTCEZIQEWmNtqYr19i5vqxoAP
	 DPNu1vuqmQYmCmAkV6ve1NsyQUgta2NJsvnjtHhsoRFM3t/rS5VuaX/avNUNLphuSHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BOvm1FS/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA7606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74DA7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOvm1FS/
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a98fc80925so5915981fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793163436; cv=none;
        d=google.com; s=arc-20260327;
        b=o1VSmjb/TdnJaZXdvFNIFJEd8xt5YxDWqtW1yKqGfBHMXhBC6xkJI6VqCOXgmilr31
         kgyyqHAP/RbXidTy1QCtkoFiBCDWyyUCRI4w6byDtRFsM8siMc6gq8PBLZubCFpt4kyh
         tbGqfFpHWD7suRj2t0Vkrr+pumK2X+dzgUMakXVoZpWN7bJL6KqLVap5tCg5YKsBgFSm
         xwgu6ki8kQEPvY0OoL99Nqt5dUsxFRlj4pBvDqZUXM2Xf1X6drAo35+C+clJ27BdU+yo
         j0MUpsfxgxxDl9EzCNQ3IL69Lg1jyS09QTwBn6K5a1bbzZOKqcfS/hIgLcqrw8CM218x
         ULUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OZDzrby98zAkp+RBN2RFww3mthQeJbbd06e824FJn0Y=;
        fh=8/MxWBfbyplMSWYXz4DF57r75ykSzvnCv4EpNVh231c=;
        b=l+eopiOUsLb/rcY9W38G+UuGM9/QqwQT7XnPg/NkwHmxDCIUXskIomc//uUrQkLQN7
         /tnAZbMfiLqzNgYMYx3Cz54EmQLhh3GIlx0rCwnyCLWl8ZyHz4vA8t2Vtel74XDmr4Tv
         bqHcEnNaLlF67vqZKGUsMHHivZl9MQtQDDpgCtVxZqK5LZiOBo3z7jGK+8XQqiYkOvho
         otA+W7AHvr1HR1qUE7L74tUqz2jqGCt9RfagkAfdYlAYOqWzuleQICK8RR6qjtgCxQFt
         EHdPMbW5x2YlNhKFjREKsyy9ny8Y/HP8ewTTnhHPOVWhwdfrQ7hqkOXksh96G1CCuCEg
         Zblg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163436; x=1793768236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZDzrby98zAkp+RBN2RFww3mthQeJbbd06e824FJn0Y=;
        b=BOvm1FS//WMk6hJauaPcu2ygThjNluebsNavgORD2R4ySAxUgQoKWKFRAhkiFRHnjq
         NwxNX+5larGRHeIvmHbzY7Z3CT8EGarikefzYVjrlcow0ROMnRJpsBCiVT97sZkbHr6Q
         Lr53EJ2pXL1dKhmYnmC7DoTfXtw68/PFCh6T7a63xsJMgUlUfQni47+DdjqRQ7oz24En
         ti3X3whOr+2mu3S4rHeYzQ8B3jTYR5I6CloGL1pP9wkOt+4AA5yNTtoD9zxC2Bb4vyNE
         ErNWEhmFoGLTn3k7YTWxey6PBEHlGAB8qNebIhOUS+CBIC6LqdrXUBFYgA17vUStPpg9
         20Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163436; x=1793768236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZDzrby98zAkp+RBN2RFww3mthQeJbbd06e824FJn0Y=;
        b=W1qmSHG5DSSzFU447OHQrwHu7JdcxHVCyDS6dyz9dk/1bde3NuUsTpAcNZGS3Fr56j
         ZOWwBAFYhg9Ah/b6EaqhnE0TMyiAdunT+CP9ABUUlE7ftZjlKLsw6+QWFPEONT93BDzL
         grvzrVcggXxL+mTCH7Fo7+gvfC3FirDahASk0xePbOyjJFm/6CdZDuSKqZMVnPyI8XQV
         MOcWR9GgkAzMRebgfG2sZ+9KLZVHzrB0yR/XFHvJ2FXU7p0Id+LHSvJe3GdOG8qzT7D+
         jVRMqGO8KbdQXwtWaIm56svfK770lHPhilkrK93Y+WrT7Ah740eGwjeqZ1VF6JpOnbxv
         DebA==
X-Forwarded-Encrypted: i=1; AKwUvBy0jbDdpvR0DAtiYLgmNs35Ll2RkwnWjRJV85BODlHNyNlFH+y8MjIo0iYnLwFNyP3UnzbeoGXVMcdT7NE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwv2z6y1tianncIsO2NGGa1Fw/WTLutwZcclr4LAzjHOu6XpdN
	VmltJI1Jl3HPoGD9r6plyDAhM499J/sGMkj5gJejaB6Tp4PAWj9S71UZ2VrdaDe7A+0OGI9IM31
	0p6YmMEKpwmthQ+mVxqkWdKZVyOmLhu0=
X-Gm-Gg: AYBFou0KMuJ0n6z2QEZ21o5Idjl76gF9i6GhGcXRoipbHEtOUnVmB60x4DsXdgaLS68
	SI3yjHYf92mc/GpEIOaJl9/0BfsByzqL40LF+PcZ4LPdricB9ovWpG8xo7V/ybuUlfDu9P+zRAs
	0NxLP/FgF65iFoINsW+QoOI8ZG9uyOz2mc/FZRQybv2dP8Iltv0t8qRY1RkkHWyIAnXkl064++x
	pGzTRPFVqxNppz8NRr+SUryBOyDl2SkCv5tthwqZIDa6d8vujBGRbhaJsV2hOEBfyI2fmT98GFu
	eh6YjqXWUnPk9xVyQ7Rf5ilkiYaMrSu+fCPoMzSTYLde1LzM4fNk8ZHRa9lxfkFJ/ea5waPkXZM
	jlkavO9ER7zMlqitRb9BKk+gPUpyj6UII6nYiWCoFO2ACx+Pw0+RJf142MZkrfCO7RikLLcEaNJ
	jDQkUTdoVsJX6Bri9IbSMoXpMauw==
X-Received: by 2002:a05:651c:545:b0:3ab:3f1c:c2c8 with SMTP id
 38308e7fff4ca-3ac9cd1c35fmr2385451fa.0.1793163435483; Tue, 27 Oct 2026
 21:57:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028020147.2014466-1-matthew.schwartz@linux.dev>
In-Reply-To: <20261028020147.2014466-1-matthew.schwartz@linux.dev>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 27 Oct 2026 23:57:04 -0500
X-Gm-Features: AclHuK9MsG3Srq6acawczlgwAiHex2zY6MicKJ4lS3tOP-Ts2G9ypKxJ3PSeqik
Message-ID: <CALHNRZ9f8ZTnc0LnAJ+YPRYKA9D1=tvY=Ce6bf=91O=WWU6XmA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: chipwealth-ch13726a: Fix dark grays rendering
 green at 120 Hz
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Teguh Sobirin <teguh@sobir.in>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:02=E2=80=AFPM Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> The init sequence writes 0xf0 0x50 followed by 0xb9 0x00. The panel
> configuration in the Thor's stock Android firmware (decompiled from its
> devicetree overlay, dtbo.img) has two runtime command sequences that
> differ only in the 0xb9 value, both "display off; f0 50; b9 xx; display
> on":
>
>   qcom,mdss-dsi-ram-command:        b9 11
>   qcom,mdss-dsi-bypass-ram-command: b9 00
>
> With 0x00, in the 120 Hz mode, a full-screen gray ramp from black to
> white, shown with identity color management, renders black as green and
> the darkest grays as bright green, both at maximum and at reduced
> brightness, and the tint is more noticeable at lower brightness. The
> 60 Hz mode renders it correctly. With 0x11 the ramp renders correctly in
> both modes and the panel dims without a color shift.
>
> Use 0x11, the value from the vendor's ram-command sequence, instead.
>
> Fixes: 3ee01b8647b5 ("drm/panel: Add panel driver for ChipWealth CH13726A=
 based panels")
> Reported-by: Aaron Kling <webgeek1234@gmail.com>
> Link: https://lore.kernel.org/all/20260727-ch13726a-washout-v1-1-bf869ddf=
c5cf@gmail.com/
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> ---
> Aaron, this should be the 120 Hz issue from your washout patch; could
> you give it a try on your Thor? I found the issue here separately and
> saw your patch as I was prepping for submission, and I bet I was seeing
> the same bug you originally saw.

This is something we tried before. And best we can tell, enabling gram
limits frame rate to 60hz on this panel. Framerate tests such as the
ufo test were reporting 60 when set up like this. Can you verify the
refresh rate on your device?

Aaron

>  drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c b/drivers/=
gpu/drm/panel/panel-chipwealth-ch13726a.c
> index 562dc573528d..0832e49b77a9 100644
> --- a/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
> +++ b/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
> @@ -65,7 +65,8 @@ static int ch13726a_on(struct ch13726a_panel *ctx)
>         ctx->dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>
>         mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x50);
> -       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x00);
> +       /* 0x00 (the vendor "bypass ram" sequence) renders near-black as =
green */
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x11);
>
>         mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>
>
> base-commit: 8ef66514d7b993c9fb96a5886f001e3556610c1c
> --
> 2.56.0
>
