Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61EA55C1D6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958769; cv=pass; b=SxKP6Ngq4UYUaGXv/bXJ/bNbhxDwVrulU2mM+h4xIC+dO/I409B7OB2UtIHteQ3a+eG5k98GoY66wcqa7ucOd+w2Yg+lr+4tjDoPEKf6Ix/jinj/QbjWYEyLdRzcYaCER1rXU8ufYGhDkJLxOhXeCf2A2r6B26vHOhSKprfjJb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958769; c=relaxed/simple;
	bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIJYKcfRf71ce6TwVY0smmc5ryrkzqzo122G0M9jnksBghu14f5uS4Luuk4q/m0KaBZfIH4quokkyvFX5hIT0FdiukkLK0ZYW/l+waL7EgYkCXTNJYHDWsTkOn7/acuebCfzFjxlDt59Dp+2rX/ZJoaOdmX9Oi5M9iHwBifM9ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8jdgobp; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8jdgobp"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed444so650373a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788958767; cv=none;
        d=google.com; s=arc-20260327;
        b=rxtnIcH1bttQF7xxQ3HBgOFLhlU+lsTMYAIRYd9ccpyEozUe2L7hpLPLHDhdypxfG/
         9IyiU13QQpImOGs82CqsHH6uBJYT6ybd3PEv5UiQwKBNsycqzBcf4hapc0K7Hx3g+uCe
         ZNvxf8DW1toiqBwA6LQE5GIQ57OJ7Oab/PgU6uOfFPfUQ/BuBy4bRbPvEA90//tw9Tbp
         4hndw4UraveIDkz4hK3CXw5RT4xlxLW8PtUdh1skvrmI+xg52N8MgS5jYM9ueAx1DWNk
         hbVjKvzbRhi/eGdZd0/8OFwQaXjir9g2Oml2XuioY8GD8L9VHAUTdB7ehgbqxBIoGHlu
         Yk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        fh=vS+oj4rKbxGqDYmDjb/mFbUquK48h4OvzTebcHhqtRU=;
        b=V4tnczw7RyzHr5zaQVYcFsgaqp3HEKV+H1vBgNitW7Y6zePevUUxotw+3FC/KGptWV
         YcQwth77qfTi3LWKcpqe1tYUo3POKUKWrmModpouVsGygXvurA+ZvNv89aniljG2OLYw
         CZaechUlqGrPLL4PhGI35dyxNx97cLM/aJHOcWQe1HXAIY1psSO6i8/3K9tNYkjhRXxX
         trHa/nVgX///hl6RvFs8ToKk7tRhCjI6LOJ3BXUx+64x/R3v8gttxqYBQg0QB53pO3SI
         djnHAeoq3t6K4g+9YHnJepSnnhTnTt1oaNSZ8nKV2CfUPjuUlMKJVYDIrNAIQmw/Naz/
         CtQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958767; x=1789563567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        b=b8jdgobpf6iJotPCt++6HS1J65D8oOCUtiAvw7bxOnm30uNVMENIz+xN63rhab1PO0
         6SWPMFrF0x9OzBV7nwBlofsQ5UfThkTqMOmSPh92d3YqDnSXPLgxyDRWyGwrZEIKgLQa
         egJuvXBIulCz1E5U4g1z5I8qK6yWEnim27+7z20Bb8G1gx9a2ePzK8MgZKNGIwPT4GlF
         zNT1HFz/e4tw/lmQQGBBUVDnsB/ao0ANBTLj74hLGxuScKDR3huGLbWQl9+eBdN/gA2S
         Y6P6TaJV9MdyCXmG6zWs09pjhSMycM/SMVSA463TU8mBqC4DxhQtCT9Erw9liO2TDGpJ
         rhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958767; x=1789563567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        b=eb8UqAO0lGRijkbRTkoddoyzFLS9l3FcNIRnjBs8eVMCeZVILrXSFhumXS1Gb4QA8h
         +2whsF42KMsKuDgm02kheVezR24zoGd0QmagezAYSq0xPLZXlI+24dCRIgOaa6cIjl5Y
         0ZJl/llW32m5qbWqtky/W/N1BwAQckwo+NHR31s4sqMmel7jQLeOoWS8tsQ1bJkOxMsc
         L9Maq0NvekXTw+CZ7s07/UjDoGzTBaWzkH2G579yXTf8qLI3zKHHK4t/N4jA6LE2GZik
         Jg1v9hYERQ7ikKY0Ifun94qnebXVDMbN0wqxu9g/lFioXYnrkmoNCGm2O9GOxYwYKD3O
         za4g==
X-Forwarded-Encrypted: i=1; AKwUvBzEIYqbbhSrRm9vQJuSp581oekoOO6/x9wI76fSARm4ePyE8ztKwszIe9NVEND5LBe2XpH6/JZMJ4g0dUY=@vger.kernel.org
X-Gm-Message-State: AFuF++mRMb4lB9fCcHPPqt4amftsAvTsuituLb4ZitqFheGrank1N6T3
	REImlaNg+XGRs3x7IfWJCNMLw3YD5/sohBN3R1Ac25B7p3El/8srw9JAow0BWWB6YsOR8SaXXsw
	oOIUeXgXHIVtpBywCK+VN50Y0wfaxqJI=
X-Gm-Gg: AYBFou0yHAxuLgmM39alsvgPQxStbZYiuNZxXZ+ZKU1yqUb6Y8gU9Z2HNVD+s2B02Gx
	QKJdSaT4sHzuBcTkjUpAWOP9bDcGS1DO/813sJ/53N5z9C8oBQNFn6e5m7wWof5IIRWy6A/uVZw
	N0hd6GEAT09Kg/Nrnzw4Fmp/CJYi3CNA5zFkbuD/sVFK/O0/Oq5ztAC5qkSSz/x+zY3eXpSb3Xc
	Ajz+E48BgULFmXr2GRXDvrGaFXIshk69CDs1nfMLZ5sW2VcO96/0tIoxlTYoIFUCsxucJdS+cot
	Nf9m1XCX+JsPfrwMhmsjoykqmZN0kRxD7F1sZzIRZMZgP4ootl7jau4iV/viBN/rTO98+1Q8rHS
	fCKXEheRo5t/uzouwKbWr9obo+vhBcil0jiLgA8UVCtrmgs0KSFJ++ZkonQrXiuj5pdmrv7GBbb
	gzpFW1g4Y+0VFYc9QmFF6rroGUAHR1+RSdUtnTc7iYFyZQAsB8XdU=
X-Received: by 2002:a17:90b:2888:b0:398:cee0:67dc with SMTP id
 98e67ed59e1d1-39b2699849cmr33697284a91.5.1788958766896; Wed, 09 Sep 2026
 05:59:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org> <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
In-Reply-To: <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 14:59:13 +0200
X-Gm-Features: AcwNN1Vwugoxsn23N3HKo79fRO4c4hCKpdWpUEii2k3VTwCoJF2DILgisLp6T0w
Message-ID: <CANiq72=rUrjFD8dHggtO5g0D5Yu-LjO4s7t=+yoKtteD56KfXw@mail.gmail.com>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
To: =?UTF-8?B?QmrDtnJuIEJhcm9u?= <bjorn3_gh@protonmail.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:22=E2=80=AFPM Bj=C3=B6rn Baron <bjorn3_gh@protonm=
ail.com> wrote:
>
> There are still several known reproducibility issues for the parallel
> frontend[1] and at least until fairly recently there were also deadlock
> issues and incorrect errors[2], so I would not recommend enabling it with=
out
> an explicit request from the user. Perhaps even only allow it on nightly
> rustc for now, then you don't need to check which of the two spellings of
> the flag is supported.

Thanks a lot for taking a look Bj=C3=B6rn.

If there are still major issues even in nightly, then I would say
let's not add it yet -- some users/CIs are testing with nightly
routinely, so it is probably best to avoid surprises for them. (If
someone wants to test the flag, they can still pass it manually.)

On the other hand, if there are no major issues left and it is just
reproducibility issues, then I guess we could add it to help figure
those issues out and avoid surprises later on.

> By the way, currently backend parallelism is entirely disabled due to the
> usage of --emit obj (which forces -Ccodegen-units=3D1). For -O2/3 builds

Yeah, we even set `-Ccodegen-units=3D1` explicitly at the moment, so we
would need to change that too (and likely make it an option, because
normally end users will want the best results, while developers may
want speed of iteration).

Cheers,
Miguel
