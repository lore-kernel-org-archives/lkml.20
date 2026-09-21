Received: from mail-pz2-f31.google.com (mail-pz2-f31.google.com [74.125.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FBE4D7955
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011736; cv=none; b=hKCN4my6U0lnQs7pfhEFer4v4cEccw7WSe0dGmWP7GMTMsonOVzGS1L/uHXnCNwO7WY4Y3AC1o/wqryJN6cV5C1C2L15Wp7Bpj9L+LcJKG6UEeWZh93K08cM8Cp70wlkmPD2TJhsMdZ5f1pGz4H1r+kkSI5W3RukRL81ia7H8D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011736; c=relaxed/simple;
	bh=rKs1PU/5QOsLafJXwPqxenRp7To/56/uq9dt0Za38oE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NNsSuJ6bI+Gz1qbKQQYJ/+WrUmOXc/Zua/l6M7HrBMh1rzNSxZNi5HenNxZVjs0dXa2fnDpXRGeeW/0hzUBeaNdvpq1rDKplQLEGru+iF1aPpsxII+q3xU9qNn3Kd2Au3cptiNEaIIrK6oF/bkFVihT9sqYv8i6qBrZRFQ0oSvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6MAVgun; arc=none smtp.client-ip=74.125.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6MAVgun"
Received: by mail-pz2-f31.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so625373a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790011734; x=1790616534; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HIyz24hYf1UON6o/FWpN0/OOApAPHNljwo6ieAFOIdE=;
        b=q6MAVgunCEvkKtuho/gH767WK4Mj6JuRA1loT1Whs+xBhjPiwGDPI27AOyigYcb01A
         s73i6Qfjl8mqi7fTaaprZjuW95yX0gEi+VZqEPdaQxcyRpV7z/bp5u8WGDxQxQ15Vghu
         6wB/YGZdFrJ6+u3LTn+anp6xM30HTxFsZ0ur+vpR8umGGZ9j/iqsEVzhARMvcqvKNgFd
         +jBbSbeRAXBCW7BhA52/9/UJzYhGUoHa8WHc01Vl4fX3PKqijTJu2RHNPN5qJua2/HNn
         G4CehG3ujussfnqzVg0CttI3tFuZAWdiD2sEGHsZ/P5qdAz7TzO4CBNmcaBP1TFx9PLQ
         oJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790011734; x=1790616534;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HIyz24hYf1UON6o/FWpN0/OOApAPHNljwo6ieAFOIdE=;
        b=paXCa6Aw4imC+E40CcuCRihp7r9ogxlJCa8uEcdS0GrH47J/ccACS5osKFwxaKJfCc
         I0VyHX8YlhwW3uz2oCFQPdxaAHePEGuAtLb2w23M+ca5AlGETIfdAXd6TsVMNDQM78OP
         glPWi3RwzKlGfISOFhNwf4NgYzWKARuaZkXm/bdy0zsuE7eG1V9+ob9n35t9kTqte0sb
         EdE0gcyfHLkYDWCdKY5M7sDYWiRDbyKNHQoifiEi0zCzjq0905TBdiPgSSmIiKr13nLG
         C49CwiL5F3QNOFanmQTbpk+1UCya8UfpRULI5bu9+NHHOS9xS46P7bWCx9ehxaiFQysW
         fGIg==
X-Forwarded-Encrypted: i=1; AKwUvBykwIqZTN5M6ucpDh3tIBxRoJdqiHknCtyOtX5Fr6jZzm8z+YtyoNYVqiMY0gqXBPr4MT8WLQR11jdGooQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lYqKlXPncOlSQSInxzh/Gxh3kyI8iuiiIHVCOSXQ+gdQHoz1ez
	n29uMjlwwUxlIxOD0b+pHqauYxZ1Iowr3THwdVJdoDF82r0rOOoI/DN7
X-Gm-Gg: AYBFou1b8bkrRgqAibAfIFDSwyPIH7wby/8RvCLKAyXWuThFAcE9uW0pKXUnnzHXlVZ
	a6In/A8144lsAifVX+FRCcXPBpPZmSGG5jABifz2qdC6vp+Vq8dbz6lAKJsMYevtS2u3EgbBqdl
	RYYCDvfybc9NVrgCJ0C4ANtwhHbiNiJQzFhwNuRbDyQRc1wroXa/g9RXtH/wX9PPiqUam6E+xyh
	SWLvd5OnBswH1MKWQP1MYxKqay4kiZlb1Wtbz0td+ZmYlEgiOOlzXj4pgXlMNc6Zti4ZHqOHnSo
	WS3edrKnbE0/0GpNdaqGPn/UAfC9ko8R3Xj1n8yi/1KCZA66pY4SjejF4PffTnpx1lR0abenn2n
	4r+oLLnjWLrzBY+54pVeJ+hxBbiQWRfFVQVCXdmtEw17pCi2EGhtkkR3tyHT/p2Lewypna12ZDN
	nZMzxeFeZT2qwQHpUHkUXK3OMg2CMenQJdlHUjE5aoKj82/adqBIWvobewxtS0pbzK5/UgX3CQF
	X+iKj+GIDX/VOOYYLIvtF9dSeWKgPkMIpmDFWTthRyDIbYc/h6JSxgP/A==
X-Received: by 2002:a17:90b:314c:b0:39e:6c68:fd92 with SMTP id 98e67ed59e1d1-3a066b94a2cmr204240a91.39.1790011734071;
        Mon, 21 Sep 2026 10:28:54 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:431d:4670:d5b5:343a? ([2620:10d:c090:500::4:1bba])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067021ca6sm355722a91.2.2026.09.21.10.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:28:53 -0700 (PDT)
Message-ID: <ff18ccb77a554000a030199e8c1fbb7d8d298e18.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 03/13] bpf: track low-32 scalar equality
 across zero-extending movs
From: Eduard Zingerman <eddyz87@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Vineet Gupta
	 <vineet.gupta@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, John
 Fastabend	 <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf	
 <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "open
 list:KERNEL SELFTEST FRAMEWORK"	 <linux-kselftest@vger.kernel.org>
Date: Mon, 21 Sep 2026 10:28:50 -0700
In-Reply-To: <CAADnVQ+Si9Au8J_j2nt+ZzFq6WPaz8hpmh0n=_dFysZmSOeipA@mail.gmail.com>
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
	 <20260910164635.459558-4-vineet.gupta@linux.dev>
	 <DLDKI0ZXYI7H.1XQZZE2RCU7IF@gmail.com>
	 <4ab75099-0e95-4fee-81da-6f4198e3e6a0@linux.dev>
	 <CAADnVQ+N9tzBJ0Bbvp8_8QvR+QcCP4ej5CgV_kRHt=iw4BANSQ@mail.gmail.com>
	 <202c45e2-58ba-4ad5-a234-c90703031f91@linux.dev>
	 <CAADnVQ+Si9Au8J_j2nt+ZzFq6WPaz8hpmh0n=_dFysZmSOeipA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-16 at 17:30 -0700, Alexei Starovoitov wrote:
> On Wed, Sep 16, 2026 at 5:08=E2=80=AFPM Vineet Gupta <vineet.gupta@linux.=
dev> wrote:
> >=20
> > It ended up with full testsuite run parity - after 4 incremental patche=
s.
> > But the pattern of all those patches was adding some predicate /
> > special-casing to reg->add_const
> >=20
> > hunk 1
> >=20
> > -       if (src_reg->add_const)
> > +       if (src_reg->add_const && src_reg->delta)
>=20
> why? It should not.
> My point is that zero is not special.
> It should be handled within the current framework.
> All these extra hunks are not correct.
> ADD_CONST_32 logic should work for delta =3D=3D 0 just like
> it works for delta =3D=3D 1.

After thinking about it some more, I agree that having an orthogonal
encoding would be nice. However, it appears that the split should be
somewhat different:

  struct bpf_reg_state {
    ...
    s32 delta;
    u32 id;
    enum id_link_kind { full, zext, sext } link_kind;
    ...
  }

Where:
- id =3D=3D 0 =3D> no id link
- full =3D> all 64-bits of the register are identical to
          all 64-bits of a scalar value `id' (let's call it X).
          =E2=88=80 rA{.id =3D=3D X, .link =3D=3D full}, rB{X,full} =3D> rA=
 =3D=3D rB
- zext =3D> lower 32-bits of the register are identical to
          lower 32-bits of a scalar value X,
          upper 32-bits of the register are null.
          =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,zext} =3D> rA % =
32 =3D=3D rB % 32
- sext =3D> lower 32-bits of the register are identical to
          lower 32-bits of a scalar value X,
          upper 32-bits of the register are either 0 or 1,
          depending on the bit 31 value.
          =E2=88=80 rA{.id =3D=3D X, .link =3D=3D ?}, rB{X,sext} =3D> sext(=
rA % 32) =3D=3D sext(rB % 32)

The reason for such subdivision is that:

  (X + delta) % 32 =3D=3D X % 32 + delta % 32 =3D=3D X % 32 + delta iff del=
ta < 2^32

Meaning that a non-zero delta can still be used to infer the state of
the lower 32-bits, e.g.:
- if  r1 =3D (X + delta) % 32
- and r2 =3D X
- and there is a comparison `if r1 < 42 goto ...`

This comparison adds constraints on lower bits of r1,
and it is correct to transfer these constraints to lower bits of r2
by subtracting delta from r1 and using lower bits of the result.
