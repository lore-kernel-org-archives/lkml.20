Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793849781;
	b=S8xZSSPPOD2IcvdE0XMwx83XX1oKPGtBmxdPOxp4skTIat2etwdLpO8W1nMhB8Viyr69
	 sWNC1w8Y4oKlMHSt2aDtuCihx/m1U10776ZSOEKrL6+GJZezUJoBBCVBnENXwnrmleVqk
	 kFePDYnvrNpTS7JE9EpmXt9Qe/Dr3Am3W2oQ0l75FN1m9zSk7kZgxPxZm9LQJ9GvF+TsX
	 xs3jben9cTd9MOUKQJKEt5XN/j/jf4TDambHD8c+7lrA7y2t5uoVf0PuDhFEAzHTjdiYb
	 gFYxclGLeyw5YrZFhbsZPATw6dF7LmFSsgQDySIu7hbhENQ8BcDnXdHIMYRTvuXZyQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
	b=cAXltXlPYDulzT9HmK8iECRJa8Ci2eVopLMT28rUBfkmLFYT6KWDSynOEZrNvA3oVYON
	 gAakgLjESnYTmwcaOM7BYJjnWBL5JJ9ox+0Ye+rcZa2QDelDsR8S1GBI1BCuwnRdiyYWe
	 cA9WALMMDwplttic4J5DHPk/hwyzEDyb8Y8zbId22TzH7P6D2IOUKkAHRtEmdM0fw/BCk
	 mHJLMHZJiftoHb7XyJpLdOglrH7EK1b6d/ZShXJZevBj3fP5wRzoA55BQATj/Pr8A63TW
	 w3E/9ahDaz5Xgkb76yn0/mOEfXC81ca1jQQyLrcjcMP6Qz4aKxikGf0I2bRVXILnYcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PWydMd0/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B426606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B426606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PWydMd0/
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b31261e8a9so10437807b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793849780; cv=none;
        d=google.com; s=arc-20260327;
        b=AQPv6RAyzhfPek5bB9czoQso8JO4Mg3KD6QMV+JkXwFzO/1jQTTQA8RG70B0EQ1gLq
         M09rnRrDzwS6WIWJJ7YrkCSeMyQMPmE2VZ+u6AABfBILDji7WafZy7hU9SSR7tf6pCzY
         5RUSYNbuWLtVzBmKWhJQoGgxq5CJapv44D7b2dM7IB1hc7Zrhrqn7XIlP8ABHipVxzu0
         7dJc4OMkjuja422iOLUsrdzciWoD4fxzUk4wxeDsJ2ZoZUhorDzYs/2bD1Fu2LE7QUOW
         VE/l/7peVNv9hHOW4vYM/jr9NfEeqmhK6RWDT5N88GP74ntMSi8F8AtPcez1DGT+fDKW
         tWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        fh=LaoOBdbqnaeoGYDpFCjkgWmgF98QfpIr1ZQK6bWjET4=;
        b=hLxRkQSPW4lf4Tcea1Q+Pl/rwIm4ow5E4TSVIagTF3T/iWXK72LaBkI+BO16y7A23O
         iE8oMSjBlDshcC+YaVfriZsgSsO7x3q5UfTy9ljXRtxdX4OHsV5rC3yMM5zCJ09KgzbA
         /CjPCywmC0vz/FqH8Fr4wFvwQxYDEuQRabZd6vNWlxvwgDvO4QgTKrXYfsDFu5AJQVev
         913b8AvUW30eiA+m75vVyvDeJsCA2ogcxk1P2MvGypDoNautepCSqjgIN4RXFCsLcWHa
         OwFJxm2ifilbOuny+Azf4NNYAswRC9FBkdTV/CCl+2//K00X3TVbSAZO4iCN3v9PaSDS
         iVlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793849780; x=1794454580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        b=PWydMd0/qHcw0ikwrmSLutinb/TW255AUxRRc/NxN4adzVLE9mG09+m6xR2ygnk09P
         zSM1850uxbDu5Ok9yQHvkfFKavi0OSwVvy7p5f+q46KmVYpjletiDK6X+SK8dwv2v0Ub
         kZtrZMZ1ohCWRB4k/KvZMXd7Gc/i3UKtnXgcQAKJTfqPSDEJvsgil3zgSfCX+24k80yM
         3OfvtTErDkLCi08pLhAE6wkadoOWJVlO5rKhcpVLUyZxBw0Jn7t6ildYctYMl9r2Wzuw
         vOiD6mtm2wlPPDgNiIT7H0E4BwhFPxWgKDznb/lekU63GSIznpIbzT4iUzk737Lfbm2c
         m7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793849780; x=1794454580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        b=rLH24+/WPB6SysThICu/0776i4mdfGznZRuyzuDcB8TvVWiwqlUY/Ges941Ks70lED
         2nftBqyVRGNGZZLQm9SnyraMJlOyUBef+wJdFO951di8DiR5sYv+0FV1yOQak8UhC7l4
         tQIpoAmJV5/V5lmnsgqyi+0nzY1IU0A0Xt7ETD2l15u0TtUqiSFWAH6yue++M/ji4Sv1
         HH9IK6rGEiovrcbos+WHxzCQgCox3SvfV2hL9A/Vb3Typ5zqT+17xX9PTJRW6RBzSIFs
         AqQ2u6sAo02BUWyCddZoreFHGFqdggZZPzFr9XeUJws8ceuT2W4adqFtYBPCfUUV3SJD
         qXUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwGfG/D8br9PWl5xoohiUSoeCn95pw7X8kR7EMp+yYCE14UepGworPRiMlACCBg5Wb0GudwPrSLh9s47U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+84Znd0a1kyxhMBN9U3kvuqs5Ej3Gi0UTJHxiY9veq2gQTVC23
	ORcBKHA8Cn+VplGDrx7A6bDYxQDLyHz/f3U1tJmmouJno3sfTa24hlTDHUo1ipWiWGhtx22C6VH
	a5x91TuXR9l28OzlJmWYhT8tLY3QlWu8=
X-Gm-Gg: AYBFou02h7hH6K0UZ9y4d1S9Xu6n5wmRLcJzUeDA6I1HwXaOoBxMAAHyPd/cegnrOjj
	nthyIaHEoJp6ODZQ/Hn8mWnwQVnXsdCYndJOgunqQgCUEI4EK5RyTKFfOGJdYEbeG8ckIkYjLJl
	1SmDeHT3k5s6Wg6bIAv6xrsGxsWPaoE9Zf375kNCVodhfHtRbLWMOSvlG8OYlyfw1GWcM5lmi3d
	kG9l8myGx7YzjB1+Vfg2lUIbx81uD3CLirqk61uaMFzJJ1mQFZ/sva3MeSTABU6jw8dAMburpHX
	l3hWSvxnQwtP2rXTD44Va+1HASYAO/5c17viLNSduB/6CXHZrqp6GZzkgvUm8PQiFAgNY+Y0qOB
	ykvZNDlP/eE90UqxL6qrGKA1qrSb9kIsARC0KlQ==
X-Received: by 2002:a05:690c:e3cb:b0:8b0:e385:edc3 with SMTP id
 00721157ae682-8b2b6719311mr132765087b3.33.1793849779988; Wed, 04 Nov 2026
 19:36:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com> <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
In-Reply-To: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 5 Nov 2026 09:06:09 +0530
X-Gm-Features: AclHuK9YMOK-xz_gxOFW3IfSoWRvHeDrckSu5fgcWiOJM4mFO9QGiU-P0B7A4RY
Message-ID: <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Linus Walleij <linusw@kernel.org>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thanks for following up. This work is still active.

The October 15 GPIO-request callback was superseded by RFC v2,
submitted on October 22:

[RFC PATCH v2 0/1] AST2600 global GPIOP passthrough handover experiment

October 22 RFC v2 cover letter:
https://lore.kernel.org/r/20261022024314.48623-1-prasanth.padarthi10@gmail.=
com

V2 transfers the global pass-through selection to per-pin SCU4BC
controls before pinctrl registration. It also handles SCU510[28]
through SCU514 and restricts affected requests if handover fails.

I have retested this implementation on B650D4U with a newly built
image and GPIO-only x86-power-control. Remote power-on, remote
graceful power-off and physical-button power-on passed, with
power-good transitions recorded in the journal.

SCU4BC remained 0x30000000 and SCU51C remained 0x1c80 across the
remote power-on/off tests. Electrical continuity, mixed-pair
forwarding and fault-path behavior remain unvalidated.

I will verify the requested base, rebase the October 22 version
and resend it as RFC v3 for renewed review.

Regards,
Prasanth

On Wed, Nov 4, 2026 at 5:49=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Hi Prasanth,
>
> On Thu, Oct 15, 2026 at 5:51=E2=80=AFAM Prasanth Kumar Padarthi
> <prasanth.padarthi10@gmail.com> wrote:
>
> > On the ASRock Rack B650D4U, requesting GPIOP3 through gpiolib does
> > not provide working host power control when the GPIOZ6 pass-through
> > strap in SCU51C[9] is set.
> >
> > With the existing GPIO request path, SCU4BC reads zero, but a host
> > power-on request through x86-power-control times out waiting for
> > power-good:
> >
> >   SCU4BC =3D 0x00000000
> >   SCU510 =3D 0x00000000
> >   SCU51C =3D 0x00001e80
> >
> > The AST2600 A3 datasheet describes SCU51C[9] as an additional
> > pass-through enable for GPIOP0/P1, GPIOP2/P3 and GPIOP4/P5 when
> > SCU510[30] is clear.
> >
> > A diagnostic experiment that cleared only SCU51C[9], preserving all
> > other bits, allowed the same GPIO-only power-control implementation
> > to power on the host:
> >
> >   SCU51C: 0x00001e80 -> 0x00001c80
> >
> > SCU4BC and SCU510 remained zero. No per-operation THRU1 switching
> > or additional userspace delay was required.
> >
> > Add an AST2600-specific GPIO request callback that performs the
> > existing GPIO mux configuration and clears SCU51C[9] for GPIOP0-P5
> > when SCU510[30] is clear. Check register access errors and verify
> > that the strap bit cleared. Other GPIOs retain the existing path.
> >
> > This RFC handles only the GPIOZ6 strap source. It leaves SCU51C
> > unchanged when SCU510[30] is set and returns -EOPNOTSUPP for
> > GPIOP0-P5 requests when SCU510[28] is set.
> >
> > Hardware testing on B650D4U with this pinctrl candidate confirmed:
> >
> >   - Remote power-on: power-good asserted.
> >   - Remote graceful power-off: power-good deasserted.
> >   - Physical power-button power-on.
> >   - Physical power-button shutdown.
> >
> > These tests used x86-power-control with software button forwarding.
> > The earlier board-specific SoC driver, its DT node, custom sysfs
> > interface and diagnostic boot parameter were not used.
> >
> > This replaces the approach explored in the withdrawn B650D4U
> > power-passthrough RFC. The new proposal changes the existing pinctrl
> > driver and introduces no DT binding or userspace interface.
> >
> > Feedback is requested on two unresolved issues:
> >
> >   1. SCU51C[9] is shared by all three GPIOP pass-through pairs.
> >      Clearing it for one GPIO request may affect forwarding on
> >      another pair. How should that shared control be represented
> >      and coordinated with existing mux ownership?
> >
> >   2. The SCU510[28] enable path has not been validated. Returning
> >      -EOPNOTSUPP is a limitation of this candidate, not a proposed
> >      complete solution for every AST2600 configuration.
> >
> > Is the GPIO request callback the appropriate place to handle this
> > strap interaction, or should it be modeled through the existing
> > signal-expression mechanism?
> >
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> I don't quite understand the status of this patch, if it is still up for
> grabs, please rebase it on v7.4-rc1 and resend so we can restart
> the review.
>
> Yours,
> Linus Walleij
