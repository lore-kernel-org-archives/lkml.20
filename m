Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017532;
	b=p+9XU26gk1pKH0XMfbXqOsa5qcDo+adncS6Qr6XlWXI1TYFZ83HA33Jw8khPPjGjBhjO
	 wvKJDctvZpa5uSHLqYjCoGi26rfpm3saiwsGec4NezSSp7+jGBliQsB8uKRGI8Tp5aoko
	 o1aLge7WvX/BIHshB2C9LfChSdT2TQawZtP8LkcU6qhwM9y0xSIvnkAtEnaKsv9xKShJp
	 qAFPpm+C9pAol5dWzH8b03xq+PjOCQAMuaXoloxSvJ482zuON/p2/rFxdDVU3KyoyBRbO
	 NQ1FsZDLiCxAgQynfnw9xSiFTcjrZbqhuNobA4IzC/axQDjj1XX9wfdvRjb65cXEYUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=;
	b=K42Zn369gXbFoMceyVPOxTDUpch0/J7oug6q72oi4ZQ+B1LHCluSSo5BpeKLz9rK1k6b
	 rhv8HpJilQm2Y5osCwh4Kamk9A4GwRsMFvP0GNMNs8ndlpiXGx1FxzxudcdNN3GMlTbQs
	 V6xMtVjEfzIR/uW0KykHCQdCsA+tRMP2JcybQRfIOgSTX8haArC04GRCu66clbeaB0mWF
	 W58lDREs1NdgoT4MDDz2MIFrWL82VaC+siamxtAtaEjR2XrsFjUzGsJvtlPsNjcJs4ZKH
	 9eAt8C3prMDRM73HippTCzc/QyPyUrfzU4YMi0B56+OHbxQBi4VTk954KdF2CLF9YCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WPjPMV2G;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F120C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WPjPMV2G
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7ce6cb4c6faso66688137.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017531; x=1793622331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=;
        b=WPjPMV2GzhWEE5rB6rxz833ehsMAXDta3sOoZVRktCEdyknFwVsUHRtDGVizYRxiUF
         A5aK+EQBPpgFkVgArRFSWn0A95GZvt2FzhgPqRdIUp2Ox1s9tJ6wVnGUjO0+IR3STb2G
         oWcriSEJAIOUIoGa6UWmJJ5waV1c8RQ/ha7agfcknGH2LM2FJoa0fmpQaY8nNAVRystk
         rECssJkyILd7Ze4hFYVNaD/uWDd0YbGMulbZN3CyIH+BWXWfaQcSpG2HtD6Huw7A14dP
         u3Tp8g7XGn6Nhr3GiaXIhcrwkJttjeVmjSJxCITht07b4nxh9VScxAO/mbTQmLpJKGx+
         z0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017531; x=1793622331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=;
        b=2FwzaVuU4ROyLP1EF7QN1fnsgc9lSPNX3StTNOrVhHgZ1UqyGvUO48cDKqXNNjAKwn
         NFVxhcqyBO1Wm395mIecifSfmv42i/7pDgLhsPiZaKufBNzSg1nmLs5ixMufHJ89s+qN
         oH28gIoUxnqvgdNxxNbgNQKKjUVHmeMtlvSp2F3lzePLmPM3fGGoR/qf9b3AykdwMgW9
         dige0sq5RvjFAUzC71fjhsJ8pTKuEUgOc+6B0jpM/dCirTszqib/SaT2rvLWZGu6Rwq4
         4EgypQIsGJhqfKV2zDsV6y2BYj1WjLGiBs9Ca2tV2PGwl6//pDbNSxvn1NFHXIMVCghg
         PLlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVXCY5Ny/NqzMSvVI/knIztfko3pEBevWUhdc/rRSwgARf8R295DVnvIjMSlAloDbYCin8iwrmCUtrB5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXvVYrQ1eP31VYK/YIPeQEtu5FGurdXP8WOZTTYUbv3ygqE2+3
	dUl3y+5FJ8vHBexWItRSPLJPIVnOfPqYTltLDKQ7MzHCfCvlxYzCNxA2
X-Gm-Gg: AYBFou3k4APxlp2ZdfAYWaEjtHVsSnnHT5Lklqyzz0/O5YDqiIpRgh5mLVhIo7AUm8W
	uGoJ1S7maXw/3OY28qbhaXVVyS9BPoubkBfIEb2vOumLv6mytx2BzHNSAbpSSI/Irnq45QdDkjS
	vSM/OAY2iSXSDV2rRvRtxeZ2QkEL7h0wCwiULJs4OaFxIhCFYo/cWhQhTSOKq2BrQ1bvbTrJKkv
	7EEylDx5vS607d81mVUDRs9GVXaU1fahZhYNrqZjTHwLEN9yukb5imqtdQa1OP8jiVbeOH9uhMQ
	GJPh5wBDk44mf4KwIGdG7onac3Hbc1oxz4N6xJlz+BA8HVcOwdKzVVZWWEFpeG6PoKVkGJRP2Ed
	SOZ1tELpo8co2Wax7bi0Q0Pet1iUHUOSnvH6SfPXvwc9umzPZ98K0YkyVfOpHrT+/wFy+WzaphL
	wDHDYegMcBqIatiVUz183ODKxt1iz0IfZqL1VL9uc+RmS9MGWBAcDFcQ+lFqA3qulz0NduvkG6m
	FifWO6FopubwJmTvJrXfpZh5onY3iICGiVEVA99NsUUmekEL4RE9gW8lVxObA==
X-Received: by 2002:a05:6102:604e:b0:7cc:1b19:9258 with SMTP id ada2fe7eead31-7ce5ca1e48fmr1995133137.3.1793017530653;
        Mon, 26 Oct 2026 05:25:30 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b7069sm8121766241.3.2026.10.26.05.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:25:30 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:25:20 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Message-ID: <wancrsxcem5uep5oy5pnw5prewefqah7drmhiu5wrq3ctykltl@akwvtqbebblb>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <atZxhWaUWthEHkti@SMW015318>
 <lozimedmt3h7v6odvp4svvmatvk7726a4ztn3j7ft44oto7p5p@dmrudrmzyz3s>
 <ateQWqoTtXSBSBvm@SMW015318>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ateQWqoTtXSBSBvm@SMW015318>

Hi Frank,

On Tue, Oct 20, 2026 at 11:01:30AM -0500, Frank Li wrote:
> On Tue, Oct 20, 2026 at 07:33:10AM -0300, Leonardo Costa wrote:
> > On Mon, Oct 19, 2026 at 02:37:41PM -0500, Frank Li wrote:
> > > On Mon, Oct 19, 2026 at 07:17:16AM -0300, Leonardo Costa wrote:
> > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > >
> > > > Add a device tree overlay for the VGA output available on the Apalis
> > > > Evaluation Board, which is driven from a parallel RGB interface passing
> > > > through a non-programmable video DAC to a VGA connector, without VESA
> > > > DDC I2C signals.
> > > >
> > > > The non-programmable video DAC consists of a simple resistor ladder that
> > > > converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
> > > > an active-low data-enable signal.
> > > >
> > > > The overlay is also combined with the various Apalis Evaluation Board
> > > > device trees to provide ready-to-use DTBs.
> > > >
> > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > ---
> > > >  arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
> > > >  .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
> > >
> > > what's difference with
> > >
> > > https://lore.kernel.org/imx/20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com/T/#u
> > >
> > > Is it possible share one dtso also?
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > The Apalis iMX6 one needs to set up the connection between the IPU the
> > LCD interface (endpoints ipu2_di0_disp0 and vga_display_in), and the
> > Colibri iMX6 one uses a DVI connector instead of a VGA one. Most of all,
> > the bridge on the Colibri iMX6 doesn't have any control signals, while
> > this one on the Apalis iMX6 has an active-low data-enable signal
> 
> This make sense to use difference dtso to cover it. Is it use name
> imx6q-ipu-di0-vga.dtso, because this dtso have not boards specific part,
> which can reuse for other similar hardware? Or we can rename it when reuse
> happen.

I think the overlay should be kept as imx6q-apalis-eval-vga.dtso. As it
currently is, it's easy to identify the hardware it may be used with. If
another board is added which uses the same interface in this same way,
we can evaluate if it's adequate to change names for reusability.

Best regards,
Leonardo
