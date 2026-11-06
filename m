Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986984;
	b=eN9cs2t+C31zadPv01484LV2c4DY3bwuMVMX4dEGc74Y4020JIs3ddL6do8dr57MTu5k
	 VpRxI8CCi+ShmhVEEmQxAqzkBFPSpZNb+5PH0rJEauShat/FpRuOfq9+RZb4fsy0ZGXv8
	 HsI+uX5yvk+DMDlndvZTjAVT3Fk3oKHL5ZVdDD12E0eu2eSQ9SJRpjSQVqYM252FxOcjs
	 68BkQI9Sd/VCz0LvWmqDBM0ul9DehmSGhEjCmywFW4J/5VXdppHJiHJF36c8xKuo0j/T7
	 9IEl8QdnH3WWt5de9xxw3MQrSxisEN8qMXu5lcIu8IbtiiOPNU4soOr0YPlc4o4SHKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
	b=Z/onWq2tnFeRNRQ68HuoT3ux5QCyRHAk2+l0Wtm+YTA/XLTXGvnptz1UEDiJF6hkZ+36
	 pkgB/pSL2MybKd67kmdsUzC8ijS3yXk5AVKRwQ6kiGjNsqKSaToyu+LbIWs1dc2DY6Oi4
	 uWvvMqnrJuwjFCU5V7Yfkdhz2p4NdPXHemfoNgi5gV5nYDcal5UnXQVqkcRCpMbDvw6aq
	 yUz9mK1+1njq+yE+AXyrP1ecIvfObuCjefZcqjWTTYglDizZ7s/1GRhDjqv6jze7qCEot
	 9/d3U5862KqpqswKtx6Gd7RZpVP+3mTM2Fo2DK+X9COQLjKZO+svqQuCw3d5J0tzNsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2ro5fQr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B66D606A33F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B66D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2ro5fQr
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so622a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:43:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793986982; cv=none;
        d=google.com; s=arc-20260327;
        b=oVT15zj15ulf+omqrJIZi5chSQ0DffrQEKAaITJevFTeJo7Q8qOXQzyAOzhWMqyPrZ
         TJMno1H+dEbW/TO061UVPkq/w+uFLIeqXSjoaxRRtTTMPH3mm6a45gsi2oZE4bNvELjO
         itcFQr+VLfzwCpOVX6ZzPkIYwznHS7ESDCAcfaIFRx643bGk1t+cVgU9qhaOZ2jdsNjM
         XzfR9nFScCv9pKNhImPT9ETNCR/Lk67KtdWKTf/c5IP54Zw6YBmuW6cKRE1Zyi34phAA
         nL3NOXinxAdWXxsbo9QamsTcoYqEXQOrjpYjMnAEQfhk+ZVRtxFXD+MFXZH2a41e/hxF
         f/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
        fh=MB+sgnBdLHdqb2kLgUBa0OWSBQUt2UIC8ZkLY7kKEig=;
        b=a3d6FKauohzr21HJVhfXESe/kMpxkAHFCJo3o8mLFO78aaK5AJqD6mZ2048KvFYJS3
         e0EswQx+cedKLyHTYaZi7+XK5jiMZIFIbLE98H7xqgl6HBawuP8HmB7gBaR/u3C2Qs6b
         qlY0T9ytE6Wnow5HTCek6DD16uMhuzPRMNT4Vlu1dm6krmaYnzdTQv0sReKzAbcZSj/S
         yOU3cKrwtTfaE363tRR4+XMfVUzmgPLzogg6znDUFnOPt5lhfOswz977dvtWTYXgHxig
         1h3WnPdbrbXvUseOq2H8OCFUtLhFnSida113MvjlY3QfXKjz9PB7DWMR4/qgCcooB74y
         T4eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793986982; x=1794591782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
        b=l2ro5fQrGF8ThcmBTRuXeAQRtbC/ARC1ruTiblsIEn2TfppdJiydYhKAM4Pfr6JIQM
         LmzWSYpfeCkYvybW5XzERjWOO+6ggOGxW1b5Q0S1/5Nwphf11n5Zyqi0o+WmhZ18AL34
         bu7QEScxPJWzlU3+4nw+SDW0gHa7ujBtgCU3EL78GwCPlLGAQai4bYGevl3WnHpN4cFc
         aAGG0P0bjrCebkNJmEzrz2n3jrEKJqdTDq7fSg32FrEga3uAMZa8+0fctC922fgiezc9
         SmB1SAE0rxRy8hRrjFof1/beFTpbeXVK3rmbPxIStIUohKKEazLHCMUOR3keloElEMN5
         chXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986982; x=1794591782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCfrwF+d0gm8FLK7Blq7MpU0ABelay9GJEspD8JPZms=;
        b=a/1mxaYuWlJjclPKU20sOKDmf+TOZ7PK43tcfv0ThM5j4mv3GbR8NLj5f7XbnzrCEL
         Yy5fnnOzDANB15R6mZcrGaWGUpblC29XoKQys0cNS9yc2rmPbFYc+BZOCczTpA/Piuxf
         BDzDtDZNsBMdMU6YcTrmuNP7MabdpU9IZE64hmyNMTd6favK47xYVzU7gd5A16gOLPYh
         tJVTdX9nWtxc134OUi/XoI+ebQrA8xUylT71yYcn6QJu+VgXybqk1q7J46W04lWeJEw2
         SULLYtVIfXwFbbWcAYJ0DWVHHbKkvrcEeZ8RAFkgTWMWtmKdG0TpdRasFxDdl4Ts0WGX
         e+yA==
X-Forwarded-Encrypted: i=1; AL+hErEPOemRr4xpvg0DrbqcXC4+mB1pu2C+jA3bEWPJMe73NnFiUc141tY15XEwSQ6PAQXrSaDqFzqfwRXE9OE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P1ZNd2ISNED+TtbSrdHqvVo7Ozxc+Tt5kg7hj4Taacr5r3M2k
	cv52aJePg/yI64HxZj7xzYTfBwXO6uPk3iZJyo8CYcNxHoxK/W8i5zPVTGwJ6sNVIrgg/fWIv4c
	I4Ik2zEPv2hl4EnKFNRo80NrWBGxBn+1B1uICm98g
X-Gm-Gg: AYBFou0/dnae2xmjTAGWDIkm+4yjmgZFrnDiWTqgTKHPwG6kB8l/40ODIBMUgSxTlYw
	g1EvMeklYdDjinkMaIUG3Jse9EQMJ3vEkDdWtTeK0RS27sjNOUk2mpNfrSRXVx2iy4cA12QFJP2
	Xroc2AwbH9v9cAQy3O4GrSWMVabwgL5ItJtXG47XZ0fn/ND17aomVukTTbnDAiQpdFHqrvghqIX
	AotLprQEqp3K/UhrkUKU/YWT3GMVVZF8PEGZTsCXBFvp7AlPg728wxGDID7mX3jPZIDVQ/G2/dV
	ETFeg14GG7GBsewCGD09xeOZ7KTa+9xakEskYHoPdrSK5T8U8DPH4KX0LMGxKZGm5xgLMCqxMxQ
	LX1NTZc3zjxeCBQ+TMT0o1k4cm0nia0ddQVYXUce75AwBC402R5KsfgfJN83XchmWxPb1IiHpJ0
	GnArEXX6UcbAHc
X-Received: by 2002:aa7:d790:0:b0:6af:b196:68bf with SMTP id
 4fb4d7f45d1cf-6b6f841a8e9mr5248a12.7.1793986981869; Fri, 06 Nov 2026 09:43:01
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
In-Reply-To: <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 09:42:50 -0800
X-Gm-Features: AclHuK-wkGWa84CFDmjnSjcaCwRdnzfHPz195HdzeZhErhZwgCS6NVR4XJm0nNw
Message-ID: <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just one thing: I think we should also have this flag for Rust so Rust
and c are consistent.

Rong

On Fri, Nov 6, 2026 at 9:38=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> This looks good to me. Thanks!
>
> Reviewed-by: Rong Xu <xur@google.com>
>
> -Rong
>
> On Thu, Nov 5, 2026 at 3:12=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> >
> > Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> > Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> > automatically passes -mllvm -sample-profile-use-profi whenever
> > -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> > inference algorithm (Profi) by default.
> >
> > However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> > flow-sensitive discriminators (FS-AFDO), and Profi has known issues wit=
h
> > FS-AFDO that degrade runtime performance compared to LLVM's original
> > profile propagation algorithm. In addition, Profi's min-cost max-flow
> > solver (applyFlowInference) can hit pathological compile times (30+
> > minutes or hangs) on certain kernel control-flow graphs when profiles
> > drift slightly or when combined with GCOV [3].
> >
> > Pass -fno-sample-profile-use-profi to disable Profi and restore the
> > original profile propagation behavior that kernel AutoFDO was tested
> > with. Guard the flag with clang-min-version 210000 since it was
> > introduced in Clang 21 alongside the default change, whereas
> > CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> > used to probe for the flag because cc-option invokes Clang with -Werror
> > but without -fprofile-sample-use, causing Clang to fail the probe with
> > -Werror,-Wunused-command-line-argument.
> >
> > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> > SampleProfileUseProfi remains false by default in the LLVM backend and
> > is only enabled by the Clang driver.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> > Suggested-by: Rong Xu <xur@google.com>
> > Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48=
ef25522aa17c2a71003 [1]
> > Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMA=
oWh-dqLHii3Nig@mail.gmail.com [2]
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  scripts/Makefile.autofdo | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> > index 57a3aba6ffc2..8754b60ad2ab 100644
> > --- a/scripts/Makefile.autofdo
> > +++ b/scripts/Makefile.autofdo
> > @@ -13,6 +13,7 @@ endif
> >  ifdef CLANG_AUTOFDO_PROFILE
> >    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PRO=
FILE) -ffunction-sections
> >    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> > +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno=
-sample-profile-use-profi)
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_=
PROFILE) -Zfunction-sections=3Dy
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
> >  endif
> > --
> > 2.56.0.455.g6c5a503b38-goog
> >
