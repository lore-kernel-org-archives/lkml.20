Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836994;
	b=RufsDkEhduW5oXY9BCOEH5i169Njfb0OwtVCus7KoaVB4ZxAX8WsP87gut6H8Ynfj0Nn
	 6Ap5MJw4G1Vwu3kELQOIQpzmmKFnH4MPahRhVDvsP/NAbSKJ7/gNBYhF0R663tP4RiSe7
	 MBvkr9j77ccXGw267JLtTwchxe7YGtns1rLf4LRwIBrt0gCi+Fkxl+ztwnMk4Qw5X5n2o
	 dgYmEcER7P2RhUnc/KwD7BHLcl9aDZFoAtnQX8l7MPhWD33prEXdPNHQYuSA/EOaJh+Q5
	 ozjBmHH8cjrUFo79esvztIsgi2o69vLiuyJxrfSFhunA8PHLTqlkZX6150t7gU0T2TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836994;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Autocrypt:Organization:Content-Type:User-Agent:
	 MIME-Version;
	bh=y2ufclYMSczQ8+k1rs6xWHBnqZazoATcDX8gGJ1J/W8=;
	b=zw3Veevzr1XL3Bi1Wun6iLaq5UUK+KekaEGwsbXp7uzJo/LdGbfhx69i6YHiiRC95l/T
	 HdjU3mMuErPEJ9MIVSKBzdikcNaq0BWJKn9ok8fOT1JQPUYPi1Ad8fsage/yFoIKZ62QB
	 gllu+uWhwsdQ19PIc6JuODIRXVWGicM3GNiDh+XAJtT5lKQHzTFZ0lkfte9RaHtl755TK
	 h3xp13Ss5PwAL9vziC3TIXZdxA1iYMelJhBXn6za/YOC1UINj4Em3xqScARyf8wr0WcyZ
	 TOF744Lh9knKHv04Cu4YRCN3hgdlgc2bkH/8aeBIm4TNWTH1AYlweHrFmIjqRFJqvfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jIIztKjp;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867B8606A885;
	Mon, 16 Nov 2026 13:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 867B8606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jIIztKjp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794836988;
	bh=T/KA0zquQYjz4iSbAGPA8HM3AK6G68SZSye9Jt9rIi8=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=jIIztKjp7qsh0k4sycHWurMlzw0zllvgCsiJR10ci6TCn5+fivlamDIoNKA7n5pL6
	 qHFqKX/ZuEi9hEZ/aTeVZO/andt0kawDI5OEgtw0qsOmGLVDHdX87iLiI5iUoF9O90
	 YT8065WvGwhfB7d5rLqiIFC/aghkbSEXN8cdMcydmUoVok2oAK9SQ/BftIIaYAH6SM
	 XdFNf+hJ5K683V33h5Mro0V455GQ8GLuXJEsg3d6b9ZZtN1+1d3nwChObCTunIT5xE
	 8u1tj9lg7X7nccxF283nZP6Hs4pZ1Ymqu/0XuHmZYySFshCXaHdFQ/h8Sz9+aZoFAj
	 63QILeEcu05zA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D95E817E0060;
	Mon, 16 Nov 2026 14:49:46 +0100 (CET)
Message-ID: <6ae6d1101d3f7095d11462579a5a3313153533e6.camel@collabora.com>
Subject: Re: [PATCH 3/7] media: rkvdec: hevc: bound the RPS reads by the
 control size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Daniel Golle <daniel@makrotopia.org>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Alex Bee	
 <knaerzche@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas
 Karlman	 <jonas@kwiboo.se>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 08:49:44 -0500
In-Reply-To: <bb9c44d0f56221874b105394169e5c377ef21b42.1794645268.git.daniel@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
	 <bb9c44d0f56221874b105394169e5c377ef21b42.1794645268.git.daniel@makrotopia.org>
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
	protocol="application/pgp-signature"; boundary="=-Ioy9snckrmchYqHS9sCx"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-Ioy9snckrmchYqHS9sCx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 14 novembre 2026 =C3=A0 10:22 +0000, Daniel Golle a =C3=A9crit=C2=
=A0:
> The RPS helpers read num_short_term_ref_pic_sets elements of the
> EXT_SPS_ST_RPS control and num_long_term_ref_pics_sps elements of the
> EXT_SPS_LT_RPS control, however many elements userspace passed.
>=20

What did you want to say?

> Beyond
> the passed elements they read stale entries of the control's array,
> and past its allocation once the SPS counts more sets than the control

More broken text, can you work a bit on your messages, be concise, precise,
don't get into details but into the understanding of what you are achieving=
. The
code is precise enough.

> has ever held, as the control framework sizes a dynamic array for the
> largest element count it has seen. The short-term sets read from there
> are unchecked, and a num_negative_pics or num_positive_pics above 16
> overflows the calculated sets, the stack arrays of
> st_ref_pic_set_prediction() and the hardware RPS table.
>=20
> A userspace V4L2 client that can open the RKVDEC m2m decoder can set an
> SPS whose counts exceed the number of elements it passed in these
> controls, so the reads run past the allocation.
>=20
> Use the controls only when they hold at least as many elements as the
> SPS counts, and treat them as not set otherwise in both back ends.
>=20
> Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 var=
iant")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../platform/rockchip/rkvdec/rkvdec-hevc-common.c    | 12 ++++++------
>  .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c   |  4 ++--
>  .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c   |  4 ++--
>  3 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> index c249e3f16f42c..797a16517ed59 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> @@ -448,18 +448,18 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ct=
x,
>  =09=09=09      V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
>  =09run->scaling_matrix =3D ctrl ? ctrl->p_cur.p : NULL;
> =20
> +=09run->ext_sps_st_rps =3D NULL;
>  =09if (ctx->has_sps_st_rps) {
>  =09=09ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
>  =09=09=09=09      V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS);
> -=09=09run->ext_sps_st_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> -=09} else {
> -=09=09run->ext_sps_st_rps =3D NULL;
> +=09=09if (ctrl && ctrl->elems >=3D run->sps->num_short_term_ref_pic_sets=
)
> +=09=09=09run->ext_sps_st_rps =3D ctrl->p_cur.p;
>  =09}
> +=09run->ext_sps_lt_rps =3D NULL;
>  =09if (ctx->has_sps_lt_rps) {
>  =09=09ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
>  =09=09=09=09      V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS);
> -=09=09run->ext_sps_lt_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> -=09} else {
> -=09=09run->ext_sps_lt_rps =3D NULL;
> +=09=09if (ctrl && ctrl->elems >=3D run->sps->num_long_term_ref_pics_sps)
> +=09=09=09run->ext_sps_lt_rps =3D ctrl->p_cur.p;

So you are saying that if the passed array is too short, we should use an o=
lder
entry to none? That seems a little strange, what about up-front rejecting b=
ad
entries?

Nicolas

>  =09}
>  }
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> index e1936e87f45be..fea7ff48c0dce 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> @@ -604,8 +604,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  =09 * On vdpu381, not setting the long and short term ref sets will just=
 output wrong frames.
>  =09 * Let's just warn about it and let the decoder run anyway.
>  =09 */
> -=09if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
> -=09    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
> +=09if ((!run.ext_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
> +=09    (!run.ext_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
>  =09=09dev_warn_ratelimited(rkvdec->dev, "Long and short term RPS not set=
\n");
>  =09} else {
>  =09=09rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> index e9d8b590f0d58..c409d21c08598 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> @@ -550,8 +550,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>  =09 * To be on the safe side for this new v4l2 control, write an error i=
n the log and mark
>  =09 * the buffer as failed by returning an error here.
>  =09 */
> -=09if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
> -=09    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
> +=09if ((!run.ext_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
> +=09    (!run.ext_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
>  =09=09dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\=
n");
>  =09=09rkvdec_run_postamble(ctx, &run.base);
>  =09=09return -EINVAL;

--=-Ioy9snckrmchYqHS9sCx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavsJ+AAKCRDZQZRRKWBy
9Lp5AQDabVmgQhKQqiJ2SuAz1GAtdY4z9yHKyf0Jw5tn3moOcAD+JM9RgI+HN8Ly
b8n046UalkdSLleSXjXadP47iIIlKgk=
=ms2T
-----END PGP SIGNATURE-----

--=-Ioy9snckrmchYqHS9sCx--
