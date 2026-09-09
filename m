Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48AF48E0D3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964539; cv=none; b=XqwJCgRm5rKOyyH8Fm3BjGYQN2Af/HA6b/iOO0Lo2UsPhsR+Jpo/0MeXjJFp1myR2smLSldWcwl2XgpjaNQ+Er4QjYdoSxo/20YBkLf9PTx+6xIg0OCWcqd+zl2y0bDiJxZc3gRdMPuaLV5jSRZaRWngPThZ5xolJiUd9b83twk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964539; c=relaxed/simple;
	bh=C8wlVunptoThlz2K9sFX5JRkjNXNpZt+isVUJZEm52E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qI1sf4TpCqN6nzG8E6icGeQzSu7RWpzU1EVvt+D8lYzzzs8LpT3Rdq6ku1M8vDJqRLoGwosxohvv1IjC63wSnPbC1Gc5UBnzNzCELkHCKf//tzaBX2D4qBCLHxItE9z9NMfcwdEPD1CGO56lrZuramMNnyaHIgNxzGXdyOq2kHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UNmRTIL6; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UNmRTIL6"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a68279dd86so7447788a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788964536; x=1789569336; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=UNmRTIL6mZKPkaFrR5tBY96hQrHbkjAEPvpUDTOaqISVDpbPjzl4fHcEF5CNzZc2tm
         lrRybIEeqoqmCa9wiFa2evcGsby7e4fxrvtr+Uv4e8/BGjOj4/1MJKkLzMFv5N7wdRZ9
         /txoOJVL51XNYVhqP7qU5OgyH2OpK0gTecXIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964536; x=1789569336;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=WWw1JNApiaEdXY276A9VLiu9LAsUQOfNp4IWtuX9b6RTerymvFWpvkYPs15Lnz8rvD
         1tcPOTdFpFHa3H5vJcnL0xX1r9N43EqCcJeEl3UG18hyxO204jKMhLzgdkm8K4yQs4Fc
         xH8UBP9DbGMLaYvkk+1pc6vYl1MnHhKOVh39s++e+LOS/Dui69EtDL40Uf/xZ6Hyd12P
         mETunSSA/WK3p6snwwQRoJPtVJSTuZu+Y6Cm+S/frnDMn4AygYWj+rwIrmD7p9ReCU/W
         ppJpdw/nkw92fSwTdDq67fv2TMi9yzDPirptQR4ok6FfySV8g75d9VmsQQT/ba7Or0QU
         uTbw==
X-Forwarded-Encrypted: i=1; AKwUvBwHiupAP4gWvLP326Ney8BkA6+Q9sPghtaKucsezedmwNHIAhCHrtZ1DPzATcs6XRp9kWi6ZmBxrKm66DY=@vger.kernel.org
X-Gm-Message-State: AFuF++nmfQm54YaJk8Mnxn2mapah8/mHsZzIljuTKbiOK3LDulYTOFvx
	rARiluy6fyFmaDLZo2gQTzy8ZjSma+x8urilzhteTYm5o4v1qC3Ej55bQdpYRNkqPeXZbdbwusU
	N0DJcWeQ=
X-Gm-Gg: AYBFou1ShbSVDlFypHgGw49VSRSr7fMstAsC+1/V0dZ1MkBGtqG00jMdwQLsUhIY3aO
	PaSh42B/4IGlVB/QQ+7T9xj+VWP6JRsq8pP3WapSTIPEK8431aimHQUOcb0vzbiM6bOvsDhIIzc
	0GMuQcPaxFuz13X8saXkZIgzSoJMv8tUoj3yxlhccN0lwh7cj6lw8Uj+p64HWtLU0Y3ICYzvBiK
	dAtvFdUXfmex1V1DG5lbYLo6sgniz2ZrfeC12op9Pm54zYjaL8UFIB5E+2tthMrSRBVWP6pj5FQ
	FjuD9Xo0zVx0PR0HFh0Hf1uEsH+ySODhWdUvlH7J3WAKZdG0cvGWTWIh6jeQ9AoZTO/E3GmzFnm
	MCfYVeNo52D4Pr4vpjcWpjNRj1HGtkAw1TM8JuEHEK2Z3WDaYHXH5MDCQn+iwF5iEAFu1kT3d2d
	4BndJY3SwOoFA/f29OO9cajqPC+Bj493lO700EFBpIkp45JVJizEzlto+eC9Lsa0MIviq3ZtFJK
	qrXcuZN7vpwGNP/JeaVf71zd36pcZNb9egWzDWRXNoJAJnO
X-Received: by 2002:a05:6402:530f:b0:6a8:d72a:3b1c with SMTP id 4fb4d7f45d1cf-6a8d72a3c6amr3612584a12.45.1788964535980;
        Wed, 09 Sep 2026 07:35:35 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a837974d0esm2480108a12.17.2026.09.09.07.35.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:35:35 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a9983162dcso953798a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:35:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGj4jsy7uEkHQB9p/mEDrDZDJr8ReeiCllbIVfppbMVRyw/v7CvZMP6AmjuAOVLqJ5uKVv8VB1nfLE214=@vger.kernel.org
X-Received: by 2002:a05:6402:208a:b0:6a7:ee56:615d with SMTP id
 4fb4d7f45d1cf-6a7ee5662fbmr12667373a12.31.1788964533277; Wed, 09 Sep 2026
 07:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:35:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
X-Gm-Features: AcwNN1VOdEagBQA5D63IF5vfBaLV4II6ehpTsThafIib6q5kHaeURBrIxknkBpc
Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
Subject: Re: [PATCH 04/23] kallsyms: output binary data to speed output and
 kallsyms assembly
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

I'm finally going through this series, because I do care about build
speed, so I love the concept.

However, I haven't actually applied it and tried it, I'm just reading
the patches.

And this one triggered something:

On Tue, 8 Sept 2026 at 13:56, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> kallsyms generates an assembly file that consists mostly of .byte entries
> containing compressed names, token strings and name-sorted sequence
> numbers.
>
> For an x86-64 build with 158k symbols that is a 37 MiB .S file which takes
> 0.57s to assemble each of the two to three times it is built over a kernel
> build.

It strikes me that this is clearly a bit faster, but it still seems to
be not really fixing the underlying silliness of that code.

Wouldn't it be much better to actually create an object file directly?
Afaik, the *only* think we ever do with that kallsyms-generated file
is to immediately assemble it into an object file, because the actual
asm file is useless to anybody.

And we already require libelf as part of the build, and we already
kind of do things like that with gendwarfksyms.

Don't get my wrong: I think going through an asm file was very much
the right thing originally: not every architecture used ELF in the
first place, and when scripting things like this the current situation
makes 100% sense.

And no sane human wants to deal with this kind of grotty detail and
spend the effort on writing an ELF file writer.

But when there's a LLM that was used to find these things and help fix
them up, and it's something this mechanical and the result really
isn't ever human-readable and never has been, I feel like the obvious
step would be to just ask the little helper bot to switch the whole
kallsyms to using libelf-devel and writing an object file directly.

I don't think anybody has any deep emotional ties to the current
kallsyms code and that horrific step of the kernel build, do they?

               Linus
