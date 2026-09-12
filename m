Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331C83C0A15
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789207405; cv=none; b=AeivHPrvy7lraE4LaInYgV/l5cIHP5a+yp6Rb6KQa+z5rOe/gjgww/Z+KNKKrWx4kJuoAPsWW/Q/bftP+VvUv9jqr8b+kIlbw9MQ88TMVMBu44xFDJ48ui8Gz3bvxBZcgAuTcKmnW0lG5J7CiRA54yhs41a+de0soCdhKHZ1PwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789207405; c=relaxed/simple;
	bh=8sojs+se8QPBJyJ3S7gUk1OtieiG2IMnEQyGHnpeALo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2L4V9jFWLyhXC1OXir0sU+9qZG3SrSYeKxQQGb4QKSFZ4ki+qXVrxgmg2+fNIBWC7NeuqcaVWjGE6Kr+VTnwhb6fj3fARANAc/l1KQWxMgtRDUTZiIN/xYY+rvMzchwAEi9yE/9MrG8NqlmVhyCPKU4Q9vkseWeLs+hW0SzN0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fe+AZyiP; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fe+AZyiP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so264159f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789207400; x=1789812200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78QJrighesf7VQwGx1w3HgeMelr4wZOukxrUbALylpM=;
        b=Fe+AZyiPJOfMvfVWNuDtyAcWTVKbBm96f/FC3Afm6JLZBHlBx4RDyqfVRdhFrVnLcu
         n4w48wdDXiNehawYgSXj6RD10qznhIwlXp2oOKq81tWWQcrvxbZzbDpLoCKjGmThvW5n
         kuCdUk/zDHrjp2P8fcKrJCIIptcNIR9aAVXgQITG7+l0EDdMQJzK1hv9Fhm1dzDDpJjr
         sX/pIp21teXMpdb2inVRL30AHaleM1Yuo4FVYGmeaLlbXvYBIVwd30kdVsV6ZMYtdNk5
         RJUK/36fQ0Yjypq3Y2OzYHXDnBliRbq6ba9NaXMK89x1NGAILWj+/oOeA3oS/cZnbvOW
         QfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789207400; x=1789812200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78QJrighesf7VQwGx1w3HgeMelr4wZOukxrUbALylpM=;
        b=f5FNR8YIHYA+fIBzaJa0wf9FW7/TZro0zPW3OihQUjKPlJfuE9UWsSbKkmvNaLzGwR
         +djiH+K4hPzZleQNrdXKoN0hp3kv8RHfdiH491RhXrL75vJjm0w4iC6aVlEiSq2CQuAu
         gW5bQWi3QDGvLGZXmpTmjWJp9H5ggU/1O8c8Na682edfSWUl8c5dbVr5Tr1J59wjq4fQ
         oVT1KMe3x7sxYX80n+4uGEk9vTFydUO1Z9AaJerbEkXEJeUCTxE73LV0yFCbaG4KJALi
         ovY+6yM0qoSEcsk2/HmC4Sqam3XeHokAYf8K82LSgl7HTz1hb6WsO05k1a05jf9bv6+R
         G1jA==
X-Forwarded-Encrypted: i=1; AKwUvBwSQnSLdjWRyIHvT8vW7864kKKrX+8fjoeYG5kIycsm8ICCqRsOERdWm8eZQBiRh0+gtOe4EHcOu8vR/uY=@vger.kernel.org
X-Gm-Message-State: AFuF++l0LHMsJ934RQCAnb2ZUB5Kvb3VKpxlGfDpqbHaJkXlhCxhrYOk
	rexp402BdO5xoBhPjAXHtdi5lB4MQ8oezn5AsOXovnxx0LSkNXugiKNo
X-Gm-Gg: AYBFou0uNrmQo0aQzj4bVIMmAHuuzV5l+KN7ig3Kc49Fc44SaInoajSIqLXxCzdgMy7
	dSAeThgnK0LUZOwwWfMXJtJ9w86Kqz3/StUu4oDHSz/aNeNxZ6tfVmNt9QJGSACPmIW2HMFR7tL
	C2Hv8tmHUo8YGu/BDVyEU45ghhjRyPeorc/31X/Pc2H/Y4AaGkDRr9kcA046tBiwTxHVhdRAr/H
	/FAWqZ1h4sOjo/8Un/OLmfz4GvXGsTRPAOgY1ajT7zy3EgFPTvhZsxcGwEGIYkyMjWl1JOhZbXN
	zGfMZ+K4PPkGHrmEpbZAjp9yIc77HqIZdLqjDkO/Pr0nvAv9eToiquCG6qb8Wi/j8bzh60paueK
	zDr6noCUFGjUGgLe0MzCOIMHjhMHq5G7DYWbMQ2QW/p0DDbF5BQckufSEoJw1s9l1DugWTpdiY7
	K62MrrTYyhxRsPfnqxMC+hu2glqTJtdHrQqejonoUCLBu86uZNkl4adXXSV4IBcJQ0SFAAIFcGj
	g3gNxyEtk3rKZEQeoGvvqb+nycjLC0tQP0qYTFYRXp6nU0=
X-Received: by 2002:a5d:5848:0:b0:481:512b:f0e7 with SMTP id ffacd0b85a97d-486f6c0a974mr2053384f8f.17.1789207400506;
        Sat, 12 Sep 2026 03:03:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm7428212f8f.0.2026.09.12.03.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:03:20 -0700 (PDT)
Date: Sat, 12 Sep 2026 11:03:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <20260912110318.23bb6619@pumpkin>
In-Reply-To: <178901395292.3971858.13236774094648272066.b4-review@b4>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 09 Sep 2026 21:19:12 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> > diff --git a/init/Kconfig b/init/Kconfig
> > index 8583d9f06c52..3c92c87254a3 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -144,6 +144,44 @@ config CC_HAS_ASSUME
> >  config CC_HAS_NO_PROFILE_FN_ATTR
> >  	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> >  
> > +config CC_HAS_ZERO_INIT_PADDING_BITS
> > +	def_bool $(cc-option,-fzero-init-padding-bits=all)
> > +
> > +config CC_HAS_NO_STACK_CLASH_PROTECTION
> > +	def_bool $(cc-option,-fno-stack-clash-protection)
> > +
> > +config CC_HAS_NO_ADDRSIG
> > +	def_bool $(cc-option,-fno-addrsig)  
> 
> I am generally in favor of this proposal since I think these checks
> should be cached by Kconfig where possible to clear up running them
> twice. That said, I wonder if we should pick a better dumping ground for
> these checks other than init/Kconfig. Maybe init/Kconfig.tools or
> scripts/Kconfig.tools or something?
> 
> I also worry about backsliding and growing cc-option checks. Should we
> update the documentation to state that it is preferrable for these
> checks to live in Kconfig so that they can be properly cached?
> 

Thought...
Can some/all of the checks be done by running 'cc --help=xxx' once and
parsing the result?

Although I'm not really sure that shaving off 0.2 seconds really matters.
(I know the little bits add up, but there are much bigger delays.)

One thing that does annoy me is the delay before the first compile when
you do a -j1 build. I've not looked at what is being run.
This is all made worse because gmake doesn't stop on errors very well.
I fixed that in NetBSD's make about 25 years ago.
(IIRC it mostly required always getting a new token from the pipe.)

David
