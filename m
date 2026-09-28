Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985ED48CD46
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630617; cv=none; b=Qgfx3hgHfUjdSJB4XsOh1pOtMJjyG1mZcVzR0BofwLh0hKqVaYHYJVxTkAK1/lAVWUrFOlo4/cR2SbycMm3Pt93V4w2zHx2JJbLRCcU/jUjjVNKyVABrcZTBJUNymW93AWNRNEWOCYsPWUTJbg0OdfS8CqWxiHYOpxxScmQiXHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630617; c=relaxed/simple;
	bh=txZ+W3WrXqBtZJWtNxXgFfwlJBDsgURZPhOGfwegrBI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FIqRXR62MaBaMRBtPw6tt0ewCt7BmMPSFi4QvAWqnutA4sMh8g492um/PIiRHnPGnsbjrZR78ea3Nhlikag/pAFLn+uWbkpZjslbkpFR6agR1UQk/yWzS8gYBeNyOk6SMX340f0avixTkc39MwKiOZ3dAmy+eVKAnMRGrOrCO14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=AVUUcAce; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="AVUUcAce"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-53321c5743fso41570221cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790630614; x=1791235414; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IaYLtQdPOAs5MVg3mEQ2w8dEl9KRvDeu2m3mohc4wFA=;
        b=AVUUcAce+7bWnnR2DA5v4Uem4kzS2CHHAAvm+7ayonEqnKRMokTc9YCC8lgVCCvpW7
         M+87A/f7vpAhWcn4AfPvYJk7hVygLvesZf0Qd+gTQA7VZQ5ZKQB7i3DVbc114TC/9mPU
         pVXJJ2ScXhzLPfgIy/eSJESYjDKtol2jryqJf2n1Ll5TEJJXDCzNUIEtD5rTkY2p126x
         8YdmiOMLCwaS6eWKTSpGL17k5mzKvVXJB0erllFPhYJl4qbC6fWNT7L6QLxDRYAvdrBr
         t5eqD/rlmJzqkS23oOxmDA+4ukJCOf5ylCruEYROalhHSyYi4m8T6n4891wdyMJLOlVx
         slvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790630614; x=1791235414;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaYLtQdPOAs5MVg3mEQ2w8dEl9KRvDeu2m3mohc4wFA=;
        b=HMmlAgdtRPWvlXt0lqM+RF37vgRpgPIxD+HmHq8XoJPb0XbJd111ajnDUtW7QwwYYC
         2xY0XUpMKrfa/qhhvdOqN/XZ9GWJatnq3IePjvPpREmqeNV46mIrRXRp+LwgU/0MbFu7
         T3/wSNTMmujZ2CErMcgMVqIGdI3gP3GO+thJNIJCBOTwXyuMp2Sr7nqU3pZHhz4Ng9Hz
         EQ4qOvz234jTU7yFKrlHA7GtyGytK/U0Aa64Sg8pDRpDRZZlYsQ8Aif1Subnh4JknDvl
         7TlmxvUFSV/VkWjZ6c93GG/ASblCTjIHyWmy9Dcg1tM0VXEVNTk36cW1IkLGxBxZVQD4
         +gZg==
X-Forwarded-Encrypted: i=1; AKwUvBzQaVMzGGxkg92XZGaf6Dk4JTKjPNvIle1PjIbu8cTNuQT59XjyJVPMNUDidhLoQB/pgxIdLRuVSebPU0A=@vger.kernel.org
X-Gm-Message-State: AFuF++mxMQur9c1dJOvs+AmiOfJwU70n5Tkmvp/bNVs0RLnta8TfigC2
	Fqrn4Ik5INtxuZ2/04QaO2wl+ZT4rE5M4bS5eHerdaNnTGu3N3+B4Ro85IDiHIMcpho=
X-Gm-Gg: AYBFou0msA5oC3xOpRxWTGvXiwT76+bapSQYdD967yWCEJa2HfHtYvItbXFybdZgtva
	nK0vZeUWnx6snl3PBFsd5LwHXK+VpcLFKuS96D27zqkf7qbLCcttVKODfdFQo6rqRn1CzKKQjGh
	EoZ89cdO564s/gEawuGx0KYY8R4vkzAlCIT4gSEzctx5fdBFSmzGgWacKPPDCEWnbJlmYVnCCJy
	74kjHWdq1LRyhIM+dYJag13UcIA6FQXHskAvcNcy91Cuc5j7Z8ABRf/4pwGXNBm6BTRcWKqjrlC
	5Bbwhlc8BuOZvDCAzpImLakkO0gQxKOUNxglZcEy4Rg/YfzxS/kfsRM2Nrqhk1Mhudem1ElzIKm
	WXD8+sGNJXy8kl8SAfNUGbyDt1qzWTBkNLhVO8qNq/XgwkOrj9AWbTZofld/JyKJuv/5WdNSc9R
	h0/Sx0IAPB87ypKU0PTVHnw71P1o1CWoYcE5dGAVlNEMSavQ1CtDh+sQ8nDz1HjN5NUBEDWhM4+
	tkaTIoYdM3V9w==
X-Received: by 2002:a05:6214:1308:b0:90e:9aa2:5169 with SMTP id 6a1803df08f44-9142f6440e0mr233721456d6.7.1790630614149;
        Mon, 28 Sep 2026 14:23:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9144e8c132bsm58091816d6.41.2026.09.28.14.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:23:33 -0700 (PDT)
Message-ID: <1cf92b98383885f2e58431ab520efb242bcb311a.camel@ndufresne.ca>
Subject: Re: [PATCH v10 3/3] media: mediatek: jpeg: add compatible for
 MT8189 SoC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, 	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Date: Mon, 28 Sep 2026 17:23:31 -0400
In-Reply-To: <20260720062829.7343-4-jianhua.lin@mediatek.com>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
	 <20260720062829.7343-4-jianhua.lin@mediatek.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-XXMA3sGS6EjACn9YD7p9"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-XXMA3sGS6EjACn9YD7p9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 20 juillet 2026 =C3=A0 14:28 +0800, Jianhua Lin a =C3=A9crit=C2=A0=
:
> Compared to the previous generation ICs, the MT8189 uses a 34-bit IOVA
> address space (16GB) and requires a single clock configuration.
>=20
> Therefore, add new compatible strings ("mediatek,mt8189-jpgenc" and
> "mediatek,mt8189-jpgdec") along with their specific driver data to
> support the JPEG encoder and decoder of the MT8189 SoC.
>=20
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec483081..14f2991a4053 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1868,6 +1868,10 @@ static struct clk_bulk_data mt8173_jpeg_dec_clocks=
[] =3D {
>  	{ .id =3D "jpgdec" },
>  };
> =20
> +static struct clk_bulk_data mtk_jpeg_dec_clocks[] =3D {
> +	{ .id =3D "jpgdec" },
> +};
> +
>  static const struct mtk_jpeg_variant mt8173_jpeg_drvdata =3D {
>  	.clks =3D mt8173_jpeg_dec_clocks,
>  	.num_clks =3D ARRAY_SIZE(mt8173_jpeg_dec_clocks),
> @@ -1899,6 +1903,38 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvd=
ata =3D {
>  	.multi_core =3D false,
>  };
> =20
> +static const struct mtk_jpeg_variant mtk8189_jpegenc_drvdata =3D {
> +	.clks =3D mtk_jpeg_clocks,
> +	.num_clks =3D ARRAY_SIZE(mtk_jpeg_clocks),
> +	.formats =3D mtk_jpeg_enc_formats,
> +	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_enc_qops,
> +	.irq_handler =3D mtk_jpeg_enc_irq,
> +	.hw_reset =3D mtk_jpeg_enc_reset,
> +	.m2m_ops =3D &mtk_jpeg_enc_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-enc",
> +	.ioctl_ops =3D &mtk_jpeg_enc_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_YUYV,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.support_34bit =3D true,
> +};
> +
> +static const struct mtk_jpeg_variant mtk8189_jpegdec_drvdata =3D {
> +	.clks =3D mtk_jpeg_dec_clocks,
> +	.num_clks =3D ARRAY_SIZE(mtk_jpeg_dec_clocks),
> +	.formats =3D mtk_jpeg_dec_formats,
> +	.num_formats =3D MTK_JPEG_DEC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_dec_qops,
> +	.irq_handler =3D mtk_jpeg_dec_irq,
> +	.hw_reset =3D mtk_jpeg_dec_reset,
> +	.m2m_ops =3D &mtk_jpeg_dec_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-dec",
> +	.ioctl_ops =3D &mtk_jpeg_dec_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_YUV420M,
> +	.support_34bit =3D true,
> +};
> +
>  static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata =3D {
>  	.formats =3D mtk_jpeg_enc_formats,
>  	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> @@ -1938,6 +1974,14 @@ static const struct of_device_id mtk_jpeg_match[] =
=3D {
>  		.compatible =3D "mediatek,mtk-jpgenc",
>  		.data =3D &mtk_jpeg_drvdata,
>  	},
> +	{
> +		.compatible =3D "mediatek,mt8189-jpgenc",
> +		.data =3D &mtk8189_jpegenc_drvdata,
> +	},
> +	{
> +		.compatible =3D "mediatek,mt8189-jpgdec",
> +		.data =3D &mtk8189_jpegdec_drvdata,
> +	},
>  	{
>  		.compatible =3D "mediatek,mt8195-jpgenc",
>  		.data =3D &mtk8195_jpegenc_drvdata,

--=-XXMA3sGS6EjACn9YD7p9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarra1AAKCRDZQZRRKWBy
9PgyAP90ID6nr8DXz9EU9G9cUMSWNsFKmJUohZ0RKC19B7xjVwD/WygXzFMIdb/P
AAfRq3LMsOABefslze2ZwSqMr6V7Vgs=
=UgZf
-----END PGP SIGNATURE-----

--=-XXMA3sGS6EjACn9YD7p9--
