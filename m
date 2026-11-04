Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790733;
	b=izeXEJGIFaufyFvVe7CTahS5wXhRI0YCIm88zJjazlF4SCsJMdghcXO3x0v2Xyk+Xurk
	 7A+I+Mjg6JHebqv+DKDtsYU3/V7GX0WbxodbtqthMfXxQaAdvJS1hgoicDQVRiCtdmEke
	 5Smz7IcGIxoBCi9PgxZlB/foghFR4Zmghn0ihn5Yb3w/Ziw75POjETwFjOyU4qOoOXMQo
	 xS+UTOro7NYANQSs3rXJluoMJ3HFS2GvQnqOG9DLuJUNGqT7iHCQcQwPhF3LUbvhuMWHH
	 TNf/+CBsSFH0KTXw9jDPihLU2RsXTwTPku1VxqW1OamukR+SOkSru9FT7cnQUWYu/QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790733;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=Sq72/jE1QWYRdcK1hoiu7bRYxYUswJNBNRjBOWyiKL8=;
	b=T702f8n8TnF2pmd0HJgPkGZeNBzKOfbWjWb6LfE/bOuDNrdvxUIZhPIO43Jh96Eg7Sin
	 H0aZnb4NOvb+vrj6BPaRNEKkhjvRPfmQqb2Ztwz7+E4I3qq9N3oDscIqY7nWSlgnIBuxN
	 SxFEpZR0U+eHm0iDQapb/IzmxpWt+O2wqZ0sDnKg7go67xUyO3wLfBYSr1HphxgcUsl4Y
	 FX3zABvAJr65c0OF/DBvLEYTgpzZfUVi9pQXkS0nfTyOUZ1zGpFFjwnHYMUd2jYIbupqJ
	 nkD4caVVT3gn2bXjftu44vyPZ8d6s0/CboGebg1dTCaV6pCmbvea5Q0RzNdgMqv5ahg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=2HPcvgDB;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30F606A31B;
	Wed,  4 Nov 2026 11:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C30F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=2HPcvgDB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Sq72/jE1QWYRdcK1hoiu7bRYxYUswJNBNRjBOWyiKL8=; b=2HPcvgDB89z9MCCbZPrKTjDdSe
	a2iOhzncH45XWbpf9h5Z8prpD2YftEz7/e5hwuvWn+QuCeuR+A985T/5nMETf+5nDv4C/OGiEYWiN
	yHNn/W7mCluK0Avj86ssbgeDhbC5MybjVA9WWWhZe6nnpnYsMAqhE8dncxIx4P5Sw9H0FPt3JwUjA
	V2dW8uAPnS6oH6s/atFbE1YQM3BrqEBVTBRoCa6Px+Gf2R9yjpHPLpIRsFY0/nmSSP+QIih6+Ebkj
	gVyTKzfad0lXgE4JzqsC3FtSmP5P7yTqCtINcMmCiSDl37j6H7J+F/DKy534XRIjzr18Rpw0TYvFZ
	34n1vy7Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Igor Paunovic <royalnet026@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Sidong Yang <sidong.yang@furiosa.ai>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jiaxing Hu <gahing@gahingwoo.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jonas Karlman <jonas@kwiboo.se>, Guangshuo Li <lgs201920130244@gmail.com>,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v2 05/11] accel/rocket: request the core clocks by name
Date: Wed, 04 Nov 2026 12:11:52 +0100
Message-ID: <13701281.ZYm5mLc6kN@diego>
In-Reply-To: <20260922080114.44662-6-royalnet026@gmail.com>
References:
 <20260922080114.44662-1-royalnet026@gmail.com>
 <20260922080114.44662-6-royalnet026@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 22. September 2026, 10:01:08 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Igor Paunovic:
> rocket_core_init() hands core->clks to devm_clk_bulk_get() without ever
> setting the .id members. The rocket_core array is allocated with
> devm_kcalloc() in rocket_device_init(), and rocket_probe() only fills in
> .rdev, .dev and .index, so all four clk_bulk_data entries are requested
> with a NULL con_id (unlike core->resets, whose ids are set a few lines
> above).
>=20
> clk_get(dev, NULL) ends up in of_clk_get_hw(np, 0, NULL), and
> of_parse_clkspec() only consults "clock-names" when a name was passed,
> so the index stays 0 for all four entries. Every entry therefore ends up
> holding a handle to the *first* clock of the DT "clocks" property, i.e.
> ACLK_NPUn. Nothing fails: probe succeeds and the driver believes it owns
> four different clocks.
>=20
> The consequence is that rocket_device_runtime_resume() prepares and
> enables the AXI clock four times, while hclk, pclk and - most
> importantly - the NPU compute clock ("npu", SCMI_CLK_NPU on RK3588) are
> never prepared or enabled by this driver at all. The NPU still works
> only because the Rockchip power-domain driver sets GENPD_FLAG_PM_CLK and
> its attach_dev() callback walks the device node with of_clk_get() and
> adds every clock to the pm_clk list, so genpd happens to keep the
> remaining clocks running. The bug is therefore latent today, but it
> means the driver holds no reference to the clock that actually feeds the
> NPU, which stands in the way of any future frequency scaling
> (OPP/devfreq) work.
>=20
> Found on an Orange Pi 5 Plus (RK3588) by reading the live clock tree:
> /sys/kernel/debug/clk/clk_summary shows four "fdab0000.npu" consumer
> handles on aclk_npu0 (and likewise on aclk_npu1/aclk_npu2 for the other
> two cores), while hclk_npu0, pclk_npu_root and scmi_clk_npu have no
> "fdab0000.npu" consumer at all - their only consumers are the
> "npu@fdab0000" handles created by the power-domain driver via
> of_clk_get().
>=20
> Set the ids explicitly, in the order mandated by the binding
> (Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml):
> aclk, hclk, npu, pclk. After the change the driver holds one handle per
> distinct clock and clk_bulk_prepare_enable() covers all four.
>=20
> Note that this is a user-visible tightening for out-of-tree DTs: the
> old NULL-id requests resolved by index and succeeded no matter what
> "clock-names" contained, while the named requests fail probe with
> -ENOENT when one of the four names is missing. That is the right
> outcome for in-tree users - the binding requires exactly these four
> clock-names and rk3588-base.dtsi carries them on all three cores - but
> a DT that relied on the permissive lookup goes from silently running on
> the wrong clock handles to not probing at all, so record the change
> here where git log will find it.
>=20
> Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
> Assisted-by: LLM sparse checkpatch
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, N=
anoPC-T6 Plus
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
> Same diff and the same message text (his copy re-wraps the lines) as
> 01/14 of Jiaxing Hu's RK3576 series, which carries this patch as well;
> whichever lands first, the other drops it. The trailers differ: Jiaxing
> asked me to drop his Signed-off-by from my own posting of it, as he did
> not pass this copy along, and Assisted-by is added because an LLM helped
> with the checks on this v2.
>=20
>  drivers/accel/rocket/rocket_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/ro=
cket_core.c
> index b3b2fa9ba645a..5dd260bacbff6 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -28,6 +28,10 @@ int rocket_core_init(struct rocket_core *core)
>  	if (err)
>  		return dev_err_probe(dev, err, "failed to get resets for core %d\n", c=
ore->index);
> =20
> +	core->clks[0].id =3D "aclk";
> +	core->clks[1].id =3D "hclk";
> +	core->clks[2].id =3D "npu";
> +	core->clks[3].id =3D "pclk";

additionally, while reading the followup patches, please introduce some
constants for the indices. ROCKET_CLK_ACLK, ... or some other name.
Because when you access them later by index, that makes things harder
to read and follow (especially in the future)


Heiko


