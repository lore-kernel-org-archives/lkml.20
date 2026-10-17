Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211738D018
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206203; cv=pass; b=meU6URejvqZAp1y6m20mLd2q/hhSuG4iYI8IEQsNNU2LMevooaEPFznsL2lL7tcF9hQbdsDK7sljlatwfOUTSpVUfInVB0o3H6vfncR8aqKEH68fs6VS2S1brFOGKIpnSV40CIrtUXFyLtYMcAAOwQrGnHXnh8tiPcgH4C2eT9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206203; c=relaxed/simple;
	bh=Y758vtkUylvdUTjnWxG7o3+mdkQeB1hyCOH9J+3c3Pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQU4CCJQ/q0bfMKmbJofYAyf1uJ1u0i3puYch5yT8YLyFgKl7A5kRyfnRtk9G+R8B5CUoicckhon2mpQkKcwIrtQ7A7dAyvcHSXW0QCq3XpDMrRjDUKZmYv/uLg7dzPcGtj0dKBdrsAfJF9V+gWuMReRt2/Lgy4AmRva9MRP5yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4t3YT/r; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4t3YT/r"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a75f960be3so4411151fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792206200; cv=none;
        d=google.com; s=arc-20260327;
        b=Zprzi0nZadNkGjHWl4A5kd/fF3uoTsfJ9eAczJm/DRLoABpgRXn/nkCs0G5/6seixH
         0UolqRObFVICM7lMx9uhyz/eY4Us1TAGvAw5nEImsfAAh0HR/Y/95430QJkiH/WVQJx5
         PpGigX/jhySOHy0oA5KjHPOJM2YeLN71JDt7mQ9mWWSkahApL9f5nfJepcaDMvSxn7m5
         OOY0YR20XvlQNugtsvFv1JPP2mNatrTOcFzdxfjGTpCMX13cZtr+KgdDpLOf/+/ZrAfE
         duMf0sWFAxa6s2NoqxYzEnGzdi5h8uNXiaw+iCVAK+Id7XmJKzG7Kfu/t5WCslUpXJWT
         JbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ITlG7B4NPmKc5iTiQo1+RWMGxf3FDyH5p5Xf+trlVM=;
        fh=zQy39fIXkvASPjzqlwo8syqrNiPn5khrDE3ELiD1gwg=;
        b=QDcPxhbNSxVhFbTJA8GjZz+zUwbKW+64RSHTMDTAU09MylD6aqvuIf0ZiHZEpKMpFG
         fHRVfFe/6LPU8M1/KJ5tJWLac4uVc21FBhgcM6rfktsLu54DR5F3ypTq0Jd9ODoyZ8SL
         NFU02YFvoVm7wAyoJHTvWltUgJ4VNrQyzKbtHpO0Ft671MjnsJBTOly9ECknpn9RUdSh
         A26gghlxrIVVFfS/DsLeIcse/BZdzl96erKI6nsgv+kIXvZ8VOwjMmIyviAHaQ22GckY
         61iycDwO1JpTY2WvPzr0gBA6XAhmqFJGG9cwzCJumktQ6ssjUtDeQ3q6VavZXxsNXKsf
         r6zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792206200; x=1792811000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ITlG7B4NPmKc5iTiQo1+RWMGxf3FDyH5p5Xf+trlVM=;
        b=X4t3YT/ri3D/xAtkQk+SXgjIGTSBycyg6zhQbySFaKsPrjbMwDFD1OQGz/awzxcskm
         M86w8X/wwk/2CfvXjdinM1akbWIVJJZCDj2py8svhI+qpq1DJv80bCzbJDFJ8uKhT6g9
         bZTVg9BDDzWQGxSLYjFAO2iQlQlcHFRn8onofRy0szfWmBF3DhlQPQK0Pc7qouEzTBck
         gb+xf5bTDICfYPYf6dXtMvgMBuch9xzONaC7jCQZ7MQ2F+gWEw2wNi/Kh3yKG7zIE4az
         iX3Taan8ITvv8vSHCB7er2BD33A1lt9qCYSD7B7jAhdSDk5yfcuFh2KdI2guAo5Wn3oV
         gKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206200; x=1792811000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ITlG7B4NPmKc5iTiQo1+RWMGxf3FDyH5p5Xf+trlVM=;
        b=Tnu3M2MRLaFdQnT5TKFfFZmSPsG5VVMl/vIA0p+juiwtEEFkdazD1ZC7MRsny714cn
         GWMbi9i3/huPEyIBXMrMJCz4g4N9zM00K3kQDW/yaQNOtX3mBwUYpuj9ToC67doaf/3H
         2dlChOp94lkiHLSv9e3feZgMutJ+ZgatW47xTAgF2z6UornRuX+iG3WfDQ3/wGy3f6Kc
         O8YN3vq4VGNODPamOOz5uuokJj+CvExq63ZErOMpgd55Ei3BIa5v3nOxM9AyNB8/izag
         iMoBMuhgP2K9cIqqDfY6cAXVr6oc+pj6XbGutwNZ3Ghrfj/rqcJ2CavWy+ZCMCFoRcdP
         zo3g==
X-Forwarded-Encrypted: i=1; AKwUvBy512T3/M7jagheot8bQ7pzhxOjiy8VPv+rF9Xm560M/pcBD4lynPjluMxF7fK4aS0Yryus9OQkZSoXMCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1cRBPb5c73Z3KGs6YyA7Fjbwd6fzuRSY2h5Ms4kkCfIZwMJH7
	AWt1FH5ESan3K+mjuYStSdtzF7OBaTOl1zqml8eDyrhEqGlQKWQDV8cQhpQsIXGSaJPkIOV6m75
	/ycbt3p0jziMdkaoMIlapJlFQqlysvhA=
X-Gm-Gg: AYBFou1MskVH0h+hwGbw4MeA31wiz569fbUVy8SyBcQ+GD7b4llfWiqA8kM5/2rrXuU
	1prE7/cRhfO45IwIoB8syLl3e/10j36QT+v+8cLQmgpjSDcROAin2AsBVK8lnzsIuoMmL/Yk88q
	hnFcm3ooBf5kz8iyJAJrwS9YbORvn7eLIS9SENsNXZe6oZMexqSHjKpTurtoL9L5KIB40lTKoLd
	1MUxhbtTpWmbXWc4MeB4ImwmjUgtacpAo/t2uKoM8B2jWT77+FrYKahY91w2kuW59SHHbwcKYVa
	4u1rreW5/QUj3Plf4wAnmVyKVu6vCulE8hVcBiAG/jiSXLFFuAYZANs=
X-Received: by 2002:ac2:5691:0:b0:5bc:e13b:3922 with SMTP id
 2adb3069b0e04-5be509a6de1mr460213e87.0.1792206200169; Fri, 16 Oct 2026
 20:03:20 -0700 (PDT)
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
Date: Fri, 16 Oct 2026 20:03:07 -0700
X-Gm-Features: AclHuK9xQKLEm9ED0FPrZSYZivJi3qifBTa2ucE7flkZGwWDvl2MosDfqLg1aQY
Message-ID: <CACpmpofyLW5z1DYEY2YAty0VOAhRR+Leic8O-B0N9hrzdW_=Ew@mail.gmail.com>
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

I made the suggested change as follows:

diff --git a/crypto/acompress.c b/crypto/acompress.c
index 192ea996e779..6697cf5944a3 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -271,11 +271,19 @@ static void acomp_reqchain_done(void *data, int err)

 static int acomp_do_req_chain(struct acomp_req *req, bool comp)
 {
+ struct crypto_acomp *tfm =3D crypto_acomp_reqtfm(req);
  int err;

  if (unlikely(req->unit_size && req->slen > req->unit_size))
  return -ENOSYS;

+ if (likely(acomp_request_issg(req) &&
+   !crypto_acomp_req_seg(tfm) && comp)) {
+ err =3D tfm->compress(req);
+ req->dst->length =3D unlikely(err) ? err : req->dlen;
+ return err;
+ }
+
  acomp_save_req(req, acomp_reqchain_done);

  err =3D acomp_do_one_req(req, comp);
@@ -293,7 +301,7 @@ int crypto_acomp_compress(struct acomp_req *req)
  return -EAGAIN;

  if (likely(req->unit_size && acomp_request_issg(req))) {
- if (!crypto_acomp_req_seg(tfm))
+ if (likely(!crypto_acomp_req_seg(tfm)))
  return acomp_do_req_chain(req, true);

  return tfm->compress(req);

The Average throughput of 10 iterations usemem is 19,058 KB/s. IOW, I
don't get the same performance boost as making the localized change in
crypto_acomp_compress(), likely because of added computes per compress
call (one function call, two conditionals).

I think the localized change in crypto_acomp_compress() looks a bit
cleaner as compared to the special-casing for "comp" in the generic
acomp_do_req_chain().

In any case, please let me know if the above data helps.

Thanks!

>
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
