Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1773337F31A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851933; cv=none; b=H4qZI0jkltmbMXElO34cRpAOiXY8BDtF/9mCaDAk9daCmgvIl05Af6DduCgOdIxii8H3hKA0D3bn/9I3xGpnwIKz9SVp1HQbirT60JxTONnM0bwrsB4pwTdG5MJL/X3Sr4D0/X5acQvAn0QyrlCmR/5ZJMHO9DY/u331FUoCzDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851933; c=relaxed/simple;
	bh=atHJUSU8jh/rAd34gcMPQ5DnJpjMvR7FLz3fOgQccno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REjUbeYRT1BGoSw8ZDoxq2rc4RrPhDfgYxQb6AGOm2+PeiYLnoSMxRlUN1ycGwgB0KZGjqqxRv2HpwTZmnow39P7ieSqphATv3MCJdOfyBgcGBr+TAjBzf0md/CZmGaR8PtMi9nqpizRWLcnc04/YsYZlpsDA4x9XaY3hRtDjRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso1709692e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851931; x=1789456731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASzOob7GnYKJXcWv8xLMRXcs4durQAzV6NwhNCTQzS0=;
        b=qpBcyqSYGEb9H73WbefqPSpcxOxKzUWqZrsMf5GP0hYgwduwFCqIBO8hAUd+AiQraF
         V6UXS5MohkHeZhJ/w0XFA76V9c73/KxcFVbXuAjyCoPUG1IfRSdlY2d0axkbSO5ONb6M
         /bkVidBJ4VD1z31fCy8xpLrBamt7Pf03nCSFCOaeVL+C38IFE1Kwuhka5x9G2I+qunby
         knD0U7i7ynd4jg+teEsjyPhlEKIsQDdY6WKD4JUNebO3TaxiP9Jv4Izn0nFguJJJR2Sa
         bdBY9lV4fRUcGoEHKAvPPHMOHb+wyQRdBtkR0jow8DfYo83MX4xv5ojkXTteJ8e58COa
         R5FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxd3Ic4SELVB4qwetTI9uuDpFKZZjQ9OB+I5+CQiXP9lntNFu4CWs6UJLFG9JVVFcXnKgoYJXWMfImP+ik=@vger.kernel.org
X-Gm-Message-State: AFuF++nzX5vamZLd5eRdeHGN5HhkzZ/bz6AfVyQmUG5znwSAB4/e186C
	y6okxaQLvG9HHMF1if04ZiijE9Srklg/ypbeTG2qSNQrcT3hjdjkOxEtfXvsgs+Y
X-Gm-Gg: AYBFou3YvZUkIFaKaLHYXLFOw0kVDF7559FmZgpqa7kdf3Q2jFJNkaBLPwDom6WmKqJ
	qfC4L8bNjp4Ywp4Wn+1y8aAcoEJNO/95OgUeTkuFlSUy3lnhybRsW0jN/MdhmVfz/jyQ7T0L2if
	oreepPIGxLKq5u/po0JF2f6ZVtgrxYjwl2p3tBEX+ag+LaTgI5vsC/c39TPQLs+djAGAu1cP+LS
	YBi5jt7dJRDfr31cfyasLfREunH8JO1PWykA/0CWWRwpaj5DbO0aLYdTPoU5TePwLccpu6iaq2l
	Fj9Vy5FWYxbpHw6wQPEsQu0iWreZGaWTZ7xIZGiSFJFnPVeZ/DgNN2pIgvR32rwXdp5IIKQMwuf
	ydNMscVvgQ6XIgGnpg8jTRI4ulqS8eHpiWxjj+pwrvJLlGowqmVUp03bmC3b+rh6ee0M53WhjUY
	PI8V2bh9hekf/Xud53fCjHdGkY8pg4+zVtN2w26zUpvB53L1Vgl+O5mZcgrM95sAK8d7w0As07Y
	ZOXVsK1ywFJhqNIWVU4LIu+WQgoBj1grKzm
X-Received: by 2002:a05:6122:da0:b0:5c7:ae9a:a056 with SMTP id 71dfb90a1353d-5c7ed457809mr11508275e0c.8.1788851930844;
        Tue, 08 Sep 2026 00:18:50 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1eeaf3sm9426576e0c.6.2026.09.08.00.18.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:18:50 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97e986f1996so999081241.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:18:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwFbC46bSx4OKS1Ulk+xY1qZaTF5pnvGDSb84659c96ArO+PTyOhukgYH83y6CCEXTzAleM19/PkY2uyP0=@vger.kernel.org
X-Received: by 2002:a05:6102:5493:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-78a4a718223mr9320013137.4.1788851928902; Tue, 08 Sep 2026
 00:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827093948.2825531-1-lilinmao@kylinos.cn> <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
 <CAN5rfbSh9ZoUkReAqv9rHYowqKcZFa-Svy6LP-MHvqfBVhjdBQ@mail.gmail.com> <4f3c7184-1b5c-4074-b8a1-49261833df8f@gmail.com>
In-Reply-To: <4f3c7184-1b5c-4074-b8a1-49261833df8f@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 09:18:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoZBGyH=WeiTG4QCNC4hr_+pC4QQb-wjK0afZgMUy1Fw@mail.gmail.com>
X-Gm-Features: AcwNN1XmAqsgmY9dglWOajpNmnnts6xxj9nL1ZG-ZrxbM9jWTj4q9h8M9EtZsAE
Message-ID: <CAMuHMdWoZBGyH=WeiTG4QCNC4hr_+pC4QQb-wjK0afZgMUy1Fw@mail.gmail.com>
Subject: Re: [PATCH] fbdev: atafb: Restrict SuperBlitter to supported formats
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>, 
	Linmao Li <lilinmao@kylinos.cn>, deller@gmx.de, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Mon, 7 Sept 2026 at 22:14, Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 7/09/26 23:14, Miro Krop=C3=A1=C4=8Dek wrote:
> > On Sun, 6 Sept 2026 at 11:49, Michael Schmitz <schmitzmic@gmail.com> wr=
ote:
> >> Hi Linmao,
> >>
> >> thanks for your patch!
> >>
> >> Am 27.08.2026 um 21:39 schrieb Linmao Li:
> >>> The SuperBlitter operations derive an integer byte count per pixel.  =
The
> >>> accelerated fill path handles only one-, two- and four-byte pixels.
> >>> However, the operations are currently installed for every external
> >>> framebuffer in SuperVidel RAM, including planar 1/2/4/8-bpp and 24-bp=
p
> >>> truecolor modes accepted by the external video parser.
> >>>
> >>> For 1/2/4-bpp modes, the byte count becomes zero, so accelerated copi=
es do
> >>> nothing and fills fall through to 32-bit stores.  Planar 8-bpp uses a=
n
> >>> incompatible memory layout.  For 24-bpp modes, fills also use 32-bit =
stores
> >>> despite advancing addresses by three bytes per pixel.  These cases ca=
n
> >>> corrupt the framebuffer beyond the requested rectangle.
> >> I believe 24 bpp mode can be rescued using something like this (entire=
ly
> >> untested):
> >>
> >> --- a/drivers/video/fbdev/atafb.c
> >> +++ b/drivers/video/fbdev/atafb.c
> >> @@ -2463,6 +2463,11 @@ static void svblit_fillrect(struct fb_info *inf=
o,
> >>           case 2:
> >>                   memset16((u16 *)line, pix, rect->width);
> >>                   break;
> >> +       case 3:
> >> +               memset(line, pix, ((rect->width * bytespp) % 4));
> >> +               line +=3D ((rect->width * bytespp) % 4);
> >> +               memset32((u32 *)line, pix, (rect->width * bytespp) / 4=
);
> >> +               break;
> >>           default:
> >>                   memset32((u32 *)line, pix, rect->width);
> >>                   break;
> >>
> >> Can't test this on hardware, and would need Miro to confirm it works a=
s
> >> intended.
> > Linmao's patch: I ran it on a Falcon with SuperVidel at
> > 1920x1080x32bpp, all good.
> >
> > Michael's 24bpp fill: I cannot test it because the SuperVidel has no
> > 24bpp video mode. It was planned but never implemented. Its mode
> > register offers 1/2/4/8-bit bitplane, 8-bit chunky, 16-bit highcolor
> > and 32-bit truecolor (24-bit RGB plus an alpha byte), with the
> > remaining code reserved - and TOS offers no 24bpp mode to set.
> Without a 24 bpp mode, the 24 bpp fill is pointless, so no point trying
> to keep that mode alive.
> > Unless I overlooked something, the fill also looks wrong on paper: the
> > first line is filled with a repeated byte and then with repeated
> > 32-bit words of the same value, which cannot reproduce a 3-byte pixel
> > pattern unless all three bytes are equal.
>
> You're correct - we'd need a memset24() to account for that. Without

Unless the frame buffer would be using a DIRECT_COLOR visual (which
is not the case), then you could draw pixels in the 16 console colors
by replicating the color index in all 3 bytes ;-)

> hardware support this is an academic exercise that I don't have time for =
:-)

True. And as this code is used only to fill the first line (the blitter
replicates it into the other lines), the performance difference between
a simple byte loop and a true memset24() won't be that large.


Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
