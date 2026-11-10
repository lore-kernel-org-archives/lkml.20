Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315522;
	b=ye7IRCGTNvNY65/8huP0DarrAX3g0j+08PQSNymoqe679O5BO66MNRJ2x9UQjuDx7d6t
	 XI5lvX3YBIEyueUgyBzJWnt6fr4/kLhIXBSQbUjENCuRCNGH9Y1Nd4WKSCeBp0zR2rlhy
	 KizEYjnYpHBgOrAnF2NowTsv5z863+McPUYPhf1jtueys3UyXje4cBE/OGpNkdBCSo1on
	 xoBEsIp2r4uu+U485G2Z+AlXN79JGpLiJ7W+7srUv3Egp9Aha7lV48Qa+cxY6TMAVy1UO
	 SFzC12YeUlrpMPWsRfa3k0ISnSPx7kDz8TuPRkelccIj4d9dCiYtBODjNe4ojflairw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315522;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4pmFjEsbdeyTNA61FOh5B6D8bCLWmzzoCQ3gdMGZrYI=;
	b=ReXFExS6sMwWjuHE4/5Qi1vG7woKpBDJ03PAq8v1QZKdFlakXt4qGkD8vbH4ecxlZURE
	 sc+Kir0d9/Fuu/c8B0NTP1aU37Yy9Reh+V6o4MselwgdfZcv7AoUobNW4SSvY8CpFIeBL
	 m9Eju6urZHRMnEyyL4u/mkmvI0FTsEQAtpwBUb9/rBgHdlVSx+U7NF8SKyXtXVVva5mBs
	 yhznF+PYOPkXuPAUDImI/qixKuG2HyWU885UNWGUTgD/9tuBbHfkXWiWFDipP1m76b6vI
	 X9UD7rgiQX1X+Ot8bPmPswLCIaXSPNSDAgP1lydNX8Q+e5d5hbYBjuCoYq0kyVwj6UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfBiL1yV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9FF606A754
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfBiL1yV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5511F008BE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794315522;
	bh=4pmFjEsbdeyTNA61FOh5B6D8bCLWmzzoCQ3gdMGZrYI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XfBiL1yVVMydVhlcM2sFH/6xfcdj5QdY4dzAmed7soVfdGsyWn1uW81wCNwmnUtLA
	 vsUUdBamI1FpiaVRcayYGj+x4BvMLb+ukZ/PLAYVabaHx/uiY0/f6sy54W+QG7EOTl
	 Ixe+Rr0+bR33rTEIA5g1c0j4kNEMqr1oYn2tt9jNELLb/f6rDq2FZha+kqGrtkMN37
	 mUJ3nzJ/op7XbZEGcsmHbb0yOPvCQ1cHdLwqUwrRYje/WdPhSY1oEZcKfub3IO2F4J
	 TRbRRZp6Y5yWhZ6koBTmjnPpzzu7Qr8U9Jd6b6ydiDefoNWnBO3iiXohe7eBnlK+T8
	 qqfpfKjMQxAnQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1698300e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:58:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHjBJ5Hy4p/4di8nUaH/OH7x2CUKzeJ1faXhl90yWiiiFT94YJQWuWIYr3bHGLRP3FEflzdYVLPu1zuryo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e3XcustvYBIr4HfCtNP6XJd4fqa2cawkvzbSAq22nxBAHL1Cn
	J+Kh+aFGApqtwsbgCwQfW1ecCKaG7greKZsEp5NCr5vy+3wFBE1PfK/ubZ1mwvFIjREgcj2DNCP
	oRznWRFfI/ml6Ab35K3kWKjcBhJXOBfM=
X-Received: by 2002:a05:6512:1113:b0:5c1:5a36:b041 with SMTP id
 2adb3069b0e04-5c15a36b1a8mr418657e87.52.1794315520002; Tue, 10 Nov 2026
 04:58:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930222650.1883805-1-jordan@brough.org> <20260930222650.1883805-2-jordan@brough.org>
 <3cd06bed-83bd-425a-387b-f1d3b073cb47@linux.intel.com> <CAJZ5v0hxx-jZxgD+2aJXy2Y_LLz0_aeU4wgpx6+Bkq-YqvHmkw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hxx-jZxgD+2aJXy2Y_LLz0_aeU4wgpx6+Bkq-YqvHmkw@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 13:58:27 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hzZV+ys7WgAqaCkF4mP_BAuhRm_v6zX4_=0207W4UA-Q@mail.gmail.com>
X-Gm-Features: AclHuK_2ewbjDRrI7vEm7qW4Gexy4KQhsFqwIuWKeOk5jHlI8WSPgXqyHRQNZ1A
Message-ID: <CAJZ5v0hzZV+ys7WgAqaCkF4mP_BAuhRm_v6zX4_=0207W4UA-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ACPI: battery: add acpi_ prefix to the battery
 hook API
To: Jordan Brough <jordan@brough.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	Antheas Kapenekakis <lkml@antheas.dev>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Armin Wolf <W_Armin@gmx.de>, Jonathan Woithe <jwoithe@just42.net>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Matan Ziv-Av <matan@svgalib.org>, 
	Nikita Kravets <teackot@gmail.com>, =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, Jeremy Soller <jeremy@system76.com>, 
	System76 Product Development <productdev@system76.com>, Azael Avalos <coproscefalo@gmail.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-acpi@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, chrome-platform@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 7:29=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Wed, Oct 14, 2026 at 11:18=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Wed, 30 Sep 2026, Jordan Brough wrote:
> >
> > > Rename battery_hook_register(), battery_hook_unregister() and
> > > devm_battery_hook_register() to acpi_battery_hook_register(),
> > > acpi_battery_hook_unregister() and devm_acpi_battery_hook_register(),=
 so
> > > that the exported ACPI battery hook API has a consistent namespace, a=
nd
> > > update all in-tree callers.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Jordan Brough <jordan@brough.org>
> >
> > Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> >
> > With one known caveat! There's c72dd9994952 ("platform/x86: add Acer
> > battery control driver") in the pdx86 tree so if Rafael takes this like=
 he
> > proposed in his reply to patch 2, that needs to be handled during merge=
.
>
> Well, I haven't applied it yet, so no worries.
>
> It's in my 7.5 queue ATM.

Patches [1-2/3] from the series applied as 7.5 material, thanks!
