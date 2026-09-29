Received: from mail-vs2-f28.google.com (mail-vs2-f28.google.com [74.125.227.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FCF35200C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713715; cv=none; b=Z7jjoN3ZYpscOiFNqwBldjH/6MLaKJ5l972vaaLa0l7vHGBKuBqDvgCeC+6KfgsbHu2l6Z8KoZBSViWnvB17PnB2hTqwbta3tgNT4Pbt5+y10oElo8n48ULsJssp4tqdMmnILtMzi8WQbeHkguYPrPSFnGW/zDsngzram9zkDUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713715; c=relaxed/simple;
	bh=uUrRYyuz9ljqvGYpIxFhR3M2h+TBtMioCu5j9jfhbA4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pdL0iLFeMTbOdu0jxiLTS5QKCKyon8rxTUAV334QNP/VURkSk2mvzgZ6WfdVvc4JMGWCdg/qHUg527s2TZG0gF+puGoWG+lrElI8s/OaUg20W8yB1ymqiDCNu4nw3v440cgDJe5V4GPEi2t1P7Biuaa4rRDT76uCHRYfqg7/hn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=s4+rwdgg; arc=none smtp.client-ip=74.125.227.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="s4+rwdgg"
Received: by mail-vs2-f28.google.com with SMTP id 71dfb90a1353d-5c9031e714dso1719874e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790713713; x=1791318513; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VQaYivWBj1ySc+nCCyxMCDWtW4eRfB8nvxBhJGO3V6s=;
        b=s4+rwdggV4Ka2ohZHGvPc4ZdJVZSJ/m/wqHZ80yvbpzg16u9wPcnL3ZT7SlkKSAGaX
         GAsM5WXB/9031DG+S9qkFwrfphbJZCN7TEV/BO1hkpqO95wK2REbxvti3Dk5ahg0q9SN
         76JwthHRUXzVELDgpjgwLYacCwGmuoW4cokn/tYpMV6IEucpnDk4fd5I0t6WIVFL0Z5s
         UeVmFZpwSUYRtyY+S62Y88NSNueLUN1pbw8GwIMRz0fCK4YDjRNtC1PamBHDeyyRkcE4
         wGGYF6SNLHcZxXkK4DdODOEW42wXFf8RdQKjLgf4hVUPoBfPqKRDALATTSS1NBEnI2zT
         IN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790713713; x=1791318513;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQaYivWBj1ySc+nCCyxMCDWtW4eRfB8nvxBhJGO3V6s=;
        b=iz/3mTJyCYcL/tuYlXWkN4D9xlqImYd0dy9nwM9QpfcrJlHdribEcxtIr61btSZRQK
         UaGnrl6gkJhlzvpZvMYvsBaT4zBzQz+7veaHO+24je1tO8s83lNQF57xa0Ws0017snYS
         7IQL8xuBRh+/ZfzSPOZDL6Xa5SURFE3+XzubYvSAcWgP1zWZ6A63/wgtzTLkdaoc7Nfj
         rYBT/nPUvzUqrjQOpIfBO7LV/YOPmyVMnbLUYfja//RoHfJBCmtJZhaGwgpOPverVbxO
         SWbfX2jJftXqUMWh5BimV/q4XQLkZH8hLI3T2Uvd/Gcog48VYKWSViF8z5OBzx2XSd/n
         l9HA==
X-Forwarded-Encrypted: i=1; AKwUvByXc8M6DgtEsO1Neqmim+gkhZJkuLJ1Q3ibZdTc/2GR72GWiittNvgPlywXL91DjAio7dNj/qJlKA3ZT5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8a+joKMmFTyNmEVINMJB6WayvX7oGA3Cl8miXPAc5gdro8x0d
	cC6BtKOQUvKPF+zvS+3nBLMWLi5JYUo03XJh6Pis9Lr9g5AAA+5SdIabBWipPVgcNzg=
X-Gm-Gg: AYBFou2uaTvuFHk/CLU+TnSoPFSbme6scwTSxmkPpRdJcOsuBpglQsXRgTd/5EJbuJ/
	TFLrI2kLaSmlRNKGvXs8XxYqsds0OmoBoarCF/NnMOh6bmYNYF5hD+x0/fHQMYNVOIDrtpI8uR8
	Z1/ET0YO7IV9E3jetqrP+BQo/ejsyEVV6aINH7KTmL02Boub9elNvEca5VEcG5ibQg9eSrRcw0s
	T/eHKTtt3rI3O+fMySgvAbxikgruijyAwI/yIbEtkf6mfhjVEwsnovdEW+hAUKvHzXZ5v411WAz
	/QYp5UtiiFb0a6wqttJlYvbyMUW1XEa1ZcgTmeEkgOJ1K5Ru3lQhFQNkzsJv7e+8/AIU3areaJr
	HA9OP8/8POAnQZisBYr4QeFgeNvshp4MTV8imONyVPKREyeCmJMFJBdIZx9h7RKtJh0QDs+v0zy
	WauH+B9dpLyUaeXpb6xSsZvbwFRd736I6eckTKOYDQ9ISosOy1rTB3x4V91K+OmzvsSAiTDVNBX
	f90jIN9tYO6bw==
X-Received: by 2002:a05:6122:e1aa:b0:5c9:c60a:e9b3 with SMTP id 71dfb90a1353d-5d51a3753bemr226593e0c.19.1790713712883;
        Tue, 29 Sep 2026 13:28:32 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d4e9a793e6sm1089117e0c.13.2026.09.29.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:28:32 -0700 (PDT)
Message-ID: <1fe9b189db3d0704be5b1b37a700311dac2cbfc3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkvdec: Remove redundant dev_err()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <diederik@cknow-tech.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 16:28:31 -0400
In-Reply-To: <20260919093449.2534901-1-diederik@cknow-tech.com>
References: <20260919093449.2534901-1-diederik@cknow-tech.com>
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
	protocol="application/pgp-signature"; boundary="=-F+3ToYK5qPTGqdEYIxDv"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-F+3ToYK5qPTGqdEYIxDv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 19 septembre 2026 =C3=A0 11:34 +0200, Diederik de Haas a =C3=A9cr=
it=C2=A0:
> The devm_request_threaded_irq() function already logs detailed error
> messages on failure automatically since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"=
)
> So remove the now-redundant driver-specific dev_err() calls.
>=20
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 061281f903f3..13d13c041509 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1824,10 +1824,8 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
>  	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  					rkvdec_irq_handler, IRQF_ONESHOT,
>  					dev_name(&pdev->dev), rkvdec);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
> =20
>  	rkvdec->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "sram", 0);
>  	if (!rkvdec->sram_pool && rkvdec->variant->num_rcb_sizes > 0)

--=-F+3ToYK5qPTGqdEYIxDv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwfbwAKCRDZQZRRKWBy
9KhKAP4k1cHvpCPn5smix40RZY42YEI2Eo0qvXxN29oEVWOpCgEAnLNOPA0qpepn
oMGr7q8y93fQEe5BvvTo5vSFZBOIxQw=
=Qt2k
-----END PGP SIGNATURE-----

--=-F+3ToYK5qPTGqdEYIxDv--
