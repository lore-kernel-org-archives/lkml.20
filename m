Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28435357CF1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790626692; cv=none; b=OcBKlBLxTc4wTppaoM+mBvl/RJD+/zaFOPYx7dN4AcEthA/TBqcURVqw9IddZl67LOa5F+KX94G1V1zidoJSelfALR4GV0UBEgJXHfNyueJTusxrnvuA950kMTfFZg9WJyh1L1VaBAYxRFS3/uWcI1PTUoGeBRe9TbLST+C2bIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790626692; c=relaxed/simple;
	bh=CgZhHGj1pW6833JwW53EB4b6tZGAvoRHquleruZAoaY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P4DXcv/fxXfxi7cXabSBINBMB5JQxFBrAn9PY9BvS8PJbvPqHrvgqgjtQ8BLZlyOyhg7gZ/V2+uoyLVoZski4DY9WIrR9Zupku57pc6NOPVGgQdDF/pn2E7D2vj99xDqQtLnEqj5rA7nKqthIC4/mhZ7rcQP0uwfScTS4tiZgkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=dyBCZ3ra; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="dyBCZ3ra"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b35eae3076so585660137.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790626688; x=1791231488; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P8gb2EQ4YEQM5mnoy3pmR3dgRg6e0zG6BOgph6Y9a+g=;
        b=dyBCZ3radDp8NPPuky5lRIVeEStjDLSxCR/fe0QOxD3GJKsM7UztGPRF3CyZWb25BL
         GQkb90LA0Ew0NGGK7fgAoHJcVeqhqsm59g5UbrTQZtQDbGGZMzuNJ7wSK9U9TgihRIae
         Hb1OPh+2gyW47mHGuDMfYl5yILeUGDfK8ONLgV9IHO3P45f7VroRGCtZWwEpYVWpcGnw
         rO6N0PAeU2R//L77bnSjGRnl18G8pvaGypsMQ2tJP6zcVs4+UjV8u9j8NE9Q9AwTI/Ia
         /cLpSG2R7UmXGLgZPx15SLlqKYwcicvLIb8/MIV0PttZ1JfRBQZSD3kuyoDUeRaza/a6
         2Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626688; x=1791231488;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8gb2EQ4YEQM5mnoy3pmR3dgRg6e0zG6BOgph6Y9a+g=;
        b=JUbjLTbFdZ66NupiPx40p4NM2IK0QmE5noymJruf6T1G1i1KDapCuzXYrAeYJEAg3i
         Q0b6R2MwfF25cqLeu5/jkkPvrDcD6mdGLSsaABECQMgqNfAvbL7IhiPQNwItRTS+Tv2z
         Lp5Mkn4qVYc56YfNA5WgSy3l0lx7SUpLP+wrv5BKmqNqo28luladaaTskWqnu4a9Fl/f
         vcs2wt10XR6gny23c+/tAgdEWYDvQUGIzhjRsj4HSi8THX3H4oR/6hCa/i+Evfn26c2r
         UjHI7l71iYfFiF80KDOPbE6v7GyGnMgPHlsKPHJR77NXdIIRYITMlIXGKlqCUcMrVDRi
         h6qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKdvcoPh6Rgh9IIzVsyAuo4RUELkti6V/SYDdQoXA0o2Ez72jipg/VFEGfzrlzZpsPJfGNGAtcp8iUcpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+lhzX6dEzMwOhyasiXkDOzA5Qpyb1VKaJBXMhHgp9PtIQRblM
	znPs0UdW/h19K9ooy/bNrLe1VnF9b2X757oel3beRomo+bCZLVpZOfiprL2J4mBQ5Cc=
X-Gm-Gg: AYBFou2a8yWkzfRHnfmH90zGQFu4dZXsEKtgXNW7m/XeXhxfJwCJVb1QvGedF5Z6JtI
	48XalcG8xBEiBHA29i76fO8miIc5vuVcabVMgRMERnhDzd7dzQVA7Kgbl1sdjEFPEQb+xeMZ4h7
	oFSDQ/YtqEh6d3ppvo4kVHBSwsF1C7/ZIcfKtwBOziaKTk1EmgIhdupmYA3JEClL4+PeccGClBB
	nFXkchdJsZOnKovs4BuXC3FYiw/m15PsSQ+eIUJaCGGdy3d7FR5U5TdHiPLpPf4gc7IKASxyr9P
	4RfmTw9WoFH0hlJflijIY9FR94eeLtRhd0Bz1PUwErLKoNWHsRCwVmKkcipQe251WCn+tCjbioH
	eK8sRApX+kjeTGzFB3E0WYFQfL3T/snTqq4NNVKBFMLu4RfSUXX7d54fWQY45DzpgT487lwjyjm
	jT2elaHUxo6w4mb+n74jq4mBwaafSX53IkPI7Qv4Qi4amglS4JiB6pE5AffPRHuCm0YJ3HzGd+h
	tM9N8+qOtcEB1MsPP9IWTrb
X-Received: by 2002:a05:6102:4497:b0:7af:4a46:4c12 with SMTP id ada2fe7eead31-7b1c4a2ca24mr2719387137.2.1790626687873;
        Mon, 28 Sep 2026 13:18:07 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b6a6272sm10681972137.7.2026.09.28.13.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:18:07 -0700 (PDT)
Message-ID: <c5bb16dec180576cb7e68221880b5e36b7cb689b.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: rockchip: rga: quiesce IRQ before releasing
 m2m state
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <fanwu01@zju.edu.cn>, jacob-chen@iotwrt.com, 
	ezequiel@vanguardiasur.com.ar, Sven =?ISO-8859-1?Q?P=FCschel?=
	 <s.pueschel@pengutronix.de>
Cc: mchehab@kernel.org, heiko@sntech.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 28 Sep 2026 16:18:05 -0400
In-Reply-To: <20260704084659.612221-1-fanwu01@zju.edu.cn>
References: <20260704084659.612221-1-fanwu01@zju.edu.cn>
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
	protocol="application/pgp-signature"; boundary="=-39ovF+b+wtIn04/R/uu7"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-39ovF+b+wtIn04/R/uu7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 04 juillet 2026 =C3=A0 08:46 +0000, Fan Wu a =C3=A9crit=C2=A0:
> rga_remove() releases the m2m state before the IRQ is freed. The IRQ is
> devm-managed and is only released once rga_remove() returns, so rga_isr()
> can still run while the m2m device state is being torn down.
>=20
> Store the IRQ number in struct rockchip_rga, unregister the video device
> first, and free the IRQ before releasing the m2m state so the handler
> cannot run against the freed state.
>=20
> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

Again, I don't know if this is a real issue, but seems fair.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Picked, ty

>=20
> ---
> Changes in v2:
> - Rebased onto media-committers/fixes (Linux 7.2-rc1) so the Media CI
>   valid-ancestor check passes. The rga driver was rewritten upstream
>   (rga3 support, external IOMMU, clk_bulk, cmdbuf moved to rga_ctx), so
>   this is a re-port rather than a pure rebase: the resource freed during
>   removal is now rga->m2m_dev.
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 4 +++-
>  drivers/media/platform/rockchip/rga/rga.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index b3cb6bf8eb86..fbc99462dce2 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -797,6 +797,7 @@ static int rga_probe(struct platform_device *pdev)
>  		ret =3D irq;
>  		goto err_put_clk;
>  	}
> +	rga->irq =3D irq;
> =20
>  	ret =3D devm_request_irq(rga->dev, irq, rga_isr,
>  			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
> @@ -876,8 +877,9 @@ static void rga_remove(struct platform_device *pdev)
> =20
>  	v4l2_info(&rga->v4l2_dev, "Removing\n");
> =20
> -	v4l2_m2m_release(rga->m2m_dev);
>  	video_unregister_device(rga->vfd);
> +	devm_free_irq(rga->dev, rga->irq, rga);
> +	v4l2_m2m_release(rga->m2m_dev);
>  	v4l2_device_unregister(&rga->v4l2_dev);
> =20
>  	pm_runtime_disable(rga->dev);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index bd431534d0d3..7bcdf36c11b4 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -73,6 +73,7 @@ struct rockchip_rga {
>  	struct device *dev;
>  	struct regmap *grf;
>  	void __iomem *regs;
> +	int irq;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
>  	struct rockchip_rga_version version;

--=-39ovF+b+wtIn04/R/uu7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrLfQAKCRDZQZRRKWBy
9KCPAPwM1fyw7fD5QEP3/mMmZg+7cHaUSSeU24SoTWd1bUpA9AEA7xkB7orTNjBo
jdc9UGf06pEwlRtqhefYvUSz8x45Rgg=
=QwDi
-----END PGP SIGNATURE-----

--=-39ovF+b+wtIn04/R/uu7--
