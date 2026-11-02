Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651082;
	b=OyVKkAxgRfWsHJotplbjtAO0yUSJeVkB0bKAnuj71ZED+c8P2La/t1ndJ/s0JChrafzh
	 VCsR7eCGWXUOHaH8qKhvbRQ23e54664azOwDRLklZgBr9w0Qxo+RZjbEGFfOUm/SiuqLe
	 4y1VwW/DfHnO/X/nfpelCPRQvooushKQymIijxozke+THdQEXZ2xO/r6qMTAs5DZ6XTJ7
	 RHsN3VuJQ3/xevWsS+CY/RLyvaxAgVFVziSIQKkEnR2UVYupeC/HapVR3uLGg3OoLv/ae
	 ML3zMv2MRO4B4q07Kmo6Y3Jwa5BKYnhfkeygWOUSUbNgR0kGI79ms+o9hwhJ/62KQFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651082;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=4h/8w18/xpPZlTxUCAm+TEIkzoVo/DLq9acXzygbFO8=;
	b=gAOcr6VSBjXkdEQ62G1wAknR04bZ6vpCNLimU4EFbStryN4NAknPq9f2QzX/KcrhLLRd
	 9vLvT40IPXdu8p08Xo0vQQPmvK64OmnkcH4HgAO0gGKcD7+VxAXUg2mlHjTmaofkZa6Ae
	 1oJ8SucUIMPLPbWyRC40yduHyZpI1zNzU6toRBnKezF2epxCzilPJxrWMHPiMha68KZms
	 QyQYiObXdOtf+hV7yzBZYDKqQpq2VS9AxOriG1LmKfUeDTdoGaAaSA7cqyR0ZJ5DnAjU1
	 yr4yEOOr8Wlz4jj3GFrGuzDQdG0P0QxpodjBRaqniT8rXh2xozepyyjc8FRhJgaWVfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WyUfttul;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0379606A327;
	Mon,  2 Nov 2026 20:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0379606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WyUfttul
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793651080;
	bh=tVX8mJhuzNtfo9g/5xEXvDCmN2Z7jHKsxkBBxY8oQbc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WyUfttulTPJ6Fh/j01ngHsPwaeyxRpYcX1h5r33505gb6QOhWQN73dI/+uiO7ZJSw
	 cekbaMnqOpXdSjTN5+xp3wa4HPbYFtKML+7PmD72rzP3U23Mk05BSiZUtEMSdJcjiJ
	 aMCceWOusvrTKibrCcCNhAaJRd2WpXEkKKXkikRjDkaKt7JKUV+92mlV0/ezYvsVl6
	 9qGNvpA6jSRKumbeQqi2yihmYd84EPyyMBfor3ww1zg41xD0TJaVdmb7IsuomU3+XZ
	 O4aboVzd3m9tJqoN0qqTih+O3+4FbGOe6vL+N+4+QvA5aTI0hzf0Iynf845YmRSd/n
	 75KsPbxLsWJMw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 650FF17E0163;
	Mon, 02 Nov 2026 21:24:37 +0100 (CET)
Message-ID: <38f6a9abf37b06318bb6429ac04807941ca8d558.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] media: use dmaengine_desc_set_callback()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Frank.Li@oss.nxp.com, Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Jai Luthra
 <jai.luthra@linux.dev>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>,
 Frank Li <Frank.Li@nxp.com>,  Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jacopo Mondi	
 <jacopo.mondi@ideasonboard.com>, Vinod Koul <vkoul@kernel.org>, Xu Rao	
 <raoxu@uniontech.com>, "open list:DIGITEQ AUTOMOTIVE MGB4 V4L2 DRIVER"	
 <linux-media@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 "open list:MEDIA DRIVERS FOR RENESAS - DRIF"	
 <linux-renesas-soc@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	 <linux-arm-kernel@lists.infradead.org>
Cc: imx@lists.linux.dev
Date: Mon, 02 Nov 2026 15:24:35 -0500
In-Reply-To: <20261102194700.4076807-2-Frank.Li@oss.nxp.com>
References: <20261102194700.4076807-1-Frank.Li@oss.nxp.com>
	 <20261102194700.4076807-2-Frank.Li@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-7jvVIZb33Hw0whxJbkGg"
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


--=-7jvVIZb33Hw0whxJbkGg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

Le lundi 02 novembre 2026 =C3=A0 14:46 -0500, Frank.Li@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across media drivers.
>=20
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/pci/mgb4/mgb4_dma.c                     |  3 +--
>  drivers/media/platform/intel/pxa_camera.c             | 10 ++++++----
>  drivers/media/platform/m2m-deinterlace.c              |  3 +--
>  drivers/media/platform/renesas/rcar_drif.c            |  3 +--
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c |  6 ++----
>  drivers/media/platform/ti/omap/omap_vout_vrfb.c       |  3 +--
>  drivers/media/platform/ti/omap3isp/isphist.c          |  3 +--
>  drivers/media/platform/xilinx/xilinx-dma.c            |  3 +--

Sorry for the inconvenience here, but there is no single maintainer that ca=
n
provide an Rb here, you have to split these.

Nicolas

>  8 files changed, 14 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/pci/mgb4/mgb4_dma.c b/drivers/media/pci/mgb4/m=
gb4_dma.c
> index cae888e6504b0..c9a15c625be65 100644
> --- a/drivers/media/pci/mgb4/mgb4_dma.c
> +++ b/drivers/media/pci/mgb4/mgb4_dma.c
> @@ -55,8 +55,7 @@ int mgb4_dma_transfer(struct mgb4_dev *mgbdev, u32 chan=
nel, bool write,
>  		return -EIO;
>  	}
> =20
> -	tx->callback =3D chan_irq;
> -	tx->callback_param =3D chan;
> +	dmaengine_desc_set_callback(tx, chan_irq, NULL, chan);
> =20
>  	ret =3D dma_submit_error(dmaengine_submit(tx));
>  	if (ret) {
> diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/pl=
atform/intel/pxa_camera.c
> index 9e1fdd963b559..c9d57e4245181 100644
> --- a/drivers/media/platform/intel/pxa_camera.c
> +++ b/drivers/media/platform/intel/pxa_camera.c
> @@ -832,16 +832,18 @@ static int pxa_init_dma_channel(struct pxa_camera_d=
ev *pcdev,
>  		goto fail;
>  	}
> =20
> -	tx->callback_param =3D pcdev;
>  	switch (channel) {
>  	case 0:
> -		tx->callback =3D pxa_camera_dma_irq_y;
> +		dmaengine_desc_set_callback(tx, pxa_camera_dma_irq_y, NULL,
> +					    pcdev);
>  		break;
>  	case 1:
> -		tx->callback =3D pxa_camera_dma_irq_u;
> +		dmaengine_desc_set_callback(tx, pxa_camera_dma_irq_u, NULL,
> +					    pcdev);
>  		break;
>  	case 2:
> -		tx->callback =3D pxa_camera_dma_irq_v;
> +		dmaengine_desc_set_callback(tx, pxa_camera_dma_irq_v, NULL,
> +					    pcdev);
>  		break;
>  	}
> =20
> diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/pla=
tform/m2m-deinterlace.c
> index 6b07018614894..142b69eab47fe 100644
> --- a/drivers/media/platform/m2m-deinterlace.c
> +++ b/drivers/media/platform/m2m-deinterlace.c
> @@ -336,8 +336,7 @@ static void deinterlace_issue_dma(struct deinterlace_=
ctx *ctx, int op,
>  	}
> =20
>  	if (do_callback) {
> -		tx->callback =3D dma_callback;
> -		tx->callback_param =3D ctx;
> +		dmaengine_desc_set_callback(tx, dma_callback, NULL, ctx);
>  	}
> =20
>  	ctx->cookie =3D dmaengine_submit(tx);
> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/p=
latform/renesas/rcar_drif.c
> index bd67e8e16f537..1e8cf71b52cae 100644
> --- a/drivers/media/platform/renesas/rcar_drif.c
> +++ b/drivers/media/platform/renesas/rcar_drif.c
> @@ -610,8 +610,7 @@ static int rcar_drif_qbuf(struct rcar_drif *ch)
>  	}
> =20
>  	/* Submit descriptor */
> -	rxd->callback =3D rcar_drif_dma_complete;
> -	rxd->callback_param =3D ch;
> +	dmaengine_desc_set_callback(rxd, rcar_drif_dma_complete, NULL, ch);
>  	cookie =3D dmaengine_submit(rxd);
>  	if (dma_submit_error(cookie)) {
>  		rdrif_err(sdr, "ch%u: dma submit failed\n", ch->num);
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 022ea3d616c9e..998423fa2f330 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -692,8 +692,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *=
ctx)
>  		goto out;
>  	}
> =20
> -	desc->callback =3D ti_csi2rx_drain_callback;
> -	desc->callback_param =3D ctx;
> +	dmaengine_desc_set_callback(desc, ti_csi2rx_drain_callback, NULL, ctx);
> =20
>  	cookie =3D dmaengine_submit(desc);
>  	ret =3D dma_submit_error(cookie);
> @@ -782,8 +781,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *=
ctx,
>  	if (!desc)
>  		return -EIO;
> =20
> -	desc->callback =3D ti_csi2rx_dma_callback;
> -	desc->callback_param =3D buf;
> +	dmaengine_desc_set_callback(desc, ti_csi2rx_dma_callback, NULL, buf);
> =20
>  	cookie =3D dmaengine_submit(desc);
>  	ret =3D dma_submit_error(cookie);
> diff --git a/drivers/media/platform/ti/omap/omap_vout_vrfb.c b/drivers/me=
dia/platform/ti/omap/omap_vout_vrfb.c
> index 0cfa0169875f0..006a4ae45a232 100644
> --- a/drivers/media/platform/ti/omap/omap_vout_vrfb.c
> +++ b/drivers/media/platform/ti/omap/omap_vout_vrfb.c
> @@ -273,8 +273,7 @@ int omap_vout_prepare_vrfb(struct omap_vout_device *v=
out,
>  		return -EINVAL;
>  	}
> =20
> -	tx->callback =3D omap_vout_vrfb_dma_tx_callback;
> -	tx->callback_param =3D &vout->vrfb_dma_tx;
> +	dmaengine_desc_set_callback(tx, omap_vout_vrfb_dma_tx_callback, NULL, &=
vout->vrfb_dma_tx);
> =20
>  	cookie =3D dmaengine_submit(tx);
>  	if (dma_submit_error(cookie)) {
> diff --git a/drivers/media/platform/ti/omap3isp/isphist.c b/drivers/media=
/platform/ti/omap3isp/isphist.c
> index dc02f240ee89a..281bd0e3748e9 100644
> --- a/drivers/media/platform/ti/omap3isp/isphist.c
> +++ b/drivers/media/platform/ti/omap3isp/isphist.c
> @@ -209,8 +209,7 @@ static int hist_buf_dma(struct ispstat *hist)
>  		goto error;
>  	}
> =20
> -	tx->callback =3D hist_dma_cb;
> -	tx->callback_param =3D hist;
> +	dmaengine_desc_set_callback(tx, hist_dma_cb, NULL, hist);
>  	cookie =3D dmaengine_submit(tx);
>  	if (dma_submit_error(cookie)) {
>  		dev_dbg(hist->isp->dev, "hist: DMA submission failed\n");
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/p=
latform/xilinx/xilinx-dma.c
> index fcfe0883aba5f..ece2116639fc0 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -358,8 +358,7 @@ static void xvip_dma_buffer_queue(struct vb2_buffer *=
vb)
>  		vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_ERROR);
>  		return;
>  	}
> -	desc->callback =3D xvip_dma_complete;
> -	desc->callback_param =3D buf;
> +	dmaengine_desc_set_callback(desc, xvip_dma_complete, NULL, buf);
> =20
>  	spin_lock_irq(&dma->queued_lock);
>  	list_add_tail(&buf->queue, &dma->queued_bufs);

--=-7jvVIZb33Hw0whxJbkGg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujxgwAKCRDZQZRRKWBy
9L/MAP9nKDPd2CiiHevwzf9G9VZmZWWZ7YTIS8NSinPStG4lhQEA0DmVenStYpyu
a6JwIBbvN1s2fcRVL2D2jJxqRsQ4bAs=
=OQi2
-----END PGP SIGNATURE-----

--=-7jvVIZb33Hw0whxJbkGg--
