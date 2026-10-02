Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308AB36A377
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 05:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790917981; cv=pass; b=T9bTIy/L3MTr/kxXb6TBtcGSoUyh8GNjRj/htdg4Rd6fh446d6c883pOXBXe1QF/UQEyd3y1TjS4vQsUhOSl4tNwgQoGAhMqjmQ3vvhpH++MUUcFUwC585aSjyQlR/ISGoLBVG07pW+hT3vJv7yK3dH20oB1ovS/Jv9jLHYKX/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790917981; c=relaxed/simple;
	bh=S8Jtihtn3387XynzpWWxcaATC2/8v7ntnHCXBS2w0/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQEngGSq+tkig/wQyxV1Nj/0RT5BHndy01sVLR0yIMZMQhd9ZCKCx8y0FO1YCJn3FGPYJ9l9CI4p/5e+vvofHwvWfSlxJKvi62DJXh5xez+l1ZHq5Xf8+B562An3sC7lOIr6rUpay7qDLrmq1RAYDeYMp23mDiwo276B0igQX94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=myosPXgN; arc=pass smtp.client-ip=74.125.230.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="myosPXgN"
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-917bef0d531so8900586d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 22:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790917976; cv=none;
        d=google.com; s=arc-20260327;
        b=nF4n6aF5BKt5A45HQsDuQCnbA2M9ZnYZq2aoGszj9E+avrM2TJnH2v+iR+7Bhsj2g6
         klA/KsbgZI51lOpC60stDJ+fu69pNL8ir8UHrzNKWmWnqUuB2kOBSUxCPuQdviADkTxu
         iW+GkAVzqGN7bHVs/kNfb+MUf2Nlt2KPf0MEt/oU3ed/iGlSjIMYuiGUpzWDLWGeazQM
         AfK8dGa5Q36OyXP5xqij5qre9+fCF8Kv764NGQAE/TsE8XNFIc0LM8+3qWXTt3fNMAih
         glAXtEIvGzygreHM4n4Qei+BA2v0fmbIaliAW0hM88aLV2NAPLfENfkE69Mle4XFin87
         hgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pNsuUSVMsMgy4F3/JOoqgtAPcs+ltR4LwZ8VqgJ/YUE=;
        fh=aVzGstnGCedYCgjC+PRb1fu9eHXWtJ73E/c4+u4NkW0=;
        b=mUJZd+ztkCch1qMds7DD9SrktbYJXcOQf/qApmb0cQSC/Ve5XQ6nMrj0B4SQYGpCyw
         c83IydtnJjh8i3V0sikG4K2E33+IegDtJ4y0DXaaLT3usWzwFWtSr+JX3mpkSha9Fg2f
         wj4ZK9YJbw8M+hOJc3QSEUmtljixcw1Kn+t9x1bPw9R59wk6pzf62eGpePnuC+jvC5w6
         A2cPYwxrIK62B1WvIpJwAjz6b6z/PTBo3sHo3K3TfvO6g/87prwokJZ41wFltjPN/SuF
         VXyafglVUswsIH4EzorxI0DiXnzK2oM7MyszdVWQQiEkBFOgMydIscHGJRqWhCQj6uBb
         n0lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1790917976; x=1791522776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pNsuUSVMsMgy4F3/JOoqgtAPcs+ltR4LwZ8VqgJ/YUE=;
        b=myosPXgNiQ2EgUqdXuO+GFGGLYAJMcgo3fuME5H4yjy92LJKtfFI/XZ2p+TUsWFOZR
         lBgkc8j4YUVVSjeNDM1c0RNIDKJJ7nwmmZrdhag/XDet5Bx1sgWv/hQiBNaZ+4raPtbP
         ukvnU2guE5dyF8hKU427P271uiNd/ohRO/QQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790917976; x=1791522776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNsuUSVMsMgy4F3/JOoqgtAPcs+ltR4LwZ8VqgJ/YUE=;
        b=WrAIn8mQjqkM9+3ZKZWkinre4zcsqD3a0J+CHaL+GWnSmmxTdbHgEMy0E0MJ1xKU/P
         xZBjuw1lZrI8Z262KchEs7ukpNJfCHTyu7R6Hac6mv9MqSBHvRjyRvH2kEmvivdUDl3O
         Ihalm7+tiAOARUR5nJW7zTpQ4p7DskZI3vcOwWB7c54bNtfjhMI/kv++jnpES2T9AoR7
         0ZoO6LQdX7b0LLcllVdOkaXouatDoLarvmWUyRzRuFiYE8ejoFnxpnpXLRbfML2NAUuw
         nVFVybHqUCJzbRyBtXjYu/7Uf2h9ChTqHgbpSgRV0/XexhHOJXVRbQUh6VUOWNmvJpxK
         OwQg==
X-Forwarded-Encrypted: i=1; AKwUvBwo5F1XiFzuzxVd3PBh2tAM6L++bZyMxwOcJM3AlVCAGdGaqZXIwK08B/YOmd7zzhoCymv+CJvefT+uQmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr7foK/GGtAZ0mSeH2AHnVMXQoeYqtuArl8d/+wY0ksSEzbcmQ
	nUn5Vy3qOYopG7tqUiMGR2TD3uaeH3xR98MYMrv+I5C4U3U9vKwKpMNhYuzZh7CqL8z1uBPmSDi
	6R543C4SwESnrY5mWcrtp4XmcIzub8HPusK3sj/PTws+FlnRqAhseclNcjQ==
X-Gm-Gg: AYBFou3n9MbyRCVP40FQH75S6lMKyWpAHNQ9lBI7ylAcrHnFEKH34VuXfNxr307BMiX
	3540aHQeTYJHuIPkyBJ5lxd6UXhoIEZmjy4NQWf4awxFzm+uzo3vWua6hbhcg+EcoeB9OT6ADLF
	evQrL65oIO7knL84ATNO62fXliQk0duxQH8ybVDPikBu025SIKCRGdRDOpzQCp/iqzm1x3LHOvC
	t1Iw+7iotOl1iWMq3buNRek5/CFn6FOv8WN4myE4a6ATjvDcysnWjnBacd/YM5LMcAxE8nDGC8a
	ApEZo+dU8rPJ4+l5jeYmhh6nPuUNICkJh30Udgu2oCTfR9JqaPBJq+17cZdXYvDKyfQqjU8ntqG
	szEosWczPB7ym5Fy2r4py6Du9f02NNKGbfNKZ28SGjlXJQwBQNZeVmalomZ4nljxvklXFIlfEzL
	i7aXsy5ljkwBDmhcwoUFmjW4ZS8IKu3jI=
X-Received: by 2002:a05:6214:1d01:b0:912:6380:fe12 with SMTP id
 6a1803df08f44-917c0043ca8mr36615026d6.8.1790917976456; Thu, 01 Oct 2026
 22:12:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907155916.999153-1-pavitrakumarm@vayavyalabs.com>
 <20260907155916.999153-3-pavitrakumarm@vayavyalabs.com> <aqz45SDR8judkwk5@gondor.apana.org.au>
In-Reply-To: <aqz45SDR8judkwk5@gondor.apana.org.au>
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date: Fri, 2 Oct 2026 10:42:44 +0530
X-Gm-Features: AclHuK9z4TzNQCLimIHBRc_f1VJ8yqzmTGjdYfPGf-ABCOBscmzwdXYvuVHOzI8
Message-ID: <CALxtO0nptFbjV-h567rag=ibWTxb_2PtG4ZEKCiAufTt-g-bUg@mail.gmail.com>
Subject: Re: [PATCH v25 2/4] crypto: spacc - Add SPAcc ahash support
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, krzk@kernel.org, 
	conor+dt@kernel.org, ruud.derwig@gf.com, rbannerm@synopsys.com, 
	manjunath.hadli@vayavyalabs.com, adityak@vayavyalabs.com, 
	navami.telsang@vayavyalabs.com, bhoomikak@vayavyalabs.com, 
	nazim.khan@vayavyalabs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herbert,
   My comments are embedded below.

Also while bringing up an async ahash SPAcc driver against 7.3-rc1,
cmac(aes) and xcbc(aes) fail their self-tests at tfm allocation, and
I'd like to understand whether the underlying cause is intentional
before I work around it in the driver.

All tests pass for every hash and HMAC we register, except cmac(aes)
and xcbc(aes). For cmac(aes)/xcbc(aes) it fails.

crypto_ahash_init_tfm() allocates the fallback with:

    crypto_alloc_ahash(name, CRYPTO_ALG_REQ_VIRT,
                       CRYPTO_ALG_ASYNC | CRYPTO_ALG_REQ_VIRT |
                       CRYPTO_AHASH_ALG_NO_EXPORT_CORE);

On our tree no cmac(aes)/xcbc(aes) provider satisfies that: with both
CONFIG_CRYPTO_CMAC/XCBC=3Dy and CONFIG_CRYPTO_LIB_AES_CBC_MACS=3Dy,
neither the crypto/cmac.c template nor the new AES-CMAC library shash
implements export_core/import_core, so both report NO_EXPORT_CORE. The
allocation finds no candidate and returns -EINVAL.

alg: hash: failed to allocate transform for spacc-cmac(aes): -22

The library shash matches ASYNC=3D0 and REQ_VIRT but is rejected on
NO_EXPORT_CORE. No candidate remains. CONFIG_CRYPTO_SELFTESTS_FULL=3Dy,
so this is hit deterministically.

This looks like the case flagged in "crypto: sha256 - Implement
export_core() and import_core()" (Eric, Sep 2025), which notes that
since
commit 9d7a0ab1c753 export_core/import_core "effectively became
mandatory... since legacy drivers that need a fallback depend on
them."
sha256/sha512/md5/hmac gained export_core, but cmac(aes)/xcbc(aes) did not.

Is the absence of export_core/import_core on cmac(aes)/xcbc(aes)
intentional -- i.e. async offload drivers must not rely on the core
software fallback for these MACs -- or is it an oversight that should
be addressed the way sha256 was?

Warm regards,
Pavitrakumar
Vayavya Labs Pvt. Ltd.

On Fri, Sep 18, 2026 at 2:10=E2=80=AFPM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> On Mon, Sep 07, 2026 at 09:29:14PM +0530, Pavitrakumar Managutte wrote:
> >
> > +static int spacc_hash_init(struct ahash_request *req)
> > +{
> > +     int rc;
> > +     struct crypto_ahash *tfm        =3D crypto_ahash_reqtfm(req);
> > +     struct spacc_crypto_ctx *tctx   =3D crypto_ahash_ctx(tfm);
> > +     struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> > +
> > +     memset(ctx->state_buffer, 0, sizeof(ctx->state_buffer));
> > +
> > +     if (tctx->shash_fb) {
> > +             SHASH_DESC_ON_STACK(desc, tctx->shash_fb);
> > +
> > +             desc->tfm =3D tctx->shash_fb;
> > +             rc =3D crypto_shash_init(desc);
> > +             if (!rc)
> > +                     rc =3D crypto_shash_export(desc, ctx->state_buffe=
r);
> > +             shash_desc_zero(desc);
> > +     } else {
> > +             HASH_FBREQ_ON_STACK(fbreq, req);
> > +
> > +             rc =3D crypto_ahash_init(fbreq);
> > +             if (!rc)
> > +                     rc =3D crypto_ahash_export(fbreq, ctx->state_buff=
er);
> > +             HASH_REQUEST_ZERO(fbreq);
> > +     }
>
> Why do we need two fallback paths? It would appear that you can
> just use the else clause in all cases.
PK: Will fix that. We just need the ahash else path.

>
> > +static const struct ahash_engine_alg spacc_hash_template =3D {
> > +     .base =3D {
> > +             .init     =3D spacc_hash_init,
> > +             .update   =3D spacc_hash_update,
> > +             .final    =3D spacc_hash_final,
> > +             .finup    =3D spacc_hash_finup,
> > +             .digest   =3D spacc_hash_digest,
> > +             .setkey   =3D spacc_hash_setkey,
> > +             .export   =3D spacc_hash_export,
> > +             .import   =3D spacc_hash_import,
> > +             .init_tfm =3D spacc_hash_init_tfm,
> > +             .exit_tfm =3D spacc_hash_exit_tfm,
> > +
> > +             .halg.base =3D {
> > +                     .cra_priority   =3D 300,
> > +                     .cra_module     =3D THIS_MODULE,
> > +                     .cra_ctxsize    =3D sizeof(struct spacc_crypto_ct=
x),
> > +                     .cra_reqsize    =3D sizeof(struct spacc_crypto_re=
qctx),
> > +                     .cra_destroy    =3D spacc_hash_alg_destroy,
> > +                     .cra_flags      =3D CRYPTO_ALG_TYPE_AHASH    |
> > +                                       CRYPTO_ALG_ASYNC
>
> Please use BLOCK_ONLY for all new drivers.  See aspeed for an
> example on how it works.
PK: Is this needed for SPAcc? Let me give some context here.
The SPAcc engine computes MACs in a single shot only; it cannot export
or import intermediate MAC state. So, following the current model, the
driver registers async ahash algorithms and relies on the
core-provided software fallback for the incremental
(init/update/final) path, as per your suggestion. So is the BLOCK_ONLY
flag still needed?

>
> > +     /*
> > +      * CMAC/XCBC-AES have a dedicated shash fallback (allocated in
> > +      * init_tfm).  They must not advertise CRYPTO_ALG_OPTIONAL_KEY or
> > +      * the crypto API may try to use the generic ahash fallback for t=
hem,
> > +      * which would recurse back into this driver.
> > +      */
>
> How can it recurse back into the driver? The fallback allocated
> by the API is always synchronous so unless your driver is sync
> (which it is not) it cannot recurse.
PK: Agreed, will remove that.

>
> > +             salg->alg.hash.base.halg.base.cra_flags =3D
> > +                     CRYPTO_ALG_TYPE_AHASH | CRYPTO_ALG_ASYNC |
> > +                     CRYPTO_ALG_NEED_FALLBACK;
>
> There is no need to set NEED_FALLBACK as the API now allocates
> fallbacks for all async drivers.
PK: Agreed, I will fix that.

>
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
