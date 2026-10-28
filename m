Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178311;
	b=oc9HyotQReXigX0YHJH24QsdD6znLtOoB4vljhmijUe3XXno3Mdy/Gzx/OV4dnmlhxKD
	 LzUDYtOPpg6lJFpxFacmdLGJOUk++vAk9nGwjtRinirWk4hW6NLGJEcd5U++/vbX7ZhEq
	 /lCLOGwQf2cOuBEjAq1mH30g8bM76NxMP3w9QdmzOwyzy6XiyTobrG4eqckFPjpjSPJGP
	 8yttKn9k9M3ucCy1Ua4o7zFdcqfy3aBXtBET2aRFvO+YsoCq3T4w9vHYFpgruvlrgxgHY
	 YoudkxSRr3stw1ZCPsvgF1GjW+yVVCVoMGIQqHGpilP+MbNjqeuSzlcbcbGxsK0Eljg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178311;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MOEsOf2p6LR2nFykkNW/dnLN5llbjLNzghL1+OY+PII=;
	b=YdWXYl+PAJzkP/naQ+bQlCVZO7KtSN9/6TNxhNiDGf04gjh0A61O09FCJp0+sDpc+Kn/
	 l9w/BBWkK6sjMhENPuE7G9vwdMw3N1s6ujrelkAQvksW5GjvGyZ9w5oy6iVP/46xbwwMx
	 EtlACUk4Xu8C9PcM4o+AnEwCxRENb0vi536oAe6gsADTJf9v0pJEEgSGBXdiXOJH17ebX
	 mwahOjveiR+nrLBj6i2/b70Zp0tyBMLBTXlpZfgkGiYvswIqpDjgjs2gu09TZK+26drRn
	 35gXConEny8PnZtQYZqThTKxAxwqbV4sGgF6EdoR3L6gmbPMgHgjyJAlznbgFvlzPlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+lQYAJf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485B9606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+lQYAJf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62E11F031ED
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793178309;
	bh=MOEsOf2p6LR2nFykkNW/dnLN5llbjLNzghL1+OY+PII=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=k+lQYAJf1Qg4tKaonG4UfWENXxXXIZ2kL+2wz3fpX2MIY09vU/KYaOEDXvxWiFqDv
	 Jms6MNwha+9eRRSRLKWVcmJ8u0UBJH13lzPDRWIerbkoBnSws05tInCMdpsIWxgCMN
	 +YkkVXOWiUuOXQlP+NGWDxnliw5IUopbmxeeCScbh/2EpWt3vQLDyOXki9hSBlQx7n
	 0P22zC2CAlp63Hx5wM2QxAwnH5aZ7Dve2b1ku55FBRYAGkplPq6EO4s6ESjC4aEKG9
	 E73odE3Pqev97SKBVHKQdqh5oCAfGEt/PsCvGGCxfFvCXr7byiuxSgL1562AEL4e7P
	 sgoO7B44k6L1A==
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4f48d91ba7dso438293b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:05:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByHDiYi5LCV/PcKVwu8VkhLu+V+kqznVJrkeXJECRVrDfnmfoEuKhR7DmITMyunhjPfQLaycG/5K+q3aw4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNnrk5XHEJ1dnVuuuBLpSrDz561s3wa1mhw+ErxVJaGzpEM6h7
	bFcicOu7KfPuN+vJQ5noxNXO8Dl718rwJGvleFz8f3bAHZKEs6bsNDGtDJ/ZSp699odqh14FJNW
	YWS3MF581VkvSCz5j6uM08WfGHFHWhis=
X-Received: by 2002:a05:6808:2390:b0:4e9:a959:7a4c with SMTP id
 5614622812f47-5638338a185mr1142374b6e.24.1793178308774; Wed, 28 Oct 2026
 02:05:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com> <10f350ff-8f82-4a3c-beea-4a02d0d179f9@arm.com>
In-Reply-To: <10f350ff-8f82-4a3c-beea-4a02d0d179f9@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 28 Oct 2026 17:04:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v67MRKm0D58K2eqW9_UhUTPjDxLgi=G9t4ZOzUDtc7Go=A@mail.gmail.com>
X-Gm-Features: AclHuK9Y_PMME9iLYw0A4PafbTKmym5jHGhgwh9-hPi_6sdvWuMlMccImK6vpm8
Message-ID: <CAGb2v67MRKm0D58K2eqW9_UhUTPjDxLgi=G9t4ZOzUDtc7Go=A@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] serial: 8250_dw: describe the Allwinner H616 UART configuration
To: Andre Przywara <andre.przywara@arm.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:57=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> On 10/28/26 00:05, James Hilliard wrote:
> > H616 has 256-byte UART FIFOs, but lacks the DesignWare component parame=
ter
> > register used to discover their capacity. Its debug-divisor and RS485
> > registers also overlap offsets used to probe optional DesignWare featur=
es.
>
> that affects almost all Allwinner SoCs, not just the H616, so should be
> solved universally, not just for one SoC.
>
> IIUC Chen-Yu has a patch to attribute the right FIFO size, in each
> .dtsi, which I consider the best solution to this problem.

It only covers the recent ones, and Krzysztof didn't seem to like adding
the fifo-size property when it could be inferred from the compatible
string.

Otherwise, it is probably time to go through all the main SoCs we support
and check the differences :/

ChenYu

> I'd say we wait for -rc1 and then work on top of his patch.
>
> Cheers,
> Andre
>
> >
> > Add an H616 compatible for the integration-specific setup. Keep the
> > existing 16550A port type and describe its fixed FIFO depth in platform
> > data. Use common Allwinner helpers to configure the transmit load and
> > receive thresholds from that depth. Configure automatic flow control,
> > preserve the BUSY-safe integer divisor path and keep the UART gate enab=
led
> > during termios changes. The H616 configuration uses PIO.
> >
> > The series first introduces platform setup callbacks and a shared RX
> > trigger conversion helper, then adds the binding, H616 setup and SoC DT=
S
> > changes. Based on tty-next at 6b4b543fa187 with the posted RX
> > trigger callback-lifetime fix [0] and DW BUSY-safe divisor fix v4 [1].
> > Platform setup runs before installing the BUSY-safe divisor setter.
> >
> > [0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifeti=
me-v1-v1-1-731b78d5003d@gmail.com
> > [1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1=
-v4-1-41714a75e15a@gmail.com
> >
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes in v4:
> > - Introduce common Allwinner setup helpers with the fixed FIFO depth
> >    supplied by compatible-specific platform data.
> > - Rebase onto tty-next at 6b4b543fa187 and the posted DW divisor v4 fix=
,
> >    installing the BUSY-safe setter after platform setup.
> > - Use an early return for FIFO-less DMA setup, following Andy's review.
> > - Default to generic setup when platform data has no setup callback.
> > - Select Octeon's optional-register discovery with IS_ENABLED() in its
> >    setup helper, preserving the existing 32-bit and 64-bit behavior.
> > - Extract the shared 8250 bytes-to-FCR conversion, including the
> >    unsupported-table check, into a preparatory patch and use it for
> >    H616, following Andy's review.
> > - Set the fixed 256-byte FIFO depth in H616 platform data and omit
> >    fifo-size from its binding and DTS, following Krzysztof's review.
> > - Precompute the Allwinner RX thresholds during setup and retain the
> >    sunxi FIFO-depth helper for filling the table. Use named FCR encodin=
gs
> >    in the helper, following Jiri's review.
> > - Share threshold-table initialization and callback assignment through
> >    a sunxi RX trigger setup helper.
> > - Group and comment the H616 trigger and RS485 setup.
> > - Link to v3: https://patch.msgid.link/20261024-submit-h616-uart-fifo-v=
1-v3-0-286fc1b8c3c1@gmail.com
> >
> > Changes in v3:
> > - Introduce a platform-data setup callback in a preparatory patch,
> >    replacing skip_autocfg and preserving the existing Octeon setup.
> > - Describe each H616 UART's FIFO capacity with the standard fifo-size D=
T
> >    property and use the value already read by uart_read_port_properties=
().
> > - Derive the Allwinner RX trigger thresholds from the FIFO depth.
> > - Use an unsigned trigger index and conditional runtime PM guard,
> >    preserving error propagation when the device cannot resume.
> > - Rebase onto tty-next, replacing the earlier DMA prerequisites with th=
e
> >    posted RX trigger callback-lifetime fix.
> > - Separate DMA enablement into follow-up work, retaining PIO operation
> >    for the H616 FIFO configuration.
> > - Link to v2: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-=
v1-v2-0-af0593504635@gmail.com
> >
> > Changes in v2:
> > - Keep PORT_16550A and set the FIFO size, transmit load and capabilitie=
s
> >    during setup, following Andy's review.
> > - Select H616 setup through the matched platform-data pointer and remov=
e
> >    the type and DMA burst-size platform-data members.
> > - Use get_rxtrig/set_rxtrig for the 1/64/128/254-byte receive threshold=
s,
> >    with port locking and runtime PM around register updates. Keep the
> >    standard half-full FCR default, selecting 128 bytes on H616.
> > - Advertise UART_CAP_AFE so CRTSCTS enables hardware automatic flow con=
trol.
> > - Rebase onto next-20261023 and declare the posted sun6i pause/lifetime
> >    fixes and their prerequisites for DMA enablement.
> > - Link to v1: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-=
v1-v1-0-e4a3bae2eba8@gmail.com
> >
> > To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > To: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > To: Jiri Slaby <jirislaby@kernel.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Chen-Yu Tsai <wens@kernel.org>
> > To: Jernej Skrabec <jernej.skrabec@gmail.com>
> > To: Samuel Holland <samuel@sholland.org>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-serial@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-sunxi@lists.linux.dev
> >
> > ---
> > James Hilliard (5):
> >        serial: 8250_dw: select port setup through platform data
> >        serial: 8250: share the RX trigger conversion helper
> >        dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
> >        serial: 8250_dw: configure the Allwinner H616 UART
> >        arm64: dts: allwinner: h616: describe the UART integration
> >
> >   .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
> >   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 +-
> >   drivers/tty/serial/8250/8250.h                     |  16 +++
> >   drivers/tty/serial/8250/8250_dw.c                  | 138 ++++++++++++=
+++++++--
> >   drivers/tty/serial/8250/8250_port.c                |  12 +-
> >   5 files changed, 151 insertions(+), 28 deletions(-)
> > ---
> > base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
> > change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
> > prerequisite-message-id: <20261027-submit-serial-8250-dw-divisor-v1-v4-=
1-41714a75e15a@gmail.com>
> > prerequisite-patch-id: d8219673210dac82d3adab41578ff2f76f5862c9
> > prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v=
1-v1-1-731b78d5003d@gmail.com>
> > prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269
> >
> > Best regards,
> > --
> > James Hilliard <james.hilliard1@gmail.com>
>
>
