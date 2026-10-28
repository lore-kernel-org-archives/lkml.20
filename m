Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225038;
	b=OGC3diNanMFkcJHI9+rWjh5Zt8cbUQFSRKG5Mu9dijrJxLdIxMOCsfPW3XQ04a1R6TQW
	 AFIXflIQfi1W/Lro3ChKodf1PSHB1DSOZ65/YBVi/zmT1xInxZLhd6JGo0v6eHOg2F4x+
	 gl+2A8mBO2GkCw4qH/TCufNX6uZ54B8L90wyhlE6qd28h3WEHprQEeC8Cl9Fwb/vpAoGs
	 3/Wqnpn+VvWKZ/zLLXbT0tMw7AhR3GtXR22NIUEvlqXtAvPuI0Pfvtm9xL70s5wsjRWe8
	 RIpOA8+/rV5TiZ2ttR+2IfUYSTHBDGniARFkkkuzjXMZ3bVld3JaA88GpQuKrxI6PGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=07TvSjlSa6pD44ieWEKulZ7cEs4Mmh25/8EVSbg6l/E=;
	b=UjZXKPhzpbZkwIglCq1gDEj22ILLz3yolmcVpJ3YMoNcm5rdcGLffaNDdXLjyfbGSf4b
	 hJQwy0Mn/j/9UPcL55uLpBPh4LBZ1q2B6P6k/1v8dg79U9XKKMwB3kAz7ImfzaqYYMsir
	 saH+hmQTX0yHUiF2zAqbcgonCq5mgkQWuzst1IXFXUOisfPR3hg0nhqu6IOaAkjWn/OKy
	 VFKxsuRPSN/g/UuRruNpm15yrobSJ09ZFtYXvd5zMpYWfBqoE/yQBop2WyMo9lxYVtb7H
	 dwYqPzEDGhXmYY7jvZs43OuA2+Y6w2CIsF7T4lrLEQki7ekDaxFn+g9pDTpGE6vpiUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C5B+FJNH;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009AD606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 009AD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C5B+FJNH
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1578284e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793225036; x=1793829836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=07TvSjlSa6pD44ieWEKulZ7cEs4Mmh25/8EVSbg6l/E=;
        b=C5B+FJNH7h1BkLPOSCjjLRptcRRRVHEnqv5jrFGN0yRpSQVDpMyYKfx3LouZ1QyzGo
         zkh9sTPch3Scde1GcGXekP+YcAP20APOod+xebkc5OISHw+1XzyBOpPwUx1HESRV3H5w
         6wuNaUjIBwvnOYf6xtOkGQ20d+nryf1yMMaT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225036; x=1793829836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07TvSjlSa6pD44ieWEKulZ7cEs4Mmh25/8EVSbg6l/E=;
        b=W/xLX197gc51u+E55/7zB4zO3e6l5AYoyOQjVttQvNTeiAoUo1wKv75fS1+8Vt9b8B
         sYGDjjpubvw/Wk/F+GlTWVDib4jX1sqqdXNkdOq8nHWUlkXjczxc5u35QXaROgzvnxrY
         82whKSzTo4y4Usn0TET0efqXdDliytfqmdSx2DK3smtITlCeAumeN2nxy2ksLpNLDFL3
         Q2d5tBOokL5XvRqPhOmgL/PI9qGlaBfEOKQy55wvfI7VSxN55d/iSe8U90XAAenlfHLf
         UVgJ1IoApqOUj5BAweo68Wm04PW2rXy+wR2zMJV3lfARdB7HVGxywIrfWLNuPboE5uPh
         MzXA==
X-Forwarded-Encrypted: i=1; AKwUvBzFkMQquruDGQwNKdTYbI74Mu7NSu92SaAbJ3sYZGTw45jPuIlC7Frr/H/ulOF3zIYeTdZAh5X1bvS8VN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJopQn8/+gOyVmuQjzU2gXfMz2lv0ivm+k9+ffm2eStaTNzE5od
	uxbrSDODNbnMGWkFE3mADnmiIM4kosV7a4WwSm1SI+SCgehEyq52exAh7bCOrZM/egNw945lJkl
	4a4O981S5
X-Gm-Gg: AYBFou1oQddWlNwT3gg3BBhXu+69PIR9mEnSwztf3zFL2HPaA3Ib2X7l81fjAutJYWp
	cuplYqf/Cuq6883Eb7ZERgDe0GGrcUwfdrXk7cmWvu7u2/HArXb11Pg8ZAggpv601lzRX+RDv/P
	NLExYB/JsDwPkzSn8iOQwT4jh8fdiB7ltMkDROV0sa3aXjSoBXCAVdIZuccSgsub96egelqnUp1
	SnOi2fHNtJ2wn8TsYHdjwbeFJSrGUdmEXJi3G1dH81jlsrSdcj8a9Xjy0aECw/a9TMAV+3bKZnv
	m74F0mRAcYYfSFZsLGtb7cXhKzUFJ18aF4+j1XUAqS52z9ChUTvS+T5rMBOrq+yJbTFxWPPhqWI
	daU3OqeoPpEStqJ3T7qiflcbiAUmZpB5hWpYO4b2aqNk8DzNx4AJK8hLCGJZpU/bkloSliw5oMX
	VQmNXmAIEHWHA+FENKgKB4sRs8los4YrJxFyuItzh0UxlO6ZjO1Q7OQssoibTh6Ex+kapdyJdO8
	K8vbucwIAa5DmRBZ9yrYwbZNxZUBXfPyTmIW0VaqqIyFoZiwxzMSyFzqWckOtgnVMs+HBJWy7kj
	y6EHC4Gla/ozDQHv3KxEzLHqs6Luj2GdYjVdKuc2Z8bgW8Mbl1KURXrw6LlClXge0NdFag==
X-Received: by 2002:a05:6512:3b07:b0:5bf:b237:8e40 with SMTP id 2adb3069b0e04-5bfcad7ed0bmr1325467e87.20.1793225036019;
        Wed, 28 Oct 2026 15:03:56 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca57ed8bsm848255e87.42.2026.10.28.15.03.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 15:03:55 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1578262e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:03:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1fKpU7l7Tr5HwqBialxlHFz1qoXVFwgswEcq+RUAVUfalDUbxJEis99/X+8C0cndjS/UiFc9OUL5wvpk=@vger.kernel.org
X-Received: by 2002:a05:6000:250a:b0:48d:ed98:2a55 with SMTP id
 ffacd0b85a97d-48e5d5995bemr7521102f8f.22.1793224640054; Wed, 28 Oct 2026
 14:57:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org> <atrnN0ICA41TU1B3@gractus.seuss>
In-Reply-To: <atrnN0ICA41TU1B3@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXp6rMfE0fwUOFHQ--eetjRu8N=L1pjZP71Lcu5n-yow@mail.gmail.com>
X-Gm-Features: AclHuK8NLTlui-V6h-KJogbMRPIZx2bj01wfY_NZiveWxCtCuxzAidtcDBdEMUQ
Message-ID: <CAD=FV=XXp6rMfE0fwUOFHQ--eetjRu8N=L1pjZP71Lcu5n-yow@mail.gmail.com>
Subject: Re: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor overlays
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

Hi David,

On Thu, Oct 22, 2026 at 10:04=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Thu, Oct 15, 2026 at 11:21:33AM -0700, Douglas Anderson wrote:
> >
> > Devicetree overlays allow you to have a "base" compiled devicetree and =
then
> > to apply an "overlay" to it to add or modify nodes. Devicetree overlays=
 have
> > at least two purposes:
> >
> > 1. Supporting add-on boards (like "hats" on a dev board). In this case =
the
> >    main board is described as a base devicetree and the add-on board is=
 an
> >    overlay. In this case there is a clear separation between the base a=
nd the
> >    add-on board and the base/overlay separation models reality nicely.
> >
> > 2. Supporting a "family" of similar boards in a space-efficient way. In
> >    upstream Linux, there are 47 distinct sc7180-trogdor boards supporte=
d.
> >    These board are all highly similar, but we compile (and ship) a sepa=
rate
> >    devicetree for each. Devicetree overlays can make this much more eff=
icient
> >    by factoring the common bits to the base devicetree and having each
> >    of the 47 boards represented by a small devicetree overlay.
> >
> > Up to this point, the usage of overlays in the upstream devicetree repo=
 has
> > mostly been for case #1.
>
> I don't think it invalidates the concept you're going for, but this
> description is a bit misleading without some historical context.  In
> particular this is a bit confused by the fact that there are both
> source-level (dts) overlays and binary-level (dtb) overlays.
>
> Source overlays came first, in conjuction with /include/ support in
> dtc, and were intended for use case (2) and similar.  A group of
> boards with the same SoC was the most common case, but families of
> similar boards and families of similar SoCs also used this mechanism.
> At the time this was still envisaging that a complete tree was built
> at boot time, and didn't change.
>
> This started to drift into use case (1) since without hotplug (we'll
> get to that), a board with different hats (or whatever) can be
> considered variants of the same base board.
>
> That still required the complete tree be built at compile time (or at
> least bootloader / kernel installation time).  That wasn't great for
> two reasons, roughly matching your two use cases:
>
>  1. Compile time is obviously no good for hotplugged hats.  Even for
>     coldplug hats, it's desirable to be able to complete the tree at
>     boot time rather than compile / deploy time.
>
>  2. Bootloaders often want to support a variety of related boards, not
>     just a single configuration.  That was already possible by
>     incorporating a full dtb for every variant, but it gets pretty
>     bulky and bootloaders are often pretty constrained.
>
> dtb overlays were invented to address these, though I don't know that
> difference between the two motivations was particularly well
> understood at the time.
>
> dtb overlays were pretty much a direct transcription of dts overlay
> semantics to dtb and runtime.  The use of "in band" encoding (special
> properties) is kind of inelegant, but it worked well enough to become
> popular.
>
> This works reasonably well for use case (2).  That makes sense: the
> semantics are based on dts overlays which were designed for use case
> (2).
>
> But, dtb overlays have always been a nasty hack for case (1), even
> though that's become the predominant one.  Overlays can change
> anywhere in the tree, whether or not that's physically sensible via
> the hat connector (or whatever).  The semantics of applying an overlay
> lose information (by design), which means that removing an overlay for
> hot unplug is a complete mess.  The way we encode the information
> necessary to apply an overlay is kind of messy and inconsistent.
>
> Still, they worked well enough for (1) that they've become widespread.
> Herv=C3=A9 Condina is now working on a new scheme (dubbed "addons") which
> is actually designed for case (1), and should suit it much better.
> It's a fair way off being ready for use, but it's a good development.

Interesting. I'd have never thought to call the "dts" vs. "dtsi" split
"overlays".

I'll try to reword this in the cover letter.


> > I've used this tool to reduce sc7180-trogdor device tree files (which
> > are stored lz4 compressed) from 1.71 MB to 213 KB, a 87.5% savings.
>
> Nice.  I suspect this gap would be substantially smaller with a large
> window compressor.  The trick here is that the factoring is finding
> long distance redundancies which lz4 won't be able to see.

FWIW, I don't think the large window compressor would have helped
here. Each .dtb file is compressed on its own, right? This means that
the bootloader doesn't need to read/decompress all of the devicetree
files--just the ones actually cares about.


> > I'll freely admit that the patches in this series were pretty heavily v=
ibe
> > coded. I'll not pretend that I have a deep understanding of the intraci=
cies
> > of how overlays are implemented. That being said:
> > * I've spent quite a bit of time reviewing the code from a high-level
> >   perspective: confirming that functions are well documented, well stru=
ctured,
> >   and make sense.
> > * I believe that what the tool is doing and how the tool is used make s=
ense.
> > * I have had quite a number of internal "the AI reviews the AI" rounds =
to
> >   the point of diminishing returns.
> > At this point, I'm not embarassed to put my name behind this. While I w=
on't
> > promise that there is zero cases of the AI doing something really stupi=
d,
> > I'd be willing to bet that the end result is better (and cleaner / bett=
er
> > structured) than what I would have coded up if I had spend a few weeks =
doing
> > this on my own.
>
> Thanks for that clear and helpful context.  My views on AI are
> complicated, leaning negative, but I do think it can be a useful tool
> and have no plans to reject patches purely because they're AI
> assisted.  A statement like that goes a long way to convincing me that
> I'm not about to waste my effort reviewing slop.  c.f. my rather
> unfriendly response[2] to a recent very sloppish bug report which
> vastly overestimated the impact of the bugs in question.

Sorry if it still wasn't super amazing. FWIW, it was definitely much
worse when I first started with it. :-P The quick prototype was done
in 30 minutes, but then I spent a big chunk of time trying to whip it
into something sensible. ...but obviously (as you found in reviewing
it) there were a bunch of things that looked reasonable to me but
weren't ideal. FWIW, there were at least some things that I simply
made the wrong choice on. I wasn't sure how much you would want
fdtfactor to stay out of the way of the rest of "dtc" (AKA keep my
changes self-contained) vs. actually improving / fixing the dtc source
base. I chose to stay out of the way in a few cases. That's changed in
v2 which makes fdtfactor smaller.

FWIW, I've attempted to get my AI to improve the later patches in the
series based on your feedback in the cover letter and patch #2.
Hopefully this makes things look better to you in v2...


> [2] https://lore.kernel.org/devicetree-compiler/as8RYmIp0pDCplpu@gractus.=
seuss/
>
> Understand that all dtc maintainership is unpaid volunteer time for
> me, so I'm less responsive about reviews than would be ideal.  I am
> gradually chiping away at the backlog, though.

I really appreciate the time you took on this. I've made it a priority
to go through all of your feedback and ensure everything is addressed.

I'm sure v2 won't be perfect, but hopefully it's a bunch better.



-Doug
