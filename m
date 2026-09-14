Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256FA39CD1B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416419; cv=none; b=m0PTeeDogsmrl6OjINQUW4HVz1aX4JcaCym3mbFx5TwMPo+4nhxMjalFu8KnZM9N+NbaHwpQWMnB/yRPHqv5ZBKSznaCunL3/i5OqKx+Ys8s4lPIEKUu+rNjgE7uxDp6OID8Sy7cbIbF1g2Y2VvFveVEzztnnxNh0I4owphgj1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416419; c=relaxed/simple;
	bh=g8JbSv2uB9OVHPX6mK0/xKaLA1R5JXVM4OnU1gOEgUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhV7zPYY5GQTtsp1KRQVmPUWNYOkBX9EjXYK0HCnVGGRsiWjOmUPK2laUHrriwOC6DBzC859gMEU43JI6xdme8hVaEuGojgA7fWLPz1jM4UTWaRRAEcUet5vAO4lzKM93GDDRR4PckYopMe0pyaKgKNnC1A5G8B1gYl6b31H/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ctPbnhjC; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ctPbnhjC"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso3739955a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789416415; x=1790021215; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=ctPbnhjC5nNkPpyEFHa+xHk6lUSpwN3QndIA1IGic+ja8P9h12Ii2lyHHbUefQNNxs
         qqIoe8XMXjj38UPOYF7zb3gBo8ggkwnN/M64+vnA14PqLGYgNjP+xgMmb+s9BmNu38qi
         BRpEbF2UlVmIo0RX+gLGZF3e9jOzGihI/82BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416415; x=1790021215;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=KRxhq3ntWXTqpx3AZrtz4seKcdGBit0hImPxRWh2EU0t8FSWnB+/vA1hAXPy14pQ+p
         ofF9d5JUi23crd9eD0bDrqSae6qn22pewwZjqMCQ25f4HNjm0pJYfrmR9/OyAVHr9Mpw
         7YfwSLipb+pt/btU2AgucNbqofdTikJ5Dxq0dfoXNQrqIt8vr48gs+JlrKswDN4eMWJy
         covBPb608uH/LlmD064QR6EDIsviypVVIzAkgoCm7g2Pze9ueFP/Po6prIAytc31kkxs
         mrlUD10ToeDCgP8FegS0lHp8hHHN2Nw8LZaUJDFMYusOEonn7v9urwlgp7b50R61mh5+
         vcGw==
X-Forwarded-Encrypted: i=1; AKwUvBxePe4JhwFW5kSsvrialodZ3GCWP1Ng2XTXOcdyMZlg1BYtRbwEYKMyGWkPt7H8hD5jWfhCADcz8K/vz8M=@vger.kernel.org
X-Gm-Message-State: AFuF++mYrssG5YxCQqxfUjKWg+z3GLrmlraoORDQttSI+IJeC2q+Ryoq
	aU3w4//1NU12eTh5p3CWkX6DMmf5/68LNgyMMAJv+NT2LCO5vVZG7wSb2Sxkydt2y8b8Fy2Rtkc
	iLPOkrJ1Dlw==
X-Gm-Gg: AYBFou0Ke0uTobiPiqJCOloltQXa7ZKDJpNHJxM3P+bviY9yvpHrO3eTPN6bZaa542o
	fC4aA1OrQSVb91sl0urNz+1rB+qTOdvdIcdYjxydgzAEyWNkRD3BfCkn3TYMJFHFBOXxK8G/6BC
	arC9hUu28AVEHmHolYktqdNp4lxdwuFU0ElqXoMLTtB75m7lE88OYAjZ+Y+616a0KGB1tEqY5MW
	lL2mlcKNEtbELWemZmA8d1afTyXPzRcNGnce0Su581Uy6GhyJKWmwjE5eGki0MfjWbd0IMA0y5Q
	ndHZXh8OZ4ihpdsAbLO5hliDHTU4B5s1WjCFoiGnCVYDzwsjZxFxLO5lUNd3EecI10kV+iXlHt0
	Cd/RrPu4Vr9eIu5WNRTwKEBrta0T1sRAo9r+DuzVWDDo0SgFSR9E+5dIih5+irVZ5/EZb6I+7GQ
	UjoFR4DQdq+3nVo7YVZ72zFQInAddDEdhdD8ndgMk2hOKMZ96P/XeG3upCmkbK5mIzXrSR60m1U
	uyKSTx4/lbaX6VyAQjnAoLVGP7rbn9f4wjgIKt4QZsYuNIZjg==
X-Received: by 2002:a05:6402:3245:b0:6a9:d755:82a9 with SMTP id 4fb4d7f45d1cf-6a9f626d30fmr2050409a12.24.1789416415081;
        Mon, 14 Sep 2026 13:06:55 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b59149dcsm4876090a12.13.2026.09.14.13.06.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:06:54 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55eff0so307451866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzrBDRhldCBN8aeT/6c4yodlphhIemcRzAiArmNJZ5g6vRbfwKG5NDdwvfZN4s6+hktukTcp/LU80d8UJo=@vger.kernel.org
X-Received: by 2002:a17:907:6d1f:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c29b84c9a48mr280688866b.3.1789416413732; Mon, 14 Sep 2026
 13:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org> <aqhLhVMkNzf_4oJw@jpoimboe>
In-Reply-To: <aqhLhVMkNzf_4oJw@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 13:06:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
X-Gm-Features: AcwNN1XwkDuRyfqGBvPSv1hGEYJIl2TPFZFoOf2g9mdtKKeoU1aAJmlE5veL8PE
Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] objtool: cache relocations, do less work
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Mon, 14 Sept 2026 at 12:44, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> BTW, I found another initialization bug: klp-post-link.c uses
> elf_create_section() to create a reloc section, so it missing the
> initialization of rsec->hashed in elf_create_rela_section().  But that's
> moot if we just get rid of the hashing.

Talking about "getting rid of the hashing": the instruction hashing is
obviously a big deal judging by the hash size expansion in that other
patch.

Do we actually look up all instructions by hash in the first place?
From a quick glance, it looks like almost every user of "find_insn()"
is looking for just certain *kinds* of instructions: calls, branches,
returns, endbr.  And branch targets.

Maybe stack updates? I didn't check.

Yet we seem to hash them all - even if they are just some random
ALU-only instruction that is in the middle of a function and never a
target of anything and has no impact on any code flow.

So the question becomes: do we actually need to hash those
instructions at all? Are they ever actually looked up?

I don't know this codebase at all, so maybe that's just a really
stupid question. Feel free to look at me condescendinly, shake your
head and say "Poor Linus has lost the plot".

[ And yes, I see that whole "next_insn_same_sec()" thing, which
obviously *does* look up all the instructions when you iterate over
that function, but it strikes me that using a hash table for that is a
bit strange when the natural way to do it would be with juyst a
"struct instruction *next" field instead.. ]

So if hashing was such a big deal that it showed up clearly on
profiles, maybe the answer isn't just a "make the hash table larger".
If a "next" field were to not only make the hash table much smaller,
but also mean that next_insn_same_{func,sec}() would become a "follow
one pointer", mayeb hashing would become rather cheaper?

Stupid? Or maybe "not completely stupid, but too painful to change"?

         Linus
