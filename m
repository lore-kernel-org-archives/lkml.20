Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A51549E12C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081154; cv=pass; b=ryiq0MJ1lhomoboD3GQLHZZN6nRTBytQH0AruMS9XTg2Ro5YRYLTi9GiZFvnr0dkhfOwqvNh6LIgWXg4rauXO78MCZWLF0WoqMrQ8zbHEjMgdVTmf3vdRPKSdWnGdRqfYkPCOZcjDlSVK2BQMZeeeJZLfMCytV72ySwbpYjUmoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081154; c=relaxed/simple;
	bh=MxbHQSc36+Cj3qvwqFUOVnGFSlLCbZBNP8jpCDyMX1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nv95pVEVBUeUk1CVeJOOqd/Lnu+GoJKS/0Ln08ILxdREsqZS5JIUzmUMesrMz42zH64IWxVbVP8b88zsPk7+VjFMjtaZtFItkkWeMLP51RStvw845pPZBF2KlM6gUZiJfRQKM8ZdvuYpfn/8r4ZFTIS/b2t00ur3g3s6mf5/CeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=HPqT79Kx; arc=pass smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="HPqT79Kx"
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALUhTa4182492
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:59:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=0jfNGAEM+OQZAg1bxzAMB0kFZfwSkZpEu8EAe
	BmzArc=; b=HPqT79KxZ9SGeVYH7gEM4p4JtAPZkBbGPMMEgJ/HzOWf0WgZWAIhg
	qg+BN3MFSzy+k6O2gcgklC6qIsFiu69/NDF3rAuN3g8gWUpyXtKaL8pXfgcmNdTL
	ddUbZDPpCJJNloiw9cLz7Ayuw+maeO9r/62YO/XAljpOZbQ5MfVjzoHh/RPHEpSk
	TVX2xh8S/G4riSUIc2IdpgiMq9aDX6VuC5bKcNR8cdibrf31/Dc8Nfj+X/zOaypN
	5k7Ehkf7YEToBrh7eBCjPfp/qV2eEfd/8sreMlwQ8b62oz8tHL5zVw6BXyMDA0Km
	s8sMe7zkpctGCTA0sKlkgAB2tgOmPpkjQ==
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4gkcyf2e71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:59:12 -0700 (PDT)
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cc954a3edso1797865e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789081151; cv=none;
        d=google.com; s=arc-20260327;
        b=LuhUvcsY9rKrcn2OkXONBCmYoNS0ZNTx7vM55qOl/VlInXl66ew6USUtFgEiNzoLY5
         fj6FTVDAaHB29nf72pVPhENMZwXHxMrLYQzOIr3RkF6O08MA+bYxgisNERnVxwUey0fJ
         HJluEu6NyQv5+AT1X9WIEIb3ErLoY382ophdNeEFPDzEc//UFGO/UDJKlI3EencrBubx
         xQr4N3vTFREwK6Tl38qnri1mZAFFixnpo8U2wOiSEehhWcPDBTuzkRL+vokRPKyoZF9N
         KaDRSWzRsq96wmU6FhCLLszEpYTYYs/e39jAvVZkZ9Nk05IeVf8HtS8XGkdQlpQIQRg4
         zVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=0jfNGAEM+OQZAg1bxzAMB0kFZfwSkZpEu8EAeBmzArc=;
        fh=pBz6BDBJ6Gy8BBOVxPOSvTtYsCeuL33b/WvgdJyVFFQ=;
        b=YDka8IRbZ2uUUMWoP62u28KO8+JCj/8folZFcOcZ6rqOzpdr0TG5ftG5lUVfxuIenW
         qXW9J2JOz4u2bPe6k/CJPuVUiyPUK038ar50teXFdYm61ACIMJPtpRR214jZDewbL107
         OBY3VkkfzSFvnJ7vNXf1rllQEprl8NC4c3uCmEHjB4ggWgTKad8V4h+ZqejQccMjIzVT
         dXbD0kKCsg/Y0rr9JxKGGFdm7gHHvYsTpuXULXEYvWevC10OHQ82ndlkX3RgK/v7H1BC
         CpdAY8MyaD/JjetPURmfIDay1EXUffhtTvCAW+CmMcZ2HpCQmE/oKoGih1c25HM6ce3Q
         MQrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081151; x=1789685951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0jfNGAEM+OQZAg1bxzAMB0kFZfwSkZpEu8EAeBmzArc=;
        b=pZohIk3mjm1x/h/eTrLu2mILthvkDZmrLblDDMNEAE0Zy6/poWxB+kb3m0luFY4ZWP
         YnKEZxW+qxxr5wvHaB/bfe0nuv0o+KyHbZrnfRiKCOgCPa0xLwJk8yZoOilEtxZqhyuC
         7ZVO0clp1szFSms5p2jyrIaggeidbieheUnL6Pwb0E/1A/86JapDqfazmcjuSpNn7hdh
         Qp6fSHYWggOdy+GHA2EZtczTMLdP8aSu4z0nVVu3747dN1AO6SAo5AsY0ev9QaKkQ4vJ
         EJjTC11Iw/Cl1O3b9heX2ThbuEje/qmgzuMEz3wCSQYFSND+uEwOjTym48TqE4RKqy+N
         sLnw==
X-Forwarded-Encrypted: i=1; AKwUvBwrqwnWyYuVQC4juo45B2c1dChAokjvJFlADKx5xUgn7atzSgvEACUkJxO5ideZSiaUKQOTF4jG06exKes=@vger.kernel.org
X-Gm-Message-State: AFuF++lwLpY8ovBEEMZsLWbeRL+Q+xAk2AokiQZmU7luBBYYhR+Niwmp
	7F0TmrSw2otH+8M90kuNo/xKeziJCARaVc6Vk23JXS1scfDWlNHIeyhQU2KB3ncqGLRfDqMuJkf
	D7YiigRtCTP0BAut17xRONjV+G1CR/GlSWg13WredmB7vym1Odhal0IDiJZKqOulgCF+3lFbF6e
	HiDhSDnbAmWCFvH75v7Jae+xo9bZAWws3g4VbE13I=
X-Gm-Gg: AYBFou1iCrwQQDQCIl9f+LmA06tIwsamCdUqMyaCKY/BrudVeub/8FZFW2EXdiWHsW2
	EqsGfavEmPTuKKDLLNnG1FxOGbShsXQeBB1fcPKuVHDhCMpjCPHnv/LT7cKiVl8Vujnv501ifcK
	9iVK6hUYJsPFEFna8W4Q2EKXVlO8IfwS2dy54urYiacqms7MpQ3TSZdWHhBQ==
X-Received: by 2002:a05:600c:4691:b0:49c:fea1:f792 with SMTP id 5b1f17b1804b1-49e6198f947mr15649155e9.12.1789081150897;
        Thu, 10 Sep 2026 15:59:10 -0700 (PDT)
X-Received: by 2002:a05:600c:4691:b0:49c:fea1:f792 with SMTP id
 5b1f17b1804b1-49e6198f947mr15648885e9.12.1789081150567; Thu, 10 Sep 2026
 15:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825220616.3842633-1-usama.arif@linux.dev> <20260825220616.3842633-2-usama.arif@linux.dev>
In-Reply-To: <20260825220616.3842633-2-usama.arif@linux.dev>
From: Nick Terrell <terrelln@meta.com>
Date: Thu, 10 Sep 2026 18:58:59 -0400
X-Gm-Features: AcwNN1Xkkvpw5kh_J4iDqvwaktvZZyPgsMQn5je-Rl0y9F9lfAVGewsJgep96yk
Message-ID: <CA+BOzqrLj4AKQT-O+MyUPYqgYiz3Q-hY5=HSG8oFPjNwd0ZYRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] crypto: zstd - Avoid redundant cstream initialization
To: Usama Arif <usama.arif@linux.dev>
Cc: davem@davemloft.net, dsterba@suse.com,
        Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, terrelln@fb.com, hannes@cmpxchg.org,
        yosry@kernel.org, nphamcs@gmail.com, chengming.zhou@linux.dev,
        shakeel.butt@linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI4OSBTYWx0ZWRfX/HeCS6hct84o
 xogV5+fw/jH7yGuBTA/t9S5WPc7s2Y4Pw6XIIe6h82pJFHoBVfmtzq8ulqhabonIIiUQUniMaPo
 O1Tf3A58IWGgQIauHWOWOdlhZRjYZqU=
X-Authority-Analysis: v=2.4 cv=bP2Ds/+Z c=1 sm=1 tr=0 ts=6aa33640 cx=c_pps
 a=Q4jRaax7EcWM5fECTC1wcQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=-natSxOHJVU2ER_2Es0A:9 a=QEXdDO2ut3YA:10 a=nJq5_VNI1X7IEIKzvdHs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI4OSBTYWx0ZWRfX6r7iJMO+8he1
 YpFQGPTe+aKHzIIklfaKj+BAWZ2DBBFqUyrxtXxMZXgdZ4pgzYS9d9u/d2PDQcobyIjy1fWw5f7
 p6MoWGjmRFzCf7Q+JJ6kkV6KFqRAosgJlM8gQXM5AllimCtSAU5qiOU6BbkAuefkNUxKTg52H+G
 /Dw5OvMPD09yBT+OdJaCNs0i5eqKimqu2REchskIiK7mc8GBavaPWRD5i5+equ27oROo3Uq6VeP
 l2QBV+tS1kl81l2uomd8oARKBU1JzYKa4qjIt6DoaMDS62dUNdWeTH8FfaHIemceXOU2f9/bsE1
 XpiXlpm7w7sYoxs1O6PPkZbuBWyAk0T9aE9vTcEBg0uQIzAqEYjn1wuBUIK7yTjBoD+Ou/DHuiD
 0di868f7KmGioKqiUSye1VZEB6ymEvsZ2LGZySEuMVYL+EjFxM/LqtIptHOuPa5XvOLFESOkMpn
 nRt2tjA/yuQzJw0ZUJA==
X-Proofpoint-GUID: gyY3XiVwCFadPkXg5eJ4ptC9pUm6vgK_
X-Proofpoint-ORIG-GUID: gyY3XiVwCFadPkXg5eJ4ptC9pUm6vgK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01

On Tue, Aug 25, 2026 at 6:06=E2=80=AFPM Usama Arif <usama.arif@linux.dev> w=
rote:
> zstd_compress() initializes the shared workspace as a CStream before
> entering the walk loop. If the first source and destination fragments
> each span the whole request it then hands off to zstd_compress_one(),
> which initializes that same ctx->wksp as a CCtx, discarding the CStream
> setup without having compressed a byte. zswap always takes this one-shot
> path when storing, so every page it stores paid for both.
>
> Neither is cheap: zstd_init_cstream() redoes the cwksp layout, zeroes the
> ZSTD_CCtx, probes for BMI2 through ZSTD_cpuid(), then resets the session
> and parameters and replays ten validated ZSTD_CCtx_setParameter() calls.
>
> Defer the CStream initialization to the first walk iteration that needs
> it, guarded by a flag because that iteration can be reached more than
> once. The first inner iteration either takes the one-shot path and
> returns or initializes the CStream, so the trailing zstd_end_stream()
> cannot pick up the stale context left in ctx->cctx by an earlier request.
> Unlike the old call site the new one runs with the walk's fragments
> mapped, so it has to release them before failing.
>
> For a 4 KB crypto_acomp benchmark for compression, twelve runs of nine
> 30K operation rounds, on the bare-metal host the median per-round mean
> request time fell from 52,283 ns to 51,038 ns (2.4%). In the one-vCPU
> KVM guest it fell from 16,675 ns to 15,050 ns (9.8%).
> The larger improvement in guest is because of the pair of CPUID
> instructions in ZSTD_cpuid() that the removed initialization runs.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

This optimization is a clear win, and makes sense to apply even after the
BMI2 patches in zstd, as it also removes other initialization work such as
zeroing buffers. Thanks for finding & fixing this!

> ---
>  crypto/zstd.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/crypto/zstd.c b/crypto/zstd.c
> index 556f5d2bdd5fb..d64472f3e11e5 100644
> --- a/crypto/zstd.c
> +++ b/crypto/zstd.c
> @@ -96,6 +96,7 @@ static int zstd_compress_one(struct acomp_req *req, str=
uct zstd_ctx *ctx,
>
>  static int zstd_compress(struct acomp_req *req)
>  {
> +       bool stream_initialized =3D false;
>         struct crypto_acomp_stream *s;
>         unsigned int pos, scur, dcur;
>         unsigned int total_out =3D 0;
> @@ -115,12 +116,6 @@ static int zstd_compress(struct acomp_req *req)
>         if (ret)
>                 goto out;
>
> -       ctx->cctx =3D zstd_init_cstream(&ctx->params, 0, ctx->wksp, ctx->=
wksp_size);
> -       if (!ctx->cctx) {
> -               ret =3D -EINVAL;
> -               goto out;
> -       }
> -
>         do {
>                 dcur =3D acomp_walk_next_dst(&walk);
>                 if (!dcur) {
> @@ -142,6 +137,19 @@ static int zstd_compress(struct acomp_req *req)
>                                 goto out;
>                         }
>
> +                       if (!stream_initialized) {
> +                               ctx->cctx =3D zstd_init_cstream(&ctx->par=
ams, 0,
> +                                                             ctx->wksp, =
ctx->wksp_size);
> +                               if (!ctx->cctx) {
> +                                       /* Release in the reverse of the =
map order. */
> +                                       acomp_walk_done_src(&walk, 0);
> +                                       acomp_walk_done_dst(&walk, 0);
> +                                       ret =3D -EINVAL;
> +                                       goto out;

The other error paths, e.g. when ZSTD_isError() is true below, don't call
acomp_walk_done_src() or acomp_walk_done_dst(). The difference is
that they are returning -EIO rather than -EINVAL.

I don't know enough about the acomp API to know which behavior is
correct, but want to flag this as it seems like one of them may be incorrec=
t.

The same question applies to the next patch for decompression.


> +                               }
> +                               stream_initialized =3D true;
> +                       }
> +
>                         if (scur) {
>                                 inbuf.pos =3D 0;
>                                 inbuf.src =3D walk.src.virt.addr;
> --
> 2.53.0-Meta
>
