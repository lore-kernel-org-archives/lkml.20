Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.135
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792638268;
	b=YAnukn2UjGJfr3aidEj+JhbrCux20GuKztmfHZBl467+VrRX7KMZdoHP9TVEcSSme12q
	 4pKaXHPrT5b4znBKNR9sfYhPOkKGx0kGO8A8z11wMrke7A+i7CBiTxKxPQvsgBozP1QsZ
	 oCq58nbOm1VE6DXOOLf5K5bvlRFq68JNbbzI0FFX/WM0JQ7sc/5X9nFJk6pofMdOJVg+3
	 a1uLhLU6Z4BvpJVJn8Nt4iL8HIenpR4JyuJg0vw7sE1T6TZrIt6kcVadznVB6c6WJRaiE
	 zt92RkuLZFD65uKGKFX95ltPFB5YHW9eol5NLSccl12RIFJOw1ODklBpogjn8ixHCeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792638268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SGQyhFT+2bVUEMq+UKAq2bulBZGeiIByCybjssa5muk=;
	b=mnIGa2CXBoaUYFoQBwbCjpXdZUYepRXOvkauovjC3M59k8T4Oyr32A3/VlAuf9RUCAx4
	 Z1g5UQ+I01bn3YI8pCa9D7alHv0rg9kvdtV+QG4Dz/zZi8nw9UgD1kFtA+ELe7BKwRnQX
	 r6fvj9Cvo56UYFBI6p4FK2FFUhDSjwT5pSzp91OTC7k11obA1zqW9fM9LrGr2qjgqa1nL
	 ktlRbQL2wIYE0xBnDyy0fFN6fEt1+/axcKqej0zrF298FWxuKVx/q2FgX/iibrEYOJTYo
	 kivLhMr+tzzIWajWMH6uiFShKm0Y6FXBkMKcF5e1ppnARvovQe87Je5k3JU+NQSd44g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pGhDqs17;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.135
Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155B7606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155B7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pGhDqs17
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c40b9a88a5dso52012066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792638266; cv=none;
        d=google.com; s=arc-20260327;
        b=dKD2DEAT9N4Za3nbS0ci7anrYUS7G0XQdyG0eM7hCtfAjeKcEJqNxOfATelRhDfe9S
         jroxDXlWBnHEYsc5soOy/iICfokstE3/1VizPjKOO4YHBv1mGrZnL18M3G/MSmiiM+6S
         4Q4f0eHf3YYQ3ECp6RYtYLBR8fo35NSBMLQqgPDTxgAuaMUCZxOuutUKzhDjZD50BC3M
         LwaWSV7xWVJq4YiI8YqfUEWO8ojio5dzgt2uwk3UNlSm7KBGGMkuHgXn3lpb5+zfoYZy
         Oa4L/i2ndEJLB3ZI32OW/0HO+OXUue9LOjY+QQtv0vT22F0QL/YkYAH1LcrvN1wDGeEH
         H5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGQyhFT+2bVUEMq+UKAq2bulBZGeiIByCybjssa5muk=;
        fh=XggGG8RvXhrICLMA1dgIQdh9ue0rucfoAWAFfb5LUbI=;
        b=RH0I7pAoUo6hQvdB+sRoch89/V1u9aFdXdsqSgiDKHrH+OHZxHuYF7KB9kgvPx5CHU
         2d+ca93Sgg6fNuZMhKcgPwrUYJtOL8BqaYacjY6CfIeNGruuVX/nRUUxrbr3J8InqFBY
         BMjBI79/2Ux0PM7vJ0rGWkOaaRXskmxfYJEco/dBi1ZEHbjwnnDfs2WblRF+iFPphwvH
         RupNSyQ+ea/WvT27dQoSZJLNfsplGD/OIErbdXeyeEf9nbgVSrtuqTVxUP1GOo8yiI+M
         xeV/DuuqVzoyqEbAZXX1egLqHRvpM98IJmEnOFyPQVjVB5+R1JOFqaxV4S19F4+A7+wx
         28Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792638266; x=1793243066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGQyhFT+2bVUEMq+UKAq2bulBZGeiIByCybjssa5muk=;
        b=pGhDqs17YyutJ0+vUrBt/NtkAuagconfNCFI4qfR3kW/ZxrLgzrKVBPf4YzzqOP51s
         D6UB+FxOsPPrDSulVI9h34YSLO03eRuJQmYOYh0qNGOUz5nS43xMcAih9Wvu7967N151
         f1unKzznZ4NJnBAOJlcijaxfMAkuK0cTz1bUt58eRUDqi55PW55R3dgyB1SEFWwWMlK7
         C7Y0UpfRHgOdBTCqgnKesB+86XMNBR9JX84IGbalGRE5x5SA77NKYyYloX9lIdiTVcj0
         Rx0f07MK+ePUekKWyEhrkW/3VpeUeu8ojdFB1Kpimxging53gkN0daY7cvpCqIF4C3oM
         bQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792638266; x=1793243066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGQyhFT+2bVUEMq+UKAq2bulBZGeiIByCybjssa5muk=;
        b=mr8o8Opn/bPzcW/3aQKERuk23olSDVx2gtcaEdORmgzoYgmMtH7/ADRFsib7Yqbt8m
         VuvTdpUyD8KhKO5Kfpw00WwCJaeGODsrkeSlKTG6zKH6MyF7zBUm2fSJVZ4w9qcvIwCz
         3Fm1fZwlu3OnMhvuvAX/1qJBuWlIuKSaDpkbz6C+AQAeKTIE/OpyN4SH5zpPhJ8hnuEj
         VY70QNCV/6g/FzV6+gGNn1+j8BYc4a8KQklLUGBv/4pZSQrVZqHzt6y17rTcVxCFFo8J
         fDIbfkTp6VAocEtJJ5GYNntl5uU8xfkjk/1ZDXQBis/ovIp4ohOLDlManRMkpZzMf6ra
         6A+w==
X-Forwarded-Encrypted: i=1; AKwUvBwM8EJCbyYvgSy96FkpnVH8gkmFMfhv8XUplrAguVC4NScsPvRtpi3zThY63xPfgHJwfF+4rcVaCslYYJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGWbF2FrspBkWfNR8h96atkoEqUJPzZiR+RRXlX6TcSiyvbv/p
	Hbs7RRnNuSLKQakCQ/E/3Ap02mLZh+nm3G1Myniaf4poTfzv8qeAuyDBQRXf0WmO+vZ65O6UOjL
	AXE5BXmv74T//uViHqOQMDDeNhA/3ecc=
X-Gm-Gg: AYBFou0YEXnS432o9ECzueCJHXsBf2QlnNbtiLKOq818l8z2nvXrvoZT8qvq3Fw97Zy
	7B1F7T/zNDtEDi5slGfqA5ZJWQd+4PKQZezgzAws2KY5TrzqKa7YAc6oSESTxkz3v8xJRTo3Bbn
	PufkSEOLvnMSSSyMdgdfm/4NKUGIq5pQTILpEH/ZXQtoOqXYl9GZGvhdBZ3xzilY3CksqbUMnLa
	+mgbYNOybnvzjPdwHbfDLlTHkRqI5VAeyY/dJM70pr42SX0q0Dn02rqbw8h5Oo4jHdArbAEirYQ
	skOrbSpiwKESy4zfcGTcZ8FHcrxrI8vjAKRgRDOjicQDo0AXnNE7nL1Zf4nUMjVcbuEdqURPbrh
	nJWa1Ik6cqfVvxtRFWaVYZ09qyh/oAy5ges7purs9
X-Received: by 2002:a17:906:7954:b0:c2e:3f49:df04 with SMTP id
 a640c23a62f3a-c46791a9854mr357604066b.1.1792638266169; Wed, 21 Oct 2026
 20:04:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925041751.495818-1-coiaprant@gmail.com> <382B43FA-B225-41C5-80B6-944D9D2802CF@gmail.com>
In-Reply-To: <382B43FA-B225-41C5-80B6-944D9D2802CF@gmail.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 22 Oct 2026 11:04:13 +0800
X-Gm-Features: AclHuK-x9tgKioE3zW95rXaMi6_YZtM8cmcvfk6VmaCJ91IvPzsI4d9vJZ8M2Yw
Message-ID: <CALj3r0jMLFbz+oa_z6kySDg-3aLaFWtFoKv9VB_qHhQZDpemfw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: rockchip: mark PD_PIPE as active wakeup on RK3568
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Coia Prant <coiaprant@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 07:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On September 25, 2026 12:17:51 PM GMT+08:00, Coia Prant <coiaprant@gmail.=
com> wrote:
> >The PD_PIPE power domain on RK3568 hosts the XPCS, the PCIe
> >controllers and the SATA controllers.  All of them can act as
> >wakeup sources for the system:
> >
> >  - the XPCS for MAC WoL, through the SGMII link
> >  - the PCIe controllers for PME#
> >  - the SATA controllers for hotplug wake
> >
> >The domain is registered with active_wakeup =3D false, so genpd powers
> >it down during system suspend even when a consumer is on the wakeup
> >path.  That kills the XPCS and the SerDes, which breaks MAC WoL on
> >RK3568 SGMII boards, and it also powers down the PCIe and SATA
> >controllers while their drivers still expect the link to be alive.
> >
> >Mark PD_PIPE as active_wakeup so that genpd honours the wakeup path
> >of its consumers.  Consumers that call device_set_wakeup_path() keep
> >the domain powered; consumers that do not mark themselves as wakeup
> >sources are unaffected and the domain is still powered down when
> >nothing needs it.
> >
> >Several other Rockchip SoCs already mark their PCIe and USB power
> >domains as active wakeup, for example RK3588's pcie and usb domains
> >and RK3576's usb domain.  PD_PIPE hosts the same kind of
> >wakeup-capable controllers on RK3568, so this follows the same
> >pattern.
> >
> >Signed-off-by: Coia Prant <coiaprant@gmail.com>

Hi Ulf,

Gentle ping on this patch. It was sent on Sep 25 and Patchwork shows it
as "Handled Elsewhere", but I can't find it merged in linux-pm,
linux-rockchip, linux-next or mainline, and I haven't received any
review feedback.

Since then, the XPCS driver and DTS that depend on PD_PIPE staying
powered across suspend have been merged and sent upstream:

- XPCS driver in net-next: https://git.kernel.org/netdev/net-next/c/5e91edf=
b0e45

Could you let me know which tree this should go through, or whether it
was already picked somewhere? If it needs to be routed differently, I'm
happy to resend it.

Thanks,
Coia
