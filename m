Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899224;
	b=jkpaPJ52ecPAuT8ImD1x9OXeBG2S+WXtu5N14ExuoOj8qD6jjqe+K+eUGO1ithSsI9YW
	 nHEgKP9OtACW6crNN0A1OIUYmTJlKMr1ktFLT3oDfSJwO6Zs5bKtoaXS1L+sMgCcEB8EZ
	 9cx5Se9B30dOGncspS3MKeFXJr5bRlT+3gam90sVXHetW2IFefuXXir/tAoqe04VLh/Mq
	 ntnXGwNTpWQ8U2FP44SAwHinejY7XAF/+IR1C9JHa3EP0zjldpH2ry5oeQSgFvpuy5H3n
	 JL0ZM3sHpI45iiR0Z4SKXNeGDhGgLHHd3YkFsajvXgpIvFUVeMn0UL5d54Shzy17Lgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nn4DZhfswO5NC6K4Ff5vMiO0SvmHz8HXjX82jlIR9nM=;
	b=aFvoJa8nz2jx14Z5uAshS8KaIgyXjHBNapIOK3e6YkQgxLN36SghEDqXCj5Qki2GT8pg
	 an/A3AqzlhsdA2GOIgjJA550xHQmb2PTpQxwc5tC1N0xCxlEvQVtEwgpkd+hcTSspaL7g
	 nR5fbnDKUy0vo2ovv1NbKbi2GwRuBIIoXSayjSZDGXy53oxONW7P4Ja0adyFdI0vztnn7
	 /CmwPuM6T3bhuAq9mK15XnqhJGLEYnuRiAmuCdnFXudO/z/Zlhg4w7+IMuwRjN44S6THo
	 qOaSURIt+wGqrsi20nnPIcuKIwjRTe0CubcODwVLVmJkk/DgoAb95bBnQA4SG6yZnVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AoYSW9GE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5AE606A8B6
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE5AE606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AoYSW9GE
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c45551fa84eso806646366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:07:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794899222; cv=none;
        d=google.com; s=arc-20260327;
        b=mHwFHQgymekCFnywYO/NICzsrQ2fKfrgM4ZiWoPj6pwadEzhYkrxQ8oMwDVJZFNYAi
         A5kn34iihMmQJlWOrE9aD9rvEI7RCH2aCyONhUKsZ27PS6gOO4RJ1XcjpOirdmD/a6X3
         JIJrchJmaR5CEppbUEXXXAths3/4peoNYlbBfbEpxIY++wTBxsv/+4+43Pm3jJ+AdCbI
         RhTzVPpnEMjl3aJYR9qbASANiLN2LcdHfoEecfpdQQab5dCLuo44ySeO0UHGwi0tWdJG
         aIX0jMQuyQawpnjxxtNg69S0MeWe3m370oA3dE5UT1Zz9o0/m1xDzOtc1uHDZ3k1Gw9Y
         XUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nn4DZhfswO5NC6K4Ff5vMiO0SvmHz8HXjX82jlIR9nM=;
        fh=iuhTX5KvarXRa/4myXXWP6jkioYDDx2fEvxY0CJdfx4=;
        b=cd4DcYlIoR2spBOuQH89kO8TCcktZ/p4ER14QXvOrrknSxh505vV96v7yKlQpsgHqX
         lPQnvfsE3YCsIsKo+OlTDmjGgfmwjxz3rpUCQUm3rgdz/t/CJGaIdBYyzwCpgJqRCa/7
         9oqg27kt9eVg0Romfah4vf+BVPQGUW/UKPryu2/+jtHtyNQYJClOVaa5NZePMLTu6H0a
         Q8Q8sEFb1Sr2uS7GNtD1fOhD65kScN8a21w/sfnzKFwQrfR4RkEiknBgFWQw8UqRQVQb
         FTtKOASStWm2YxR8u4hM/o5KLdysaUCElj+dPK0Zp8X7H2Byr0Tm8ugcSQ+raBm1dLcP
         wq5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794899222; x=1795504022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nn4DZhfswO5NC6K4Ff5vMiO0SvmHz8HXjX82jlIR9nM=;
        b=AoYSW9GEm9RTHU1qX4O/c3I9Qu34+HcBvIOMsM67Olqf88Gh/SjDWCcJgvwduDE5Wt
         DYth9HLyAm1wpqTAV0V8CS4+gDVXzfOdpOeLGsA81HswxPC2B9eQ7a6ghdLXZeyo0GCZ
         iZIZ5EewZbJcnjoOkt+FtvNNMasgoFc2cQXpKiso2E3IbIlV8y9YtBZebRRiOh0lghCJ
         wzywbRBnPFpqgFnwAfW0yNtMpbWpHOalLBlDksDh43M3OGN8NjD6kFYeD5i1UGKYauAX
         EAmEtlUSGOTdu2tNdJZLnfBBtMjz9DIVb9x1lhU95ey51Rqa2FAnMl4o9Uw5bJ6tbBrB
         U2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899222; x=1795504022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nn4DZhfswO5NC6K4Ff5vMiO0SvmHz8HXjX82jlIR9nM=;
        b=WLlKPDz19Obyn3AJiOgIDnC+d1eIdG4J+4eZVrS6+Qlc5MsOm0hZGs9+HXFREwgcN9
         hyLkRvMYr3VJTQjqMBVMyoWY4De4OrA/4QECiIJbUdsLymlAM3vcikQm6dQbRYdb30bM
         /dhISZEb5tu5Y3kCBKqcEXmGsigJVeVsGKXE4eAwsygBWq4psTzxdH1TbUR7C5sy5tFd
         VaOix64U+O9KNRKKgwAx+fsIT8pIDPg459KgA0FXwhsUYza+Yup37qmxJRkokwmXM61A
         ur3H3pXXrF0rLfaXgE2nMKhPoFnZ4yaKfunT0VO29RsyfdBgDlo5075ByH/2Rn0k9sPx
         tk4A==
X-Forwarded-Encrypted: i=1; AL+hErFYYXfjCRR4mpbQJkEAxW1r3Ic4f3UqiZMLYNc8zDZz8u0j8cWlvrMxgbTPw2TX44k/eVdMC51jU0Q8y5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aTNXLcRyCisp/3x1PMeQhKxxr9bbiTWfZbAeNa6C8OO5POLew
	6Sk93ILOPQsBh4W95RFSzgiuhqVDQ6CjCri7fmcQLJ1MsqqqrkiE4AxtP9tzPGvTQapQWtqw96g
	zM1FVg2ivUaLwyHllhRLenCDnn/vfA0o=
X-Gm-Gg: AYBFou36gGkUfTC8LXNbdj7+jSFlULRvalZG5JhFW024dAetBo6fsKJ/uNgcUd3+QsE
	I56f8/SDE1zETWP3/062TFFoMdkjJoYq67hrJBgyLvA3j0z80R4vMv8Hecw1whg4KGDcrMr/9Ex
	ZtLxLdNIXIvO2Yw5gCL6W33dEtAPj9//s2ZDMFBh5omBsg8+Mrb+zjqqJ9mvQRBY0GR+zMXtQ2b
	kTPKdjRG7gfpIeWQ2z3DR+MI/gzvfALdlG7SJbxblm1eF+9NPqjVM8/tiVNCQMlWmBa/b2Ff1Pd
	R8EosjDiWztzrZ7tXnH0T8OWerNrIs1dWqJ2PE036aQqFNOs/8ZQi5MbxX6BL+J56jF3tJh9ui/
	oA8ijT36KFj2wrE7VFUiVNB+DsoY7ZQ4RU70=
X-Received: by 2002:a17:907:d01:b0:c2d:be57:f73a with SMTP id
 a640c23a62f3a-c50963963a2mr997790666b.13.1794899222311; Mon, 16 Nov 2026
 23:07:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114172955.1598929-1-16567adigashreesh@gmail.com> <CAOLeWCtEMZrg74nrfCVfjo9ZqGAxXyNb3mZD+n8AqgxT5PvC7A@mail.gmail.com>
In-Reply-To: <CAOLeWCtEMZrg74nrfCVfjo9ZqGAxXyNb3mZD+n8AqgxT5PvC7A@mail.gmail.com>
From: Shreesh Adiga <16567adigashreesh@gmail.com>
Date: Tue, 17 Nov 2026 12:36:51 +0530
X-Gm-Features: AclHuK89PYXtgxI2vxc3gGqZaCu78_x5VJgVWZfhvDFli4-iD1hB0YiHCnhJvd0
Message-ID: <CA+-x59aHR7pW6f1UMy2_Cd_JBVNwPA7Z2KYm3xmmC4JTF1DOPQ@mail.gmail.com>
Subject: Re: [PATCH v2] lib/crc: arm64: Add NEON PMULL+EOR3 crc64_nvme implementation
To: Demian Shulhan <demyansh@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Demian,

On Tue, Nov 17, 2026 at 6:15=E2=80=AFAM Demian Shulhan <demyansh@gmail.com>=
 wrote:

> Scalar vmull_p64() makes compilers materialize the constants via mov/movk=
 + fmov
> (42/97 insns on Clang). SHA3_TARGET also makes codegen fragile: with
> -march=3Darmv8.5-a+crypto, GCC stops inlining pmull64*(). On Neoverse-V2,=
 EOR3
> contends with PMULL on pipe V0, whereas regular EOR runs on all SIMD pipe=
s.
> Using inline-asm pmull/pmull2 and a clean 4x unroll in crc64_nvme_neon() =
without
> EOR3 should give better performance across all sizes and cleaner code.
>
> /* clang -O2 */
>       24: mov   x10, #0x45a
>       28: movk  x10, #0xace5, lsl #16
>       2c: movk  x10, #0x2240, lsl #32
>       30: movk  x10, #0x6224, lsl #48
>       34: dup   v4.2d, x10
>       38: mov   x10, #0xa84a
>       3c: movk  x10, #0x1e18, lsl #16
>       40: movk  x10, #0xcdb3, lsl #32
>       44: movk  x10, #0xc32, lsl #48
>       48: fmov  d5, x10

Can I assume we want to have the 16-byte constants loaded using LD1
and use inline assembly for PMULL/PMULL2 and have the codegen not
perform the mov+movk+fmov instantiation?
Will look into extending the existing PMULL routine with 4x unrolling
and adding the partial block handling as well similar to x86 version.
I'll assume that 128 byte threshold for invoking this SIMD routine
still holds though, even though this is probably core specific.

For EOR3 though I assume it is still useful for many cores like
Cortex-X925, Cortex-A720, Cortex-X4 that I checked has measurable
speedup at 512B/4KB.
Maybe we can have a CPU core check for special cases like Neoverse-N2
which at the crc64_mod_init_arch we can check and avoid enabling the
static_branch?
Kindly let me know if it is not worth having EOR3 for all cores. For
now I will try to submit the existing PMULL routine enhancement as per
your suggestion.

Thanks,
Shreesh
