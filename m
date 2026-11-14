Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794665007;
	b=IjVDnsLrGaspbVPkmDl86Hl2uj8UGvqwNbiH2LWXb8QUQ8wCaCh/gteo2aYXnf9JznrF
	 FMB3qPLGnqH80acpCEngMFwKfR1OtlSXimR5vWHIE6NG/LtXfF5CY3pANcNyAXPyLVVtx
	 jPpczr+ZlphH8g1YTVjymaEK/m8nP5wigI4FTmYpyT7jJ3eJia6FeXO04VXgAATtjiy7R
	 MRntL4CAzSOi0pVKgeLmKtzZ1BCOZEHLN1p/wAqek1qcZMKbPK6sZ1awKVSmIZQBnK9Oe
	 BjVfkUupXr4NUyoF9Gw88wekHvdjgRLU+UjLh/gBgZpZkqNwtPnyFAfDrqDKrzdrDXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OSOm1VnaNdiNsetCoXxjItFeFoAmwJ/tc+GsokdfVbA=;
	b=IQ86FhGYCsjXNK7hy3YSeOYG5tSV0groL5TtP+Sj5iys1wj9hGzWTvWLIFnMTf/5O16T
	 RSAndAwAVUGNOhec7zDY/+4TX8ezQ88u1Hlxi67GvkmzdQcKCLqEuPnVBF/FF2UIypuZS
	 TLYzce5FeqhGZEhnTrBEbRHzAPfhMXIonuW8nrH+xcPy6f87gaaf4Xz4h00cn7uFN+EK5
	 JpR6GObYc1atkd0A530e+Ef8mg8M3lz4KE0jxNq0L+swo1xgTgss5NnFUKB/hHKcJK72M
	 cM+ANW3vpHPcqO57/KgB4qIEVszL/OJKP1WYnrQluyhnMuDbJrsXbwJW4bD3DV9rlTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJMc1EBs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250AE606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 250AE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJMc1EBs
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4092095c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:03:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794665005; cv=none;
        d=google.com; s=arc-20260327;
        b=Q7bV6qrmRqdvMfTmYgKlsamqtl8ULJOwPmcmGU0S4o42fO1sA4m0vETdQ+0plzDnSR
         8KIP9/tV/BgyoEftwUPpGPWR6eTaz2CgCSFJ61jOx3o79E/i4+7Lm3QP2Y9aUAGDKFLq
         Z2c46Z1189o3ql3RaOAsSesfIF++P8vSG/p8RJn+gSRNwQXz+djcSFAOS9RlKkiaMYbj
         WWYIVP4MPrVqgtiGvZ1IVd8TYr0Nhcn5EalgYk7ky0bu6XjV1MgHs4iYoHVRXd3vHbmq
         X+NcQw/tNNo3RhyX0DqCpbliVTdsaaoKVIoDiqNdRG9ZexRcqURUjIwnFgolsBtRlquJ
         3Mpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OSOm1VnaNdiNsetCoXxjItFeFoAmwJ/tc+GsokdfVbA=;
        fh=lfZywHrYzf3yN/t6ya3fWcFpEfT+C7y6fau63o45Cwg=;
        b=GGVv2XjW4iROEwlNB55cJmWHRRp1CJASYJ1gnUMhZ46VohV9nl5z3pgjsj3s+UVUz0
         L9hpjMGystc8jvyYbJEjXrzBOhTBdHRyVDx4xmz5yuZH+YiK6ZrOwD9RkTaSvoQaDIt3
         epkktFz3VMuphFJFnHREM7/agPrpNh6c7ZMtHdHy5NFKgU0X52iA/F8pDgDKVh4Y3FBo
         MJzb5TMG/dTgwo3rtgJHG7vzFqB9VD76WWx/BzWP80IjmVmMHCzMnE2+WeNiTMgPkgna
         D2KYqjX3Yg1sRyDseskOa+zfAaStsVkuLLuCO1smBLY+NHz0YPOF6FVprP0wQWzEXg4v
         0E4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665005; x=1795269805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSOm1VnaNdiNsetCoXxjItFeFoAmwJ/tc+GsokdfVbA=;
        b=WJMc1EBsFUP1PDerk2ZEdXZ2gqlC93hrWcWh2jIxSb6nMPLkCcgrpBdRYfMkS9Ojgl
         Im6cJwele/ak2ABAEbU2hKn/juSxmoKaZKl2HnhmF7Hdz3Yh64kQy/tL2ktCvg7aaroQ
         6SrwtCECpMoQxCDoqF7ZASytjzIiMCg72Y+JQl69jThDpEJ81q4xY4aPQ6Kihyu6KfWJ
         FlqveiaUEKRUSm8rsR8ioL06zR7JEvYRXaTC7npbNzX0gzMC+e17ABAUTNEmGZ5xdQN/
         RBtxxglH8f0skIgsx1JySuG5jsnzEN4jQ7HMCH2n9QwN0/6lw225JO1nh8vf1UtbAdFF
         SJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665005; x=1795269805;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSOm1VnaNdiNsetCoXxjItFeFoAmwJ/tc+GsokdfVbA=;
        b=z4RqqcI/GQr5tRuCVPecmOfRyqP6cG764zzfMjxD6LjUaGtbdLWPbkL2TezbQqSaMR
         14Z+HEkQSX1vEZ2h+P03foIhJaXon6Vi998+tD2dqt66AXMP8htQrgC/4Q5pKssgb8BH
         TtMt41+x+svm3qhat3tDIBO4eWL0QWHpw5rPTB+HhuQwL6Q7VUTpvBYBTFmFv3xa3PY7
         qIY9s3RJnBSlPA3RqOVkJEYzoPtQEyzMUmPk6/7j5PJf7/XW7+JcC9VdJpDVO0tFdL4L
         dAsJxHPqvCf1oifCjKjNbtB+EPDvFTnd1nZd6j2T2/SFpJ1OKeG3Vq+bDoymDMmKejka
         ZrDw==
X-Forwarded-Encrypted: i=1; AL+hErHbBPrGlXSGnVO7eA9DvElbbJnFusc7SbqM1jg+mmfn1bk74CAjBgjQ+GNq7RsrSt+8lpXGtTol5yKxYN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mx7tx/+xiFQu5Tb30/OIB8lQCczyloo8AOPc2XHKsupe7jY05
	iD3LzaberzJi96O4YRSJrlfr95mVeZBserM9zF57bckj8TN9SVRpnGrAEkQd/y4MQf2Dc8rcYrA
	OrxLf99+f80ikVNPCAoCopMiYF+8U7sg=
X-Gm-Gg: AYBFou1Umdpb70gW8Gnn107dNISMOKUv70MziNUI7WMGV5XKeDmlUlqCKvXgzvc9JAQ
	xX5+k2IzWvQ7HlLs4lxVNIct0sRTdDxBaXEYryyLXS39Oolnq2z0T/aUQlXfSp+BqB7uhy7nAAZ
	d9Qrclfki9OiiPorNCHSCvaSWzt9yEaP8uZG/AQivRPlnhlZAkPNKmla0PGsRwQpHHDEroeZ0Jm
	WZbXJTVH7/piJ7hgcEIqZ4OktY5vF4LoiSwEYbvv8jpS8gtfxVXFW/AnrnM+oLA8TRvLMyOJBO9
	L2JWqoWkCTFw7EZk7+FBHhUvq52Zea7So3OYvHElznW4pvENRRL+T6geYEOtzfol42XN8yY0cog
	nKCj6FzjZv+8UlVBkONxTFmTugD7M4EeZHEieWLWLpdRJKtO94P2HEuSknOHoDYp5BM0MAn0=
X-Received: by 2002:a05:701b:4208:10b0:1a7:979f:ecc0 with SMTP id
 a92af1059eb24-1b50311d009mr5819252c88.27.1794665004802; Sat, 14 Nov 2026
 06:03:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114115749.1061233-1-16567adigashreesh@gmail.com>
In-Reply-To: <20261114115749.1061233-1-16567adigashreesh@gmail.com>
From: Demian Shulhan <demyansh@gmail.com>
Date: Sat, 14 Nov 2026 16:03:14 +0200
X-Gm-Features: AclHuK9gEd2vLkYSuKbXY90F1i3WqtHAO8j3tGJYv9uq-Ye2rOWXIUnL9CGQyC4
Message-ID: <CAOLeWCudnTKsmK8cM8x=O8U_7FAd_M27bFLtR_hG1MCmoAadLw@mail.gmail.com>
Subject: Re: [PATCH] lib/crc: arm64: Add NEON PMULL+EOR3 crc64_nvme implementation
To: Shreesh Adiga <16567adigashreesh@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shreesh,

> @@ -19,7 +20,10 @@ static inline u64 crc64_nvme_arch(u64 crc, const u8 *p=
, size_t len)
>   size_t chunk =3D len & ~15;
>
>   scoped_ksimd()
> - crc =3D crc64_nvme_neon(crc, p, chunk);
> + if (cpu_have_named_feature(SHA3))
> + crc =3D crc64_nvme_neon_pmull_eor3(crc, p, chunk);
> + else
> + crc =3D crc64_nvme_neon(crc, p, chunk);

Please add braces around the multi-line if/else inside scoped_ksimd().

A few performance suggestions:

On arm64, cpu_have_named_feature() calls out-of-line cpu_have_feature()
and loads elf_hwcap. Doing that a second time inside scoped_ksimd() adds
overhead. Using static keys, like in arm64/crc-t10dif.h, avoids the
extra calls on the hot path.

> + v0 =3D fold_single_round(v0, v1, fold_consts);
> + v0 =3D fold_single_round(v0, v2, fold_consts);
> + v0 =3D fold_single_round(v0, v3, fold_consts);

Here all three folds are serialized on v0, so each pmull/pmull2 pair has
to wait for the previous eor3 to complete.

Could you try folding (v0, v2) and (v1, v3) in parallel using 2x constants
(x^319 mod G, x^255 mod G) and then folding v0 with v1?

/* x^319 mod G, x^255 mod G */
static const u64 fold_consts_2x_val[2] =3D { 0xb0bc2e589204f500ULL,
  0xe1e0bb9d45d7a44cULL };
...
v0 =3D fold_single_round(v0, v2, fold_consts_2x);
v1 =3D fold_single_round(v1, v3, fold_consts_2x);
v0 =3D fold_single_round(v0, v1, fold_consts);

This breaks the dependency chain between the first two folds and should
help shorter inputs it would be interesting to see how it behaves.

Thanks,
Demian

=D1=81=D0=B1, 14 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:5=
7 Shreesh Adiga <16567adigashreesh@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add a 4x-folding implementation for CPUs with FEAT_SHA3 which benefits
> newer ARMv9 CPUs like Cortex-X925.
> Usage of EOR3 from SHA3 extension improves performance by 20% compared
> to the regular PMULL without EOR3 on Cortex-X925 measure in userspace
> application via libbenchmark for 512 byte input size.
> Measured about 3x speedup for 512 byte input compared with the existing
> NEON single fold implementation on Cortex-X925 in userspace.
>
> Signed-off-by: Shreesh Adiga <16567adigashreesh@gmail.com>
> ---
>  lib/crc/arm64/crc64.h |  6 +++-
>  lib/crc/crc64-neon.c  | 79 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+), 1 deletion(-)
>
> diff --git a/lib/crc/arm64/crc64.h b/lib/crc/arm64/crc64.h
> index c7a69e1f3d8f..003fd452aca3 100644
> --- a/lib/crc/arm64/crc64.h
> +++ b/lib/crc/arm64/crc64.h
> @@ -9,6 +9,7 @@
>  #include <linux/sizes.h>
>
>  u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
> +u64 crc64_nvme_neon_pmull_eor3(u64 crc, const u8 *p, size_t len);
>
>  #define crc64_be_arch crc64_be_generic
>
> @@ -19,7 +20,10 @@ static inline u64 crc64_nvme_arch(u64 crc, const u8 *p=
, size_t len)
>                 size_t chunk =3D len & ~15;
>
>                 scoped_ksimd()
> -                       crc =3D crc64_nvme_neon(crc, p, chunk);
> +                       if (cpu_have_named_feature(SHA3))
> +                               crc =3D crc64_nvme_neon_pmull_eor3(crc, p=
, chunk);
> +                       else
> +                               crc =3D crc64_nvme_neon(crc, p, chunk);
>
>                 p +=3D chunk;
>                 len &=3D 15;
> diff --git a/lib/crc/crc64-neon.c b/lib/crc/crc64-neon.c
> index 4753fb94a4be..6c589b23ed06 100644
> --- a/lib/crc/crc64-neon.c
> +++ b/lib/crc/crc64-neon.c
> @@ -10,6 +10,14 @@
>
>  u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
>
> +#ifdef CONFIG_ARM64
> +u64 crc64_nvme_neon_pmull_eor3(u64 crc, const u8 *p, size_t len);
> +
> +/* x^575 mod G, x^511 mod G */
> +static const u64 fold_consts_4x_val[2] =3D { 0x0c32cdb31e18a84aULL,
> +                                          0x62242240ace5045aULL };
> +#endif
> +
>  /* x^191 mod G, x^127 mod G */
>  static const u64 fold_consts_val[2] =3D { 0xeadc41fd2ba3d420ULL,
>                                         0x21e9761e252621acULL };
> @@ -45,3 +53,74 @@ u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
>
>         return vgetq_lane_u64(v0, 1);
>  }
> +
> +#ifdef CONFIG_ARM64
> +#define SHA3_TARGET __attribute__((target("arch=3Darmv8.2-a+crypto+sha3"=
)))
> +
> +SHA3_TARGET
> +static inline uint64x2_t fold_single_round(uint64x2_t fold,
> +                                          uint64x2_t temp,
> +                                          uint64x2_t consts)
> +{
> +       uint64x2_t temp1 =3D pmull64(consts, fold);
> +       uint64x2_t temp2 =3D pmull64_high(consts, fold);
> +
> +       return veor3q_u64(temp, temp1, temp2);
> +}
> +
> +SHA3_TARGET
> +u64 crc64_nvme_neon_pmull_eor3(u64 crc, const u8 *p, size_t len)
> +{
> +       /* Assumes len >=3D 64. */
> +       uint64x2_t fold_consts =3D vld1q_u64(fold_consts_val);
> +       uint64x2_t fold_consts_4x =3D vld1q_u64(fold_consts_4x_val);
> +       uint64x2_t v0 =3D { crc, 0 };
> +       uint64x2_t zero =3D { };
> +       uint64x2_t v1, v2, v3;
> +
> +       v0 ^=3D vreinterpretq_u64_u8(vld1q_u8(p));
> +       v1  =3D vreinterpretq_u64_u8(vld1q_u8(p + 16));
> +       v2  =3D vreinterpretq_u64_u8(vld1q_u8(p + 32));
> +       v3  =3D vreinterpretq_u64_u8(vld1q_u8(p + 48));
> +
> +       p +=3D 64;
> +       len -=3D 64;
> +       while (len >=3D 64) {
> +               uint64x2_t t0 =3D vreinterpretq_u64_u8(vld1q_u8(p +  0));
> +               uint64x2_t t1 =3D vreinterpretq_u64_u8(vld1q_u8(p + 16));
> +               uint64x2_t t2 =3D vreinterpretq_u64_u8(vld1q_u8(p + 32));
> +               uint64x2_t t3 =3D vreinterpretq_u64_u8(vld1q_u8(p + 48));
> +
> +               v0 =3D fold_single_round(v0, t0, fold_consts_4x);
> +               v1 =3D fold_single_round(v1, t1, fold_consts_4x);
> +               v2 =3D fold_single_round(v2, t2, fold_consts_4x);
> +               v3 =3D fold_single_round(v3, t3, fold_consts_4x);
> +               p +=3D 64;
> +               len -=3D 64;
> +       }
> +
> +       v0 =3D fold_single_round(v0, v1, fold_consts);
> +       v0 =3D fold_single_round(v0, v2, fold_consts);
> +       v0 =3D fold_single_round(v0, v3, fold_consts);
> +
> +       while (len >=3D 16) {
> +               uint64x2_t t0 =3D vreinterpretq_u64_u8(vld1q_u8(p));
> +
> +               v0 =3D fold_single_round(v0, t0, fold_consts);
> +               p +=3D 16;
> +               len -=3D 16;
> +       }
> +
> +       /* Multiply the 128-bit value by x^64 and reduce it back to 128 b=
its. */
> +       v0 =3D vextq_u64(v0, zero, 1) ^ pmull64_hi_lo(fold_consts, v0);
> +
> +       /* Final Barrett reduction */
> +       uint64x2_t bconsts =3D vld1q_u64(bconsts_val);
> +       uint64x2_t final =3D pmull64(bconsts, v0);
> +
> +       v0 =3D veor3q_u64(v0, vextq_u64(zero, final, 1),
> +                       pmull64_hi_lo(bconsts, final));
> +
> +       return vgetq_lane_u64(v0, 1);
> +}
> +#endif
> --
> 2.56.1
>
