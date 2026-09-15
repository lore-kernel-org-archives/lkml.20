Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A5A4A206D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471809; cv=none; b=TMGskfVLFmT8erKKzXqhbn3r22XgnEx+mKDQ935W/5+VxUymFsds60bSzJUBxHvgQ2F3RkLwJAG3aWpW7wCedgAGdIBBqqP6B9UTEkC4PbWEhpDYPzn8OQ50MVs15WF3xrA6Sutg4iMLXaImyrJfkKNOq1WNvadCg64terirpIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471809; c=relaxed/simple;
	bh=APKTuDGLjMsk92bnnkXJ0rRlkzi8IPJqTj2KURSVBU4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n94HIPuo4ghCTADM/sHpcZ7hkd5+kZ4gHet0ZHSXUUjGMkjvOYp7T/EkcviLmLH/a2xnYhx7+HfNQsVegGZrlbbehet6g53o/Z5GS9KVUzsCXVZY+fT9JTuDZsZYRgCkDz4UqHTFZWQ6DdfvMrSCu8vEvP/e623+33BcGlSScNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfmW0HZG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfmW0HZG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495437bb891so5802045e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471803; x=1790076603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGOErKOPioTgO3v0/s/JdPfHHqPEsYrQAaTIvwRdmxw=;
        b=QfmW0HZGIofUmjnkWGL2TIVkFUxUuxZhOFjQCkuHPy/WVprMzaImb5IXvjMXS/wCGL
         uT++ASkA8Nzq8SsnOaIO0UueO+47EwRvo5F5Q2iv3015O88zbQeDLcIPKzLSIcrifmLG
         RVNd4ny1+Cy+QmrUym6h9ZUTtl8MXydeYJyp4q1FqUlyFJQXlfCStv7fqRBhRq+m6drU
         2MOKbXWfrGw4Cn3wFCJXObY+cq2LnTd2bB/lN0FlToSkrHYz2p1ue1fBhw1OzHr5z4oA
         4tpDK1zE80uk+drClpQQOLiuwshUO/kVmbzbC0pFA/whcZ8lOZHZwDWrcDKDnhhs+UpU
         /o/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471803; x=1790076603;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGOErKOPioTgO3v0/s/JdPfHHqPEsYrQAaTIvwRdmxw=;
        b=vpy93qa/NRYJGZBbrjFZE7kPuLBTXfIwuVjtchh+juWxT9uaRdJaUwd0OdlhM+5RLM
         3ytiZiW+M8dovJkz22uRFD6eqKiLRFcAwTB1imNGyJ07DwNyUQgLrCYK3DobJ5ektEF9
         DvQzcQhh6iYWpnvSbmbbrb2F36WU7nmk28yjwfruh60W/M2gPzUeKMBVyCWwjY1V4iir
         QEQ8U/hQBP9Pim/W4l1oi1kab309h/P3ph4mQOP502rOs4/hVjpGy0yvB9AF259oh8KL
         F/K+sToGDsyPEbOS+RvPCpKIOI5lEIhOqIergVLszlKnNuo2BIsRuEQt13kysvZtKA6D
         lZTg==
X-Forwarded-Encrypted: i=1; AKwUvByXonLef/1CVqvGbGZyzXdUBq2BnPyVZsrJOGlOpMpEyKut8ZN6/Vtr+g0Xxw5ToHXl8rHQt/O1eS5fays=@vger.kernel.org
X-Gm-Message-State: AFuF++kkveyEkiyEP02pY/D8Fz2lCEzftPEuFwi7dAk6ECMV7fDCIPCV
	BVaaGRZPEKWPKpgbD78KB03jws2MsRLcHSDdVkn2tPCk91sJeVsgHW0r
X-Gm-Gg: AYBFou1Z4rFlwihdHbkETy7H5GsXKV3hFimHsrSiOrG2L1YvMKi+gaRd4DqhW46Nw6G
	R0TO6uuDTE/9uVBKIMiHrRuzK8ucylLgPge8Z7qBnO8BAgnwp2Uq1OqJCCMdgimdDANy7cJFmvI
	vbtFUZYgreOizBrBInSz6vm1p35y38LPDgP4RP18f0B1o7yzcR5cWJp5dgacew7lwQuAXLlz2dq
	Ld2sFDkcgo4q1nVWEmfgZdqJd3i7z5fa3av/WqMOek2b5Hs1O4XMtRV0efy6udYnS0WEcjiSGkZ
	EhE/yHeU3+cNbjHKcSVT3UQKjPTHWgD3oFBzOTDEgKo2QbbR7HSFqrZ4cpGdHCq45k/KOUcagI6
	v2fYDoe8L91obDsu80a8KubUMFV4eDT5NmZljUszfrPAb1gS5pGOb2cK3YdUBWrjJWIDt6G2nVO
	rZlt3B++QIYu6BTuVimoQ3C5cpaS0N/LrNJPTnaAguamkEunceFJV/XWl/sR2e9vFy7/VsULcYk
	fs4z5s/geo40Utczoqur0BMSo7ocZg6Bhns
X-Received: by 2002:a05:600c:33a1:b0:49d:28b1:260d with SMTP id 5b1f17b1804b1-49e7d74ce16mr30558965e9.12.1789471802734;
        Tue, 15 Sep 2026 04:30:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm31448164f8f.10.2026.09.15.04.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:30:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:29:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Alexey
 Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
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
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Jens Axboe
 <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 17/21] objtool: decode instructions and resolve
 branch targets in parallel
Message-ID: <20260915122959.2348bf90@pumpkin>
In-Reply-To: <aqkR9Xqu-0Tem1zm@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
	<20260914-build-speedup-v2-17-39817ec5db23@kernel.org>
	<202609141112.F8983EE9C@keescook>
	<aqkR9Xqu-0Tem1zm@gremlin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 11:09:25 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> > > +static unsigned int decode_threads(unsigned long text_size)
> > > +{
> > > +	const long nr_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> > > +
> > > +	if (text_size < DECODE_THREADED_MIN_TEXT || nr_cpus < 2)
> > > +		return 1;

The text_size check ought to be before the sysconf() call.

> > > +
> > > +	return min_t(unsigned int, nr_cpus, DECODE_MAX_THREADS);

Why min_t() -  you might as well make nr_cpus 'unsigned int'.

> > > +}  
> >
> > No, anything using _SC_NPROCESSORS_ONLN internally is wrong, whether its
> > pigz or objtool.  
> 
> Why? We shouldn't cap a 4 CPU box to 4 CPUs?

You almost certainly don't want to use more...
(Unless they end up waiting for disk)

> 
> The idea is that the empirically obtained 16 core limit should naturally be
> capped to the number of CPUs.

The 'empirical' limit is very likely to be system dependant.
There might also be situations where you don't want the build to run as fast
as possible because the system is performing other workloads.
(Not to mention if you have had to add tracing to find a bug.)

> 
> I guess in a world where make hands jobs off this could be dropped, though,
> if the complexity there seems worthwhile.

You need to pull tokens out of the make pipe :-)

David

