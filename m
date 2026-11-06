Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793969056;
	b=BMxwXEXylLJ1/kmsKUDVGa+XYfgTuqdp/yZ1mvxoE9wFZboQsFOljzlTDH+MHec3Kp3h
	 fETESzFkLwYpo8M0jXqzGLdY+ukaxNGImNYT2lxfmyN9WpfZWLBD1GW1PSA0OcoYZzMj1
	 MfLQPWBt2/IIU+v3l+9cgpTcpWU6u5qKVAaldQDLL6mgnXCNSpQTGyQhQjz1xTNxVhrCG
	 kwpzAHfwj96iM4Vc5QntNSgEzPpirSJw5I1Je5ypPU5Llc0OkZ02KPXG9RzHUdqb08sij
	 S3FlaxlOCm+V7ChF+7Y335tUcNDliQ5PHFWJoQuUkZkheaS6PzN5vfzpxkKatBCP6Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969056;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=yvXw0LVWrSllWuIbq9Egto2n1olVQSpmMhaF2VSG/a4=;
	b=wqyCv8RSa2vlNNI5CrdMloSNK1DS3+7LHJ0xlOQW4DxsGdA7G4uOQPD7M1duc5NzrDbq
	 t21RPgOOc6VS6ZTTm9A/0D3T93Y6isFe0Bv91+IlWlXtHNqU4FKdfF8BJJ9o9xdQ3Tzl0
	 309R58fKxaXykdlQNra8r0Fmner6cqOqldX0VIY2/d9NlmkJI/AwjhiRxGvVOeLBcnqH+
	 Wpef6sfBvL05CT+s17Pj3Gj6Afkt+CFwgyAUzwiq6mOrzF0tyHkSCOaOJfd6IAk+CezWh
	 nGzV8MJCQlazpscDNnEu+sCIr4Uidk7/vgPNXLfsZLak+nAKHjgx5EH+mOtGt81BwMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=OYS+gd+5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B76606A326;
	Fri,  6 Nov 2026 12:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B76606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=OYS+gd+5
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0054C2008B8;
	Fri, 06 Nov 2026 13:44:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793969054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvXw0LVWrSllWuIbq9Egto2n1olVQSpmMhaF2VSG/a4=;
	b=OYS+gd+5B0jEqWucB9F2015EHlOJxOUK9aGGVlfoNyYzGnYIDbUpNW4Aa0zWIseFEe2Obl
	EChFuOGx+9hyPx1+GgrRWru0/tFE1RcpGGJj685vjJ2CSeL9yQEn6ML/UGQMvBxm8t5YRr
	nxZEvj5idqbGPr0cOGtWZLUScjRdH/VwH4wD458cXtKkTqwrGhdx69zhv4YCs0TwIvEGd+
	WyMiAMMRYH3jKV1iBfGVhYiFaUK9YmYH5BKwZYbZ3rIhVFfbcF2HGEf196bjKmBmb1XlrB
	h0f3vg1GtFlZCStJbf2+fXyrUt4Uk/RCiEZQ6hqLm1/txJkQvolr+D39qf6I3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793969054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvXw0LVWrSllWuIbq9Egto2n1olVQSpmMhaF2VSG/a4=;
	b=FVrz+nUIAuaEh/HoGLt/8rC70hO8B/Z5FOYPqjJK+lRP73IQlXivmDFc71fCZXjqHJDhYL
	qrG4DZsVxAN3s98ZALvm5/JSWMYgIxDat2UZyuobUSSESWPCmQr6033LB5F9NdVSviFOK6
	zgqCngNX7GNiFieSv5PXHbPO6UynBtuV0a7T27N1pDOBpMPn/9yQDlDCTZzG8/4d0aKpdY
	UR08jv0vf9QfSEQKzxn4e8QIMk9DIi7Yei/SqLqTezey8OQ5FMFxCqgJbnz7fDXUMn470c
	2xGHghxkEfN2p5R91ZYuGSTOoYqDyn0fdeN81y9FMAdWGb5fLVDLLOCEeT+rAg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793969054; a=rsa-sha256;
	cv=none;
	b=NiZHDx8TBOW5bxYk+Wp2/AgLQlvJRN7ucp/dyjs9fMDGgRpq1AhlE5rL76NC3lsIroUrol
	kBhlG82Ky6h5dFzXn21FCPp7vbsjzwQctmzZJxD3hrPAzasuondZgPaubPo/4u0FIWB4qj
	jgW3gOm/MXRy6rJi5aOz4ZmoQ7gV23Bl0mDIVmJq19/SGvjdDtvVv5bhisMqbxr8sTElkC
	RgN/j+ar22V56dvbTZx/AbIqlq4ZO4keKoUdOA1O3wtx5Ia5SznBJXWuOaS8CSnzvAJPtk
	hApm/1m3F6J0C/CFLEUXlPtUaKzBXiRutLbK+BpzbWZCytcGj3HTfewGO7S2EQ==
Message-ID: <9d02b6b6df7093cadc4db3e08698879d7115c33c.camel@pengutronix.de>
Subject: Re: [PATCH] media: coda: fix out-of-bounds read when parsing H.264
 SPS profile
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hyunjung Ko <hj351016@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 	linux-kernel@vger.kernel.org
Date: Fri, 06 Nov 2026 13:44:13 +0100
In-Reply-To: <20261105064155.1342011-1-hj351016@gmail.com>
References: <20261105064155.1342011-1-hj351016@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-11-05 at 15:41 +0900, Hyunjung Ko wrote:
> coda_sps_parse_profile() scans the compressed OUTPUT-plane buffer
> supplied by userspace via VIDIOC_QBUF for an SPS NAL unit and then reads
> the profile_idc (buf[0]) and level_idc (buf[2]) that follow the NAL unit
> header byte. Neither the NAL scanning helper nor the final dereferences
> are bounded against the end of the payload:
>=20
>   - coda_find_nal_header() dereferences *buf++ before checking buf
>     against end, so it reads one byte past the payload when it is
>     entered with buf =3D=3D end (e.g. a zero-length or start-code-termina=
ted
>     buffer).
>=20
>   - after the SPS NAL unit header byte is consumed, buf may point at or
>     near the end of the payload, yet buf[0] and buf[2] are read with no
>     check that three bytes are actually available, reading up to three
>     bytes past the end of the payload (and past the allocation when
>     bytesused =3D=3D plane size).
>=20
> A local user with access to /dev/videoN can trigger this by queueing a
> crafted H.264 bitstream buffer ending right after an SPS start code and
> NAL header byte, resulting in an out-of-bounds read (KASAN splat /
> possible crash).
>=20
> Rewrite coda_find_nal_header() to bound-check before each read, reject a
> header found with no following byte, and verify that profile_idc and
> level_idc are inside the payload before dereferencing them.
>=20
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> ---
>  drivers/media/platform/chips-media/coda/coda-h264.c | 17 ++++++++++++---=
--
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-h264.c b/driver=
s/media/platform/chips-media/coda/coda-h264.c
> --- a/drivers/media/platform/chips-media/coda/coda-h264.c
> +++ b/drivers/media/platform/chips-media/coda/coda-h264.c
> @@ -19,13 +19,13 @@
>  {
>  	u32 val =3D 0xffffffff;
>=20
> -	do {
> +	while (buf < end) {
>  		val =3D val << 8 | *buf++;
> -		if (buf >=3D end)
> -			return NULL;
> -	} while (val !=3D 0x00000001);
> +		if (val =3D=3D 0x00000001)
> +			return buf;

This should return NULL if buf >=3D end ...

> +	}
>=20
> -	return buf;
> +	return NULL;
>  }
>=20
>  int coda_sps_parse_profile(struct coda_ctx *ctx, struct vb2_buffer *vb)
> @@ -36,10 +36,17 @@
>  	/* Find SPS header */
>  	do {
>  		buf =3D coda_find_nal_header(buf, end);
> -		if (!buf)
> +		if (!buf || buf >=3D end)

... and this should not be needed.

coda_find_nal_header() should never return buf >=3D end.

>  			return -EINVAL;
>  	} while ((*buf++ & 0x1f) !=3D 0x7);
>=20
> +	/*
> +	 * profile_idc (buf[0]) and level_idc (buf[2]) must lie within the
> +	 * payload before they can be dereferenced.
> +	 */
> +	if (end - buf < 3)
> +		return -EINVAL;
> +
>  	ctx->params.h264_profile_idc =3D buf[0];
>  	ctx->params.h264_level_idc =3D buf[2];
>=20
> --
> 2.43.0

With the above fixed,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
