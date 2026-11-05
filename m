Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911118;
	b=KRuaclQfOug43AXJBmsYlEIJh2DOJafbx9YvsMiF+bz4Cd27K5rhVRvCfzuDE68Gu0zT
	 3LIHgMTVcq7mYuXU8vDYZIJmj3IW2Da8tEdd6JGwdCisqpsJgj2b/YgPTGdmmP6xa4+D8
	 PTdBOdr2qO6kSFyy4OpA0cC6xuQukXo4oEftriGmRv8qd9ayiYl6rHLBlfNdCXiTxbuef
	 JnSHsGLr2I6tzc03QDOsgm1Ple4wHLXlsN7a3uPE1oMzvkmQ8mIwGDcnmvuVY8vc+bCbG
	 aoBiruvhuLtB2RNhMGphYMa7qByncWkXFN36bTp/t9BPEivku2j7zhF28FV/IJ5Zkfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911118;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=uTr78+EKJ80AgjhlhFA6vfRiNhSENpgMW7TPBkAYpjk=;
	b=g1CVf76jNXEFB8FRv+uUI0dspR9bofTAbV8WhVCxdWvT+GA6E8f+ooUab6/dNqsoZBSJ
	 I6MZt/0PvVm9UygDVkzLOjQ/tBmE1jzIHwHeHBOhTS5JCgRsEbrM7mt7RjChrV06dgIKa
	 jyM0MPa2ESqBBAEwP9rhBu4X4jkW3/B7gtpUHkt5rcbhAiG3MqVKf9eyO9sIUUJvojOUr
	 eZudG3yfywYXgxxGpgdW288Ac5i5E2JdEkmnXY64rwz3nkCOAsE087BE8AcfXpASCy5U6
	 53qvZmLF3Cv3SNuG2/JOW4ck2/YQNAkvTEXPwowbyIow92JNhu6WwRD8cbQcxfsHMEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AVBUpvPH;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0CB606D80D;
	Thu,  5 Nov 2026 20:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E0CB606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AVBUpvPH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793911115;
	bh=t/CjJ+IUebv6B033LwItLXGrv/vuUzLu/02JkclzEvI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AVBUpvPHZKwHj/ytZ+1TS3ayvA2OpuZA65Op+hTIIWM9CXc5P8WVQ0dmEVp7ecWcc
	 xU4aOuPXnJe00aDxMBbJSLdqksCqvJyvDRnrDNlhXqQiQXw17oc6ZsxCvbj/dbPreT
	 2u4XaBoM/XTGbEMEC4VjJAbpF/vL4m+lGqcfFNUwgmyCrlX2ug31jdlal8nJ7LVloy
	 P0n1QPzPhv7Z07yn1UeNvrERI5x1V3Nukfqew5Yjm/cOaipTMkA57FdAsHbD5PJsZ8
	 2bF1J3HQmfTYFYSDS6SvA76haTfOtorcyNDuEUDVV9UNpGoOK+fiMYCfSAaYGNf9Aa
	 Glv7sfFdCGj0g==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D47D617E0564;
	Thu, 05 Nov 2026 21:38:32 +0100 (CET)
Message-ID: <82fa1dfc4266df67adedbb28ec04b6fe9f36ef1a.camel@collabora.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark	
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul	 <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie	 <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Bryan
 O'Donoghue <bod@kernel.org>,  Stanimir Varbanov
 <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jordan
 Crouse	 <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org, Vikash
 Garodia	 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Robert Mader
 <robert.mader@collabora.com>,  Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Nov 2026 15:38:30 -0500
In-Reply-To: <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
	 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-LymubVZJ2QNPf2r3KP/2"
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


--=-LymubVZJ2QNPf2r3KP/2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 04 novembre 2026 =C3=A0 18:36 +0200, Dmitry Baryshkov a =C3=A9c=
rit=C2=A0:
> The comment describing the QC10C buffer layout calls it a compressed
> P010. It is not: P010 stores each sample in 16 bits, QC10C packs three
> 10-bit samples in each 32-bit word, which is what the stride computed
> below (width * 4 / 3) assumes. Name the format correctly.

Keeping this separate from other thread. Maybe we should upfront tell what =
is
the DRM_fourcc + DRM_modifier pair in the doc [0].

[0] Documentation/userspace-api/media/v4l/pixfmt-reserved.rst

>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/med=
ia/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177..ec2bf2a2d953 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_ins=
t *inst)
> =20
>  /*
>   * QC10C:
> - * UBWC-compressed format for P010.
> + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packed in 3=
2 bits.
>   * Contains 4 planes in the following order -
>   * (A) Y_Meta_Plane
>   * (B) Y_UBWC_Plane

--=-LymubVZJ2QNPf2r3KP/2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauzpRwAKCRDZQZRRKWBy
9FREAP97K/llp0NFKyiM1vwAUNCmqH/X1ZCUVUjiGzy3bNhP8wD/TCIxVNuxPMf0
xajQ5EFkK431/9CU1cU4Esnav+NcOAc=
=zlIn
-----END PGP SIGNATURE-----

--=-LymubVZJ2QNPf2r3KP/2--
