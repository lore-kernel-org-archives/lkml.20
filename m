Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620649;
	b=M2Nukj3P37YeSUPRBcN1QeiP1ImVG8fwejJ3uhr+cp+qAKri3DImAfieb/V7SqwS7yov
	 J0Lx3sVpt3gCgHt/VOijlbDCtPgnlqLkRolo7bfpcazuNYhI0vyPJD0S1D0M7UR5fdxkL
	 98Se5G68YALsjBWbdLOj6BuEb+gsg5k7GWxX76WGvhbd/etSNCRN/3SgA3GRcLN189ytD
	 yAcLpVZ2PDXKzh5wqIxslMZommXjDY2nIR+79hi2rk2glYL1rQeTMYK9VE0DWCInUMPyt
	 Ub0HEZPbkZzEk9i/+Qa5mUqmixMXGId2r+fbJ92B5u0cvpB6F+LcY7+heklfVX7W5EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MoQMMKruj6/n++Nk1VIZBaoDNnUVvF0yb6c2vnsNgHM=;
	b=B5x8AbVznGJvD+UgRKj35pBto9LHr5uynu3HPwwXmZqqtcPPQPWNCXJ0FV/175ZjEmaR
	 d/vZYbcctE+LY0VtoQ/V42wi1F90gRr4qya3BbsuzjkgYcz+M1TxP2ZUYB2G6ttqx9zaZ
	 khlEAZi7f5OnZBjVBbhq1sZ5Px26wF6I88VRzW8c47BSA7c9OPOYTw2oaYj/NQcCGnjD6
	 AFrHrpMYxf/uE+w+/TnlbUuxIF9SdKh00xQ2HI6xGHurAPWlQghnmA+zHCtAYZ73CgzS4
	 exLXnVfHVeQX7gfqdFmfzwQcLXezXyniKhxUdZHG0t6p0L4u87VELMvqgJG4uEooO1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eR8NjQwJ;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C52860A3803
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C52860A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eR8NjQwJ
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso2753731a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794620648; x=1795225448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MoQMMKruj6/n++Nk1VIZBaoDNnUVvF0yb6c2vnsNgHM=;
        b=eR8NjQwJPLDMRhwBtbPy5pr2Ki1Bf1jHoP8FPimtazklHQVJxXaSEAeY8/cafzzM1S
         j5pBKvPZKAR999afozUE9jiExQmSIDNMnRY3gdZEvfVb1V1hcrsmcCJl3v6s8at/9LJ+
         APwxFBkXcBZ2Rgo+L0VTkhFKoTMl7VsOx3uSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620648; x=1795225448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoQMMKruj6/n++Nk1VIZBaoDNnUVvF0yb6c2vnsNgHM=;
        b=0zdP50imetmK7tvxZLOuXsSqYSl1hWsFj0YLf/zqJHDDnIeW3oPyL1j/uS28Vhdzc1
         633RAjHNo1RkWnAhhe3Wb8Sq5nJKr3LZ6Q+r83Qjqts1Cx/1sfVwekJL40xDqeQzsVP6
         7O6+k9a9Fn7XVl2Xi1rPvA0zBbe3qmDyVQY9eynwrJrPrxUrBVIJRkkghffRl4j4gdWz
         FZKdeu6e4cLsymZPvj+Oakzd8FMvZO6HNUMnjA6ratdg5GerGXPzypvb2bTBCnH54FNY
         /F6bZX4BzB+3jT+tnyxpGyyrWy8RM4f+IySr7R7NZMMkCfGWWg/p64982SfSgFip7FWP
         VzhA==
X-Forwarded-Encrypted: i=1; AL+hErFDzYugQUPIU/dIniFPRGw2bhN2xL71wVcwa5q9By/ZAgdfaNCZyeeX1yS+1oPD+zkYG8ODuNU90O2nnA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/893F1ld0D7lZZfIX0At3/yPaPa1QJ8aAbjYfIIIuj8QYq9KvR
	4VbHZ45D2DNIhdm80a5Aqzofntou4NV4ff9puR+U+0yoOCrXpbXQ7BIcafG06dEKK2A17hnA8XA
	Y9O7sAlvE
X-Gm-Gg: AYBFou1p55rL9Ud77y4iHhksZ19IHuiBF7aDZg+WULiOyzIFNqqLhkn5d6/FoMRBmcW
	k56wCZoYYwabqBTk7kchnKPQO3sWPPpsx8vdaIDEz7IDwcOD94CdUfDbsnXWqgRY5PbxTCts/u8
	YgsKROv+KbfNcyetUZxPUuw7TT7iwvCaZO9CRrhjB0tJfIX0VisD2NJjVJ5wGAsG81XyJZMnENd
	zeLwIpRNS01iJ1NKkgpqVPZaAv4ms7mlvGRvHXWW+/GIdHRV+EwTgj4gN+07VhePKOlNcIfd883
	Ep6odI8xX2EzdDarKLF2cWiMYIuLtez8Xk9fyxBIgt7febdt1x0Htixw0bAXfNDeDHWQmEjw+IV
	TXT8iMccgkMZ8EbtQF7Pvit34GxrtTwHSre4zYSFRBGqRQekYsP96L3tNGXJRXY32hrmGaMbY+u
	uifugseqsQfz4tdZlTzPqJLtjQzeikSGLIXtwk5BKN67l6Nziuite1Rap/aby1+YP5p6o8N2VD3
	9G/ApqU/trLRyK+v6xSYhAZERKemQq3Nc68K/U+LsDNPw/Q0DbXLWL2PrBpHd1etWPjSfoztHuO
	V+o4863KnqseOfcgThY/rKASC5oR5KTqBxGzX+JE2mKo5Uo90d6sGekNkx7zxIcy2Jw9
X-Received: by 2002:a05:6402:438f:b0:6b5:5ee4:c9d8 with SMTP id 4fb4d7f45d1cf-6b7c0c8232bmr3583718a12.32.1794620647750;
        Fri, 13 Nov 2026 17:44:07 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c25deb10sm1670190a12.30.2026.11.13.17.44.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 17:44:07 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so727398f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:44:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHoRC2A/2tyahkdcgaySxoETkvMmPjOLR+x7AcGYIWu1SffpCrhadApc6KMWQO2PJCqEXzzXeLP+abb6gQ=@vger.kernel.org
X-Received: by 2002:a05:6000:2c02:b0:493:fdf6:14aa with SMTP id
 ffacd0b85a97d-49c74e22bd3mr9494147f8f.56.1794620643883; Fri, 13 Nov 2026
 17:44:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-3-dianders@chromium.org> <at7cBFtlAQOFJ8jG@gractus.seuss>
 <CAD=FV=VqKkxC6-JaxGZOP_TRMwmq5axceT0xDZJhC2WMjxp2Aw@mail.gmail.com>
In-Reply-To: <CAD=FV=VqKkxC6-JaxGZOP_TRMwmq5axceT0xDZJhC2WMjxp2Aw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 17:43:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XS6Ekjeb=a5kEqU7_Y5Bucw1D7H0UzbZfS=17qVth1Ag@mail.gmail.com>
X-Gm-Features: AclHuK_6lVpuSzYwB58kym1CDulRnl8LT1eNGamtTJcSG4OQySKnpGhD8T4I49M
Message-ID: <CAD=FV=XS6Ekjeb=a5kEqU7_Y5Bucw1D7H0UzbZfS=17qVth1Ag@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Oct 28, 2026 at 2:57=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > > +* **Multi-level overlays**: Support hierarchical overlay layers (for
> > > +  example, SoC base -> board family intermediate overlay -> SKU leaf
> > > +  overlay) when multiple boards share large sub-trees not present ac=
ross
> > > +  all boards.
> >
> > That sounds like a useful extension for the future.  An interim step
> > would be to extend to instead of taking a bunch of dtbs as input, take
> > a single (already generated) base dtb and a bunch of dtbos.  You'd
> > leave the given base alone, but find further common things between the
> > dtbs, in the context of that base.  The idea is you'd run fdtfactor
> > once on the raw dtbs, then run it again on a subset of the dtbos
> > emitted from the first pass to find further commonalities in that
> > subset.
>
> Improved the TODO to incorporate this.

So interesting story. Earlier today I responded to David's question in
my v3 about the arbitrary 50% overlap [1]. My current v4 draft makes
this a parameter. It made me think that this is exactly what we need
here for multi-level overlays.

Using the same 438-DTB Qualcomm `image.fit` I talked about in my
response earlier today [1], I ended up running several passes of
`fdtfactor` where I varied the overlap in each pass. Here are a few
notable numbers. I've also added in data with an experiment I did with
FDT_DECOMPOSE=3D1 (see the kernel Makefile) and fdtfactor (these are
gziped size of all dtbs):

* No fdtfactor, no FDT_DECOMPOSE: 9.27 MB
* No fdtfactor, yes FDT_DECOMPOSE: 6.94 MB
* Yes fdtfactor, no FDT_DECOMPOSE: 3.59 MB
* Yes fdtfactor, yes FDT_DECOMPOSE: 3.03 MB
* 5-pass fdtfactor, yes FDT_DECOMPOSE: 2.03 MB

Neat, huh? The 5-pass fdtfactor used the thresholds "[98, 92, 82, 68,
50]" for the 5 passes. NOTE that with the same 5 passes but _without_
FDT_DECOMPOSE, I still got to 2.06 MB, so nearly the same. Also note
that a 2-pass fdtfactor [85, 50] atop FDT_DECOMPOSE still ended up
with a respectable 2.39 MB.

For now, this is still future work that can be in the TODO, but I
don't think it would be hard to implement.


[1] https://lore.kernel.org/r/CAD=3DFV=3DWGTD8FtjPFE5mFSJP343Z9-2HNXHH3g4us=
qpWPVuwPUg@mail.gmail.com/
