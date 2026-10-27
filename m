Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793088841;
	b=fLEnCBGiAn6CWl5DmZPAOhL6z4651UuALRLHYlKSEK/FzfuoPbceMej7HAIgQnoLd+B7
	 6pRXSA/QifvTEHH5wLYwaZdZ07ySSwHymzqSKlP4ALwh4vRdslNrRUo28jDqc3SRrJOCh
	 +4OYRZ4nO+gxjPu7si1KcXJnu0wkh2TGuY3xo1YlI/PN0Q22bpQvkoeA0R411sf/M/k0P
	 9lQIQdW5Uh7mvXM5NOufBDkffZbEXTcjCNneJuOxSQhUrVhOW1lBxmOntfYxrJ1rOeN/u
	 nQan862fInj5umREb3ImdKkTDtMKTSZSXqTi2z9XwLiqiy/pcvhI7j1lVEpwG7n8M5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w8VOaIxB0TFBB/OhvCNXDLo6PM/lUvCeTHrTbRbZxP4=;
	b=Onc8cnRP7PpTGYoLFnu7ZyS3D/YnKMzWFZ5X4vRlAWKsDAR/MgzI0W+n3++Y3LMUciPV
	 IGRS3IGQ6ooqr/pawAzmT7GoOi27b9do/En8uzWhgL1xkkcf4Q5m8LwQouFkoZFYG1E5r
	 dQGNXnPuERW7fkreXFFgIaVg7WnnMYG/Lm8MGbsGcrcWsUqFkq1zhF2JjqYioJsyh1OpQ
	 6LkRRATWd/nrshrjkUyOleOF++ZZQRQphNKs229PGK0ZHF+X4lQ1zO3GOg6q1TfR6/xn8
	 VzfGlrSdtTKaj+kGZzEASdZ9i+ytSB4lUzDx5275/XNYODmYadWjFYB66Z+Ntc497QA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EbkYUlEv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C476606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C476606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EbkYUlEv
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48e2d5a69c4so2166732fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793088840; cv=none;
        d=google.com; s=arc-20260327;
        b=r5afb08UJ+x6AFMx9bVVQXesUxdtLvn20TMZQvV6NUxO9u2CRhUGTZlT4QxEbXD63g
         8Uai+pyby7WqCehXgJ+yFco9+y2qq72eOJSjNbSVxiMbez449bcYDcKDa0Krjdwy4qfQ
         ENQEJvnpDpzgrJBfLYMmpAOpj0KEfBi9WkBZrv6v+lJbLu9vLnROaDzwFbWqR4OclQmA
         F03JUmkDNZ3UA5nSV+YmgwRTZ9C2dPhTbyePkZ3fpWbLmq3kqdvWNV7liXJ8QR2aYNst
         2AEdFrW89BaBUnR8fLALOI6Oj82mvnd/4D5D3qIKSEt/DYl7GgZ9wmYUwBM42y/DJPyQ
         lrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w8VOaIxB0TFBB/OhvCNXDLo6PM/lUvCeTHrTbRbZxP4=;
        fh=uLQo9SRyK396izdTuPgielpSRk4k0cewX5p5rcwfCjo=;
        b=bsyaBBJrJr/MgfEgH/nNSdZ+5fxI94ejeEi3CsfSngBC0Zsdq9qgOy3G3iseBFCTaM
         AT6AhnHErwMr4mrVkufUVQx8E1KLdRuPq1plPnGvmoHVEKJr7my3jMEE8FPlS7+qjd0P
         4ZXIqEyhcRGY6MVFsQteJcMrvOwQA/Kb+jqZcPVtMzBU5L8lfnHY/p7vhmgvgaWoS1d7
         sudFWLhFMXhtrluSnLZyy8+DM5stBWlHiR0412Ov/Vwy+9ruXx1zN5eoE2vFK1Wh34Tf
         q9zOTUV5zFkHliDksLht6a6LuKh34I+tbyTgqnUIQk4CuFa3PEU1vCk0Y12D73Q/ZWsD
         Gf7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088840; x=1793693640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w8VOaIxB0TFBB/OhvCNXDLo6PM/lUvCeTHrTbRbZxP4=;
        b=EbkYUlEvI54rZurwWBXKCqht4R9252FrTxKpsmrco/FVgLTJbIBcOVOabTmv/4O1FU
         IizKxH7saDJxzpilr9W+8GW4PmsrOr402uwSpFRrIoAslfGIP+FEFnhTzOnyxRyGgVKl
         iQ9rnD8Y5RiymicdzvUuOBBhs8IuE2AlLW9Ya0yBBnT0VLa8eC8AMegTerf+/OQnPX0a
         g49GPpeyqx8AwsVvr0j73uLEvo/M7C75aQkNMRxJCxHhsiSg6wEs41BXUj+BWJlehxHL
         e7aNuGm3edpoyRl//l8XvUpBRCn9Z3IydbAq70O0FfMB4LXag8897pCCLPZjlSFcjvK+
         haew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088840; x=1793693640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8VOaIxB0TFBB/OhvCNXDLo6PM/lUvCeTHrTbRbZxP4=;
        b=kM6zd5eRWgNlB4nXcGWaWJDzx2Mn86wUI2YrI1QSKrZwDmijjWv9ryfL8UARA64V7q
         19p+CDNFupmmNdCY2lT80023emztAAmM9SPU0eIPIgV4JB5ygOzPu85LJVX0TJBXAde4
         KlzM/Pnb1j6x3kmb4t5mxooWGoN0H5C78DaLGXU9he/jMPWE09jffDwunkljIZ9O/cDL
         PQ8gvCe5Jhb1TyaDC4AH/4t35lITIWzDOOh8eAAUTZsxdhCuaTWEfn+w/lusZFgVhAAs
         NBsBezvxfgFMr4sIWRaTvB67Xo/XHtnjTS5AILXd5FwUreh6RAD/7HNMwee5EPr8IqP6
         ydTA==
X-Forwarded-Encrypted: i=1; AKwUvBxPunD6rajThcEYEufNSGsHYOGGuXngvPz6UOV2kxBFzh97HC5q/6nxoZuAqU/BIiIxvMOAL904ATB/n10=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnoMpMaRxObBkMej1IBtZQEbb7qMIcKKmI2hazAuaZw/adpm4D
	XK/Y4Yce39oInKV8OP3mktUkRQNBjkSPRh8+7n0lr+16LgRDvqJgtVn/KAtEPEZkeUjv+R25j76
	Z9+Ik9NifTJUyQAqs1e+GGjXcm/zsZF2Osn5Hfww=
X-Gm-Gg: AYBFou1C429+oo2QYaAYHw/bajk+Jaj2AegWSDZw8ksu7KGm2LwUbHbbwKDZwSyLC/D
	jrLCzbSy6Hxa2al9oJtTF4JnpiQMFRF7ZshguhRVO252pA2IiRKaYrZ6S+81p/7ewXz80C8XL0B
	1/OF0BjYqTnr+iWF1vdBJvwWo53pwrzOHXiE5b8pc5T2dfRC2aowDlpw2N0JIhN/C/NdSNpe/dn
	UK/6YWIW5AUN73GHlJESaYT7n553DfJzWg6gHGlUP1qJ/mMnGSw3VJk4Pep76s3F5/g9NXe/hvL
	RiD1dJ1RX2pf1+QR6Xf0ivw/A0BdOC5t+XOnwAvhlVSZ1rf/ukPQCRb47gqKru53nnqlK08aDNE
	67ADM9nM+zZF9F5zeWwX94dto4d5+fwlXAdyclg==
X-Received: by 2002:a05:6870:148d:b0:49d:ff8c:2070 with SMTP id
 586e51a60fabf-4a83f64f8a1mr5440798fac.62.1793088839941; Tue, 27 Oct 2026
 01:13:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016081006.26069-1-yangtiezhu@loongson.cn>
 <20261016081006.26069-4-yangtiezhu@loongson.cn> <CAEyhmHQe5T6Ai0LXiJnwXzBgy_Xu5=upeqWHbMz7J3X6QntWBA@mail.gmail.com>
 <b5c793ec-c951-930f-fc9d-06de6f49ac9e@loongson.cn>
In-Reply-To: <b5c793ec-c951-930f-fc9d-06de6f49ac9e@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 27 Oct 2026 16:13:48 +0800
X-Gm-Features: AclHuK98IjpjRz-E6wrGUKQi5ueh0VkowRqNb6vJZLkdRKcKoBwQRts6NLE8Z_U
Message-ID: <CAEyhmHQkJzTjmYfocSqoFYBJ4Q8bq6D=Rojce3EbCAJLWEQSww@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] LoongArch: BPF: Optimize 32-bit operations using
 native instructions
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 12:10=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> On 2026/10/27 =E4=B8=8A=E5=8D=8810:02, Hengqi Chen wrote:
> > On Fri, Oct 16, 2026 at 4:10=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> Currently, the LoongArch BPF JIT emits numerous redundant zero and sig=
n
> >> extensions across 32-bit operations, bloating the final JIT image size
> >> and also leading to runtime overhead, particularly in the division and
> >> modulo operations. Thus, it is necessary to optimize 32-bit operations
> >> by emitting LoongArch native 32-bit word instructions.
>
> ...
>
> >> +               if (cpu_has_div32) {
> >> +                       if (!off)
> >> +                               emit_insn(ctx, divwu, dst, dst, src);
> >> +                       else
> >> +                               emit_insn(ctx, divw, dst, dst, src);
> >
> > For ALU32 SDIV, off !=3D 0, it seems like there is a overflow in S32_MI=
N / -1.
> > verifier_sdiv.c has related test cases but annotate with
> > __arch_x86_64, so it is not run on LoongArch.
>
> After enabling the signed division and modulo overflow tests for
> LoongArch, here are the test results:
>
> $ sudo ./test_progs -t verifier_sdiv | grep "MIN/-1"
> #731/121 verifier_sdiv/SDIV64, overflow r/r, LLONG_MIN/-1:OK
> #731/123 verifier_sdiv/SDIV64, overflow r/i, LLONG_MIN/-1:OK
> #731/125 verifier_sdiv/SDIV32, overflow r/r, INT_MIN/-1:OK
> #731/127 verifier_sdiv/SDIV32, overflow r/i, INT_MIN/-1:OK
> #731/129 verifier_sdiv/SMOD64, overflow r/r, LLONG_MIN/-1:OK
> #731/131 verifier_sdiv/SMOD64, overflow r/i, LLONG_MIN/-1:OK
> #731/133 verifier_sdiv/SMOD32, overflow r/r, INT_MIN/-1:OK
> #731/135 verifier_sdiv/SMOD32, overflow r/i, INT_MIN/-1:OK
>
> That is to say, the current jit code is no problem.
>

Great.

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> Thanks,
> Tiezhu
>
