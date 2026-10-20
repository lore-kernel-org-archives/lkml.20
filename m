Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792517152;
	b=prhkpRPHZZCO2foAxTfk92ER6c4oxR45UOngzQz9isAMfP79MtQZRtJlXPeXTmffRRa/
	 oy8VdybW1x4PPu4IkHhVqzcN1IC2RnlVb6Nsg5+thulpYkOG1DMSRlQ2s/akzrnRa8W9D
	 7oxnv0jmx/Tq1SFjgWpUR/1fVSOq5EqvaK0BBqgCYRUBAaQG4/LxFbLSs3YG2+iZvzdDf
	 7jlVydTVnMGg3rjH4ooWtBZa0Pbi04fko9qsWRSlihRPCjprQ5ob5K/sPbbBVwCdSI46a
	 RfSR6euyxSSArIN+fDyXkblUNJTrNf7pWI0lvrARHLLDz5Y26AiVzB7OItqWlXr9nHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EdK0UMmig/WdOrlqRQfL8+PLy1EV4ZbphI/FEkx+xD4=;
	b=W5u4GjXIby5lxnpY74445vBrnc+/xakveH5kk04kn7hFxfGHy8flo6MTsU+ZhV3Eh4tg
	 qV/L9A4uqlXX/zwM0jCEmbzsydQo8dCaJ6PVoJ/1FlwSOwPo809sUB0EKyGeU7q+9HBna
	 plgjI2GLVoknTFMzQGNozbNTVGQ74fbv/uv7Tlhm2FeIr1wWtxB0c5BbMIr/AqGSIkPo7
	 wVc7kdtJ/N1VTc5Uu/vNYN+DI+4meihRx3NV4vH9ajfm/XzIpes7UiijlDbjQtmxhK8nl
	 NPXN9HzBYT5ICyDrX9EurFt5GM8N0bjvOJc+Ulu8tJsHo7YzLg4mNpVyVo7IO/WAQSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="scptNuY/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F0606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C8F0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=scptNuY/
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e0d1da913so875717f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792517150; cv=none;
        d=google.com; s=arc-20260327;
        b=sQXHdW5qYgiRsDY+nEuBbtvkXiE0NFYx+3AaZvPhYD57seBx7t0Rivbb1bOBBGQCUo
         J09Gl6HbgQlX6nd8jUa0XmS3OJD1bFShaMp/FMb/b2DSozg8gGxKz7whsH4Sa4Rwkx8h
         qgZ1ELyhvmddkiejJR9RXXrwKZB1lkYByRpiGmfjh0hf/qwSwXiDIbuMQHQh6pXcI+hY
         M7AjN+eb2qRjaXZUCwFHQw2Ckn7mFme+7CZiJuuhfbf46NY7gNVDMPv6jorGzAMmGJH1
         HfdBN23ZLZtcXAPT9NYPIEkzdcgf7FuCoEYumonXC72gXHGVP/YFkqfwnzTFaqH0TT2O
         ED6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EdK0UMmig/WdOrlqRQfL8+PLy1EV4ZbphI/FEkx+xD4=;
        fh=f2VafuuxUrj/heStYICYxXonVM+SLDTOl67lUsLAq1A=;
        b=fZpCny0K07sWG3Xl0/hUVj7urIamUC3mlVcvYRODD5JpjMt26oNNotTlChRA2dl/2a
         1jekdbPAKsmDJg5QNkoBHdnV1CbweRcEQ1EuUIwJOB25C5y2C8nEMVhhOHS8H2uiZQKZ
         vtxIGzlxx6FutVVWC+ashktkXOI6rp4A/3vWsGpRiJQXLU9NSIfGxTeQEEYopm89HIgT
         Gda89PpPA9fdtByRI9PZHaRbs0YzlA7Ham3g9CITImYm8IsGmmZimUf1lAXLwxSu9vQX
         u6hDEMoHAip3Hoo3aHbUbwb905NOWIzZRF3Vww35dMPlbXAizwNhFiET//3wNY/Xxsst
         jAYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792517150; x=1793121950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EdK0UMmig/WdOrlqRQfL8+PLy1EV4ZbphI/FEkx+xD4=;
        b=scptNuY/qtldvXWogtYzsElzoas8p0qrK3ghcCMiv+8v9NJkuwpJGx6pJc2Y0tAxWf
         TiOWNQXC46M7bu8o95XUcDovP+Miqy3eFEIvtaG9Raz83upYwLM9a0R0hdGcDvj5VZQ8
         IJn9/QOuQJ1vyXKRLps49TuJLtmooYBfE21KvfSQ6ylD7+D0sWH5niu4gCO9478fvxHv
         e5wKKXIq+9MXDvv+FkKGQY69Oe9wqCoItSEwo9szUYJ2iy66gfoU5pNhJuFZJWiXbeXa
         4TsvPy+P0QeVAl7cTOC1lKJiIChZl0QTlrr4AG+mVoNt0bwbFhwNczpByWNVSVNdLPGN
         r+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517150; x=1793121950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdK0UMmig/WdOrlqRQfL8+PLy1EV4ZbphI/FEkx+xD4=;
        b=2hptiEDVsiSIfOcS5Vcy/2a9BeRet28fMyRmWxkSkmsVwmAVIdeVtjYLNwe9EOD7K2
         z55zTHliNFKriLqXdcDXw3RZcfpTIQ9S+e1589u2BeVGMLgL8Lef+Tfjl6s9wUKGUgVS
         pGMpZG8PfOQiiu6Fzz1LKselbuhdmk51Wd1Sk0PlL+eKPbAoQaJjHYuE1OvErTrKNGCk
         3GQ3ZF3i4kAp2cgBFthFj0AelOcUnN95JrG7DBdrARJUeCuwiMg2M2FD76k0IE3LyHDD
         ugfqLCt5PxReSn/hzd5Rxky0U9PwpewUh2/LqM3apamXLnN9v6Ts/lDzYIOOC11wSMsb
         D7Ew==
X-Forwarded-Encrypted: i=1; AKwUvBwqS/e06UgbcKggsXtXPMrKWZ3HATl1Mpsje/90gdCgZPWHSniRygrn7SCsJaU5HkvBLmrwFnfuumz1R20=@vger.kernel.org
X-Gm-Message-State: AFq9FYLySg2X73mVDnzRDJNGuRAoHHe0uBzLxifodfPCiwU4NNyfPtPD
	g52pgz48Q+qjmwzEjJcWR/vpX6DX4RjPct6ID6MnQvd/HuMT3YUA8V+R7Wg45R74OXCHDCYyBES
	xQyqcVHsJ0YnekQaV80ccMl4yNDzyJ4vhNcjbn3GC
X-Gm-Gg: AYBFou3ZbELT6h+o+TDYWzOiPMKbwQmiDq4t78qyNR5wR27Vf9B4T4moLXhFngp5IG1
	YlFHO1HA5FpZingaOEX5lMHbzTyQ+HzE04Fi9N2pnBzSqx0+XKjsdosDkZvFkFVBJE1mWm7CstE
	fmAqpRCZoXrWwwC6AysXHWIGopE3b+EvN6wQeYwVVJ0pFaWvOxYhp1m/pM2DyTxye7EfF2rLwFL
	I16AhtgGa3va6+Y+1nGg8xu/iO2lQE899+etGQFfl7MDdabfstat6v846q3Mry5jHOI+zXSKQk1
	x/4UFIqv3bDCPNei9HQGAg3LRmdSn4/fq53xc80Y7/ati0gktWFmfIOQ3LE3IeH1gCD1X5ZWlrl
	GnU5aKb6I+7sQwjDUuk+R4D3jUOPaPUSMT8/bpk5UtRrWmM8IGzpAJ3ZOGdE6oSq566qqJlfoOo
	SByWdbxjFCNlHsb+rnneqEM/mUcd04H6srzB2KuZH1E42QCVIwaQ==
X-Received: by 2002:a05:6000:238a:b0:48c:6756:dab3 with SMTP id
 ffacd0b85a97d-48e1e74f8dbmr7138106f8f.3.1792517149285; Tue, 20 Oct 2026
 10:25:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003238.2823758-1-sashal@kernel.org>
In-Reply-To: <20261020003238.2823758-1-sashal@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 20 Oct 2026 10:25:36 -0700
X-Gm-Features: AclHuK_fa_HbNaQnYqb-OZRkDYI-lx83Hg73A49l6-9Bv4sDG5IJipWqk7Uxofg
Message-ID: <CAKwvOdnZErT3FTMmCKkRrhZd6qsGancaMoAAx52pFua_3HqQ9w@mail.gmail.com>
Subject: Re: [PATCH] x86/csum: Relax the len and proto constraints in 32-bit csum_ipv6_magic()
To: Sasha Levin <sashal@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Florian Westphal <fw@strlen.de>, Julian Anastasov <ja@ssi.bg>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Rosen Penev <rosenp@gmail.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:32=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Building an i386 allmodconfig kernel with clang fails since allmodconfig
> started building netfilter with GCOV profiling:
>
>   In file included from net/netfilter/nf_synproxy_core.c:7:
>   In file included from ./include/linux/skbuff.h:26:
>   In file included from ./include/net/checksum.h:21:
>   In file included from ./arch/x86/include/asm/checksum.h:9:
>   ./arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly requ=
ires more registers than available
>
> The csum_ipv6_magic() asm needs five registers at once: the early-clobber
> sum plus register-only inputs for saddr, daddr, htonl(len) and
> htonl(proto). With frame pointers enabled, six general purpose registers
> are left to choose from.
>
> In synproxy_send_tcp_ipv6(), the GCOV instrumentation lets clang's
> machine scheduler move the copies of two incoming register arguments,
> EDX and ECX, below the asm. Both registers then stay live across the
> asm, which leaves four registers for its five operands. This is LLVM
> issue #206307. The error goes away without either GCOV or frame
> pointers, and it reproduces with clang 19, 21 and 22.
>
> Neither len nor proto has to be in a register: adcl also takes a 32-bit
> memory or immediate source operand. Use "g" for both, so the asm needs
> at most three registers whatever the caller looks like.
>
> ASM_INPUT_G, which normally replaces "g" to avoid clang's poor handling
> of it, is not enough here. It expands to "ir" for clang, so callers that
> pass a variable protocol, like nf_ip6_checksum(), would still need five
> registers. With "g", clang passes a non-constant len or proto through
> the stack and still turns constants into immediates.
>
> Fixes: 403cec8ab6d0 ("netfilter: add option for GCOV profiling")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://dashboard.kernelci.org/build/maestro:6ad55fe255fda507603d=
2651
> Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Closes: https://lore.kernel.org/a28df759-d0e9-41c0-97c7-5f89a18d54e2@oss.=
qualcomm.com
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/issues/206307\

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> KernelCI's kbuild-clang-21-i386-allmodconfig job has failed on mainline
> with this error since the 7.2 merge window, v7.3 included.
>
> Tested on i386 with KernelCI's allmodconfig-based .config: with clang
> 19.1.7, 21.1.8 and 22.1.8, nf_synproxy_core.o fails before this change
> and builds after it, and net/{netfilter,ipv4,ipv6,bridge}/ and
> arch/x86/lib/ build without errors or warnings. The same directories
> also build cleanly with GCC 16.2 (i386 allmodconfig). A 32-bit userspace
> harness comparing the asm against a C reference over 2M random and
> carry-edge inputs shows no mismatches with either compiler. No full
> allmodconfig build or boot test.
>
>  arch/x86/include/asm/checksum_32.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/checksum_32.h b/arch/x86/include/asm/ch=
ecksum_32.h
> index 17da953879976..f74873a5e3510 100644
> --- a/arch/x86/include/asm/checksum_32.h
> +++ b/arch/x86/include/asm/checksum_32.h
> @@ -159,7 +159,7 @@ static inline __sum16 csum_ipv6_magic(const struct in=
6_addr *saddr,
>             "adcl $0, %0        ;\n"
>             : "=3D&r" (sum)
>             : "r" (saddr), "r" (daddr),
> -             "r" (htonl(len)), "r" (htonl(proto)), "0" (sum)
> +             "g" (htonl(len)), "g" (htonl(proto)), "0" (sum)
>             : "memory");
>
>         return csum_fold(sum);
> --
> 2.53.0
>


--=20
Thanks,
~Nick Desaulniers
