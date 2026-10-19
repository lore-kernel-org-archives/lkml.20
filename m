Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD72E8DE3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374451; cv=pass; b=ZSvIzU2/ctH/unGneoBNn1OUNQFRdW1nydtnaW8c7WPJ7ZcmsdBU5isRhhL59lKQCU9XSkn/cqxElRIfDFummb+gKaQzmzeRrlvVULhlfKYdobp5iXmmDS8FQPJ2aJr/uI56OAAk4GZTxPLs7IsriDqrs/4NxT94PctoV+WFS9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374451; c=relaxed/simple;
	bh=2U3A+oKRxg8msKayVA1cpT2G7nqJxD+NG7rSiparHoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZ7Amq+Sh1ezURPPfjSaxRnbQCaMUYVabp+cP9DTwbjCSQnsLS3LaTJ32vJvHeYzgMqLCBKIstoggaNAv5p+OQiANTiV9aZcxSC3PE8YpIATJ0W9ZHXQIeiEZ2mqk5yCT+mwH8VbLQmf3uXTiQCT5E9NAsHjxVaP5LpDJos8WrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVg5KI+o; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVg5KI+o"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso1311818e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792374448; cv=none;
        d=google.com; s=arc-20260327;
        b=qqI3lA82zni3wPcTfS9dZoFXlfJuKts17DUpJfdgz63rwhSHpjmcx8K1FXid/gLX0q
         SC3JWSguA5CmHxMsaJ/o0VbZ8i6uUmLrs8AzS+FPoUiWscWuVDa00PyxFk19OxlYVMee
         9i3nmWaI3GZ8B5tzlu2IcUX108f9F4+P9893/RDZuQtxpwsd/F1mLEn8ZopOyzz2ifPC
         U4v11JwcnOREaQjhIlLZ6Bp7ni0Lm2wVhL1Reab5uc45y65lO5D2PytsWEpWGFUB+1SK
         WiBiwJnWDUv0v6BWc74NTTmKfXmVh6hSFsfng7+wraM6nzEcPIqxZUgdkCoP0LtFrUE6
         OWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2U3A+oKRxg8msKayVA1cpT2G7nqJxD+NG7rSiparHoY=;
        fh=2x5muZj8UuaohHYkT953K41tVu/W5PWajUKx7Yfoi0k=;
        b=aogx/xOYZdvxWOhLw6IhcAbl4W8y+30WK01MSCFQ7Y/5l3rzBCcoQjw579dAJt/f+K
         scK+UQQy1AFeunydzWVfs1nvuLSRKOmoQLAqpCZpifMW/B4CrV37nJ0ZPId+5AOruZP3
         PgwedWekOWA0b/3GVWGRH/z0IuVurxNJt3OmAc9kAxqbP9P3jjQByrhcTEse4MF8XWjC
         yUYH3TXzpe0zrpgL7rNHy0FqyWBmIDrBFs4TOBVW5gQhatNCnhQXlGO/C4Z8Ftw30EPS
         Unq64vQEcx97lzGfsnpDxbhprjVAzPXXikzujoN3UtygWjWIpSQIwdYozmaPlhbS99kO
         LrPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792374448; x=1792979248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2U3A+oKRxg8msKayVA1cpT2G7nqJxD+NG7rSiparHoY=;
        b=rVg5KI+oYlekH9HzklRiKj3nrHZjgUZT6H3p3y2HXEDCBZGb/dBF5RJPZjnJRuxRWh
         TZmgab5BQp/DtLXsBtfX6S/UOERd+LVSw/HitJU++RB8XIseYNMM5O7Wv5Edopl6cn3N
         SQQpXz81nsYxLULgSRlKX2kodWeoyPRSEobXACrUdAzwzyTaLjHtKIzpNOLXwJFRJFNk
         FbupoVh3CwLaL+tb4QsPnug/I1eh+oqkto4omR4/TFCx+6p2qGpuc3BccOI5bnm/P+z/
         XVJyMbQQiAafyGobCMX+LNEhMB9l0DXQeAYFkwCLb27fVvnzvCYxNJfNlApGmuNNfMaU
         1yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792374448; x=1792979248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2U3A+oKRxg8msKayVA1cpT2G7nqJxD+NG7rSiparHoY=;
        b=ltnbm8LxFL4685NQm+kRbnZp7kbRdzRQKvuIBjyJTPCLaTIaDT+T5DT6VRXDPhDsAq
         1Az/2eU0o+J4tsAeEH9MC/pD7z83sMBGfJK/GaPoymynHNnkyVzmv2Hq/i1VFKm1hwBs
         xswLe9Vns37DYQ9vD0oxO6KV0ZszKj1tJFFeVMHtxo7sYzTSlEMXcMUGifUhebeTID7Z
         LEpLojfuweN3vlyz7UguSunDoYsAoNngzLB4YIZBzYHsTJEM7qAySIuKVpGgQHLswlHB
         TsvY7DOPV7iw5MInWtIhb2UGuEzL5nRqW0ztU6lJymagoXho/5qd+xqbK81SUVJJUAXo
         /6Pw==
X-Forwarded-Encrypted: i=1; AKwUvBzCx+otFvqi1dOpwVruYxDvrtNmRui/Zi2L0lFDx+JQYP/YoZrEd67B9IKPu/MKN5l8UlV0tQGjUd3teQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9oBQFeo6iHdCqtxGg5RgLGolzyuunRW6e+IY0suyPaYihmTVn
	jGK4A0grHszSSzOJKGmoo92JyFzjxH30G6wECG8gibjLjmdehgglX9HXiDe27sWJMuCKoMXnv3w
	vZrHnRHpk4nIQgHAOyjdTLMlVGQXdb3s=
X-Gm-Gg: AYBFou2oXOWnoS8JDw4mNfCOkbTaMF0HE5eqOIylodDTKp6OgF9E+V59oO91PPIXBXf
	+MMzL0bGgfZPZAW4Y62jIfp0PFiYVG8Gc79MZySimT088dhnjEMxre5s2kZvwT8OXaNmBtSwGd6
	E1L1DHGYpAkzUI6jAKsVo8eOqKNbi+sLV0Els5LRtYWSBzHv0BX7/Jev4LlJ0VZwvtkqSgVr39l
	OnV9QO84IXdn7bZUUdVBaGT1/XVg+rU+f/romndm9DgGn1Dgf4lW5Ry0fwXikkXrX/wZKUZnCeP
	EHnR836iAaVfgxfTxyJG9vj7nqj7VqwcREI8r+mz3FchDmk37Rt9Bs0=
X-Received: by 2002:a05:6512:2248:b0:5b7:f75a:ea68 with SMTP id
 2adb3069b0e04-5be50a4c8cdmr2008174e87.35.1792374448102; Sun, 18 Oct 2026
 18:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO9r8zMaaUsBaS0TJumochRKt2ShV7nRaLnYPWv3=S-wUFgitw@mail.gmail.com>
 <CACpmpoecz4tjr-qvFRy22CGuF+4NBWbE7HVjdTGFqQOheK3CLg@mail.gmail.com>
 <CAO9r8zOAcf4=TscCXjMYvowUx-_u9qLGqY2-p7cK-z5CUU_x8w@mail.gmail.com>
 <CACpmpofYXDMviE6FS-BZdVntmQFvS+_xvfmOnJ2caZFerz6vyg@mail.gmail.com>
 <atGqPIpUfX0LDokV@gondor.apana.org.au> <CACpmpofyLW5z1DYEY2YAty0VOAhRR+Leic8O-B0N9hrzdW_=Ew@mail.gmail.com>
 <atL1ok1YkHbA4AaI@gondor.apana.org.au> <CACpmpoe_RXcJM42sTVwk_Qvt3zjAOZhzYZNsRD4xz_1HxDmadg@mail.gmail.com>
 <atMCfhB63koot230@gondor.apana.org.au> <CACpmpocZGHpTTOq+xa2bTnS-=gdUa8+E_KKJm41H_dSfbGikYQ@mail.gmail.com>
 <atV0l54Q43b1KSHF@gondor.apana.org.au>
In-Reply-To: <atV0l54Q43b1KSHF@gondor.apana.org.au>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Sun, 18 Oct 2026 18:47:14 -0700
X-Gm-Features: AclHuK9zofrLvrOfaweJmPnIqy3kdR5flhLh-TJweVyGHE59eBCRksy4vGcxn2c
Message-ID: <CACpmpoemfbQHjXJ5DeP44WESSJA_A6mQYUEtZMNAHW4qtiT0vg@mail.gmail.com>
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

On Sun, Oct 18, 2026 at 6:39=E2=80=AFPM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> On Sun, Oct 18, 2026 at 06:35:01PM -0700, Kanchana P. Sridhar wrote:
> >
> > Please let me know if [2] looks good and I can include this in v2, than=
ks!
> >
> > [2]:
> >
> > int crypto_acomp_compress(struct acomp_req *req)
> > {
> > struct crypto_acomp *tfm =3D crypto_acomp_reqtfm(req);
> >
> > if (unlikely(acomp_req_on_stack(req) && acomp_is_async(tfm)))
> > return -EAGAIN;
> >
> > if (likely(req->unit_size && acomp_request_issg(req))) {
> > if (likely(!crypto_acomp_req_seg(tfm))) {
> > if (likely(req->unit_size =3D=3D req->slen)) {
> > int err =3D tfm->compress(req);
> >
> > req->dst->length =3D unlikely(err) ? err : req->dlen;
> > return err;
> > } else {
> > return acomp_do_req_chain(req, true);
> > }
> > }
> >
> > return tfm->compress(req);
> > }
> >
> > if (crypto_acomp_req_virt(tfm) || acomp_request_issg(req))
> > return tfm->compress(req);
> >
> > return acomp_do_req_chain(req, true);
> > }
>
> This looks good to me.
>

Amazing! Many thanks, Herbert.

> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
