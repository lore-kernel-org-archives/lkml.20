Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219231;
	b=xAq1No/C8hLVZ+IGVLdsKLJDWF+Wzq1Eqyd7ejHjEoCuCm5Q/MRQBmjnD0aURG3lfBEO
	 d9Nk3dcZqeXsYMHuDgvlmDl2ssB+ugPSNrOP7RxTtsBj4O1yLDEQMgoZLrNjZbAw8g4Zg
	 nMeCuAJlW2KAjY6EFGlU1Bp9Yt97fEAoZXvtmhlhsT4j2szbo0445Mqs1O4vQB55n8kMp
	 +pL2DIqw9O4cFQ6sljiOvhRzAZ9KhPC1gudaEdcOfGH4qfXxe8kZuJVQzX6qxpyNuNkqA
	 C6GQjT4wA0OOnetK7obqJTxIwrxmgLkYFVP3s2/ASQluZXABCkJQ2d618V6jRhLK28Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219231;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=ltjvUYj58XRYoUUDqDDbmB6ViXKYaAFieLJE8FLBXVc=;
	b=IcjRWxeWhLSvEb8whbn4daBmg/toALITb9lCEt/xQRDlQKDzTm4Ujok6BlI5i22XrINR
	 fMOBNkEqebw+w4yaVKEdUf5sE3Gd5N/N7oJkiYKXtVcpjFCcEeAstoeytwSt38KqcN1io
	 jEb5sTF3VzGZ8Y4DBSOayH4C716Ha7+wT6QMOWk43L0jMSemDYTfcZxet3E2p8/askaF/
	 igM0sHvqUN0CAA2gmnPjw2hDAMMf2aVvlkQ0sggUXJJDa2gacTOJtU94KHlqk802sIYXA
	 i4s3uwXE0XjLEmZ4F4yiP05snPtmaJIqZ/Vz4Zz2MaXZh/thmu88YIyn7l1kFV/nD/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=O4TqPvgs;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F18606A31A;
	Wed, 28 Oct 2026 20:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13F18606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=O4TqPvgs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793219223;
	bh=p1IE/DlZrAqu5FN95lXdgFSXQVz+G7vqZ67fMoLW+vQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=O4TqPvgsoxvDDpBs0O3rj3nK0nVYaHIqJd8W1c59A7tk95o5lUcx83zZTJRm8zSJV
	 VYyODDH1udtlwCPzuxc6UZUZTUQWypocd7iR7eUjV7M1heWP5bbyX9ijxWZxVXSLam
	 PXvGP1cqGLFZiGlPhrgyYKbMWgqIUN/xm8JR5FjTHvz/P8hbgYrC1OiP7XqAYm/1Fs
	 I2dChoV31xjfhuvapgOpdhCXOGJlHC9ztiQUiDYbh1CDCxpzrYKWxlcVcpMrWVVn3H
	 9n4b/l6uA90wSf8cpJBy9X4NTF8cWf8QorcX8ftRqMDz3SarNKWRuXb6bxi9zZqovv
	 uIANKLvREUzAw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71EE117E03FF;
	Wed, 28 Oct 2026 21:27:01 +0100 (CET)
Message-ID: <b3e4f381bd1d4b921703f7b9e7452a49842d1176.camel@collabora.com>
Subject: Re: [PATCH v2] media: rkvdec: Handle interrupts without a current
 context
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Alex Kazinsky <a.kazinsky@ideco.ru>, Detlev Casanova
	 <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Hans Verkuil
	 <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Date: Wed, 28 Oct 2026 16:26:59 -0400
In-Reply-To: <20261026124808.642373-1-a.kazinsky@ideco.ru>
References: <20261026124808.642373-1-a.kazinsky@ideco.ru>
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
	protocol="application/pgp-signature"; boundary="=-U62r30hsm7WM+5WWV9F0"
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


--=-U62r30hsm7WM+5WWV9F0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 26 octobre 2026 =C3=A0 16:48 +0400, Alex Kazinsky a =C3=A9crit=C2=
=A0:
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
>=20
> Fixes: f9c7b7deeffd ("media: rkvdec: Support per-variant interrupt handle=
r")
> Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
> ---
> Link to v1: https://lore.kernel.org/all/20261023131124.94116-1-a.kazinsky=
@ideco.ru/
>=20
> This issue has not been reproduced on hardware. The watchdog/IRQ race
> described above is based on code analysis.
>=20
> A possible test would be to submit a single decoding job and temporarily
> delay the IRQ thread before v4l2_m2m_get_curr_priv() for longer than the
> watchdog timeout. This would artificially widen the suspected race window=
.
> This experiment has not been performed.

Ack. I've studied Hantro and why it does not need all your suggested defens=
ive
coding, details delow.

>=20
> Changes in v2:
> - Fix continuation-line alignment in the IRQ handler declarations.
> - Clarify that the issue has not been reproduced on hardware and
>   describe a possible test.
>=20
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 23 +++++++++++++------
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |  4 +++-
>  2 files changed, 19 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 061281f903f3..da4ed7bde05c 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1434,15 +1434,18 @@ static void rkvdec_iommu_restore(struct rkvdec_de=
v *rkvdec)
>  	}
>  }
> =20
> -static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
> +static irqreturn_t rk3399_irq_handler(struct rkvdec_dev *rkvdec,
> +				      struct rkvdec_ctx *ctx)
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

The IRQ lifetime is bound to the dev, so it fine to continue further.

>  	if (status & RKVDEC_RDY_STA) {
>  		state =3D VB2_BUF_STATE_DONE;
>  	} else {

What is not in the patch context here is:

	if (cancel_delayed_work(&rkvdec->watchdog_work))
		rkvdec_job_finish(ctx, state);

ctx will exist if the watchdog was cancelled, this is pretty much guarantie=
d, so
the null-check-return is not needed. It does not invalidate your report tho=
ugh,
since we get the dev from the ctx, which can be dead. More instructions bel=
ow
....

> @@ -1457,9 +1460,9 @@ static irqreturn_t rk3399_irq_handler(struct rkvdec=
_ctx *ctx)
>  	return IRQ_HANDLED;
>  }
> =20
> -static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
> +static irqreturn_t vdpu381_irq_handler(struct rkvdec_dev *rkvdec,
> +				       struct rkvdec_ctx *ctx)
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
> +				       struct rkvdec_ctx *ctx)
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
> index a24be6638b6b..8bcb51db5105 100644
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
> +				   struct rkvdec_ctx *ctx);

What I'd do is only pass rkvdec_dev, which has a lifetime bound to the IRQ
handler. Then inside rkvdec_job_finish(), retrieve the CTX with:

	struct rkvdec_ctx *ctx =3D v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);

This will match what we do in Hantro driver, and should be safe, with less
defensive coding. In short, the ctx lifetime is bound to the m2m job, at le=
ast
it should, if not, we have another bug to fix.

Nicolas

>  	u32 (*colmv_size)(u16 width, u16 height);
>  	void (*flatten_matrices)(u8 *output, const u8 *input, int matrices, int=
 row_length);
>  };

--=-U62r30hsm7WM+5WWV9F0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauJakwAKCRDZQZRRKWBy
9EjoAP41bNowZoEb/VnojODYDTIsxzEfvrOltzzab1mB9My5NwD/eeBBPWjY8orA
PYnTpI7TaC9alCzPsSiV0l1Ss0hF2gY=
=FyAF
-----END PGP SIGNATURE-----

--=-U62r30hsm7WM+5WWV9F0--
