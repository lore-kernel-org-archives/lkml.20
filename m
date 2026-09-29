Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD3530E04
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707362; cv=none; b=JHpSYYy6xKVjG0a/ZGTrrJSFSg0AJgdYQWTFxK+vHf7RcxxA2ClDf3SKdXXDJvOB5bWQnSiWleX7L2iFyaYflTvHEUKgeA54wIwecQDu5r3nBGT77JZC8v+ArYqpq+yNXZnJORpvFnRJtOk7q1Hp5KFPkQB/9WsRSgeCyT9Uz1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707362; c=relaxed/simple;
	bh=PPJGcCM0sx6er+/xcCz8HP+65T75ADwxPymHBvvsnVo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=skJNrXTcxDlNj9dEWmrvdTqzDf7xMXCi02RZgT40PUnT0TLGcfsdIV3tYpTdELjwPkYVmPq8Wo6BYm5ihAzAcsk028TMq8HiG00Ka+jIpDP3oiGvL87Z7F1CSB/MmFmWg03rd1t8ri27CLvqx/8j+A+8A8fcS+Anu1mUnCbDiXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=oj06MDRn; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="oj06MDRn"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b2d5062bcaso2028880137.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790707360; x=1791312160; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xU2IbXhE/z5ABDUOgveshtAzBWv4hsn4Hu2VpZqugQ=;
        b=oj06MDRnSA7tz9HbTB5i1da6HLxSCKZFik46vLf7h0fokVHesrXHOePRbkJG9X7LSM
         N5BWiZrUZVb8BFR18pEiF4BO4WYNLykaLIYTBaVUgB4hieUZK1CKubzFKuNElaB/ip9M
         eNiLp7rTQSU+j291xrtS6bV49/cF2ZkVgzU0KIYPalAKFLA2hnZ2fQVlCBq2vSnWpIrz
         c1Ws48MATjJfvXAxPsWVSFeoaed5c05bH9sJatycc5gGlpUO4wsclpjykk17rg2z8U1W
         bdZkVDRK600uRFAuSE8dObwZVwLY8a272BBt1t513xjnAjxRjPDduXgrAphxTnUjajZM
         sZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707360; x=1791312160;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xU2IbXhE/z5ABDUOgveshtAzBWv4hsn4Hu2VpZqugQ=;
        b=bFRAfWCgt6FL5Tn5JG+MzkZeqa2mFMjz979z4KRK4yC9Bt4IdV+/EohTPP7o1SgGaL
         /oD6xuSCVwUK6am7chBpVmkEY+ysFSn+7CPV3Hhhmlkhcv2TQrTJRFryazdqRjuHzBVD
         3q3yEU3pHN/TzH0XcrwhrNVLlOZVa+KM1DYk3c9Mvvn3EuNUMERgbrizGkIf19LCzAU/
         JBmeD9Cb0Ghl5blDpq+gZ8XaDgJkPtAQOhLoOmazzchDAsI7SLqTtscsplgP0O8ft3Tm
         X3qlGya/YS+iDufOKTo8qYrJLC2y8J38jAehW8AavqCmwTCa8BRMIwgS2rgDmZ+mzQw4
         phGw==
X-Forwarded-Encrypted: i=1; AKwUvBxyXtFZaB0yPVa3IW6qZ+Yavhlqi1DmoAXkfWcA0NDjhrlmvzzEzbJAW0Qvf7/Lr7xgmpvgmP86WvSn8q0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnh6c8kT9zAlf2o6w9cq1qR1eEJ6E9iVc/04E7msJ3Oep1Eisw
	1xm0PJkPCiUNbNKwvguFg901wv0Ixs2JPANlgwIz+yXaj4/K4ynGaLhxaoR4vG8kuZY=
X-Gm-Gg: AYBFou0fkY1ih8tk5geISagJwn+E3oyCht04vwslLy4qvFZiWhDBDjsPkcgRtbEFRpo
	PECtGYQRBEBFoGSpC5PDUCXNmyXSqGriBDfbKn+iBLLE6OYKyhgNv2tEUKsMJpLU2AZ7M/xyRFX
	ItfwCP+XPToOznkwPJ6cdwRmhsdmIsFjsb/zpbvObUSN5i5cbfyWc2I0jXcXFzqwBB3xVTz5lPN
	t+lFKP/mgiIxW4IagqViPQuiRoDx7kBIya3TUeZQGHYNYF8ubaMTvjsV09YMHplb0GWL0C8lmWR
	HT0YZFm3Ow4nNjUQV4CftY1if438Spz5yckPrVry4Q3rft2ifmIZg4TWLaXPtJ5s5TaaVqIesiv
	cucbWJN9aYQswQHV9BLw7YVImW0Sqa1Gm97k35+gZIb5xTk98jzJBhgBPU0lGZLEE1m5d11cJhN
	+4eeZkRRHHguNCo1GsKEwL713oYKoAg2eH1KuPHooA7u+uPvPW1QOQcTr1LMPql9AuNIyyoZwLf
	/Kj7QalMEYAfg==
X-Received: by 2002:a05:6102:3e96:b0:7a8:2a34:433a with SMTP id ada2fe7eead31-7bc3c0968b9mr194936137.9.1790707359677;
        Tue, 29 Sep 2026 11:42:39 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7bc7de014a3sm373692137.11.2026.09.29.11.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:42:38 -0700 (PDT)
Message-ID: <6cbde49a7440bb59faa9eab91dfb8e99947be993.camel@ndufresne.ca>
Subject: Re: [PATCH v3] media: rockchip: rga: fix rotation on rev0 hardware
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: John Keeping <jkeeping@inmusicbrands.com>, linux-media@vger.kernel.org
Cc: Jacob Chen <jacob-chen@iotwrt.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 14:42:36 -0400
In-Reply-To: <20260929094142.928758-1-jkeeping@inmusicbrands.com>
References: <20260929094142.928758-1-jkeeping@inmusicbrands.com>
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
	protocol="application/pgp-signature"; boundary="=-ILpt8SK1pUoNPTw2qXEH"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ILpt8SK1pUoNPTw2qXEH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 29 septembre 2026 =C3=A0 10:41 +0100, John Keeping a =C3=A9crit=C2=
=A0:
> On RK3288 where the RGA reports version zero [1], rotating a buffer
> gives corrupt output where one edge will be truncated.  This is a result
> of some adjustment done specifically for hardware revision zero.  But it
> seems this is not necessary and there is no evidence for why this
> adjustment should be applied on these hardware revisions.
>=20
> Comparing the TRMs between RK3288 with revision zero and RK3588 with
> revision 3.2 there is evidence of new features supported by later
> hardware, but nothing indicating any difference in behaviour for
> rotation which is supported by all hardware revisions.
>=20
> The logic here looks wrong anyway, since it's bizarre that minor
> revision zero would need the adjustment for _all_ major revisions.  This
> was added with the initial version of the driver in commit f7e7b48e6d796
> ("[media] rockchip/rga: v4l2 m2m support") so there is no detail in the
> Git history to indicate why this special-case might be needed.
>=20
> [1] Comparing with the vendor code, it seems this is actually 1.3 with
>     the hardware reporting zero more by coincidence than design since the
>     version register is not defined for RK3288.
>=20
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

Fixes: f7e7b48e6d796 ("[media] rockchip/rga: v4l2 m2m support")
Cc: stable@vger.kernel.org
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> base-commit: 2579cbe68005f46fc7f8f95364f6b101b07b9d1c
>=20
> v3:
> - Rebase on media-committers/fixes and add base-commit to hopefully make
>   CI happy (patch content is completely unchanged)
> v2:
> - Remove variable that is unused after this change
> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c | 8 --------
>  1 file changed, 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index be1bc8ddbd03b..2e7ec8b7c20f7 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -158,7 +158,6 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx,=
 dma_addr_t dma_addr)
> =20
>  static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>  {
> -	struct rockchip_rga *rga =3D ctx->rga;
>  	u32 *dest =3D ctx->cmdbuf_virt;
>  	unsigned int scale_dst_w, scale_dst_h;
>  	unsigned int src_h, src_w, dst_h, dst_w;
> @@ -251,13 +250,6 @@ static void rga_cmd_set_trans_info(struct rga_ctx *c=
tx)
>  	 */
>  	if (src_info.data.rot_mode =3D=3D RGA_SRC_ROT_MODE_90_DEGREE ||
>  	    src_info.data.rot_mode =3D=3D RGA_SRC_ROT_MODE_270_DEGREE) {
> -		if (rga->version.major =3D=3D 0 || rga->version.minor =3D=3D 0) {
> -			if (dst_w =3D=3D src_h)
> -				src_h -=3D 8;
> -			if (abs(src_w - dst_h) < 16)
> -				src_w -=3D 16;
> -		}
> -
>  		scale_dst_h =3D dst_w;
>  		scale_dst_w =3D dst_h;
>  	} else {

--=-ILpt8SK1pUoNPTw2qXEH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwGnQAKCRDZQZRRKWBy
9I5zAQDENsSWZWYp+AVmTDcFYwYqOZBs5vG6vPbEM8JLE0qmywD+L4sImLRB2DW8
3eXQUNCT5EOVLkntXGgixskKFIem2ww=
=3GCb
-----END PGP SIGNATURE-----

--=-ILpt8SK1pUoNPTw2qXEH--
