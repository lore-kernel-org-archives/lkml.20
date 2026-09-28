Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42744F474A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623729; cv=none; b=iwSfyJThlf1XoFYgFAPn+j7DPGfkRSDKCZ50ptVLiTa+7oV7Bmnx9NQS2Yju2yH8t2wITyiIbOrwFezKtZPHuCP3f2Juu/8ZZEu0Yt0bv6oELbXo6re/R2U33Le1mAkMY1jwDoCTCT7VCJZzVXf+iFO689NMfnr3My+vwXxwF5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623729; c=relaxed/simple;
	bh=O4uIi9qgIMnPjsFpze9OgXjJoOKWfAVoaOQ1MDw6W24=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qHDa+emtlEh0muHICswRGWcyDDjPKb9fKUN/+9PYKmW2TgB6EnzQeIH1qdqGO0BqGke9v+mAJv3xEFCdD0PkHE8rR279GXVq6zoT4dP4i9p3nHl/MkmxFaOAGZNB8RdEwPE2URxb0s0sWJsSgpiSO2g+eDnJqI4bExIYrbCOZnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=ujeAHZXC; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="ujeAHZXC"
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cd13e9ec34so1390655e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790623726; x=1791228526; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f4XLiHmjvbY0WMNhbeGvYmwDKn+iLVO18enI78KZT1U=;
        b=ujeAHZXCofuwKgAeICLb9kvV1n9E+r47D8VgVObLOyXqxCqTWKsnzm29wo6zstlAEb
         oQnquVN2ifqow7e3G0NZgZWL2bvGI3Daavmgj7IgOOZbjp/B2aOvc70ysTztAIwx4X/X
         uhoYlK0KP5JYbo3VE/5SPmHOv/ww/x4cckykcKfVQNOy25xJXfg6mAaMXyshTqWvj/+P
         BW8htB6UCgewzAPuRJfvs3A/soDKRsZNWs5K2SFAv7DpV4ZhJgzxLhgz4hiJgjtHfzwr
         QMo6NWZjjXJXHG9QC2r1AmirOCJoqXNv/c6F2zP6I16Shtm9h4eYZ8OElq1bNRxZSv55
         P5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623726; x=1791228526;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4XLiHmjvbY0WMNhbeGvYmwDKn+iLVO18enI78KZT1U=;
        b=rEXXsGnPQYfbirYpXidrz9KS/wTxwfwuzgMXd/ATs9Qip//YSrZ0aPF+EOFNzoRdN8
         TV3LBCT64YNUk07ybslLo71mA7E8j3SYB6Nobhjoc8xM9zhzOsGAnUsN7ED85Zo6CMkJ
         Zgf+PgTlO+lSd6I2VHUrAfMGLNdTlNr5Da/ixmaeGhxJzJyPtB7YBEgB+3Lbqiyxc6NN
         fpyNpjhTybL6fgB6vseM9RtuB39bsgzefbBZB+CfVf2FMq2ZRAbXiFvhSmZ+M/fC+X3E
         IavCRPNX3+9Ra/BFTOjQRGIkdPxCVwDcremcvv1JHfMR4YlQeVKoZG9l+0cDV0n+3RTJ
         FsBg==
X-Forwarded-Encrypted: i=1; AKwUvBwDUK4ceDppUvim472cMsDHojYbx9S4tPRJy8ZD0QXDVJ2hMBqfTooPhzAZ4xHKfcdTynYWPWvBdHiSHj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXuKEi96VBmn92Wmdm6WpnBcBzt4JkhcwfVpXDT8Kv65/Kfk3r
	cW0sCslicQR6+70Bx73Bt+PTBFAgD01Syp6NftvjwxNysDDimKmSDP4qOmUQdWWzIV8=
X-Gm-Gg: AYBFou1J43aeRXfgcLdxCwDYDWvTp2In35eu15TUE/CcYbQrlr6LHViBCQP8Ym1Gfhp
	jqeaiAi+mI/0CpZEj28wmdQlMXEKM9VDx3q5nQc/Lgl3xbaRa8Jlg6Ul5IrNCcJgAV//8Q7nOnz
	huYI+L0wXpcKaasfPEiJuDWpYWPJyDlnXCW5N2WUuGl6T7XMTyf1vKhlbmu3OsMnV2hvdD+V3C/
	fGR08YKkl8EZ+x62ts9eR2893TWGDlbQPIzL+748H4ziGyMEJ6KO7GXbizoH0dsiv+0VWg+jop4
	GsfeBmmAv35Q9W7LYBR88FGi3CoKcFymGiU9qdxbHD1Hf9rGus31GItkSh/IqsGq0BWFGsNpNGr
	fyjzCcKHzys4BCuESnzg+erJs08MWK/wRQv+pYH4+LOEDmjDvYYcboX1/Qb5pVLGx0vW1YfiVtC
	FNSTjJxB99Lg8XN9UA/gkAI0jo+Zstgry6Ja0fRWBzMjyvcw0smrFyE059nOLOEOOAwnvM9IhOZ
	kruH1xU65NKHQ==
X-Received: by 2002:a05:6122:25ca:b0:5d1:b41c:8ff1 with SMTP id 71dfb90a1353d-5d1b42bdce3mr337088e0c.15.1790623726416;
        Mon, 28 Sep 2026 12:28:46 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde664c06esm9993095e0c.16.2026.09.28.12.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:28:45 -0700 (PDT)
Message-ID: <59097bca6ad101c160c1d519556fbee378801dcd.camel@ndufresne.ca>
Subject: Re: [PATCH] media: imagination: e5010: release m2m device on probe
 failure
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: =?UTF-8?Q?=EB=B0=95=EB=AA=85=ED=9B=88?= <mhun512@gmail.com>, Devarsh
 Thakkar <devarsht@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Mon, 28 Sep 2026 15:28:44 -0400
In-Reply-To: <20260424-e5010-m2m-probe-unwind-v1-1-mhun512@gmail.com>
References: <20260424-e5010-m2m-probe-unwind-v1-1-mhun512@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-voi74w9GheclbzmAzMR6"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-voi74w9GheclbzmAzMR6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

sorry for the long delay, finally getting to this one, comment below...

Le samedi 25 avril 2026 =C3=A0 01:58 +0900, =EB=B0=95=EB=AA=85=ED=9B=88 a =
=C3=A9crit=C2=A0:
> From: Myeonghun Pak <mhun512@gmail.com>
>=20
> The probe path allocates the mem2mem device with v4l2_m2m_init(),
> but several later failures jump directly to the v4l2_device_unregister()
> unwind path. Since the driver core does not call .remove() after a failed
> probe, those paths leak the m2m device.
>=20
> Route post-v4l2_m2m_init() failures through the existing m2m release step
> before unregistering the v4l2 device.
>=20
> Fixes: a1e294045885 ("media: imagination: Add E5010 JPEG Encoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/media/platform/imagination/e5010-jpeg-enc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/driver=
s/media/platform/imagination/e5010-jpeg-enc.c
> index 42ad9ee399..4c250e2275 100644
> --- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
> @@ -1072,14 +1072,14 @@ static int e5010_probe(struct platform_device *pd=
ev)
>  	if (IS_ERR(e5010->core_base)) {
>  		ret =3D PTR_ERR(e5010->core_base);
>  		dev_err_probe(dev, ret, "Missing 'core' resources area\n");
> -		goto fail_after_v4l2_register;
> +		goto fail_after_m2m_init;
>  	}
> =20
>  	e5010->mmu_base =3D devm_platform_ioremap_resource_byname(pdev, "mmu");
>  	if (IS_ERR(e5010->mmu_base)) {
>  		ret =3D PTR_ERR(e5010->mmu_base);
>  		dev_err_probe(dev, ret, "Missing 'mmu' resources area\n");
> -		goto fail_after_v4l2_register;
> +		goto fail_after_m2m_init;
>  	}
> =20
>  	e5010->last_context_run =3D NULL;
> @@ -1089,14 +1089,14 @@ static int e5010_probe(struct platform_device *pd=
ev)
>  			       E5010_MODULE_NAME, e5010);
>  	if (ret) {
>  		dev_err_probe(dev, ret, "failed to register IRQ %d\n", irq);
> -		goto fail_after_v4l2_register;
> +		goto fail_after_m2m_init;
>  	}
> =20
>  	e5010->clk =3D devm_clk_get(dev, NULL);
>  	if (IS_ERR(e5010->clk)) {
>  		ret =3D PTR_ERR(e5010->clk);
>  		dev_err_probe(dev, ret, "failed to get clock\n");
> -		goto fail_after_v4l2_register;
> +		goto fail_after_m2m_init;
>  	}
> =20
>  	pm_runtime_enable(dev);
> @@ -1113,6 +1113,7 @@ static int e5010_probe(struct platform_device *pdev=
)
>  	return 0;
> =20
>  fail_after_video_register_device:
> +fail_after_m2m_init:

Can't you simply use fail_after_video_register_device label ?

Nicolas

>  	v4l2_m2m_release(e5010->m2m_dev);
>  fail_after_v4l2_register:
>  	v4l2_device_unregister(&e5010->v4l2_dev);

--=-voi74w9GheclbzmAzMR6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarq/7AAKCRDZQZRRKWBy
9IZmAP0VR6bu6gTm5GrW5zPbMo2MHKgY6EAy04h+kue45wO+HwD+LGwAIVFAH7ri
2jBuZaTDoCNv7kwXXm6c9LckfqoGjgM=
=S2RM
-----END PGP SIGNATURE-----

--=-voi74w9GheclbzmAzMR6--
