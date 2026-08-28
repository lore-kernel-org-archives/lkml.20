Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641E434E741
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942604; cv=none; b=tAkPCdw8wR0IRBaIUNAwTxlHj4shmaUdBBOh6Yrn2TczBfWHqEMKUX1kWFg0WOlIvHDDQLZDVu5anIQlo/JXVeZWxq+zInsbSsbhB5wqqoO9NXcGg1q2cf+1ALq56bxJ5YiMGpB1HnfSWxIosgurPpYVUgDBJFBlRrFSzQDDK58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942604; c=relaxed/simple;
	bh=k+iRkGeEFWT3ZM1rado6gHZdSVVxl7Y+dzPCyYTaW2s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mrkMpVMukKQ4wC+HsXUzRBTFrQo3aoWzVa6Y2RPZjRhHCgtuhS3XaLRp0Pyq5BeMeZ950DB5Rj1EKLLA56H6vZL2CnZceBjelGdihXLSnEhxNwRgy94C8og1TyLHyzeVOQYU7Esg3CBcKVeCSnXraydsZbi/F22T/Fv0EpPDstU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=uba2LQA2; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="uba2LQA2"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52d7ef16f91so6187761cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1787942600; x=1788547400; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpjcikU1Xtv7kcDDN0w8UTaElMDIrOkZ44TI5Rss22o=;
        b=uba2LQA2tc6TNchfbyyYSgM+KMc3PM8OlREm9x1tjYE61Pq9atT2VzJbopzrwC1Vav
         AiGbU3rcKWdcfE/XzXtG7DjbO/af1nZLlKJLk7j1zHskp0Gq1v8wu+JFJ1S+JUpX3z0t
         A9RkgFxJ42XifX5FxOPipvx4Sf1OLK0EZYFCu9ZvfE5qKqugtcUcph/GmPedI4hpKs2R
         yXZt8hC14VXeBwqRyNtvNgHvCWIADYA1ftNroQkIm5Hd9OFkcZXcTZsIyVvHNcxwHd6l
         L3pdylIDNL9sYBg5of8NQ5ggAwByGcJkTMxtxRXXf+MezL3wN138ruUrmQs1hOLOf0HQ
         WBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942600; x=1788547400;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpjcikU1Xtv7kcDDN0w8UTaElMDIrOkZ44TI5Rss22o=;
        b=g02DVe0HTigL5ZL92bkosf96AI7nObrSJaVUE5mgG9nCwFzXfPbAzUbCn562Nqrmz6
         c667GajiINiuFXCtPPPx/lijPyoDGnnnx25iZ7oZh5C328/rPO53t9b6BDNsseNQsvQp
         Y62lZDymE6b8UmpCoe0BaJS4gRrXQBJN4fhundB9nsbvA+vJttGArOZ1+7VnRoBse6Q7
         CQTlnLGoBUTLJLZbjzfPNnVf0n5xZZq14PT0nPGehHgi4FU/YZFYxHVF97cxNd8A3UaU
         sI6ID9s9l60ZdHdR+2Nm2ztbSud+w8VA+o5gsjf2XjadO27cIVsRMDumVhhKaLS9qfY0
         tjNw==
X-Forwarded-Encrypted: i=1; AHgh+RqLcNFm7CqZ5DMDxK5VulA9ZDqo1rEqMCt9EACopd+sI8KawZmY7idXPxMqr5AnNrTxa87T556m0SwklGk=@vger.kernel.org
X-Gm-Message-State: AFuF++m6HHszpczp5FmB59zXhYUFvKsXPszGLzUci87myOw2Z1nsuHH6
	NVQgsl2SVd888R6tOuRo33yrS9oU4S4l5e0mclGdOkwI2YzimtaKoI2O4yYoKTEXxJ0=
X-Gm-Gg: AR+sD10U7+fqi7FuYog69IlpOz6mCqffvA5bkUEWXOhCQZH70yiX3TlYDpUkgZs1Lyt
	yM0LoghhoxF/CCmBKg0SyNkXmSCzhHDwZdzCxf+Qt+eCXF/QaTutWHjl4yHaOanhGh57o9XmmJf
	re8TzRh1XBvQyn28Oqj5hLrlKcnhfHO9nWeYk2rNRHGAqP7BaLRkdbgILkpjYryzJ6UunlxkOC0
	7KE9WpZfCf7STE8YkCvjMaMPFOr0q1cwjuu82pWohdDda+f7HutCaUudK+qA0dPHTE9SkOZLjNE
	2ZR9lk+5V6R/KxyG4Hd0Twpnk1wabETefgwi2/Cn/9dmncqtSWbUZ5smcLsIML/MO2TPCWWzKIX
	IZdqF3bYhkliErHlI27kRQHNzLMaBHNF/DRyozzEXAGgxlU1vinp2PCN/+QfdWKgemsv88mUscl
	4tliP7ZxLtU9jAv2I0dUSkiC9gjXEzbLU+CXbOeoAScZIuTvxyKXVu8xco0/UvUYBi
X-Received: by 2002:a05:622a:6107:b0:528:601:301e with SMTP id d75a77b69052e-52fb95f60a4mr107958891cf.26.1787942599835;
        Fri, 28 Aug 2026 11:43:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::5ac? ([2606:6d00:15:e221::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4514f3esm21370506d6.41.2026.08.28.11.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:43:19 -0700 (PDT)
Message-ID: <d93356adbb52141365b5afe13d73fb824ef4e23f.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-h264: Fix memcmp() size in B1 reference
 list comparison
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haotian Zhang <vulab@iscas.ac.cn>, mchehab@kernel.org
Cc: boris.brezillon@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 28 Aug 2026 14:43:18 -0400
In-Reply-To: <20260828021739.25766-1-vulab@iscas.ac.cn>
References: <20260828021739.25766-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-EhY9WrS0/N/5NtB6wlfl"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-EhY9WrS0/N/5NtB6wlfl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 28 ao=C3=BBt 2026 =C3=A0 10:17 +0800, Haotian Zhang a =C3=A9cri=
t=C2=A0:
> In v4l2_h264_build_b_ref_lists(), the B0/B1 list equality
> check passes the entry count builder->num_valid to memcmp()
> instead of a byte size. Since struct v4l2_h264_reference is
> two bytes (fields and index), only half of each list is
> compared, so distinct lists can be wrongly treated as equal
> and trigger an incorrect swap(b1_reflist[0], b1_reflist[1]).
>=20
> Change the memcmp() size argument to builder->num_valid *
> sizeof(*b1_reflist) so that the full byte length of both
> reference lists is compared.
>=20
> Fixes: 624922a2739b ("media: v4l2-core: Add helpers to build the H264 P/B=
0/B1 reflists")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/media/v4l2-core/v4l2-h264.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-cor=
e/v4l2-h264.c
> index c00197d095e7..1b1421caf488 100644
> --- a/drivers/media/v4l2-core/v4l2-h264.c
> +++ b/drivers/media/v4l2-core/v4l2-h264.c
> @@ -440,7 +440,8 @@ v4l2_h264_build_b_ref_lists(const struct v4l2_h264_re=
flist_builder *builder,
>  	}
> =20
>  	if (builder->num_valid > 1 &&
> -	    !memcmp(b1_reflist, b0_reflist, builder->num_valid))
> +	    !memcmp(b1_reflist, b0_reflist,
> +			builder->num_valid * sizeof(*b1_reflist)))

One last comment, I think this would be more consistent with the memcpy() c=
alls:

+			 sizeof(b1_reflist[0]) * builder->num_valid))

Nicolas

>  		swap(b1_reflist[0], b1_reflist[1]);
> =20
>  	print_ref_list_b(builder, b0_reflist, 0);

--=-EhY9WrS0/N/5NtB6wlfl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCapHWxgAKCRDZQZRRKWBy
9D5hAQD5uGsohrgmxddLCQ9VT8Nsso+m71cU2QJcybfjw84KogD/an36TroA8CFI
b+0W8ellAI+OhfBX4jig/Xw6EuAyMAk=
=JMRA
-----END PGP SIGNATURE-----

--=-EhY9WrS0/N/5NtB6wlfl--
