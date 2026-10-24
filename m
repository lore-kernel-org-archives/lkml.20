Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792849331;
	b=LDW3sm6Vca9b/5p/jfbmwamfL0aRCrbIlG4i+u2uclKaX4UAxr12Iw5o2BwU+MlBFeVn
	 coebWeHED6fPkO0ZdPVq8PGd2X0+dYLaJihYipgEMjmSW9iSRkMDai55JtpTNnSBiZFcP
	 StDyPzLWG1WC20kaNEDzqWBvk6gD03AQs5piWBogjl/DJByPLW14Go2KCfTTca0KVtsnW
	 r1YXScpAacTlShXDhRHQgCVoi4anrhnKh7j4l/yNkNOtyVpMHtcC2IOiwnnwxdmD3903x
	 0Zcor+wabvhdgoWIKQL/5qUYpJlasBTy7bRveBR4TFtilWdey1o7wA9EGUuD0STfisg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792849331;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VR4wE0obqEETTnkvc1cZD7oRkkv5XdPKp0vhsRHmEPU=;
	b=LdzIHToyrooGZfULHPTGNmonNdca87MZ50WS0Ht1xW9pKstm0sU55/VhDhtPah9gCz1S
	 mdq5vyjp4rFM3GRMA+BOhpNoCdVQAg5DRc/F+AlazGWLRfy3b4lbyAiEv2AjWo4Ogh7U9
	 fij0ounaAG+3IENuMRi1KFlRRfKmCGX7oir7ppOMmb0H8a8AxxI6FxcH8R8zTEU1KsOeE
	 WUSQE5iCAAFS8yD+TFQOwovtwSrk8n1SwQQ++zGIRDO62L90fUFxh9tQmfGqeOXMKs6n4
	 gsdM0CVtO7lsPNBri1uqyg+O3HpqSlmhX5KTSe5RmlKmnu8+gRDXKrkOF0P2De+MCvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbwoWAdP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4355A606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbwoWAdP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A371F031E7
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792849330;
	bh=VR4wE0obqEETTnkvc1cZD7oRkkv5XdPKp0vhsRHmEPU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=VbwoWAdP1jav4AQginmjgRlN4qTSlFXGRM6SdLPbsAU1bILpiEGmgDAA9EGFrwGnL
	 TPXJUwpgI0xCf+xr7Qp7+F+xNrj5UyUDYwwSAbBvEoAHVpMbIYqZUGFz+W2ODLq4+Y
	 ocwGO0vgNkShOXPj/9k1UXzs/3GiW0zfZ2YqCZh1Iip2tbSiUfM1JzQu+Dl0jQllhs
	 ZufPdxQ9bFabAx9x7kOmGrCNcEE5X0F1DnBUR7Lhoq85/KhJ4rW0yvQXpuAbIOiKd4
	 g/lbt8NGys8TUM5zh3e1Dy6ChPxghStytGUPhrvoJIr0HpeHm7nRvf1QhvDICvH5WC
	 orDsUHTArXnsw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso11365661fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:42:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzmhVx5swBJNGG97fzy/J1QU4euO0YyAbxsoW9In33+GfQ/CtvNL7ChJVwMpPz/YlbXwxLjA6+aJAcXZUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI47bOsLbIWxQqdBL+uS6Yv2cT9dS67kigwICFL3Lo2tCS7UnOK
	QE+sKZdNoU2mRIX4M2KAtwazBznhL/JhdBhepdKb55TgqK090rEsaMit8KpmOSVlZEthfN+1Qje
	TqX8leZkaKxZXW2PqCtfEEB0HY2wegUo=
X-Received: by 2002:a05:651c:a11c:10b0:3aa:f94b:842e with SMTP id
 38308e7fff4ca-3ac758f2ab8mr1313291fa.23.1792849329124; Sat, 24 Oct 2026
 06:42:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local> <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com> <atywVnHU5NsP_gOP@ashevche-desk.local>
In-Reply-To: <atywVnHU5NsP_gOP@ashevche-desk.local>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 24 Oct 2026 22:41:55 +0900
X-Gmail-Original-Message-ID: <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
X-Gm-Features: AclHuK9FDF2lgZeM1hRUmkk4PVa4hWifzNBxVn4_Mwsx2Yyiyx2HnawGxsTc9R8
Message-ID: <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 10:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> > On Sat, Oct 24, 2026 at 12:12=E2=80=AFAM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> > > On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
>
> ...
>
> > > > >       /* Internal 8250 only */
> > > > >       UART_PORT_AIROHA                =3D 124,
> > > > >       UART_PORT_AIROHA_HS             =3D 125,
> > > > > +     UART_PORT_DW_APB_256    =3D 126,
> > > >
> > > > Why? Besides the poorly chosen name, what prevents us from modifyin=
g the
> > > > corresponding parameters at probe time by leaving the one of the ex=
isting
> > > > types?
> > >
> > > The new type was primarily a way to reuse the core's FIFO configurati=
on
> > > table, including the RX trigger mapping. H616 uses thresholds of 1, 6=
4,
> > > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to 1, 4=
, 8
> > > and 14 bytes. Overriding only fifosize and tx_loadsz would leave
> > > rx_trig_bytes reporting and selecting the wrong thresholds.
> > >
> > > The core already has get_rxtrig/set_rxtrig callbacks, though. I'll re=
work
> > > this to retain PORT_16550A, supply the H616 FIFO parameters during se=
tup,
> > > and use those callbacks for the correct trigger mapping.
> >
> > Please consider just taking the FIFO size from the DT. On some chips
> > not every UART has the same size FIFO, so we already need to deal with
> > it.
> >
> > Also, FIFO size is a standard UART DT property, though somehow not incl=
uded
> > for dw-uart.
>
> FWIW, it supports all standard properties for UART.
> Check what uart_read_port_properties() does.

Ah, that's nice. I hacked up something [1] in the past to get it to
work, but that was probably before you added the helper. I never got
around to splitting up the commits and sending it out.


ChenYu

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?=
id=3De7e0741fa04f349ad9f94a4059e32467a30ef5d9
