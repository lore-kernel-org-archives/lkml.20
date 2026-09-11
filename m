Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083C23BD1D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133074; cv=none; b=ESlc9/95RwBhVeUQRuiG7gjZI5BDNlrEq2Ios8yZD9+iDrQSjVooAy9WjtSZOt2RYG5R57Za68x3jFevviQDL80LcJ7j/eCClL1f5/TeRnyGkiaLwbKS1FmjP0v+untdU8W07z+7WPvj+FFBtRtFppRmnj3q/g58DeFyzh+qAso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133074; c=relaxed/simple;
	bh=0j2qBcmWOc1p37RvohbHXc08nW5Fm0zVkkY1ZycDOx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPqKmcr+Exs5mPErSd6qyqaIZq3pMI1pYjaR1OTyGU5PNaJDOBBqG5r0tndLNaZvIHODb+eljNZ/0koEhfQlLKNMim4MSxaXqxm7bsFejjXZVewU/cR4RoEejuOyr+3N+OuDt8jl0wmKIrnMjqd4wJIvZMgT6qHCVPlStW10ySY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZ0ZNrSf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZ0ZNrSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8EF1F0089A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789133072;
	bh=0j2qBcmWOc1p37RvohbHXc08nW5Fm0zVkkY1ZycDOx4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PZ0ZNrSfVha0HM4y326o0bJ2eyrzMlMjCB1ztc5BjLmSe815W3rmTnwyLDT3AEkuP
	 bxZ2TOrL9Odvf4zTpdcFoaKS/15xgpFyZct59mVSsibc0Oajjx7XCYOggFH/Z4+Sao
	 z7hBR36xgJa+V3SDuiSWREfvzNnWmQtog/YdQywwQ8m0u7fqOUn2J8L9JmW5EiglY/
	 0ZG7e76HIOnW8VcyXZLhsPBwcWYGMU32bcN1wcrJU8PiJ1AAHdYD22OTNRyrssCxjr
	 M34RZIaj3r0nCsO1BHwRbbYLxLhyUlZMDC+ekRfrNvjgTz4i7xFKCXp7e8Jsydbvug
	 ueAb50Wp5VDpQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso1117180e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:24:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwSJ4ngkTXQ0uIwT1IQTkX3OrnGMGBm2fbja3aH0pR6NMnU/Q0WPSnG3Okg7Og/D+Qh2jV7Z9uZoVp5YHs=@vger.kernel.org
X-Gm-Message-State: AFuF++koNWNF3sac9WRRhBoGch3j4Bk24xb8tUBr/znhz3XWjQJ6i6AJ
	OWo82mofEveer6qce0X2d6n1FexN32j/as3f5BHLQ7D8hX2Yn0bIicrPQykrEPVVjguaM5Q5566
	xOHxIoRAoZABvreX3EqnKyIKcdzvvr7M=
X-Received: by 2002:a05:6512:2204:b0:5b4:7d9d:16d7 with SMTP id
 2adb3069b0e04-5b8a02df777mr1760118e87.11.1789133071406; Fri, 11 Sep 2026
 06:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825105427.686619-1-roshaen09@gmail.com> <d3a928e0-6faa-4cd4-9d2e-cb9be4cf84c0@suse.de>
In-Reply-To: <d3a928e0-6faa-4cd4-9d2e-cb9be4cf84c0@suse.de>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 15:24:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLnAoOaRwWpkVX0o1z0wF=Qs9PRTKbq9iq-GWSkJ2kyX8w@mail.gmail.com>
X-Gm-Features: AcwNN1XhqjMUxLBJRz2ogLHBz48a4ffLu-JtjNS9gwh4pdm6GiYqoN9oXiWuqlk
Message-ID: <CAD++jLnAoOaRwWpkVX0o1z0wF=Qs9PRTKbq9iq-GWSkJ2kyX8w@mail.gmail.com>
Subject: Re: [PATCH] drm/pl111: Advertise no pixel blending
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Roshan Kumar <roshaen09@gmail.com>, dri-devel@lists.freedesktop.org, 
	leandro.ribeiro@collabora.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, pimyn@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:16=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> > The PL110/PL111 controller scans out a single framebuffer and does not
> > blend its alpha channel with a background. Advertise
> > DRM_MODE_BLEND_PIXEL_NONE to match the existing hardware behavior.
>
> Why does the driver report ARGB formats in the first place. I'm looking
> at the code at [1] and I don't see any difference to XRGB. Unless I'm
> missing something, please remove ARGB formats from this driver instead.
> Drivers should not report formats they don't support.

This should be the TRM for PL111:
https://support.arm.com/documentation/ddi0293/c/?lang=3Den

I checked it and indeed the ARGB* should be search/replaced with
XRGB everywhere.

Shall I propose a patch?

I also have the actual hardware so I can test it properly.

Yours,
Linus Walleij
