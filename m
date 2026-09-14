Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1F1C84CB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401637; cv=none; b=nDf3F30h5Wps+luGgTaS3sUyqEvfij5SR7UTL6ISXjVAfa0u7RNB/qZp5D7rdVrz6nmVhJiUuMqScHXXZGzaxTsN4DpIYwB4zM+AwJG/n1WicQFbJtzQaZS6xyMwxGpQXmfF+nz95I/69MEGNMz0PQmkwEY3tB35Xo++TjoJrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401637; c=relaxed/simple;
	bh=xMRNGFwT5MG/tN2Z4rVlgZAaGoxD3wGYA7E+SDFQua8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rA8Wtyi7pSNZHNHBqZgmPp8QNhZDnE8niUEWXoLijzTaS7OGefL133y2YFIQFz3mon82fDGQHsyj5UMhkZvW6R8cDqjLytB+RYI1InLRwPZBRPTvk2Qyyt6iD7uD/zTizMD5mP4VRNu/L/ViZYzTJfKReDjLZUy2iFyPepLqDbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aDGBOHjY; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aDGBOHjY"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so409280166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789401633; x=1790006433; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=aDGBOHjY70gess3IRaT7zL9GXTve7UDHZ8AcWOugz7toUNlO77JgyKN7B18kAM7Hu/
         NVA5zftok0nvdQ8cG64AYn5Fu+ldcQhxhrT8Y3f2yM9WkG5vtfSEO3k6e15T02R8NrW9
         2EWIdgT45Nuf3yPOcfElmxYpPnxCJPOPubv/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401633; x=1790006433;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=cwMOJIZcULIR5I0OdmVF/sIGgY1mXZIr/jif+e7wsw7zh7vD4k2p4UL7znuy6DF9VG
         tvBpLvKSYV4F/4mqtgxsyL/H+3atPzVhmr6Y/PGnsQIphPPnUUfLffyPVGl3K2qVpPNp
         j11wa5q8bvcjeWQIKXN2nQERHj4YgpSwV6wcApEg4PxsvXHAGFeXdGs2MIfyouXE+P0o
         4XLhD6JZQBeF+mD8DzYcimGGkrLS5+GNvyz61AGwqNbPb8YFDykeMgWFcXCsAgqzL/m7
         PqskrdausmSVn774xUEqS8f7EVSk/Isk+mFMEY18ncPhL8TW3jV91vtRVON7ZDqTOOuO
         UvIg==
X-Forwarded-Encrypted: i=1; AKwUvBwUNUnvCu2F8DAYcudzOAW/6mzLJ1ku7np7/Mhbt6gEy4V80yZ388RNtMP6Eb266hpOIhjqu9nAXo17/EU=@vger.kernel.org
X-Gm-Message-State: AFuF++kM7Vd2nRFHszSu52U7rKwMRdcxAe8MBmzXuCzuAFI8jI/05FO8
	eJlJiO8CJjyGy9H0nK2l9aomVKFolPD6eM4bU1GKMSgNLSNlHxO6tpwLG3BBI55BOlpmFPOgoVL
	0w2yJlTw=
X-Gm-Gg: AYBFou0ZAgV+optbbwOOBRMEZE7eDEo5+EOtylQCd9HC4v8MiYzn5RiDcGfwkysi1ch
	EpTVda9kBroqu6mNoaqZDOJyUoBIrlmOc4PQFBBVTLl+9IwyyRO7EPaylvVIsWsTy0ST5kbTCM1
	TetlNlmEsXJZpFAxSUjImXa5/0PMS0BxUQc4CQjeo7N1wPCjfryH9h6Pk3k/MpQRxxeVezhJVoP
	AV78QbvQt8a9jc8Z5fbYrl9FU1ncTHw16RmGhUPPoIefCHEjBaJt+aHCVDZfu9uzcMOxab87pL4
	4Y5PZzZuf72jcCp4aT23VeZ0aAuJ3M5TJij8b9RJnganUxS1hVtY3fP5ME2r3+1rbwLML/3697u
	AAcEf48e+mpfPxtP3kDzmRYLuaY7K9plwt3T5AHVe8l0LhzbsBrOIk0Snew1F3vYHEYPB51o/K2
	0hUl978YPj04RRBM8fdL0F053OvsUDwYcBylmZPsPWwju3LPlkmbO8jc2fX40UO6BcOai6ISGz2
	VxyRhtAQO424faaGT+LYerxaG7/mkt9yEox25pi2n0RHU5gk9VzKSGcYg4Z
X-Received: by 2002:a17:907:3e1f:b0:c26:337e:7e05 with SMTP id a640c23a62f3a-c29b84c6a93mr418209266b.4.1789401633351;
        Mon, 14 Sep 2026 09:00:33 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8acsm464104166b.5.2026.09.14.09.00.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:00:32 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso395248766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqYR8KRykyLa9AeSCmuRRvyRMsHQ5mvPvVYydNs1a7TcYVHzO09B+9HBbbx1/8fOuY824V1uFC5X9P5RU=@vger.kernel.org
X-Received: by 2002:a17:907:3f9f:b0:c29:444c:8f28 with SMTP id
 a640c23a62f3a-c29b84c2597mr415053566b.5.1789401247404; Mon, 14 Sep 2026
 08:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org> <202609140833.88C0E16E50@keescook>
In-Reply-To: <202609140833.88C0E16E50@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 08:53:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
X-Gm-Features: AcwNN1VyLYI7E7T_24gtwZZHDPdmXi1EUi9s9xthPRH35xQepEwWHVnUZ8r6fdo
Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] kbuild: significantly speed up kernel builds
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 08:41, Kees Cook <kees@kernel.org> wrote:
>
> One area I think might solved via an LLM is the 3-pass kallsyms stuff.
> If we could get a deterministic kallsyms build in 1 pass, that would be
> very nice. A lot of people have tried, but it has eluded upstreaming.

Even the three-pass one hasn't apparently always been entirely
deterministic. We've had random reports over the years of it failing
in some circumstances.

Maybe we've fixed it all, or maybe the failures just go imperceptibly
rare. Regardless, it has definitely been fragile.

               Linus
