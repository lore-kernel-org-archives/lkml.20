Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1534B70808
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125774; cv=pass; b=fjZ+X0Ro+MOV5pfLblWtuHlteDweKmB12odo5d33IJzyG33Mntgk2Tau30ir1dqFYckc1E1MYEAybfNbbB0zfNsHkVtaQ/Yj2HkRaiTlf1LKo+aYVKt0knWZ+MZrq8+0vYnQJoK0LTjwrE80QpMfOHG7Y2QNJ0tr64oMUeDZvvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125774; c=relaxed/simple;
	bh=hirSQS/OqvADHiytlKbGmIxt0jyt7X0sIkL5Ta9doMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfVHjBNlh52RVg827hUSp4vG7TWqwYnhhJpg5H3j9aUjBmGAPm0DaTgKB6rKSP7Nm2jp93G+Myv8ynFukULwPdhVWW/yOklHFVeVwP/P8O0Ub7QCp7t1t0xpnt36Lmfn5i6gUxAMNZI9cMPr21DndZHA8xpAnWteo+De9xS0ceM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgr2kgSc; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgr2kgSc"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso342826e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792125771; cv=none;
        d=google.com; s=arc-20260327;
        b=VhoUJ7JdOjtRnQTDKMMn1d+rHvR9a57AOf/s+8TKdGXM4/yQ0MvAT+3E+PzYSGLL7u
         x7RAqjaZ5r1gAbeCKWjEnwflU+7Kjdduj23Y+VWtUaAmj3+ieECMDhRvl03LKRSQJn3h
         A5r8tZtN78jwwQkTF9It+W7KreL7wyPYTFWyW/LR8gU82o8Y43Pi+3LfjJpykCcsMRAa
         0rbZR/QeeFFx/f6+TawbwaWRtsMboV7Xu5AVHK7CMUZfZfjeKNdebWXnFblx7g68gFsN
         dC9a2TbP3Q+4KjO8MF73lesM4F0QNiLGMYyyEKFTtqh9h04FLpWOIqeTCCDE3jX2aE8s
         J5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HOrvcb8VGO3g3u2hTYFvmKxMb4WgJQMQSCQrwrKKXf4=;
        fh=fLlzB2tbHk4ZgZsGrDldLwEdXqeFDC35Y90QZ/gT1kY=;
        b=jX/2ih2CdJh0MwyAqYaAtt5gHXpQ6HFuB80HsVV++i8PdN0rDFxRRW8RxCc3beFTg9
         qgvQ1a/1kK31BBaYBUkvaTyvI5w18uhvNP2wmDwFB4qxXCbqp2oSgfQfca4AIBAjcADA
         AVzT6ihn0lVPbGigZQPqg/mKQL5C6a6H7IJDtpvT8bn7W2oZmkr5ypY9JEPkX7d11+9A
         P7VKh1VDoSbp0n+FVmsNvdgM2geyZN2vS3EXdSp7Wq+Z0hind0rDYZFU2liDIyi+h8aZ
         IVzB3rpMfHmZI7Rudpnca/GDZf2CEF9r/B6G9ArYhK11k5x3U0hqyCEuhE26RIq8/nzB
         BpjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792125771; x=1792730571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HOrvcb8VGO3g3u2hTYFvmKxMb4WgJQMQSCQrwrKKXf4=;
        b=bgr2kgSciaksstH62QWZSAviIm/CpyG3AZtsZrPZ8M61VtcukbvAA5reryyuDylF1C
         JRFvT07T+uQsd4fYeE84Tensho07i/3wZLiJcnSWrjasmlCW2/Rnoew478okXivTOaKX
         yr3rIJwaO2CLi/whLUWitbANYfpp84WGKEuQuj67kL9k1KHBOrF/bDhnDVAzoRmITfXA
         j5ZMpoKN1/pYWKaTeDv1NhMBbd5GyHCYKloR5UKa/rsnH+aBn5nxbgEkws1lzgJz8fN5
         3tryB5GbvF9vFJGLujoYN9w/PbRziGo9hLSoOo6WIfREox4DXFtQspeIo6zam5nOelzr
         s92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125771; x=1792730571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HOrvcb8VGO3g3u2hTYFvmKxMb4WgJQMQSCQrwrKKXf4=;
        b=C8t6L7yT0c1Wxs5KckiDpL1/PkSge6UF7Mn0e5cDiLMCpC2DqdthY03FIqeN7IO3W1
         TpfN7nU9Z6EzfuKx6HuDyUMvalkFXVbYaRebJEfW/5vemQKDwYDxNyit7KBLKdx6UGtG
         qtI4KrNwzmZY9OfeGF5lgUh01pk2Qm+F6+1aAd7kEKy/r/ugxUGm8vU2qEabz16aHMHd
         u0kvXOHwMesK2OmZNkGdqau8B4gIEhi1A1Reh4hO6Ott9TvQvcZ/klEYkxXfyRzkqzau
         aXJuvhP5aj8JX+FUH+HJRn8oFQ8Rn713g1ihxj9x3qGE9ofvobRiAVJ0Ybs0EUwS/Eyb
         iTrw==
X-Forwarded-Encrypted: i=1; AKwUvBzOXEkhAgr6D7NR8TXZi3mSPBJXmb+PyQ70sTEFlRKPUuHu1W3crqifBohqw8HumHtPKmyqmJmeSjZDD5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTxIfWR+FqZV0fHzYifkCk4xaBu2fM+Zj4Y9pRITfSv5yIPqZM
	9fmC9MOKxXDOotjZJcXDrn4P8nfzEXpa+PVhQqH52qYdKz3+tepNn8S3/uizjDN9PS1mxjGQc3j
	45KsY6iyewa+A6IIRNkeyRmN9wlre1fw=
X-Gm-Gg: AYBFou2B/tdXXVN8cenVebCtkXf6tpG0qZI+0QudaA+h1IsTqANx0/80sR7MUYF+32m
	L80InXp/ooGWVhGSmXE6b5lpTbR2A345yG9Q1ITrQhwFvEoM9gIjQ/jnTBIAWKtAWnHu39j9MZo
	KmbXd6xXl7fCJsrmZUa7LZGrtXQFD4T/7kt+4uwiRWxflA1sYxsIS7VqW0tA42Vbg/4vJNEq0HK
	e55We2k24/O6iu9xg1a/9w9t6ieSJ7tlku3g011lSG2+pMSvmv3dSjHAtc+X+faKQXCmaat9T/G
	jUl0JfgsvWsujnl8ryl6gLRUsBDzA9akGj1VddtUhbUr+Z2SfZpJHvo=
X-Received: by 2002:a05:6512:b88:b0:5b8:edea:6800 with SMTP id
 2adb3069b0e04-5be476da151mr631619e87.22.1792125770781; Thu, 15 Oct 2026
 21:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008182814.27450-1-kanchanapsridhar2026@gmail.com>
 <as-jZopKRfuYAiTE@google.com> <CACpmpoeS_cvXRWJXqiYZV9oykk=91efv8KtZgK2Pi-QwHnQH3A@mail.gmail.com>
 <CAO9r8zN5n=9v4K+OtEEODg=e0kcFW99PreUcZm09q9CUMQc+ew@mail.gmail.com>
 <CACpmpofdoeVbbw7izCDeJ7eS+XpWj+3sp3teKEQWywyRB75jYQ@mail.gmail.com>
 <CAO9r8zMaaUsBaS0TJumochRKt2ShV7nRaLnYPWv3=S-wUFgitw@mail.gmail.com>
 <CACpmpoecz4tjr-qvFRy22CGuF+4NBWbE7HVjdTGFqQOheK3CLg@mail.gmail.com>
 <CAO9r8zOAcf4=TscCXjMYvowUx-_u9qLGqY2-p7cK-z5CUU_x8w@mail.gmail.com>
 <CACpmpofYXDMviE6FS-BZdVntmQFvS+_xvfmOnJ2caZFerz6vyg@mail.gmail.com> <atGqPIpUfX0LDokV@gondor.apana.org.au>
In-Reply-To: <atGqPIpUfX0LDokV@gondor.apana.org.au>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 15 Oct 2026 21:42:38 -0700
X-Gm-Features: AclHuK9lFk3Bp3AlNyS2F-GkGX_WVBdlaB2VfCt4lT21jMqDyuj_BMkFpZJj-S4
Message-ID: <CACpmpofAtQymsWVG+XtvzHahthFmNHXND8t-pqj0fgURCP6Okg@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] Batched zswap_store() with compression batching
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Yosry Ahmed <yosry@kernel.org>, hannes@cmpxchg.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 9:38=E2=80=AFPM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> On Thu, Oct 15, 2026 at 08:32:21PM -0700, Kanchana P. Sridhar wrote:
> >
> > If you are Ok with all this, we will need Herbert's Ok for this change
> > in patch 3:
> >
> > diff --git a/crypto/acompress.c b/crypto/acompress.c
> > index 192ea996e779..db8e4c82b900 100644
> > --- a/crypto/acompress.c
> > +++ b/crypto/acompress.c
> > @@ -293,8 +293,12 @@ int crypto_acomp_compress(struct acomp_req *req)
> >                 return -EAGAIN;
> >
> >         if (likely(req->unit_size && acomp_request_issg(req))) {
> > -               if (!crypto_acomp_req_seg(tfm))
> > -                       return acomp_do_req_chain(req, true);
> > +               if (likely(!crypto_acomp_req_seg(tfm))) {
> > +                       int err =3D tfm->compress(req);
> > +
> > +                       req->dst->length =3D unlikely(err) ? err : req-=
>dlen;
> > +                       return err;
> > +               }
>
> What if you put this short-circuit into acomp_do_req_chain instead,
> does it still give you the same performance boost?

Sure, that's a great idea! I will let you know if this gives the same
performance boost.

Thanks,
Kanchana

>
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
