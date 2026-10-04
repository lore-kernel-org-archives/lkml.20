Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF335F161;
	Sun,  4 Oct 2026 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791112933; cv=none; b=r+/hUaaTkQTzHN8NVg0HJkIvfnwyie08B+gfwr/gAAUaKGNUzNflEJH8fH1+kJWu4XyHwWJFac02OiJPa2Q8hb4MTVfvtcNw+2PZ7jErUlDxXA4S8LkDcQwavEUaQcc7yLFi6yb/OZAu2/wLaQXSia5ypDlN2LvkngO/MtOqt0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791112933; c=relaxed/simple;
	bh=EUT8CXIEWEuHtdvb/fdhF3SZ+ZMOpvpJA9++C1bf6hE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E/zHmRPK9eCoTepIDONpvzUkXY4qudd1ziUlyhx0KwPGoaczFtEdyBuZ6PKN5cwEOjlDy/kI8KzY/6cE0b/l3IguM0yNtITE1IDGoGHoviYIRDWKhLsV/ntYZ0yFL7MATiPfFS/z8HciBoKn3290DFoCq/Bg0+Lzk3MiT+EpGhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AMY6xSEO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AMY6xSEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791112929;
	bh=EUT8CXIEWEuHtdvb/fdhF3SZ+ZMOpvpJA9++C1bf6hE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AMY6xSEOpZRFPRHEl0wmIwaFVCtWyZB+yKXGiRixSnlwO4RnxbiVH28BdCBFj30n2
	 qzHhE9vXQN/ErfgSCtf3AMACsF3vIjAZBkJpdUAVaKhO6iUUEbH/Pv9p6nyDuWI04B
	 s0rAQKJ9ZRNSK6OwuyXgPtaz1yFqoeqXZhbZ3zkX2mcs+ifiEV+zU9tCXXSQ7rizbX
	 ktZhTSul6N1DsRu07hXf2pr8Qg0Y9o1lA1wNYlY52Y6jF2HpAlXJkh+3ujr9CZp6UC
	 rQbDtPAlg9xIYj2dqqLbrUnmum69F1ppPYHCb65V35D2Xg+QQAuooCaFsXys69bjSj
	 LadNIlr0sqbYQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2375917E0163;
	Sun, 04 Oct 2026 13:22:09 +0200 (CEST)
Message-ID: <d341e911ddf0831b79a713ae7694d2e4396eeb38.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: rockchip: Fix leaks in init
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Frank Li <Frank.li@oss.nxp.com>, Michail Tatas <michail.tatas@gmail.com>
Cc: benjamin.gaignard@collabora.com, p.zabel@pengutronix.de,
 mchehab@kernel.org, 	heiko@sntech.de, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sun, 04 Oct 2026 07:22:08 -0400
In-Reply-To: <aohrmDgzhRxC6M_D@SMW015318>
References: <aoV3LLy5hSoKL4QP@michalis-linux>
	 <aoXgSKnkbWZVKRui@lizhi-Precision-Tower-5810>
	 <aodup3TleCfdxcF3@michalis-linux> <aohrmDgzhRxC6M_D@SMW015318>
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
	protocol="application/pgp-signature"; boundary="=-syfNJk6+Iel5b9W+gI0r"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-syfNJk6+Iel5b9W+gI0r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 21 ao=C3=BBt 2026 =C3=A0 10:15 -0500, Frank Li a =C3=A9crit=C2=
=A0:
> On Fri, Aug 21, 2026 at 12:16:23AM +0300, Michail Tatas wrote:
> > On Wed, Aug 19, 2026 at 12:56:40PM -0400, Frank Li wrote:
> > > On Wed, Aug 19, 2026 at 12:28:12PM +0300, Michail Tatas wrote:
> > > > if one of the dma_alloc_coherent in the init fucntion fails then
> > > > the previously allocated ones leak.
> > > >=20
> > > > Fix by freeing them in the error path.
> > > >=20
> > > > Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder"=
)
> > > > Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
> > > > ---
> > > >  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 68 +++++++++++++++=
----
> > > >  1 file changed, 55 insertions(+), 13 deletions(-)
> > > >=20
> > > > diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_=
av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > > > index e4e21ad37323..fa77fd402412 100644
> > > > --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec=
.c
> > > > +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec=
.c
> > > > @@ -369,6 +369,7 @@ void rockchip_vpu981_av1_dec_exit(struct hantro=
_ctx *ctx)
> > > >=20
> > > >  int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
> > > >  {
> > > > +	int ret =3D 0;
> > > >  	struct hantro_dev *vpu =3D ctx->dev;
> > > >  	struct hantro_av1_dec_hw_ctx *av1_dec =3D &ctx->av1_dec;
> > > >=20
> > > > @@ -377,39 +378,54 @@ int rockchip_vpu981_av1_dec_init(struct hantr=
o_ctx *ctx)
> > > >  	av1_dec->global_model.cpu =3D dma_alloc_coherent(vpu->dev, GLOBAL=
_MODEL_SIZE,
> > > >  						       &av1_dec->global_model.dma,
> > > >  						       GFP_KERNEL);
> > > > -	if (!av1_dec->global_model.cpu)
> > > > -		return -ENOMEM;
> > > > +	if (!av1_dec->global_model.cpu) {
> > > > +		ret =3D -ENOMEM;
> > > > +		goto global_model_cpu_err;
> > > > +	}
> > > > +
> > > >  	av1_dec->global_model.size =3D GLOBAL_MODEL_SIZE;
> > > >=20
> > > >  	av1_dec->tile_info.cpu =3D dma_alloc_coherent(vpu->dev, AV1_TILE_=
INFO_SIZE,
> > > >  						    &av1_dec->tile_info.dma,
> > > >  						    GFP_KERNEL);
> > > > -	if (!av1_dec->tile_info.cpu)
> > > > -		return -ENOMEM;
> > > > +	if (!av1_dec->tile_info.cpu) {
> > > > +		ret =3D -ENOMEM;
> > > > +		goto tile_info_cpu_err;
> > > > +	}
> > > > +
> > >=20
> > > This function is called by hantro_probe() if I am correct
> > >=20
> > > there are dmam_alloc_coherent(), use dmam_alloc_coherent() will simpl=
e
> > > error handle and tear down.
> > >=20
> > > Frank
> >=20
> > Hello Frank,
> >=20
> > I did not know about the dmam* functions thanks for letting me know.
> > I read some of the docs about them and they seem to not apply to
> > this particular case since this code is not called from the probe
> > function but rather the hantro_start_streaming function. Since
> > dmam_alloc_coherent() only releases memory at device removal,
> > it wouldn't free them when the stream ends and a new stream would
> > re-allocate while the old buffers lingered until detach.
> > So I think manual dma_free_coherent() error path is the correct
> > fit here.
>=20
> Okay, make sense.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, ty, and thanks for the review!

>=20
> Frank
>=20
> >=20
> > Best regards,
> > Michail
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=-syfNJk6+Iel5b9W+gI0r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasI24AAKCRDZQZRRKWBy
9MzeAPwLTlwz3JuuObmxyg+u4105o43JLe4Bob4ey9dS0EJDawEA6+5DtSs8KzMp
H7ZnsmemjvkbNZPbk1eEqzItk5JtOg0=
=RPVc
-----END PGP SIGNATURE-----

--=-syfNJk6+Iel5b9W+gI0r--
