Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4A914F70;
	Mon, 28 Sep 2026 20:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628691; cv=none; b=bXsJi31EAv0AUUIR4Ki72Zdz8YPwAY2DPBxZqkhdNfCQvv2/h0e1VpxTUlsb0mxhleh/kNW2Gu/Twz+mg8jlU+5ZqntykitjFbQlMx+ntoJaEpFLg+kuPbnK3d6HmZWexurRwH/vocY7DCKHvyzFnWF+wKEmRVljYDP2GxOD2dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628691; c=relaxed/simple;
	bh=HcyHPIiOyBZkiy+sc6OPimTzrLV8TN+Fvr0ebe0MhWg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KzHS3DpB9hdfZ9WbIHVSEKpLNggkZQxZRs9uQ5lSZYS7WNdcVkYlsA5Lb+x/tylz0f3mN4o9u3AZq7kYgOOc7TN2PiiPUcmT40BTac6s9mk8FsQsYHlVBgU8BuKNB5dPeof5Ec/DMvYgn5fCRC9FeWOWCD9iEaDO/C98PGQMKXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cexoM8G8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cexoM8G8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790628688;
	bh=HcyHPIiOyBZkiy+sc6OPimTzrLV8TN+Fvr0ebe0MhWg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cexoM8G8BhliZ5Dr9PeDw601OTs6/fxP9Mzz5lfdvj5hjHa2/grTBkEgHxNz29Lpx
	 JbWEc+MPUmK/dmYkHhHKOB9yTfnpwREbYwqAlQgUikvesO3kstSOSTI9lCu44g9T9r
	 gA63Q8qlJ/IKpsdPio4t1TD27K2SiHugFXhlY/6cTDl/J60m62iaSvXqVyH4wmMZYW
	 Z0dJhvhxHRdKEtJTc3UMoLBdd521DcgGqa5HZaAnRPxnce7QKOCGvCJqJGkckSmBsk
	 JWN4IoroqIkkzIoSBGNNk9KVqLZjmUa7ZUeY30sE+vExHKDvQBitjx664mOfDCb6ST
	 fH36ld02FNAIg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C965F17E006F;
	Mon, 28 Sep 2026 22:51:26 +0200 (CEST)
Message-ID: <c1a5c4b339077cb6ecb0e7727eabdc2039fdfb03.camel@collabora.com>
Subject: Re: [PATCH v2] media: v4l2-ctrls: validate AV1 ref_frame_idx and
 primary_ref_frame
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>, hverkuil@kernel.org, mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	detlev.casanova@collabora.com, kees@kernel.org,
 michael.bommarito@gmail.com, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 16:51:25 -0400
In-Reply-To: <20260709131211.44425-1-doruk@0sec.ai>
References: <20260709131211.44425-1-doruk@0sec.ai>
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
	protocol="application/pgp-signature"; boundary="=-oYN2ZyRHmX5ZnXRpMqxM"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-oYN2ZyRHmX5ZnXRpMqxM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 09 juillet 2026 =C3=A0 15:12 +0200, Doruk Tan Ozturk a =C3=A9crit=
=C2=A0:
> The stateless AV1 frame control V4L2_CID_STATELESS_AV1_FRAME carries
> ref_frame_idx[V4L2_AV1_REFS_PER_FRAME] (signed, -128..127) and
> primary_ref_frame (__u8), both copied from userspace. validate_av1_frame(=
)
> already checks flags, quantization, segmentation, loop filter, CDEF, loop
> restoration and superres, but never bounds these reference indices.
>=20
> Decoders use them directly as array subscripts. In the MediaTek decoder
> vdec_av1_slice_setup_ref() does:
>=20
> 	int ref_idx =3D ctrl_fh->ref_frame_idx[i];
> 	pfc->ref_idx[i] =3D ctrl_fh->reference_frame_ts[ref_idx];
> 	slot_id =3D frame->ref_frame_map[ref_idx];
>=20
> indexing reference_frame_ts[8] and ref_frame_map[8] with an attacker
> controlled signed value. In the Rockchip/verisilicon decoder the CDF setu=
p
> does:
>=20
> 	rockchip_av1_get_cdfs(ctx,
> 		frame->ref_frame_idx[frame->primary_ref_frame]);
>=20
> indexing ref_frame_idx[7] with the unbounded primary_ref_frame. Both are
> out-of-bounds reads driven by unvalidated userspace input.
>=20
> Validate in the core, like the other AV1 frame fields, so every decoder i=
s
> covered: reject ref_frame_idx entries outside
> [0, V4L2_AV1_TOTAL_REFS_PER_FRAME) and primary_ref_frame >=3D
> V4L2_AV1_TOTAL_REFS_PER_FRAME. The upper bound still permits the value 7
> (PRIMARY_REF_NONE), which decoders handle explicitly.
>=20
> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> Found by static analysis; not yet runtime-reproduced (Rockchip/MediaTek S=
oC
> hardware required).
>=20
> Fixes: 9de30f579980 ("media: Add AV1 uAPI")
> Assisted-by: 0sec:claude-opus-4.8
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> ---
> v2: wrap a quoted decoder line in the commit message to satisfy checkpatc=
h
>     (<=3D75 cols); no code change from v1.
> v1: https://lore.kernel.org/linux-media/20260628134105.21001-1-doruk@0sec=
.ai/
>=20
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index ba047d7d8601..5096c48ea402 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -793,6 +793,7 @@ static int validate_av1_film_grain(struct v4l2_ctrl_a=
v1_film_grain *fg)
>  static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
>  {
>  	int ret =3D 0;
> +	u32 i;
> =20
>  	ret =3D validate_av1_quantization(&f->quantization);
>  	if (ret)
> @@ -836,6 +837,14 @@ static int validate_av1_frame(struct v4l2_ctrl_av1_f=
rame *f)
>  	if (f->superres_denom > GENMASK(2, 0) + 9)
>  		return -EINVAL;
> =20
> +	for (i =3D 0; i < ARRAY_SIZE(f->ref_frame_idx); i++)
> +		if (f->ref_frame_idx[i] < 0 ||
> +		    f->ref_frame_idx[i] >=3D V4L2_AV1_TOTAL_REFS_PER_FRAME)
> +			return -EINVAL;

This is likely a breaking changes, and since you didn't test it I'm being v=
ery
cautious. Through code inspection, I see that GStreamer will fill the
ref_frame_idx to value -1 when reference is unused. This happens notably on
every keyframe.

> +
> +	if (f->primary_ref_frame >=3D V4L2_AV1_TOTAL_REFS_PER_FRAME)
> +		return -EINVAL;

As per spec, this shouldn't be bigger then AV1_PRIMARY_REF_NONE (7). But it=
 does
seems that passing values above can cause issues in
rockchip_vpu981_av1_dec_set_prob() notably.

Nicolas

> +
>  	return 0;
>  }
> =20

--=-oYN2ZyRHmX5ZnXRpMqxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrTTQAKCRDZQZRRKWBy
9K/4AQDEtImR1HUZlnmldYWQyt3Lse8HfBk8+qofHR8m3MnsVgD/QHAHc045l9HB
OYVANutGlADEFCbZEwFnNGNr8HRN1w0=
=Do2d
-----END PGP SIGNATURE-----

--=-oYN2ZyRHmX5ZnXRpMqxM--
