Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BB6314B6E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715662; cv=none; b=XqZEHYlhNccAPO4LO6QqPo4EfLjrQ+7SoHkPPmzjfh9iS//qnI/D1eDRAuGOSsaQa25tBSGcH/ohtP6wyZlyTIVvxyPyJV/U8Rdu6Iu640HJTEF19BkWoyLV98JQXNI88Z6GseyPaHJog0zMts9urd0SQMUhs9rERqeeQ9z0kP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715662; c=relaxed/simple;
	bh=UoQrgOIT9pT4CzAhwaqrqGXRM6nIVCOsWizitR0s6Lw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CspRy+/M8AGcn/WQ9APoqfpaRW4mWKo8wl43ZC+s6TWXpAmHOGEplKcreLrj7o8Y0KBigqcZ66eFN6k7RxovjQyGcOV1c/ceaBs69wV+LN1oxPKQ1omkNzdA8qhlMChVKRxt3C3aVkndq5xYlWpXZ4FzvpIjpFKPESZ9wyYeP6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=F6haQvth; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="F6haQvth"
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5ce08b5bd3dso717228e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790715658; x=1791320458; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WFXVZDT0yfhcBTuFPg21aJm8jhlblvZ+mRIY0J9dPY=;
        b=F6haQvthqtouYa7WksLEtpww5oRxVMFjh0nSB1bndfTjKVZ4dZ3gr7aI8zLWNcV5lt
         1hi2zzRwKsjQ/jTXheREet4B5NnFpo5n26wyITm+Su6zcUqU6L2rfRY9UUrUzq3dpdmq
         9qkp8mO7uj1vLIUtQfZ4I7btlbotc1+CXLTspVD7/Y5mk59u1z0nDEqufmWKR8WirMuR
         9nDUS719+BG0YBnH42dm6VMaDl3JegbA4UsZiMmvQHkqwwUnfudUEV+n1KD9KZYORiOv
         kcfLYoU6a+C8Us9Q/Vdfe/8SfDD5lCRE7KK5hWOjbkOE2TCmgLTinOBvXG1NXtODOu+r
         jW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715658; x=1791320458;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WFXVZDT0yfhcBTuFPg21aJm8jhlblvZ+mRIY0J9dPY=;
        b=OXBDfDkT3nGKJ95EUv1HEUiocvmoWfe1VCjHHEuILhwt9BByJUsvv60q9T+Vz59w3h
         Wh8RAB46sHUBpLJWO4TMYsdUQ+MM3ix+HSsajhEVugbilD7Yvd9Y4JQCEUuFzyfnRP2M
         4jY9iKQdOl9M2AEmr4FDPErxRbeXkybiYx0BGnQvCHqE7ZM6iegvh6yEiPw3WGD8pEZp
         kF/laXlemnAeuC9nx7u2X164uWk8rcEa8MW1hNRhld1MNPQoHWUbxeg2LGE8DAwEivuY
         +1wxHaDqq1PSQzVsiRiBV0tSWiPe9gFGb6+LSTDzYRAUCt0NiJppX1OJJQBb3wQzuZ9Z
         hRzw==
X-Forwarded-Encrypted: i=1; AKwUvBxw7OjFN8q8zdiVkr6Yl8W53+JQJ3+hgWsH5L13bXJxObWuMNwpxnwAElXplnBJeELaZiXnL/01xQJQAUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8Aa4E5fcNbJ2rjkCpYc1rW58ZwDwkxJ5Ab3sGivwqSRFnefwf
	9C2uqDBplaDqINEGzN/ZAF51ob4NVsWw7BGuRcALhQWwz5OScY+s+EV9SzS73Q/Im34=
X-Gm-Gg: AYBFou1C10sTgukqO8B5OX7GDAfVC+hezrnKS+hUgnnxQ0hWWZacpEbYGJGL3xKmbJm
	jioBhomSkoijZ2DS183H11/oX4uCQJ5M/6ImGPPaneGJ9tGD0e0LyjkYzebYEg/z4u9wM5e14uc
	h4+/ezFQCAoCeHoVkOTjuh4672BG05AtobwKKmVfteh0ag3jI7JHDC2pPxfMkDe9k5ov1OXIYKh
	t3rlDQ/+yM1tu3ZP9tudL3/zayzl2d370Shi2PjcPumlsaCWFQpdKRrMZtAKR76N9T0B8AswYto
	gqb2H1o9JBg5D/9Je6XxlyAthentKmrgftHcWgiATO59E1ClHCNfW+Vdoup4xAwty6dEFg+ievg
	uswlciix0OEkYRNTnvCFwtLqnpab/wnyK20V7tTGwGqUeL04AQ8FtILZjjGyYVW8CByg67x5rdc
	edyVOHLP1hjyfMbA4JTrLUGy7T4BI9UrZ8Hn9a+O5pQHU7To+ZohWEwyz6Mjk4DhRjU2c6OzRVy
	Q5uUJMx4P73Xg==
X-Received: by 2002:a05:6102:2d02:b0:7aa:1b48:ca3f with SMTP id ada2fe7eead31-7bc39333beamr267682137.3.1790715658269;
        Tue, 29 Sep 2026 14:00:58 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d4e778bf23sm1128224e0c.3.2026.09.29.14.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:00:55 -0700 (PDT)
Message-ID: <2e3c6c4eb72d79ef8b995d6ae62a6424685ec281.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-jpeg: Fix runtime PM leak in
 mtk_jpegdec_worker()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wentao Liang <vulab@iscas.ac.cn>, angelogioacchino.delregno@collabora.com
Cc: bin.liu@mediatek.com, hverkuil@kernel.org, irui.wang@mediatek.com, 
	kyrie.wu@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 mchehab@kernel.org, 	stable@vger.kernel.org
Date: Tue, 29 Sep 2026 17:00:54 -0400
In-Reply-To: <20260917100247.2145872-1-vulab@iscas.ac.cn>
References: <20260917100247.2145872-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-LdOO8KXcg0f7Ano5ixCQ"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-LdOO8KXcg0f7Ano5ixCQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 17 septembre 2026 =C3=A0 10:02 +0000, Wentao Liang a =C3=A9crit=C2=
=A0:
> pm_runtime_get_sync() leaves the device's runtime PM usage count
> incremented even when it fails.  mtk_jpegdec_worker() jumps to
> dec_end on that failure, which does not call pm_runtime_put(), so
> the reference taken by the failed resume is leaked.
>=20
> Use pm_runtime_resume_and_get() instead, which drops the reference
> again when resuming the device fails.
>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 8c684756d5fc..ed1d5858c942 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1732,7 +1732,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
>  	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =20
>  	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> -	ret =3D pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
> +	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
>  	if (ret < 0) {
>  		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
>  			__func__, __LINE__);

--=-LdOO8KXcg0f7Ano5ixCQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwnBgAKCRDZQZRRKWBy
9JxRAQCaqpvPcMxkU8M6x7Jg8iRFYx/F7tQzZ4yTAJ0dpC4WDAEAkMVIPHkUqYox
NeqJq4h74JpK7UjBvsNaj7x4tjst7QM=
=Fvo3
-----END PGP SIGNATURE-----

--=-LdOO8KXcg0f7Ano5ixCQ--
