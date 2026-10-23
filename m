Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763481;
	b=RkTYVnPilVi7LZHfuix3KPgfH3nAnhcPDKkXkCduY/D2HqveMZZmSOPqyjySRXLmGPTL
	 43ubPFYq+5v2teibfBdFhNTtxdzqFxhxjtwzMUGEhokK+EukluXGe4Cb41CydzyqXMx09
	 /97C4JbO/YGvj57wpCptXrmJx5W5NwchI8siH2AeDbWzfKI8wRmmbaRKIKYMANkWO8xeg
	 ISulXtcayoo+j4iUHt0YDjkI5lVagt94i0QvMzez/m2tEYK/iIjssh0KIoteDLcvKYgpc
	 x+paUZn1lp17WztREaGsJPbcUc5qW790CccEkyvrJitAHZQQe5eTmW8QYtPHaKcfeGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=;
	b=jENNQiJ6+61bGZkmV6X8FQAeMoZj1lL8WfBZYGEFE1d7Wjpzum3RGf4tgJahlp/x9L9x
	 SLggPzsisxJNgseMROfGU/SnJlDo30KRkh07tta4wQnuTCKsaCMcNjXdpqYEdmLHvBjD7
	 puRWK2sXyq2Ku6lWQ2/+eM/qCAdEhHXJi678CqE0pe9J7GSmp+DIwmSl1XohoKNYD0KNc
	 iG9ogReqes29PAu2lxsTb1oT/bq742fDkfMY97Egjfb5OHfh81NwaT11ZLX5G4oKChuWz
	 bCAFCLBYlHnj1n8k5+02uj9PKOQSbU3AAvpBrkZIegSQVStVNURSkWNI9LexJjwhKQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s0JrTTqI;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D44C606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D44C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s0JrTTqI
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so571932f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792763479; x=1793368279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=;
        b=s0JrTTqId1Thjd23iKIcCer9vAWQqO29zSHJFmzVIlcS3td5Smq27zDqDudRMU1B+5
         BRxPmaNtu3WgLmqtGNu/NcUNq4BT1BYywzIN8AmiumwJrsoBHM5H/3SHWVivQJb2t55X
         A17w347Dx0WcOqiOGu4txLR6Fgi6cwEUU2IUYoRcize7YmSWEApxbpGrn/ImfyP0fZpH
         Wz/V9PVmuD6w3yhe3Axs0mn3KI4cdH0DJwYe6vrgaEZ4arJbE4HEh814XJMVCsbJA0Ya
         l9NR8zhYxp8yATtsrplpJTqPbLSH1Z83trWQNizrIuUeVcmCfSXWUZu3TUVZAYylQXM4
         mAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763479; x=1793368279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLlMw0tkVCijJdHRbK9nVgzTmO5b6r27lqMQqqKuArg=;
        b=crofVQxaxT/S2CQwlMP3DlXJY2gPkD/Swq4d7ED+SsrjbfM37t48Lt8Xs8XYMrTLA4
         ZJcfu/RF8KYNaof5ZClvi+r1g+zUKZ5H32Iu9fHRAJOWK/02n4ku/zy6gSLWVZUdQOmO
         zJdYrT7/ddkyWt5CDmXgiDUutfv6dv+QTKCIvBLId7bhV0Z64T5pZbuJyt5Zde4R6Zpf
         R/Ej2VxAgWAuYuHUQDWZMQ0Kf2qXEftKG/7jJVrPCs+Vji2znU5WPFkB1iOkybUcpYJR
         MJj1cGkUCraNyShBedG6i3hNmygvxV6e1uhMbMCMkVxAJB3drkaInB/NOjZhZ2tvkE66
         Wyfg==
X-Forwarded-Encrypted: i=1; AKwUvByvCoBjl1teREb/CnV0BwNMywdo3bF/fCCGTb0dsERL/l8pTSSIKMcyVyNzPmifLwo6u2s8kE9zWgoJAXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYISexKwz1/1MS1pl7WyHKZCNH5TPRmcjv3PlQTF+4emITUjrcEE
	o7QKbT+mJJKDvZFU72jEQqc3NNhxtTIvuuzztIvPl6nNA7V5iQjJXy28
X-Gm-Gg: AYBFou0c+eii0CwSolqQEX+JOPh/ScKOS6EQOUO1WW+mmRoVp7XT7phyPQK0ET/koHk
	a8uyLdSIhnmabpaFYZcP6Ib8AqYE84F/ePa6alJc2ykk8V1uIc8CVqPXuWncguqJllagPExCmUK
	UpdellS27j0uEosY+Zf7En6zncZrWUPz3ApeW/pBIksLCqkC73x3tlqpBEyo/xIN1nxkDtU+t1C
	VzNI28uozPvI0dTM3jD2I5NmsgTHAAMEatYi5rfBC8Odm/wpSHTm6Sxdj3s7u6BYB8kNY6FSDaQ
	BjcgotZnsf+/iR4OhZDD8MsrzLGZs4IfbLkCZXKG1BCiIe9FSVKJLsRDb6cUeX/JAFuqMHKw//t
	y3+edPGM/HBH5dA62H2ojpj0WbU1+0f5/HhEGxLjyPbK5YI1wSinbzPyd5A7+3U0fLaYx68bB45
	quVwKUSrfw50LNTyD8xoAwCHP9le5Rbdcqpy9CHghPAlDZPsTGPdK7rsMFXqh3dO5vL+KGo2dfQ
	HgHtEKrZ+e6dApEqxAIp+2vHbDfNePFO80fRfdYz+BjBNH7yhU93Y/GyfUkLF/oVEvU7i3TN8q1
	VGnIIfIzDflgh15DtuzqbKOLXWwZZtPlEQUEvnqw/p6ix7bpdJ2XodM=
X-Received: by 2002:a05:6000:46c8:b0:48d:f3ec:e818 with SMTP id ffacd0b85a97d-48e2d1430d7mr7952493f8f.7.1792763479100;
        Fri, 23 Oct 2026 06:51:19 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380314a3sm4401217f8f.27.2026.10.23.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:51:18 -0700 (PDT)
Date: Fri, 23 Oct 2026 15:51:17 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: imx8mp-verdin: Add
 mezzanine OV5640 overlays
Message-ID: <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
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
In-Reply-To: <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>

On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > on this interface.
> >
> > The mezzanine can route the camera control signals through two jumper
> > configurations. Describe each configuration as a GPIO nexus mapping so the
> > camera description remains independent of the physical routing.
> >
> > The default positions share the native CSI_1 GPIOs and are intended for a
> > single camera. The alternate positions permit simultaneous native and
> > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> >
> > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > module uses 24 MHz, so provide variants for both.
> >
> > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> 
> why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> 
> Frank

Hi Frank,

Both camera modules have their own oscillator, and the native and
Mezzanine connectors have their own supply, so each overlay describes its
own clock and regulator nodes. They also use a different I2C bus, CSI
receiver and connector. Both overlays are applied together for two
cameras (imx8mp-verdin-wifi-dev-dual-ov5640), so their node names and
labels must be unique, and a single .dtsi cannot be included twice.

The connector nexus makes the GPIOs independent of the routing, but an
overlay still has to name the connector, bus and receiver it uses. One
overlay for either connector would need the target to be chosen when it
is applied, which is what the DT connector/addon work is about, so sadly
we have to wait for that to make things more generic.

What is left in common is a few constant sensor properties, so I would
like to keep the two files.

Thanks for your input and best regards,
Ernest

