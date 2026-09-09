Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6684A560AA6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968704; cv=none; b=CmLXW88+1EU6H1HYbR5BuRJVT2DpYggxegMDF3Tk1/j1HlZdyU+K372HCdzpCtf9hFJwKrpMvlZYdcduWuXvq+CP1IK+yP1MjtMc3SIGhdK9eLQ/E+iypsLhS17sen5IGigBg8PGAqfw6T/B/B9sE5wPs8GFG5gtklW6/hKQqCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968704; c=relaxed/simple;
	bh=tlXMq73KJhLbqOa3sBQb6U+eAptv38yQqOaGm+TCraA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z41/raDrSEhCwfe8Kfjg8XsRT6QA/XGM5963uVCzEjw7LghwCsxWqaNIlyLyhGPhnYlU/aiQhltHR0MseaYhvQqMGOtuTFsZHLURAN+9nO+a2rHXrdVoQFF8aD1n5avoDH8fLuvk11ev+SvFHzDWtW808bCu6tDOBhcI7Qqpr68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=A/OyTfDW; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A/OyTfDW"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b23so235126666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788968700; x=1789573500; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=A/OyTfDW46RNmttzMiG687FoUixKKLC0W6IBclq3qu9F8wt7zrPKZ41TPvkWwGtcY8
         3gD1JLIoDyhCxz5Te8e4rCgn2aZofn6m+VsSF4X76uAc/OzMSX6KPnzF19guInlqitp2
         BokgfbOZOojJgEV1AHkJSmS8dOKBErwRew+HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968700; x=1789573500;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=HuUMAiDGaE3I0jly5TCvI/y1urgTP1xxUi5Ia6ZjvFp9BIUAtSVJrrw4kfaHzpVTvE
         opWeQ87HlREOnkV0ZTsDnILFeyuWeLaZAU4wjviLJ7k8yH+Gx2OaPyD2/Rkg07u3SjRL
         wgrQnLxBYy9SZ6ndvAyO0PXVdc5FawKhFGqMGBFsTz5KKoGG3UPf1Q19MBAYNTWww3yh
         F8KXQngZM6hwAft9KZ1nQMBlyjC0iXeRNo/zPyVxFANPDWDUFO+jPmjy0d5TuXU4Kweo
         U7gFm2dGe26OP9jLFD20IlhkzemtQ08wlAuJIlja8tg43PuEJTJs6KNYkiRCH6NochOh
         O/gA==
X-Forwarded-Encrypted: i=1; AKwUvBwKA5KcL7FVy7Dmd/BB241yiOvZRF8KfOOPPn/s2zeQFVh8hpd1x/OS+EXA6nQb3DTKLKT3yFY73ICJ49s=@vger.kernel.org
X-Gm-Message-State: AFuF++k6p1gV27uxaR66tOWPlPh/HSbEca3yfRfgMU3BCKHLEFUuKvYH
	GZuksiZXpzc30M7Xe0ZNfOkvL6pRHjmjx6d2xMElg0eeHJrxoT5X9hy+F02KvjjPmTd7FLN16cQ
	5fHegldQE0h38
X-Gm-Gg: AYBFou2HVZApCWYDAMlVW+XtMYqEiGL0VfHopMN3aopayKX1BNtbxgo2EL5ow6wtGHg
	B+sRyGNuYLB+FBfzUQsjidex85TXjUYP9ZfzWSMBLOGOSxdbQ+ZCFP8/hVLXgzcQcVYI/oMS9M7
	Ws22jxvLLGvQDDG8aeoTg0KSO6UTGUL78qm+4tR8k2WqE+AEeIriLhKcb2C8nZLs1lQeFkpGcxy
	Z1yQSAgikR3GypPscqcxqop8U21gqADyyU6F2FZDBkawb0FBCXtaMo2Zbjgnk67BBGgcHLJzoiU
	Rgs7J3pCv1fX8nDhy7vhgns53mRs8M2EUrkll+HVSESSucplJaPyXjUjtwPbCFP3Ee4QqGAKn+b
	ShlaG9dNu9Svhz+rau6aZ8Hyj5M4bCl4wfsNBU3Nx6Vb780txgYn2/DjScqMcscI9CYzI8Iddu3
	6+Tl8qTxk3NobFcRAlPptX0zyhjAlciLF7oEog3W7M1Z58zQWHg3OSkdkxAzSxwGlDdpI9n7+Bl
	ocdS7oyosNIRmoEeQh0RJGszeLvVQ==
X-Received: by 2002:a17:906:9f8c:b0:c25:58e:83ff with SMTP id a640c23a62f3a-c292af1f9c8mr482110866b.10.1788968700490;
        Wed, 09 Sep 2026 08:45:00 -0700 (PDT)
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com. [2a00:1450:4864:33::10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm801875766b.34.2026.09.09.08.45.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:45:00 -0700 (PDT)
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae45so2057421a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:45:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzkt2h6j6FbIlFM2IO+k6GoKp5C4h9H+kScMdNORM6gcAoDA9Q3JGhm+xvwH53MY7k3kE5XHO+D5+JTS8A=@vger.kernel.org
X-Received: by 2002:a05:6402:3817:b0:6a6:58e:f84b with SMTP id
 4fb4d7f45d1cf-6a98dfd77b1mr5256449a12.9.1788968246832; Wed, 09 Sep 2026
 08:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:37:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
X-Gm-Features: AcwNN1XKEJS_S8eITIntw19v_mcHyut1QfPlZfjowWaI1qZq5Mivgkqwhzm7f_s
Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
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

On Tue, 8 Sept 2026 at 13:55, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> A typical kernel build consists of a frustratingly large amount of time

.. you're preaching to the choir.

>                 == allmodconfig FULL build ==
>
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc       345.3s   275.2s    -70.1s (-20%)

Well, that's certainly very encouraging. We should do this. I sent out
some emails as just reactions to individual patches, but I have no
numbers to back any of those emails up, and I never actually applied
this series to my tree - they were all based on reading the patches
themselves.

That said:

> An LLM was used to first determine where the bottlenecks were then to
> figure out how to improve them.
>
> It generated a lot of code, much of it hideous.

This made me scared to look at the patches originally, and I held off
in fear that the patches would be horrible and this build time
improvement would be hugely controversial garbage code.

But:

> I extensively audited and rewrote a lot of it, and heavily edited commit
> messages, the cover letter and comments.

None of the patches look at all horrible to me. You clearly excised
the hideous parts. All of my reactions were of the type "this could
probably be taken _further_" rather than me throwing my hands up in
disgust.

So the Rust parallelism thing clearly isn't ready based on feedback
from that quarter, but the rest looked safe and innocuous. I'm all for
merging this, although it should obviously go in through the right
channels. Mostly the kbuild tree, although some of it clearly would be
other cases - the objtool change in particular is fairly substantial
and needsobjtool people to approve. It didn't look all that
contentious, but still..

Anyway, I'd love for this all to go in. Build times are a pet peeve of mine.

              Linus
