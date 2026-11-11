Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794423980;
	b=lVd7Th/RGqzeC0vXtoFE9XdpeV+i/nSaDHJnwT+BvNADDv3ZHz5dN5bUgyV3o2KcCF/e
	 ABeY+aFHOIgCHS4qWQbOZiAwQZiwpEgoQr8l2lgI/LMjYK1HrLJL47vIuuKL1ibOt24lA
	 KZQsWpsNBw+CdVZbr5Hzs99ZRbOm3e/RYHMVSW0Ow5pQH9uSRHf2JrdPCsSCESshDlAaG
	 L/2mfYkKejTmAp+I5QHrnyF75oDJUg8Rg6md4LTqP8TZrRhyJnd8F8C7RGTh+fkEAmHX+
	 B8cTkEOKny5fPAkN4Cv2TFTqJW/ssktBZCAB6COoBWz6UxU2rGLVeemwmypbEgXg/zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
	b=uHa7d1SvvIDFeqf9TGUxQ8Dxpfzmsu4i6TQBZxQ3TajqCmqseqMzBuk+x9dnL8DFBgQu
	 CBQm821nAXBh3bV9gg/lTAaeqrkd5by5z8jfTjyJoHZBgkNEZ7frTezkooLCotcdEU2YX
	 5BKKL81WQSl/kCsPl0pioMm/3yK4u8iiXH1bv6R45sGSCgb2CaYqbPBW4plrT77mDVAzB
	 Pu8HwcoaJOMY8MXDnHU9AF8TCAL4ODaZC9UIYqIE0fj8Q+PwNsZnGNHY7s8Hdz83QF9w/
	 KaaPeqvUG+ZYKz2VTw21zo+gObyNSB2jN4U3/ALcp/thKZBJes0GAqQAWYhlAAlEmgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UCWt3Mwy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FBAB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UCWt3Mwy
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1834254f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:06:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794423978; cv=none;
        d=google.com; s=arc-20260327;
        b=mglGJjEsEnF8TQzFGsjP8kq6Hma9roM+KSQWtnJZD+bouyDskLFZSekZ7y0MAIpCPn
         vQQ+UzGsiQGiO7EzLtIY31jrgBNubDTt9yPkUjYLRjLU2q5wYaAn79a5Jj1ub/WWoA9a
         QpDfTZwBQbS9Fxfq6JlrdP2GAbQHTDYvJtpPE8JdoasuPNxLGrojyY/fBmWmFRrPnbC7
         7p/wmz8l2XY4O9/DGd/TUGn+nOlhSH7eRyN9yyIVLA/kdoBLm5mu2U0cS+E4iTKPQLxm
         Q4d/N/5KzS0q/zQ2gxAbNJILXgPLASpaVZ+hB/y9xcnnwdwUv056Cw4rjs9MJY+Afaqt
         mIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
        fh=yvleZ2Dod3QnzV2fLl22V0dyejKUljiB1UK5HwAeW3A=;
        b=ERHyXf3HER4FKVib8wTOCRGBwG5wBF8RMZj9A2DqKhe5UmlPyTuQPt4ou1Mih3kSOO
         57sjzMBXQKM3RBsxHILYnH/4iFVgBuYYouoyyL2bS4xz/JgYzrP90/cdjHAKGoauK0R9
         bkUvYEiRHj5BnhrTR7JdGGB6jsafxbnEbWJ8z/eZeWC6TIQsk0Dok/XrndlWtIhMfBFZ
         3FQbpd3KyXwJuXcpM8l7OA7a7tkMiOKZrngvVVel9tozgJ3uE/P1jxX8xxTPjyBPwOak
         alfHyi+3MhYKbtLKzk8FkCMWj5JA1nztak6sTE5VFdAiYHyjOAa0//z//DkwTfMKJBFF
         NgZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794423978; x=1795028778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
        b=UCWt3MwyTY99eeG4r6z5+Kv840sn/muCBFKLGztVYeCMFaVt1HGxXBlKdaHSsZVlFJ
         rKo0ggeus22A4YCBNIu/MRv37ngC6k1GFlbr5g87LtiBYHsXHac+mPEN8N5pWHmINSXF
         s1sWrZpQHVI07jPLCQQ23B5Tu52tHg9rOKTOLcCA52Vv3wSHFFRs5AM+d048bwHYjij7
         GtSFb7HrDkoYnUFi3T0llygTDl2+KCZshFiVuW07KKhW2N5bh164xAC2Z4YcnhgRgjbs
         6WvwDgd9yyunaDoEcXt1gRevd7ji07rmXg8pCTbDzyVK68AzF39JqEFW/LdAnP4lNEI3
         jezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423978; x=1795028778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
        b=qG95poI1fgKuFrzyNztC61WbFl5vl5v/VjHvoo2/F9D9ZrItludfdJ6G9wM5O7iIAI
         +G1znsEw3Y90NPGMGCd2+imq5FtoHqhiUM8X9Qu7XAi77qVI226sv/4dMDrwfRFLfnTi
         l9Yu8KcvUqmcZVbtQ+W14x1+IWO4hWwZkPSvMdITT6YGaF0yGhGb73YX86ybMNkVvrwb
         wW1CPB+uCETXnYupcbUTcDpwsXy2pAplFqqe5NCjSG+9tvSIDZvIbJMLhNBk2UxbKWJT
         cGpCvmtUrxZYP7IX5nB7gaRI7oMS4A23JtO9WR0nqamghoVaQr0P8mPKnCHT7BCtSDUW
         9ueg==
X-Forwarded-Encrypted: i=1; AL+hErEabsglu9YI9t7BQORIV9ADdGGmMcZndaUWxRkzysNOWe+Hv+rXZVsgux7w2vMSfZMR1OXstCtQtvnnYUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OmxoWUZjuQUXzXZ1f+5VIZQrSHlRwCaFJ5EqAhDslQbMV2o50
	52OxgVrw3h3nNA8wx+PlpCLzr5A0Nj6UMk8MMieZ+70/EktxEidCFRFrdsyk7OqZbACeIrLqEAY
	lt3GXAltokpHSC+0PxCIgXZNKxU7h8Hg1rz89zCib
X-Gm-Gg: AYBFou3X4uWdb5ZdDatxY/U4TPYLRKoi06cnfNA0qbaAvse5XIETblqkkiluVyf+hWw
	2nIrJhtXw+tUvrlH2NsnWeHCVF5DQblxegLN2pZ0qCFTfbiIpMbMVg/NywzXVcFFVEGZpZpWwt6
	inxC4dtraKcJ9LWul4NF2nPU3swaA8LtkJhoUt7vUSPbKwLBYZeizEOXz4IoEQjR/9CNcHtNB4K
	cD4pqKE2HuOt/ANA0HSOrfi6fM2I2Z1IVC9lES8XYdjcayAzpv9oGe3R8KnYfY5CcGdGosXHiGB
	4gBvsPM5CtE/acCghvsvD1mvkR7r7aY563do5+vTOmwhvAB1O22L8BB/pYZFMLkPO0rXztvBh3D
	JFUh6X0+FOM9o8R6IozJ1rP/UwiH4XTFeWFKyEdWZHTaPWS9qi0OydZH95YmzgtOLhzRTeQgus+
	6Qke5Rir0xX/yepXQGo84RAtoF8UYBcq5rhc8VJuQFpHaLiWW+AMNXqoIn/YMaOXImYKR6W1/fa
	uVBMavvvSZIfVjlCX2BuMWYtAEdTboB7QAQULjAzqqHmaNzbntToqx5tSA=
X-Received: by 2002:a05:6000:188c:b0:48c:4442:54e with SMTP id
 ffacd0b85a97d-499c6e96996mr5766110f8f.30.1794423977388; Wed, 11 Nov 2026
 11:06:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org> <20261110-kconfig-toolchain-updates-v1-1-6d4fb636290e@kernel.org>
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-1-6d4fb636290e@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 11:06:06 -0800
X-Gm-Features: AclHuK_uzzc5PqVw0ACAUccbGDRKU7vaepPUlXKcHRboTuGhxy6z_fiaCT06APY
Message-ID: <CAKwvOd=gkPRazfqjd2xpvW-Pr8gLXVvxBYuzuyAOWi2xwinRTw@mail.gmail.com>
Subject: Re: [PATCH 1/4] scripts/Kconfig.toolchain: Remove CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:42=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> __attribute__((no_profile_instrument_function)) was first supported in
> GCC 7 and clang-13, which is higher than both the minimum supported
> versions of both compilers. This configuration is always 'y', thus it

Verified, but...

> can be removed.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  kernel/gcov/Kconfig       | 1 -
>  scripts/Kconfig.toolchain | 3 ---
>  2 files changed, 4 deletions(-)
>
> diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> index 04f4ebdc3cf5..f62de2dea8a3 100644
> --- a/kernel/gcov/Kconfig
> +++ b/kernel/gcov/Kconfig
> @@ -4,7 +4,6 @@ menu "GCOV-based kernel profiling"
>  config GCOV_KERNEL
>         bool "Enable gcov-based kernel profiling"
>         depends on DEBUG_FS
> -       depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR

did you want to retain `depends on !ARCH_WANTS_NO_INSTR` (deleting the
` || CC_HAS_NO_PROFILE_FN_ATTR`)?

>         select CONSTRUCTORS
>         default n
>         help
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 2acbd40a38f1..666d44cc6ba8 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -141,9 +141,6 @@ config CC_HAS_ASSUME
>         # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106654
>         default y if CC_IS_GCC && GCC_VERSION >=3D 130100
>
> -config CC_HAS_NO_PROFILE_FN_ATTR
> -       def_bool $(success,echo '__attribute__((no_profile_instrument_fun=
ction)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> -
>  # Beware of two problems when using cc-option in Kconfig compared to Kbu=
ild
>  #
>  # 1. cc-option in Kbuild tests the provided flags with all previously ad=
ded
>
> --
> 2.56.0
>


--=20
Thanks,
~Nick Desaulniers
