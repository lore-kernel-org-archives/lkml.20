Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794898225;
	b=fru6qssPELv7A8CmZ8GbmsGFYltYhzVhUpxF/qeRFgHLieuk6ClJkPwJqNQgjxbsVZLk
	 7otYN5yfSVf6etxbG1yKgdno4fxOwF46ZYcLGP4VXGTQXP2LeCzSsv4aRmcGPss9X/l17
	 U9dRgFrMxHHKpoIry1WZj1VnzLB5KsDuobu4w8Rck2lEY8A7l0Ca3uIiRFoJc11u8bhgh
	 ZSqffukDeJT2F4VwU453+nxbGlQab/Qwx2Tl7tvrYhqznNQyJoXuV9ckHW6vEEnr+ogXS
	 oWRYyU5ysCfUQ4HKYMGmrrLtImIkb2Wn7Z5k15KjqAezuPhNOhipxMIIhIFZ/buZaIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w2ujTW8JKgVpi8GBaPpe+a6Vi5r6q/k7HuBea5FdHPY=;
	b=GcyB6UCOztZAQX+4RN2Fl7pcmpLHXp3nAPhoSQEYkPGkFo1Mr7hV+S7kmrfHQkh4W/GH
	 RLWqDXokrRVkFGXEoHYZQ1Xamk090fqH9+0Pzxe/rWiuUfL2ghMK1y3ko9mr6zA4FuUCR
	 RNkMRpozZazlwke8pzA4b64GjUhUWAlKdbJNuJVShTho2Z/e5FEe8tsuJvnbQzvLlMc2q
	 zbc2kCRdVZPwLXfteKnJ5cPUII1YliTH60C8xoZKZ3F/2PHYhsc8hRorMOWzM8eaOMRmX
	 wL3acLJW6DOiTniKTaaC8DQ0lPa+kRTESEnICeE2H1Xk2XymdxR/hYzt4iyj8vV8Y8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1oVbfCH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A98C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A98C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1oVbfCH
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50715c2757so551329866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:50:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794898223; cv=none;
        d=google.com; s=arc-20260327;
        b=Z9h6kUH8BHzfaH6E35NJ0PAO34A+iG7bTM4qrXsJW9yXp1umMVFQK7oU2oQ9q1JM/L
         1aeeWMbhlCsb94NpuGm5uo7n0s1ic077PqJ16Ebs2YZaxOYrjmfF3W6RKGi0FFqBOKYK
         WiRvRVcxpmKT68tZkcJyhNXPbv9isCRg5Ocqak9Ln2pApcMzSFNW02aoiMZahVPhRgwN
         GtB1E/PxnstWSoZXAlP5bLA0iCYfTd78kep7q1ikAFTY3wfls+HYcE7qzvcXilHjAW2N
         w2u7lmH9GYYF0ZGiijhi3LLvm0FK3h4aQh249AWIr+m96ojgeBmKSclohTuhmH9wEp+Q
         Ndlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w2ujTW8JKgVpi8GBaPpe+a6Vi5r6q/k7HuBea5FdHPY=;
        fh=TUtOqVh6Wu5rR6R024gbnRlIWhiQyk+sv8wMnfd4WuA=;
        b=Qe20OWjHK7V153oRhyZG4pEGUr0uUDXRPZZGCA6+DJ4yQH8zAVtu/G2+rUNoQoCmfK
         k1u0Rldp40R59dKkJtiAS/xdgN7g0gvjJjWhVaT71eCqCTIQnvzeY6eUgnUDZgu1y9my
         aR6vYEhRlvvOYzxCnS88zWqECXS3rYC0BnzQwiFzloeD6sBw/F5SBVWchPYm01lGwJvy
         VtIWBpqrcoiQb8AjH7A4LimeJQvjxUZAIBAVayPXgHadRMjn3x/kyDyCbL2tBe7Vl3bF
         Z7aERum0k+bBdKZD/e8PEr58f+UqH3LqtGXijhnhkY2nIt7cXMq/VYG89Utpk3c9X7BK
         pCxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794898223; x=1795503023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w2ujTW8JKgVpi8GBaPpe+a6Vi5r6q/k7HuBea5FdHPY=;
        b=P1oVbfCHWu7ZeOe6V6J+56WX4ByaVZbKr5AJjLMGW4YJg/tWNlf2I4SmHO+VyEkLQU
         F2z0P53N4ceMfOZyOBTUrtyPBNQcUD9cVj6vJyw7db3ULaD7Nanm6zEebtphadw6l7gt
         d79E9M+/KD6mo05ppncQAx1jqTcZmEvoZpSSxLEymXXdqv4eJn19pFv6BEDoO0sdE2YW
         yYsdgzP1jMc/Ljm+zOqFX4iNo6iDbRvrR2n211VGZ98/c5Gtd8PQDjDe3yrepLq9ME+G
         23la/HEWK5lovYS7EQtS8VxG7AXNELWGr6htTpKLUoWiSWBWjABsJPNrvNLPQ/uiwZ97
         KBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898223; x=1795503023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w2ujTW8JKgVpi8GBaPpe+a6Vi5r6q/k7HuBea5FdHPY=;
        b=oN2Jr9r/cfDHyasWlaek1UgC2PtIVQkjM9y+8jAj97aNhif4Bt2Zxj4OmPmsfD80NG
         i8GiQ+/W4MPZjlmA/u430EdLeERiMpMb68kOCQW9V1f8AeosZv6W4AVBWz3Z+kDsWm0r
         J2GkIrKSgmBJ95IH91WoOsOsVVAQ+AtS39QVZ4yGORrGejn8l6Gby08RrkdKmt9LBOe1
         h0rODRnkGXMh6x0Oq36GYjJaULVhpeFO4YqUY1ojx0Wp2YmOTX6M5XmQUxciumagyp8O
         pBzzKLiQgbjTRrVLyjh1nZiQQhDujZyIJqga1j56yJpJb8DIBlE0HahN1dfZ1eIO7uww
         hQcg==
X-Forwarded-Encrypted: i=1; AL+hErGNKsWJQEkc+dfE8FHCoBXotOrERM3W1bi3qjl2E/9zmy/a3OZclRH4VjvOFZFmW4IOvg8+Cfl/M1elLCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UHiA54tFsRZNlilXoQNa/FjkHpC5XjUB5hidQHEvFLi0FnZWe
	VnQJZUSzCD+vXuhZmfEF1hgtvsWDn/r8r4lz06TI/YecFYQJk9MiGaAveUmYrWbolU10OJ6eOZr
	2vHR1HNXCoskYmX3mjKh+MqxM18p9STM=
X-Gm-Gg: AYBFou0XQzh8i6ht76AO888Rv7aXyZEi0eNq+Tdp3mQJobToe3RlxpAeARyMMkDGtS0
	UYt8YQM/mpf2mbKyMl1y1scK84NHX6oOHX1C8U31nLBSfT2Wt1rk/T4tX1eXvLDB55KFzb1mjZE
	eLBzhwQjl3wyx2VVflBfk6avYpH66mt1nqpj/G01teta5RkMeQtsefzqcj8anhuKQiO0BXhg9po
	x+CMN3T/UzWVXSLPlmz8c3/5CB4MDtOzPT+ubSj1+EaZ9mxZT0fwBeOAs2w6tCc9MLQaN/aru3a
	YxOVEz1aBwc88ZZqWK+WtFTEr7C6M/6WkNTqtxow8eumRWvlNM5TCDeDarusuAwc702/5eg+bvA
	MWpombGE7QNJ0aAIsan5WR8QYAee3m+N4shQ=
X-Received: by 2002:a17:907:868f:b0:c50:475d:980e with SMTP id
 a640c23a62f3a-c50963ced7cmr1066601266b.38.1794898222816; Mon, 16 Nov 2026
 22:50:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114172955.1598929-1-16567adigashreesh@gmail.com> <20261117000119.GH229817@google.com>
In-Reply-To: <20261117000119.GH229817@google.com>
From: Shreesh Adiga <16567adigashreesh@gmail.com>
Date: Tue, 17 Nov 2026 12:20:08 +0530
X-Gm-Features: AclHuK-4WgArdEcKAhaJtwM4CxSAsBuUG1yPsujVDm8kX8ujvzUg2VCGIExhdGw
Message-ID: <CA+-x59b-gUddP2cfHbzDrv9jupmeM1LeHkQnNXhE8_y6B+JC1A@mail.gmail.com>
Subject: Re: [PATCH v2] lib/crc: arm64: Add NEON PMULL+EOR3 crc64_nvme implementation
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Demian Shulhan <demyansh@gmail.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Tue, Nov 17, 2026 at 5:31=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
> Was crc_kunit run?  It already has a benchmark in it.
No, I have access to only one aarch64 device that is Android Mediatek
Dimensity 9400 SoC without root access.
Therefore I can't run crc_kunit on that, instead I have done userspace
comparisons for the same kernel with libbenchmark.
This is based on my earlier work for FFmpeg:
https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/21651
I also have Corporate MacOS M5 and did check inside Ubuntu VM but that
is not accurate due to virtualization.

> The commit message should also clarify that this benefits ARMv8.2 and
> later processors with the sha3 extension, not just ARMv9.  (E.g., Apple
> M1 is an example of an ARMv8.4 processor that benefits.)
Sure I will take care of it, but for now I am thinking of first
improving the existing PMULL to have 4x unrolling as per Demian's
suggestion.
Therefore I will revisit EOR3 addition later, will keep this in mind.

> > +#ifdef CONFIG_ARM64
> > +#define SHA3_TARGET __attribute__((target("arch=3Darmv8.2-a+crypto+sha=
3")))
>
> Doesn't this break the build with gcc 8.1?  The kernel supports gcc 8.1
> and later, but support for the sha3 target and intrinsics were added in
> gcc 9.1.  Either this code will need to check the gcc version, or inline
> assembly will need to be used for eor3 like lib/raid/xor/ does.
Yes it seems to be unsupported even on GCC 8.2 and works on GCC 8.5
onwards, I wasn't aware of older toolchain support.
Will keep this in mind. Unfortunately compiler explorer is missing
ARM64 GCC 8.1, will check 8.2 support which hopefully should be
accurate.
Will adopt the existing code in lib/raid/xor itself which should make
it compatible with GCC 8.1.

> > +     v0 =3D fold_single_round(v0, v2, fold_consts_2x);
> > +     v1 =3D fold_single_round(v1, v3, fold_consts_2x);
> > +     v0 =3D fold_single_round(v0, v1, fold_consts);
> > +
> > +     while (len >=3D 16) {
> > +             uint64x2_t t0 =3D vreinterpretq_u64_u8(vld1q_u8(p));
> > +
> > +             v0 =3D fold_single_round(v0, t0, fold_consts);
> > +             p +=3D 16;
> > +             len -=3D 16;
> > +     }
> > +
> > +     /* Multiply the 128-bit value by x^64 and reduce it back to 128 b=
its. */
> > +     v0 =3D vextq_u64(v0, zero, 1) ^ pmull64_hi_lo(fold_consts, v0);
> > +
> > +     /* Final Barrett reduction */
> > +     uint64x2_t bconsts =3D vld1q_u64(bconsts_val);
> > +     uint64x2_t final =3D pmull64(bconsts, v0);
> > +
> > +     v0 =3D veor3q_u64(v0, vextq_u64(zero, final, 1),
> > +                     pmull64_hi_lo(bconsts, final));
> > +
> > +     return vgetq_lane_u64(v0, 1);
>
> Note that this is missing several optimizations compared to the x86
> version (lib/crc/x86/crc-pclmul-template.S), including using
> fold_consts_2x for a tail of 'len & 32', efficiently handling lengths
> that aren't a multiple of 16 bytes, and reducing to the final CRC in two
> carryless multiplication instructions rather than three.
I was looking at the crc-pclmul-template.S code and I have a few queries.
In this aarch64 version we only dispatch to this SIMD routine only
when len>=3D128.
Since we have 128 bytes available, do we have to add the tail of `len
& 32` handling?
Handling len not a multiple of 16 bytes (partial block) I will add but
I am assuming that the dispatch will maintain 128 minimum len.

I was trying to understand your "reducing to the final CRC in two
carryless multiplications rather than three" statement.
From going through the code in crc-pclmul-template.S:
.Lreduce_128bits_to_crc tracing the logic below this label, I see
three clmul operations:
_pclmulqdq CONSTS_XMM, LO64_TERMS, %xmm0, HI64_TERMS, %xmm1

_cond_vex movdqa, OFFSETOF_BARRETT_REDUCTION_CONSTS(CONSTS_PTR), CONSTS_XMM
_pclmulqdq CONSTS_XMM, HI64_TERMS, %xmm0, HI64_TERMS, %xmm1

.if LSB_CRC && \n =3D=3D 64
_cond_vex punpcklqdq, %xmm1, %xmm2, %xmm2
_pclmulqdq CONSTS_XMM, LO64_TERMS, %xmm1, HI64_TERMS, %xmm1

I even checked the Intel Whitepaper and the reduction for 64-bit CRC
section "Final Reduction of 128-bits" also mentions 3 clmul.
One for using x^128 followed by xor, and then 2 more for final barrett
reduction with mu and poly.
Thus I am confused about accomplishing this with just 2 clmul. Could
you provide details on this?

Based on inputs I am thinking of only extending the PMULL version to
have unrolling with inline assembly for better codegen.
I will revisit EOR3 afterwards when the PMULL base version has
incorporated all the optimizations.
Mostly we can have always_inline function which can be instantiated
with/without EOR3 I think for approach.
Will submit new separate patch for just PMULL unrolling shortly in a
couple of days based on Demian's inputs.

Thanks,
Shreesh
