Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D1936B92E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741669; cv=pass; b=HPCru8NLREnyRDr0Ap5UL/Sgim9Aag6vl4qOZHRdlnK/Ce38Hi+pdWb/18aBWGuiqeQBhC9Vuxo/BpKAl2E5iq9DGS/rTRInOxVWFUYEsYw1W3rUIlGYTVK5ZJRjEtZn72VLCmRw22TwVfKD5BtPlsSZUrDkjoLdFDN0LlAtuac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741669; c=relaxed/simple;
	bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3qs7bHdgWlO71uJHhD7PlSCXRufqcac2+gZTx1yRCTrxNHrUKAXPnVbe3q+ofIg686JD0prPgIyQcwENYPrLyCbtrfRY2/yfyTrMzFKzym0ZEEqisVC0/K5ubZav926Ml+uhgHdpeJniV5xTOJVX9JqOS/tiAueay91ry6Cl4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bEsg7GBF; arc=pass smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bEsg7GBF"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-6768036283dso165994d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790741666; cv=none;
        d=google.com; s=arc-20260327;
        b=phVrmkYcIkeWOKOzB/oSohYYHqAng7d9DYuP86qAPBr9D8zcfHi6LNJKUROA5Vpx/Y
         oxLfQkVM/2Fyb0yKjBVg5mU4I9HU0U98ant3Kpq/3vrsmdB+ef4KDZTi4t59FaZw8rzo
         xCxHmmijZprZCRpw6ikGA3sMWEOTZUISBYhTc47lP6mUHWStMGHQPb1UTMbxNmJSj8sT
         SUWxlpPXpjh/tVzS5lP6C7OzTjzYRlNnk9YFJm17lxdu1ejZ8B1wHVn6uIiMxg/CDBeq
         dQHPfacCD+acEu37JOMjiHaUySUdB5oSZVJS3aQ4sFuGpRZzWlAGNGwv1zktpmS5xeQD
         B5qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        fh=a+CtMhs1MociFfvjJetZr6eHmvdbQCLudjqpRZiNm8s=;
        b=fpKhMKPBSfeOPx/mLAdyiqmJBi1PuMcKBFwKrMoisCxubmDBde1fzwPFtxc3uq+vFS
         h2N5NYqki2tZ7U8cULBe1q9V8osRwaQ7wQRUQpZTpA8Al6dmGIxM3/xTiOT/QxKChUWn
         BEzo9on3t10STtuGER/18Sf7orSD+pHwCQxMuv5jKWm1FctvnJSWIjkOexdPBQ6I2U8l
         9+GLQ8KD/FTVdHb1TWtonmcFrbhYp3Cptq81yO+ALzTsMhdngeOduQcRGjuO7jlB7Yg/
         nNy2LG0azvnFUjAhEW21iBaVgjaerJJSJpUVmNSFIJ6W0sHWBbyS+etbGHkNzTvjM3h0
         GleQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790741666; x=1791346466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        b=bEsg7GBFT1zZzhGc6u8sDmnXTAV25/gAq+pd6f6PktV6+Y91n3ehaPpZu1cNMNBBdP
         tBb6Q5H6oZlt/SVxy6CAfvy38XSkOyzXh6T6XJeAOH/GDvs5dBDL4UAKWvnsZ/wBU8sa
         Ab/ZyXjxV4D1dkvZKVmN7TRkVP830fBtz5RAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790741666; x=1791346466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        b=cOtzDdz0YSYwpKG+wtdgtZBY6omOcDxzwDVY5q0efQtEYoA2FFbCrsrd3l5P7ghlue
         9/yEo418GN1urnuE+iK9M1hiZIjKe1tDgqaHeZdVf1tE8dM6BFyFS8aoHAePDPy7RQuh
         FXVXEwApI0bMuHDzMOI+w6q0b4GRCHPkLeL1h0hnU7anIbp0hxY9tQuws+cT0QiSPiNw
         zCTdWTAqkwxA6eupbBdhc5ZSn4GQaW4XSjyfLkbcBDXmH8XqvgMFrdqcEVGxi4SOM7Wt
         THaUd8JuefVD/ZW0UB3Sf3smk2Rr75WB2p78zSkxLCvE9PhQts3TRHPcbUUiuKePuXAR
         rCjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPs7pmvKpvus6ZR2F7MOFBebg91wJby3VNTj66ttCkyy4i3650SRtctfsbJIUec7jEgiaD/38DzKWP5G4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLywX7ikBT9I3OUpFKKAStNjwQP8vqma9BS3CTJKfd/1kJVxn0G
	gOAFeWaUQJ6lWnxVQcUJcIYZAIbsCX9Mtjl690BnUeeyFhK+ayVkwX3wWGDLF71EKTHrJtz7FLZ
	7XD+zQIfwcPAUeC3bXg4hdxXQauZDiTgDfoZA/sQw
X-Gm-Gg: AYBFou2L5BzyZaYOQibeVyYcxLhJhwBnlJcI15jfJTTi7WXB71RkLQSfi7EPzMpIGay
	MZGKP0msjxIWzFGjjBbYGfNpNzeixnH+U8Y42ph7YelWDlC/JSU1i4VEdQHbt3luqmAydeiqfS5
	AkaIUsNYPOP4nzCikG3+Cy9G9wnP79FPcF8iNScoNVo783It6EsxwbF4kmmmw/FU6UiqTTzBG+6
	NQK33V5sMdKuOzkKrqRpK14+nIp8GaadiXkTQiPUNSQVIVwShuYIcw9TyEP7LowVEiZuNXJB4dK
	9KIdHTjvROrPxEFe5Q38XfotEFbL5t7+vvbgLeO23RtGZKTSg4GItu6mnXwGoh29mF4lS/Bq+5S
	QVrgiEK4G9g==
X-Received: by 2002:a05:690e:4197:b0:675:405d:643b with SMTP id
 956f58d0204a3-6768349a6c4mr76844d50.98.1790741666569; Tue, 29 Sep 2026
 21:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
 <arQxC3DmDyVIGdqq@collins> <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
 <arVnQmik-CveaAkY@collins> <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
 <48271d518bb25f552309de12758e9a9995905f0c.camel@collabora.com>
 <arWIcrSFkEA4GMTY@collins> <013b1e7ceb7cf046888109631e72ce4c408ab88a.camel@collabora.com>
In-Reply-To: <013b1e7ceb7cf046888109631e72ce4c408ab88a.camel@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Sep 2026 12:14:14 +0800
X-Gm-Features: AclHuK8VlKUTvMI0v8jjtLYpqVzk8qBeIKfHOI-d_wW7lfMXYke40oAj8SBNDvc
Message-ID: <CAGXv+5F8iJQJK4N2g8pmpGQVf8TxNvkC5Gm-RZ6F4HdQaThXpA@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, 
	Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 4:46=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Paul
>
> [...]
> > By the way if you have ideas about specific problems with the stateful
> > API that should not be reproduced in the stateless one, feel free to
> > mention them.
>
> Few things:
>
> - Drain flow should be as simple as for stateless decoder, there is no
> reordering, and so no holding on frames.
>
> - Capability query should mimic the stateless decoders (but up-side down)=
.
> Basically, we don't add a pseudo unset state, that was bogus.
> V4L2_FMTDESC_FLAG_ENUM_ALL could be made mandatory, this is only partiall=
y
> implemented decoders today :-S
>
> - Capture/Output S_PARM, maybe review/revisit, but likely still needed,
> otherwise the rate controller can't know the rate.
>
> - S_SELECTION, maybe make it mandatory for codec with a conformance windo=
w ?
>
> - Of course, encoding process requires a request
>
> - Anything about keyframe insertion can be dropped, since frame type is e=
xplicit
> and per codec.
>
> One ambiguity we have in all decoders at least is weather or not the enum=
erate
> sized are coded or display resolution. I believe technically, all statele=
ss
> decoder exposes constraints in coded resolutions, and display resolutions=
 are
> not easily enumerated. Not a blocker, just a remark.

IIRC from working on bringing the Chromium V4L2 code up-to-date, userspace
programs coded resolutions as the frame dimensions, and uses the selection
API for the display resolutions. And yes, the decoder exposes constraints
in coded resolutions, like having the resolution steps match the macroblock
sizes.


ChenYu

> Hope this is helpful,
> Nicolas
>
> >
> > > A second implementation, not just a variant of the same brand would a=
lso be
> > > nice.
> >
> > I still have it in mind to add support for the Allwinner encoder based
> > on my earlier stateful-ish attempt. Hopefully that work can be funded.
> >
> > All the best,
> >
> > Paul
