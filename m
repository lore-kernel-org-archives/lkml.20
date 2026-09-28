Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A0629ACC5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598948; cv=none; b=GeOVa9I5LTaAGLfijhlkXmw1Pg+HGglq8+Z5Ve6QGbiIuiZmzQOZd7CxQipfxLp6vmBOkRNZ+R7Vnl5eR0AHSNfLIxhWo62GxeHEr/6V7H7jOKYAp4yI3qt4TtHPJMHhKCBW/9S7/kf3X248jZw5BAoEn6TwdaKWB44Pqre4szY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598948; c=relaxed/simple;
	bh=73vKtw6aDU7dW85iYUC8zer7SLZnvtJKJF+MDMclS40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tm9a8Nt6xvyQWEZ/9idcz03KNsvIxzuSB1jq73StFKziRrMq0Zju2v0J1NGJ1sbh079ipHOmnZDDxeGx5+c7SFhXPHGSxOrPiAzwve3ji84OBQVaXmd7ctnZpKhweJ/2cbyLUfLOr7sK5j5h7MPOKpxn9pCgg0DSi26VQ+EKIqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GI2Au14M; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GI2Au14M"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so25282065ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790598946; x=1791203746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGOKZcnbtkuor5V4UVqa15Vs2El3sc7IIltQAs0Fj2I=;
        b=GI2Au14MU+hijxCrJwQZU5NbglKRJRE/wGRedgXpPfjli4VhbHl7JoDGirrQ6mha+u
         bgZ4o50Y3r7I4ycxpMR3o8oXID4duJhihp0T9o1O8etR1nEGp0TnVMuLCSoDWCPxJKKR
         TXexMnUHrvkErMpjeaZfBLG86j8zllMy3d+FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598946; x=1791203746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OGOKZcnbtkuor5V4UVqa15Vs2El3sc7IIltQAs0Fj2I=;
        b=Otr4FulH0b9JmXh+xXwOBzAiuD8tZljSsYMs0hipYu3F0txMEVBnEsboAq4rupnn2D
         y1oYB6IXE2zf3I9Yf9H+lPHa7LQDTop65I2qU/hPwXlemv4457D41tBkx1aowYzJkGKI
         NBmDba4tJ2zPfdErPWehneIGX6AEWLRbOFA7ps5101ldRZO3eLiq6St22XShqdajZOko
         UGUZnHFerpVr57/FVdY6BjCx2HKBQMMRj5DAvmKikmL7yXLj2Qz1rBFiIxnxgnyNkE4c
         gJ/FmA/6mYva7DFL3rOKbq7N5hh5ZZqqNFWU/am14v1WKbspnzvlVcF0v9m6sAYRTuJf
         L91w==
X-Forwarded-Encrypted: i=1; AKwUvBxOU1Qu06e2bvebxGnVwswMVhU5ZytvjQQhR9tWMr73x9e+D/AqrabfxB3dEM5a6lTz2hCa9qQB5HzoLuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIagtejxWXI6dVFAQZutGj+dQT1lKRj1f6VVSW3b2mP2KWykNup
	xW0y2CU7A+OMhOIpFnYz8WF3pKAV3TLNjh8jlkmXalRStpPSrfLT4GJlAy5C213E6Yqe+IFDBDS
	Wz00=
X-Gm-Gg: AYBFou1T9DLN1XUTOJAXPInrCWrzyXuh3dPaPGBZIBuSbQNRIo6r807Lu9iNFCbAVho
	Hoz8MW19Ia2qfKU4AolmFEc7Y3G+9QvOiKEF5navPFEMOQXNq4RolMVO62cQ5mIkD1eye4AjyN0
	zFZLC8H/cKM8ycM59MIpX+t/G8DvOS5Jd/uYPORO0YE2yEfGFBUuk2lKrXgUM272PMfuYfYFO2n
	fR5KCbEdlt7YQ8lTnjRcBs5KhkQ2ImIFTNa5iMdXyOHwo1sEgV7yn11aU6axBU4ibb024ke79yh
	JK1b12dUB37pWjpbDJzH6/WjO5FXuY+gIziUrtDNHi4K3iwFXKy5qAyVexR98xoEK1Q2OQ88Qzr
	vAA86UTDpY6V2XPM1YaDGeWK6UXbKdZGQ+nkphVPN8CBXKWFDpuSnqpALO1qmFczFQ4XeLxGBfw
	UixubyTBfVEm6AOWbz1TMFE3LyPyHLe+gzoelEW2NdE7DldHU3eohCxWF7JuGn0JA0itgJFfSDm
	iKT4f7nmBiX5YOKPsF9v82qaVaJ8Th9zm+rFw==
X-Received: by 2002:a17:902:ebc7:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2df94901b8dmr78050845ad.5.1790598946121;
        Mon, 28 Sep 2026 05:35:46 -0700 (PDT)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com. [74.125.229.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e032bsm40980875ad.27.2026.09.28.05.35.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:35:45 -0700 (PDT)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144e32aaa1cso1656910c88.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:35:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwuC7l9ouu9GbNt0R3hVwH7B4D0SLPCZvtb3sAB0l3zFjaIY4eml7Wj6ObIIOSCZ5Mh11Hr0jVBvxSI+fI=@vger.kernel.org
X-Received: by 2002:a05:7022:b059:10b0:143:298e:459f with SMTP id
 a92af1059eb24-146d096cf16mr9764812c88.42.1790598943539; Mon, 28 Sep 2026
 05:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uvc-ctrl-bound-v1-1-7b5cfc68bae1@chromium.org>
 <20260928120252.GB4406@killaraus.ideasonboard.com> <CANiDSCv5pd-3aO0Eb1-rvsAOGNpB4rhpjtnTosU6Ca+xBxN1qQ@mail.gmail.com>
 <20260928122450.GA166131@killaraus.ideasonboard.com>
In-Reply-To: <20260928122450.GA166131@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:35:29 +0200
X-Gmail-Original-Message-ID: <CANiDSCuBFLYXFbq7Vox7AhdhftfzC9Ga6FKL-2F1o08cHQjoAA@mail.gmail.com>
X-Gm-Features: AclHuK-QPMoirQ8WWBZFkgJeJP3t1AaILGIrQSKW8AmLJATjcu8qyr8-bswBwxQ
Message-ID: <CANiDSCuBFLYXFbq7Vox7AhdhftfzC9Ga6FKL-2F1o08cHQjoAA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix bounds for descriptor parsing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@skynet.be>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 14:24, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 28, 2026 at 02:10:26PM +0200, Ricardo Ribalda wrote:
> > On Mon, 28 Sept 2026 at 14:02, Laurent Pinchart wrote:
> > > On Fri, Sep 11, 2026 at 01:23:50PM +0000, Ricardo Ribalda wrote:
> > > > uvc_parse_control() passes descriptor by descriptor to
> > > > uvc_parse_standard_control() with the number of bytes remaining in the
> > > > buffer, not the number of bytes of that descriptor.
> > > >
> > > > Because of this, malformed descriptors could leak over the next
> > > > descriptor, leaving malformed data in our structures.
> > >
> > > What issue does this fix in practice ?
> >
> > Look into uvc_parse_standard_control().
> > Let's take the UVC_VC_HEADER
> >
> > Imagine we have a malformed control at the beginning of the descriptor that has:
> >
> > buffer[0] = 3
> > buffer[2] = UVC_VC_HEADER
> > buffer[3] => Beggining of next control
> >
> > With the current code, buffer[3...X] is parsed as UVC_VC_HEADER.
> >
> > What does it fix in practice? It avoids that data outside the controls
> > is parsed as part of the control.
>
> I understand that, but what does it fix in practice ? And have you
> encountered a device that exhibits such a problem ?

I have not encountered such devices, but even if they do not exist
they are easy to emulate and use for escalation.

We add minimal code and solve a family of bugs. Do you think that it
is a better pattern that uvc_parse_vendor_control() and
uvc_parse_vendor_control() have visibility beyond the control that
they are parsing?

>
> > > > Change the code so we pass the actual length of the descriptor to the
> > > > parser.
> > > >
> > > > Note that this makes the existing check more strict and some devices
> > > > that are wrongly parsed today will not be probed now.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 7 +++++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index e289cc71ba98..429f1ab19a2a 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -1248,11 +1248,14 @@ static int uvc_parse_control(struct uvc_device *dev)
> > > >        */
> > > >
> > > >       while (buflen > 2) {
> > > > -             if (uvc_parse_vendor_control(dev, buffer, buflen) ||
> > > > +             if (buflen < buffer[0] || buffer[0] < 3)
> > > > +                     return -EINVAL;
> > > > +
> > > > +             if (uvc_parse_vendor_control(dev, buffer, buffer[0]) ||
> > > >                   buffer[1] != USB_DT_CS_INTERFACE)
> > > >                       goto next_descriptor;
> > > >
> > > > -             ret = uvc_parse_standard_control(dev, buffer, buflen);
> > > > +             ret = uvc_parse_standard_control(dev, buffer, buffer[0]);
> > > >               if (ret < 0)
> > > >                       return ret;
> > > >
> > > >
> > > > ---
> > > > base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> > > > change-id: 20260911-uvc-ctrl-bound-9c1940f06fc7
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
