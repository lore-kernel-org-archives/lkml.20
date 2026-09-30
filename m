Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38D13C1D42
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749652; cv=none; b=mcGh5u2EHu3nNuN4UU/+f1cDJ7c5zvAobpDNa9p9o70xsqO+afcYDOp+ESbTZtn25dBgnxlq2pPc3pI/7fy7z5QvmVDmFHlAHb3WSQVTz0SQU07DXeQntquv8YtsxeX6CP8eCRreHdvqOENuFkK2+0K+58IKwcQEavvpW3L09ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749652; c=relaxed/simple;
	bh=GJNgEKqztoFxFEvYnJMG3Ai2a3tKs0b85VlnyR58z8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2Vc3cNgWFK1wWsw3yZmxUYAUlE2ls2u18djSo+2xdUbLiWHJ+/9ZKBQGGww6N84Dpm03iLHLxLx5Row0C5fizIkJQ338yhJ0eJeIfdbnNxp3tuIipg8j5jI2ELvjDsi/65bczF5hifWue9axWCAvVL4o8piglFCY8G5MA9ASLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OSKU+N5X; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OSKU+N5X"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so3304089a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790749650; x=1791354450; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lc1qIpsrNbX+GFd8HSn+Cvyk4IOwYzMrYFI4KpEuUyw=;
        b=OSKU+N5XH4KbTSOkit1XMJYVLOeqkhL8cD2J5Hjp4XZKYA0jdG5d1VAiRoysmTpzJZ
         Zd00K09GFe3ewSXrgeTKUBx6TUmmEuCckIdq3HI7UBRu8NyEU1EvpUAz49jHMtA0fFm6
         KBWkJnSEHkwMaoHnY1pjj2zBW3IpfT3KDSroY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749650; x=1791354450;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lc1qIpsrNbX+GFd8HSn+Cvyk4IOwYzMrYFI4KpEuUyw=;
        b=KkQUHMbyM1KciE2TzCCoE0aNvuv9KvAez63JD2HLdKPLT9S56rcDRl4vhLSLcuKRR2
         EWf+JCFWPaT0uspCwRdgEfghNTuFl2mP81JuOx9xZkfjE2OA5sx3GeBK32Gv95Mcfc2O
         imqz8Vrt+qWyrHaLy1nfoBmTCG57aY18uj89K2r4rLvSLPgVYFDI0GFZTX2+vPx0JUch
         CQvBZrotrq2RUwho930AEmP0xKuiuOFxjlVLCNBzhkprXexhMORa7fNJTE2v5jGlGs3r
         8hI0wGCnuBRjF8Fjo7QycXgbv9zIBkLenyDGAdv2bOivZciquLtq5hGk/VZTI+/of3v8
         tUpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwc00FgP8K04QU2T3IHNDeLfr/dclDsU5QpsH46F1AtqlKZFj4kdoEt/tOIA2onKN4s7D0hRACMtNAt0y0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMGLm2suzw6U42dg4O0V22roc9vkLOXKs3IaxKjV3XkxJwj8pT
	SnRyuCogfSjrIioQkpvmKK2srH3FZbowaZJDtB+ORX6W2mqjRUvZLekOK0TJgRRh8ftxTySGfIZ
	MNz0=
X-Gm-Gg: AYBFou1ctHrKqvAJhuP1q6K8IHqnDQZsLwgl+8NFyua2/dq9oOhYu+nZ0WYWkVDcEk0
	Azxv26pNlFftvpfYfTLzb7VWIO+jFV1aqdvzkWb/SKQ69jcPH8XQz3RI3Fepb0xFjG/wagXnETq
	1IHQgN3+ESrpyNL19HRcq3IRpu0aj/FdmDcjSTJbUoBGP6h1oBOF6WLYjyyxmxxoYn+P2P8+N5M
	lTpgCUjGgVRa/zKUa0S0nJ0XqtdAfg5nyt+8RbhuS0PFL3wh+Ste8fTUGcx6JK5fa5vYddyRgW8
	W8hjaOMWRJO7ZW71KDazVTK8m8CuSkHPuQHHjHjnz8tP1zN+lbVXlAVfbQvwgvOUI6DPUbcGQnn
	v/+pqXUBvImWgHWJpxllluZXv/PYoL1l5JBRwLVCnsDOnP+JFlKfHDwqpHenqBSRbU3nERv6zug
	TnIJD0VFe7578c6vvIhRtqcYwM/IuJygIf4SgrgUuyPL/vVuULNtj4tUsMIGs14CQpT9fZMts+u
	+dVhxsW0guwmISSEBVRrhtHGeMZEQiU32kCmQ==
X-Received: by 2002:a17:90b:1d0d:b0:3a0:e476:576b with SMTP id 98e67ed59e1d1-3a4d179ece8mr445946a91.37.1790749650081;
        Tue, 29 Sep 2026 23:27:30 -0700 (PDT)
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com. [74.125.229.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca78102csm1736005a91.4.2026.09.29.23.27.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 23:27:29 -0700 (PDT)
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1460bcc512eso2926720c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:27:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBysP7OWz6ItqKrGC496oLDhte/XjmnEXo/mTSV4QtUPEx4hyXRLFEErsS6ufyzn+maZTpb6I3h7ftMxyCs=@vger.kernel.org
X-Received: by 2002:a05:701b:2719:b0:143:57c1:6242 with SMTP id
 a92af1059eb24-14d32bde9b9mr300065c88.26.1790749647410; Tue, 29 Sep 2026
 23:27:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+2YD=Nxe25n8rmM-DS+w+Pg0N_YtOf_znJXNMi77SCwk3OUyw@mail.gmail.com>
 <20260925205706.GA697101@killaraus.ideasonboard.com> <CA+2YD=P3pNVi=GJ1qoqnsgA56Hg_N6iT_AXGPDBHn9XToxh1KA@mail.gmail.com>
In-Reply-To: <CA+2YD=P3pNVi=GJ1qoqnsgA56Hg_N6iT_AXGPDBHn9XToxh1KA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Sep 2026 08:27:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCsuiPN=9PNb9gckRwgZXMEouYTac0_DgbO1Mti+p2zH=A@mail.gmail.com>
X-Gm-Features: AclHuK-fwd65UvzyRP5lPKeP_uJxaO37ohdi1sIivOyI8BaBY3Yurjj-DcNth6o
Message-ID: <CANiDSCsuiPN=9PNb9gckRwgZXMEouYTac0_DgbO1Mti+p2zH=A@mail.gmail.com>
Subject: Re: uvcvideo: Logitech Brio 500 (046d:0943) needs UVC_QUIRK_PROBE_DEF
To: Perry Joyce <perrygjoyce97@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hansg@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Perry

Thanks for the report.

Could you provide the output of lsusb -v -d 046d:0943 ?

If you want to try, you could send a patch like this one (but with the
right quirk):
https://gitlab.freedesktop.org/linux-media/users/uvc/-/commit/056dfb7bf8c9d62367bd600a175e072692df67a6

Thanks :)

On Wed, 30 Sept 2026 at 01:13, Perry Joyce <perrygjoyce97@gmail.com> wrote:
>
> Hi,
>
> Resending in plain text as requested.
>
> I'm seeing a reproducible UVC probe error with a Logitech Brio 500 (046d:0943):
>
> uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> uvcvideo 1-3:1.1: Failed to set UVC probe control : -32 (exp. 26).
>
> Kernel:
>
> Linux archlinux 7.2.6-1-cachyos-bore #1 SMP PREEMPT_DYNAMIC Thu, 17
> Sep 2026 07:33:37 +0000 x86_64 GNU/Linux
>
> The webcam otherwise works normally.
>
> Testing with UVC_QUIRK_PROBE_DEF fixes the initialization error:
>
> modprobe -r uvcvideo
>
> modprobe uvcvideo quirks=0x100
>
> After loading the module with 0x100, the device initializes without
> the probe-control error:
>
> uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> uvcvideo 1-3:1.0: Forcing device quirks to 0x100 by module parameter
> for testing purpose.
> uvcvideo 1-3:1.0: Please report required quirks to the linux-media mailing list.
>
> I also tested this across a reboot with:
>
> options uvcvideo quirks=0x100
>
> and the probe error remains absent. Normal 1920x1080 MJPEG capture at
> 30 fps continues to work.
>
> Device information:
>
> idVendor=046d
> idProduct=0943
> bcdDevice=0.21
> Product: Brio 500
>
> Would it be appropriate to add UVC_QUIRK_PROBE_DEF for this device?
>
> I'm happy to provide additional logs or test a patch if needed.
>
> Kind regards,
> Perry
>
>
> On Fri, 25 Sept 2026 at 21:57, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hello Perry,
> >
> > Your original e-mail was sent as HTML, which gets silently rejected by
> > the kernel mailing lists. Could you please resend it as plain text ?
> >
> > On Fri, Sep 25, 2026 at 09:31:42PM +0100, Perry Joyce wrote:
> > > Hi,
> > >
> > > I'm seeing a reproducible UVC probe error with a Logitech Brio 500 (046d:0943):
> > >
> > > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > > uvcvideo 1-3:1.1: Failed to set UVC probe control : -32 (exp. 26).
> > >
> > > Kernel:
> > >
> > > Linux archlinux 7.2.6-1-cachyos-bore #1 SMP PREEMPT_DYNAMIC Thu, 17 Sep 2026
> > > 07:33:37 +0000 x86_64 GNU/Linux
> > >
> > > The webcam otherwise works normally.
> > >
> > > Testing with UVC_QUIRK_PROBE_DEF fixes the initialization error:
> > >
> > > # modprobe -r uvcvideo
> > > # modprobe uvcvideo quirks=0x100
> > >
> > > After loading the module with 0x100, the device initializes without the
> > > probe-control error:
> > >
> > > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > > uvcvideo 1-3:1.0: Forcing device quirks to 0x100 by module parameter for
> > > testing purpose.
> > > uvcvideo 1-3:1.0: Please report required quirks to the linux-media mailing
> > > list.
> > >
> > > I also tested this across a reboot with:
> > >
> > > options uvcvideo quirks=0x100
> > >
> > > and the probe error remains absent. Normal 1920x1080 MJPEG capture at 30 fps
> > > continues to work.
> > >
> > > Device information:
> > >
> > > idVendor=046d
> > > idProduct=0943
> > > bcdDevice=0.21
> > > Product: Brio 500
> > >
> > > Would it be appropriate to add UVC_QUIRK_PROBE_DEF for this device?
> > >
> > > I'm happy to provide additional logs or test a patch if needed.
> > >
> > >
> > > Kind Regards,
> > > Perry
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>


-- 
Ricardo Ribalda
