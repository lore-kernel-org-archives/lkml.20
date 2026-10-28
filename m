Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220997;
	b=ZebN/+5Lj9mwc5fZrdEhqozTQKextg1NpX3Z1SolWEMfPkWMTGWucL8ClVKBh9nUUbW/
	 LA0SBpquCtNf1KXI8eJzA+nyFNSNAIEQf21OOnBjaCWbY4cgAcqGu5yeD254M0D7e3RVP
	 Yic3mbeI7XpaswLNLdjBpvfbJNk7kOrFUPraVqXT6b7QC5MzV00savUy0fQKkV2kR3HYL
	 LoG9dKyftqMnD4yEcV6rQBPLVuSLU1KHdbYgy2N8OHbLqp1I2am6DIPvKFTDpUVbK94vC
	 nfRpPJUfuijzZycd4EgKzf/6kPgLpFVTHPYpvJx0idU86M/WGtEuQ04QmJ0HNvdVvqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ODTX1Mq0hRb3U0WQ7WjPVnYgtfrvQWKTica7ES+VT4I=;
	b=Ia6qfIQNrOKFq99WP73FJ2fq68JAGtKLTJpF72LlWZiczMrduYkXHx/nE9VREBnOKQe4
	 Y5wEkcNX6o2mb/whWKRoZ2XZM02rbmQCgQ+w7KWULLY+7//i7TEEoTrHGCSJzHf0H9xnK
	 CpTRHMBprK1BLCAJ6/pzjAXiU7un243OUa5VWYktulV+fWusUpn7Qvj5HIul3B7s45ZW3
	 8MsQShlRvrTusV5IDJSlr5QUMgOIK/Q4YGQlo+v+KWPtKwh90U7vhisFgHeXOjp7T8vKp
	 iaCmU+J14gJ7rfmQ5TYrAm060jqCz8wi9qlJsnjyHbTZYKwIOlDT6/rPQMtNGBezt4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZjmXWXX;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F1606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A38F1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZjmXWXX
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so14032755e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793220995; x=1793825795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ODTX1Mq0hRb3U0WQ7WjPVnYgtfrvQWKTica7ES+VT4I=;
        b=CZjmXWXXnX+ztXHAuvrQTkbPf+jP/sDF0PnXOpWzwXGpBsdJ1rhg3JnJMulsn1LZtc
         wyfSr73iuW6G6lYTK5qywTRamFK65aw4EhHZpcs3YXXCMYJ182FpfQ0EHPNAOYBiFgz+
         uV0g7eMcsfSrQBk+z2YakRjoz7OW1t+CNZ6e5KYZ7iJQkSRFeL4/v3EBLJB/nHuOxYlB
         AEsAVqT+qXm4fLz6ZXg3F2AkmI4dzFjPtCKKf+RmgYz9Zuloc/ssDOidWLd2kUgUBnto
         nE/cIOG6liqfC08Ld70skugGugDGff6oPpJHsQ+0uGhAbGBDKRIufj2JqR/AH3BoAL7U
         EaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220995; x=1793825795;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODTX1Mq0hRb3U0WQ7WjPVnYgtfrvQWKTica7ES+VT4I=;
        b=ph0OiHRNEZnHS4v2k3nrY1Z8sC5Rwm8AxSjVVMYFQwJI6RZpT7MfYiy91UvaPx1VSx
         +9rky7r3W7l4WlxgZ8kIJe/8VArCDoQ7GRniVeCu/1CejkPH0LNVVdayU3UZwY+otiOq
         4naogE5PiqZ8T2DrOLH4lgBk2m5xqWPYGWEzXaYJ+O8OKMxcICk4dsumDlRa3NErdxDy
         3PeWaBFOFAXhf0Gt8LNfdW6E35MXlnp5gcKxGm7Js2BNP5QGRnNq9CcerPFjK0R1P/C2
         rKx7W+s+0QQZmwBV8uiKM9MIcAkqXL25UCIkc2bqI7c/Eif1myyWPEHZUF0w1MzC7JPc
         aR3A==
X-Forwarded-Encrypted: i=1; AKwUvBzKMQznhjhh4/KoeuDmcWkgtLLlI+0+2CaVynUVauXsGZAQuync5mOblvnoaetuSgJaoRFHNbNHDlo7Kv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmbcWaociR4Scjd6v9+ir8keQd13uFEFJ10ODacvgcwd+7KTS/
	BraQuarSYU13Y+f7ttJOiMGh3r+JbS3fTvJnEEi9weHC25jaUaaRmjrtPtyJl9vL
X-Gm-Gg: AYBFou0L4tOwBLcUQcqJe/eq2TsGumDDh7d2mEItGSN0lkhDPHkq+kn+Ipj25QmO9y4
	lH6l4aPARqi3sNxvcahiK4tCqDA/9G0opaBNdc3ocdIQZgL2lmarn6hl2EVyWTfJxOFHrzbODHQ
	J3xV+wc1NzuwNOL49e9ENXXmdTgSImYKLLvsnsbW+4V5B1965y1oJ6/Tj8gEiqI983+pNucrL7p
	OVDUj5gY2Prtykp45YXWdeHVckParc0QA92AIs6hl2m5URbyNykaX0EZN/wAJuXF/bNDPSODNFC
	7jagCvSvjC+eJEXVx4qf1UU7fjS9043PfR7drZ9S44QmGq396jV5yZhrkqo5QjcCrL/4BBhfuBm
	LxDNahE/OEYUm0PUIrWiXaPrS0SX3dIzKmPOZ0I9exs8xoU/iweId5emp2HJnfJFJcha27Z59DA
	ifE+cauSX4iMKIYGIX4oScsdPXqMg+o4Kygi/qxhCB4bLxFtgkgPC0bUuTfgc/DffjUyvm+38Pk
	oq/3xt7lX/988974oweWkCAURuX4AEEsVlHGkVd45WY+ST4EYhd02CRdplbYMR6pO11jtom9HMU
	eOE0I0UQmBC9BsHgK0ExEjerxXd8Fcup+dJq6BggU0LmYR7HyPlMCdDN4eV5DwG+Tw==
X-Received: by 2002:a05:600c:811b:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4a967e8d5afmr77924555e9.27.1793220994832;
        Wed, 28 Oct 2026 13:56:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm15896115e9.1.2026.10.28.13.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:56:34 -0700 (PDT)
Date: Wed, 28 Oct 2026 20:56:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>, ardb@kernel.org,
 Jason@zx2c4.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: aes: use memzero_explicit() instead of
 memset()
Message-ID: <20261028205633.7625d789@pumpkin>
In-Reply-To: <20261028155134.GA4041913@google.com>
References: <20261028142636.5888-1-raizudeen.kerneldev@gmail.com>
	<20261028155134.GA4041913@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 15:51:34 +0000
Eric Biggers <ebiggers@kernel.org> wrote:

> On Wed, Oct 28, 2026 at 07:56:36PM +0530, Mohamad Raizudeen wrote:
> > aes_gcm_decrypt() and aes_ccm_decrypt() use plain memset() to wipe the
> > output buffer when authentication fails. But the compiler can optimize
> > that wipe away, so use memzero_explicit() instead of memset().
> > 
> > This matches every other sensitive wipes in this file, which already
> > uses memzero_explicit() for keystream blocks, tmp buffers, ctx
> > teardowns.
> > 
> > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > ---
> >  lib/crypto/aes.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
> > index e1c191551736..7814ef525239 100644
> > --- a/lib/crypto/aes.c
> > +++ b/lib/crypto/aes.c
> > @@ -1733,7 +1733,7 @@ int aes_gcm_decrypt(u8 *dst, const u8 *src, size_t data_len, const u8 *authtag,
> >  		 * Clear the inauthentic decrypted data so that callers won't
> >  		 * receive it even if they fail to correctly handle errors.
> >  		 */
> > -		memset(dst, 0, data_len);
> > +		memzero_explicit(dst, data_len);  
> 
> This isn't for "zeroization" (making the data unavailable in ramdumps),
> though.  It's just so the caller doesn't accidentally use the
> inauthentic data, as the comment right above it states.

It is also a parameter so has to be zeroed anyway.
memzero_explicit() is used to clear on-stack buffers.

David

> 
> - Eric
> 

