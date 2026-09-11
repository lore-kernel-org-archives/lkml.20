Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA2C26F2BF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133592; cv=none; b=sYsdGMWilFcJmNsOt7hs4IeIcBTB9BNPM9bGOCR3Bf5WhpHyoyg0stCPWofL5tzL4lyCbpXProBVN0BQFie8g/pxoOTBV5oZunoBLMU1U64h8RNElM/UXy8Af5DEr8MmZ55KvcxkzKBG/0MBKz6n+ik6rAVQ0HWyGBwQbNKiD3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133592; c=relaxed/simple;
	bh=s8OmW6uRah0YzknSW+R3/+6wCJr+/gd8eErz9mCUko4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geUaz7plo3lZ8VyaP46nRE2kEmDd2vp6U567SfVDmCcxonpaHsYjtQqtGt09/lp67+Vaik47PEbFUgFxfX4EzeikNH+axbOOfBOOiAPjKCVPeR7E1rCHA0GYDKX2/CfGfQxmJZ/9DVcxZMC2hnWNIcGuEY5Jonc/CbZhzmJFFfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/EeKsa2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/EeKsa2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A491F000FF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789133590;
	bh=s8OmW6uRah0YzknSW+R3/+6wCJr+/gd8eErz9mCUko4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O/EeKsa283JFW9JxPIzPoZQtq6qVCdLFbqIpOcdPHScVJwwZThA8EyrI8h4rZ5NNo
	 h0yCS3XGaw60+LBlE2Nyv19JbLqel6sLUui5y0Yb0r0pTUHCinHg5J5hdVt8ew4ZLR
	 bW0BVIfWTGZF9QinY80SQ94lj3hdjQ7burIktFJoupN44rwmNZJKPJs/U/r7q30CA8
	 6Utt0zowic+WNqcU0sWKrjjhvTMWaMEsMDzdzUx0iGNvKrYC26QSTNbJRzkgaESK7P
	 QGI2rtm7Z2uiSONJ6LzFYodj796W7dbw7os5ZoUw0E1LUZB98Xn0/OP2jMRggsNM2K
	 l1TAQGDQjFSXA==
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso1551206a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBylTi3caiDo7HiwXXwYStu2Zrx2qK7RbExDDEwZOVeqsmkAcKQ1vvfjOgQkWHD9gXwlTZpeYibWp/m1Ans=@vger.kernel.org
X-Gm-Message-State: AFuF++kLR+pXV+Qtg0HSzuwvSvm2xiqVbUJuDQwFrZIfzmX+KTDBeGhe
	Vcp6L/OcHYjG2FflyGznb0UspTs8f806bFszeo4AsX6skrjB/TTXukQDfZbzKnjB7r1gt17gWwc
	ci0GVRrXvKKt7HMUuZ6Hl06mOOD8fx9E=
X-Received: by 2002:a05:6512:12cd:b0:5b6:183b:d1fc with SMTP id
 2adb3069b0e04-5b8a0316224mr986014e87.35.1789133182772; Fri, 11 Sep 2026
 06:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825105427.686619-1-roshaen09@gmail.com> <d3a928e0-6faa-4cd4-9d2e-cb9be4cf84c0@suse.de>
 <CAD++jLnAoOaRwWpkVX0o1z0wF=Qs9PRTKbq9iq-GWSkJ2kyX8w@mail.gmail.com>
In-Reply-To: <CAD++jLnAoOaRwWpkVX0o1z0wF=Qs9PRTKbq9iq-GWSkJ2kyX8w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 15:26:10 +0200
X-Gmail-Original-Message-ID: <CAD++jLnBPAw9CJ4JtZt46yBd7+UEHYA189Dma3tNfuV=wu1TDw@mail.gmail.com>
X-Gm-Features: AcwNN1XSiMJoAPcTfunp320f7ZpZ-xZnSE6SFGsu7ok8i8KeWHrSdJWL2xS9j-s
Message-ID: <CAD++jLnBPAw9CJ4JtZt46yBd7+UEHYA189Dma3tNfuV=wu1TDw@mail.gmail.com>
Subject: Re: [PATCH] drm/pl111: Advertise no pixel blending
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Roshan Kumar <roshaen09@gmail.com>, dri-devel@lists.freedesktop.org, 
	leandro.ribeiro@collabora.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, pimyn@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 3:24=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
> On Wed, Sep 9, 2026 at 10:16=E2=80=AFAM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
>
> > > The PL110/PL111 controller scans out a single framebuffer and does no=
t
> > > blend its alpha channel with a background. Advertise
> > > DRM_MODE_BLEND_PIXEL_NONE to match the existing hardware behavior.
> >
> > Why does the driver report ARGB formats in the first place. I'm looking
> > at the code at [1] and I don't see any difference to XRGB. Unless I'm
> > missing something, please remove ARGB formats from this driver instead.
> > Drivers should not report formats they don't support.
>
> This should be the TRM for PL111:
> https://support.arm.com/documentation/ddi0293/c/?lang=3Den
>
> I checked it and indeed the ARGB* should be search/replaced with
> XRGB everywhere.
>
> Shall I propose a patch?
>
> I also have the actual hardware so I can test it properly.

Ah I see Roshan has already sent a patch (sorry for the confusion).

I will review/test that patch.

Yours,
Linus Walleij
