Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C073F46C820
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779080; cv=pass; b=qxbUuHnlMY9qVhn+EDRz/dYMivrdNYL92fl9ggI+lOIdZuegcEFzwzGvc5VdgA61KtMvWXWzChOf0Bu6BK63OYJBH+iwaYTk97X/k6nVx3gvAo+EdX7w5Pts19l5LN7enP+/FuS0YMYfWP1nkMBQDTunys+KcEsby2ilrkFyCao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779080; c=relaxed/simple;
	bh=yCAyZIF61tRxPw74wJRZpA4stMyF4VxjFKJbseRE7ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QU5D1ocqbhehxHXLR9qSYDuTFY0VYGCrtDgsDFnHAB3dmwZEdTLpv1nIJ3TxdupPUuE3tLYvY8TlSP7bghvN3Rp2Ufgs/F3Wzv87wRRn4vJIjoW9JNAOpWkaqWoYyqP7YSBma0soKYBatyTzNqCeq8XNV+AtwDLzT8H/QnP6hKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mp9XhkyO; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mp9XhkyO"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-982838c4cccso1335036241.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790779064; cv=none;
        d=google.com; s=arc-20260327;
        b=AQvowPYUMlrYUuMwj9rbVfCywFCjBhlHidZx7ZPJTPknaxDoR9GuV5IqSW4sKv3U6o
         30B25dUHQmEE2XjL/fEVKh31E80HyiRJWNidzjYxMMq+rokwEMCQY0YbRHQ1WxeoVPUd
         7oAFYtxkUaHAyEXTiG3gHb1VeKdBQSqEJ8Rtv3Hba1yOmGWku5XlX7S07F61BuQsNz/1
         Z/11x+/MaOjDqaA5DOcmqAnU6T0eCtafGqg7xr8lMo5YI0Oacnmye1Sfu1xst2faUcs9
         SvqKE5zV4BlBMoLjWhyFkrOX64KDKUvr5upqtQU6ch75TFsKfQbb4Gv3nPBxIAJ/FlAC
         LKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrGL1nV8lb3cnBxKMQABXnqttgXw91NKIu4eAmXKFA4=;
        fh=t45Q5qC63WSB0Ua2FxjTQHd4avTHuvAabHsPL+NIfBc=;
        b=JsCv8rkB8XxLeOwEhz7/Dx4kFm9nnjUk+hW4OlsrLx0A0aMfktgqX5BZjoKZYQRTat
         nfnykxL3nPulw1pjmvZ0I0L3hwMekb5bqP4hNmajBeeuYq9upL7+te9HTxIiyW4qtQ/m
         jrWJ+MRz9d8fXEpTrUOQFwCquCEj9dHxw0cEmx5hZsKYEsmwCk2v0Hsonp55+VyvGQR3
         2/vN0m4TfP9BWkwNrr1r44sBjSaD1bvbkV30BvsO++9Dcj4/oUfMxPl18L0cqkXzQuT+
         wnl0y7iNZM43PEbBBdw1ohuq7aJdjuqA5mFIAe4kR4bnkTm8l72b6LEUsxFWqzhNJt1V
         QcjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790779064; x=1791383864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nrGL1nV8lb3cnBxKMQABXnqttgXw91NKIu4eAmXKFA4=;
        b=mp9XhkyO+RN+vkaqNmSpMxG614UzUlWDev41gf1YjQsydwbIP2fO4b3bgX+mSqdrcg
         gncepiS3nHnGzO1DJgX93xxYfwYofz7mPOxJgvFH3KNe0v9Va4sWuHNL3OVeCgiGzs9g
         8d711I3bZ0sX+jy4rSka1wsRmOcdlcQK4w7IOCW5lci6KV90ktwFbFEF/wY3g/sp1Jx3
         P2cCKxwJ0b2eiG6VnxXgyJpB2B7D/xrSpeGU19QqR7G7I59ai/zDpSGezWrwIb0Nc5xl
         tBAsbeHiLiTAFO5V3tOjj48XlqiWMkG0JIG65fEkZZ7kd0glDaUW3Tn88DDV3FFMT9+T
         2Zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779064; x=1791383864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrGL1nV8lb3cnBxKMQABXnqttgXw91NKIu4eAmXKFA4=;
        b=OUCcghtMc8Pgbqy/PBpd1OkAEX6Bi63kVI1a8HIE5QAzICze9DAchrZNP6bMwdWshM
         FvH1mrdtRJk8XnnOHKM6q0Db+Hc/kKiKCAoUEebFnTdNr2snyARckcogTFRQkMhEpNpo
         gbwgcQxf/7sC0rFk8qeOzzwrLndyRNLF9XC+D5GozcP/v09OsOZQOqcV2ewdWBdG13Ji
         vmuZG3VcRAgbk6HpsYGW7vFmgkrxWrR9ilpLMS2l0BYR+WSuCj5yXl0M51qEooZW5kpd
         z6ZZQJt0C8ZW7OozCzL/qzXCXw6lmwswnnw5lsUhGp4BgRRZSMaiE/Ts0DEh01puD0Yk
         33eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzSaQLq7vDGC2nCr8yEO93rAbudpw/JCY3MXgUe1BsLiRugKVriAnrmMu/tSLFaGan27qab0X4wtE05pY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8n0x9iawdmmUv1xsSIGzTxwYcerLYZhrJG2vy2T9/GwxCnQ+g
	kFr2nvzRw5n+QoN2u+LH7U6Upq6uoWdYONhpc/Bv7TY5NgltVeQhe0uO/aL/+jK9MTYH//exNBb
	Uy+NZ5qv8+b6irle5EKpfHzp5lXSKu6w=
X-Gm-Gg: AYBFou3TzKPcVs1yEYHbJ7TX4fhlmO4wxcorh8TWzfhZKcFv1Qswr0UOtdClbsouB3q
	f999U+1NH1vA8dMBAmpYZGpW/PFAe1uSHr1jqdkYlDta5LR5d2FhaOyBjOOlSd9vnR/waDJu0BX
	rm8vUfJT8eXvSQeFkSOtWgNWbXpophSZYKdA+L5dLZWBS/F2J8oZgbFW7LVCtJ64SJVJZF85/p9
	qj+NVj5dRj4l8xqZy/f0R2mhsVfnpREvqi17hKYHsJpgXa+xwjSAU3Sb1/bnpLSbk5WAdXHTr6g
	GrJMasybGsDN/FoMx7Ubc6v3DOKizupLgp5+hXDcMWHG3aaAg2S+UB4cXZw+x10Fxj1FxA5VUjw
	RplvTLh78xj8osWMtWYqU
X-Received: by 2002:a67:f318:0:b0:7b7:39ec:51d5 with SMTP id
 ada2fe7eead31-7be72eacee4mr262776137.24.1790779063510; Wed, 30 Sep 2026
 07:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn> <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
In-Reply-To: <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
From: Han Gao <rabenda.cn@gmail.com>
Date: Wed, 30 Sep 2026 22:37:28 +0800
X-Gm-Features: AclHuK8xJHH-GchuoPDOK3EtJJuoEe-0ukOfyhbCCKAHr55R9addDARC_M8Pukk
Message-ID: <CAAT7Ki90CLoWwauNDShNFt4LS+3+nC-6tV1UqwAJP=KD0E56pQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: riscv: thead: add Milk-V Meles
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 7:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Sep 29, 2026 at 06:22:45PM +0800, Han Gao wrote:
> > Document the Milk-V Meles board compatible with the TH1520 fallback.
> >
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  Documentation/devicetree/bindings/riscv/thead.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Docum=
entation/devicetree/bindings/riscv/thead.yaml
> > index 301912dcd290e60f816d380152591106de9415b4..5361021b8dcc9897803a591=
5665c6bb83309fe53 100644
> > --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> > @@ -21,6 +21,10 @@ properties:
> >          items:
> >            - const: beagle,beaglev-ahead
> >            - const: thead,th1520
> > +      - description: Milk-V Meles single board computer
> > +        items:
> > +          - const: milkv,meles
>
> Why isn't this enum with the previous entry?

Merging will result in the loss of SBC manufacturer information.
Milk-V is an independent manufacturer.

Thanks,
Han

>
> Best regards,
> Krzysztof
>
