Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761333;
	b=5caQfzQlG2DS9+aqjgKbErucdjZvm9QMN5iWyLvRrU12oL1PoarYdTPuf6ieBqFdZRgA
	 B5dnsLTzW+V9GP8DypHDrKqyqOJcIt7r7g9yivfMsiAI7mMrHdMNUWIHtRq/jKOGCJCMq
	 ObqM5NTOBVQavf/E30yqTN3kvFCtbcjOhMAZm+K/EfBDSNakKkkil9CBFmfmBTjCBXtjD
	 FsJG1RKnReaLfTbjg4ozx4MQqoJifXnkaBMdz40M1lo5Iq+629AddPm72ScQbJdeAud5X
	 ondc/m2w587xw/ZERCQ+I8EyXgGN6En3aaUXcCJL+cOeJQ5VZDNH89Z4bf1N+3MfsJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761333;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=NVcW2Ffyo3xz8xHoLfYrXy/+Ll+4LUkHyKuGCIDnxZ0=;
	b=UkVRBHlmKs6ogFHTb+NNPoMi47I8wPD6DcAa3USjyUJaTp2qUqCY7YF2ne1W5LlykJ3g
	 L1oUnZ1e3LpsIt0C6t26Nr81kZbLpC7Be5sIrWxxRfhCtgCsFixExt+rbahb3wkgOuytU
	 aFnh15HlB25eZ5HDf59K8yvbBbbnnqP8F8tiBXIQOo+xJ5aXfBQGneBEtld17XyQqjEiT
	 WeBPWgfeZlDJWmakkzFbO69GfPLnJE7Oi2/6BKNQ4rWpDXLFswP95/GUkqpcxZ/iq38xt
	 z7cisMWt4Mn69cbsQKjxYvYifM0pXlqABlZ6tqewqkxAWSzcnxA7i/JmEm8+clmKMFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ONRrkhm2;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754A3606A31B;
	Fri, 23 Oct 2026 13:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754A3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ONRrkhm2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792761324;
	bh=rwux77o1GhyryoO0gztA5gaRbZR09g3yJty7OuhiDJU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ONRrkhm2VFSrNY3s1AQ+91XArmvKeHEc4zj26k8VJa8vpBwuIZbA+NgTUowV1cSHQ
	 hj/5QvC6tcQJ7SySzBJheMy7MiN9ZSVYito/iR2znhjSjKLzUjQfBt+qgF8JZDfIPU
	 fqyWoMkjvBcjvrW47OXd/EtKQINnvOz4sdRPAKmjXekoR16aGDdukmd57sjaKUJqVz
	 HifUzTgJI6ALjIlIIRAAH8keVrV3qCRZMLElBhYsjAudbBHXdTbfXbKsiNk9sGSZTW
	 Kbu96DI6bW2DzQqhu9xfm+rSGqSOv+qXTisivLShIqYVJ95K89gAU0yYqnE+nSXDAQ
	 Ovw3PfyNMaTRQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 246F217E011B;
	Fri, 23 Oct 2026 15:15:23 +0200 (CEST)
Message-ID: <884a934883ee62444c4f9dc34c3d4d0afe1d2831.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Handle interrupts without a current
 context
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Alex Kazinsky <a.kazinsky@ideco.ru>, Detlev Casanova
	 <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Hans Verkuil
	 <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Date: Fri, 23 Oct 2026 09:15:21 -0400
In-Reply-To: <20261023131124.94116-1-a.kazinsky@ideco.ru>
References: <20261023131124.94116-1-a.kazinsky@ideco.ru>
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
	protocol="application/pgp-signature"; boundary="=-2Xx+Uh8xlyaOkQPPjVUs"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-2Xx+Uh8xlyaOkQPPjVUs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 23 octobre 2026 =C3=A0 17:11 +0400, Alex Kazinsky a =C3=A9crit=
=C2=A0:
> The watchdog can finish the current job before the threaded IRQ handler
> retrieves its context. In that case, v4l2_m2m_get_curr_priv() returns NUL=
L,
> but the variant IRQ handlers unconditionally dereference ctx->dev.
>=20
> Pass the device pointer to the variant IRQ handlers independently of the
> context. Clear the interrupt status and, for VDPU383, disable interrupts
> before returning if no current context exists. This avoids dereferencing
> NULL while still acknowledging the interrupt.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

Can you share you proof of concept please. Can be private if you plane to
produce a CVE report.

Nicolas

>=20
> Fixes: f9c7b7deeffd ("media: rkvdec: Support per-variant interrupt handle=
r")
> Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
> ---
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 23 +++++++++++++------
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |  4 +++-
>  2 files changed, 19 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 061281f903f3..02f6a574a8eb 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1434,15 +1434,18 @@ static void rkvdec_iommu_restore(struct rkvdec_de=
v *rkvdec)
>  	}
>  }
> =20
> -static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
> +static irqreturn_t rk3399_irq_handler(struct rkvdec_dev *rkvdec,
> +				    struct rkvdec_ctx *ctx)
>  {
> -	struct rkvdec_dev *rkvdec =3D ctx->dev;
>  	enum vb2_buffer_state state;
>  	u32 status;
> =20
>  	status =3D readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
>  	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
> =20
> +	if (!ctx)
> +		return IRQ_HANDLED;
> +
>  	if (status & RKVDEC_RDY_STA) {
>  		state =3D VB2_BUF_STATE_DONE;
>  	} else {
> @@ -1457,9 +1460,9 @@ static irqreturn_t rk3399_irq_handler(struct rkvdec=
_ctx *ctx)
>  	return IRQ_HANDLED;
>  }
> =20
> -static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
> +static irqreturn_t vdpu381_irq_handler(struct rkvdec_dev *rkvdec,
> +				    struct rkvdec_ctx *ctx)
>  {
> -	struct rkvdec_dev *rkvdec =3D ctx->dev;
>  	enum vb2_buffer_state state;
>  	bool need_reset =3D 0;
>  	u32 status;
> @@ -1467,6 +1470,9 @@ static irqreturn_t vdpu381_irq_handler(struct rkvde=
c_ctx *ctx)
>  	status =3D readl(rkvdec->regs + VDPU381_REG_STA_INT);
>  	writel(0, rkvdec->regs + VDPU381_REG_STA_INT);
> =20
> +	if (!ctx)
> +		return IRQ_HANDLED;
> +
>  	if (status & VDPU381_STA_INT_DEC_RDY_STA) {
>  		state =3D VB2_BUF_STATE_DONE;
>  	} else {
> @@ -1486,9 +1492,9 @@ static irqreturn_t vdpu381_irq_handler(struct rkvde=
c_ctx *ctx)
>  	return IRQ_HANDLED;
>  }
> =20
> -static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
> +static irqreturn_t vdpu383_irq_handler(struct rkvdec_dev *rkvdec,
> +				    struct rkvdec_ctx *ctx)
>  {
> -	struct rkvdec_dev *rkvdec =3D ctx->dev;
>  	enum vb2_buffer_state state;
>  	bool need_reset =3D 0;
>  	u32 status;
> @@ -1499,6 +1505,9 @@ static irqreturn_t vdpu383_irq_handler(struct rkvde=
c_ctx *ctx)
>  	writel(FIELD_PREP_WM16(VDPU383_INT_EN_IRQ | VDPU383_INT_EN_LINE_IRQ, 0)=
,
>  	       rkvdec->link + VDPU383_LINK_INT_EN);
> =20
> +	if (!ctx)
> +		return IRQ_HANDLED;
> +
>  	if (status & VDPU383_STA_INT_DEC_RDY_STA) {
>  		state =3D VB2_BUF_STATE_DONE;
>  	} else {
> @@ -1521,7 +1530,7 @@ static irqreturn_t rkvdec_irq_handler(int irq, void=
 *priv)
>  	struct rkvdec_ctx *ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
>  	const struct rkvdec_variant *variant =3D rkvdec->variant;
> =20
> -	return variant->ops->irq_handler(ctx);
> +	return variant->ops->irq_handler(rkvdec, ctx);
>  }
> =20
>  /*
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index a24be6638b6b..2e03ff6e33d7 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -30,6 +30,7 @@
>  #define RKVDEC_8K_PIXELS		(7680 * 4320)
> =20
>  struct rkvdec_ctx;
> +struct rkvdec_dev;
>  struct rkvdec_rcb_config;
> =20
>  struct rkvdec_ctrl_desc {
> @@ -72,7 +73,8 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>  }
> =20
>  struct rkvdec_variant_ops {
> -	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
> +	irqreturn_t (*irq_handler)(struct rkvdec_dev *rkvdec,
> +			   struct rkvdec_ctx *ctx);
>  	u32 (*colmv_size)(u16 width, u16 height);
>  	void (*flatten_matrices)(u8 *output, const u8 *input, int matrices, int=
 row_length);
>  };

--=-2Xx+Uh8xlyaOkQPPjVUs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCattd6QAKCRDZQZRRKWBy
9A63AQCzB1vOPXb+suCMJtgFXZ+FyF52FIA1oEvASku+5T9XhwEA2+XxwSKL6qQW
f2xjl5mboiTCt6Q3GwRAsVGr7FNmcgE=
=gi8E
-----END PGP SIGNATURE-----

--=-2Xx+Uh8xlyaOkQPPjVUs--
