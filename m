Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6883ACA5F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788144215; cv=pass; b=GXK/M9Lb78PNProiX+FYHDRvT2pScCpJ2+/0slmSEXRZoWLf+Xav09NqmnwAdInCvqOg9I6sHd324rN9NkZMARWuMQ2VfBg6LpUt+eRWPErGSb1gGJBFOGKEcPFA1hkXc70e9lYWoRESUFtW7pLblff921nXQHwIlgr6I2ZJfsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788144215; c=relaxed/simple;
	bh=6ahtd83ldSoDYRvF3THgth4QTO0pTAI9WpqI9ilo/OA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLeDk5tGEjugsz6w7HzhbiBUfZ+iP7958enYMDCuZWKzW3P+IfVjdT2N2CwVQk2MhfpcZEThj3+2/XbAIGgnxYSqc+zyNCmbWi8xzS1P1rEVX5K3MAtuiieyGI2Rv1GkiLKSiPdcZtjGA9WglI1D6/9TcO2mccfhxHXriunnnrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJfVLkwH; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJfVLkwH"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-836ce6cbe1eso28959077b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788144210; cv=none;
        d=google.com; s=arc-20260327;
        b=XDTMrdJPTOYBwtZowk2bwE5I+RsSqOTAu6HuA5Cgq1qh1C2f67XF1Z+dH8Vs1ihstE
         y7UdCWLuEtsfTmzSuCJkBjZ/Sk3sdg3ptcIoIes66fA7qYxD13xxCroZK91HrY+glW+E
         cU0G6aD0tznHDD5Rf6/YbosXL+q242Y1xXDNzfV5YVDx+8oqIRjKmEl7MAzNlFF3iy8i
         AMP3etYS4CpaJT6lEIFxi3+aYUDpnIchOAsZ0f1bi9+1OBerol/xa/2Ps491FBuk4yKG
         +2bfAYtkgJUXq2U98/rMH5f4MP3NnfNE7Oto7pD7ew8Rvl5QpdnLDNDKVh0d7pjNs3RF
         cfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NbE6ygLElQTTYS/K7ZqBXF2buqZVjb40e1vBsSRV3Do=;
        fh=7eAu/t5w03twmu0ElpfM8KBS6Tjv/3Z3MfH2QSU3qg4=;
        b=PcNelKZHV7p1d9bQ3P9u69iDEvDi4jx9cO8/gkR1LPzhr6OQEtrEur4aObZUtrNjs0
         aEkFlMQ/i77Z8sw/nnprBTwrqoEjAcFWMaJ5+A9pCJLBhE5EatFb6zqwrtt713+P+A6A
         zuveKD4tPu/MvsuXi3Rbbs1+UOa5vewERkGGjxqmOCfGFxKa7P9rDFZAOJj9kHfOZ/VY
         VA9pCiiArs23zReImeevSY0ZaoJbjR9PtIp9g0miopDGWPZ8DpV8RMUxjDHpVl5W1Rv5
         a2rf2IhUqzR35vklFMcNruSpC/UHMv8Hf1erpOHgsqQXx3PBlarGFWynP4BkRTar8HA7
         wpVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788144210; x=1788749010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NbE6ygLElQTTYS/K7ZqBXF2buqZVjb40e1vBsSRV3Do=;
        b=fJfVLkwHSc+g8tOzDdqFC1nxH+LO9L1/sLCjt6DAcUocboQwftZwvaXi3rugKyAaTp
         UZcGouo1FdCpP0fF3zjNy3MgbWg1TEF419d6AYlrTUcucNmoDlR0xNmKwKrr1ScO0nSD
         KoTE3voeQfmP3cRWA8AtUA0O4XRAFDmNojEAi/lf+QBb7bGOGPKW43BV4l8L6jdig/MA
         foTGhboc5DNwP4w9me5YbPWZXo7+6COUAudupKUxHlsKRtb3apZKEWffybLueZcM3pAh
         LsT3czJb0cqCRVCRn+WYmAwLnle96QOX2PDeueuh2ugEOrK+E6jH1jbnFSGJFUQ2G1Za
         Nr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788144210; x=1788749010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbE6ygLElQTTYS/K7ZqBXF2buqZVjb40e1vBsSRV3Do=;
        b=fUSSVEuM4jzrakYtELgFgz1cNtmgHDB8jfj4VdcqknP8sGkooWOITap/T/V74Ek/qD
         2HPFqie70VZv5Ak2j0IcjS86+cYMsMCmL8Oo9dAJYOTHhtR5NEfx7r59pI1RhmCiKal3
         ICQBNN74wMjtegEuKey1zbzFNh7H/R47fGXm73btjOoKM2DgzQWR6AFhsh0oTBI0oIPh
         gu5epHXdgXptBAUK/3t5xr//hXbn4FojiWcM2DYnAV9s6S5vUszNim/+k2fGDHqgy1cL
         oz2Wv36i7PeuqDW/BK3slYKZzpgUbJgcZRVTl24eGNJvcxeApYgvBUDXUWIYDavek5aH
         Fk4A==
X-Forwarded-Encrypted: i=1; AKwUvBweV/HLvODEkCpNYprDS1aeTi/7a3x7H+A/XEJbx6XZayYT0do5XkFoTraipAkma6hh3wzUtrQ0p43Futk=@vger.kernel.org
X-Gm-Message-State: AFuF++nkx1CiYvdVndYwOupHLaUKK3GT1z+fMBBkkkceECcABytHqsG3
	A0FmZx2eCv7n5M7SymgJTrStlAEJRwxqKlVpXT7thVtQSFImJAffwi0XKk62iXqXMlx/UjmjaIi
	g6lsMA4Aj8+5LhP+bfbNEE0MVLLvmSNE=
X-Gm-Gg: AYBFou01soGLeJ745iRV3VxrL9l0QsEdv+R80KnD0XtkzCQQPb6VxlSTKZFNf38NcDD
	TRpUi09J/02LOtZ/mm33u8bcbnpVjVbfpy3QvMkMFDkZpcfSfm/nXdocI8/RHNEoWV6LR1xrnrB
	48vKm4NQ5aLg8Gl82X3sJ3IShzRif6ZK6UkLQ1cdSoXuTTFuohzyRnDRhlreNjErClGZ/p7OcIc
	+NVLKdK7OLoB4bk9Gz9LpidbrlZGpDJmvLUI3K7lnQol+luFk0H1nOr6OEDJMUqntlx1ksPs6H1
	O8ClOnfx0f2UgPRwyE/De7VoSPUXqI7aX9pURJgGcnFqaw==
X-Received: by 2002:a05:690c:38a:b0:81e:695b:585c with SMTP id
 00721157ae682-8678f0c3792mr241247b3.4.1788144210009; Sun, 30 Aug 2026
 19:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com> <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch>
In-Reply-To: <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 08:13:19 +0530
X-Gm-Features: AcwNN1XmXTP91gt09bDas9PoVw9lX5EEpGOPuilZRVTJETaIpy2y2cTeB3EQiZQ
Message-ID: <CAMFFDGi161c0a8CX4DAaRzc66xTG2oRZ7DOgsG7pNRo-YP9-cw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

I do not currently have the PCB layout or RGMII trace-length information,
so I cannot confirm that the PCB provides approximately 2 ns of TX delay
but no RX delay.

My hardware results are:

rgmii negotiates 1000baseT/Full, but RX traffic fails with CRC errors.
rgmii-rxid passes a 5000-packet test with no loss or RX CRC errors.
rgmii-id also passes the same test.

These results indicate that an RX delay is required, but they do not
establish whether the TX delay is provided by the PCB, MAC, or PHY. I
therefore agree that the traffic test alone is insufficient to justify
rgmii-rxid.

I have contacted ASRock Rack requesting confirmation of the RGMII timing
and PCB trace-delay configuration. I will wait for that information
before selecting the phy-mode for the next revision or making a claim
about where the TX delay is implemented.

Thanks,
Prasanth

On Mon, Aug 31, 2026 at 1:53=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Aug 30, 2026 at 11:50:34PM +0530, Prasanth Kumar Padarthi wrote:
> > Add device tree support for the ASRock Rack B650D4U BMC, which is
> > based on the ASPEED AST2600 SoC.
> >
> > The series adds the board compatible and describes the BMC memory,
> > SPI NOR flash layout, UART console, and MAC0 connected to an
> > RTL8211F Ethernet PHY.
> >
> > The MAC0 RGMII timing configuration was validated on B650D4U
> > hardware. With plain "rgmii", the PHY negotiated 1000baseT/Full but
> > received no valid packets and accumulated RX CRC errors. With
> > "rgmii-rxid", a 5000-packet test completed with 0% packet loss and
> > no RX CRC errors. "rgmii-id" was also tested successfully, but the
> > additional TX delay is not required, so "rgmii-rxid" is retained.
>
> Please take a read of:
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>
> Does the PCB have 2ns of delay for TX, but notR RX?
>
>      Andrew
