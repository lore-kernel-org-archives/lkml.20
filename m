Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85CF4FDE7E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017162; cv=none; b=evKn6zvqWo8dw2x+zCjhUk+VGw/NZjRg9gE3C/AzCYnNyal9iiBV2SjvyMCjUkZeiYF2xgehE14eZwdL9G2rV+qrwgvgtfvQANnwJsh0/ySp+0RzxEI7mX5906CvhhgF+U402zHDWBDEuU0jqaSTOYUmCAvIUb9pwELwuZoQ2B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017162; c=relaxed/simple;
	bh=YnyvAjF56sMlW0OrPQrd2ZaEK0kUPzuONswa+SYLl8g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NzONO5LLr5BLfwhQDp6grBqg6DGfMiso3PxZKoNawCD/vb9tmjYIVXjCSiCFPcCbpd4LkI3DBis2KyfXFqNrAUTX0P7yyeNJGEUSAaOu2ekkZYLQSKM+ZROILNF+KXvFeD9WsKu8yddtb0WirWH9Fni3VfygjWCBJcOKkWmX7uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiKaX7GO; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiKaX7GO"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso317503a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790017160; x=1790621960; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UerVz0NFlQQ3lB7m/y4z+RXJf80VJxp8tkbVGLZEVEo=;
        b=aiKaX7GO7H30r+xmDq0tFH8ytRtwJHm0Erkx5xvHYGUEVQwUgtOKBhF34jowuBLuWs
         RpyZShBYg/9EKZ+NG/5+MRfqMTwWNsTAkeb+ul2oKmKY5zpoDCq1hZEnbean4C2bV4ZN
         ENRtktK2qKpOQbtQE0Wn9TUA45D8WzDztjE6NQsn+ruxGnx3ncoorHb63R2oSjE0mZOf
         ewOJIyVZb6L/Q0xm8fUvpE044m2XyYjo8YEAPv0TYd2hlNd9tlD4XMnDa/YzdMl2OB3P
         q6zOPAnyBjDRiJ/FcFAQ9jDXhvi5qhJ0gVzRBOOl4mjeAbjBYMsk9SuaRWg2REB4EVx2
         VsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017160; x=1790621960;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UerVz0NFlQQ3lB7m/y4z+RXJf80VJxp8tkbVGLZEVEo=;
        b=BvYseoNZJhYx13VIvrztSK/lVY/qdcCieDBKKTchCLanoTDE8zasOU9+Jl5Z8TryI7
         8w0eJ5khq4yWpWWl12trWOwO5+n4NVMXDcmNOsenSUha9r2344CVtX/NNR7+gTooX8eR
         O00GgNJ8pMdnLQ9/o6dyIvld5g9yQabwYI1Dxz1CMMlaA+FlVuRiNSy1gkKV+KKoSs8w
         uZ01aFneO6n8xzAeNw/X4t8XbcnjzkdRNR81cOMFSRh4W7mF6f63LDANdEErVV+9OsD0
         uaggkkj6fKTrJdPLTRYOX0Ul+oLVfvnVDPqpyLQKiZtBGMlfIHPhVC9bakpfJ308K4kI
         Jffg==
X-Forwarded-Encrypted: i=1; AKwUvBzdhfj6VNcYLsi4YF3fXkq4lR5xf0INdv9jN9ucLG41MClYg0rEUJF7kZdq2KcqmYLTYbizy+AIDMFdZyE=@vger.kernel.org
X-Gm-Message-State: AFuF++kl6FeR8oDdgnMlL/1GWGEWUQ1sVMPgK26MXUZdM9DpWZt1bgUQ
	o3c3riSIwaj4jAA99oXnB/bKwWWoNeYTao+qqyZ/y8IZj8G5ViOpTnef
X-Gm-Gg: AYBFou0RWPCA/z06skEboOeZJUaKnwbQYJX0ulC/H5zVLt62d7m6DEzmxt09fQKIis9
	1fhv5Vv+UPtjFuG12ceOO5lNWzkhzi4Kt03UtsSJBytnzqKwQJeG5NZX+Io8i70YIF0ZHizxQNH
	KAvPSU/B/c5JVkmRC4nkW8kQR9C6joLTGhs8T13CwYni4RUq5DWjQRPihB2zbMQzOmsjEapO5oh
	S7XymNp22v1rfw6NjP9DnbzD7abZFRO3k4feO0LAdHlPhasbrvx6t0OVrzsXukItkNqDnM0ZsEY
	Au/cMWHt+o69U41uOMfLw+lmkUPIrMtbh1jueERAGRBi4YiY7kHMXOI909Ns2nDarqJCPgb+ivv
	X6hR5VSjZnQZ4suLeUB8uRq82zu9EG8AW24cf75LOBmkyeYoRcD0Be1G/WUMYPdYsWD6h+9wYBh
	mSHcNlx7TLkipSwL17ECQfSQjYEoYsEwasekHBbOksfs4v53ebo7OL6KYTLzQmmEjjWvHN+nYYO
	2Vg4fY5IZeo7ZsdMZu78viRf12p1ifAMwk0obHYi6n0jEeUN0ZM18iHq/X3ezvpUKFTFjgjv0D6
	AfA=
X-Received: by 2002:a17:903:1b08:b0:2dd:c100:9440 with SMTP id d9443c01a7336-2ddc1009c6bmr112993325ad.62.1790017160092;
        Mon, 21 Sep 2026 11:59:20 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df3c2acf1csm28063935ad.32.2026.09.21.11.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 11:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 18:59:19 +0000
Message-Id: <DLL84IMPTRQF.3DOQQTN2KCAEW@gmail.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "John Fastabend" <john.fastabend@gmail.com>,
 "Shuah Khan" <shuah@kernel.org>, "bpf" <bpf@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 03/13] bpf: track low-32 scalar equality
 across zero-extending movs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Eduard Zingerman" <eddyz87@gmail.com>, "Vineet Gupta"
 <vineet.gupta@linux.dev>
X-Mailer: aerc 0.17.0
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-4-vineet.gupta@linux.dev>
 <DLDKI0ZXYI7H.1XQZZE2RCU7IF@gmail.com>
 <4ab75099-0e95-4fee-81da-6f4198e3e6a0@linux.dev>
 <CAADnVQ+N9tzBJ0Bbvp8_8QvR+QcCP4ej5CgV_kRHt=iw4BANSQ@mail.gmail.com>
 <202c45e2-58ba-4ad5-a234-c90703031f91@linux.dev>
 <CAADnVQ+Si9Au8J_j2nt+ZzFq6WPaz8hpmh0n=_dFysZmSOeipA@mail.gmail.com>
 <ff18ccb77a554000a030199e8c1fbb7d8d298e18.camel@gmail.com>
In-Reply-To: <ff18ccb77a554000a030199e8c1fbb7d8d298e18.camel@gmail.com>

On Mon Sep 21, 2026 at 5:28 PM UTC, Eduard Zingerman wrote:
> On Wed, 2026-09-16 at 17:30 -0700, Alexei Starovoitov wrote:
> > On Wed, Sep 16, 2026 at 5:08=E2=80=AFPM Vineet Gupta <vineet.gupta@linu=
x.dev> wrote:
> > >=20
> > > It ended up with full testsuite run parity - after 4 incremental patc=
hes.
> > > But the pattern of all those patches was adding some predicate /
> > > special-casing to reg->add_const
> > >=20
> > > hunk 1
> > >=20
> > > -       if (src_reg->add_const)
> > > +       if (src_reg->add_const && src_reg->delta)
> >=20
> > why? It should not.
> > My point is that zero is not special.
> > It should be handled within the current framework.
> > All these extra hunks are not correct.
> > ADD_CONST_32 logic should work for delta =3D=3D 0 just like
> > it works for delta =3D=3D 1.
>
> After thinking about it some more, I agree that having an orthogonal
> encoding would be nice. However, it appears that the split should be
> somewhat different:
>
>   struct bpf_reg_state {
>     ...
>     s32 delta;
>     u32 id;
>     enum id_link_kind { full, zext, sext } link_kind;
>     ...
>   }
>
> Where:
> - id =3D=3D 0 =3D> no id link
> - full =3D> all 64-bits of the register are identical to
>           all 64-bits of a scalar value `id' (let's call it X).
>           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D full}, rB{X,full} =3D> =
rA =3D=3D rB
> - zext =3D> lower 32-bits of the register are identical to
>           lower 32-bits of a scalar value X,
>           upper 32-bits of the register are null.
>           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,zext} =3D> rA =
% 32 =3D=3D rB % 32
> - sext =3D> lower 32-bits of the register are identical to
>           lower 32-bits of a scalar value X,
>           upper 32-bits of the register are either 0 or 1,
>           depending on the bit 31 value.
>           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,sext} =3D> sex=
t(rA % 32) =3D=3D sext(rB % 32)

hmm.
there is also 32-bit link with delta, right?

> The reason for such subdivision is that:
>
>   (X + delta) % 32 =3D=3D X % 32 + delta % 32 =3D=3D X % 32 + delta iff d=
elta < 2^32
>
> Meaning that a non-zero delta can still be used to infer the state of
> the lower 32-bits, e.g.:
> - if  r1 =3D (X + delta) % 32
> - and r2 =3D X
> - and there is a comparison `if r1 < 42 goto ...`
>
> This comparison adds constraints on lower bits of r1,
> and it is correct to transfer these constraints to lower bits of r2
> by subtracting delta from r1 and using lower bits of the result.

Not sure what you're arguing about.
My only point is that 32-bit link with delta makes special
handling of zext unnecessary.
I still don't hear a strong reason why it needs to be handled
outside of 32-bit-link-with-delta.

