Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2FF3AA1AE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789079129; cv=pass; b=pmqhwIx665OP7l0/RrvfI0PPEp07ko3TvVfAk92PC8cMDH7JarQ10eEJ37QogO6Ly/BfG+T6+xNZ2PrJ4qS70e8k+OGM5SOBWOgHIxSELMczUgbUwMavMxfHl/rYNnfksXR/h/YE5cQfIzy+05N9LaBPQsBPXvxclYuibuDiY+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789079129; c=relaxed/simple;
	bh=6QhoUoDYIPQppsaz5JgyOtL5+kgOq2Rsx610+26m7JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pSJ9Uz9ksdiAeleSnL2p6ywhrFMNosqA5/wh7dhWchrb4e358AE/2xp9p6IB6Sx6boiWIunzfR4sf9FVDOqRlVf3Rt3q6YidEGwkLmY0AsLdASW+2FRy2J7ylx+T/A75qp/IBSMPisHNlZVBZsReM0oTE71ePqDFIgsDH6bYhm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=gwRdsl5t; arc=pass smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="gwRdsl5t"
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALU4ei4106032
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:25:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=lCGAkxYiB+JzDcHVcvabdSUs0kUcFxXRa0HA9
	Zbu/74=; b=gwRdsl5tRso7X33pAEu8O/GOYu709A/JLYsbBVXhnTVdtRYcwSN3o
	Apq87LNCu1C0ri96WkrCSAEx/kGfKwvl6R/iWm8BJFm6Lmff9OH6XJD+OlBkiGvy
	miqEEpGkKNhl9LNab/ERqLAos3JAW2VIICd9MVZ/DylTVwfs7BOc0z6Xz9KfFI8E
	0dCcx2h1quoMgAGlqqkGF7iL3IK9Q5cShUCSl5CAUlF7rVvdSWuf1TcHgigiYAJL
	YZAglvAxE8y+VFdHskd4x95+dejfLOgpR6nRrtQzQtmQdW6PicrDr+ABj8ncJEP/
	hUp1VCZpFSVffZVXxKhlAva0LXzh1UEEA==
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4gkcyg265h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:25:20 -0700 (PDT)
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49991beee7aso2454525e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789079119; cv=none;
        d=google.com; s=arc-20260327;
        b=sJa8enDCYgwlwh5zarI9rcUPN6EbYcGMwU+ubhTuVG/yvAhDQYruHesatsVRsQ8b8F
         poBfqrArbvzPTvnEeYVgmliyER9Ku9vzn8oe9MM89J8KIQbrwmCY/V+Wgd7rCcH4CRYR
         AsGZnu4JUv66zpK8q42g+XlGjzmItWKdBSoefKS06IYEUAXGjaNLA6yUvHHjlfHuKGNX
         2dGrMck+Dfdc1MbWnzVH0x5uyykxL5HOfu5eq+lJANnJBEm//P/WAkssftvv3M73OHvp
         mT7oJG4bCYyUAxge6AHLuJO0HxuTxK+gZ5OUmzi1I2XADSTFZ+kj2mo3NOXPKrShuZka
         IRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=lCGAkxYiB+JzDcHVcvabdSUs0kUcFxXRa0HA9Zbu/74=;
        fh=woywtGbqw7ef3zxXdhr07eakGQI1MZ4sHzEJvCA8Mqw=;
        b=cdwuiBge5uu+3PZN8SVAIyaC3xY2DOUZ3svo96iOPggeqJjJ4lXENA/dSwEacQcmQP
         rkkN7/tqFygAwz8ScRoyLC2PCYfc+tOT31FIZow9l9vOzczWkLraMSw6jVbef3qxlZtc
         NdwJhQeRd66angJ5u0xZChP3IELur00NW3iQDEoTj8R28rnWIkfMM2VzjHpDuLbO82tg
         K2YK17atLyQLpYZ/7Zd/4NCr83HQlLAgACdFpSNYzUqQkuEA6Cnc+SLVO0Q2PLYJZ1oW
         lDvakxDs6+ilG+LbFvChN6sVhCGvbjk4yuzHDnktqn/zdV6+FmhYEDEp/agQtGwix/jM
         9xzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789079119; x=1789683919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCGAkxYiB+JzDcHVcvabdSUs0kUcFxXRa0HA9Zbu/74=;
        b=OyzoG/VKJezpBJRqIStoNRMyoO+GBiE9KFDwGfJ6UeK0ydBOgsaEOJvDWuMo0buzk5
         Qj5zxSpgBsm6P2koMb+ByMBvV+sT9chZhu8fti4UE3j6/uAjAko+UBu+XMg7E5lth6Ad
         AGpd96RuceZXLHSE8Ii+p3zvbElYry/humEmPnh9AMRCFH5xfUvmWqvIKrHQzIPUgGVv
         D3gBy0I4iFzsKS9ahmvjHQmQ0qu8nGUfg/gkfu0pWOf70BpqGJxZJ/m2wMTgDchOK8aJ
         upcne8FmAc8Y+DceQOeerBQyDMbxA/woJ2VD9Y0kgC3X1maHBTEN9k1Xw3SVazfWA2bo
         NQ+w==
X-Forwarded-Encrypted: i=1; AKwUvByYewsHZ2/MLDSTmnD0kLC6FgdxVXZJwEHQnx55AbQpjdNMWlYVuK40Q4On5cMEiUPG7OFcT6OHpVzE0Vs=@vger.kernel.org
X-Gm-Message-State: AFuF++m4hG6ucY39zloXkSUnk9UJtEd+Y+LMdeoyLiaOSFdIRRl6OAk0
	Io4YqEgY+BKWVC3FFrh7X49BYwjwaaSZSXRsvVLvlyQS3wN1OVleuQ8d+mt+E6V8L/VL7Y9x+nA
	pA0PTQTKAuil2CptIjTZtogqTG30VP+09JkqfPcXyK417r3svhRu7GfA6f4WVsU4gw3SP4wUcD+
	85s4H10jfT4tH5rgg0MpHdvHPaGj/peZ63TDJyKC4=
X-Gm-Gg: AYBFou2A5OX1O6bOEQhBq/KzpnTnbJN0ehwvS3XPJxygbGf7tIq8y0M4V1emyUEjBfj
	I/p0bMDYTuA20tOSKgz7GC9k6uBMClMDQ3uQ2F7AjGr11qWWL+YbVHtN+cFdRHqwr3Hq189/+s1
	7n3CjMpVzQPb2d2JURwTjg96Q4s+UDlGJEJ6GvWqmzJnp70aojGjp0Fn/Idg==
X-Received: by 2002:a05:600c:19c8:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49e619f3ae1mr19295375e9.10.1789079119338;
        Thu, 10 Sep 2026 15:25:19 -0700 (PDT)
X-Received: by 2002:a05:600c:19c8:b0:499:b65e:49c9 with SMTP id
 5b1f17b1804b1-49e619f3ae1mr19294645e9.10.1789079118775; Thu, 10 Sep 2026
 15:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901110850.1805747-1-usama.arif@linux.dev> <20260901110850.1805747-3-usama.arif@linux.dev>
In-Reply-To: <20260901110850.1805747-3-usama.arif@linux.dev>
From: Nick Terrell <terrelln@meta.com>
Date: Thu, 10 Sep 2026 18:25:07 -0400
X-Gm-Features: AcwNN1WzfhVeB43vqNySBTMjqy5nwfXtFbw7gdz1POi5Es-sjjHj40Tfx-2jp3c
Message-ID: <CA+BOzqo13UJ=zb3SaxS+c=_zX+07f8AeRXv+5JJ8wiPVH2_7hg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] zstd: use cpu_feature_enabled() for in-kernel BMI2 dispatch
To: Usama Arif <usama.arif@linux.dev>
Cc: dsterba@suse.com, linux-kernel@vger.kernel.org, terrelln@fb.com,
        linux-crypto@vger.kernel.org, yosry@kernel.org, ebiggers@kernel.org,
        torvalds@linux-foundation.org, hannes@cmpxchg.org, nphamcs@gmail.com,
        chengming.zhou@linux.dev, shakeel.butt@linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: lbCKBDMnAtwrFn0kHGirudR7N2DSICw3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI4MSBTYWx0ZWRfX67YyA4lXV49b
 5dM/VF0tOLqP9khYAPhMJH7qUBwExCcdMoh+7BB7xJ+hwSKVPSF4ev3dmicWM6P9BFd3CnsfSVF
 3i4ZRfyQ24IPCz+PwYdXMqpS39ekfIFmee3TG3aAxvjwlpIgeTE6gJlyfqwdrhPLerBCkXKFKB8
 htGo36ob1lzMtHFPQfBl2KF2fBsv5m6E+X7K+MW98mQO7SHY1dzQeZQGzfeQq9T3wpzpXxHwY4H
 M/hgOIAaQLHWyfR5PVXf9KhkAoNNbAeeBEq1QzC22P0zMjUVB5MOVBfFkBbkzt/Y58+wEo9BAtD
 uSnRUE1lo7YODMtIaiPI/MqRxcbmV3/jQ7Jw27IdX1ok4zmOFik7Hz1FH1SDHCmkg0/oFmp9xRu
 OO3NQtnNTeACUlL/GzzHcC4kBZ4L1GKS6KH9/A6eh7SRuVPhLwfj6XrP2zVsc//Awepj0KLFrzh
 Km+RjcaNrCocfS6z4vQ==
X-Authority-Analysis: v=2.4 cv=M83YuCws c=1 sm=1 tr=0 ts=6aa32e51 cx=c_pps
 a=IwH782EDBk/vqbJ9rM8UFw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=tpM8CJlwf7uhpglF1g9U:22
 a=Gv6GEWdu30MbISd06GQA:9 a=QEXdDO2ut3YA:10 a=Ng9YvVcppn9CIdWre3nD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI4MSBTYWx0ZWRfX57vP68x/Yt20
 2AutJh5FIWFZoV92iiVqsitLUnrQZCR8WEwT1pc6IWm37N82C4hIkxl4azCPo1cKK9FGda3Mg+f
 4kr+CleOOoU9GnzqwpeD7AonVhIYxoY=
X-Proofpoint-GUID: lbCKBDMnAtwrFn0kHGirudR7N2DSICw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01

On Tue, Sep 1, 2026 at 7:09=E2=80=AFAM Usama Arif <usama.arif@linux.dev> wr=
ote:
> Zstd's dynamic BMI2 implementation probes CPUID when a compression or
> decompression context is initialized, stores the result in the context,
> and tests that value at every dispatch site. In normal kernel builds this
> bypasses the x86 feature policy and uses ordinary runtime branches instea=
d
> of allowing x86 alternatives to resolve the feature check at boot.
>
> Add ZSTD_USE_BMI2() and use it at every runtime BMI2/default selector. Fo=
r
> normal x86 kernel objects, the predicate expands directly to
> cpu_feature_enabled(X86_FEATURE_BMI2). When dynamic BMI2 dispatch is not
> available it is false; other builds retain the caller-provided flag. Keep
> the existing HUF conditional layout because DYNAMIC_BMI2 also controls
> whether target-attributed variants are emitted.
>
> Add the matching ZSTD_SET_BMI2() abstraction for context initialization.
> Normal x86 kernel objects and builds without dynamic BMI2 do not cache CP=
U
> state. Other builds with dynamic dispatch, including preboot, retain the
> existing behavior. Keep the BMI2 members in the context structures so
> their layouts do not change, and make the accessors return zero when
> cached state is unused.
>
> Select the normal-kernel policy in zstd_deps.h. Builds which define
> __DISABLE_EXPORTS, including the x86 preboot decompressor, retain the exi=
sting
> CPUID-backed dispatch because the normal alternatives infrastructure is n=
ot
> available there.

I don't know a lot about the preboot environment, but should we consider ju=
st
dropping support for the CPUID-backed dispatch in the preboot environment?
That would cost about 10% of performance, but perhaps the simplicity
is worth it.

> A 4 KiB zstd-generic crypto_acomp benchmark in a one-vCPU KVM guest gave
> these median results:
>
>                         Before      After     Change
>   Compression      16,634 ns/op  13,394 ns/op  -19.5%
>   Decompression     3,480 ns/op     963 ns/op  -72.3%

Thanks for these patches, this is a very welcome cleanup & performance fix!

> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  lib/zstd/common/compiler.h                    | 12 ++++++++++++
>  lib/zstd/common/entropy_common.c              | 12 ++++++------
>  lib/zstd/common/fse_decompress.c              |  7 ++++---
>  lib/zstd/common/zstd_deps.h                   |  5 +++++
>  lib/zstd/compress/huf_compress.c              |  6 +++++-
>  lib/zstd/compress/zstd_compress.c             | 12 ++++++------
>  lib/zstd/compress/zstd_compress_internal.h    |  9 +++++++++
>  lib/zstd/compress/zstd_compress_sequences.c   |  8 +++++---
>  lib/zstd/compress/zstd_compress_superblock.c  |  2 +-
>  lib/zstd/decompress/huf_decompress.c          | 18 +++++++++---------
>  lib/zstd/decompress/zstd_decompress.c         |  4 +---
>  lib/zstd/decompress/zstd_decompress_block.c   | 19 +++++++------------
>  .../decompress/zstd_decompress_internal.h     |  2 +-
>  13 files changed, 71 insertions(+), 45 deletions(-)
>
> diff --git a/lib/zstd/common/compiler.h b/lib/zstd/common/compiler.h
> index dc9bd15e174e9..47f6c0372c58c 100644
> --- a/lib/zstd/common/compiler.h
> +++ b/lib/zstd/common/compiler.h
> @@ -14,6 +14,7 @@
>
>  #include <linux/types.h>
>
> +#include "zstd_deps.h"
>  #include "portability_macros.h"
>
>  /*-*******************************************************
> @@ -96,6 +97,17 @@
>   */
>  #define BMI2_TARGET_ATTRIBUTE TARGET_ATTRIBUTE("lzcnt,bmi,bmi2")
>
> +#if !DYNAMIC_BMI2
> +#  define ZSTD_USE_BMI2(bmi2) 0
> +#  define ZSTD_SET_BMI2(state, value) do { } while (0)
> +#elif defined(ZSTD_USE_KERNEL_CPU_FEATURES)
> +#  define ZSTD_USE_BMI2(bmi2) cpu_feature_enabled(X86_FEATURE_BMI2)
> +#  define ZSTD_SET_BMI2(state, value) do { } while (0)
> +#else
> +#  define ZSTD_USE_BMI2(bmi2) (bmi2)
> +#  define ZSTD_SET_BMI2(state, value) do { (state) =3D (value); } while =
(0)
> +#endif
> +
>  /* prefetch
>   * can be disabled, by declaring NO_PREFETCH build macro */
>  #if ( (__GNUC__ >=3D 4) || ( (__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D=
 1) ) )
> diff --git a/lib/zstd/common/entropy_common.c b/lib/zstd/common/entropy_c=
ommon.c
> index 15a7c14ae8040..701bd495b13c8 100644
> --- a/lib/zstd/common/entropy_common.c
> +++ b/lib/zstd/common/entropy_common.c
> @@ -16,6 +16,10 @@
>  /* *************************************
>  *  Dependencies
>  ***************************************/
> +#include "zstd_deps.h"
> +#if defined(ZSTD_USE_KERNEL_CPU_FEATURES)
> +#include <asm/cpufeature.h>
> +#endif
>  #include "mem.h"
>  #include "error_private.h"       /* ERR_*, ERROR */
>  #define FSE_STATIC_LINKING_ONLY  /* FSE_MIN_TABLELOG */
> @@ -210,11 +214,9 @@ size_t FSE_readNCount_bmi2(
>          short* normalizedCounter, unsigned* maxSVPtr, unsigned* tableLog=
Ptr,
>          const void* headerBuffer, size_t hbSize, int bmi2)
>  {
> -#if DYNAMIC_BMI2
> -    if (bmi2) {
> +    if (ZSTD_USE_BMI2(bmi2)) {
>          return FSE_readNCount_body_bmi2(normalizedCounter, maxSVPtr, tab=
leLogPtr, headerBuffer, hbSize);
>      }
> -#endif
>      (void)bmi2;
>      return FSE_readNCount_body_default(normalizedCounter, maxSVPtr, tabl=
eLogPtr, headerBuffer, hbSize);
>  }
> @@ -335,11 +337,9 @@ size_t HUF_readStats_wksp(BYTE* huffWeight, size_t h=
wSize, U32* rankStats,
>                       void* workSpace, size_t wkspSize,
>                       int flags)
>  {
> -#if DYNAMIC_BMI2
> -    if (flags & HUF_flags_bmi2) {
> +    if (ZSTD_USE_BMI2(flags & HUF_flags_bmi2)) {
>          return HUF_readStats_body_bmi2(huffWeight, hwSize, rankStats, nb=
SymbolsPtr, tableLogPtr, src, srcSize, workSpace, wkspSize);
>      }
> -#endif
>      (void)flags;
>      return HUF_readStats_body_default(huffWeight, hwSize, rankStats, nbS=
ymbolsPtr, tableLogPtr, src, srcSize, workSpace, wkspSize);
>  }
> diff --git a/lib/zstd/common/fse_decompress.c b/lib/zstd/common/fse_decom=
press.c
> index 8d9c43b928833..008ce3401726a 100644
> --- a/lib/zstd/common/fse_decompress.c
> +++ b/lib/zstd/common/fse_decompress.c
> @@ -24,6 +24,9 @@
>  #include "fse.h"
>  #include "error_private.h"
>  #include "zstd_deps.h"  /* ZSTD_memcpy */
> +#if defined(ZSTD_USE_KERNEL_CPU_FEATURES)
> +#include <asm/cpufeature.h>
> +#endif
>  #include "bits.h"       /* ZSTD_highbit32 */
>
>
> @@ -306,11 +309,9 @@ BMI2_TARGET_ATTRIBUTE static size_t FSE_decompress_w=
ksp_body_bmi2(void* dst, siz
>
>  size_t FSE_decompress_wksp_bmi2(void* dst, size_t dstCapacity, const voi=
d* cSrc, size_t cSrcSize, unsigned maxLog, void* workSpace, size_t wkspSize=
, int bmi2)
>  {
> -#if DYNAMIC_BMI2
> -    if (bmi2) {
> +    if (ZSTD_USE_BMI2(bmi2)) {
>          return FSE_decompress_wksp_body_bmi2(dst, dstCapacity, cSrc, cSr=
cSize, maxLog, workSpace, wkspSize);
>      }
> -#endif
>      (void)bmi2;
>      return FSE_decompress_wksp_body_default(dst, dstCapacity, cSrc, cSrc=
Size, maxLog, workSpace, wkspSize);
>  }
> diff --git a/lib/zstd/common/zstd_deps.h b/lib/zstd/common/zstd_deps.h
> index f931f7d0e2947..a312029df5660 100644
> --- a/lib/zstd/common/zstd_deps.h
> +++ b/lib/zstd/common/zstd_deps.h
> @@ -26,6 +26,11 @@
>  #ifndef ZSTD_DEPS_COMMON
>  #define ZSTD_DEPS_COMMON
>
> +#if defined(__KERNEL__) && defined(CONFIG_X86) && \
> +    !defined(__DISABLE_EXPORTS)
> +#define ZSTD_USE_KERNEL_CPU_FEATURES
> +#endif
> +
>  #include <linux/limits.h>
>  #include <linux/stddef.h>
>
> diff --git a/lib/zstd/compress/huf_compress.c b/lib/zstd/compress/huf_com=
press.c
> index 0b229f5d2ae22..f3f53240c981d 100644
> --- a/lib/zstd/compress/huf_compress.c
> +++ b/lib/zstd/compress/huf_compress.c
> @@ -22,6 +22,9 @@
>  *  Includes
>  ****************************************************************/
>  #include "../common/zstd_deps.h"     /* ZSTD_memcpy, ZSTD_memset */
> +#if defined(ZSTD_USE_KERNEL_CPU_FEATURES)
> +#include <asm/cpufeature.h>
> +#endif
>  #include "../common/compiler.h"
>  #include "../common/bitstream.h"
>  #include "hist.h"
> @@ -1138,9 +1141,10 @@ HUF_compress1X_usingCTable_internal(void* dst, siz=
e_t dstSize,
>                                const void* src, size_t srcSize,
>                                const HUF_CElt* CTable, const int flags)
>  {
> -    if (flags & HUF_flags_bmi2) {
> +    if (ZSTD_USE_BMI2(flags & HUF_flags_bmi2)) {
>          return HUF_compress1X_usingCTable_internal_bmi2(dst, dstSize, sr=
c, srcSize, CTable);
>      }
> +    (void)flags;
>      return HUF_compress1X_usingCTable_internal_default(dst, dstSize, src=
, srcSize, CTable);
>  }
>
> diff --git a/lib/zstd/compress/zstd_compress.c b/lib/zstd/compress/zstd_c=
ompress.c
> index c41a747413e01..638bc0bf83127 100644
> --- a/lib/zstd/compress/zstd_compress.c
> +++ b/lib/zstd/compress/zstd_compress.c
> @@ -102,7 +102,7 @@ static void ZSTD_initCCtx(ZSTD_CCtx* cctx, ZSTD_custo=
mMem memManager)
>      assert(cctx !=3D NULL);
>      ZSTD_memset(cctx, 0, sizeof(*cctx));
>      cctx->customMem =3D memManager;
> -    cctx->bmi2 =3D ZSTD_cpuSupportsBmi2();
> +    ZSTD_SET_BMI2(cctx->bmi2, ZSTD_cpuSupportsBmi2());
>      {   size_t const err =3D ZSTD_CCtx_reset(cctx, ZSTD_reset_parameters=
);
>          assert(!ZSTD_isError(err));
>          (void)err;
> @@ -142,7 +142,7 @@ ZSTD_CCtx* ZSTD_initStaticCCtx(void* workspace, size_=
t workspaceSize)
>      cctx->blockState.nextCBlock =3D (ZSTD_compressedBlockState_t*)ZSTD_c=
wksp_reserve_object(&cctx->workspace, sizeof(ZSTD_compressedBlockState_t));
>      cctx->tmpWorkspace =3D ZSTD_cwksp_reserve_object(&cctx->workspace, T=
MP_WORKSPACE_SIZE);
>      cctx->tmpWkspSize =3D TMP_WORKSPACE_SIZE;
> -    cctx->bmi2 =3D ZSTD_cpuid_bmi2(ZSTD_cpuid());
> +    ZSTD_SET_BMI2(cctx->bmi2, ZSTD_cpuid_bmi2(ZSTD_cpuid()));
>      return cctx;
>  }
>
> @@ -4042,7 +4042,7 @@ ZSTD_compressSeqStore_singleBlock(ZSTD_CCtx* zc,
>                  op + ZSTD_blockHeaderSize, dstCapacity - ZSTD_blockHeade=
rSize,
>                  srcSize,
>                  zc->tmpWorkspace, zc->tmpWkspSize /* statically allocate=
d in resetCCtx */,
> -                zc->bmi2);
> +                ZSTD_CCtx_get_bmi2(zc));
>      FORWARD_IF_ERROR(cSeqsSize, "ZSTD_entropyCompressSeqStore failed!");
>
>      if (!zc->isFirstBlock &&
> @@ -4332,7 +4332,7 @@ ZSTD_compressBlock_internal(ZSTD_CCtx* zc,
>              dst, dstCapacity,
>              srcSize,
>              zc->tmpWorkspace, zc->tmpWkspSize /* statically allocated in=
 resetCCtx */,
> -            zc->bmi2);
> +            ZSTD_CCtx_get_bmi2(zc));
>
>      if (frame &&
>          /* We don't want to emit our first block as a RLE even if it qua=
lifies because
> @@ -6796,7 +6796,7 @@ ZSTD_compressSequences_internal(ZSTD_CCtx* cctx,
>                                  op + ZSTD_blockHeaderSize /* Leave space=
 for block header */, dstCapacity - ZSTD_blockHeaderSize,
>                                  blockSize,
>                                  cctx->tmpWorkspace, cctx->tmpWkspSize /*=
 statically allocated in resetCCtx */,
> -                                cctx->bmi2);
> +                                ZSTD_CCtx_get_bmi2(cctx));
>          FORWARD_IF_ERROR(compressedSeqsSize, "Compressing sequences of b=
lock failed");
>          DEBUGLOG(5, "Compressed sequences size: %zu", compressedSeqsSize=
);
>
> @@ -7321,7 +7321,7 @@ ZSTD_compressSequencesAndLiterals_internal(ZSTD_CCt=
x* cctx,
>                                  &cctx->blockState.prevCBlock->entropy, &=
cctx->blockState.nextCBlock->entropy,
>                                  &cctx->appliedParams,
>                                  cctx->tmpWorkspace, cctx->tmpWkspSize /*=
 statically allocated in resetCCtx */,
> -                                cctx->bmi2);
> +                                ZSTD_CCtx_get_bmi2(cctx));
>          FORWARD_IF_ERROR(compressedSeqsSize, "Compressing sequences of b=
lock failed");
>          /* note: the spec forbids for any compressed block to be larger =
than maximum block size */
>          if (compressedSeqsSize > cctx->blockSizeMax) compressedSeqsSize =
=3D 0;
> diff --git a/lib/zstd/compress/zstd_compress_internal.h b/lib/zstd/compre=
ss/zstd_compress_internal.h
> index b109783858763..99ebe1e0c923f 100644
> --- a/lib/zstd/compress/zstd_compress_internal.h
> +++ b/lib/zstd/compress/zstd_compress_internal.h
> @@ -537,6 +537,15 @@ struct ZSTD_CCtx_s {
>      size_t extSeqBufCapacity;
>  };
>
> +MEM_STATIC int ZSTD_CCtx_get_bmi2(const struct ZSTD_CCtx_s *cctx) {
> +#if DYNAMIC_BMI2 && !defined(ZSTD_USE_KERNEL_CPU_FEATURES)
> +    return cctx->bmi2;
> +#else
> +    (void)cctx;
> +    return 0;
> +#endif
> +}
> +
>  typedef enum { ZSTD_dtlm_fast, ZSTD_dtlm_full } ZSTD_dictTableLoadMethod=
_e;
>  typedef enum { ZSTD_tfp_forCCtx, ZSTD_tfp_forCDict } ZSTD_tableFillPurpo=
se_e;
>
> diff --git a/lib/zstd/compress/zstd_compress_sequences.c b/lib/zstd/compr=
ess/zstd_compress_sequences.c
> index 64abcdf2c5714..7a03a8fceea7d 100644
> --- a/lib/zstd/compress/zstd_compress_sequences.c
> +++ b/lib/zstd/compress/zstd_compress_sequences.c
> @@ -12,6 +12,10 @@
>   /*-*************************************
>   *  Dependencies
>   ***************************************/
> +#include "../common/zstd_deps.h"
> +#if defined(ZSTD_USE_KERNEL_CPU_FEATURES)
> +#include <asm/cpufeature.h>
> +#endif
>  #include "zstd_compress_sequences.h"
>
>  /*
> @@ -429,15 +433,13 @@ size_t ZSTD_encodeSequences(
>              SeqDef const* sequences, size_t nbSeq, int longOffsets, int =
bmi2)
>  {
>      DEBUGLOG(5, "ZSTD_encodeSequences: dstCapacity =3D %u", (unsigned)ds=
tCapacity);
> -#if DYNAMIC_BMI2
> -    if (bmi2) {
> +    if (ZSTD_USE_BMI2(bmi2)) {
>          return ZSTD_encodeSequences_bmi2(dst, dstCapacity,
>                                           CTable_MatchLength, mlCodeTable=
,
>                                           CTable_OffsetBits, ofCodeTable,
>                                           CTable_LitLength, llCodeTable,
>                                           sequences, nbSeq, longOffsets);
>      }
> -#endif
>      (void)bmi2;
>      return ZSTD_encodeSequences_default(dst, dstCapacity,
>                                          CTable_MatchLength, mlCodeTable,
> diff --git a/lib/zstd/compress/zstd_compress_superblock.c b/lib/zstd/comp=
ress/zstd_compress_superblock.c
> index dc12d64e935c4..fada5979c3b84 100644
> --- a/lib/zstd/compress/zstd_compress_superblock.c
> +++ b/lib/zstd/compress/zstd_compress_superblock.c
> @@ -684,6 +684,6 @@ size_t ZSTD_compressSuperBlock(ZSTD_CCtx* zc,
>              &zc->appliedParams,
>              dst, dstCapacity,
>              src, srcSize,
> -            zc->bmi2, lastBlock,
> +            ZSTD_CCtx_get_bmi2(zc), lastBlock,
>              zc->tmpWorkspace, zc->tmpWkspSize /* statically allocated in=
 resetCCtx */);
>  }
> diff --git a/lib/zstd/decompress/huf_decompress.c b/lib/zstd/decompress/h=
uf_decompress.c
> index 5663ae524cd83..8bf2279887e8f 100644
> --- a/lib/zstd/decompress/huf_decompress.c
> +++ b/lib/zstd/decompress/huf_decompress.c
> @@ -17,6 +17,9 @@
>  *  Dependencies
>  ****************************************************************/
>  #include "../common/zstd_deps.h"  /* ZSTD_memcpy, ZSTD_memset */
> +#if defined(ZSTD_USE_KERNEL_CPU_FEATURES)
> +#include <asm/cpufeature.h>
> +#endif
>  #include "../common/compiler.h"
>  #include "../common/bitstream.h"  /* BIT_* */
>  #include "../common/fse.h"        /* to compress headers */
> @@ -113,9 +116,10 @@ typedef size_t (*HUF_DecompressUsingDTableFn)(void *=
dst, size_t dstSize,
>      static size_t fn(void* dst, size_t dstSize, void const* cSrc,       =
    \
>                       size_t cSrcSize, HUF_DTable const* DTable, int flag=
s)  \
>      {                                                                   =
    \
> -        if (flags & HUF_flags_bmi2) {                                   =
    \
> +        if (ZSTD_USE_BMI2(flags & HUF_flags_bmi2)) {                    =
    \
>              return fn##_bmi2(dst, dstSize, cSrc, cSrcSize, DTable);     =
    \
>          }                                                               =
    \
> +        (void)flags;                                                    =
    \
>          return fn##_default(dst, dstSize, cSrc, cSrcSize, DTable);      =
    \
>      }
>
> @@ -899,18 +903,16 @@ static size_t HUF_decompress4X1_usingDTable_interna=
l(void* dst, size_t dstSize,
>      HUF_DecompressUsingDTableFn fallbackFn =3D HUF_decompress4X1_usingDT=
able_internal_default;
>      HUF_DecompressFastLoopFn loopFn =3D HUF_decompress4X1_usingDTable_in=
ternal_fast_c_loop;
>
> -#if DYNAMIC_BMI2
> -    if (flags & HUF_flags_bmi2) {
> +    if (ZSTD_USE_BMI2(flags & HUF_flags_bmi2)) {
>          fallbackFn =3D HUF_decompress4X1_usingDTable_internal_bmi2;
>  # if ZSTD_ENABLE_ASM_X86_64_BMI2
>          if (!(flags & HUF_flags_disableAsm)) {
>              loopFn =3D HUF_decompress4X1_usingDTable_internal_fast_asm_l=
oop;
>          }
>  # endif
> -    } else {
> +    } else if (DYNAMIC_BMI2) {
>          return fallbackFn(dst, dstSize, cSrc, cSrcSize, DTable);
>      }
> -#endif
>
>  #if ZSTD_ENABLE_ASM_X86_64_BMI2 && defined(__BMI2__)
>      if (!(flags & HUF_flags_disableAsm)) {
> @@ -1723,18 +1725,16 @@ static size_t HUF_decompress4X2_usingDTable_inter=
nal(void* dst, size_t dstSize,
>      HUF_DecompressUsingDTableFn fallbackFn =3D HUF_decompress4X2_usingDT=
able_internal_default;
>      HUF_DecompressFastLoopFn loopFn =3D HUF_decompress4X2_usingDTable_in=
ternal_fast_c_loop;
>
> -#if DYNAMIC_BMI2
> -    if (flags & HUF_flags_bmi2) {
> +    if (ZSTD_USE_BMI2(flags & HUF_flags_bmi2)) {
>          fallbackFn =3D HUF_decompress4X2_usingDTable_internal_bmi2;
>  # if ZSTD_ENABLE_ASM_X86_64_BMI2
>          if (!(flags & HUF_flags_disableAsm)) {
>              loopFn =3D HUF_decompress4X2_usingDTable_internal_fast_asm_l=
oop;
>          }
>  # endif
> -    } else {
> +    } else if (DYNAMIC_BMI2) {
>          return fallbackFn(dst, dstSize, cSrc, cSrcSize, DTable);
>      }
> -#endif
>
>  #if ZSTD_ENABLE_ASM_X86_64_BMI2 && defined(__BMI2__)
>      if (!(flags & HUF_flags_disableAsm)) {
> diff --git a/lib/zstd/decompress/zstd_decompress.c b/lib/zstd/decompress/=
zstd_decompress.c
> index bb009554e3a61..cc6ecd364970a 100644
> --- a/lib/zstd/decompress/zstd_decompress.c
> +++ b/lib/zstd/decompress/zstd_decompress.c
> @@ -259,9 +259,7 @@ static void ZSTD_initDCtx_internal(ZSTD_DCtx* dctx)
>      dctx->noForwardProgress =3D 0;
>      dctx->oversizedDuration =3D 0;
>      dctx->isFrameDecompression =3D 1;
> -#if DYNAMIC_BMI2
> -    dctx->bmi2 =3D ZSTD_cpuSupportsBmi2();
> -#endif
> +    ZSTD_SET_BMI2(dctx->bmi2, ZSTD_cpuSupportsBmi2());
>      dctx->ddictSet =3D NULL;
>      ZSTD_DCtx_resetParameters(dctx);
>  #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
> diff --git a/lib/zstd/decompress/zstd_decompress_block.c b/lib/zstd/decom=
press/zstd_decompress_block.c
> index 9c4215e435014..31804cbf1f7ed 100644
> --- a/lib/zstd/decompress/zstd_decompress_block.c
> +++ b/lib/zstd/decompress/zstd_decompress_block.c
> @@ -16,6 +16,9 @@
>  *  Dependencies
>  *********************************************************/
>  #include "../common/zstd_deps.h"   /* ZSTD_memcpy, ZSTD_memmove, ZSTD_me=
mset */
> +#if defined(ZSTD_USE_KERNEL_CPU_FEATURES)
> +#include <asm/cpufeature.h>
> +#endif
>  #include "../common/compiler.h"    /* prefetch */
>  #include "../common/cpu.h"         /* bmi2 */
>  #include "../common/mem.h"         /* low level memory routines */
> @@ -631,13 +634,11 @@ void ZSTD_buildFSETable(ZSTD_seqSymbol* dt,
>              const U32* baseValue, const U8* nbAdditionalBits,
>              unsigned tableLog, void* wksp, size_t wkspSize, int bmi2)
>  {
> -#if DYNAMIC_BMI2
> -    if (bmi2) {
> +    if (ZSTD_USE_BMI2(bmi2)) {
>          ZSTD_buildFSETable_body_bmi2(dt, normalizedCounter, maxSymbolVal=
ue,
>                  baseValue, nbAdditionalBits, tableLog, wksp, wkspSize);
>          return;
>      }
> -#endif
>      (void)bmi2;
>      ZSTD_buildFSETable_body_default(dt, normalizedCounter, maxSymbolValu=
e,
>              baseValue, nbAdditionalBits, tableLog, wksp, wkspSize);
> @@ -1955,11 +1956,9 @@ ZSTD_decompressSequences(ZSTD_DCtx* dctx, void* ds=
t, size_t maxDstSize,
>                     const ZSTD_longOffset_e isLongOffset)
>  {
>      DEBUGLOG(5, "ZSTD_decompressSequences");
> -#if DYNAMIC_BMI2
> -    if (ZSTD_DCtx_get_bmi2(dctx)) {
> +    if (ZSTD_USE_BMI2(ZSTD_DCtx_get_bmi2(dctx))) {
>          return ZSTD_decompressSequences_bmi2(dctx, dst, maxDstSize, seqS=
tart, seqSize, nbSeq, isLongOffset);
>      }
> -#endif
>      return ZSTD_decompressSequences_default(dctx, dst, maxDstSize, seqSt=
art, seqSize, nbSeq, isLongOffset);
>  }
>  static size_t
> @@ -1968,11 +1967,9 @@ ZSTD_decompressSequencesSplitLitBuffer(ZSTD_DCtx* =
dctx, void* dst, size_t maxDst
>                                   const ZSTD_longOffset_e isLongOffset)
>  {
>      DEBUGLOG(5, "ZSTD_decompressSequencesSplitLitBuffer");
> -#if DYNAMIC_BMI2
> -    if (ZSTD_DCtx_get_bmi2(dctx)) {
> +    if (ZSTD_USE_BMI2(ZSTD_DCtx_get_bmi2(dctx))) {
>          return ZSTD_decompressSequencesSplitLitBuffer_bmi2(dctx, dst, ma=
xDstSize, seqStart, seqSize, nbSeq, isLongOffset);
>      }
> -#endif
>      return ZSTD_decompressSequencesSplitLitBuffer_default(dctx, dst, max=
DstSize, seqStart, seqSize, nbSeq, isLongOffset);
>  }
>  #endif /* ZSTD_FORCE_DECOMPRESS_SEQUENCES_LONG */
> @@ -1991,11 +1988,9 @@ ZSTD_decompressSequencesLong(ZSTD_DCtx* dctx,
>                               const ZSTD_longOffset_e isLongOffset)
>  {
>      DEBUGLOG(5, "ZSTD_decompressSequencesLong");
> -#if DYNAMIC_BMI2
> -    if (ZSTD_DCtx_get_bmi2(dctx)) {
> +    if (ZSTD_USE_BMI2(ZSTD_DCtx_get_bmi2(dctx))) {
>          return ZSTD_decompressSequencesLong_bmi2(dctx, dst, maxDstSize, =
seqStart, seqSize, nbSeq, isLongOffset);
>      }
> -#endif
>    return ZSTD_decompressSequencesLong_default(dctx, dst, maxDstSize, seq=
Start, seqSize, nbSeq, isLongOffset);
>  }
>  #endif /* ZSTD_FORCE_DECOMPRESS_SEQUENCES_SHORT */
> diff --git a/lib/zstd/decompress/zstd_decompress_internal.h b/lib/zstd/de=
compress/zstd_decompress_internal.h
> index 2a225d1811c4f..401f2b526bbce 100644
> --- a/lib/zstd/decompress/zstd_decompress_internal.h
> +++ b/lib/zstd/decompress/zstd_decompress_internal.h
> @@ -204,7 +204,7 @@ struct ZSTD_DCtx_s
>  };  /* typedef'd to ZSTD_DCtx within "zstd.h" */
>
>  MEM_STATIC int ZSTD_DCtx_get_bmi2(const struct ZSTD_DCtx_s *dctx) {
> -#if DYNAMIC_BMI2
> +#if DYNAMIC_BMI2 && !defined(ZSTD_USE_KERNEL_CPU_FEATURES)
>      return dctx->bmi2;
>  #else
>      (void)dctx;
> --
> 2.53.0-Meta
>
