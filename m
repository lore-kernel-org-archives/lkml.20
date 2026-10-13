Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F3951DB18
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908842; cv=pass; b=g1UAHvfWXAgu4F2glak3RCRSDE1If01B3heJQKEwnHfXr0avLr/BnBgX5ZAP+hJZk81lrkqcInAqgdbYBLb0xqm/xvWi7PZhAYoWZzM7QO0YVCz88gKln87KgZ4n+QlWPvbTadAzB96SrDlzcf9bcF29QD9gKKUHVBEiLlpFftE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908842; c=relaxed/simple;
	bh=w0IXztAu98K98cCd8kCaVJg3QAtMwDa5REUQqF4U6dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bw8vGwGGfmBkG4uZPsmt/vDxKWA7E4rM8ZKko6/LRNVU2N/Jl2mr0BFHxabsXSoHBWjP0xBDHy67zg7nG9m5NB1IAoLnA6LmDNvK64BMmJFvNajdb+z0MWcmRhBOhxRgPcAtz0rFL2h6ggfCrYXGHW3lcTSswdIciNfArjKumO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAwz60jT; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAwz60jT"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so117685eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791908839; cv=none;
        d=google.com; s=arc-20260327;
        b=K9yZwKCqNLp9p4arHF7FvdXg6jnLkPRS6pYu1/Zuy7ypupFw1oESFvz1K/Piv9L7Fn
         faZAS3PIR3RT56KYZctQ7OPQUgJRkXcudOU0TSPvVJwMjgJRAnkoncFpp2a6NyuNa3VI
         R/oGCADinW4XsZv/bbvuzG4HlPyaQ9b7KzXSiMnKZIIUwfBvxyKLh/ZqfAyHuNGZ2pXl
         Y093U/v7ADaSbpBtGrHDSi3wAlzRlqI9EY2Lr4C8JsjIb9+rrQr2Svw0Hy+wAJ2qEZSb
         OKykWBxfhzrbntRp4pFYz7M7HVTiQ+xIsMjgeCyjlqD2Yw8TkEfQyMYwvdbjIAHRf/qP
         VZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XFVRy1ENi3+Slhs3K96teAausjQ0Dg9HVOBBYOnCZ+4=;
        fh=K3SB4/rVIsoGkuKXULF6mLCcx6qAXoDLOJMfiaSZ5ME=;
        b=E7p3GBt4+Iy7OvzdAvblvKdZIoKuLKIIL9my+iVv5bcCBaiDrdCS6m1TZU3gGx7wyR
         nX0Wplwb3pK8G4J+AQVR8K6gRRWen3gHI++Ljwg8yzuMFJ/xUfloPL5jy/Y6wEH7icQ2
         7b0Rr4Hgz3m6gnJ/PXbe6C+OMmwL7QQFJoAaN3s/CBf6Gevfyk+awRq+7fRyrSEnV1ku
         N5hlo/GppXxE+aEi9YlUHGCb0mzaJzxg6rbuinHG6Kys6H9TAVcy8BtPc8SmUNeo2Q6D
         7v4iryUGWOPArtBkJlbL9hMGpvjzXE69mCk1mgwG4FUeh0kWlXR4skN1Z4ia12uzhTQr
         mwoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791908839; x=1792513639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFVRy1ENi3+Slhs3K96teAausjQ0Dg9HVOBBYOnCZ+4=;
        b=kAwz60jTjbXZ1371SUWeIG50qMgcdtsu5vM68Do4i7fJ9AvXrLYXxi9ATctv5C4yfu
         iKRFsv0E+0bVccekECc7CRwDvTecF/0JE3S2LAHroLpe712G+NNAZKESuMmUoSHLjYfV
         h8rpk5auJVECMX+ymh3Yp3z9dK+JvPvT0mjjf+i77PwAB5KG7sl53zFvVFwtsZBTYl5e
         wgES8+x8HofSP+HdUOmGgjJaDgxtqUqjfH9aw0FzADG4EOZUqi4MEAMnoAsMS3enx59F
         P/52p8VFiL50edSVcTU+xfNQUFwJO8xk+bHdZK4/CouCoF5NTSi6OgwQHLGtmBKVJdII
         P2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908839; x=1792513639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFVRy1ENi3+Slhs3K96teAausjQ0Dg9HVOBBYOnCZ+4=;
        b=jB7Nl7Cw4FYQ+MSUUrsWO0FCy4XabY4SIeJH1Pj7hYQ8xmLx0smxzLBImIamymVVO6
         vv0kU1FY2wODXVE3bg7UE6AZndUtiwRxGKrDURC6zwC2JNmfN33GvjkwuHEMqA9aJTa3
         FRG0FUUKKJCg9nk/2JV8jK/7cmGDDfDb0iADwatlHpKsgOU6QZmlAHssGMzuw6jfnboI
         qSFdW+F8PqB4pHEdvA/K5RWNmGC86jl4iQUQfyA7Mdk3fwA1rPjmLF+IS7sRYIomXgc8
         LIug84VXagdvuQpXlbqM2JohDCyP5TAcbxtjEL/3q8DN6nu/3Y5gEkMezR6KnEiddeJL
         EkMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5PEPCYPKH+XgeUnmy8WQcm0JJiMdxpzL/8ptpjf4Ci86enrgBSsFv+OkQMXctJqQjp7mr5zO5YOQDXE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSvjPvgIEFf6S4FAUh7hStdndneKmOKRyvx/T7AlcL2yRNLg+H
	StJ5Y3vs8HYKOOAofcwn2UknP5MjUyzWcH09u733nJd/kfWG7uIkRVXH8MYvWZ6e97uWHxpFJru
	L9cElqbZMtC0cOuIO8uxB2IcEbz9mR9k=
X-Gm-Gg: AYBFou3+FsgdxLMAfsDUFGQMK86VLSf2ItLd8Ie/ZUClC3YMaB2n2cPCA7JWdxOi1XX
	Wp9wGeSlvn9ua6KYfbzxzFAqDx0ph0h0n/nUfhbbVINgMkuOpVP8C+h1RdH1UUNY3tnOvobeBp4
	uXFViLvXWHBZqOo1V6fuW1fRPY8m1GYy7fWFawVXlBD4YqTKUIMxPQlq1qwdsbcp0ZSInoFE04E
	7icQnG9z35AZ7w5+D0L+R3FtSdsFYYCC5zlrWUHJtZbhWwA7b7BlPt19NZrNnIuOeAbZLRL1AtC
	RITD0F2HdMoqR+mNsSCGrBhByJZPocJJHubHBnMygSnkSBPvgtFztx1IHnjpspK+A1b26POcJyL
	u082b4Cptv7kCklRo1ireM/o=
X-Received: by 2002:a05:7300:e002:b0:35d:5a2c:2321 with SMTP id
 5a478bee46e88-35d5a2c2980mr575512eec.20.1791908839126; Tue, 13 Oct 2026
 09:27:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004154456.145362-1-clamor95@gmail.com> <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
 <CAPVz0n2SmOY3Cw2HpnpYd8eFXw7B=2mjP6LMhKCu5niN=KnOQg@mail.gmail.com> <as5XpdpNm4cRGNcj@orome>
In-Reply-To: <as5XpdpNm4cRGNcj@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 19:27:07 +0300
X-Gm-Features: AclHuK_-dlj4_NR-HXsrfbWG6hEOQBskE9gcB79-TNecmzBROYTdvzz-we1jX0Q
Message-ID: <CAPVz0n3ki1MdkUnK=znzt=uSrwRMbyXfdvGzNrxuB7_mCK9F8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices and fixes
To: Thierry Reding <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ion Agorria <ion@agorria.com>, 
	Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:1=
6 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Oct 12, 2026 at 01:56:48PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 12 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
13:55 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D0=BD=D0=B4, 4 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE=
 18:45 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > Add nodes for recently supported device (ALS, LED controllers, hapt=
ics)
> > > > along with minor tweaks and fixups.
> > > >
> > > > ---
> > > > Changes in v2:
> > > > - added USB configuration update commit
> > > > - added p895 power LED trigger update commit
> > > > ---
> > > >
> > > > Svyatoslav Ryhel (9):
> > > >   ARM: tegra: lg-x3: Adjust WiFi node
> > > >   ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
> > > >   ARM: tegra: lg-x3: Lower supported suspend mode
> > > >   ARM: tegra: lg-x3: Add light sensor node
> > > >   ARM: tegra: lg-x3: Add flash LEDs controller node
> > > >   ARM: tegra: lg-x3: Add haptic engine node
> > > >   ARM: tegra: lg-x3: Add backlight LED controller node
> > > >   ARM: tegra: lg-x3: Update USB configuration
> > > >   ARM: tegra: p895: Update power LED trigger
> > > >
> > > >  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
> > > >  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
> > > >  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 +++++++++++++++=
+++-
> > > >  3 files changed, 127 insertions(+), 10 deletions(-)
> > > >
> > > > --
> > > > 2.53.0
> > > >
> > >
> > > Hello Thierry!
> > > May you please pick this patch set if you are ok with it?
> > > Thank you!
> >
> > Oh, you already did. Apologies!
>
> I picked up version 1. This v2 came in too late. Pull requests go out
> before -rc6, which in this case was v7.3-rc6, released on October 4.
>
> Looks like only the last two patches were added in v2, with no other
> changes to the other patches, so I can pick up the last two after the
> merge window closes. If you don't hear from me after the first week
> after v7.4-rc1, you may want to resend the last two patches again.
>

That is correct, v2 has only those 2 patches added. If you don't mind,
I will include those 2 patches in a different patch set, you don't
have to worry about them in this patch sequence.

> Thierry
