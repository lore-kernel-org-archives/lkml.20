Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE65678FC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967626; cv=none; b=cgTjLoLnlHD9bXKvh/gIAookOhggAA3Q7Hp3+CHIhb7PotpYJ9mYgqb0VkLktDWu3maBy3eWwR/xiJLlSWys8dpjWARDUpBHR1jK3RXd2cxugTd9Y+APZfCzquTXxo1K7+aNtPTqdb1pcZ2S3D4TLsKfLX2XG9Ts71LUlRjgAEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967626; c=relaxed/simple;
	bh=t3yqbvSqtFoLUHow+WwPXXOfeaEh7bClm80fMM9rQTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h493stHHu4BvbUX8dJ8WF14nuhwhM1wcjYcivfd974V2/WOqzy9fppvLjhrSS1LTMfOqAr07n7WkW8xuvG3ibhsqHO675+ShsDndtpwcHuNw17RICKFD6vhCJLVFGesDoaS0QhUi5YJFESriRjvxyLMAZAojf0JbLDnx1hxatoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dWWjxsx3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dWWjxsx3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso7671857a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788967622; x=1789572422; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=dWWjxsx3vOAB63KDzDEmsM3O1VLGIjC7p9JJgGsk3wnbelifabuG9SHGQDwBZlVfux
         HUH2xA8DjA7ELN6q7f1eAggrY+FZ/l6vsDSxLj/vQw0V7OyD7zxelRtHyGJ3guvTi7zp
         87xyxUN76J8UhQZa4MUkLncIcYMrKmppESk2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967622; x=1789572422;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=NhfPNOnZRj7kPS1EELivUpTWsxmKMnzboaXtRbg+Vcxo0ACZgeXO5vpr5/N51nKjWg
         SKlbweDLkOO45Z7A2uPl4q6VZ1hHnAnExh4ylwkYfKznRbozSpaq59L4vGJ9vDah7/TJ
         SbfcPejPiPuObKAD+HWb1ZKrkBXBWZYvfGnzEDGxcCwWfnXjQKAFXgJ5z/XLlYOf73wq
         1AXqkV+kpfdNcS1fgszUKBQfIZG9fFLuzXGolJPYLMjw9zaumlGyGNCT+FRyTyblQ0mu
         LNgpuIjQlmihJygYfzxlsG+dLeBPLdoVxOmr8/UxeX6h8MjUHlPZ0/JuOMFN5hscCF+d
         Qgjw==
X-Forwarded-Encrypted: i=1; AKwUvBwwg92KkLHVotuUpmhKLNBvaxt+rubMmFHPR41QJw9PlqFcgpkowwQC0gQlaH2NSOz4o92faz0URzFN11Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mmOYpbsoxNvuMIe9HZ7dSeU2vJNx+aj6E0lOYcUh3Vqy7ijOzd
	dXi5t7iTxkbmZGpgzYKw6bNWHYXdwwWXjhGYsV8RieiLPDh8efzKYzWfPsHaKcmUIvDRHt6WG2H
	OJgh05d+fNA==
X-Gm-Gg: AYBFou1MlWiIfrO3ylE5W9aZ9MmYhuDlGvmoLiSDI7OoVNbuSRpZDG6BsCCIF+ckJyY
	pE+/RKcHzwpqizYs1hCwI+GWzWQ5a59NhT2MKG0Ve6OFHOxBhk8RxTClMigWyknA8mkq78893/T
	J0FuF+OHmdbKaLAKJvaM2tckIgMzOpF7xf3dskP8EW4bmsaGuPNHphwsteCy+jzLs1tAbJMnnDo
	vkh8T7Owk5YvR4zT88i8YQnBgqJUzmQ1JsdOP7U1MQwaJRsJ6Qf/+T3C426y36LghHnhR0in+90
	3bcYUcNOtLflVzxooulK/uGYkecKfJ7Y38umk3DJW/e6u07mX8PWqPWb4UQhRZL1X2VYHf1hEnP
	bYWAwYai1qy0cpvI2RuZwiJM6mT+jJpWEEQY7moJsocIsegy78DlVivi+uzwYUku2pBgSRN+5+k
	cZXtpYt9gMZjyt23To7T++IxUmjsfgGpiGc+uDROIe1lHpkfaCOrZsBzHeGRxYJq91M1Ux0upV/
	VX2aSadswwUBUFVCsUwsnnCDtHxqLEHrKKSscWdz8O9+i9b
X-Received: by 2002:a05:6402:2786:b0:6a7:f5b1:273c with SMTP id 4fb4d7f45d1cf-6a7f5b12877mr10178234a12.3.1788967621778;
        Wed, 09 Sep 2026 08:27:01 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9863cb3d6sm1682320a12.0.2026.09.09.08.26.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:27:00 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2544ff970dso893392666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:26:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLJ2zgJNitXRVRer440FQ9fUjnzsXhG4ojMwcvn0qf+LSKJ3aVjxGkZh/EQX3PIJQAELpBKirstaxSkRw=@vger.kernel.org
X-Received: by 2002:a17:907:da4:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c26164955fcmr1368813666b.37.1788967618809; Wed, 09 Sep 2026
 08:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:26:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
X-Gm-Features: AcwNN1UWYYtk4z7iDc5cI-l9BNT1_XTZBZ1EzZVT-QGEk4RrzSdK76DVFXE4iKE
Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
Subject: Re: [PATCH 11/23] kbuild: implement and use depcheck to check
 dependency timestamps
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

On Tue, 8 Sept 2026 at 13:57, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Each object's .cmd file lists its header dependencies, which often
> consists of over a thousand dependencies.
>
> When little has changed in the tree, this is what make spends most of its
> time doing, spending over a second, single-threaded when parsing larger
> directory trees.

Side note: from some kernel build profiles I did long ago, I have this
memory of it being made much worse by the fact that we use

    "$(wildcard xyzzy)"

for all our config header files in those .cmd.o files. That then
causes extra work for 'make' for all of this.

And we do that 'wildcard' thing not because we want to actually match
a pattern, but because that was the only way to have 'make' not
complain about missing config headers.

I'm not even sure the original reason for it is relevant any more -
this is all a very dim memory from years and years ago when I actually
tried to look at profiles of 'make' itself (normally when I do kernel
build profiles I only look at the what the kernel part of the build
is, not user mode).

I just tried removing the 'wildcard' generation from
scripts/basic/fixdep.c and the kernel build didn't care about it at
all. The whole 'wildcard' trick goes all the way back to the original
commit that added that whole 'fixdep.c' phase.

Maybe the whole thing is entirely stale now and should be removed. I
probably just didn't trigger the situation where those extra
'wildcard' things matter. That whole thing is from a quarter century
ago, and nobody has dared look at that code since..

Or maybe 'make' is better at those wildcards these days - or other
things have shifted.

From those dim memories, make spent a lot of time doing filesystem
lookups (directory reading  and 'stat()' calls - the wildcard thing
triggered more getdents calls), but even more time just in string
handling.

               Linus
