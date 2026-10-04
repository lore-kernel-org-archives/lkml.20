Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59528384CF0
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791113831; cv=none; b=LmLBA0xaLXWqTfz53z0XxAlNfNzOux4Tb0p6irAW8qM734+hYnbsEtQyuvagEVOfBSkrn9vdL0SKSyhiaQ+bRM2acBDMXT0QdbmwCFYe/HoTJkuvWqzFtyUBgXTM6CJSYV9aYJBErihTh7hKVKXa/7NxzEE60gJgBEaOkAz5v9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791113831; c=relaxed/simple;
	bh=XSirWnaEpGnOZT0I0hox6nXliuilOB8awouWVRZczJM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pHJAd3I1FOB9cAoF8SuniEAxmKz8l6mkkY7ioCiIcY4x0NptW4TCBPzX10lZTTxpOKuH+BM3/uIFeE/Pl5tayoarXV9rrLyOmGUqldixGP0I2FCeCTrCEba+cdMhx/iLPHKRZt3BKPcirVMU4+QRs9IC33W4R/yA6BC2L8pT8MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=xTaTHpKQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="xTaTHpKQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso8673705e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1791113826; x=1791718626; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCycmrnbLiadarvls212tcJ1S62H875kwmCVzkvdKTE=;
        b=xTaTHpKQg15PoeYfVbBZPJf3ANYhLnHqiBemvEPnoZv5FrEcr0XqWiuqY6iKj2xQ+c
         uNe+snFs703SpL9NVK+Zdsztnmm54A9qPCodsrtuFy6lz/mp1OwdFvdcYIbKvqskz6gb
         VWUaoUVlHuj+XL4WDk2AmIrTzBPfJc7m7zbi1bx2ahi0DMftkr0FMN0w/pu8IZ0eO1AV
         mbdCTY7pgcGLRfwaAWtnRIJxv4oKbXtpItsFUjPa+fYngR0A913xAIO3drAsinMmxyC3
         qxlZi8VGSsV58EPyYjS5a7phieG+sEp2O1MBgAhpyCjrmV7AP++aABRHAqA9AehG3tHC
         Uy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791113826; x=1791718626;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCycmrnbLiadarvls212tcJ1S62H875kwmCVzkvdKTE=;
        b=hu57rErKcQUqDVvsliiGdOSaYOwXHhgPJCh9v7k2psCH/MT2ZikzEaqdj9B6EGfNng
         QpuoA432k2OGuMFWLlpX7Ou1RnuMmtZREKWuLuAoYjDx6Bq3P7IN8kU1YRuvvEHFcCCO
         EwPOD81OokMX3BibHZA7o7LwZYcZdG2nud6r7g1oTMH2zPnM31rFLNhYquqnY8XyZTCG
         T59QWuyj0VgniB5LIcqPIccSbRlodhK4YB7w5QU26LWRg5K490DCcFR1Pl9rkys8jENM
         1vO6j/O5JiSXyHAiOebcI0LDaQjkyfFgeUgYRbRvReg5DBMapH+BINvNCK4AcDMweopY
         jYzA==
X-Forwarded-Encrypted: i=1; AKwUvBxJYu9JT5JBzMegAdtSvVzxPiFhEmWhV8jx9Xr/1VKzOFyaumJ9b5RSXWoj801O3rJ5yAAcqh4NDjTZc4M=@vger.kernel.org
X-Gm-Message-State: AFuF++k931aLwAkOekOZOl1pnh2uTA/DT6rgatVazApYisfEiUe0R64u
	xN9wuM3RkKTHYKbnJ0QYq1MJstC/RN4DXi7oOhQjBZ5CR2nI5F7OxvW3ftdUVyR+8mg=
X-Gm-Gg: AYBFou0+gH3X1dpZK7VcNqerzSgBfqf+jWW/0xDTLrkiTJzc+OJpGTMTDQD7aBWH3og
	wdxRLsVTbZgwjsrAA6MOAlW2manetRZdj9hhMfn29nivDUcgce4Ul/CYcEppUQJ+5AHHFvwhHb2
	b7pFsNTWGPrI/09BhN2FmQlevRNlUpdsZHcGoepnpKk/JZH+acxR3WrAi0ekjHUknjC1Si36Z3j
	VC98O0oYG7yTkBkPEYgYXrqLKZSV33FbQG9EGIdTU71TWg1Bclvr/B7M23Hv5osUmc1XnrHTR3n
	HmEKJUu/6vfSUAak0+1nZyXlybiRl/2CJjt2zXNnqggSm33ikylopoaujFQDwnoUH5Q7Hf6PL2i
	6O/6P+vQ+ix8loGQaDIFGaeyhrQ71cI5X4cvvU4FotxV8KDAeUfi/9N4YY1klojA6BUNcv5qci1
	HleVAnzGA9wPKogMKSQK8JgqqPubtwENd01PADCBt/vVTAPNNYtl/vqd97hsuvFRZgOYQc89WQC
	hk4u4WkMnKJRuwSnmEKGfObl8FHJfZagor3TV8TjkHSGndch1d3D1YrRmeeNQirTo0wmfu6EFUj
	dAuXCfZ8mNQf7zqk5sDXIoNmGtnxmz5Dmn4N3j4K
X-Received: by 2002:a05:600c:4594:b0:4a0:394f:d4d1 with SMTP id 5b1f17b1804b1-4a0394fd57bmr98861945e9.20.1791113826499;
        Sun, 04 Oct 2026 04:37:06 -0700 (PDT)
Received: from ?IPv6:2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f? (2001-1aeb-400-6f00-73f4-bfe7-a3e6-c16f.ip6.tmcz.cz. [2001:1aeb:400:6f00:73f4:bfe7:a3e6:c16f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm291740155e9.1.2026.10.04.04.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:37:05 -0700 (PDT)
Message-ID: <10c61b7f06512987939b11758a2180596f3c66db.camel@ndufresne.ca>
Subject: Re: [PATCH] media: vicodec: fix NULL deref on oversized frame
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: moonafterrain@outlook.com, Hans Verkuil <hverkuil@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Dafna Hirschfeld <dafna3@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Yuhao Jiang
	 <danisjiang@gmail.com>, stable@vger.kernel.org
Date: Sun, 04 Oct 2026 13:37:04 +0200
In-Reply-To: <20260803-vicodec-fixes-v1-1-f3cc40cacd05@outlook.com>
References: <20260803-vicodec-fixes-v1-1-f3cc40cacd05@outlook.com>
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
	protocol="application/pgp-signature"; boundary="=-mQpu8aEWS1b4f1YqchN0"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-mQpu8aEWS1b4f1YqchN0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 03 ao=C3=BBt 2026 =C3=A0 15:29 +0800, Junrui Luo via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Junrui Luo <moonafterrain@outlook.com>
>=20
> job_ready() only honours the is_header_valid() verdict when
> ctx->comp_has_frame is set, and comp_has_frame is only set once
> comp_size reaches the full frame size. Since the copy is clamped to
> ctx->comp_max_size, a header advertising a larger size leaves comp_size
> stuck at comp_max_size, so comp_has_frame stays false and the failed
> validation is discarded.
>=20
> Control then falls into the resolution change branch, which calls
> update_capture_data_from_header(). That function re-derives info via
> info_from_header(), assigns it to q_dst->info and dereferences it as
> q_dst->info->sizeimage_mult, with no NULL check of its own.
> is_header_valid() does check that same info_from_header() result --
> if (!info) return false which is precisely the false verdict
> job_ready() discarded above. info_from_header() returns NULL whenever the
> header flags resolve to no supported pixel format.
>=20
> Drop the comp_has_frame conjunct so an invalid header always bails out.
> The resolution change path is unaffected, as it is entered with a valid
> header. Oversized frames are then rejected by device_process(), which
> already returns -EINVAL when comp_frame_size exceeds comp_max_size.
>=20
> Fixes: 3b15f68e19c2 ("media: vicodec: Add support for resolution change e=
vent.")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Would also be nice to follow-up later addressing pre-existing issue reporte=
d by
Sashiko. Seems plausible to me.

https://sashiko.dev/#/patchset/20260803-vicodec-fixes-v1-1-f3cc40cacd05%40o=
utlook.com

> ---
>  drivers/media/test-drivers/vicodec/vicodec-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/=
media/test-drivers/vicodec/vicodec-core.c
> index 318e8330f16a..dfc8dde4bad6 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -654,7 +654,7 @@ static int job_ready(void *priv)
>  	 * if the header is invalid the device_run will just drop the frame
>  	 * with an error
>  	 */
> -	if (!is_header_valid(&ctx->state.header) && ctx->comp_has_frame)
> +	if (!is_header_valid(&ctx->state.header))
>  		return 1;
>  	flags =3D ntohl(ctx->state.header.flags);
>  	hdr_width_div =3D (flags & V4L2_FWHT_FL_CHROMA_FULL_WIDTH) ? 1 : 2;
>=20
> ---
> base-commit: 075b74841bd0065a3bda3440873c747938e69b68
> change-id: 20260803-vicodec-fixes-f8313923e415
>=20
> Best regards,

--=-mQpu8aEWS1b4f1YqchN0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasI6YAAKCRDZQZRRKWBy
9HBVAQDhpEaQPOacC97iOxJS8ZkuWFHpriBCqlgYuzhs7bmuAQEA8jPdMJBlhgjs
QEtQ5b2LLILxF0/ocNbosQ5ltJXf+QI=
=Fmqd
-----END PGP SIGNATURE-----

--=-mQpu8aEWS1b4f1YqchN0--
