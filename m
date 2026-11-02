Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793625910;
	b=Djxn8yZC+ht/RCI1AunCG+JQ/kYXQPj5/DqeQ1WyWr/bkrwxecDdSXg7UoTib568OUdd
	 I6OGrqiYx5KFrVhc2Q2cSe5j0ovQOSjtIecAWC00esP4tAI0rAGx/VKKSd7Z/bGqhTTGr
	 Fyb/PNqguItSLvnFKOig1qaF5Nm5hCbs8ek+3Ig5t435vF1wquXRM4zBs3iCJ0ksjbGFv
	 0kOQf8rLQT7JOOB0qToAnZippKm6enEh59/OxnRzaKLZqbLKh+hzfhPV52nlbY6sJZtDW
	 oaeZc8ExKJqtRjUnnYzRE5X2SORZ0GLNKxGHwHrUXygafmWWzVVhoZRK5Hs6fat0ifA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625910;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-ZohoMailClient;
	bh=wxjIHAuIp6ekDhPVCcCLAmklPelRj7jgqF/+3HTKm5s=;
	b=ZrI2MOpxI2/mdhS7NzJOKE9BLOZZ9dzjc/zqrGLpqZR7DTb4/JB9zb3BBJRHRQf0WK2t
	 xxvpNujkmwqfQV5hTgoc1BiPKFjDULhnumnCbQZDsDk8yIN/zDtHYx+AGoH0k2KYkoXVP
	 JMYA5oggt+fWzelYnJTj+DrgbpqGkklz8DfZRoTkYHwam8HDuWjBOygK6Cr4iwnZWsV7O
	 cfc7GgtRPW0Gr3qBHIkNaOwbgPyXDtXrc44f/FntheAWRkSEiA1xFojMb8qfKj8Y0JQir
	 NvhQQ+oex5y3/5Iou927nMVDzuu8sO+EMLi32muf1lNRdwYRG/1Tfkles7fMt3sjkDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icenowy.me;
	spf=pass smtp.mailfrom=icenowy.me;
	dkim=pass header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b="Qu8rS3/G";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806F5606A326;
	Mon,  2 Nov 2026 13:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 806F5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=Qu8rS3/G
ARC-Seal: i=1; a=rsa-sha256; t=1793625848; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f7Xj01KuAiYLRFZ+56umfnvwPieOTuuNKubnySrPhZLWp8JqNxCguowM6NtZlNunGTvzyEub80/7UsQoB3UHHdRgGE4E8B8YU6yGOhy7e0fYJKJmxzTxfX7w5f59SA6NfeWVybPz1QPSC5fvh4iRXGusJSAUJ3aF/XjI1oExzj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793625848; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wxjIHAuIp6ekDhPVCcCLAmklPelRj7jgqF/+3HTKm5s=; 
	b=jps1Uiapc+8FaK5ZxCW3Dc/dkjMP6bgPcwqaiDmdrJgffG/h6FXxNV/lJg/Gnq/mbop4tVkR0C43BTQWMNHTw9vvaLBPvIs+jTSHIQPC+uMc3m5RqyUNaHzaJsXpogybICGB6eo970cBy5VE/y0S5KEYA+zdZJXuSiDPIIwiTfE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=Qu8rS3/GfL5UlN+4BnbLjwL8zeIrFA6ZMfNA75YGjePSitq7ifCFZq3OxDx3w3zx+AUV4NRctYOeOqe5lJywNMaJGZ47MOco7+J60iLR8JYvU2UrwFvGx4+4GMhHQQ5H2MGJFeHjjLgyrpwdxLwNFnt9/peSWo0dOV/ThUSx1fcddVf2WiPabuAEX3y/TZsD0J7YFy8+araqMgJnFi4dT5Q5ildpQYBzXMxYrCRKwEwAabcp2jBOPx7XeVUXCtvXqVRCxx28ZD2PZM2Dgdsu7IdOEFwxRAnR+jcxFTYmQ81driIwfvwc76pWHgHzTtw6Q0ieNl3VaTQHI0yQKEjnHw==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=wxjIHAuIp6ekDhPVCcCLAmklPelRj7jgqF/+3HTKm5s=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793625845538857.5780358922513;
	Mon, 2 Nov 2026 05:24:05 -0800 (PST)
Message-ID: <df946ddae7f00aa3fcc2b2ad953392f33a94ad37.camel@icenowy.me>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: document TH1520 MIPI
 DSI controller
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Sandy
 Huang <hjc@rock-chips.com>, Heiko =?ISO-8859-1?Q?St=FCbner?=	
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 dri-devel@lists.freedesktop.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-riscv@lists.infradead.org, Han
 Gao <gaohan@iscas.ac.cn>
Date: Mon, 02 Nov 2026 21:23:56 +0800
In-Reply-To: <20261102-spry-snobbish-hound-384cae@quoll>
References: <20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn>
	 <20261030-th1520-dw-mipi-dsi-v1-1-753f34fd304f@iscas.ac.cn>
	 <20261102-spry-snobbish-hound-384cae@quoll>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-11-02=E4=B8=80=E7=9A=84 12:28 +0100=EF=BC=8CKrzysztof Kozlow=
ski=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, Oct 30, 2026 at 03:47:49PM +0800, Icenowy Zheng wrote:
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DSI controller APB clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: PHY configuration clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: PHY reference clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DSI controller input pix=
el clock gate
> > +
> > +=C2=A0 clock-names:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: pclk
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: phy_cfg
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: ref
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: pixel
> > +
> > +=C2=A0 syscon:
>=20
> Such property names are not allowed. Missing vendor prefix, missing
> descriptive name.

Sorry because I thought `syscon` is a generic name -- it's available as
a compatible string (although with SoC-specific fallbacks) in
mfd/syscon.yaml . I'm okay to name this property `thead,syscon` or
`thead,vosys-syscon` .

>=20
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle to the VO subsystem system cont=
roller.
>=20
> For what purpose? How does this device use VO? What is VO subsystem
> system?

VO is short for "Video Output", the name for one of the "subsystems" on
TH1520, and this abbreviation is used in the user manual in strings as
"VO_SUBSYS". A certain register is wired to D-PHY sideband signals and
thus bound to the DSI controller.

Should I add the information in the last sentence to the binding?

Thanks,
Icenowy

>=20
> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - reg
> > +=C2=A0 - clocks
> > +=C2=A0 - clock-names
> > +=C2=A0 - resets
> > +=C2=A0 - reset-names
> > +=C2=A0 - interrupts
> > +=C2=A0 - syscon
> > +=C2=A0 - ports
>=20
> Best regards,
> Krzysztof
