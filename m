Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870459;
	b=pZhMY0NfG3EDUetSOXlPhX4VMOLHYHJ/8cOOHhGRhh71XWgoL4wFZWFXSQkx0eVfyqYL
	 SgJpja9KDXb0V5FsCxAT5rs0C4zI3JLoNPWNd3Cq30djAhKiLFh0RM+3nEj05rVjZNfrG
	 RRODnONWDNZgfpvTvcTO6Cm4ihL7C3z+04oNpRM1WAZ8FRMRjkiblPAmkC9DkJvLxntPW
	 yb2LIOCmGWs9BK/1CdEFzGzOVv4Wcwaz5MOxogCOH4q3rs/mWQy3ug68kvm2R5HeKwGVP
	 CiDT4BiZGWTkrHkwrQ7OfimrCRaISDftdme+jU/s8kKwhQb/U0iDaQ7Y0N4q8gowUGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type:Content-Transfer-Encoding;
	bh=ydCDBPssTz3ncKEW3MVclnuDfOEc/UHcPxQp8+aHet0=;
	b=fzW3QsWyBOIJZgrGN7KR40dveqpTx0dRXLJp8P1iAkYSLmEeFb/mOs3FAp70dCqsMvSm
	 B1spBxZy/Xxqv9hZelbAuVeAU8aY6m4LV+WklIIsCxSsEwBOnpYQ75Dg0uaEfVYLJyrHD
	 s84aYjck0mp05ZJnCl6cEeMHcUSvlE7+kcXfM+f3wNqi93asKzAr+g4UPORXahVhRw2xc
	 48bYdOYhstIYaOlqMwHpkow2mC5z0UPz2iWKruduvC100sxWBNdQLH0KABVN7Z66c8TlU
	 jGI10/kW4/7h+0ZeyO9J7HR2YTlXjU/LMTW86hR8KVV492O6EeH/miybUsUNJ2HgEEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GXUgnO3L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BD0606A88E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BD0606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GXUgnO3L
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b807aab44fso2221243a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794870457; cv=none;
        d=google.com; s=arc-20260327;
        b=NHW/pRv+5MUc8kLdHk1FqtlEUgqv7fpAGnp2ck0sBcAfXdb9shmBDAUTtoD2GADJKZ
         YphxcfVDPPfHRPN4Q+PoYAuiE7nRRJNaNgC/xy5FkedMPNlF13YD//ocDe+SajK/71uS
         9xSsPMVxR2h40Zxq5cJldtcXKqV9zO4NoUdlWeK35/jzp0N8ylgra7JlJBY2wc7aRoYI
         Y1r9gWBNJ5Q4M7zlFrO31UEShcMZ8USLRX/hueH0v0gC39MZ/QIbv3P8SEIatQkXAQZL
         kNi/yLqLB0cM2HcL3knasOBRPQBrMDuXgGk7EW0mWN5Yx+zLIG8IlOB/Zchbgx8nAhy9
         a8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ydCDBPssTz3ncKEW3MVclnuDfOEc/UHcPxQp8+aHet0=;
        fh=1+4Qu8ddPoLLRnzHnDmxhD1ihx+9JCtZb94LW33FcLM=;
        b=KVpbU8NEg4dkhqdQnAnmGYUnI1P0AqfsIbV/y/lcD+xU2HGGAmG0ev11l+l56Q/jlc
         vt3s1VwP0GDqm2f0LF8mAAz5od237DmkD36yyc6Xe8Gse2I3tqQpw4bLy+phTavbbol2
         GuLnjjv3KHoC/lT2AZwGJQMq53tHZ4Ech6ap+pkhx55gc0SFTDXxF3UApSF4jF84bj8X
         r9IlaZD+Sv0bBY38NmUNaMTK/8d8YpJEAG3nfN6qYOkPVdUyMcKVQRnXk5+3iI2uz3+d
         VKgOAzMRAKtPVZPIaeLk/pmnpPCSJQPd+R3bm44iQhA8b1ZzchoGArbAXi+kQYNyjG8w
         Z3Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794870457; x=1795475257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydCDBPssTz3ncKEW3MVclnuDfOEc/UHcPxQp8+aHet0=;
        b=GXUgnO3L2sX8jIe+JNGQHMfQH4z2uwWV5JtvWCT2CP6vZsmGvh7V8LHDnLv5us4vZv
         PEXDM5ZhMNcx+fZgl8/G2Sppg6qPE0xzgWMuUxkpGID1la1F4r0X0cHFgtpcMTicfc4B
         ti54w8E5pr+fj6IIovREg8N7kBD21RQHst8BZrAfYsIa83lW+8ck1ic7YnUrjnblVK1k
         5A6MZ/6kYf+G4RDusB0KsfmrXB5HORmm616WjSWNCp65k1n++j4+QVXBIA5sG3a25AY8
         WbJkyRX2cfW0bMKbGu2YUnRGdqviWBxMJ+tTbtBuJisaefMtwVulUH63CJyb+vUZCMeo
         FZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870457; x=1795475257;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ydCDBPssTz3ncKEW3MVclnuDfOEc/UHcPxQp8+aHet0=;
        b=AttL0laGPrbTkCDT07yY/1OX6Uj7nx5SYhd7pvPZObUBUc0liYqKzJMFo7I51IECOC
         gQtQmKa/srpbVf1BsVh0+Vcvt8OP0rFac23hjDEP7m4VoaIsr1NkTuK84HYZhFSzBCLI
         g+0R7+bSnh6Xu14qMROmTn5AFkeW0jFQwgHFcOXLxF6XZSSbycBdNBMoKb6E/WvM26x0
         0B8tOPOa7fDkOvivouvHV7Q1qPxtTjDc1iyYETc6AzPv2YoQfvGDhSDQx/XKfjp7qa4d
         kQsLbIb9Ou4FC35tA2fjXgW1aTS0f6uCKm+SiYBv2IAa0MLa7XyJJiPP04PAxKmgemC9
         kw+g==
X-Forwarded-Encrypted: i=1; AL+hErGNw5Do2qUG0vSZy+6xzjGJVfLRv+AJ4WIK+e/Mc0jQG7MnXyk0L1koavsZjb0BzHsmPrwJ2E2Jngj6kNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CL6WVxSKPxYYbVEGgFKLlCYCOql6dboQ0TEyE8/XyyWKblJAX
	8a3XQtxQWY0lvW7HLuRwWsjyE176hWg1rEYaBEvADGijDzgKFD3NdDp8dSdge513CQym4xJgbkb
	KULGY3/ArQRC05DKiabtX/mCw5l+CR4o=
X-Gm-Gg: AYBFou0436c3EEhY31dRJhemqmDxUiX5UgPpV5H19UQ0H8uhguxrBnX5xiG+hBEBqSa
	OZAzQQX11hZyOee06u2M3hwu5NSWddwZQmAJOdwiFOljP6IvnAg38YBjtJdqCfDxdU0f5Djm+mu
	bywXHM02QEHE2e2QYD1F7s+6MUp1op4V72F6DbuaBM/D6WaU5REU4td5cAhRJyS9o6k9cxveZrc
	hyiSO+dj0LLsffVMbBoJTKzSIERF5ayXo96FYHesbsbJhc2cRs2no3UcVzv117HF50IHln1Df76
	1fpj4h4lDKBLXXPdYrnPfue7c6utoQtkZ+KkPYgTkMjHN/ZQLXiT3HCiswQt8nAe1jiSZLdKL1j
	OgQJzDG5fRS5R5U4SsB52eGQDzmrWcBazpEO8hPed1HTQqHgbTiygQEEtATqMDkbbYzlXJSOEUk
	1qMg7P2tDWvKnPl8Kk+QZsXxQ0LypNIKLL6z0IFf26EfHNNhtO
X-Received: by 2002:a17:907:6e87:b0:c49:cf3a:a324 with SMTP id
 a640c23a62f3a-c5096409dbcmr975144266b.22.1794870456872; Mon, 16 Nov 2026
 15:07:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006161155.862736-1-voytikd@gmail.com> <179454594618.814257.8646757102444143940.b4-reply@b4>
 <aviuyR8CO027Ch5R@levanger>
In-Reply-To: <aviuyR8CO027Ch5R@levanger>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Tue, 17 Nov 2026 00:07:10 +0100
X-Gm-Features: AclHuK-E8ZWp4c2bm5JSmaB0I-NH5LuZseQXBYxydSLLee4ppPsCK12Q3gVM4Ug
Message-ID: <CAAX90H2ajNcAtKREMY5YWf-CtS=WQ-A7K1SpQNJBXN757Qc8Pg@mail.gmail.com>
Subject: Re: [PATCH v7] scripts/config: honor $KBUILD_OUTPUT by default
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Dmitry Voytik <voytikd@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan and Nicolas,

On Sat, Nov 14, 2026 at 7:57=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> On Thu, Nov 12, 2026 at 09:59:06PM -0700, Nathan Chancellor wrote:
> > Hi Dmitry,
> >
> > On 2026-10-06 18:11 +0200, Dmitry Voytik wrote:
> > > If $KBUILD_OUTPUT is set, use it by default if --file is not passed.
> > >
> > > Fix the issue when the script silently updates a stale .config in
> > > the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> > > to be updated.
> > > Handle properly if the config file is a relative path.
> > >
> > > The problem can be worked around with --file, but this is easy to mis=
s,
> > > and is inconsistent with how the Makefile and other tools work
> > > (e.g., scripts/diffconfig).
> >
> > I was finally able to sit down and look at this a little bit more. I
> > think we can avoid the use of realpath altogether, which would avoid
> > most of what Sashiko is complaining about. I tested the following diff
> > with your examples and they appear to pass without any issues. Please
> > give it a shot.

I have tested and all tests passed.
Thanks for the patch!
I'll send a v8. Please feel free to change/add tags as necessary.
Thanks.

>
> Thanks, somehow the sashiko mail missed my inbox.
>
> realpath on Linux uses '-E' behaviour by default, which is what we want:
> check existence of all directory path components of the given path.
> Adding the POSIX '-E' option explicitly should solve the non-Linux
> issues.
>
> As a follow-up, I would like to add support for $KCONFIG_CONFIG as well.
>
> > I think we can drop most of the reproduction and
> > examples in the commit message. If you want to include them for others,
> > please put it below the '---' where you have the changelog, as I don't
> > think it needs to end up in git history.
>
> +1
>
> But still thanks for providing the test examples, it was and is indeed
> helpful for my follow-up tests.
>
> >
> > diff --git a/scripts/config b/scripts/config
> > index 32428ea909c2..497551538433 100755
> > --- a/scripts/config
> > +++ b/scripts/config
> > @@ -144,6 +144,22 @@ while [[ $# -gt 0 ]]; do
> >       fi
> >  done
> >
> > +# If no '--file' was specified, use KBUILD_OUTPUT as the base if it ex=
ists
> > +if [[ "$FN" =3D ".config" && -n "$KBUILD_OUTPUT" ]]; then
> > +     if [[ ! -d "$KBUILD_OUTPUT" ]]; then
> > +             echo "KBUILD_OUTPUT is set ('$KBUILD_OUTPUT') but does no=
t exist or is not a directory." >&2
> > +             echo "Create it before running $myname or use '--file' to=
 specify configuration file." >&2
> > +             exit 1
> > +     fi
> > +     FN=3D"$KBUILD_OUTPUT/$FN"
> > +fi
> > +# Turn FN into an absolute path if it is relative so that '--refresh' =
works on
> > +# the correct file. This does not use realpath, as $FN may not exist y=
et.
> > +case "$FN" in
> > +     /*) ;;
> > +     *) FN=3D"$PWD/$FN" ;;
> > +esac
> > +
> >  set -- "${CMDS[@]}"
> >  if [ "$1" =3D "" ] ; then
> >       usage
> > @@ -200,10 +216,10 @@ while [ "$1" !=3D "" ] ; do
> >               ;;
> >
> >       --state|-s)
> > -             if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
> > +             if grep -q "# ${CONFIG_}$ARG is not set" "$FN" ; then
> >                       echo n
> >               else
> > -                     V=3D"$(grep "^${CONFIG_}$ARG=3D" $FN)"
> > +                     V=3D"$(grep "^${CONFIG_}$ARG=3D" "$FN")"
> >                       if [ $? !=3D 0 ] ; then
> >                               echo undef
> >                       else
> > @@ -229,7 +245,7 @@ while [ "$1" !=3D "" ] ; do
> >               ;;
> >
> >       --refresh)
> > -             yes "" | make oldconfig KCONFIG_CONFIG=3D$FN
> > +             yes "" | make oldconfig KCONFIG_CONFIG=3D"$FN"
> >               ;;
> >
> >       *)
> >
> > --
> > Cheers,
> > Nathan
> >
>
> Looks good to me, thanks.
>
> Reviewed-by: Nicolas Schier <nsc@fjasle.eu>


Thank you both for your time!
