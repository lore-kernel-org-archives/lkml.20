Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D048824679C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792276080; cv=pass; b=rmvsRm5rUaMxBBxe1Zj2u691xbIQ5W0Og0BWJCBpESQSXjA83htCb3e6XKjDYglObcmeM1B1zwlcxAqhzmkAsnCVF5WTTbnjCw3k7qCT471tMyIpSPFWrKkdD2w3XJ97aViRHD4cMPD3thiuI+kmNm9eo9n6X6wvBdgAI9iPGMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792276080; c=relaxed/simple;
	bh=8GjnVBLgBaYv1z0rdaECWqGcaPppZMfW2GOTX765nuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFENuR4jpED5jueWiV2KJn9asYOWS9igOKvgfZkQmkecWLUoR89CQ6BsOPahevHYNKl6+Yp+e+Du5U6KT71R61gUJE1EBjIG2IVZHiVr3nwaFxWbknJ1V1fPn+2nOmuNkY7plzC+exL2z/8ZmZUgyvbm83YWaj7FCPNX2XlM/Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8XCX/4P; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8XCX/4P"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso1481515a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792276077; cv=none;
        d=google.com; s=arc-20260327;
        b=CId7M97vhIKBOJbKwfcPIZgM7KY2nMkoTvAzYgxwnBHjgCsOU11eLJ63+RGT6xzXLp
         OWFP90qLGln7fLvNIphPbCu6UWbZz2XRkfHxFhtlSQfFD4ZcBiwEEAVrWcRnA333ZOkL
         rsTs0bHOBO5ae7GgTavFyPQRiL4Sxt8Gh6zH71wlH/y1Mm7wJlkHa7ODBzi/wjnbKwDh
         sQyutLcwgSIcsCxJU8LrtBKzoNWYHOIsTNUBuy+QsHCV7WehLWI9NzlghruCyyFp+RBp
         kylwKvdV4MxPzknURjJrazI35lTgvvTGdhBKyNixOJP85/xdN0nu2ne3asGGGzYHwdIP
         mphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5DtMVKHLYZFrVZWABcgGlrAwjSrKQ0wsgdgM1oLN6EY=;
        fh=TTaqgR3b6DFgshuaF4s93A5l4pOWg/WvDhSnnqE95fw=;
        b=ljgn0X6dleAokHS5TI61NafOOf1RbnDnWjekIISdvZQw+9ZZMtmDB8x9GXwpStzHFP
         sH+dy1qrJrh2034yAZwCsB7t/Xw8l6Q5N0gQsilNwT+dKllvYtVLjvm8E7q3iXVTea2C
         83+4jZzb8I9jVr80750Q2mLTlNSTwku478B20PUznzGfUza6bFgQVTtYGS1Zy2jMs+Ro
         Q/x+7OWmnl91Hof8MjPginRQHowCooPb5xzzfdj9AE4NmIwCVAksROgJ7DhGF/1x58cE
         w9mrrXXhOn/BF0yePeRNbxA5gzWCAkaoA40EDpRG5zX0Xf6vUwGoR0/O9Ft5yXj8jh7f
         JHWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792276077; x=1792880877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5DtMVKHLYZFrVZWABcgGlrAwjSrKQ0wsgdgM1oLN6EY=;
        b=P8XCX/4PZjMIyzdqZh2YzZJRqEsAY0Z4H889gtivGJ6Kg0Y0jAeGDAKHq2oOk1NiYA
         kehdeC5YQtTmJwffJF6rfjrXDEO01QKISuP/PpAyJa5xm6RUljH7PO58PDDG7K50NVkt
         vgcBhxxZt9IGts8U6sXdvXrV2qqnlz5wCsdiNkA2zH+KxLcevH6UdPVxHqingospVdE4
         T9+bOC8bhyoCibSFCswaDCPbJJnyU1VGbvaNNRehAv9wQSttwthVBBOpiFPMgki52qla
         To32JxcS8/8IPeOJookuRx6GmZm+za74AIjVh4TFyBDW5n6eOk9u93/U+RbghBsFZEes
         2QCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792276077; x=1792880877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DtMVKHLYZFrVZWABcgGlrAwjSrKQ0wsgdgM1oLN6EY=;
        b=maAUFkBRwo7CYsdgItsNOiJSOB0hNW09Fw9r0voeXOEQ6EUynlfoahRpsCwBfbRAG+
         m4gc5pHRiGIuhNZYJ9JmhViIBGz48B4lVYuBkDBkpp8hSZFdSo+i9AUIiBA139R6KFMR
         fURe3aLD1AvkTcTltH5WWKb1iJPyfjB/ElxcCwvPA5w1TmZnGtk2NLSCnQgO/fCV5eiI
         cZDB5noeC60dLx48hU+NmCEj3QIX2p7YOoI4qVT+Dw+m5Ky1braWYQnj/B6pgt/5J+N+
         nzVsCDYYSfRcumwjrT7YfievCsoLr0oj+p44RfdbLD0IEi28W32RlE10aAhNbgbaIRe/
         9hZg==
X-Forwarded-Encrypted: i=1; AKwUvBzO3c4Bvcv2tlZuI9+xkyOxsXXf0W73He0oCjdsf/oR16eAh3q0RyvFs2zQTLRjwn38SFjVtxRtqJXYSMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAjt3KpAlZaDIs6Is73yXJkKMwk42HETlsX+iIGyVaWYfoQffv
	Q4N3Uh+CjKMZBMCLJpSiWrePFRLMVpSnVgTuDuLGZJd/qt0HxeRY1NlZ5HsfBMDdmpBd+9SweD1
	xQIKsb+VwgIHe4FxeTPAa7KHvJpxRDGo=
X-Gm-Gg: AYBFou0P1Ck9t41gSQL5PXPP8aTw8uHcGlD+Pt22qWTpUiLuyZipjx9H1nmCbrs+xfh
	BOrwlqRYsznW1yMyIN/vTS0kpKoaqNIrV1i0HNwmfMY4Ht9zSLmukz3JE092PxmjXe2JC+dWcF3
	W8bQEzHI0IVe+BgfgtZJCCtIi2DtuE601hwwMDeCJG37u/vNfaenLXE1F/RHQYzK3t4poU3fzBE
	Kd4UhOG0dZffI68qQNOuNvzFF0nfUYaUdwzbpHE28nlJr5moEQcEoA6fe8btun2Y1EKHzEHMHav
	NzfOt2GtXAcRgDwdO2xwWBklQFcPbj+kr/7/qeDf9BBAlbnKfea5a73peN+246QKdPuldQCdncp
	N6vEvMviFSpn+fJsCWcLHOcXTZA0x91hokG7D8qSwhHQT0s9ADq04rkkNXmLdKW1qKD69HUGemc
	HFouM=
X-Received: by 2002:a17:907:930e:b0:c40:eb1a:4c8b with SMTP id
 a640c23a62f3a-c419fded7ccmr227588666b.29.1792276076901; Sat, 17 Oct 2026
 15:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004213755.554191-1-voytikd@gmail.com> <e7c99dc5-dfa4-4ce7-b7da-a3a70a2710a8@roeck-us.net>
 <CAAX90H0qGF-H8BYcmT_vbUGoqN9RbfeGxMdTTRyQPK_h8MzFhA@mail.gmail.com> <053269a6-41ab-41eb-8756-b6a04eea2e5a@roeck-us.net>
In-Reply-To: <053269a6-41ab-41eb-8756-b6a04eea2e5a@roeck-us.net>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Sun, 18 Oct 2026 00:27:32 +0200
X-Gm-Features: AclHuK8tE_N4UG79q7e2DudOKyQpIuX0mkjOdoteD9hdJcJ3YMDpvAHZdwNlj9g
Message-ID: <CAAX90H1-tzrH6hwHHrvfQi2e-TXQKmgNy0Lj2TXG7yDbKYy3Og@mail.gmail.com>
Subject: Re: [PATCH] watchdog: allow WATCHDOG_PRETIMEOUT_GOV_SEL=y
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 11:42=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 10/17/26 08:59, Dmitry Voytik wrote:
> > Hi Guenter,
> >
> > Thanks for reviewing the patch!
> >
> > On Fri, Oct 16, 2026 at 8:21=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 10/4/26 14:37, Dmitry Voytik wrote:
> >>> Fix the issue when WATCHDOG_PRETIMEOUT_GOV_SEL can't be set to =3Dy,
> >>> and always is =3Dm.
> >>>
> >>> The issues can be reproduced with the following steps:
> >>>        make mrproper
> >>>        make defconfig
> >>>        ./scripts/config \
> >>>          -e WATCHDOG_CORE \
> >>>          -e WATCHDOG_PRETIMEOUT_GOV \
> >>>          -e WATCHDOG_PRETIMEOUT_GOV_SEL \
> >>>          --refresh
> >>>        make olddefconfig
> >>>        make mod2yesconfig
> >>>
> >>>        grep '=3Dm$' .config
> >>> returns only CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL as module:
> >>>        CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=3Dm
> >>>
> >>> "make menuconfig" doesn't let it to be switched from =3Dm to =3Dy eit=
her.
> >>>
> >>
> >> This does not explain what the problem actually is that is supposed
> >> to be solved with this patch. Since this is just a selector used to
> >> enable other configurations, and the configuration option does not
> >> result in any packages built, "WATCHDOG_PRETIMEOUT_GOV_SEL can't be
> >> set to =3Dy" on its own is not a problem.
> >
> > The issue is that
> >    make mod2yesconfig
> > doesn't work as expected. Help says "Change answers from mod to yes if
> > possible".
>
> This does say "If possible".
>
> > I might have misunderstood it, but I thought all configs should be =3Dy
> > for this make target.
> >
>
> $ make allmodconfig
> $ make mod2yesconfig
> $ grep =3Dm .config | wc -l
> 51
>
> Not really.
>
> > Maybe a dumb question, but why does only this config have " default m"
> > and others use
> > "default WATCHDOG_CORE"? Does it have some special meaning with "defaul=
t m"?
> >
>
> Again, this configuration option is only used to set the (default) value
> for the watchdog pretimeout governor, and the "=3Dm" states that the defa=
ult
> should be WATCHDOG_PRETIMEOUT_GOV_PANIC=3Dm, not =3DWATCHDOG_CORE.

This doesn't explain why it's =3Dm by default.

> > I want to have no modules and still not disable the module load
> > ability, and it annoys me
> > that some configs don't allow "=3Dy" :-) otherwise when I do
> >   grep '=3Dm$' .config
> > I need to remember that CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL is a special=
 case.
> >
> > FYI, for Arch Linux based config, only
> > CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL pops up with =3Dm.
> > A fix for the same issue with CONFIG_TDX_HOST_SERVICES seems to be acce=
pted:
> > https://lore.kernel.org/lkml/as04AoNxjzlvh-K8@thinkstation/
> You are comparing apples with oranges. That commit states:
>
>    Fix the issue when the driver always gets compiled as a module.
>
> There is no module that can or will be compiled based on
> WATCHDOG_PRETIMEOUT_GOV_SEL.

Sure, I understand that. What is the semantic meaning of making it by
default =3Dm? And why can't I make it =3Dy?
I understand the build artifacts are the same, but I'm curious why =3Dm?
Why WATCHDOG_PRETIMEOUT_GOV_PANIC is not =3Dm by default?
Thanks for the explanation in advance!

> Guenter
>

Best Regards,
Dmitry Voytik.
