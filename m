Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83379472774
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628504; cv=none; b=aqZDwP3HDPUMqDxWzaercDi79ZZc1WsSpIDMcawb970BHTIuVtu1ng2nEFDV5T97os19EF1/H/xQvgMXxbx46xndiM6kJJ6oPscChgPN90m2PXZkfgvSaETwIsgBKUox+XEhR9SHHbUz4+YqovBntjpG2rtIk1ceV/jF70ZrcbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628504; c=relaxed/simple;
	bh=QdZkMkPjT+rsCBzn5BJHPFIr6hwuU7yRbvc/Yd27ByI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSRgkUyBmVJdDMvxQTNdKVazOufr/3mupw0wO6vvLHTF3s85VOBpUFKm1ND86OAuO6c/iTuslfbJ4IHW5FKYfJJtEpBsgyZ6PzHM5n2+tNo/A6GsGwxjB1yH/f/RixFMJoifvilHrtkhiOauxZ8fPbqLktfw9t4+zojQJnfan38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YBoZ86fQ; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YBoZ86fQ"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8805988a200so2184872b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790628502; x=1791233302; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0YGFMzdmfOvevk5Lbn5k63azBPy2K1/Oti2UC6CjIQ=;
        b=YBoZ86fQFYBOEyUXc7qSqbUbnzWbxuhKQ5LltogfykB5v1wd3v6jQLHwyXjmjTnZXn
         LMB/sBKEM53bQih0gohN9KbQjSIMUBb2hcoJYiIFElLykFWOL78WwvLCoFu2Q6gihDj/
         k2kKnvbgzgB7RVlkh7dWcsbTWn1C9r3Nc/yNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628502; x=1791233302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F0YGFMzdmfOvevk5Lbn5k63azBPy2K1/Oti2UC6CjIQ=;
        b=zs4wD8xRBawbT44YVC8W0uVOJpAy24dJnlpyts8I+j3oboqeHqqb8DbWzp+r4dawtW
         +SvRhRxs4UgUR7VDW+ktXGbdZo6zdY9eVrBzNesRHz4gSzZeG9fKyDr8cLasNcPqw1Hx
         7h8SFYBZRubqFG97XTKZxVCjaUDkY/HyvLK75Pr7PYcdKen59nwLz4tXVDCcBjlrwvk9
         PNe9fIXmiHTrocOGQo/y8auFUJxxqu3C/dyUoqsuBhN2D9g6zX5XHsp+XyR8dP5+ZVui
         2iBWQVxBuYxS9h2JdpZ2IWXk7MSZq4N1NnoicxK38koSNhaYIe4VJlLgPS2XF6Z2xkis
         duuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNJ57e3sp803dUv/FGulA/4+EDW6cHNM0KEt+XcGAgkjmenn5DHal0mkZmN0J2/fEprh1dTwNEW+1l0a8=@vger.kernel.org
X-Gm-Message-State: AFuF++mTUI7PmAodshA/SBgdpcMtePO056j5ZqR/zxk/Lz+9YK6QE8Ap
	qC6kDnTD5gKLXqoVWti7BgjhRTG+ITzRZVgN/tE5q8q7VcsduoRsxijchlG9hWTJSawStqP7Lgx
	VtfvVusYn
X-Gm-Gg: AYBFou1+zfGqMNtGx7bf3fxSzoyAk4nJwNC+4uVIDkgrDEymA2Re8MsOAeY8JDM2+bD
	LtXviT6N9Q50IELfXuk8BXTOpVnrNHL0ekVxbYBWeOrHWne0JkRBvYqp0D217/M+35ktd8fTqJW
	Lrw88i5nEoUFy/h5gPwPZxG6raIgPoJpC0UHTm3MaQ/Jpwv03fBUIdP6QyPUTEFbtzDjPy3515o
	PhAvP18uXfkCj6KqHedrf3UjdNfezBkv+D1U2wbqb4aQKFhm/vDYV9iR1rV3x+KUQyrrDLvDFMX
	96EB5vmsM1l0JF//k4R/TWsqwa0Bc5sMe950wsGB87af1XiUu2M5COkVHXsKw6wGCLlfIh2fD/L
	2rIVO+U/m5OHwlVxDTJ2qWze+HJKTMe/jBUaJvnBmcIy6V0XX3/zfd6FlKopOnzX4g0JuULhz0K
	ZVGQ/X5H/sOfKHHyIYcnSgfQiHdHA41Vh4CWytOm0TKWt797lSJQAnS+AIrJ7eOWalzhqu+B+y8
	h1YPn4Qlvjjz8lNI/PWEZBV4lfAwxZUb0FRlA==
X-Received: by 2002:a05:6a20:a126:b0:3de:5ca1:dfe2 with SMTP id adf61e73a8af0-3de5ca1e4demr3960363637.4.1790628501681;
        Mon, 28 Sep 2026 13:48:21 -0700 (PDT)
Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com. [74.125.229.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78773acfasm5090822a12.0.2026.09.28.13.48.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 13:48:21 -0700 (PDT)
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-148c3a4733fso736155c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBywH3D8FkUoJk1dK2+RwI+67MCJj4L3MzHZnnxM0H35Eibd6fmd3xDHahLS9lduX1FERHxxKUy331cviN4=@vger.kernel.org
X-Received: by 2002:a05:701b:2705:b0:148:aef3:a2aa with SMTP id
 a92af1059eb24-148aef3a530mr7204133c88.42.1790628499772; Mon, 28 Sep 2026
 13:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928120252.GB4406@killaraus.ideasonboard.com>
 <CANiDSCv5pd-3aO0Eb1-rvsAOGNpB4rhpjtnTosU6Ca+xBxN1qQ@mail.gmail.com>
 <20260928122450.GA166131@killaraus.ideasonboard.com> <CANiDSCuBFLYXFbq7Vox7AhdhftfzC9Ga6FKL-2F1o08cHQjoAA@mail.gmail.com>
 <20260928124109.GF157191@killaraus.ideasonboard.com> <CANiDSCvvJd0_taNYvHm894kPpyOWQ+TaxC_XRVOs5qrUHod08Q@mail.gmail.com>
 <20260928184429.GE210522@killaraus.ideasonboard.com> <CANiDSCs8N-m1F7LMuerVbYF8xrBPBeVTg2_UX4p6M7g=9yz_Sg@mail.gmail.com>
 <20260928194459.GH210522@killaraus.ideasonboard.com> <CANiDSCs4WOB7jpyXHEAjGOGYf4_69OmUW3LdpB_cxQDmfHr-_Q@mail.gmail.com>
 <20260928195500.GI210522@killaraus.ideasonboard.com>
In-Reply-To: <20260928195500.GI210522@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 22:48:05 +0200
X-Gmail-Original-Message-ID: <CANiDSCvfuz0Kr-Ud4N13pSrdkdjUGtWuHkpYC+o7G39qvnkfHQ@mail.gmail.com>
X-Gm-Features: AclHuK9uEJ81QEEoQTkptGz8XRpIZzP4J1cMv3E_B3ad8LAXHWDyXqc3q0Vji-o
Message-ID: <CANiDSCvfuz0Kr-Ud4N13pSrdkdjUGtWuHkpYC+o7G39qvnkfHQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix bounds for descriptor parsing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 21:55, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 28, 2026 at 09:49:05PM +0200, Ricardo Ribalda wrote:
> > On Mon, 28 Sept 2026 at 21:45, Laurent Pinchart wrote:
> > > On Mon, Sep 28, 2026 at 09:03:41PM +0200, Ricardo Ribalda wrote:
> > > > On Mon, 28 Sept 2026 at 20:44, Laurent Pinchart wrote:
> > > > > On Mon, Sep 28, 2026 at 04:03:15PM +0200, Ricardo Ribalda wrote:
> > > > > > On Mon, 28 Sept 2026 at 14:41, Laurent Pinchart wrote:
> > > > > > > On Mon, Sep 28, 2026 at 02:35:29PM +0200, Ricardo Ribalda wrote:
> > > > > > > > On Mon, 28 Sept 2026 at 14:24, Laurent Pinchart wrote:
> > > > > > > > > On Mon, Sep 28, 2026 at 02:10:26PM +0200, Ricardo Ribalda wrote:
> > > > > > > > > > On Mon, 28 Sept 2026 at 14:02, Laurent Pinchart wrote:
> > > > > > > > > > > On Fri, Sep 11, 2026 at 01:23:50PM +0000, Ricardo Ribalda wrote:
> > > > > > > > > > > > uvc_parse_control() passes descriptor by descriptor to
> > > > > > > > > > > > uvc_parse_standard_control() with the number of bytes remaining in the
> > > > > > > > > > > > buffer, not the number of bytes of that descriptor.
> > > > > > > > > > > >
> > > > > > > > > > > > Because of this, malformed descriptors could leak over the next
> > > > > > > > > > > > descriptor, leaving malformed data in our structures.
> > > > > > > > > > >
> > > > > > > > > > > What issue does this fix in practice ?
> > > > > > > > > >
> > > > > > > > > > Look into uvc_parse_standard_control().
> > > > > > > > > > Let's take the UVC_VC_HEADER
> > > > > > > > > >
> > > > > > > > > > Imagine we have a malformed control at the beginning of the descriptor that has:
> > > > > > > > > >
> > > > > > > > > > buffer[0] = 3
> > > > > > > > > > buffer[2] = UVC_VC_HEADER
> > > > > > > > > > buffer[3] => Beggining of next control
> > > > > > > > > >
> > > > > > > > > > With the current code, buffer[3...X] is parsed as UVC_VC_HEADER.
> > > > > > > > > >
> > > > > > > > > > What does it fix in practice? It avoids that data outside the controls
> > > > > > > > > > is parsed as part of the control.
> > > > > > > > >
> > > > > > > > > I understand that, but what does it fix in practice ? And have you
> > > > > > > > > encountered a device that exhibits such a problem ?
> > > > > > > >
> > > > > > > > I have not encountered such devices, but even if they do not exist
> > > > > > > > they are easy to emulate and use for escalation.
> > > > > > >
> > > > > > > That's what I'd like to understand, can this be used for any kind of
> > > > > > > escalation ?
> > > > > >
> > > > > > It is very difficult (impossible?) to prove that something is not
> > > > > > exploitable, especially as the code evolves.
> > > > >
> > > > > Regardless of whether or not all the bytes parsed by the
> > > > > uvc_parse_vendor_control() and uvc_parse_vendor_control() functions are
> > > > > part of the control descriptor or are split across multiple descriptors,
> > > > > they all come from the USB descriptors buffer and are all ultimately
> > > > > under device control.
> > > > >
> > > > > As far as I can tell, all this patch does it add a check on buffer[0]
> > > > > but has no impact on anything else. If a device can supply USB
> > > > > descriptors data with an invalid buffer[0] that currently causes any
> > > > > type of issue in the driver, the same device could supply the exact same
> > > > > USB descriptors with buffer[0] set to a value that will be accepted and
> > > > > still cause the same issue. Am I missing something ?
> > > > >
> > > > > > We could spend hours trying to craft a payload, plus extra time in
> > > > > > future reviews whenever uvc_parse_vendor_control() changes. It is much
> > > > > > safer to just enforce the correct bounds now.
> > > > >
> > > > > So is your concern only about introducing issues in the future without
> > > > > noticing ?
> > > >
> > > > My main concerns are that the function's API looks wrong and yes, it
> > > > could introduce bugs in the future.
> > >
> > > I agree there's a quite small risk of introducing future bugs. This is
> > > what I wanted to know, if there was an actual issue today (as in
> > > exploitable bugs), or if it was only a forward-looking change.
> > >
> > > > we basically have:
> > > > parse_field(void *data, size_t total_length)
> > > >
> > > > instead of:
> > > > parse_field(void *data, size_t field_length)
> > > >
> > > > btw: in parse_field we are ignoring the field_legth in most of the cases.
> > > >
> > > > I am happy to drop the cc and fixes tags if you want to consider this
> > > > just a boring cleanup
> > >
> > > As it stands, I think the risk of introducing regressions is likely
> > > smaller. bLength can't be completely off or the USB core would fail
> > > parsing descriptors. It could be smaller than needed while still
> > > pointing to the next descriptors, with the control parsing then using
> > > the first few bytes of the next descriptor, but the chance that would
> > > result in values that don't cause observable weird effects are slim.
> > >
> > > So I think we can merge this change. I'd drop the backport as we're not
> > > fixing any existing issue. And maybe avoid "Fix" in the subject, to
> > > avoid autosel being triggered ?
> >
> > sgtm. Do you need a v2 or can you modify it locally when merging?
>
> Can you tell me what you'd like as an updated subject line (and include
> commit message updates if you think that's relevant) ? I'll then use
> that and apply the patch.

How does

media: uvcvideo: Bound uvc_parse_*_control to the control size

sound to you?

In any case you are usually better than me at writing commit messages,
so feel free to change it to anything that makes you happy :P


>
> > > > > > As you said, the risk to break current hardware is low. If it happens
> > > > > > tis change is small enough to make it easy to revert.
> > > > > >
> > > > > > > > We add minimal code and solve a family of bugs. Do you think that it
> > > > > > > > is a better pattern that uvc_parse_vendor_control() and
> > > > > > > > uvc_parse_vendor_control() have visibility beyond the control that
> > > > > > > > they are parsing?
> > > > > > >
> > > > > > > I'm concerned that some devices may stop working. The risk is likely
> > > > > > > small though, but I'd like to understand what we get from this patch to
> > > > > > > see if it's worth the risk.
> > > > > > >
> > > > > > > > > > > > Change the code so we pass the actual length of the descriptor to the
> > > > > > > > > > > > parser.
> > > > > > > > > > > >
> > > > > > > > > > > > Note that this makes the existing check more strict and some devices
> > > > > > > > > > > > that are wrongly parsed today will not be probed now.
> > > > > > > > > > > >
> > > > > > > > > > > > Cc: stable@vger.kernel.org
> > > > > > > > > > > > Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> > > > > > > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > > > > > > ---
> > > > > > > > > > > >  drivers/media/usb/uvc/uvc_driver.c | 7 +++++--
> > > > > > > > > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > > > > > > > > >
> > > > > > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > > > > index e289cc71ba98..429f1ab19a2a 100644
> > > > > > > > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > > > > @@ -1248,11 +1248,14 @@ static int uvc_parse_control(struct uvc_device *dev)
> > > > > > > > > > > >        */
> > > > > > > > > > > >
> > > > > > > > > > > >       while (buflen > 2) {
> > > > > > > > > > > > -             if (uvc_parse_vendor_control(dev, buffer, buflen) ||
> > > > > > > > > > > > +             if (buflen < buffer[0] || buffer[0] < 3)
> > > > > > > > > > > > +                     return -EINVAL;
> > > > > > > > > > > > +
> > > > > > > > > > > > +             if (uvc_parse_vendor_control(dev, buffer, buffer[0]) ||
> > > > > > > > > > > >                   buffer[1] != USB_DT_CS_INTERFACE)
> > > > > > > > > > > >                       goto next_descriptor;
> > > > > > > > > > > >
> > > > > > > > > > > > -             ret = uvc_parse_standard_control(dev, buffer, buflen);
> > > > > > > > > > > > +             ret = uvc_parse_standard_control(dev, buffer, buffer[0]);
> > > > > > > > > > > >               if (ret < 0)
> > > > > > > > > > > >                       return ret;
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > ---
> > > > > > > > > > > > base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> > > > > > > > > > > > change-id: 20260911-uvc-ctrl-bound-9c1940f06fc7
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda
