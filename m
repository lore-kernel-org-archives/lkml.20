Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569686;
	b=JGgXVG/6q/tg3C7cf+QjeHDaEpS0An6WMK9H1NKaOTGqSmymx0XfqaXPa94jKr7b7Uak
	 yMRDOvkMj0jRkzfEz1Tlky7aV3dTY3Z1yGosBVxNcC4h6P8FEnohRm3KXlIAAqTUJYqd+
	 BRLtSP5GtzjzdU7C7IKmgY/cGDPlg5M4g4cFdn8Iec0f61jT8vBtj7kbnRmYkqCNtCFTa
	 mYB9/9oiZ8n5R0MBbbv1Tpy/Qy18JHXANEdbM+KPtlvamABJJ2jBRVL3FiLaU4+IhOqn1
	 UZWm5Al0X5GhnlGy/RVxpxufwQS28JzqFuudwmO5Z8FdfpTghBgUpTdnx/NxFAQD9wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569686;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 From:To:Cc:References:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/rTG8Xv4QM16TrDirC79mfSinok/0aGdU0jCZkb0miU=;
	b=Li1veuXDXyNgzjZzO7x3yBGEbInQaGRW8nvMyvPf2wK/gNzQYU3NMrWTGLLpUrq/h2Ap
	 Bf1XeqrlIurnJv3NEaHblOgcpHbNYjBcoH3bErJyKMDoIxgf0qEMaQBXo/IrVYVyRkOmq
	 TxjrtOKCoaO9Qd9pgTUbKhnAIt073hcbDnmAdliQR1iDY/Ep/guJiIXSUr8nmripylUr5
	 hZKD/007MqAjMpKs/2k8caGlNf47DJkMc1Or/pt07xUq7Hw81wD53PnnjYHgeGU6FjdDn
	 c0CsIshuCS0zOqLv6NEoMCNOOWfHLODTJ/WrefQo+H9PRE+6LzJs7tC/ISbp9SC8zNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YIHfwlP7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YC8GccfH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD60606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD60606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YIHfwlP7;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YC8GccfH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794569684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/rTG8Xv4QM16TrDirC79mfSinok/0aGdU0jCZkb0miU=;
	b=YIHfwlP7TUusrE2Im/quLw5McNPq1ifYWjkC8srhNTp/R0MGom86YSlUXuh+EEaC+d2g+5
	4oA3LF5HsTAaKRRWYWV+RMv0MTHhAIL0cKwQ7THU7HnA1IH8YyeEMQ5qz8tADA5G2JvzLs
	JstbWuX6NdRzpG0dKJe289QWyAp4ni8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-XeNNiOggN7SQDb1CcLhX7w-1; Fri, 13 Nov 2026 06:34:43 -0500
X-MC-Unique: XeNNiOggN7SQDb1CcLhX7w-1
X-Mimecast-MFC-AGG-ID: XeNNiOggN7SQDb1CcLhX7w_1794569682
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so4736355e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794569682; x=1795174482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/rTG8Xv4QM16TrDirC79mfSinok/0aGdU0jCZkb0miU=;
        b=YC8GccfHbZ7QIYbjdp1YWNMTXLkOKhwetjx0NbbZH84r+HjriwJEXOgfQV+v3uT5PL
         iGUJihEq5q9Y+qsokMNWTMYImnK9hYXQIGY1R17+0MnYAvoyUPGNPJljaOk2BVCq3tG0
         IblmNefHs7ijVw4fHdpqiPICB5ejs4sX6AUQMa9Op/jiOvV1a+y/K9XlZy9shwEAhS8P
         sxM8KzNJfSCGxRZWdsaGwoEGAuH4Rm2tav9TY7HtMYdl37sVti4fROrzakh/R3KLfsQx
         ELf/MWXzBWr4ogDjpU5pmM59HjGbIZUCEPoECKGdqZTxEaTPHMi0VfSZH4rMtymC+8wJ
         jl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569682; x=1795174482;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/rTG8Xv4QM16TrDirC79mfSinok/0aGdU0jCZkb0miU=;
        b=uHNUKFgFAe4GSf3C7TkXcm7rNdtEFTFvGSlRf2hqFBZZE5jNRZBXCuEQ893hUIaJNj
         Pvo1ilzVE8F8qK2V+SeAE+ZBlErPe3+HjkcO6BTeb/Ux9K1bB0W58ysHLfU1XWEWBjT6
         Wuk4W2D7dTKrh7TibOf3mwlOfAqxTyz0TYNMbu/0e8DF5JR14ft1dIJLySuZRK2nDqOv
         xqBsnpATuPHzlEkxGQzO2Ce420jzE4wfBDKOhemoldsUVesLq9UXUdWpjIEPv3Ik8fvf
         EicNKwrpPqESo88XUvQr3fZLE1nO0WZTN/CUNrM5StxyQ8Ga0JoC/wUmLStUPuvfrxo4
         jBOw==
X-Forwarded-Encrypted: i=1; AL+hErEJ0EFNmjkIiBpoaQoAfxKumMQd1c4lyoAnhYyIxKGSGoucad7zGYCIfrf/P6D/gz2Ch7wtIzKgpvF21tI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pZgpQJ2plP8RiSqVcHIo9pm7aVCKrfM61mMeFHF1CcBhspHh5
	KnugwHRQVO2tgNfFH2J3dsfawoLKIPKfu+3n2qF1i4AV3wv7UZQXl4Y2Ebybg9myNiWfRfJoxsQ
	A9OXv9mD/GvinvI1PGjVcjKC6ylRc7xb5kYXlaJltj6mv99ZglQifSiTwOCSSpVTD2Q==
X-Gm-Gg: AYBFou0qev2H4sziE6rllxAKD08+8giesoqWmu1U6ar6pvTaGAV720HQTNwsXAqDZjO
	TJ943yX63RxNp8xcD1Oa2bYimVxlZYdJbgw41Un6+Wp1yMMcGAh95zGLjOMAiB5CQzNv09ccyqG
	LeEYCw6Mbww3j+Bg0gG2xElC2a6Sxdlsv8BLjEmervpiM1hzdP4A/sSkc6YNiFt8M9vHHlkXq/v
	hXde2JX1ORMlm8NPW/zaaVn4mw44wx+9/Yeqm7w8fxpOERkIgjuKpTu9MMLnQ5T5vzpdtxouqKy
	A6oKgtRqZYQveMSF5GfscwGjYdVjUBrP42nv+Fh7pUhts1ofc5WApicQ/Qa7giBDj1pnoRph8/N
	hz50gVVr53buDQcwGsQc9lnfRP+lENy5dksvYnkVcS+wV
X-Received: by 2002:a05:600c:3b2a:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb55aabdf9mr46231805e9.25.1794569681918;
        Fri, 13 Nov 2026 03:34:41 -0800 (PST)
X-Received: by 2002:a05:600c:3b2a:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb55aabdf9mr46231215e9.25.1794569681337;
        Fri, 13 Nov 2026 03:34:41 -0800 (PST)
Received: from [192.168.0.9] ([47.64.115.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm147813025e9.4.2026.11.13.03.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 03:34:40 -0800 (PST)
Message-ID: <6eb809cc-de84-459e-a580-ea4eceb045a7@redhat.com>
Date: Fri, 13 Nov 2026 12:34:39 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qat - Don't use -EFAULT as error code during
 setkey()
From: Thomas Huth <thuth@redhat.com>
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Cc: qat-linux@intel.com, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ahsan Atta <ahsan.atta@intel.com>
References: <20260824122403.630026-1-thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260824122403.630026-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 24.08.26 um 14:24 schrieb Thomas Huth:
> EFAULT means "Bad Address", it's the error code that is meant to
> be returned when userspace provided the kerknel with a pointer to
> memory that is not part of its address space. However, the QAT driver
> abuses this error code during its setkey() function to signal that
> there was something wrong with the selected algorithm, which is just
> confusing.
> 
> The best choice for an error code would likely have been EINVAL here,
> but qat_alg_aead_init_sessions() seems to make an effort to use this
> for another error case already, so there is likely the desire to
> distinguish the different errors here. Thus use EOPNOTSUPP as a
> replacement now, so qat_alg_aead_init_sessions() continues to return
> two different error codes depending on what went wrong.
> 
> Anyway, instead of hard-coding the error codes in the function
> qat_alg_aead_init_sessions() again, let's also simply rather pass
> the error code from the called functions up to the caller instead,
> this way we can also get rid of the need to call memzero_explicit()
> here three times.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .../crypto/intel/qat/qat_common/qat_algs.c    | 31 +++++++++----------
>   1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/crypto/intel/qat/qat_common/qat_algs.c b/drivers/crypto/intel/qat/qat_common/qat_algs.c
> index 91663805d9e60..91da9cad1d89a 100644
> --- a/drivers/crypto/intel/qat/qat_common/qat_algs.c
> +++ b/drivers/crypto/intel/qat/qat_common/qat_algs.c
> @@ -135,7 +135,7 @@ static int qat_alg_do_precomputes(struct icp_qat_hw_auth_algo_blk *hash,
>   		return 0;
>   	}
>   	default:
> -		return -EFAULT;
> +		return -EOPNOTSUPP;
>   	}
>   }
>   
> @@ -186,7 +186,7 @@ static int qat_alg_aead_init_enc_session(struct crypto_aead *aead_tfm,
>   		cpu_to_be32(ctx->hash_blocksize);
>   
>   	if (qat_alg_do_precomputes(hash, ctx, keys->authkey, keys->authkeylen))
> -		return -EFAULT;
> +		return -EOPNOTSUPP;
>   
>   	/* Request setup */
>   	qat_alg_init_common_hdr(header);
> @@ -273,7 +273,7 @@ static int qat_alg_aead_init_dec_session(struct crypto_aead *aead_tfm,
>   		cpu_to_be32(ctx->hash_blocksize);
>   
>   	if (qat_alg_do_precomputes(hash, ctx, keys->authkey, keys->authkeylen))
> -		return -EFAULT;
> +		return -EOPNOTSUPP;
>   
>   	/* Request setup */
>   	qat_alg_init_common_hdr(header);
> @@ -472,28 +472,25 @@ static int qat_alg_aead_init_sessions(struct crypto_aead *tfm, const u8 *key,
>   				      unsigned int keylen,  int mode)
>   {
>   	struct crypto_authenc_keys keys;
> -	int alg;
> -
> -	if (crypto_authenc_extractkeys(&keys, key, keylen))
> -		goto bad_key;
> +	int alg, ret;
>   
> -	if (qat_alg_validate_key(keys.enckeylen, &alg, mode))
> -		goto bad_key;
> +	ret = crypto_authenc_extractkeys(&keys, key, keylen);
> +	if (ret)
> +		goto error;
>   
> -	if (qat_alg_aead_init_enc_session(tfm, alg, &keys, mode))
> +	ret = qat_alg_validate_key(keys.enckeylen, &alg, mode);
> +	if (ret)
>   		goto error;
>   
> -	if (qat_alg_aead_init_dec_session(tfm, alg, &keys, mode))
> +	ret = qat_alg_aead_init_enc_session(tfm, alg, &keys, mode);
> +	if (ret)
>   		goto error;
>   
> -	memzero_explicit(&keys, sizeof(keys));
> -	return 0;
> -bad_key:
> -	memzero_explicit(&keys, sizeof(keys));
> -	return -EINVAL;
> +	ret = qat_alg_aead_init_dec_session(tfm, alg, &keys, mode);
> +
>   error:
>   	memzero_explicit(&keys, sizeof(keys));
> -	return -EFAULT;
> +	return ret;
>   }
>   
>   static int qat_alg_skcipher_init_sessions(struct qat_alg_skcipher_ctx *ctx,

Friendly ping! Anybody got a comment on this patch?

  Thomas

