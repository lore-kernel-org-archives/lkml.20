Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609511;
	b=WjmpbaTwZVtfzUJkk/nN9Fz/y9NQLmN9mFwDdxUzGyR4kmISiD1u9RHJ5CBx6GMIT2DB
	 KTtFGpPr0UhcAxS2juzjhXeSXMVaTPfFerRfwHxgo8pPAQtynzonfXi3fFrx+WrwtUAlq
	 PmTH5xzu4ZIbE5JX0tO+KqxFZZoqgXSCxr2J9f5IkY9PAfKYQ23e1rldC1VqYkGKSaDPu
	 HgKG3weifHwC79RJMQ9357poCD85JVaV20/cQTbVFLunq49BQKADrGabXOF3XBT5eCSTz
	 9xFu4GOURTTvdOrXrpf0z6SseBovC80iB5b6A+ETi2VJQxQGZLiEdVPiuEcUaD1qJIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=yaJdLtbHiyXcMFgqBwOm4F2HMHkjIk9pI39u14xSXTs=;
	b=J8whVLMR4MzSXlXfyCkNr7fGnWRFO3CPC99OvEbkJ04z6Sbatm5Xn0k7/Sx/9XxWZXCF
	 N5zGcJoWpR+F2zbqpg3yyr+h8DLEYu370pIUKEJc68jaMVFJ8+2aDlkttGsfXxkrGNN4g
	 2YNVdNXLJ+dezl4QN4aNrDC5WH303mmxivzfmPZUFCrN5IWp3Re5DTBqFRlVIgojJ21u8
	 n0FgMR+XcP3R64NkOxcQYuheyhK8pzdp0Wy+ARBVwfsGJ/dM+7FqybwPkCjdQcKhQmKMc
	 mphYPU4enEY4o1AmwDiKm/I2streop/F38ZFlvDhiLReJO8VztaR86FJ0HVuBMfkgSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4nwAY1P;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF020606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF020606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4nwAY1P
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-98a92bfbaf4so19325241.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609510; x=1793214310; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yaJdLtbHiyXcMFgqBwOm4F2HMHkjIk9pI39u14xSXTs=;
        b=Y4nwAY1PUnhUPsod3xsOe4vSz3BdH7CTjZVRfsJUOSi8y9Fyv2GhnINFyj3tDTHuiy
         pDqjQXao+lgJ0RoRiZMkSnaO/QULUP9Iu/j6l7wF4w0XNWsR3J5nJW35zV5ZNPgVTPvg
         6PJHEPQ9gPeKnIJ2HvJXmnyC4oP/mEGrs968lRmkPBJ9dri6XZKVNRL5g0Jb12tWY0YM
         KLQp2VAfY9BXImg/TZgrn0EFlYKoS4L5N24SmeX0a2i4YS7lxp0/4u600ynAWzOW56Pk
         7Dc4BYk+xTOcld2iGpMW3tsHx7EKG8ZgbZl7BRg0wUsSDA0WD2H8iQAvPS1b4uslPRmK
         28yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609510; x=1793214310;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaJdLtbHiyXcMFgqBwOm4F2HMHkjIk9pI39u14xSXTs=;
        b=b3AKmji2umaYllipF3cuqaucd6DLMsl1xq5nQVSJIuBRagsfLwFs1i/louDYxBhuVt
         5Ka79HdOGfROspEhilVwr3xvWRIc7R/XqsFstga0GZG8TybmjORt181+Ra+G8vwBNMpn
         zGQKDAs5pdJejGa8eAsNFPqMiVzUiVKpCT7MB86D5TPx47v6zMe50sVAqC+HcJA0Jyt4
         ge0Pv5uc3JQJXzDDJW1cm6SWujyKTWCaA3kmTP+u6QnfvCSdznm84qLgs335cFBs7/AZ
         tdpIfVy2HGaf0xN4R5IifJR1qrRuVcs75Yxb8tly3VYr7Sa8o7sN0crY6Ymeb/hnrmRF
         aBuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYL4K3AQ3HGcAyo3tywl3oCoE1MiOS3GGOU5ownl5NrwKgolbYup2/La1tinAf6Ha309OB6QGn7CoBCpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhjc1tF+L6MqopHy89guekyGAVdY17itDkfkbypJlFeTVfdFOS
	CdUA3vEJrd9WqHxZKx4tlJhvPetrR1xHMexF7qTk2RWYuEqKtpyfha32
X-Gm-Gg: AYBFou04ORjY9PcIow8v3Tj+IUC63UlHyArXbFO5171HL+Kib9lyRdHm9kjLOduQTKS
	QN9+uSEyIAwTcEu8E+bPAe/Gj6Q4784RufnW8uTMHnBRm7YZDEOzcVhbZXBzH9z213bZZusTpza
	xOtEolQoZuoyZBcJsD/cQBe/oKpWmpPMDBLLGl7zpJ4tVyJr62JkzNrJkdKeZTFNT6LLfFVeS1Q
	o+JWcFjX3z31dwpXEidczcMGn+DcbCKkqp5g+vO7BWf7tx/56wMSa3gJy3Xj9llmdiqkTSEP6QH
	W3o84yOfb1+PSPzLnpJo+zYaUAkbQDI3pNZza/BNXceOkHainR4Xolack9y4uNy3I+U8k+6o29v
	UauNtI66rzy6GezdXAn8LEzoocUFbdOoNYGC5ZNTkYWdHM0SnF2SW54vkHuSC0qlJVnW0uBmB+m
	lPJipnIsHd2p9N6n68HtS88i55QnBl8EiULyLryX0wFPOyJgCNvhDsvHIzf7OYJMgUHAJX3zgEd
	17Jjzi/Ij0wnSlrfZsiForu8UOVrcROUleRyJpOAJ+MIze1dbA=
X-Received: by 2002:a05:6102:3e92:b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7cc92461809mr1156246137.1.1792609509675;
        Wed, 21 Oct 2026 12:05:09 -0700 (PDT)
Received: from localhost ([2802:8012:39:ac00:85dd:f0f7:d2d2:5158])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc921b6094sm3818360137.1.2026.10.21.12.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 12:05:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 16:05:03 -0300
Message-Id: <DMAR194TTSQN.1VUF47V1A3YUX@gmail.com>
From: "Gaston Gonzalez" <gascoar@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>
Cc: "Florian Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Stefan Wahren" <wahrenst@gmx.net>, "Phil
 Elwell" <phil@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain" <uajain@igalia.com>,
 "Kees Cook" <kees@kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com> <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com> <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com> <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>
In-Reply-To: <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>

On Mon Oct 19, 2026 at 9:26 AM -03, Martin Wetterwald wrote:
> On Sun, Oct 18, 2026 at 9:53=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.co=
m> wrote:
>
>> Running 'speaker-test -t wav -D plughw:1,0 -c 2' crash the system, so
>> thinks seem not to be working with that interface.
>>
>> Im trying to debug what happens in that condition; I will need a couple
>> of days I guess. So far, this is what I could check.
>>
>> Any feedback on the test or debugging would be appreciated.
>
> Hi Gaston,
> Thanks for digging into this.
>
> The patch only changes when the VCHIQ bus and driver are registered durin=
g
> boot. So it's enough to check these two cases to validate the patch:
> - without my patch: dmesg shows the "unable to register with bus_type
>   'vchiq-bus'" error, and bcm2835_hdmi is absent from /proc/asound/cards.
> - with my patch: the error is gone and bcm2835_hdmi is present in
>   /proc/asound/cards.
>
> (Since the Pi Zero has no Headphones jack, you need to test both cases wi=
th
> snd_bcm2835.enable_hdmi=3D1 in the command line. Otherwise the card never=
 shows
> up, even when everything works.)
>
> Could you check these two cases?
>

Hi Martin,

Results on the two cases:

Case 1:=20
    - dmesg shows 'Driver bcm2835-audio was unable to register with bus
      type 'vchiq-bus' because the bus was not initialized'.
    - cat /proc/asound/cards shows only: vc4hdmi.

Case 2:
    - dmesg does not show 'Driver bcm2835-audio was unable to
      register..'
    - cat /proc/asound/cards now shows:
        0 [vc4hdmi  ]: vc4-hdmi - vc4-hdmi
                       vc4-hdmi
        1 [HDMI     ]: bcm2835_hdmi - bcm2835 HDMI
                       bcm2835 HDMI

So your patch works on the Raspberry Pi Zero v1.3.

Regards,

Gaston
>
> Testing that you can hear the sound going through bcm2835-audio is a full
> functional test that goes even further than the patch: it does not only t=
est
> bus registration but also that the audio driver is working.
>
> On my side, without vc4-drm, I can successfully hear sound through both b=
cm2835
> Headphones and bcm2835 HDMI:
>
>   # aplay -l
>   **** List of PLAYBACK Hardware Devices ****
>   card 0: HDMI [bcm2835 HDMI], device 0: bcm2835 HDMI [bcm2835 HDMI]
>   [...]
>   card 0: HDMI [bcm2835 HDMI], device 1: IEC958 [IEC958]
>   [...]
>   card 1: Headphones [bcm2835 Headphones], device 0: bcm2835
> Headphones [bcm2835 Headphones]
>   [...]
>
>   # speaker-test -D plughw:0,0 # (HDMI)
>
>   # speaker-test -D plughw:1,0 # (Headphones, not on the Pi Zero)
>
>
> If you still want to output sound through bcm2835_hdmi (optional):
>
> There can only be one owner of the HDMI port: either the firmware or the
> kernel.
> When the Raspberry Pi boots, the firmware first owns the HDMI and display=
s a
> rainbow splash. Then it launches Linux.
>
> There are 2 ways for the kernel to deal with the video output:
>
> 1) With vc4-drm (CONFIG_DRM_VC4), the kernel takes over the HDMI controll=
er
>    from the firmware and handles everything itself (this is your case).
> 2) With simple-framebuffer (CONFIG_DRM_SIMPLEDRM or CONFIG_FB_SIMPLE), th=
e
>    kernel leaves the HDMI to the firmware and just writes pixels to a
> memory area
>    (the framebuffer) set up by the firmware.
>
> I get a similar problem on my side when sending sound through bcm2835_hdm=
i with
> vc4-drm loaded: my screen shuts down (but the kernel is still alive).
> It most likely comes from the firmware and the kernel both trying to driv=
e the
> same HDMI port: with vc4-drm, the kernel owns the HDMI controller, and th=
e
> firmware (which bcm2835-audio talks to through VCHIQ) is not supposed to =
touch
> it.
>
> A simple way to output sound through bcm2835_hdmi is to not use the vc4-d=
rm
> driver at all, and use simple-framebuffer if you still want a display.
>
> To remove vc4-drm:
> - Do not compile the driver into the kernel (CONFIG_DRM_VC4=3Dn) or black=
list the
>   module.
> - Remove any vc4 overlay in config.txt file (e.g. remove dtoverlay=3Dvc4-=
kms-v3d).
>
> To enable simple-framebuffer, use one of the two configs:
>
>   CONFIG_DRM=3Dy
>   CONFIG_DRM_SIMPLEDRM=3Dy
>   CONFIG_DRM_FBDEV_EMULATION=3Dy
>   CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>
> or, the older way:
>
>   CONFIG_FB=3Dy
>   CONFIG_FB_SIMPLE=3Dy
>   CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>
> (FRAMEBUFFER_CONSOLE=3Dy, and DRM_FBDEV_EMULATION in the DRM case, are on=
ly
> needed to see the boot messages on the screen, with console=3Dtty1 on the=
 command
> line.)
>
> If you have remote access to your Pi Zero (either through network+SSH or
> through serial console), you actually don't even need the simple-framebuf=
fer:
> you can just remove vc4-drm, and let the firmware display its rainbow spl=
ash on
> the HDMI port.
> Then you can login to your Pi Zero through SSH for example and launch
> speaker-test.
> As long as the HDMI video output is active, it's enough for the sound to =
be
> able to go through, even if the image was not drawn by Linux.
>
> But again, this full functional test is optional.
>
> Regards,
> Martin

