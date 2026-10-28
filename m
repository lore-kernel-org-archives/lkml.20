Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793178300;
	b=eKXE20/WRpoe45qMchiWFVwNJOD+oDwG68xUGF2zKJEImFq7ghXK6r1TGkVwvZwJbtWG
	 ernE7azNqAtQP3j5rcjFB8UwXFmN0Q7FmshTmsDGTuWW9AFWdtuGIN+VJEAYhM2NDXWDQ
	 8eGL/w7wPRUp/DKEcmH4RSEOU062Y7MlRNhV6FCE6UL7n5N+3HKfMcO9XRWnqofa0pHco
	 IAyZUKE5Iu57w1oB1NEFw5Z9eDJEFohd/Mgn9nTBqiBPaeuJt6ExpyhtGeiHoj90ve44j
	 W8TS1LX5MaQV1IzQ5+/0zMufdL2gFsdBXhPb/qg4LnAUIBbFkezaE0UWUoJO+1KEjWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=;
	b=dE8As6dChqRkYvEa4tqwicVwT9jOtePG/EsyPwfR7lVGmC4TaJ5CbxQCDkqZZ1+wsd/o
	 BdIZcvBKB94GPhBsRUccSs+eHv9B4jH2Z0iUP8swc9PxNgw0kvLpkEpumj5u+X74QUNfI
	 Er3Ta+woYk6PO9RIfjpJN2VoTCnjzMoNK0T+vdotXN7FmZnt7R2pWQc3DH0/HJGVGjkVk
	 yWe0xiCH0IFBRKYK31AFeevrEjqgv0Hi1T0Zgwm8VxCDMKliOnopP9eV58qLrf351GtOy
	 o95LPPyfmv29W368RTu6IksTQodIu6x/gA2ITTnN3JpBe33aYnkGtvAv3ztLA2OKfHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Zv/eaVA6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32519606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32519606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zv/eaVA6
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so1751304e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793178299; cv=none;
        d=google.com; s=arc-20260327;
        b=A+ES5HemSwyn+iT2/e0GdoKtazoJZqJylRyD4D9C2+6vLSmTWL99k+r+g3QjFlwa+l
         6F+prc5PxrKSwuCjpk0FjGOF8mXIkIrBEaG4bAuSzhpEnScD3tQF6dkdaGI4bJGkXi4/
         JTUebgL2rZy3WyllwNWgpVFzeRlHFFiX5xbKfX+mFYh7Z+9NfVl34joX9uMnJ43GS8+U
         TwcPu3yWIT6Vwl5wheN8yCnbgB5d7iQweecpAk6z08HODcy3HvY8vLuNjWFsSHD4+19n
         d32hjR7i+AQmx5InNMc9X+0osLB7z0N8ECVjBGEhBfUvba62VUbimZzwkfi1w3E0f6xK
         0Ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=;
        fh=XSvNmjPaw2ZqLAGcbwbZobBzj9FiLfR+6Z72cUnSeDM=;
        b=GhjEQRmvzUPIVYM0aMLqd3HKEnGGTB7cTe5EZAU7p/u+awjDtlE+LkoX6vREk82aKJ
         tMB7lZ7QNY/qW6KthMr97W16WSAGEg78BaysspXxXBNJYQ/rRUEdBqmo4IjieUIqwH7L
         s8XR9WQf7+mMLlxgMs9ntTeBz9b5C3tQVK+LbuSim5JnEqdVH13esvZ5qraSrSykCqiS
         omNaNT+EGB0algMPoGeYxV6hPAaBkJw/D9nv2iMVbpPZt0LrLaE/TdF1EQFxokNYbUye
         GBKnmUL+wp22KexONcNTuIAjXZU0/rfjt7qQIKffvm1rSWcBfTuhnusTo3hiSf4zI/f3
         ejRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178299; x=1793783099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=;
        b=Zv/eaVA6lrScHL0q/Ho4LyoktOdLdPByjB2bkcl06fB/h4jrdPpHRQn4RynI0+1vbm
         D608JUJSXkkjPmHjkN3xUz/Qkn9L7ybWzyU1M7GphHIut/eiffBKweAlIujSMiMXcl0Q
         kshmlA/BuKTG0gjOgHX22dv12nDGGvfGWLpoqTECiH7jFdZ7zNrCM6eLeGBJmO/XIthK
         QuaImLqrlR1dzi5MSG26GJXW8YTU829VLyctOC52BFf2xgZm/o/mFR/JpzebWFU64weD
         MZMgys49V0tVh2K+uzJphy1r1Gtxc9ufNvmdUP4mrgiph/INC6Ft/KLMMJ19EA7gY0UB
         f6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178299; x=1793783099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=;
        b=D5YFUFFSTbRZ3g8Mg1NmY1I8mjKf/MwWyM2PvY71NNJ7Peg1ZbsHvAbErjS/BL/ojE
         n7WacomaYJw6Xm30yFqz6IhUxZnbK0tNXhUgHBxbwtG5LSFryTYBbbSfkNJ9D+GxaxeV
         wyvPFkw0Cs+iDDVNmF1SJ5BjGWmO495LlEzajLI45skYD/ljZyDjK+fRYclBLlRAmTwh
         i3Ozjow7tU3ApVWYJXj9wt7mi7wuxH+oVo2C+FEnmnrG5rU7XVoir4wauQSvzv0cUai2
         OznDQMcUrpW7/Eh/5ZUqf7+FWTNAkdTfFsSK07DK8kYoovtoe51Nn4VqpKvYcaTIt4BG
         M5cw==
X-Forwarded-Encrypted: i=1; AKwUvBxPTEm1F1Yg+VWQ/KCoZTjDbhgddZv+jvDV8Kr38+5b1aOtWgNomqoOq5y6X6i+In5xcIAaKnDO515Bq3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPP0q4IYHUG/Z2w7zk7UWlz8gCCNNAgcK+z8QMlQ1ZKnzlWhcb
	Lc4J2+3dBDbExm7jTHNY4ffW/mF8IOmdXRdW3wyNhAzumiXhcfFATPMO9ty6PAmbmd60AlO84nm
	CQFNmRRusiNnqdZLRQFlUsVb6x6I8HGE=
X-Gm-Gg: AYBFou0WA65VBIHpmE4RROROZ40osQ4OYLn44hb83/diH1+rVRSm/PX4rKdbiOD3uUP
	AEV6oyWu+mCrCDv+4wAvY4CRVg2fzlUUd4/K14QY2TyWs8hwRTokstsyG7YaQ5Bh51u2uyqzbgH
	93uUoI3nHL0wMQ+qBMsg4OzkN0MB1+E8IJ0mEmM+kkCED6eGdV35W8LJOU7UqPrXAVl7YQ9zcTq
	KHhyNN3foEP9a3VHat3rjzHE7E2/Mcao6d1sYASgDwMRmPqSYn1NVyFG4ErtRdmCq+ru+OkOxJo
	EUYhfvLo3953fc32bszntGqsgJYH7bA4d0yH9dCkW5098LbV4F4qh12D8YvzJmmezEZ76cdh2vn
	IrV78r6JjqGH8OtUynvp+5U3WrP5wLePrglEC3ZWngEbddC5M+iLjd14MPKIq7W7AJviT/LgquF
	CQ+1vpfjfbAZSO2UGbosBmGF+3i/84bk6G/GNViRYlKJ1vqCnszkypoLgJ49lVfpTtgK3rsSuXK
	rI/Mf37cUaG+dpvzdYLCFxuOLLyNQ==
X-Received: by 2002:a05:6122:3a11:b0:5e9:5e79:aa5 with SMTP id
 71dfb90a1353d-5ec4fffa0b3mr263672e0c.7.1793178299127; Wed, 28 Oct 2026
 02:04:59 -0700 (PDT)
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
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 Oct 2026 03:04:48 -0600
X-Gm-Features: AclHuK-gFIc4OLdQpz2xuDakOfWjCmV7F0pKVxznmCh4UQXGFX7ZPx8S3KT4ikY
Message-ID: <CADvTj4oSo7gXsqoLndTChgC0oaUGB9SB-4B4a1gEkx6XDFD7Tg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] serial: 8250_dw: describe the Allwinner H616 UART configuration
To: Andre Przywara <andre.przywara@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:57=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
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

Some Allwinner SoC's can read fifo size from a non-standard
register from the looks of it.

This approach at least allows for just adding SoC appropriate
compatibles with their fifo-size tied to the compatible. Or the
fifo-size can be pulled via that FCC register on the fly and
reuse the code paths here probably by tying that logic to
the compatibles as well.

>
> IIUC Chen-Yu has a patch to attribute the right FIFO size, in each
> .dtsi, which I consider the best solution to this problem.
>
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
