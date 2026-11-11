Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423684;
	b=U7it/ppm3R7T5oiVcYT3gOS7EVDd/6qZ/0WhwJnKUbGQJbRk5tlfRp3afms6OiQWmJcM
	 S+J0zFcYbO/zDSWWuC4hgQ+DBDtljTUU8s4GXfzvVwkOdwxlC6F+0KaU9Bq9il898ADCT
	 UV8S2WJMwxGnqU3Lp4y8qh4QN0Hni8UhtAyfedtJZjeZMDhIjoDHuPbv4ZQ4S8icycuZe
	 hXMgGOf2+j5fvRjkpfd9pcvCpLZ8MRdpIRuvhwYBJdA93QjHIZb0W7/J9wUGRKO2SzBcK
	 oj6mOO8ljUrCqJRgReoO68K438DT8YVgJaQudQpznqTTbshKT8Qpf8gR4OqQF0G/NEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type;
	bh=ibbZxZ0AUA89ICzojImIUdj4mBfVP5cQ49POtiuj0Pg=;
	b=KJc2Hio/aXzR4p7ulumOd2Zj9GyQavsaYd9EIDRy7taFNE2nV7zCmluUs5AnJu5HPLJv
	 EBxZPM1ZC0u999ka2vuKRwVblDdn/wU2lRCO9bO0LVXwvGphbtqwohocCtJbE5nuK8/RZ
	 JY4WZzqGl9tab4ifb5BI8uPdGUNCGlkIEhk7FDxcHALql2FMQqBiKtOlIYwQP0bYfnJiW
	 ZN/baJFjRWaFXLN0cIxg0LgQDtzAn5llazcNstRkXtXmBrF61TmspEBT85NKTXSVSaOWt
	 ENEOtBER9L3b+lWYJyKDV1XjOw3aE1AdeQ2g6DUeJ+es47DOIuuXWdoEhDeWHwLsL1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTwRSKHv;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF571606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF571606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTwRSKHv
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4919a880834so2102696f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423682; x=1795028482; darn=vger.kernel.org;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ibbZxZ0AUA89ICzojImIUdj4mBfVP5cQ49POtiuj0Pg=;
        b=hTwRSKHvMZ+lrvIeKoIurIC1KIKFKDhCwpsHCg4SFuXuE9FKXnLWr57eDNeolSoOom
         eqV/p+t7TWIdATJfv//mUGngAxsfG1Ud5OIHDZ114PVIAd9qHQJ/nvDX9IDcJFgw+jNF
         RsxN9HGM9/ycJLIbp4H+gxYLr2kBFW7rB/uWjQk6MV0ZvTvknIOsO8RwYyaMKQeIiDqH
         BxiEkvwU6YJ3hMq9QDsjHUBOZv+Qa10c8k/iXMPGoBHQNQzRR84DZr6lj5wl4gV5bZiG
         kR2L2HYLN2nvJpfQ0mWf61MNewSZZKxyBikLrF/zKFPbCJkn6UugfPLdyzosaCaz7/I7
         NehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423682; x=1795028482;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibbZxZ0AUA89ICzojImIUdj4mBfVP5cQ49POtiuj0Pg=;
        b=n73WgBXw5IXJox9ySAjdUCGYG62AHPPRPbXSyVAyUvOThs7lAUJtBDfhKGSeGKwXeN
         /2S+EIp0sckApDAPOiPNr6oSxLMfgCJnoIvpNHDW4EAREVfkl8zXtNItUahAKrTf9j3f
         dIB3tBtk4V6r38e0AQgkbagdCi95VTf1aCY/4OWF+hR+tAVG8sdYzZWgkfKULELr7gDm
         UCXnvgVD60ZJZ4Lc5a9nDaWvJIO3QS8XGWGm20eg4xnFIM7V0Bf+0YY/p9Ei45UNHdCL
         RaQkGx+x/O+bXyqcczMGdQvJN8do1/5IiD9mGA/cWm9g1Xf5pXLbzOpp5NVjRfTd7VgD
         J8Vw==
X-Forwarded-Encrypted: i=1; AL+hErF75/4WttR1HIcXxYeK/aBKvQNk7qt+6vIGdHIUdWA5+qvTVLXIUFEJWtq8I3qqZiyLwIHoAd9XzJF96PQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uC3pJ84W7VHTE3nsQ6/09J/d9dH6ouGd+OFNimYOWrchqN8ty
	ZykxVsxWRCbwybWvUCnillH0cEspePz2IiblnHAAGLlGaiOSXQYe18qm
X-Gm-Gg: AYBFou19b1ACh4VaXdo+yAc8M2JtEw7Drz7I81myeSuJRdW4aZBrXu5kIxC0QeONON2
	Gd8/+vhGFC2cnNx6SOdYDoKFiy1c8VgeQQ1GBANQTkUAO8WsufDnBIdYfYtT21yDRztlprEdHR2
	rCFbU4B2+1BOdK0oilbOB/qKCkgsi+2gZfmkDm5eUeX/wumoaiGOc45LaQYV9wxoTmgg60c4fDn
	P43h4ulUTc1RaGp5VaX0oLNKXcbg9VCBQXopmwpLtqyFp3/ODGzQm5sSPOGRMJlmKmZ3Shb/GB0
	fo5Yr2ONDn2hYa8rcQtVztU/rIn66iUSryKy/bIVMmJs9hbr+z/ZF8Lrr6yQsdVahbofinaxsJF
	haPXOU2GS3Zxt8uSKAH8HYW0C38BcNEQBRMKvDZtXklcgXsnhDbQmQkbNT2c4f4BtRBjjlWad9x
	beFgRGnoQ/B/WXkc4xPLK8JJ0VKS6m7SW7yug9pvzr+TQOZCLzUNeRmP0/+bfaKGhM1CpAeXL2R
	zTPrZ5syJut0xErknQ9GkkZiDH2d/kSmtKS/GEnHkKLZrIlKVaXHM/iCn1t79TbU+QvRHT0dH7x
	K+Is2w8u6RsfwoMbIkQuDbdEFwo8reZeKDmklX/EsXEzBHHDswQNgkK4HX7t6vkUlFu3m54me9v
	RYSgmWvBzRwe/HV3syXzmBA==
X-Received: by 2002:a05:6000:2301:b0:48e:5071:420 with SMTP id ffacd0b85a97d-499c38baf65mr6310015f8f.2.1794423681839;
        Wed, 11 Nov 2026 11:01:21 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm11095632f8f.20.2026.11.11.11.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:01:21 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <6d7d25fa-69ef-42b0-b7f2-bb59ebf0eb2f@gmail.com>
Date: Wed, 11 Nov 2026 19:01:19 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH 4/4] scripts/Kconfig.toolchain: Document minimum supported
 versions for dynamic checks
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-4-6d4fb636290e@kernel.org>
Content-Language: en-US
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-4-6d4fb636290e@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OXKw02O0ZQVKPdopabmDPVkH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OXKw02O0ZQVKPdopabmDPVkH
Content-Type: multipart/mixed; boundary="------------AiKmJ8XeW8CJXxcJsL6rEg05";
 protected-headers="v1"; hp="clear"
Message-ID: <6d7d25fa-69ef-42b0-b7f2-bb59ebf0eb2f@gmail.com>
Date: Wed, 11 Nov 2026 19:01:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH 4/4] scripts/Kconfig.toolchain: Document minimum supported
 versions for dynamic checks
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-4-6d4fb636290e@kernel.org>
Content-Language: en-US
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-4-6d4fb636290e@kernel.org>

--------------AiKmJ8XeW8CJXxcJsL6rEg05
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/11/26 05:42, Nathan Chancellor wrote:
> To make it easier to clean up unnecessary dynamic checks when the
> minimum supported version of a toolchain component is updated, add
> comments documenting when features were first supported. Request that
> future additions document this as well.

Love, love, love this!

I tested the bounds and replicated nearly all of your results, but had a
few notes:

>=20
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Kconfig.toolchain | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 26a62b15e9ab..3a9eb8317d59 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -1,4 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +# When adding a new dynamic check (such as {cc,ld}-option{,-str} or te=
sting a
> +# small program), please add a comment documenting the first version o=
f the
> +# tool that supported the feature being tested. For cc-option{,-str}, =
note the
> +# "beware" comment below.
> +
>  config CC_VERSION_TEXT
>  	string
>  	default "$(CC_VERSION_TEXT)"
> @@ -118,6 +123,7 @@ config GCC_ASM_GOTO_OUTPUT_BROKEN
>  config CC_HAS_ASM_GOTO_OUTPUT
>  	def_bool y
>  	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
> +	# supported since clang-10 and gcc-11

'asm goto' failed for me with clang 10. Seems it was added with
clang 11 [1]

>  	depends on $(success,echo 'int foo(int x) { asm goto ("": "=3Dr"(x) :=
:: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
> =20
>  config CC_HAS_ASM_GOTO_TIED_OUTPUT
> @@ -129,6 +135,7 @@ config TOOLS_SUPPORT_RELR
>  	def_bool $(success,env "CC=3D$(CC)" "LD=3D$(LD)" "NM=3D$(NM)" "OBJCOP=
Y=3D$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
> =20
>  config CC_HAS_ASM_INLINE
> +	# supported since clang-11 and gcc-9
>  	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC)=
 -x c - -c -o /dev/null)
> =20
>  config CC_HAS_ASSUME
> @@ -161,6 +168,8 @@ config CC_HAS_ASSUME
>  #    pitfall.
> =20
>  config CC_OPT_ZERO_INIT_PADDING_BITS
> +	# supported since gcc-15. not needed for clang, as it does this by de=
fault since clang-20
> +	# https://github.com/llvm/llvm-project/
> commit/7a086e1b2dc05f54afae3591614feede727601fa
>  	def_string "$(cc-option-str,-fzero-init-padding-bits=3Dall)"
> =20
>  config CC_OPT_NO_ADDRSIG
> @@ -168,12 +177,15 @@ config CC_OPT_NO_ADDRSIG
>  	def_string "-fno-addrsig" if CC_IS_CLANG
> =20
>  config CC_OPT_DIAGNOSTICS_SHOW_CONTEXT
> +	# supported since gcc-16, not supported by clang
>  	def_string "$(cc-option-str,-fdiagnostics-show-context=3D2)"
> =20
>  config CC_OPT_DIAGNOSTICS_SHOW_INLINING_CHAIN
> +	# supported since clang-23. not needed for gcc, as it does this by de=
fault
>  	def_string "$(cc-option-str,-fdiagnostics-show-inlining-chain)"
> =20
>  config CC_OPT_STRICT_FLEX_ARRAYS
> +	# supported since clang-16 and gcc-13
>  	def_string "$(cc-option-str,-fstrict-flex-arrays=3D3)"

Clang 15 supports '-fstrict-flex-arrays' [1] so the check seemingly
passed, but support for level 3 wasn't actually added until clang 16.

I think this needs a:
    'depends on !CC_IS_CLANG || CLANG_VERSION >=3D 160000'
so the option evaluates as empty string when these deps are unmet.

> =20
>  config CC_OPT_NO_ALLOW_STORE_DATA_RACES
> @@ -181,51 +193,67 @@ config CC_OPT_NO_ALLOW_STORE_DATA_RACES
>  	def_string "$(cc-option-str,-fno-allow-store-data-races,--param=3Dall=
ow-store-data-races=3D0)" if CC_IS_GCC
> =20
>  config CC_HAS_MNOP_MCOUNT
> +	# supported since clang-10 and gcc-9 but option is architecture speci=
fic
>  	def_bool $(cc-option,-mnop-mcount)

'-mnop-mcount' worked for me on x86 with gcc 5 [3], but it seems s390
support came later in v9 [4]

> =20
>  config LD_OPT_FORCE_GROUP_ALLOCATION
> +	# supported since ld.lld 19 and GNU ld 2.29
>  	def_string "$(ld-option-str,--force-group-allocation)"
> =20
>  config LD_OPT_NO_WARN_RWX_SEGMENTS
> +	# supported since GNU ld 2.39, not supported by ld.lld
>  	def_string "$(ld-option-str,--no-warn-rwx-segments)"
> =20
>  config CC_OPT_WNO_ADDRESS_OF_PACKED_MEMBER
> +	# supported since clang-4 and gcc-9
>  	def_string "$(cc-option-str,-Wno-address-of-packed-member)"
> =20
>  config CC_OPT_WNO_FORMAT_OVERFLOW_NON_KPRINTF
> +	# supported since clang-18, not needed for gcc
>  	def_string "$(cc-option-str,-Wno-format-overflow-non-kprintf)"
> =20
>  config CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF
> +	# supported since clang-18, not needed for gcc
>  	def_string "$(cc-option-str,-Wno-format-truncation-non-kprintf)"
> =20
>  config CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE
> +	# supported since clang-21, not needed for gcc
>  	def_string "$(cc-option-str,-Wno-default-const-init-unsafe)"
> =20
>  config CC_OPT_WNO_DANGLING_POINTER
> +	# supported since gcc-12, not needed for clang
>  	def_string "$(cc-option-str,-Wno-dangling-pointer)"
> =20
>  config CC_OPT_WVLA_LARGER_THAN
> +	# supported since gcc-7, not supported by clang
>  	def_string "$(cc-option-str,-Wvla-larger-than=3D1)"
> =20
>  config CC_HAS_WSTRINGOP_OVERFLOW
> +	# supported since gcc-7, not supported by clang
>  	def_bool $(cc-option,-Wstringop-overflow)
> =20
>  config CC_OPT_WNO_UNTERMINATED_STRING_INITIALIZATION
> +	# supported since gcc-15 and clang-21
>  	def_string "$(cc-option-str,-Wno-unterminated-string-initialization)"=

> =20
>  config CC_OPT_WERROR_DESIGNATED_INIT
> +	# supported since gcc-5, not supported by clang
>  	def_string "$(cc-option-str,-Werror=3Ddesignated-init)"
> =20
>  config CC_OPT_WENUM_CONVERSION
> +	# supported since clang-3.2 and gcc-10
>  	def_string "$(cc-option-str,-Wenum-conversion)"
> =20
>  config CC_OPT_WNO_PACKED_NOT_ALIGNED
> +	# supported since gcc-8, not supported by clang
>  	def_string "$(cc-option-str,-Wno-packed-not-aligned)"
> =20
>  config CC_OPT_WNO_FORMAT_OVERFLOW
> +	# supported since gcc-7 and clang-18
>  	def_string "$(cc-option-str,-Wno-format-overflow)"
> =20
>  config CC_OPT_WNO_STRINGOP_TRUNCATION
> +	# supported since gcc-8, not supported by clang
>  	def_string "$(cc-option-str,-Wno-stringop-truncation)"
> =20
>  config CC_HAS_COUNTED_BY
> @@ -252,14 +280,18 @@ config CC_HAS_BROKEN_COUNTED_BY_REF
>  	default y if CC_IS_CLANG && CLANG_VERSION < 220100
> =20
>  config CC_HAS_ALLOC_TOKEN
> +	# supported since clang-22, not supported by gcc
>  	def_bool $(cc-option,-falloc-token-max=3D123)
> =20
>  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
> +	# supported since gcc-15 and clang-21
>  	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__))=
 =3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
> =20
>  config CC_OPT_INLINE_MEMSET
>  	string
> +	# supported since gcc-14
>  	default "-finline-stringops=3Dmemset" if $(cc-option,-finline-stringo=
ps=3Dmemset)
> +	# supported since clang-22
>  	default "-mllvm -max-store-memset=3D4294967294" if $(cc-option,-mllvm=
 -max-store-memset=3D4294967294)
> =20
>  config LD_CAN_USE_KEEP_IN_OVERLAY
>=20
> -- 2.56.0
>=20

[1]
https://releases.llvm.org/11.0.0/tools/clang/docs/LanguageExtensions.html=

[2]
https://releases.llvm.org/15.0.0/tools/clang/docs/ReleaseNotes.html#major=
-new-features
[3] https://gcc.gnu.org/gcc-5/changes.html#x86
[4] https://gcc.gnu.org/gcc-9/changes.html#s390

- Julian Braha




--------------AiKmJ8XeW8CJXxcJsL6rEg05--

--------------OXKw02O0ZQVKPdopabmDPVkH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavS7gAUDAAAAAAAKCRDElYPCBXNxIFXd
AP97y3g2Ub97AFzCrczSMb4sT2GyzxZRrL1efJ7+kCebegD/VQABtAUuVtuD5BEo+mLgOmJTvZhP
ejIUhi9yx/4VPgs=
=Q2PJ
-----END PGP SIGNATURE-----

--------------OXKw02O0ZQVKPdopabmDPVkH--
