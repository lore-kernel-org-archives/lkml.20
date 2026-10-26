Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793044758;
	b=XnUdW2E+r5AN2Ocx2LqtujoboYDEivh7Qqmygi4R6wURTPOiAlznZARPEjKC1N2dQNnY
	 2YCV2+gX+0lBHiU94drj73Qc0kJQ5HSqtG+9Amm3tX6/A+HRxJa1GtIHi6zBtz3YfTmux
	 QYkhi26q3/WQ3+bubi1ve0nSgjK/RoLUCTv+v9GyXKtuD0mLuTb1U1W4FTMepAy6qX6oc
	 mh/xGlKJHxnoPA0QirzFMmqn7FXdlpO5us/BlFPpv7RfC88UvzWoYQ6bgnf7eCJWm0e/4
	 tHfVdps4ChekgHbzdiZV/M8x/Z5dCiJRIaft4kY9vW9PPxlnYhTtwtsbd1VSy/0KsEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=;
	b=dEOv6Kmixh7FBwlw9EF66ijImJtiCOiNu7NSNG5CXGey8/SfpZSnRpkQ/dBO8yJaI5Og
	 RCW+RgO0an8MCVdENlOOh8ju7cf2WNIOXzV2SKeoCtNwy9I1dGVTDKU8IpzPbnu4DX0qE
	 Dr//vBWW5/2j/u77gh5g12bm1d21zYZqKXmTYpCrdgY0wCXc/ly0SrYaIm5jVg3HEy8gR
	 btk84lw1+N2CKEHzPpJmf55pbASKsguRLSx3Nm7e/MEozzozqeA3R9kLd7IBcqm0+meC1
	 HhTHJPR4/NkrcUsdgxA3CM2q947wKWjueIYZb6QWn+7/Z209F8me3KIvrCvB+yyl8Pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cvBRFKlI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D97E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D97E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cvBRFKlI
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7cc7938c5e9so121843137.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793044757; cv=none;
        d=google.com; s=arc-20260327;
        b=qTeeW0hRFECKElhGHbR45o9yLLNtoGNJVgO0YvfAOKKs7Dlsf1HG/y2xBl3uPvTjmA
         OkTouizoAywLx8aVw5JelAen5vlII8iRYe58ZWJnno4fmF2ALZOAT2jrKGEwI+xwxBhP
         L8yHrLeujWpduc9BjFL2/KjjqF+OJ8SyErwgV6UuGOb4yyXfT04jhb1SJCjlcvR4MAXL
         Ey2Z2YoDfDzWZI5h57CMOVdO2x29t2Jwva7+A8XtOXFHWdkTe9HO3D/dh5oVa8J2kyIo
         Rw92XY+v4EWPPB6rSYRvSlbJjk2LHALrdxFbcILTuqHlP2SnaQXqEqQxO8rxask5aF45
         qzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=;
        fh=wm4p2JHLtc4neGAm5sYUW2RAEz6+zK9Bny1gP6fHhlI=;
        b=NG+EfAEnKh/kEaWgfbGkut72rE2TUr3LBujKLvgfuuwC9emLHKpQYlGsVTEoILajM9
         D/vS0uGkT7BIJoxkjj4dPvGRWcYomaRkrOn8Oc6dLD6r9LHUcrscgOssGXfpagBJ03Z6
         f01rSnnlf/7q/eXFOTplGn/5CWcO2J6JRbAJaicVq7FdlhIOc0ai469AUNPlP81ATXkm
         Lz8zGnW1rUMkmUNIpYYtNUW5MtF72aAg+ZzUv9G/RIBlu/ifwlPTtq5BSVVDBLr57P3E
         BOyW4irn3xZlWleGaLP60O5sMFyVbf1UVYUo2uUQd7Go+Zb9MsoNgIH2pzq6idldSZ0O
         YP4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793044757; x=1793649557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=;
        b=cvBRFKlIcZfiZ7VSDj5XLvmoB/dHtec9fZhh+Wwhpjf87UlUf5tT44b9nbh/sUFxCz
         yLMWg7WvvmAPW+M0Ad/S1UXKtNGcC+8YZoEisoTHMhjdAwGxk1gPTlq0tilDc14XmEMg
         NCb5SWjJFBUUXqj+ty/FZBKVEQqciLJyZTQWBpNAMVE75SDxT0Nh7dZJPrd7rsnktWUx
         Z3YF9ISbvYbFI1+cPAgm9vPZz03DlOQ8dT6F4F17XV59JvnyFzq3UOeocdY4kNQkcNbD
         //Urs26nlHi9M+mnnxcYbVCabq5BUbYdiqFwv/Ye3tCeH/vys3mzngTYRbNlBety99ES
         RX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044757; x=1793649557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5v98+mkBPyKcXGGfAa45H0MLFavlwhFEg5B6g7hFf9M=;
        b=qEEt469omJpPj5woqB8vRsupwaO83D2O3UxoOAZSWkKF2hjwpB6vfN1O3U4kqLn7xj
         Sbaqz9lTJa/IAqVMmvHeVjt35ZPe9isSxiJzn7mMRcwt2VZNC+kZyMMBUHhakYDwOgec
         sMPAejsuP3o6wTcczrOVkQBU2lnIhsR0UzCdLecJlzqy0TU5/AfhgY+2/D5Xa++i9YP/
         EVm8WIBc07IQiHcMraaAVT/v2ck7MLAtMDDM3VIP4hp0nONv1zCN9ZmfO1CzZoME1txK
         fuIDSUITC/WxSOeZ+whDbBngUgxsMZf5XAycdRq2qPh6ZKXq0U3vLWQbP6JZHZpNs3ZR
         CsBQ==
X-Forwarded-Encrypted: i=1; AKwUvByMO17l3SLhi99wpU852bPso+bRpXeOhekbanLE/eDfwUaGdp6IJnoBD8xDnDzaPqSYbnm7YvdDXdi59Qo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwe+/o/FnwrL2ATxsYN2aJcMG4wv/hsEI8ROUa0CO9m8Q7Sj1d
	+YxHZY1X5JLBCg/BnNDqh5QDatNf5kBst2hl4XLAS7Jp40++vRtyL78v/K5sKRMdwNrKp9yTIe+
	5Zo+9Z7o4VIeTFOJByS3AD8zfU1kPjvU=
X-Gm-Gg: AYBFou0rlOTOHi8zEjT33JS/Vaedd6sdXAfu2G/DrLpoQEN9cabExf2+ohbFsGKwodD
	B9ZpME+gWayWZ/jdscZ2jI9ak97PES5cXvN0kkULkp7nXlslKLGCZBck3OJIatz2YDvL4R4yo1v
	w1a8Ju7ETNaOpNgPCGP3u/moOwo5MWBQE9cvDJEX7SBXZtEmsmWzs9SOujmYfN1behYF43S08JL
	Haepn6n9HyGD+FQvPjtP1ftqJ1jsXhR+qpfOiMlehiUPPuwUr7c+ftmUq0YO0mTw7dHgOpRl4lE
	IGNdRYbeTF+Mn4JPp6VRm3JGSJV1SeTZyUlHuKOSmvLWXEl2/90DRIRZxSvUI36jWjFy23AAwPB
	+3WOKYaSQwayjZP6EI4F9m/aVHFgzVBTmDDeFycyWSXz1fhOo4IgrIuHowCE486jei9DFzMAOut
	bygjpCkBmES6JCrJmRAKZCRUevCagier1L+LW7KdmGghb9yzJGawcuFtY5aDir9VhQjinNOhRN6
	6dEIcik114uEKn8gOhYKEQzcbpyqw==
X-Received: by 2002:a05:6102:3e8f:b0:7cb:bd9b:4873 with SMTP id
 ada2fe7eead31-7cea14fad38mr297588137.21.1793044757153; Mon, 26 Oct 2026
 12:59:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk> <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local> <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local>
In-Reply-To: <at-vyZ1sDhYPu0W5@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 13:59:06 -0600
X-Gm-Features: AclHuK-pkQBp3tukGM9FdJ8ekfrjzUqdLwbnUIKbAlyu-Q9paOfNaII7ApJtovI
Message-ID: <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 1:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > > > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:
>
> ...
>
> > > > > Some people might want to test the stuff. And sending too often y=
ou actually
> > > > > will get the opposite results, people will be tired to even start=
 reviewing
> > > > > and/or testing your code as it's changed way too quickly.
> > > >
> > > > My thought process was that people wouldn't want to be testing code=
 that
> > > > had known bugs flagged in Sashiko reviews.
> > >
> > > Sashiko reviews are not visible in my or any other mailbox. To see th=
em I have
> > > to go to some URL and so on, meaning to waste time to see why on the =
earth the
> > > new version has been sent.
> >
> > Maybe the Sashiko reviews are getting caught in spam filtering or somet=
hing?
> > They are showing up for me and on the mailing list[0] so I'm a bit conf=
used why
> > you aren't seeing them. You shouldn't have to go to the web interface[1=
] to look
> > up the reviews.
> >
> > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/
> >
> > [1] https://sashiko.dev/
> >
> > > It's better before addressing Sashiko comments,
> > > reply to all people involved and to Sashiko's original email, so it w=
ill be
> > > visible in the previous version why you issued (actually about to iss=
ue) the
> > > next version.
> >
> > Hmm, maybe it makes sense to enable recipients in the reply_to config[2=
]?
>
> It's up to the list owners / subsystem maintainers.
>
> > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/linux/=
mailing_lists.toml#L290
> >
> > > And before even issuing it, wait for a while, people might
> > > disagree with Sashiko judgement or your replies on how to address tha=
t.
> >
> > I was assuming everyone was seeing the Sashiko reviews getting posted t=
o
> > the mailing list already. The are ending up in lore so unless someone i=
sn't
> > subscribed to the list I'm not sure why they wouldn't be seeing those r=
eviews
> > already.
>
> I assume you already answered your Q. mailing list in this sense doesn't =
mean
> recipients. I think it simply goes to the mailing list without forwarding=
.

Do we want those reviews going to recipients as well as the mailing list?

>
> You can ask at helpdesk@ how this is configured on the kernel.org side.
>
> > > TL;DR: this mailing list is *not* a playground with you and Sashiko, =
the whole
> > > community is behind it.
>
> > > > > Settle down first
> > > > > with something, put on the cover letter the answer why not all Sa=
shiko's
> > > > > comments are being addressed (for example, due to amount of patch=
es or the
> > > > > series being focused on a certain issue).
> > > >
> > > > So, in general I've been always attempting to resolve known Sashiko=
 issues
> > > > in every subsequent re-spin, so that would be a bit tricky since I =
wouldn't be
> > > > aware of the Sashiko issues until after the series has already been=
 sent.
> > > >
> > > > Usually the subsequent issues that get flagged are new issues only =
discovered
> > > > after each new re-spin.
> > > >
> > > > I do have a bunch of UART/DMA related patches that don't have flagg=
ed Sashiko
> > > > issues so it probably makes sense to try and review those first whi=
le the larger
> > > > series that have Sashiko flagged issues are still stabilizing.
> > >
> > > Yes.
> > >
> > > > > > [0] https://github.com/sashiko-dev/sashiko/pull/389
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
