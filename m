Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F13002C8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859200; cv=pass; b=b/UjF89LI8kivp53axXHUM3nUPCQBwSEymjwLe7OCHnhj7qgSNw/kR2NehYy3migOWvL8I4M7qK1qU0Ujf4K2mkh40MCGXo2nivVgaxnSdbGWMfdzSldNdKcVlCeebeZCMbphPomSA/lf4VtosiQ3c56lDz4TFUrY+pnhg6Lnd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859200; c=relaxed/simple;
	bh=otOvJx+v4mCctU0P8KqwJwZBPi8bcxSLIa4r0CqtLHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNDn4ybwhlMtlip1qxHJrNeiKICnqktTmwhaz4Z5BYRdMhCPYdq8i1H8/e7aPj1pePnbZGX+wkOsVe1i3NrwbhecfatTSdEeoeU6ayO0X4L5PXuLL85wEZqEuLX/pdkAcEVech1r1+NwCNPn64bIj9NmTOPmmG2WSrsTJAiwosg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rr7Q4DwC; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rr7Q4DwC"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b042e00f7so923904f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790859197; cv=none;
        d=google.com; s=arc-20260327;
        b=Ba9tcYnhq59LSFrx55zkFgfgxnaHyA2ZyS1JaNfeO+JI0hqVy5kla62XH3/JYOdo7K
         Go3SkNHDPdmNCb0DEZ2rJDl14kOWOWSivyldS6rEYEqouNqvIyXZpB/+wVloteQv02xV
         xu4a7D2ilsmlU+89qyBN4bvMOGUIdClk2TnDyfffAuz4BwgUwbIdmv5M/utNkx6KyV0i
         F0vCWN6xlGdX3vV7fo4N3f/GpX1wRUy39f65SAZF50uIfX8d1x+lkhDLdwICVJKVdNdR
         1lVEL7hZxRxotuXBkE6jA5o5FgNH5jjjLbE/RB+bW/aCYo58sst0VwziPQwfhwVnLC/i
         Cbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EgB5pRH87iQRk7r1D5YO0SmXMstv2+ESj47+eIJsfuc=;
        fh=5sKv9wSUEhtNMxgQVs1zG0KOaR2qAaAU9fHrARx/PXM=;
        b=d8zyALppMJgYU8Hj6DtH6KzdtL7etw5IWZqC/rExO1qPzp9in2GzhTMVsciyy9KhOj
         PY7opBfZx2Vm9BNw9INwzOaV/2TNtT2ITT9Oqs7vBrK789Z6+M51IbnjXcdalLeK3//U
         1scklT8WF6FDMH/cpO9byB+pnHQXD//AM7jLwEa9L39KYCurK+YWTAUlke5LpDtMDgJ7
         hPZc80YQr1wC8v/P5SHlEyaSSHu6Txw+BvdP5ZycRPnZ9omimSN2SEwJ2j2dPp5R+e4R
         5vyIn66DYSh+57896XBfzYlQZ45znF2mTCBvt3IrQmlYUDiuPdG50ukGqVAOOnI5K0ef
         IUFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790859197; x=1791463997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EgB5pRH87iQRk7r1D5YO0SmXMstv2+ESj47+eIJsfuc=;
        b=Rr7Q4DwCEb8j+P1UKHezNeSTxbX/ttJkufvsftz5P9M7ssFGMTLGjNnUEKfS5HjsVN
         bLh6weqFn+j8ROckepwj5yl791oyJh25gl2XrCJ5fkeHiWlMDpunWxrNIaaVbH36ZZ4D
         S97uSm8hJM/Y34GCV09cxEfVJ6AYoYwZ1yRtJg+sXJUUOAMV4mM7CS8tWO+cXIaWtHFp
         U5m2FKWNoVvVxoJWGFfLf2xUKu7UvNnu6amg1S8yEGzpHMV/bysZLowgmHbV6gj1Xn7v
         QBsWYHOPeHHM3orpwBZt9HApIThg59Cfqz5ExedmvhDG6EEsKlCLCiL5bG/Yk/L/Rg1q
         KF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859197; x=1791463997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgB5pRH87iQRk7r1D5YO0SmXMstv2+ESj47+eIJsfuc=;
        b=SqxYpWkHYiywFNnH9I7Alr+V7xGEDbtB7f60xXYrSIpRiJBfRoMeKuO4VviJZvw0vX
         SLBV2trHM04+EjwtMPQy/Rve65wsPi1LMr6lPN9pNPYd2tdy6qMayvFwqH6GyIiN5TYr
         caxSBwaCLmiNF/ABfHZ4G/Q/qYzf3dsg85ecGpueZyXvjs5OMJSM3gv4AN9fu5U3WQR1
         ORL4rgyolAbgnUoi7cGB6z3yHk2kAVbax/SWPdDMy64ZOUlSIWoVBYSJX++FeYAUO+h9
         7A+4IW4wgdupx0F69fywl4quEvTUyKjziElzqlKEBodKV9aHKCGVCiPyEEP9ups9v8MF
         2rAQ==
X-Forwarded-Encrypted: i=1; AKwUvByYWPCCZKk66H/VulXY0ZW34eE9OlrSwtYMqRQIoReZMgplxJFzyjOhvAfHB1QDRu0tklQQRov/0dUSBnw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOt1XVIInAS5Qlby1oLRdpLPtR2OG/AxTm2qHPu7/ybd2tg1z+
	FvN3pTwv4cq17aaDs7nEwpdW4aNZL5BeHVWMTiVyFQj4UBU+YynhzrX1NFe3gdJroOe/4B9wyZl
	Egfs1Kr8skH5z7RrlCpjjkgWx9Du7tEE=
X-Gm-Gg: AYBFou0BqAoH3B6mkhUjpkyzHfjJOAk9WyjYrPS2GqbZB1qP9DEXlu8cuQ8J5q+Eu17
	1rOr1o57j8wQGUeuLdmo0EXpuYWqs47O0pTyLf0f6X3SVygtKnH5xTwDTgtLaiBoGUT9vUzgeVU
	ngJaF2S5zLNxkuSzV5xE0DBzkktdf4VpJT62QDMrQ7oS2okktFTi++o4nXzbJVXA/MI6ewH4hpE
	uesLW9Ogx/XW5avFh9NEbklApApVRD9yPF7jGN0LeMlxRr8KyHiBkulDuM8hKyVYbG8VIUpXirh
	xiIPHRIQCQFxXVuUDo4267E3+HwNze3/px/d9FTV01fS1iucK/c9PAGxHJ1OuMEfX0xYRizRuV3
	Aw07ZmujIkLzkRUmNXjHZ6XYZbbmd4E/32SPM9naTD8X3m3VpeEAz2sdTjgWCxEj8hkjfDVtDeg
	==
X-Received: by 2002:a05:6000:25e3:b0:487:81c:6de with SMTP id
 ffacd0b85a97d-48b02508325mr9021943f8f.34.1790859196761; Thu, 01 Oct 2026
 05:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-miic-validate-dtb-v2-2-1ee3d33748e9@reliablecontrols.com>
 <179085726114.434549.9959783778596639760@kernel.org>
In-Reply-To: <179085726114.434549.9959783778596639760@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Oct 2026 13:52:50 +0100
X-Gm-Features: AclHuK_zR-x6ip1N3fhdB5PHJQsBa-WlevX9rtbONnoIWhDXBj2buHYHs3VNnC0
Message-ID: <CA+V-a8uOzGjem5R0o-7i3HAcFi4oiw8+=v+PMFC+XVsaHEGDxg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] net: pcs: rzn1-miic: Fix miic register
 initialization loop
To: khendry@reliablecontrols.com, netdev-bot+sashiko@kernel.org
Cc: clement.leger@bootlin.com, andrew@lunn.ch, hkallweit1@gmail.com, 
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

On Thu, Oct 1, 2026 at 1:28=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The Fixes tag and commit message of "net: pcs: rzn1-miic: Fix
>   miic register initialization loop" blame the wrong commit and describe=
=E2=80=A6
>
> --
>
> net: pcs: rzn1-miic: Fix miic register initialization loop
>
> This commit changes the loop in miic_init_hw() that writes default
> register values. The loop now runs for miic_port_max - miic_port_start + =
1
> iterations instead of miic_port_max, so the count comes from the SoC port
> range.
>
> > The function to write default values to miic registers was looping from
> > zero to miic_port_max, which might not cover all ports depending on SoC
> > numbering. Determine the port count from SoC data and loop over that.
> >
> > Fixes: c112520de041758e ("net: pcs: rzn1-miic: move port range handling=
 into SoC data")
>
> [Severity: Medium]
> Is this Fixes tag pointing at the right commit?
>
> Before this series, the loop in miic_init_hw() already covered every
> converter on both supported SoCs:
>
>     for (port =3D 0; port < miic->of_data->miic_port_max; port++) {
>
> RZ/N1 uses miic_port_start =3D 1 and miic_port_max =3D 5, so the loop wal=
ks
> ports 0..4. That is 5 converters.
>
> RZ/T2H uses miic_port_start =3D 0 and miic_port_max =3D 4 (from 08f89e421=
21d),
> so the loop walks ports 0..3. That is CONV0..CONV3.
>
> c112520de041 only added the RZ/N1 data.
>
> The loop stops covering CONV3 only after the previous patch in this
> series, "net: pcs: rzn1-miic: Fix port numbering on RZ/T2H". That patch
> changes rzt2h_miic_of_data.miic_port_max from 4 to 3. So this patch seems
> to fix a regression from earlier in the same series, not a problem from
> c112520de041.
>
> This leaves a bisect window. At the previous patch, miic_init_hw() on
> RZ/T2H runs only 3 times. The CONVRST bit for CONV3 is never cleared
> during init.
>
> The two patches also carry different Fixes tags (08f89e42121d and
> c112520de041), so stable trees could pick up one without the other. If a
> tree takes only this patch, RZ/T2H still has miic_port_max =3D 4:
>
>     num_ports =3D miic->of_data->miic_port_max -
>         miic->of_data->miic_port_start + 1;    /* 4 - 0 + 1 =3D 5 */
>
> The loop would then clear MIIC_CONVRST_PHYIF_RST(4), which is for a
> converter RZ/T2H does not have. If a tree takes only the previous patch,
> CONV3 is skipped as described above.
>
> Could the miic_port_max change and the num_ports change be squashed into
> one patch with Fixes: 08f89e42121d ("net: pcs: rzn1-miic: Add RZ/T2H MIIC
> support")? If not, could the commit message at least state the dependency
> on the previous patch and drop the c112520de041 attribution?
>
I totally agree with this feedback.

Cheers,
Prabhakar

> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260928-miic-validate-dtb-v2-0-1ee3d33748e9%40reliablecontrols.com
>
