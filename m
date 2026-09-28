Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C6B4F4CE5;
	Mon, 28 Sep 2026 17:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617127; cv=none; b=IsUp60R90ycCA1wW5ayy+f04VKzPd2PJhTZ198CX5UppCPA5ME/dTQrgQkm5vp4opnMgpI50TxgaiXxR2N8hiWxiU6SjD15gLHPDnFt8/nJg80wvAkf8EuSxW5j5i4qByNpo1K3yKn7rownX0JL85o47gVv9waRZMo/1bfykA3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617127; c=relaxed/simple;
	bh=cm6LZOs9tdRPrtPe5gULRZnl8glTxitRamqWO2HjM6M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rCApxClvakfTIXCFQksdFHzfdwmmVJV9/2B5CgoMzkpkbyqG6UVBFak0YLCa+JtHLG1JmWdP0lKHvJ8geXPEXqAUJf57SRTqnrmGQTqTMh9Cq9B66TNSk0qn8qxR0L5LiQTYMqTceLcYlv1IAxSLf6IKEBzo+v2vf0wX/59TkWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a+xFFDZj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a+xFFDZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790617123;
	bh=cm6LZOs9tdRPrtPe5gULRZnl8glTxitRamqWO2HjM6M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=a+xFFDZjnOnyStni+kc3EARxHUeD+ZZcf1nfcaIhFDTcpkD2mKslaqK6bX5ZXQQWU
	 Z8FKcmQtQPArlOVrR0HbBoE19w3XjgFxR5bJluabOiQbv8JqTNIjObhtUx74mNCmwg
	 JqMH9a1arwVbdJtgmVlVWaD0I/Dn0r0JOQnXbAe/2I9iEDN+jYADmNJXheEEJLnYV5
	 VSiOfowBoDOkU/I94ZxVIUZyN5wRIrYP67TZPr7ZZDdQTadlMZpCwp/YcK7l6nwRLe
	 MxwEN4LmYOsfKhim3+HU9g75j2+wHRI9wTF/aYgr6LHEe69pvLHyj97/WeFV9ch6bL
	 98s4Hi9lMrt3A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E12A117E007B;
	Mon, 28 Sep 2026 19:38:41 +0200 (CEST)
Message-ID: <7c4e321647646ee2dd15989765ce1d8260894a8f.camel@collabora.com>
Subject: Re: [PATCH v5 1/3] media: verisilicon: Remove deprecated
 nxp,imx8mp-vpu variant
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 conor@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Mon, 28 Sep 2026 13:38:40 -0400
In-Reply-To: <20260928080822.19553-2-benjamin.gaignard@collabora.com>
References: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
	 <20260928080822.19553-2-benjamin.gaignard@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-YD8W0XNTTGrWR+Zg6iE7"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-YD8W0XNTTGrWR+Zg6iE7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 28 septembre 2026 =C3=A0 10:08 +0200, Benjamin Gaignard a =C3=A9cr=
it=C2=A0:
> "nxp,imx8mq-vpu" is tagged as deprecated since:
> commit f3116f2e52e6 ("media: dt-bindings: media: nxp, imx8mq-vpu: Split G=
1 and G2 nodes")
> merged since v5.17-rc1. There is more reference to it since that.
> Remove for driver to clean up the code.

There is not much sense to the above line, would you like to propose someth=
ing.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/platform/verisilicon/hantro_drv.c   |  10 --
>  .../media/platform/verisilicon/hantro_hw.h    |   1 -
>  .../media/platform/verisilicon/imx8m_vpu_hw.c | 117 ------------------
>  3 files changed, 128 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index ad71c0402ef3..12c804dcc669 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -725,7 +725,6 @@ static const struct of_device_id of_hantro_match[] =
=3D {
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>  	{ .compatible =3D "nxp,imx8mm-vpu-g1", .data =3D &imx8mm_vpu_g1_variant=
, },
> -	{ .compatible =3D "nxp,imx8mq-vpu", .data =3D &imx8mq_vpu_variant, },
>  	{ .compatible =3D "nxp,imx8mq-vpu-g1", .data =3D &imx8mq_vpu_g1_variant=
 },
>  	{ .compatible =3D "nxp,imx8mq-vpu-g2", .data =3D &imx8mq_vpu_g2_variant=
 },
>  #endif
> @@ -1100,15 +1099,6 @@ static int hantro_probe(struct platform_device *pd=
ev)
>  	if (ret)
>  		return ret;
> =20
> -	/*
> -	 * Support for nxp,imx8mq-vpu is kept for backwards compatibility
> -	 * but it's deprecated. Please update your DTS file to use
> -	 * nxp,imx8mq-vpu-g1 or nxp,imx8mq-vpu-g2 instead.
> -	 */
> -	if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
> -		dev_warn(&pdev->dev, "%s compatible is deprecated\n",
> -			 match->compatible);
> -
>  	INIT_DELAYED_WORK(&vpu->watchdog_work, hantro_watchdog);
> =20
>  	vpu->clocks =3D devm_kcalloc(&pdev->dev, vpu->variant->num_clocks,
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/med=
ia/platform/verisilicon/hantro_hw.h
> index 13e573f1f19d..865de26ffbce 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -405,7 +405,6 @@ enum hantro_enc_fmt {
>  extern const struct hantro_variant imx8mm_vpu_g1_variant;
>  extern const struct hantro_variant imx8mq_vpu_g1_variant;
>  extern const struct hantro_variant imx8mq_vpu_g2_variant;
> -extern const struct hantro_variant imx8mq_vpu_variant;
>  extern const struct hantro_variant px30_vpu_variant;
>  extern const struct hantro_variant rk3036_vpu_variant;
>  extern const struct hantro_variant rk3066_vpu_variant;
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/=
media/platform/verisilicon/imx8m_vpu_hw.c
> index fa4224de4b99..0d6a71ae5f45 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -13,67 +13,6 @@
>  #include "hantro_g1_regs.h"
>  #include "hantro_g2_regs.h"
> =20
> -#define CTRL_SOFT_RESET		0x00
> -#define RESET_G1		BIT(1)
> -#define RESET_G2		BIT(0)
> -
> -#define CTRL_CLOCK_ENABLE	0x04
> -#define CLOCK_G1		BIT(1)
> -#define CLOCK_G2		BIT(0)
> -
> -#define CTRL_G1_DEC_FUSE	0x08
> -#define CTRL_G1_PP_FUSE		0x0c
> -#define CTRL_G2_DEC_FUSE	0x10
> -
> -static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
> -{
> -	u32 val;
> -
> -	/* Assert */
> -	val =3D readl(vpu->ctrl_base + CTRL_SOFT_RESET);
> -	val &=3D ~reset_bits;
> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
> -
> -	udelay(2);
> -
> -	/* Release */
> -	val =3D readl(vpu->ctrl_base + CTRL_SOFT_RESET);
> -	val |=3D reset_bits;
> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
> -}
> -
> -static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
> -{
> -	u32 val;
> -
> -	val =3D readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> -	val |=3D clock_bits;
> -	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> -}
> -
> -static int imx8mq_runtime_resume(struct hantro_dev *vpu)
> -{
> -	int ret;
> -
> -	ret =3D clk_bulk_prepare_enable(vpu->variant->num_clocks, vpu->clocks);
> -	if (ret) {
> -		dev_err(vpu->dev, "Failed to enable clocks\n");
> -		return ret;
> -	}
> -
> -	imx8m_soft_reset(vpu, RESET_G1 | RESET_G2);
> -	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
> -
> -	/* Set values of the fuse registers */
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
> -
> -	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
> -
> -	return 0;
> -}
> -
>  /*
>   * Supported formats.
>   */
> @@ -234,45 +173,10 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmt=
s[] =3D {
>  	},
>  };
> =20
> -static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
> -{
> -	vpu->ctrl_base =3D vpu->reg_bases[vpu->variant->num_regs - 1];
> -
> -	return 0;
> -}
> -
> -static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
> -{
> -	struct hantro_dev *vpu =3D ctx->dev;
> -
> -	imx8m_soft_reset(vpu, RESET_G1);
> -}
> -
>  /*
>   * Supported codec ops.
>   */
> =20
> -static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] =3D {
> -	[HANTRO_MODE_MPEG2_DEC] =3D {
> -		.run =3D hantro_g1_mpeg2_dec_run,
> -		.reset =3D imx8m_vpu_g1_reset,
> -		.init =3D hantro_mpeg2_dec_init,
> -		.exit =3D hantro_mpeg2_dec_exit,
> -	},
> -	[HANTRO_MODE_VP8_DEC] =3D {
> -		.run =3D hantro_g1_vp8_dec_run,
> -		.reset =3D imx8m_vpu_g1_reset,
> -		.init =3D hantro_vp8_dec_init,
> -		.exit =3D hantro_vp8_dec_exit,
> -	},
> -	[HANTRO_MODE_H264_DEC] =3D {
> -		.run =3D hantro_g1_h264_dec_run,
> -		.reset =3D imx8m_vpu_g1_reset,
> -		.init =3D hantro_h264_dec_init,
> -		.exit =3D hantro_h264_dec_exit,
> -	},
> -};
> -
>  static const struct hantro_codec_ops imx8mq_vpu_g1_codec_ops[] =3D {
>  	[HANTRO_MODE_MPEG2_DEC] =3D {
>  		.run =3D hantro_g1_mpeg2_dec_run,
> @@ -319,30 +223,9 @@ static const struct hantro_irq imx8mq_g2_irqs[] =3D =
{
>  	{ "g2", hantro_g2_irq },
>  };
> =20
> -static const char * const imx8mq_clk_names[] =3D { "g1", "g2", "bus" };
> -static const char * const imx8mq_reg_names[] =3D { "g1", "g2", "ctrl" };
>  static const char * const imx8mq_g1_clk_names[] =3D { "g1" };
>  static const char * const imx8mq_g2_clk_names[] =3D { "g2" };
> =20
> -const struct hantro_variant imx8mq_vpu_variant =3D {
> -	.dec_fmts =3D imx8m_vpu_dec_fmts,
> -	.num_dec_fmts =3D ARRAY_SIZE(imx8m_vpu_dec_fmts),
> -	.postproc_fmts =3D imx8m_vpu_postproc_fmts,
> -	.num_postproc_fmts =3D ARRAY_SIZE(imx8m_vpu_postproc_fmts),
> -	.postproc_ops =3D &hantro_g1_postproc_ops,
> -	.codec =3D HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> -		 HANTRO_H264_DECODER,
> -	.codec_ops =3D imx8mq_vpu_codec_ops,
> -	.init =3D imx8mq_vpu_hw_init,
> -	.runtime_resume =3D imx8mq_runtime_resume,

Spotted by Sashiko, the function pointer is no longer used, and
hantro_runtime_resume() in PM OPS is now a no-op.

Nicolas

> -	.irqs =3D imx8mq_irqs,
> -	.num_irqs =3D ARRAY_SIZE(imx8mq_irqs),
> -	.clk_names =3D imx8mq_clk_names,
> -	.num_clocks =3D ARRAY_SIZE(imx8mq_clk_names),
> -	.reg_names =3D imx8mq_reg_names,
> -	.num_regs =3D ARRAY_SIZE(imx8mq_reg_names)
> -};
> -
>  static const struct of_device_id imx8mq_vpu_shared_resources[] =3D {
>  	{ .compatible =3D "nxp,imx8mq-vpu-g1", },
>  	{ .compatible =3D "nxp,imx8mq-vpu-g2", },

--=-YD8W0XNTTGrWR+Zg6iE7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarqmIAAKCRDZQZRRKWBy
9GNDAQDi5g/izyjScUfwuU4O6Xxwh7AvWC7oaHTKLLAu6+l4FQD+NtOhbvdBfsgJ
aBJCTXi+eGEL7YHNgbD6BylZgVF8BQo=
=cNUk
-----END PGP SIGNATURE-----

--=-YD8W0XNTTGrWR+Zg6iE7--
