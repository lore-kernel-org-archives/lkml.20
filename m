Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E804F93CA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665674; cv=none; b=DtSTd5qL7N9uq/bIeSV7lOwLHbckCxsSRsgWejlhKEFHcyH55M43i8D69ttocj3NpRAo8t9RGtL107dcfrZKouwjAMzDST59Gk/woSnMf5/Z1SvN4sP8OrhmgV/1rHKIOWgRbG3UHulOA6AtgIipoGOgrlHSZKJHIaSCkNW128M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665674; c=relaxed/simple;
	bh=biPMv+ofFeAlNkpuoiheHfcM5OSqeT3TWtGH022bAOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTU4NHwCqaJlWoBcLT+zx/LgathCOEwmGLdYArR5cDA9yvk5VNJLz9BpzsIEo1EgfFe69AJK+VXc5MMGlnK8VTlBOm6ICRQ3QLaWcWAgVhDpFllCGtDK5muW3HsKAo7brEUgCmuVlicAyN+0M2AZGQsGIaXNKxk6Qi+KWmOOc54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Rrv5MY+9; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Rrv5MY+9"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so1406052e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789665670; x=1790270470; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCKe0geuwZYO+S2TeH6s+a22CWM7gde8UuWVtmH3l0g=;
        b=Rrv5MY+9gmPu5/AUcAIg4Dopl3yyxp5fe/Vwe09O5OugZXq7CT3C/I06xe48F1oCUb
         pW+zKJs24A70o+8XYm3p1UKtnu2eRoqMORNDLDjCRyH4sppsPu4xrUd/8rh7enWIHWvn
         lPRJT9l92XCM8+zn6w1pO4OAgtjqclEsq0TyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665670; x=1790270470;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCKe0geuwZYO+S2TeH6s+a22CWM7gde8UuWVtmH3l0g=;
        b=SJsfx3HwwXQaxyaVhPKHou1ViA1vKIuX98cnS3NBH/hp7kkVUkTjB+/K8hL41PzNhe
         InThZ2YzvOKsEy1+KsFEscPSy7l8puHADuK9lvua/vvakm5RkYGLmfQWPDLDXpFqZgh1
         a1hRxDphi7Z2GfgqiO1oBhJuWR+BrhiokHjlKr94kDWh7dr0L9B3hXqNthd7KNDePrkt
         7z5TgquW34MpgUxSFQ0PudiuZYyiHCJj4l8B1i2kEVq2WuMbFWCklv7k+nWh8dc4PcsA
         63lqqrbOEbys3Wsj7Cpwz/8Sl6gwp1LOven6mOy2kG6yW76RoVcknJuyr9cvLPoBAnRI
         B42g==
X-Forwarded-Encrypted: i=1; AKwUvBz/XsD5IUKSSfZ3VyRO47dW3Bi3pI5vjB/zGfw1t3gUnhnKbZOLOOFLy3EQpcJwZB0RSUd3+qwnnl6iOQY=@vger.kernel.org
X-Gm-Message-State: AFuF++mTNQsohNAaia2V1Rtbuq1HM+1awUC9Xsnrh/CO+h2bjsyOLC70
	k832j7qJllFmP+RZMbsVHc6pWZsH89z1LivGKq2GLvVaYJXeiS7bGxz18qZ0NRdBIrgT8Sb2EJ6
	xleQK9Vq9Rg==
X-Gm-Gg: AYBFou1YiOSLdOAb19x4M8lQZQwsZUP6R5I/T4opTNEqhf+zmWpEkGVGx7Oq3VRPdhQ
	DacXtThV04RME+6fA82XdgGDMNhSG+Zp8baUbvLFcf6PD1RwwHtAqITmPLCY3UMrN3QjuGLAyy5
	LrMLWs7xvZAONdMGE+0TrmkmrqeOpQBh7Zs1SNuxpkM63Corv7DE/bWR5xumGoCyj1pno8ZcE3r
	i3B+sHzKmw1+ipoO0NKo5GZEsx1DoY5fc1/MDcZAwLQrVc6Mfvzpap5kjiVIL+iqHvARmxV6yPJ
	2v0uUgj0Aafi7xqCcLqWWD6/RSlk4I1euqS/39y/nBwC7Ae2Z87aSpcuq6q8v5aWyHUJI/Sz7Zs
	ew3ljxcMpL0YciKSiO/6+2EL4Vnadl8AIBLJHwwRMoBzEwC9ckgaGj/64puzDtu/6HMwh9M/VF9
	1Zrib9hd3WmHWCulLK8X9b+EjYO/tRncK8yrtjfz8r84ciDDRwZMGPhWlFkipRZdjRT/GPdZmMF
	x/W6OUV4NyOSTQLigGC1fGEl4mJob96yohsOeTQr4SRFhozZA==
X-Received: by 2002:a05:6512:3f0c:b0:5b6:1a7c:aa12 with SMTP id 2adb3069b0e04-5b8b664021bmr2382108e87.42.1789665669676;
        Thu, 17 Sep 2026 10:21:09 -0700 (PDT)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com. [74.125.229.205])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57cc9fesm2063718e87.44.2026.09.17.10.21.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:21:09 -0700 (PDT)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b74d0133e0so1023977e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:21:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3ZEJMJiAA/eISjetGU6mWtZwWYSfI5a7tcIIpdjND8U6nL4UU9zrVIizic54xUtdvksaceqPm5pOyheY=@vger.kernel.org
X-Received: by 2002:a17:907:c1f:b0:c12:e178:9e68 with SMTP id
 a640c23a62f3a-c29e5237e9amr501417166b.19.1789665344119; Thu, 17 Sep 2026
 10:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
In-Reply-To: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Sep 2026 10:15:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
X-Gm-Features: AcwNN1VkAmOFPymjE_dcKSWc6Q8Z4LvlbW-9yRGSGQmATfVxYq3jdlUQ82g4gXM
Message-ID: <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 09:06, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
>                 == defconfig FULL build ==
>
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc        32.5s    26.3s     -6.1s (-19%)
> Threadripper, clang      34.5s    27.2s     -7.3s (-21%)
> EPYC, gcc                28.7s    20.6s     -8.1s (-28%)
> EPYC, clang              39.8s    32.2s     -7.6s (-19%)
> M2, gcc                 519.3s   512.4s     -6.9s (-1%)
> M2, clang               634.5s   569.4s    -65.1s (-10%)

There's something odd going on with that M2 gcc build. Why is it such
an odd duck?

             Linus
