Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792709898;
	b=wTWbt6Xgkqoh48PuYxav4otmv2gH+IERPPOkiXaG0YlYm59oDyODyQkijhQYo3eR30Ng
	 wL+FZmEMv9f0DmAH4r5QfolNLStGuSogqNbHfpAcNQnDIAyAjMSQmm2P1LJb8D/16H4wb
	 4dANC5Gp1xwxWhdruRjs1mZ+KdbG+NWu19yE8KYaBKrimkDvp3n6WmWejRm8nR1+b/MGH
	 NUGPkbPFyPOev7dOmQjETTsaRSZ+VExICFMm0E6OF9Pt6wMKxHslBnkkxCz2hv9XINAQh
	 Y8N8Yo4DDcjVqa3mwYbC5j6+6KHACZgpVUyJ92kFFQ8bg79hFZJa24E5X6jb9JAr0og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
	b=l2nfP//+DyoFW4y0sl7j+ajP9fO56pk44vaw+I6sA4S3vKeM4ltJn5Wn3AdkzA6RnAts
	 AV6sw0cH7PuwVRSsLBKc2xGmAMuECzWnGkOoWht3fAMRlN8U1EcRDr4FCSIFx64s4yaqk
	 moBpfm/5SCqu2eIwDSebu6AzXg9wxqQ2uG7A8ZdGWW0CIN9O4ut173W8HKKUfkuGt4TOr
	 EwmoFeAhczdxjCN38xbYgl4J1uxFbc0IuIJtZF20iPWd83o7AELGL38UeiUSSbefhcbO4
	 pXOyrGpxNgjS9IsbQVDcXDL1/p3EGwWIS67A1I8KywjAwKko3mq+Wt0yQLfT9U6b6XA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kAWpkhn1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D48F606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D48F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kAWpkhn1
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso4849a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792709896; cv=none;
        d=google.com; s=arc-20260327;
        b=eW4Bj3kxfkny5r86gdg02F3ZIRlZas5XXD4n+uS0ik2tBqCHGeG8KSKHcNlsoOQ+Ji
         YyV0VtXMH/EZjEOhIBlFHtmgLOYQyvGOrRT2uo+kPf3Ok5BjNSrdTo3FIFKB0Ep/9zR/
         xhnbhLAN5pib+CtpXK7Buvtdtc1gzV+R2qiT0Yvy5Xo1EEmOv0fnpZF9lznGNjPsiC8J
         51lpHt1rUu8J8CuNA0vVYpcyFbJwvhO+G+PYmhIDHJmngCSNiVRGEPz0kcFwKH+Bao9P
         LRAG1F/OseKG910XBPLg50p6KkV8oiJPgP61BkzCX0YsAcH5QI8YIoxkwDJJM6HQ6UHA
         EIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
        fh=1issEgX8SHKhoqBYi+YrkyaH02oOeqhHFzaZuF8aNUk=;
        b=i2ARsp6NHpAtNmaO4voZ+lB+5Vu1Nni2b3YdJRKFQhXryKrLPhd5IpR2gy9hT0ivcL
         I8DAm/40USCV1jRpRjeSWXwn0JhtZKC84L3VBqT2IG/JMWO3o0c7J+Npm5NELswCtB98
         ow9MJg/U471WmeyJ8tqrRuWf4mqC3z4wLrhTgio/hNeXvrQqpUPetcqAdGT1UVUVgk3W
         rrCGAbUc4BVGAUx8pcW5euPgLzbyZi3Ggkehm0vcIC6zcKpwHSh5P9kydcntsICWhshj
         kT3ufe4uzWURph5yEO3TJ+ZNRWL7tZXQbHC8ebSUo1WYrT+B5TDTsTFm0d82kolPHDn6
         Trww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709896; x=1793314696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
        b=kAWpkhn1xJIsRNb3kWf753Jo/W1Z9mqUGTtDto8RAWIddAkJgZn+T1ZScI238Xw36Q
         qWKFhPYd264ScQPYkDRL13eNkyduAvBpqsczVv+z8utITIo9zymG135SeAU5POJKGS8M
         MWSba+2TyycipFlrHFl1R0vsellMcEGh+TldPzF3vnmlAFVZJ2N/YpqjKn8WhPDv96F7
         l3w6V7quxAIbR+/O3fb4BSTp69DGSEnKM8xhqiEko9P+wxOFHIeh5XOSxUob0m95Pk9F
         NWbF9E1eyxYhOl6MSHmpr/655ZHRbGYikxJsxmxfnGr8SLx7G2GKAcaZY/9jOOVVgdpV
         53jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709896; x=1793314696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
        b=HM9GMboPLfn1PcHwYe6WU1q7wb+cVHRRu4RjJIifkU1T9AdaNUzmXIdZpxktZo+mtI
         Pskdx4AtYLpaHwn734bzau8fV3MhAhNbr1M7Ykcbd7yzQj52CKqhw2OrRzYkiYJ63riY
         pVxOkdjI7UKcpZuWr9t/XZR4Chn5WygzjI4hVg+fJR4JVILpkB96NX9O7kPIIYDsR06Q
         q4lM2iY52GY9gxtBfy1KX2hZ3Ixiot4xR/jDhUM4vv15LYEjmuPFWeqx7YCPel/NUNjr
         +PYxzqyWt2bumO6nJIzZXuC6UftP3YGLv0xGtjpV7zL2NdEcdVuJdBGZjNurLKfTQaCX
         w9Ew==
X-Forwarded-Encrypted: i=1; AKwUvByILpcDYDVwjOjXGVaAUTe6Xt8fMlJDYqptycl+lTWl62XbzgbE85mG9GPvu5BAbevlJgvSQeSbLSYlvwo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvyfh6X6EbsOHhkU8Gq2yRR966bWZGZyj6t7s84X0DERTOxRNs
	5yxYM+SbvPSxjImWQ2ai3Iv05Fr/NE1oaYFm3JruoC1LkpyxS2b3LOScTUdAR32Jk3k0zAnmhxm
	4eKaHjvjJqHz/buzhkihC/ij3n2898oQuLAJ59Z3d
X-Gm-Gg: AYBFou1FIOim7qJvZY9sBc50QN3SHuM+n4JwZuAdIKfgB4FkGCPEgo6eJyEjU9qbl86
	iKO8qpt9W4kkQ6/ZgB9/Xv717uimat/7oAQ8576gLkHEtoNY8CZrT2VhJJGwGVAnIGhsXnj3RWL
	c/xn/nUT02MRqEqyprbYiurHwN1stDoEAK2pHAEAhU5WhS2mHSPnxxlNLmsqW2XegTntW8QQ+7b
	fLdbASHH8XPsc37EvC7xAhgx0DNzv6weObEqgB3jE4Ajx+x8nlMvFoY1gXY2O5FEjDaS7DFItzT
	Z2ALGuJMV8Fwp5mpFZY51gr78s6/vsW7DtI2454PZe5st6wMDMZhDQfM4r6T0u6hmZTmzFYyRdV
	tWqPt7p9QD1lGkBW8xkEaKDOhuenlxseEMlVk1YcgBg6gjsIuU8uGv9f6/t4ZIE+N
X-Received: by 2002:a05:6402:20cc:20b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b43505cab5mr9309a12.16.1792709896086; Thu, 22 Oct 2026
 15:58:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-update-autofdo-split-machine-function-option-v1-1-5c71b3005e89@kernel.org>
In-Reply-To: <20261014-update-autofdo-split-machine-function-option-v1-1-5c71b3005e89@kernel.org>
From: Rong Xu <xur@google.com>
Date: Thu, 22 Oct 2026 15:58:04 -0700
X-Gm-Features: AclHuK8dO3MsAmO6cAa68r7ozQ6JK-D1flEqoU6M1Xnqf0FQ7RSBHTS-OpOYYkM
Message-ID: <CAF1bQ=SN8wZ1hKDTtGspBiZ8VQBoUtQP6uNioO-ZOOvS2tLZAg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Update split machine function argument
 for upstream rename
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Han Shen <shenhan@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks good to me. Thanks for fixing this.

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Wed, Oct 14, 2026 at 4:40=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> A recent LLVM commit [1] renamed the internal LLVM plugin option
> '-split-machine-functions' to '-function-splitting=3Dall', breaking the
> AutoFDO + ThinLTO build with:
>
>   ld.lld: error: -plugin-opt=3D-: ld.lld: Unknown command line argument '=
-split-machine-functions'.  Try: 'ld.lld --help'
>
> The plugin option is needed for in-process ThinLTO, so handle the rename
> accordingly using ld-option.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2186
> Fixes: 2fd65f7afd5a ("AutoFDO: Enable machine function split optimization=
 for AutoFDO")
> Link: https://github.com/llvm/llvm-project/commit/3e6acc87c58843e551d6e8e=
4bf06c26712b04622 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Makefile.autofdo | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 1442043da139..57a3aba6ffc2 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -22,7 +22,7 @@ ifdef CONFIG_LTO_CLANG_THIN
>      KBUILD_LDFLAGS +=3D --lto-sample-profile=3D$(CLANG_AUTOFDO_PROFILE)
>    endif
>    KBUILD_LDFLAGS +=3D --mllvm=3D-enable-fs-discriminator=3Dtrue --mllvm=
=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto
> -  KBUILD_LDFLAGS +=3D -plugin-opt=3D-split-machine-functions
> +  KBUILD_LDFLAGS +=3D $(call ld-option,-plugin-opt=3D-function-splitting=
=3Dall,-plugin-opt=3D-split-machine-functions)
>  endif
>
>  export CFLAGS_AUTOFDO_CLANG RUSTFLAGS_AUTOFDO_CLANG
>
> ---
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> change-id: 20261014-update-autofdo-split-machine-function-option-d4edb03d=
370c
>
> Best regards,
> --
> Cheers,
> Nathan
>
