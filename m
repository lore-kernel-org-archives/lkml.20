Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE5534DCD2
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213349; cv=pass; b=RD3G+tzgnX6UoAJF7g4QoL1vINFb/8ZuKzlUX4xJhuh5JXFfFXcaY0vgL5NuhMTwX4nrCR42Zg8zxKSbHP9Qh24Mi+TdxWWpCSEW2IRvRSRi3CCf3alv1Gs5YRSVJDPB+U6o9SU4MTpo5pK/Hdmlh+UCljAScuHWUyMqtrXokYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213349; c=relaxed/simple;
	bh=qA4ufMq4NgXLgUYdkQ43Xh3EEM7qAnRV0fG7/RHdhqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3mBySqByru8WORy2DyVKq4MXelTj48blprtHCZmkJiZkBu3PTNb/XNYL6evDMXcr2kF50QuBr3ctSi8gHs/l39kXxoU3UKhF8m/JuvNZMZ/cdl71QnnSjqfh2oLY5NJSlTqz4FfaanS2vQ7FXtdetUVuNxMbGFhCF4RneWepjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjSvgtjL; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjSvgtjL"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4d648aacso487755e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792213346; cv=none;
        d=google.com; s=arc-20260327;
        b=Z5yTovL6vxU/EHJKh8ethKqv+Ah8p6KIbIJPwhfGrUrfeEY1vjdsbnu3ipFEwvTXZx
         exRlntwiPs3Jr3VY791kyvfjlLBuh4K+WtxvN4oMdwp1RGvQIdCufvkh1nYKd9v6CKCB
         yrItvwSJqGGGznndspU57c33Gmpx+4rnYpNxO/yA8PLnSGko277hQIWdWW9nSLo+XZmT
         eIshJB5+LOPvrvjzE438ijA7tFUTLYqeY7P0LEIlpn+ms8dnrNP5KpQ//IqcZoRUFwm8
         eW6R5ALB2oEQrtanEEt3Esa7iThPmARaQi1x3POwH7tOhVXtQXI6CBSWHwnq7zDt0Z0w
         LAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qA4ufMq4NgXLgUYdkQ43Xh3EEM7qAnRV0fG7/RHdhqY=;
        fh=szMMO9y3q+2f6li5ikRjqDov/K5I/xnIVHK0u9xoqJQ=;
        b=NeiylHqov2QcquYmEqvjhKXfXC+kpJtzbcwtOZ+hqbDQuJHqHc3+4aR7LsRks7CcyZ
         izwAtK+WxUd7ES++FzyA+D/ymCZQnsK9WU3z2/C/xPElZUYYjC7iwnpFXBQ3IgQZEbVp
         cQK+g25w8B3crTrVH3LA/7TRRvxSce4bCGGsdYsL2ITj866H0VO10w3TK3E4QX2nnjl9
         llEG0CCr+Sxpu0u0HDQ/dMIBzg7L22TP09me0qYFSoTCY6ujDyl1WFBylpdRi/VqUMrV
         NHYa0fMq4CEFSxB8iImeVn/rgUgYG1WTIUFoxP77Mrt4wMKJmIUmvCZWRZdUQtuBRmuS
         8FgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792213346; x=1792818146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qA4ufMq4NgXLgUYdkQ43Xh3EEM7qAnRV0fG7/RHdhqY=;
        b=KjSvgtjLMx0CCk7ab5oGQSnBpSJewW7IMuy5thAfPce3K129hQosuFKvuzZTzfy7BH
         d6pJQUI2veGQNA9KG6Cs0ROV35LGJf95okA9KThBXnuEl78g+mRgiB8utWcef2Nn4R1M
         kiyZ9cXU9GPcld5jre20eBkL7Hr7ErTsWVncghjGgZ8u2OdwmvwlQ7egKLU/q4fxdIuj
         Xydu0sA6E5M2/cK8m8m+UODHd0Vz+VRWLjWrkPcoaLrDxDM5672EYK9KkTSzIksSmy8v
         Y5ENIrS7K10VUvWvzea4MirvGRlNbneiIQ029sbfCcAtq+pZpAHXzmNFSlxJNFN3PuwY
         S2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213346; x=1792818146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qA4ufMq4NgXLgUYdkQ43Xh3EEM7qAnRV0fG7/RHdhqY=;
        b=xj4FOC7eX6s7xv/XKvIofMQcQ+aqiDoV+mNdyCDGfesX7nCEMDn3gSJEbHcp2VolXi
         dKCCSKqcU7IwDT//cazCmJOHU/gYUCYp/zD4VbXKzBNTiOhGFGELBYDknQLVoE5l7QOm
         JOqsMai/BchDeC6+7REUcrweqg5HhVtIq5bH8A0q+yUVeH2OF3s/zssAQyhbZ1256VQt
         xuCR800mwF+3m65BM3+GeC9LFRjVEVw/iT3eQqcUAM/QUGU30o2BKeUFz37PiXCmM3Y8
         yVJEEV3f5Heu1Qdu5mT4RX79rAVqfyLwTdHXytSkuX/5pXq3hnVSPcM254kyvv93skRT
         y24g==
X-Forwarded-Encrypted: i=1; AKwUvBwmgIhirDJ8HwHAm47gBk7cz7GdfwqgZvF3zpYzgjJ2lui12iCGWDgJZXcAH3kp/lUZXcAJO35Cf6whWdo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/puPxcsujVXns/ZsAv9DtZGkMn5rGePLHQtJlaZO0IuEcaWD6
	22ZQn11E4MdvPMn5FIteeY/0jK6ir/y4SbLu3ikVIurPJ7ESsBkCZ8bDe92c0JAgmP66wqJS9a+
	ohDPa84HsC7UUjyrlOxd+vqnJsw0Xqg4U7Fw0
X-Gm-Gg: AYBFou34vRR2ebNqQP5SY+RlsmI/wrMy+lKb7TwlaD7ngwxxyl+SyynOmhk0YiDg8vC
	0illdpzQiddNzkGRkps5Fq7UQOGEpG5BYE8Uw+6Cc3wIGHJu/24CNGhFw/geVA/x33LCj3qfMV+
	ES2BCblWwfm29L+z+khgchXLt8TKC8mv6r4je5ZifaRScez6BBCZ9DcqwOXh72QEAm8wzjYJCtq
	8Hp+pL5LRviMbD7oK6gz2oKLAcDw8+zhrstzcqkp2UHVMRPgUnbP2EoX4Dp+p7F1tVS3On+c79O
	Q03CogHcBxtNYBaXOAx6LgUCqTnjq6ZGG6DLorYbTrOiuDMt8B31D4g=
X-Received: by 2002:a05:6512:3b24:b0:5be:3f7e:7409 with SMTP id
 2adb3069b0e04-5be50a71003mr464282e87.43.1792213345431; Fri, 16 Oct 2026
 22:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <as-jZopKRfuYAiTE@google.com> <CACpmpoeS_cvXRWJXqiYZV9oykk=91efv8KtZgK2Pi-QwHnQH3A@mail.gmail.com>
 <CAO9r8zN5n=9v4K+OtEEODg=e0kcFW99PreUcZm09q9CUMQc+ew@mail.gmail.com>
 <CACpmpofdoeVbbw7izCDeJ7eS+XpWj+3sp3teKEQWywyRB75jYQ@mail.gmail.com>
 <CAO9r8zMaaUsBaS0TJumochRKt2ShV7nRaLnYPWv3=S-wUFgitw@mail.gmail.com>
 <CACpmpoecz4tjr-qvFRy22CGuF+4NBWbE7HVjdTGFqQOheK3CLg@mail.gmail.com>
 <CAO9r8zOAcf4=TscCXjMYvowUx-_u9qLGqY2-p7cK-z5CUU_x8w@mail.gmail.com>
 <CACpmpofYXDMviE6FS-BZdVntmQFvS+_xvfmOnJ2caZFerz6vyg@mail.gmail.com>
 <atGqPIpUfX0LDokV@gondor.apana.org.au> <CACpmpofyLW5z1DYEY2YAty0VOAhRR+Leic8O-B0N9hrzdW_=Ew@mail.gmail.com>
 <atL1ok1YkHbA4AaI@gondor.apana.org.au>
In-Reply-To: <atL1ok1YkHbA4AaI@gondor.apana.org.au>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 16 Oct 2026 22:02:13 -0700
X-Gm-Features: AclHuK83Cy-eJhLJZxzQLRm52k6Crd7V4JEX6EsZtttKAdEO7DhI1ttSz_5rhrM
Message-ID: <CACpmpoe_RXcJM42sTVwk_Qvt3zjAOZhzYZNsRD4xz_1HxDmadg@mail.gmail.com>
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

On Fri, Oct 16, 2026 at 9:12=E2=80=AFPM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> On Fri, Oct 16, 2026 at 08:03:07PM -0700, Kanchana P. Sridhar wrote:
> >
> > The Average throughput of 10 iterations usemem is 19,058 KB/s. IOW, I
> > don't get the same performance boost as making the localized change in
> > crypto_acomp_compress(), likely because of added computes per compress
> > call (one function call, two conditionals).
>
> What are we comparing against?

Sorry, I should have clarified! The comparison is against having the
conditional and short-circuit in crypto_acomp_compress() [1]. I was
referring to this as the "localized change in crypto_acomp_compress".

10 iterations usemem Average throughput with Conditional &
short-circuit placement in:

crypto_acomp_compress(): 20,946 KB/s
acomp_do_req_chain(): 19,058 KB/s

>
> The thing is that the conditional will have to be there at some
> point as otherwise this becomes pointless.
>
> What if you just do the conditional and short-circuit in
> crypto_acomp_compress?

Yes, this is the first option I tried (20,946 KB/s).

[1]:

int crypto_acomp_compress(struct acomp_req *req)
{
struct crypto_acomp *tfm =3D crypto_acomp_reqtfm(req);

if (unlikely(acomp_req_on_stack(req) && acomp_is_async(tfm)))
return -EAGAIN;

if (likely(req->unit_size && acomp_request_issg(req))) {
if (likely(!crypto_acomp_req_seg(tfm))) {
int err =3D tfm->compress(req);

req->dst->length =3D unlikely(err) ? err : req->dlen;
return err;
}

return tfm->compress(req);
}

if (crypto_acomp_req_virt(tfm) || acomp_request_issg(req))
return tfm->compress(req);

return acomp_do_req_chain(req, true);
}

Thanks,
Kanchana

>
> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
