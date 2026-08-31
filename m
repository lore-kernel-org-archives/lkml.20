Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE2440BCD4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180759; cv=none; b=Kk8Z/x7rp9fOLWUzhyMw1opUOe7fOgYv1NUU1opGllu8tonNGfeyAWadeQiS6QUBDIIfOAol+AQBqaVVb2bBGK4khtmrEBcD/AIoOmel0gvEs/2Ci137BRMt/iniUFWKSJEfylDt6XkbZ0q1l0P16IDd9QgUvO+NcCW5uJj7C34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180759; c=relaxed/simple;
	bh=MuV7sYWcXdetDvVDKuX10YVBfcbWwnsbvKTFuts+2Ik=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dvZboeBB3QAaU3actYM73OV4odyeYyB2lSG18W6HqjdtDvGKqEhxjTPJotbZMrD+yK7JvMX957Rw6T7MHXrbp2Dt8n7mypqVRNrSwF75u571JcEazpIy1Quk/rz5ptJEzsNmhHul/qHb3C0lcuSt1DvUunzu9cvLgOK4UglSnL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=iu3funep; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="iu3funep"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5e41fe5a4so1861855e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1788180744; x=1788785544; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+dyitONQW+nIbXDaTV98uOhd6PVnLQm7sZFUIqGIkYM=;
        b=iu3funepX4rfD8UXt8B9MtzcWzzmxb4Y6WJyakC1jnQBh/TQSzM6a1R0BGdg3vNT2X
         D+UPK2ArlNj9RIrA5Mk6s5G3VC4x+r9lmLFtFwL0TjPA0/xu8QBf4KkpjXo8Cx+huNBO
         f6NvCMrKOXdb2oz76e1dPvzmDj7DuEYrcG1DFZ8K7d0Y+VvS3djDQhGzMgEGonYL1wfl
         MffWoIQNxYOUn3k5R/1Aj9sKJ9gY2oyQS4fERpd8IwHGf8LP9ifiuqExUtGKyzvVwI5c
         Qp/h1z0Zhc0rfsle6LlNCG2i7Zn5nBohKQHNIRZPkABOmCuXj4YY6XCqUjwWoqJyaMjr
         o+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180744; x=1788785544;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dyitONQW+nIbXDaTV98uOhd6PVnLQm7sZFUIqGIkYM=;
        b=ICUJfrL+SMeRCUDIaicn4WikQZwBnFDyLrrgAw9bnBa6c0K4NySF+NBg6KzM+R+xso
         uzSE7Ad2inXwl2e+zENi87IHynXCuW6pEtgpfQccl47D0WvHmDV1tSZ8bOvcWAzCa5y5
         nPSzK1ifYOygESyzwmGSAgK0qWCb8yf5wlK7HKUIhQ7IS5cDdL3S2I3zHVtHheHiMisX
         aUSJ8FR7L7No2iBjXhcFu3PjeWvTgXGs5w623RND+rcZc8u6Tlpj+qnZagmJPYNesICx
         xM7H4xjOSOVKtA/549bkHiYWS4cG0nCjTHxzXeu+8ePu5QPDIz3lxP2QNTkVzGgrYl0b
         Lhbg==
X-Forwarded-Encrypted: i=1; AKwUvBxbYmru6HSfXkXRmZFvQUnk1JQZpF/1QEgtgwXYV0tTSYcKbUpeMGFquwjYxU2ufdbp0XDQSh1ZoppuiqM=@vger.kernel.org
X-Gm-Message-State: AFuF++msT0HJYsoiUDiaHCIoQKABxgdRQ+d/W7W4cBSAH4CX4Kx3G+E7
	rnhQ2AezriJ9w9fDs+Hq5ED6IEgA6namb99sy5U8Mg0zc93Ihr1HoQo7z7FZ2dKqLgCqhld7ua4
	mCXZz
X-Gm-Gg: AYBFou3WLR/dhOlyeaxCEm7aP8v8t8776K1ObRRImZ1+fateoR+bba815yayLRYiOGr
	u+nE2Z/rxdli66BWip5OWW4MSdjatCxs69qKYZcj6fKX+B4o9y1ZoxAwWMelU3OGd/rSOiUuS+B
	JrU1De4Y3Hph4r1wVvp4mo1uhQcW0YfJIb3oNhL1EnKkNsfpI82jww0ujnGEk3oBwj9MOD1RlU+
	+yfu5C431GfldvvrrROQ7DH6GfzxZCubuc+qsaVFAsMplmQjAZCbbyGExLJ2oQQlY1WmmcwUgqZ
	9hLG/ceK2lhWOJN+Al14rYs3YmUOtpGXkOQ0EtGz+34/kOpVGcgnyyH19YD5oUSyIhQ4a06h/2B
	PVvWfvkgLkQFfonlgkL1WkgoCYNWm3zVTVe58DgI7oIMuKn6X2D2QfTkvcl8BV3kdrjDyqEUhDv
	uEjfJkRuc+P+jYhupD9EQfQZ8vQeLOQXclwgIOYmaTICZrdfTR2MD+y3N+xCO3SuZ0
X-Received: by 2002:a05:6512:3050:b0:5b2:aaa2:1d8d with SMTP id 2adb3069b0e04-5b5e68b163emr8921790e87.2.1788180743772;
        Mon, 31 Aug 2026 05:52:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::c41? ([2606:6d00:15:e221::c41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a11f9esm2117685e87.72.2026.08.31.05.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:52:23 -0700 (PDT)
Message-ID: <05bb53d6bd1edb6bfa17fe2ef1ef3e0def32a279.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: v4l2-h264: Fix memcmp() size in B1 reference
 list comparison
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haotian Zhang <vulab@iscas.ac.cn>, mchehab@kernel.org
Cc: boris.brezillon@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 31 Aug 2026 08:52:19 -0400
In-Reply-To: <20260831055450.2248-1-vulab@iscas.ac.cn>
References: <20260831055450.2248-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-myHWYkoGcoXFvyChDgSr"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-myHWYkoGcoXFvyChDgSr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 31 ao=C3=BBt 2026 =C3=A0 13:54 +0800, Haotian Zhang a =C3=A9crit=
=C2=A0:
> In v4l2_h264_build_b_ref_lists(), the B0/B1 list equality
> check passes the entry count builder->num_valid to memcmp()
> instead of a byte size. Since struct v4l2_h264_reference is
> two bytes (fields and index), only half of each list is
> compared, so distinct lists can be wrongly treated as equal
> and trigger an incorrect swap(b1_reflist[0], b1_reflist[1]).
>=20
> Change the memcmp() size argument to sizeof(b1_reflist[0]) *
> builder->num_valid so that the full byte length of both
> reference lists is compared.
>=20
> Fixes: 624922a2739b ("media: v4l2-core: Add helpers to build the H264 P/B=
0/B1 reflists")
> Suggested-by: Nicolas Dufresne <nicolas@ndufresne.ca>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
> Changes in v2:
>   - Use sizeof(b1_reflist[0]) * builder->num_valid for the memcmp() size =
to
>     match the style of the memcpy() calls in the same function.
> ---
>  drivers/media/v4l2-core/v4l2-h264.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-cor=
e/v4l2-h264.c
> index c00197d095e7..e2b7dee8ea14 100644
> --- a/drivers/media/v4l2-core/v4l2-h264.c
> +++ b/drivers/media/v4l2-core/v4l2-h264.c
> @@ -440,7 +440,8 @@ v4l2_h264_build_b_ref_lists(const struct v4l2_h264_re=
flist_builder *builder,
>  	}
> =20
>  	if (builder->num_valid > 1 &&
> -	    !memcmp(b1_reflist, b0_reflist, builder->num_valid))
> +	    !memcmp(b1_reflist, b0_reflist,
> +			sizeof(b1_reflist[0]) * builder->num_valid)))

I don't build test my suggestions, I expect submitter to do that before sen=
ding.
There is too many closing parathensis here.

Nicolas

>  		swap(b1_reflist[0], b1_reflist[1]);
> =20
>  	print_ref_list_b(builder, b0_reflist, 0);

--=-myHWYkoGcoXFvyChDgSr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCapV5AwAKCRDZQZRRKWBy
9BnGAP4xfqnKnsdRIWBBLNoiynYwVZ1Y0605OyyLbR6tvCL7BgEAhp/UiMQUvNUp
wwyQNZ9VJKMA7LbDRvEsuLpghk3g2wk=
=cpK9
-----END PGP SIGNATURE-----

--=-myHWYkoGcoXFvyChDgSr--
