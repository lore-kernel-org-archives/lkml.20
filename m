Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989609;
	b=MbZUvRc4uFig3koWd84ggvqw3cHXm035EdZKZLKrceuMoDJx4xNiM9tsDRzHWfQkAYDb
	 4zblbVw6e42dpvTpPoT5PlU0qWoC5mEJfgmSZFhVujOTJI7vpchk4qdCTw0PFyLkoZWp/
	 k32p2Cz3ZRUvMd6Z+yWdSahxIasTeLV/5IqjntmpSuOVZXDLMlnQmRbN45ZSam/BsoGT0
	 RpDQaoQLpcmUAePo6geQVGVOdb51IJsHfzTmlOW9UZcGrv2hpqVOrN+4JtluUaELoawLr
	 RHnoQx1OghpfjbI5YWdHaZU78zpCCNety8FAdfHkUOpJspNpHX4PALgV96Al6wV+6Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989609;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wspKiW0hD3dBrqADNHKAUvUnRHsMW1qUo4TQycTg8jY=;
	b=jc2BqYuClZnLVBRhe6VL/jjYr1OUjjvieAhwqG6PDthlR4+k+9YMjcZzYgFmTKGrEPVN
	 76d9zOwczEHx7OkX77d0fIH0haq+xfx99A546pEwufYccAPhGd864XHeR/jskvID4s0uA
	 qEDokCZhyys7uMRlMtLlFb9xVf2lsIDoNUBaD1iYThjeK4OHWtvw1gH5WjF+s1Kz3EmTg
	 GI/MLDVn27BymRAtvP9iS1R/+lrQL3utf8kwqwmrA66HLAJZiFMVANFG94Y0fXgyRHaCU
	 gGvpsdXs/i5OiU0omRpUTSjhNcSzdouBDg/zYTPSOytg+JWrdCTVfhmwHZEKFX0nkvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.win;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33234606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33234606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4ceaee6770so124228166b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:26:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989607; x=1794594407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wspKiW0hD3dBrqADNHKAUvUnRHsMW1qUo4TQycTg8jY=;
        b=Wpi9fRY+GvXtNIZC7khQF9FYiAPQvLYDqQWOFjtkHcJAqmfyqjMVM3cyf4LbotRgQM
         SKANAhMW0T0TxDEAvaV2kIFiyQEJxGAfDpveXR7VR9RTbGLh2mWP3CBwPNNZJWASzo+R
         zu9huBrkRFsQ4yza/zq3fIP+Q14Z4SYXms/Va+irJqjWyQzuqNHEO5LUJ8YEE8CLC4i6
         LYRc1HJiBxTGd/MgcJL0JeM1A/2xnUjfmF5oPBk0MykZeHfeUTQCc0jrh11udztMFtIK
         2y+KdHT5mUL4aImv5h6wCHgbs8eaMHXnYT8pQTYnaK1NQ+eBBQ4tTnxb8JwHUlYjWOSn
         //Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxa9ONV0/678QkZzPHeBYnQcJzChEMhPqH+0Wm3ggnZwP51XSOGw/Lv/8LAjbQo2tGPzJCTaRUSlquf8YM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SXAFfieSc6McUsl7M3sAs3Ieue/bRbtKk85jdKgl9UkKQZf+2
	L7YUQxvbCACklZTN4WRoiiB7jL5/L6/bWDZaNMglgbNvuDdepjrks4+zdj6zOiFnFIY=
X-Gm-Gg: AYBFou2f+MvxXB/hfsbgVUrm9SAn3okHV3ruNGJix+moRkvb7ur31Fs4ksvPrOxwg5b
	l4eaE8LNXwA9GDUqZx+QjvBz9EaYsqYemrbE5/LT43mPhlw4iOYAfOHFxM8keo1wPrg0Gb8q0Nf
	VCyER9lY+xAXNmMhDRy5TdJv69LccNE7R0AvZBIBRgJQV7/k1m94szQjupdUaxtWi8B8BCSdVvg
	Ie4NvW9JmiXMEltSn9LObiVHxripNJ2mjj07YkaxCPBR17CR9UJWbSK7fcuA8PnN8Bxy66B8WDR
	LGiuCpQ2amv6leVJK300hsPgv1zfAG88VLimU8GjnMqgvaaf7hcB5gKVrRm7e5y+PcrGp+lGtmh
	GuJQiXin4Vi5ZW2xzCXNKVg7l7K0/AaspkAosfgi6XgjLPNBj6/pS4K1yXEJNcpLQtALz/GMQxG
	t3+D5nWfEpIhBd3Op2vOdCqIIaIl+dOAlQxhUYQcnz3h4WDDLHBmKCGKtRAKoozmCjSYBwFttcN
	AmYhzHNABh+S9hrI7FYsGqTPlrrATwGdlVTDV0s3OrRM1bf9/5mY22j09wIU0FVsryzJXZuW9Y6
	FSDDAkyCi6aJlsJ3BJs9WRE76SC89ODatnZQ0JHlHzhoIJqm28bRrsVSgpk=
X-Received: by 2002:a17:907:1610:b0:c32:110d:682f with SMTP id a640c23a62f3a-c4d35429a08mr314998566b.18.1793989607449;
        Fri, 06 Nov 2026 10:26:47 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac21dsm97870766b.12.2026.11.06.10.26.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:26:46 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso1168616a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:26:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxNSdXz2oKqBwZ4OVueB2gOi0KW73nOi/eqQwsiZM+XMJzRpoh6yZEGAc/55OIApvsmG03L510+jBeBJ2w=@vger.kernel.org
X-Received: by 2002:a17:907:97c3:b0:c46:5973:2a1c with SMTP id
 a640c23a62f3a-c4d354f2af0mr301446066b.37.1793989606141; Fri, 06 Nov 2026
 10:26:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928042641.307683-1-pawliczekerwin@gmail.com> <20261026034429.742489-1-pawliczekerwin@gmail.com>
In-Reply-To: <20261026034429.742489-1-pawliczekerwin@gmail.com>
From: Ignat Korchagin <ignat@linux.win>
Date: Fri, 6 Nov 2026 18:26:34 +0000
X-Gmail-Original-Message-ID: <CAOs+rJXfSBYrWTiuDDs=a=fHJjQfZmgiXtL+inOn_TEn+bDrqQ@mail.gmail.com>
X-Gm-Features: AclHuK-wbvCyvvqqMYIWIT3bx5pHhKw58mEs2iXFDK51EX3tNnHQ9F5CYVQcD20
Message-ID: <CAOs+rJXfSBYrWTiuDDs=a=fHJjQfZmgiXtL+inOn_TEn+bDrqQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: ecc - Randomize the initial Z in ecc_make_pub_key()
To: Erwin Pawliczek <pawliczekerwin@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Lukas Wunner <lukas@wunner.de>, Stefan Berger <stefanb@linux.ibm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Paul Louvel <paul.louvel@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:44=E2=80=AFAM Erwin Pawliczek
<pawliczekerwin@gmail.com> wrote:
>
> ecc_make_pub_key() calls ecc_point_mult() without an initial Z, so the
> final Z, and therefore the input to vli_mod_inv(), is a deterministic
> function of the private key. vli_mod_inv() is not constant time, so
> key generation leaks information about the private key through its
> running time.
>
> crypto_ecdh_shared_secret() already passes a random initial Z, which
> blinds the inversion input. Do the same in ecc_make_pub_key().
>
> Key generation is used in the kernel by Bluetooth SMP and TPM2 HMAC
> sessions, which generate ephemeral P-256 keys.
>
> crypto_kpp_generate_public_key(), KVM guest on an i7-1165G7 (median
> over 4 boots of the best of 9 runs of 300 calls):
>
>     P-256:   744.9 us ->  753.2 us (+1.1%; within noise)
>     P-384:  1674.2 us -> 1651.6 us (-1.4%; within noise)
>
> Suggested-by: Ignat Korchagin <ignat@linux.win>
> Signed-off-by: Erwin Pawliczek <pawliczekerwin@gmail.com>

Reviewed-by: Ignat Korchagin <ignat@linux.win>

> ---
> Replaces "crypto: ecc - Use constant-time modular inversion in ecc_point_=
mult()":
> https://lore.kernel.org/all/20260928042641.307683-1-pawliczekerwin@gmail.=
com/
>
>  crypto/ecc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/crypto/ecc.c b/crypto/ecc.c
> index c7366eb7ce1f..6696bf0d90a6 100644
> --- a/crypto/ecc.c
> +++ b/crypto/ecc.c
> @@ -1614,20 +1614,26 @@ int ecc_make_pub_key(unsigned int curve_id, unsig=
ned int ndigits,
>  {
>         int ret =3D 0;
>         struct ecc_point *pk;
> +       u64 rand_z[ECC_MAX_DIGITS];
> +       unsigned int nbytes;
>         const struct ecc_curve *curve =3D ecc_get_curve(curve_id);
>
> -       if (!private_key) {
> +       if (!private_key || ndigits > ARRAY_SIZE(rand_z)) {
>                 ret =3D -EINVAL;
>                 goto out;
>         }
>
> +       nbytes =3D ndigits << ECC_DIGITS_TO_BYTES_SHIFT;
> +
> +       get_random_bytes(rand_z, nbytes);
> +
>         pk =3D ecc_alloc_point(ndigits);
>         if (!pk) {
>                 ret =3D -ENOMEM;
>                 goto out;
>         }
>
> -       ecc_point_mult(pk, &curve->g, private_key, NULL, curve, ndigits);
> +       ecc_point_mult(pk, &curve->g, private_key, rand_z, curve, ndigits=
);
>
>         /* SP800-56A rev 3 5.6.2.1.3 key check */
>         if (ecc_is_pubkey_valid_full(curve, pk)) {
> @@ -1641,6 +1647,7 @@ int ecc_make_pub_key(unsigned int curve_id, unsigne=
d int ndigits,
>  err_free_point:
>         ecc_free_point(pk);
>  out:
> +       memzero_explicit(rand_z, sizeof(rand_z));
>         return ret;
>  }
>  EXPORT_SYMBOL(ecc_make_pub_key);
> --
> 2.53.0
>
>
