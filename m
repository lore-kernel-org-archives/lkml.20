Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129AF569F28
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966435; cv=none; b=WSK/5LcFTn4mSf2subnkeDtZrHE8Flb0StRjrXfXriZhayQ4nJD5ZmDyVi/Up0mCFaka55sHHPhs/AfZkiDp0oprsEqiQ8L6QkFPA9hrr+lQ+t6GRVRCaGq3EhF5nW3y+oQIAErpFbJR6lJYuj/yEzjC1FDRSRvST3HQYKy4GNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966435; c=relaxed/simple;
	bh=qF8PC9Ug90yk/PrOmZBC0YqOzOPUdR+ADtjc56MP5mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdshwlHVcAJbrCUYv48ukXJlj7fkeNwaWITCC+ZOvSlZt2eJAFpLnPLnJ0aKtjqr4w23rVBbO9c125KLPBX6bjhGCtu2wQoQxqNwgdhdIhFk6YT727RSaSuaWAHg55KTSUOQk/LyINzvxFD3uSpKEdV+qlc8ubqkqJ7zYewqfCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bW2/xx6q; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bW2/xx6q"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso15493266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788966430; x=1789571230; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=bW2/xx6qofrysgZ32+wO6tn8P7yC7KJuO/8fIhuQE0XHFbHJubtvr/LdZ1dpqbza/U
         5sEOdPgLh3yTiFDy6/rc9fJ1lFoy5XAcz8cO3FZ5+DqjTg3Nv54qaxxCAQ+f/+WxZoID
         4RMUNNrlOYx4zBMY4olzUK+qXppPQjUoI7SFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966430; x=1789571230;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=sLbOfppb0xX0/7nfCDPjZDla5fJBQ3fRvZFk8jevT0R9LqESHMMFUGZlmruRugLH0c
         C6aIWaNFWdbc4WwfZBffxn/7cHFvGLqMJbEJ3uUio3XhGJCxS+vWT6w9kboonLVEaOAs
         tmh0Nn/6QOBBXIaWd5Iq64CmHrj8WDBjFOahbNO7mgQ1gmh0w2tPkkgh2BL4vB1I9HaY
         9Vq33XCJP4J2QByeqiZdjV2U+XDs4buICOmRpMQ6wLSFiPSpyFfLwD8AhMsTxmFURgSW
         tm9Q9ie33SArCVvAHkk9LOA/zVPrSnlDyxgVylK/krgz1zcTV8CfGdGwsW9nX5YLSBEs
         uM0w==
X-Forwarded-Encrypted: i=1; AKwUvBxAll/QR7qqaO0jPUKntfG8uEnKcnNTeqVnl+76xBluQPeeIlBhA/ue/LFRdKMFkNHU/cpLPEry2ec36cs=@vger.kernel.org
X-Gm-Message-State: AFuF++n4WS6HHnq6lcDfeprxdBON2n2U/AZBoswx46TmWegUN1dLV+t0
	ZJdg59EC7eyMkrk0TNv8uEI50PL34gyRzqdWoYxglg5ouXvtAuCngRy2PPWYx4S3G5VJhsts/aH
	1oFToEY89+rcL
X-Gm-Gg: AYBFou1qBp/7d/V1J5nTzZvUgw5okHti8fVGh5Mae3EhnXwk6R0d2KXbJPbj4FKTP8N
	iimE4h1UVo0UYPkowZcjujfKg/lhyEokGfqKJ8DzgCSeKdr8YcO/4Frq3icR3QsqGvNY31lMmCi
	vUDrGvzQs+BKA6l/1a2CjvrxJDPbTFKrjOGlha9JARdAs/IFH4Rjwv9/GX+5nuO/3EvQ0mVAjVx
	sHZ5aBf7j7qB8C7Utm3I7cKB94Ceydof/bioGSFBcqmx7JRIq5rqhkq+47y0iI+s/v/jeyVHEWB
	35JVN1lqOo4E2J/ponUXJBA7td3mgfIwfI80bl8ElsHrf+u2zMTNUoDVsqI/WwWnM6oqu2oJH8Z
	jW7Pa0J5RiZjXSDtfn5pba5UiSVV6sR77ni9kv0PdKm7NuI8NM2Lzp2csXFATufJRlxW5MQjSf4
	QFpT4f2iANXVRcWktitc8O0vaaRXQfDRQHrw4TvotkIcTjgbwZtSRZDo9V2rnxPbszURnHYN02g
	aEgME6JzcoRqCp5hfF08w/axtWLRw==
X-Received: by 2002:a17:907:608e:b0:c21:34a3:4df9 with SMTP id a640c23a62f3a-c2941868b06mr72157966b.3.1788966430451;
        Wed, 09 Sep 2026 08:07:10 -0700 (PDT)
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com. [2a00:1450:4864:33::10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036440sm796752866b.5.2026.09.09.08.07.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:07:10 -0700 (PDT)
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso516497a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:07:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwkpgc8+h/9O3KyTIJRTZV0uVfWaTL4u4+dVKNCujrx1IcraQCrcw6ZpyR1yLQ8cf2o5EIl18FycDGXd+E=@vger.kernel.org
X-Received: by 2002:a17:907:728f:b0:c25:8e4f:6d84 with SMTP id
 a640c23a62f3a-c2941868b12mr66185066b.2.1788966011712; Wed, 09 Sep 2026
 08:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:59:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
X-Gm-Features: AcwNN1XmVo334b1UP-lcj3CPx7zvteJ2HddEJqKkfbem-zQh2qUu9HycJHabLtk
Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
Subject: Re: [PATCH 15/23] modpost: emit module descriptors as assembly
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 13:58, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> modpost generates a descriptor for every module in the form of a
> <module>.mod.c file with .modinfo strings, the __this_module descriptor,
> exported symbol tables and (with CONFIG_MODVERSIONS set), the CRC of
> imported symbols.
>
> These files are compiled like any other kernel C file with all of the
> -include preamble, as well as including linux/module.h, header dependencies
> generated by fixdep of a few hundred headers, an objtool run and if LTO is
> being performed, a link is performed to generate native code.

This kind of triggers the same reaction as the kallsyms code: I think
not including <linux/module.h> is probably the biggest win in this
all, and precomputing the offsets of the (few) structures that modpost
uses then makes the whole end result fairly trivial in raw asm.

Fine.

BUT.

You end up with things like this instead:

> diff --git a/scripts/mod/module-offsets.c b/scripts/mod/module-offsets.c

where it generates a header file for those asm scripts so that the asm
generation can do things like

        buf_printf(buf, "\t.size __this_module, %d\n",
MOD_SIZEOF_struct_module);

etc.

But I - again - get the feeling that this is all going through AS as a
silly way to generate an object file, and that there really isn't any
obvious advantage to that side quest.

Becuase no human ever wants to see that asm file, and it's no more
legible than generating the object file directly would have been.

So I get the feeling that it would again be more natural to just
generate the object file directly when all those files really end up
being are a few symbol definitions and a couple of fixed structures
(is there anything but the magic "__this_module" thing and the modinfo
unique ID thing?)

And again - I feel like nobody sane would want to write that code. I
certainly don't. But if this was at least partly automated anyway,
going that extra step might not be all that horrific.

I'll also be honest: part of why I do these suggestions is that I do
think it would be faster to skip the intermediate assembler step, but
a big part of it is that I don't love the random turds our build
creates. Getting rid of the *.mod.c files would be a cleanup of our
strange build.

             Linus
