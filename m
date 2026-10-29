Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237309;
	b=Iie+CfIb+y0jKFCPs4OqQL1qp31xDqEv1TMaTSg8lrambPlY/WWH0YRVYub5slu27gHm
	 hvh1NMFXCduvSndfYG3ncsVxSbxHoDYoUPjWHUhFyfh6evStLC0qADLpd7Br4+wlj/J6w
	 xyPLmAqrR7AfdYMmivbvHTh1aEXgkoawYIEV68LLgDLvrX0YOAk7ZCC0d3icUN+/jh7My
	 +TcL2Mnlqi6cywiCH0Jh8TU/NIIOlzq7qDmlxc/WcDbLYuYFzy9P2SOpUpp1q8xU2WR4b
	 RN1zBl/Lb+KbJ3WNRPQhiZ3sQuv/0zqAcWjNxaxjPy2Fql1BMZaXSMavY81j7zCvNVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yF54AFtL3Gkh2hkM8V3bg5e5Kl7mMseeJ1YhC8Kt30U=;
	b=Zl6wbZXWGM9DpL0T1m5VEYoAXYZABL/0VY3jOfP+NL5T4Ws7xWLZoUpWelIruYW0z4q2
	 X6siWOdWnWNh0/uqFS4sR5x4x1eQ4TyWKN4u4lzCl2vuhB1a9ZvdPC20aVZivbSs1fjdK
	 CwclVZw5hqrufefeBRs/xg2zmvptI0/M2oi/J5tRkj7CPwQZazr4pc/jmLb68ki6Y+nC/
	 pWqpF02U2wOB/5+Ek6wp/CdJX7EarTZhYoQ8S6qK2um2+HQfqMuBj2SW03cjaonT3Zfko
	 CtQFNvvXY8VTm+K+nw33a/6fVbtrh4AwOBcM4fGG5Q2T3Zb7/lrJVinAn/LX048+vyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Zb8ctawI;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CFE606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39CFE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Zb8ctawI
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2678184a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793237307; x=1793842107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yF54AFtL3Gkh2hkM8V3bg5e5Kl7mMseeJ1YhC8Kt30U=;
        b=Zb8ctawImytH6gmmdWW6xzv4C2KMWGHzDJ7BDUN6fKupPincylfLVJyxuY0JaxCUEM
         IgCbRTHE0FsNUxQww3/rbojGXNB84jZH3jhh8NQku9WIGcWFWMDA/d8lu6n4o7XlF+Eb
         G2aOXQqifsKFo/Wi71wkjaSH5BG906pT+jCMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237307; x=1793842107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yF54AFtL3Gkh2hkM8V3bg5e5Kl7mMseeJ1YhC8Kt30U=;
        b=PfE5Yr4/tmselk+Zb1lyN8NUZX1vriMQQu1mZ9Qai9U4LOzMCxcG8E/pz/f2jWSBS6
         brqpovUwUJEnbMSl7k4Q9tKijC6U/KDBXJ0muPnd1GDya68MKglg4EaSEOJqlO1vbdVD
         Sbk+R6IRQBbMl5DXIP/pUl9MfyDniq0gzLqv+v9tdYMnsrjQVMo0ahmsWRizaGfxFUx5
         bgm8H6vX2HokcuEhJgaGeMl0FJ+DQEE2gNIn/Oy/g6dTKolCiHW1ELqtOKcUJvKhe3LG
         B86J3AIlZHNp4mXyBTTOz3wrJwU5BZ74H1WdXtRs5oa3mEEilI/XyEX8wAueK9oa3hkh
         vpKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTyke8VTVQGk0gWMcDrQMWrx9fGxqVoEs3rO/ePTE1cG3940bqXYQ5wbgAMlHM6B+BYUXc1ogWaDYClEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4l/E+8DDqTcVlUe3e6CGF4pm6TyDREseHtgNIBf5sMb74YYrx
	ar4dJ6T10oqVRyDUV45vpSgrMEPih+/OWTIajW6Z95I9tqCI0bAHXNhWHRsoUTRKpEbepmpmrqo
	VzS3L6LvY
X-Gm-Gg: AYBFou0adXxcxqAtLleFChNd0xiStLgT9QnQMJGH4LwS0CnXs4PpN8G3iIfNXkKH93l
	r/ful153pqLidlCTTVg3oHUIRy/PLqTBe+iMd51/LAs0a4++QPBjy9oIzQmowmMVa5ej3nsNXQ7
	q5OyjwNfF+bupH5tMP1OKPwVBbGw610kXcfQMkxvxeLtEKnusATxyNvRTee+XRlRTDU0e1oYrPG
	O/yoWkQdaz6jqNR8g9EI/JY/92D5WV8o2Of0jvc+L8tqClKQyZVbjwfDadrfhG+nH81P2nTadAA
	xxS/TIkrsrFmbgmevsxvpEvHgqbEX4y5kX+lgx1fpTBWrSJF0d38PvbSfeD4RIUTnQ9by7TLNmU
	AVLRNXYG0ym4bikdbOD+5Cv/ROTNXq6y6EEEojXb5V9TdlaYcYe6Fb0FzN4dxnafTvCXMxirJ+i
	rhdVbhEZx4grSF/0jgyhTnazODZa8xmViBejys6McX4XpMvGRmIrINmEhDea+CRTpoVr6Ro3nmK
	zG5LFqP/E2MUA1Qgl6mNhD4GTYjnxUS93QJif1KH3+4TAu8z4eFfXwLBgnVwC9Z6p/ENFQIY+dr
	NMDfabBAcmQWooCqfBUjZDN0iOlaUwUmJMLBxI00XpDJKU8Q0A7IOrMQ+6YRTZqInfCd
X-Received: by 2002:a17:906:ef03:b0:c40:4848:f7fa with SMTP id a640c23a62f3a-c49bdf81f1fmr334880966b.44.1793237307553;
        Wed, 28 Oct 2026 18:28:27 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd350706sm686072766b.3.2026.10.28.18.28.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 18:28:27 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4f540ebso789725f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:28:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZe5QrVwXN4l6hI5d95fifMdn1nuzXcKkPtcLFIr9UXrHvMbwgpRkPS08YHLmOWmmznz9y4PHCV2r0fQE=@vger.kernel.org
X-Received: by 2002:a05:6000:2c08:b0:48d:bafc:a409 with SMTP id
 ffacd0b85a97d-48e5d2f07femr9584368f8f.26.1793237306160; Wed, 28 Oct 2026
 18:28:26 -0700 (PDT)
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
 <CAD=FV=VqKkxC6-JaxGZOP_TRMwmq5axceT0xDZJhC2WMjxp2Aw@mail.gmail.com> <auKak7QsI_6uoCep@gractus.seuss>
In-Reply-To: <auKak7QsI_6uoCep@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 18:28:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFvoQbqoghJf14z8ykqu3NNxgLXT2Oi1Rh8d_E2Zq-gA@mail.gmail.com>
X-Gm-Features: AclHuK9jXgiNO3ZlmyYc7y4t6Q91zU5w_w9WcC5ZTNrECUt3_gy7-ALkR1xmn7k
Message-ID: <CAD=FV=VFvoQbqoghJf14z8ykqu3NNxgLXT2Oi1Rh8d_E2Zq-gA@mail.gmail.com>
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

Hi David,

On Wed, Oct 28, 2026 at 6:11=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > Yeah, I debated this a bit originally, and I agree it's a bit confusing=
.
> > How about this: I'll keep the option, but force it to be just a filenam=
e,
> > not a full path. At least to me that makes it less confusing. Hopefully
> > that's OK?
>
> Hm, the way the path is encoded isn't really what I dislike about it.
> Something about the "base-dtb" name suggests an existing base tree,
> rather than an output desination to me (particularly since in future
> you might want an existing base tree to do recursive factoring).  What
> I'd suggest is dropping the short option and renaming the long option
> to include "output".

OK. When you have a chance, take another quick look in v2 and I'm happy
to change this option however you want in v3.


> > > > +            all_have_prop_fixups =3D all(
> > > > +                bool(d.sym_props[path][prop_name][1]) for d in dtb=
s
> > > > +            )
> > >
> > > I'm not sure why you care that all the copies of the property have
> > > fixups.  AFAICT all you care about is that the set of fixups is
> > > identical for all of them, empty or not.
> >
> > Sigh, this is where me not understanding 100% of the details of overlay=
s
> > bites me. Some background. I remember there being some talk a little wh=
ile
> > ago of (perhaps) shipping device trees compiled with '-L'. That would
> > allow the OS to know for sure which properties represented phandles and
> > that could help the OS figure out device dependencies.
>
> [Not really relevant to this series, but that doesn't sound like a
>  great idea to me]
>
> > I wanted to make
> > sure that running fdtfactor wouldn't break this and the OS would still
> > have all the information it needed even after breaking things up into
> > overlays and re-applying.
> >
> > In order to test this, I wanted to make sure we tested re-combining the
> > base devicetrees and overlays and we could confirm that everything was
> > there. In order to make all that work, my agent added a bunch of extra
> > '/fragment@0/__overlay__/__local_fixups__'. ...but it turns out that wa=
s
> > a workaround for the fact that fdt_overlay_apply() didn't preserve
> > __local_fixups__ in the base. :(
>
> Ah, right.  Again, I'm not convinced this is a great idea, but if we
> wanted it the right way to do it is to have fdt_overlay_apply()
> (optionally) regenerate __local_fixups__.  It's not really merely
> "preserving", since applying the overlay might require that some
> external fixups be converted to local fixups.

FWIW, in the v2 series this is what I've done. There are 3 patches
in the series that just fix this.

NOTE: personally, I don't _actually_ have a need to run fdtfactor
without the `-S` option. It just seemed more correct to me to
be able to keep __local_fixups__ correct after merging. It also
tends to make verification of things easier because they you can
nicely "reverse" phandles for comparison...
