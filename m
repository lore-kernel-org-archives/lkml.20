Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869831;
	b=v8G9wH6OiGYVyceaOIhTqs9mJzBnXTupzRxZNrGu+NsygyTVKvPmiQ/+9fMIxjoahhPK
	 mnmHl6zrEQNZnuc1Id6epBIY3JlOUsbcaeh1fyk+rrdM2HcVsneqKPb5tJCFsSmbkRvuY
	 +OkSuzSmEN/GbeffG52kIAq85nmtw8h92D6wjcTo1PBfsompu/GsQU6XjZ0/a/a3OACdC
	 VCt7jq2zkFDL5faG98HT45ltIktCaJya5CnYo6QSE/VKe8Y9CtZx/CrI2cfdi/6qsNg63
	 Y8YzWAPzE81rR7t43ZR2bfMbB478PlYEDXaAlj0tjkT/E5Z92GtqUtwnDmS6Sdgkj+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869831;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l8FVoARO3j3t6Swl/r4USV4n/IIP1DJGnmzvtDWkxwE=;
	b=PO95Y4a4FZDior9e0RK/AbsnmcK2YLNNorMkpsOgmtooT8TkgS/BGn6B4L6BveKuwXli
	 7uigtiS77SbPssiSkd8iOyKy3dr0tz2T6KZxJrGoKIp8Stq8ICY+QAWF3AX/pk6hdPZ40
	 wdn8uW2gArYB+709j8hoUS/4Uu2m/sN4ZtzFRT+J7TywTSKDcDSeoiAQWVXyjOLBTJxmg
	 OLDvKkddQvZtERlVOnOEwjJno3BvlzXYOldkvNmTUANP/P7Kd+3ECXgnVO4sqfP7ADkfi
	 UoVT8WQlUmJ2sALpHc9Z7Nu1caa/7n3wOHKhQ6VBKFCDXeyRTeXAZq5CVcKpBWlqAPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAR24fhg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F3606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAR24fhg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C811F00A16
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793869830;
	bh=l8FVoARO3j3t6Swl/r4USV4n/IIP1DJGnmzvtDWkxwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DAR24fhg1o12QPYF8w+7b8HIwsxRutsHpEf4cTFEyfIe1ri9nazYsDIocFwx5ISJP
	 /3zIPoK5gQ2uI+H1WEkOK0X8GhFfj+9hv4l19yz1q/DPecQzQz2d5wbU1n2ejd3hHg
	 /zhtdfWlMuzov1tVk4nMgIA2qtMOnpO+yRJas9gvpgUs9txLGJr7ilihbpns5ihEDF
	 4/2yV2xRNhSNdsLoCt6rVfexZqo5PI+2bh5Zb6srEz7QL1UDMhOmHpUYxCXABSTIqt
	 wtkhqxb8Tr9xqccUmW68LmRoovBaE4sFySPUjEpNYZPRH5NW5iNUtVbG0K+6xqcnIW
	 aiNZNsoA0p13Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be416e603cso1088762e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:10:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwBeqTRBBtBz3emgRAgsxMar6CbMgitqS8JM+CmAJJW9PrRFQeSI6ncvEec0pMl8kmuKHmtDQAvnbfHI38=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tod1HTxc0ySu/XdEe45TfFVTqOUMjXbOEf7v93S2WNIjDFUS8
	Oc/F5XOjJLPiMaOUsJL5XoQTfNieJVGmtzGr2NHv2uJ6XV+pMtNEu6NFQzgloUQww/iWoCldI+6
	2r5mprFtc+kw+ITyOaAtJPS4v969gsDc=
X-Received: by 2002:a05:6512:31ce:b0:5bf:be3c:6599 with SMTP id
 2adb3069b0e04-5bfd957cf17mr5726763e87.67.1793869829164; Thu, 05 Nov 2026
 01:10:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:10:16 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>
X-Gm-Features: AclHuK_7g7nY-8H8wprNfNKV8lgILSoOexV2IGLiXfskv9qSmIolBJEeTn_Fqx4
Message-ID: <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux driver
To: vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:12=E2=80=AFPM Vincent Jardin via B4 Relay
<devnull+vjardin.free.fr@kernel.org> wrote:

> From: Vincent Jardin <vjardin@free.fr>
>
> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW, read-only in RCWSR12..14 of DCFG and changed at
> runtime through the same fields of the override registers in its DCSR
> view, which read 0 until written.
>
> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
> gpio to support bus recovery") Linux drives them with pinctrl-single on
> the override registers, so its first pin state clears every other field
> of the word: a board whose RCW programs a non-zero pad mux loses those
> pads at the first I2C probe.
>
> Add a driver for the pad mux as a child of the DCFG node: the fields
> of RCWSR12..14 and their encoding.
> Then pin states select them with the generic function and groups
> properties, and every change goes through the RCW override
> of fsl-guts, which reads the status register, writes the override and
> waits for the status register to follow.
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Can this be applied separately once reviewed?

Yours,
Linus Walleij
