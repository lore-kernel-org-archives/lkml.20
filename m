Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8205247124E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148024; cv=none; b=WGHp+qyO1K0yWJXM1eCaKrlyRKLA0PWtzaC9e+Q5KwlWWc1rK5Zqp5N30KZS55ZyGky2XjMtSU48R1ifFT8QZ/9x/0Qbk7bqmpqoM9GXwWkcIxNNkFya5p4uPWGSsbw35QDg9HhSQmr2UTnCbXD07O563t4KIqDcPq2Jzv3NRmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148024; c=relaxed/simple;
	bh=76bsxwDnANEo0kLB2mrhhQlwm4C2VGFZMyLQwWFFfs0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aej6tijNv9ApF+GryAM9QOKcJ0ErlkO/CAArxe5bbAVfGKst5uPYynxUVg+Ht87TESq55Br8GorTYBcxARIte1xUSpd8/bvu8jv+53U/UclNVsy8wzV6TQqh6fZrlGfI2SDSxdKOS8FugFvExVTqji89kBSU/526kw9LZWBMndU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7X+6rKd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7X+6rKd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so959765e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789148015; x=1789752815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oHkfE3imp4BQyC9rRB22q5PBnbDLbNtc6L6K0uF99Ik=;
        b=l7X+6rKdv+a+2H9VVk/5tjdV/dmauzOsd9F3pLAjg5HKAH/FbYRyfRju89HHYQmlIh
         arCHlImki9lN/iEttOdBDIpQE8dtpaRgOVCCIK1cLrxshaTAa7jOqOlJEufOQp/MlGyG
         In0ltJN4FX5H1F2ZrleEquQHblmeAJdU6xem8UnmqQ0bw0QYX7FyJUUiHyP3WgtXyic2
         /vrwR89RC3zM6P6WHF8EACv8yCNoehuRQUKnlo/Ng89fDphZ/psxu0e9yHI5Bx/h7kq7
         TA3IaIXaWvcxdNrlRriEDLfuMfm0JtB7Tp+EwvmrIfdvCHlboxOTSfqLmfwyPZoBcDcE
         ElWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148015; x=1789752815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHkfE3imp4BQyC9rRB22q5PBnbDLbNtc6L6K0uF99Ik=;
        b=NDo25Wiuyh9a0/E//Lamlp23QiyXfMz79aGDk/jgzOMw4wZ/nLPZkZiU+hU5TgPGl2
         V589XcqhtV5FkHsdp1P+8375EsOcSpJQTdg9W4k6aqPIhWUq9GQjiXqD3zl9thqWjZ5R
         +yKv4uboHm7AjffLoBgotP6SuuELvFddoUqSCtQmri18BFY3eY6XgYfCMTRSkbJzC77K
         Xpj/Qbn7Da+EpAhwn3CP3pITqf+PoXjS2F7I0mi/OCI3DzgFRMppiSQP/qW7UYxKkEUF
         gjvOSuMn+RX8jChvB3B5DgYTNpdnsDwJClkSAenTB5pjJ59E+D13eyN5fs0ps6hOX5cW
         2InA==
X-Forwarded-Encrypted: i=1; AKwUvBxD+wTum71MZG5Fy1EcqTGsrGHJIYDcXB3vuso27Tmav91450kmctRhCTaNfvSQaYtH5Qv3VsVwccDVowU=@vger.kernel.org
X-Gm-Message-State: AFuF++mteYO62xdgxEHzODc8KCv7PjEBVXDx6OC2NI+7tmMalWquDWtS
	6QmbcClQXt+C3VXL9BMAMRSuCg3dsh6bbHSw5WNsBW1MOinUm/Dhu1WR
X-Gm-Gg: AYBFou0dyyDuyroMqGmjVjAbYJk0VCGIJsBLXoZwehKUMRpMBj0NqnH6xEk/QXLdPf/
	WhbYq2ErWQY/JHV6SMjh0sIEBrm0ZUcwtTPj0LNIXEc/UcuhOs60w4XFZ+ikM+JqulgyYkZcnBZ
	YlJfwrFdOHfP5Abi1iBmRHgbMyfSVsorRYTR1S9RpGalaNEiLki+vtjRu2/bmII7xwZnu+qbDri
	78fHgQTqelO1I+I+uVxJ8nOVpWhr5fd33fUBT59w7MejuphQiz+9ZGuCXyxTIPEVQfCW++TL6X8
	0H+18QuIow7kJro0V96OK2Yi32WfqkcMBWl/fpskSJ4dVeXfqcdAPPPbdgsYEf36cW4JW/r1Nw9
	0QU5cdX3qHG2KQ+ZipqRJOKsyBlxQQ9Z9gooh9ku0X2My3VWoro+I6H0PEDIdwxWHPreqIkbMwQ
	E9/60m/xs7cDh1jl3K3Rb3AH0x4sxFtMVUWnVtCcnRcGg1/BXQ82/m4Ic3guLTSjjJThuFquvQQ
	WBdTtoxMTHUK3tOYrcxUFEZk2bjFnb74MEG
X-Received: by 2002:a05:600c:4e0c:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e6198734emr158528945e9.6.1789148015226;
        Fri, 11 Sep 2026 10:33:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm80821885e9.2.2026.09.11.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:33:34 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:33:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nathan Chancellor <nathan@kernel.org>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nick
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
Message-ID: <20260911183333.1df0f2e2@pumpkin>
In-Reply-To: <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
	<20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 17:42:35 +0200
Nicolas Schier <n.schier@fritz.com> wrote:

...
> Yes, skimming through the patch, I thought about that, too.  Moving more 
> cc option checks to Kconfig will make building out-of-tree kmods with a 
> different compiler more dangerous.  Maybe we will have to make the 
> warning in Makefile's prepare (external kmods) target a bit louder.

One problem is that distributions have a nasty habit of shipping kernels
that are compiled with a different compiler version to they actually
ship as a compiler.
In some cases the versions are clearly the same - but the version
strings differ.

David
