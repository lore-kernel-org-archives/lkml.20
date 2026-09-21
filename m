Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F45172EC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027741; cv=none; b=BnoTEovwRMutLGqKo+HhQYBHMskY4XLIEy31RHGRU2T2NrT21pm/L2uDxAQ8y8KTYBWzzS5QrOIO68Rq341fXevm80tEzADs3RFQRFEQorw3FDHbrgNLrh22n87/R8Wy0VJTZiVLiJ6xA+gVtZnGs9VUuzDq/a7kNWinHvUN4As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027741; c=relaxed/simple;
	bh=HCdxYoKJS4JXP84pYdyR7ipBqIPncIEkdtGfKAzM21A=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=OP+BS6Qmz7HFE0RvwZghCuvE1+fwRgpvLIqcTHUY/x1pIpLzcs8GHW18rS45iOwXdviB3CsqgzSpPa5XzCqDwhjX4Nwu8A1+TfojW9Ow1qA+0yWYBTvmjL79Y5aYSa7Oqois2xJe+WHD7H2UUfHhzwvJntY5K2aU0LhkVt4l22M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=at+3b0JI; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="at+3b0JI"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so3053092a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790027740; x=1790632540; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JR/I8dSNLWX0oO0TxgyXU1KNRLBlNCoS227EjBBu2Z0=;
        b=at+3b0JIil/2xgXzEBxyhfV7aqGwE4aK81Ne5s4I2/YA4HlkxJ3KflJfq9ExkDNf4O
         8X0wJeVliAlGeV9j9+GJ1KveSGtg+j1Y5RWFy81NaZ3MHjcpRGV0h0Eqd3HCQbUEl+cu
         vpmrgc/yFOZzGRIqYipoGVqAUfJ4Fb9EIelikwhY+aWRXiQ0zdX1E6Wf2dgKrHtGWYtT
         qJqwWKKOgJ6Qdt46zXN+kIaHJjdACVsjgkVfLaLCyR/gCgxLzWI5ep16SzlK7gYubLxp
         fk1DUWRJk3WoDG6wCLLsmaFxJtZtP2ap9YiGKZ0Lm6/kHuI543nZzeeuuwR5Ja/iq8QI
         inQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027740; x=1790632540;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JR/I8dSNLWX0oO0TxgyXU1KNRLBlNCoS227EjBBu2Z0=;
        b=LcIB6ZK+0M5zzFBJ5y0SG4ZQvVcpR1yDDFH/fmEOIomOLDi7xeO4qzhEZyttRbeNVO
         /icjfPWLNQlFeYs5W1jqpq3FfQFnTsHMkiur1q4665fHo0Iv2ygI7NUe77/XJCKSFHni
         yMAd/4c2w4Ja/Ku6+rHG28flB+aSyyWhJ7NeslyLvNlc2UsKBVmCOALvAaIxH9vRP3Ob
         14UnCFIrnYCRMkCzUpyzvpEh2RKNLqIu+JmKp+YNt27BaYHZzasfJI+sQUXeQ4iqyCeZ
         5SKODFyk88aW83TaLWSpzP/XeVqEQq39pdEi/lCrKFMxt9nge/DiKLVjx+DtEzfeuMLP
         j2Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxbI3DdKy82xvev4sB5SxAS52pV26kNHst3nTWY9sPvW2FndTME50/Nx7NUVY1KJ1jvbScFK3v/PpYtW5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nqYwQmI8yNrnVmctzJS7ZLGZ8O7tljBN8T5JN9uzCsQlSoCHh8
	QPwEJKPT/UOLUKlS2MZU1exlbNy/hZ9rNP2Nvp/Zb4zQ504Te+Ts0BGA
X-Gm-Gg: AYBFou09oUjnV9efEXpxv7y+GY08NmlgkCcB5eUCNitK5lZkmrujRq/GmQGbCn33qBt
	kU0Eq4VmU2Lv9zjzoMtUeY0fS+aLLtYp/Dt61DTifyPZfjpSq7IpUjlAh2HbJBqwO4DomHJo+B+
	9LNJjI7KOQFWuAFfKDFb9zP1DPxHAgwuyFTn8wuKiSwB9wE465yCxVpf5zl9iqxbwoNVDf/M8wn
	f54RPtYLoryAmcw9akuP3vCCCrcoaKgJNJPIIAEKbmYENOVN0NIlRWnetwM71lZqp5LS3q8KPdX
	PltUqPWit1UbZDQTYiW8MgtT49UsqL1bqI8+0GupWga9DV8Di88KNd7B7X146d3HqkYMypjc1bx
	Jy4ElQZ2yfJCyZ66p6H0vi6VtmF3lxlMz5u5NgwcUNpRDP2U+nVD0w9aRLEjuz8JCcLcpdPvgMN
	cGyb7d6a/DKM2T6xAYRN83qg+ftzf3TjqxjtNOJNAYUK6VZEI5hYorCCLWWECmKjbEioQaL7sYf
	I/+4wNn1G8jIBCAFzEnc30m4Xglqj7yGmIC7hrOKbpFIoRnrpaF3kkR7A/dniOfwyDkDjaoGMFn
	BNI=
X-Received: by 2002:a17:90b:3909:b0:39e:3558:f925 with SMTP id 98e67ed59e1d1-39e54d86a97mr17008107a91.24.1790027739732;
        Mon, 21 Sep 2026 14:55:39 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0699c5486sm640851a91.14.2026.09.21.14.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 14:55:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 21:55:38 +0000
Message-Id: <DLLBVIU33MLC.ITFPYGMFKWUT@gmail.com>
To: "Eduard Zingerman" <eddyz87@gmail.com>, "Vineet Gupta"
 <vineet.gupta@linux.dev>
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
X-Mailer: aerc 0.17.0
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-4-vineet.gupta@linux.dev>
 <DLDKI0ZXYI7H.1XQZZE2RCU7IF@gmail.com>
 <4ab75099-0e95-4fee-81da-6f4198e3e6a0@linux.dev>
 <CAADnVQ+N9tzBJ0Bbvp8_8QvR+QcCP4ej5CgV_kRHt=iw4BANSQ@mail.gmail.com>
 <202c45e2-58ba-4ad5-a234-c90703031f91@linux.dev>
 <CAADnVQ+Si9Au8J_j2nt+ZzFq6WPaz8hpmh0n=_dFysZmSOeipA@mail.gmail.com>
 <ff18ccb77a554000a030199e8c1fbb7d8d298e18.camel@gmail.com>
 <DLL84IMPTRQF.3DOQQTN2KCAEW@gmail.com>
 <e9aad352ba82dadd97a17867108b5db1865fa38d.camel@gmail.com>
 <DLL8Q69N7BUD.1HI0MKU2M2UGE@gmail.com>
 <951923920747d8dcba3d56ca8858e106d9c7ba4e.camel@gmail.com>
In-Reply-To: <951923920747d8dcba3d56ca8858e106d9c7ba4e.camel@gmail.com>

On Mon Sep 21, 2026 at 7:44 PM UTC, Eduard Zingerman wrote:
> > > > >=20
> > > > > Where:
> > > > > - id =3D=3D 0 =3D> no id link
> > > > > - full =3D> all 64-bits of the register are identical to
> > > > >           all 64-bits of a scalar value `id' (let's call it X).
> > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D full}, rB{X,ful=
l} =3D> rA =3D=3D rB
> > > > > - zext =3D> lower 32-bits of the register are identical to
> > > > >           lower 32-bits of a scalar value X,
> > > > >           upper 32-bits of the register are null.
> > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,zext} =
=3D> rA % 32 =3D=3D rB % 32
> > > > > - sext =3D> lower 32-bits of the register are identical to
> > > > >           lower 32-bits of a scalar value X,
> > > > >           upper 32-bits of the register are either 0 or 1,
> > > > >           depending on the bit 31 value.
> > > > >           =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,sext} =
=3D> sext(rA % 32) =3D=3D sext(rB % 32)
> > > >=20
> > > > hmm.
> > > > there is also 32-bit link with delta, right?
> > >=20
> > > My point is that delta is independent of 32-bit/64-bit property.
> > > `delta' can be used to propagate in both directions:
> > > - full 64 bit -> 32 bit sign/zero-extened
> > > - 32 bit sign/zero-extened -> full 64-bit
> >=20
> > both? how ?
> > I was under impression that in 32-bit domain delta is one way.
> > rX =3D ...
> > wY =3D wX
> > wY +=3D 5
> >=20
> > if wY =3D=3D 10
> > We cannot do -5 to rX
>
> Why?
> It is still valid to transfer r32 and tnum_subreg knowledge from wY to rX=
.
>
>   wY + 5 =3D=3D rX % 32 + 5 =3D> hence rX % 32 knowledge can be recovered=
.
>
> If rX itself had some delta, e.g.:
>
>   rX =3D ...
>   rX +=3D 7
>   wY =3D wX
>   wY +=3D 5
>
> Then it would still be possible:
>
>   wY + 5 =3D=3D (rX - 7) % 32 + 5 =3D rX % 32 - 2.
>
> Again, in case of this direction, only lower 32-bits of the 'full'
> register can be inferred.

Ok, so we're argeeing that it's not 'full' in your above definition.
Your enum id_link_kind needs a 4th category : apply-delta-to-lower-32bit-..=
.
and it's not bi-directional.

rX =3D ...
wY =3D wX
wY +=3D 5
if wY =3D=3D 10
here can apply -5 to lower 32-bit of rX only.

rX =3D ...
wY =3D wX
wY +=3D 5
if rX =3D=3D 10
here can apply +5 to lower 32-bit of wY _and_ do zero extend into full rY.

I don't see a value of 'zext' kind alone that doesn't do 'add delta'.
