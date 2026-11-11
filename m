Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424116;
	b=LhQodhEnopxxB3AQoIdytNjsk6CSJhKqby/ensJzr9Dqs0oqvR9swvNQs7ZOG+DuSs9S
	 yxqAQty6PNXVwS6yX4meUJJGKeN7N9PSPtOFD8/XX089gdGRSfm659BsAASmKN6emMJ3X
	 N6tyuNFaqLT3IX1T6Id0ereyexdsoWGa+VWirepm6uWD2NrR2pZT+dxTPoSeaDbW9ibdJ
	 kiDi4fwJe2QPkCoh56BGwfVtH1P2+50ZEuOR1VgbJZX0Jy8+fZSfMrNGCW7EFMn9H0Qca
	 seY91VTHnxdbnUYU9HL23CDHrbbR7lTdi9cy1oUz7hgX1ezJ4ceCtjU6NaNDHNDS0aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424116;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=1u1FmtDlq9fLUJ7TofIm7s6Ux5ZyHgM1hXjsasoL1Tg=;
	b=DCCRNhrzwID4mUJj8aWkTnVz8MqYEZBl2pq1VahHvAcvq5bdWDD9tpGYcvtJT5BAAoya
	 eKspERNg0HaQ5jRD/YzYEtijTIOiOi2ZOstzjRXTpGZP4LIkRGx725E+tpulgvE7N/8D/
	 Y7CEjEDVz8z5yFNJ4Z2KO74W40Ivbyocw06PIe7mymKqQwz/JJi6sIWGiNV/7O1AF444G
	 GNQy5viQdQRinMKI4I2dBCV9+4nZ1WRi39NlPKl5lBs4hQUAk95skwfpnY04ZJtCBQ1fW
	 imJkHpCoSCx1yp1v2ENMV+1RPHxjKYrEuw6cLFpT/8KGoSFMdXLUvLH+P6hMpR6AFyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA76606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA76606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso107853a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424116; x=1795028916;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1u1FmtDlq9fLUJ7TofIm7s6Ux5ZyHgM1hXjsasoL1Tg=;
        b=PdfAhmhCu6G6WdAR8qeHkvQKJV83a4ETJhG8n3omv6Vjpd2act4SBfh3z10jC8oQ/L
         TIlz3k3FVtM/97nd7dXX4AClhegdsaUGrJbrFiw4D6Tc6rkfvmYpOVw22GpjkxYqreoj
         NwYmMME5BjVGTs0jLdfLTc5UPFiax64C87cuJu7joM+XlOU/aNb+pzgPX23B3PJWRZYg
         G5RqTTKvKZGUKhgLXhQYcJjQXw5Q6YH8A1dONokT+sULInJl98Z7ZzHwwihZ94334fHs
         Ub2ON+dzxQZ0/Ny6gWT4SAeFxhSJ9SRiZzvvqA97p4nn9n/9AG6CbN1nlKMTub/ZjkMQ
         pqWA==
X-Forwarded-Encrypted: i=1; AL+hErFnbeBWlRWo+w/YFplnYtwL3CDMPcZ51/kMOizqCAsZmHA+MKNDGsYOicq4fKMpUgNc5I+SWqW8ffaFQR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sSaIaS/j9uiZS59PtD73inoNq5sCprv79YHG3ifpX5/zNTtdW
	MH8Z2ORward5BvAuXkbX3yeCxFMtnAbdRkvQHE/6MJT0NsFc3PhSACtUZBNDPLdC
X-Gm-Gg: AYBFou0LgqOc1d4uC8tnHMHtggatMhoZ+P0n0IkoY/s/G43XeIXOKlDimbzc964DZoR
	SoXyw2sLA8AcSPnI0CzwUIfL31zkg3FnOGQuk42nSHkchsf3PXZef5M4SEtngqJQ/fpimnB9XfU
	8ikIIiC36s1oCC4WOdxhEjnERXGNeura19ile3uTlZQvBLOQ1nisCfV5IY+12uOAZrhfyxi2B4h
	PrMbVk6YpcKTmCLL7CYR41/pQiB1O6fQ1fk4/M5vTEz0y9pvjzvULGJpKI9jgBHrGH4yds3KEbR
	6ZDkWA2sc9fSrU0NLx1UWVUmvGroU+Oy92PnPh2gOUYcj3tKRjVsIOxyXReRLon7O9sikOP0IQ0
	Folr8fLNYzpCDHXrxv9TS49NbYJ9g+vwDHpT44h/uuiFiMpEBgm71poFEjoeSYzjY9GHlFhOccX
	aDpd/zQupBRT+MHQV2EEAjmlRzsEvOUpTbTZ+eIHp+Lr9qFCtQ/57cNoPRgub4yuCEV8v8uhx5R
	JYQNifcM+fYS0WyYRTapc3MaGOn0+3kqDiOmiPqpWeEaw4fwoBPjveNJ4l1T87bjffYqynN/HS0
	j2BHxzSDZdL9XwCvIExQKodmf7AyhhhWAt93/NcqkoETAB7hI8moRwvrb/Qpc+/Bngs8JpbOW5j
	dNkN+V7DuWiTnTW/Kt+izJGIvrJUOgdjYKBVvBRKHOkeJ
X-Received: by 2002:a17:90b:3b85:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3b197cdb5a5mr257286a91.41.1794424115750;
        Wed, 11 Nov 2026 11:08:35 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c3e7b5sm557548a91.1.2026.11.11.11.08.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:08:34 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37198ed3727so191502eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:08:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE7jKLqz6OPAesu4clSX2tlCQMFnB5D8sK7yjaukPRRvlUJ6laoAYeUuEGR3WUab+7ycQ3vJKFVJmz468M=@vger.kernel.org
X-Received: by 2002:a05:7300:c7c4:b0:377:3984:5cb with SMTP id
 5a478bee46e88-377e15ef441mr284775eec.17.1794424113527; Wed, 11 Nov 2026
 11:08:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
 <20261111-sf19a2890-sysm-v2-4-d2fcb723e4f1@telaak.dev> <d59f52d1466c515f574be1e9eb127ca3e43d155b.camel@pengutronix.de>
In-Reply-To: <d59f52d1466c515f574be1e9eb127ca3e43d155b.camel@pengutronix.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 11 Nov 2026 14:08:22 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5_Qa2vf7_GiFU-T92HDkA3mdY_x2Dt5DXZ5dMfS-oUwQ@mail.gmail.com>
X-Gm-Features: AclHuK9zvtdVIUhueVUtW3uifqySWqzLz4GA6zOccXJAOROeptCP5K7cJXQAOv4
Message-ID: <CAPY4CJ5_Qa2vf7_GiFU-T92HDkA3mdY_x2Dt5DXZ5dMfS-oUwQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 10:56:47AM +0100, Philipp Zabel wrote:
> > + spin_lock_irqsave(&crm->lock, flags);
>
> Could be simplified with guard(spinlock)(&crm->lock);

Will do in v3, as guard(spinlock_irqsave)(), since the clock gates take
the same lock from clk_enable(), which can run in interrupt context. I'll
convert the gate enable and disable paths as well.

> > +static const u32 sf19a2890_usb_resets[] = {
> > + [RST_USB] = GENMASK(2, 0),
>
> Do these three bits control separate reset lines?
> Does the hardware require them to be changed together?

Yes, they are separate lines, one per clock domain of the DWC2
controller. Bit 0 matches the controller's gate and bit 2 its AXI
master's (usb_axim). Bit 1 has no gate, so it is probably the PHY clock
domain, whose clock comes from the PHY rather than from this block.

There is no public documentation for this block. Chuanhong explained in
v1 that the lines of one IP's clock domains have to be asserted together
[1], the same as the GMAC's. The dwc2 binding also takes a single reset
for the controller.

> > +static const u32 sf19a2890_uart_resets[] = {
> > + [RST_UART0] = BIT(0) | BIT(4),
> > + [RST_UART1] = BIT(1) | BIT(5),
> > + [RST_UART2] = BIT(2) | BIT(6),
>
> Same question as above.

Yes, they are separate. Going by the gates at the same bit positions,
bits 0-2 are the UARTs' APB resets (PRESETn) and bits 4-6 their UART
clock domain resets (nUARTRST). The PL011 TRM (DDI 0183, section 2.4.1)
says the reset controller must use PRESETn to assert nUARTRST. This block
leaves both to software, so the driver asserts them together. The pl011
binding also allows a single reset.

The same goes for the other two groups. The SPI block's bits 4 and 5 are
the PL022's PRESETn and nSSPRST, which its TRM (DDI 0194) ties together in
the same way. The WLAN blocks' bits 0-2 match their AXI slave, AXI master
and platform gates.

v3 will explain each multi-bit group in the commit message, not just the
GMAC's.

[1] https://lore.kernel.org/all/CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com/

Thanks,
Joseph
