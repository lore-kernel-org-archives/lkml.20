Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902605;
	b=wwe1jWuzUp2g3lyZ64KAsWeJyaAgkNEWEXve29XsVJ19dyRBbVWC4XO+BR5drJoCJ7Xb
	 17m0vv1vYX1nN4yiSNZT8GckK8YWXdcX+TGBZyoNiBqVDJYc4l1HZldHdvBxjaoq2yeif
	 LRkWaCtSEBJtATO03Xw878SFvVivHvHGgpcMo716rpTFid6l6KUBGrqm4As4uEIzeD0V1
	 mhLw60OjLrNxT37yGYjKkeQZaIfBlZVXpTQSRVBGdC/wkPO1LLHwc6VhPV1FQzOz9E3Ul
	 Dz/a60mt/9brm0qaSUxg+F2rDqqLtzhH/I2yospUrm0YGuQCyj1CHsG6SzQuW5i0+/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FRuHktTDVKwo5RvXXcGGk8C8OZkIyyUELpQy8s7GxcI=;
	b=H3CMzJWZh8BXgW1hvNxk4CKsCzTaEebvuxB+tyIGB4JxNIKXw1cyTrlQVGASLblulOw8
	 eOAE2BnaAtYXMxNvfoek2aDOvhEzT17iUrtzNoHLQg7682fydkp8bkO63/pNHtu+rL7ko
	 nKFQL6IKXYAoZrf58STG5aTFfOVVuxEJ3hoEablt3CuJ1n69coOCm3BiI+GAVFiNopP9U
	 mgKjfKXjHWAJroXGzjgK/Xv8SGcW851++HNmTFTYbiFlmYYDyA2TBm5TqaABmJN8PKv8Z
	 XP670NYHxB4RanhoZj9/eluJw3LZcJUWDwaU2P7gscQDAD/xl9h9PBbApLvk1uIXiLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=nSiN5kvQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CCF606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2CCF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=nSiN5kvQ
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1230855b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902604; cv=none;
        d=google.com; s=arc-20260327;
        b=gAQ7JjaBamk7laxaHXiI3G9YzSgSrjp8SReYjJund9GSrufEq2ylcinihSS6965a7O
         p+Xr7UIKQ6caVvv4/n0lFwXIWbofQfVndaWzR8Dj3j7ZydvpE+jT6bLSXw+sYhS1MyUG
         6QcXzrV6aWIfKN5yNOGTLqamNQJoARmtRNgkhDd+B3cE7N2uEfSUOGPfoGDei5hgDoyL
         YNGbmx4FVXus0FmuGIjfGCFJmQdt2gzxb5wPnObE+C/NQwOC12gtBbydOvaeGahS3QWQ
         YvUMaIlKJrPvI5DKy1fw6P6/9bltfDtjXjcKGEg6bQaFF0ET4JnlRSAAxpvV2qWETKFS
         HEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FRuHktTDVKwo5RvXXcGGk8C8OZkIyyUELpQy8s7GxcI=;
        fh=T9pul9O5ep17pY3o1oWzaUojgWeKdv9vC4ngtND4hQw=;
        b=sI4GqtlPEed+IiHGejMFcgwUsb9Y8oMyEkgWnnG9HsDRadzssthqNZLoSSdqq3ADGg
         SPrzo1YSJpi628GatTHnWyT2IrzaUpFoMYP0rc/0QOvDU1A7FOfiNK6ovE5GFV5ODptI
         /vSU8nXrBDEPYEPyGcMxN4dhKWfvrH40Suw9IAnqtDm2yHyjZC/oUHrPyw0AW9c4Kf3Y
         UxzqSHsWCprwsOR/b8LJ7TswoRygwsGfs2yj5CPpw86H7tCrCKO+6gGBR+6b8ckGyqa7
         lvBX38FcSqgRYysCwLUAc7Hu854a5EPFUjwtM/XYlCBnS5F2Uu3ebcO4U9WwreQpFJE/
         Cn1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793902604; x=1794507404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FRuHktTDVKwo5RvXXcGGk8C8OZkIyyUELpQy8s7GxcI=;
        b=nSiN5kvQW5Onlj5l07LTW19DbL4HRPd1vB+y0Dxv7qEtrd7usqSCf+fTgjBlBwKGns
         5FujnIWoRLfzpq1MjEJfmNi0RSZ61bvsX0W+UPYoSRRbVKwNuNr7rxdh2+Ewvn4BtFvy
         W1+ma5DQwhQgN+v8A9V+9RPB4O3uKfYSc1dGO4CRrhZSMqSTjVPBa44yJCtmOXxSuYpF
         jnoG2TiInfDmu6S4WGHXrrmBD0/CFbypAnpv0Cy5OpGfJC/L8yyK/wjEqP0plk6REm1L
         /IEyO1JIqCve6pv/XeNEtiBSVYnMYzCV2Jkvw6rLAUjn+I9Swc9wOJNG15is2xDeCkMb
         9/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902604; x=1794507404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRuHktTDVKwo5RvXXcGGk8C8OZkIyyUELpQy8s7GxcI=;
        b=OEgGxkSNbnLchefGkzeY+K4h823D7JVr4a+gI794N0bG/b4S9nlBxl5Q4KT6f0b9W1
         5aH2RX2DCEQXYz/z7Rvu456n0tISRcxIJO93iGbIhIK8X36wxNWZk+Th+FuzY3nXm/CI
         04O20bDRFlvXw8s8pcj3veZYz8kvIH3KG15VxLJkCpBYsuxr7Wff8kEEpP+XwDDQ74gi
         S8PCIaAoUdSMTsp5Ode9IbPzc2OjFayLfBcCHEfE/P4aQ97fgt7sHn1MRh/u/6+K7DUx
         8Cm2qzKM2uA8kT/dkB5ye2nArgKDo30iYKTj5SgcKRycA/ADMcFe+Dy3J3NuD9L+XPJL
         1wvg==
X-Forwarded-Encrypted: i=1; AKwUvByxmMCGnX6onz3DJM6aekeRAKQmzTkKO9vlZ1KGb6BM0S0ZD0IB/Ed7JjjqIgADMJggaBJNgOm1W3z7TQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rHdmqsYdFugSNHLTG9d/SPcsxjF3GcBZv4sU60lnjQOWO/UXQ
	v7CrJgYD7t5+LtXOZXCI/T63t52zbTbZQrTbpTTl4Ys8F6rTtMzbPHG+vr+mPQTkc/GU2/Vy7ZQ
	4zYqayKSzrRur5/lOhETgZzDsiR1OSEF57toI44WGgg==
X-Gm-Gg: AYBFou2FoScbhEg8nupzEGRAzBjnjJZCpeuYqT9C+fkCP9qZZ26NHgX7N+KMDUN8sZM
	s3n0DlSM7YytgQREgI7CqjLG9TRlH7uzKjg6eQTcXud8gfjdjl5S92pW+/EWswfV+LtObtXyxtB
	m2HdgEMg9gK5Avn4VTJJk8jHm0OwiBRsuUTCWosHRG37OFhb4LRZEl9W1EOMzCpq5vagXqRJVHZ
	uydq7gA8GxKrh6nzI3KCM0LTV9PPgyWmPoYzxsYqiHYvhjJBXFVnKETPgCq+U4aUBxCvaoInVpK
	RTiaPAe5Xhn1rQbKOs3r2VDiB+HqqSg6ibeLCCVQonhbE/gDihjDymoygkvpaaccXHnWsIVCyDf
	oZzsw8c7/uQcMQLZwyitVnl3Wxg0W61p1ILqD
X-Received: by 2002:a05:6a00:2e10:b0:89f:600b:610d with SMTP id
 d2e1a72fcca58-8a9bf3371bemr17651793b3a.31.1793902603859; Thu, 05 Nov 2026
 10:16:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-panfrost-rk3399-pm-rt-v1-1-e94437159a9d@iav.lv> <autNWETrwrHbD2H9@sobremesa>
In-Reply-To: <autNWETrwrHbD2H9@sobremesa>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 18:16:32 +0000
X-Gm-Features: AclHuK89M2SkDj4GupZYw3Cx5gF7O7bIl48XC-kBSDLQ8-C12o5Bi1k93zrIM-g
Message-ID: <CAPj87rMoGhN6yew4tcGeTjrG87685f2cdrmkHFZ91CwfgXx0fQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Gate the RK3399 GPU clock in runtime suspend
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: iav@iav.lv, Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 4 Nov 2026 at 15:40, Adri=C3=A1n Larumbe
<adrian.larumbe@collabora.com> wrote:
> On 30.10.2026 06:43, Igor Velkov via B4 Relay wrote:
> > @@ -983,6 +983,7 @@ static const struct of_device_id dt_match[] =3D {
> >         .data =3D &amlogic_data, },
> >       { .compatible =3D "renesas,r9a08g046-mali", .data =3D &default_pm=
_rt_data },
> >       { .compatible =3D "renesas,r9a09g047-mali", .data =3D &default_pm=
_rt_data },
> > +     { .compatible =3D "rockchip,rk3399-mali", .data =3D &default_pm_r=
t_data },
>
> You're effectively adding support to a whole new SoC. This made me
> wonder, are we sure suspension resumption not working is only because of
> GPU_PM_RT? Shouldn't we know first about its supplies and power domains,
> and any potential GPU quirks? I think this goes beyond my knowledge, so
> maybe Steven Price can pitch in.

RK3399 is an extremely known SoC. It was the flagship for Panfrost
development for quite a while, has really wide community usage, and
quite a few products shipped on it. I think doing runtime PM on RK3399
should be absolutely fine.

Cheers,
Daniel
