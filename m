Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792847448;
	b=ce+/BZysTD4OvEDU0l55t9umYYUoaDe9abiyOcut5vPz+e5zAjfXYOiB+VWppPmLTD9a
	 fbq0sG7oy5Omo2xHM+pLFdI87Mii1JCO6XWEwNhdP0Oa7ldMOZiaaZQV41eLL8C3UE48e
	 DUWd4Q4mOlpLczckIVd724OZHGkqmyaLt/lm0nZsIYxhFdxLDzONtPHkzgKysQIhfjqEf
	 CDwFP/26UBRNe6Sp5c68QQ2wt/NgJ7MygX2zcB5skt387T+2J5EwUtaHcZ/062/XZpjPF
	 AkhW4qe2+wS9Y0qEx70jM2oj99bfuMn3VEzurLdUC5zxB86lXQhFR6ogCSdvpqX2ROQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792847448;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/o2PIVRg25wdrYsWjdmENqYtru3DXq4FjhnXnBlYgJI=;
	b=gu6rlwfAIKSPtODeyKgPXfvO2MpxRgFyG4ZWwIKrtVlpSN0MJ44qr/Chi+7Ypn43flLh
	 3kqY46sL8kweKzK29Dw9576DgF4tZiGQNFqd9LSlCQgJ3ezK0OTt3f97pAm/JaoFOjDPR
	 dmMj8A/eOI3lC0o/CnIIPGr8MSfH62WxUP8ZPGdIV7qP6Zs5HapeDNVzsum4T7Sfn4PwC
	 U71X9l0+iPlkAJ4uHAP7lj9n+JbTlV3jAwb+JUtbpCYW+Fwv7ieTswtJ7UDwSkZmm6Tfh
	 AquQXg5xccqpTbbmJjJefrdKN8p2FiHfVbfl68e17AKoSzVQQTQDQWz8JPtlAI8d/1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AUvMJ6Qv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9BE606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AUvMJ6Qv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7849A1F031EB
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792847447;
	bh=/o2PIVRg25wdrYsWjdmENqYtru3DXq4FjhnXnBlYgJI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=AUvMJ6Qvkgucz6gji/qdag1s9OT/Zldxjk8LwoKm+CATVQFe+q0mKfF9VdO20hSUl
	 xkpjUYv4x3z/b7ab7wZ3xVYbLSom1Se/TRULcxiuKeCW2E8s564+JRbaZ1sAh4XGVw
	 HRQpONqf/R7iDd4KzxA3TCuaNAAnI9kA+pIiy7PCiZ7OdtaTG9zbTnohM/IInRnJLp
	 gfJtJlY64AcTU+mteV+iDYNuJThwRnqzaKFH+UpoHl/UhRiYUHMUQR7ipN8hEmq6F7
	 803RkaCvN2aZr3YJkl0YaLSmZ30GtZBl/od9magtj0HVFJdSoONnLoA57ZMsVrYqU0
	 XsdYz7bQHHNtQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso13959161fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:10:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwXnRqWrZSzQ/EZq8rkDbA0/0kvzI8X+uopgUAhGRDQjYyd5zoDC3E7F+s+gnjy/ZQhDSWr5dc1j61ewH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4XMtLL3/Qfnr2jH+K510VhRx3aimQgbGD/rT4R+hPZfDfaSll
	FzldF9GQY+JbnO4OdDTY9NRRHZbdWmVOXULSjQcB7yiP+aXyLWaBJDoiRFl4T5gM0VMk1tf1Zcf
	+E1mjUxbVYBUFwe6JwQW6vK0ona92N2o=
X-Received: by 2002:a05:651c:b08:b0:3ab:522c:dacc with SMTP id
 38308e7fff4ca-3ac6fd3b96emr4386811fa.18.1792847445659; Sat, 24 Oct 2026
 06:10:45 -0700 (PDT)
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
In-Reply-To: <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 24 Oct 2026 22:10:33 +0900
X-Gmail-Original-Message-ID: <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
X-Gm-Features: AclHuK9wKet6Jt3sV0zB4WjiNOHkgfPFEYhV8e4eMS7tcxLyr3V3Z_SWiMMvN94
Message-ID: <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 12:12=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
> > > H616 has 256-byte transmit and receive FIFOs, but its optional Design=
Ware
> > > component parameter register reads as zero. Generic 16550 probing lea=
ves
> > > the port using the 16-byte FIFO configuration and its trigger-level t=
able.
> > > DMA attachment also depends on a FIFO size being available during pro=
be,
> > > so these ports do not reach the existing 8250 DMA path.
> > >
> > > Use a fixed port configuration for the H616 compatible, with a 256-by=
te
> > > transmit load and the documented receive thresholds of 1, 64, 128 and=
 254
> > > bytes. Select the quarter-full receive trigger by default.
> > >
> > > Skip optional-register probing for this fixed configuration. H616 has
> > > debug-divisor and RS485 control registers at the offsets used to dete=
ct
> > > DesignWare hardware RS485 and fractional-divisor support. Probing the=
se
> > > offsets writes unrelated registers and can select incompatible callba=
cks.
> > > Keep the BUSY-safe integer divisor hook and software RS485 handling.
> > >
> > > Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled d=
uring
> > > termios changes. Its clock is a gate on the shared APB2 source, rathe=
r than
> > > an independent baud-rate generator.
> > >
> > > Attach DMA from the fixed configuration before registering the port. =
The
> > > 8250 core installs its FIFO defaults during registration, after the p=
robe's
> > > FIFO-size test. Configure single-byte RX and TX bursts because the
> > > peripheral request can correspond to just one character. The existing
> > > startup path requests the firmware-described channels and falls back =
to
> > > PIO when they are unavailable or the port is a kernel console.
> >
> > ...
> >
> > >       /* Internal 8250 only */
> > >       UART_PORT_AIROHA                =3D 124,
> > >       UART_PORT_AIROHA_HS             =3D 125,
> > > +     UART_PORT_DW_APB_256    =3D 126,
> >
> > Why? Besides the poorly chosen name, what prevents us from modifying th=
e
> > corresponding parameters at probe time by leaving the one of the existi=
ng
> > types?
>
> The new type was primarily a way to reuse the core's FIFO configuration
> table, including the RX trigger mapping. H616 uses thresholds of 1, 64,
> 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to 1, 4, 8
> and 14 bytes. Overriding only fifosize and tx_loadsz would leave
> rx_trig_bytes reporting and selecting the wrong thresholds.
>
> The core already has get_rxtrig/set_rxtrig callbacks, though. I'll rework
> this to retain PORT_16550A, supply the H616 FIFO parameters during setup,
> and use those callbacks for the correct trigger mapping.

Please consider just taking the FIFO size from the DT. On some chips
not every UART has the same size FIFO, so we already need to deal with
it.

Also, FIFO size is a standard UART DT property, though somehow not included
for dw-uart.


ChenYu

> >
> > ...
> >
> > >  struct dw8250_platform_data {
> > >       u8 usr_reg;
> > >       u32 cpr_value;
> > > +     /* Use a fixed configuration instead of probing optional regist=
ers. */
> > > +     unsigned int type;
> > > +     unsigned int dma_maxburst;
> >
> > This sounds like a hack.  Why do we need type here? The address of plat=
form
> > data is enough, no?
>
> The type member selected the new table entry and also identified the
> fixed-configuration path. The matched platform-data pointer can select
> the H616 setup directly, including bypassing the incompatible optional
> register probes. I'll remove the type member and use that instead.
>
> >
> > >       unsigned int quirks;
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
>
