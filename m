Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE4C3DC4CC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198124; cv=none; b=nw+nnjEbSWNwO2qs5qrpvsmGjthiSnUHFYDlAd5l06OnrqHmvbFZ0dDGTllhATnmsAwDgLwc2px91l5Pt3wfKrTr6Q+bC+1+QggztO5mWJoJm+tZcQ6Nm6PlM9YxzTwBZ0GIpsuoyjtPy/25QnM8j7A6g5qfokyUhHELH8Y+npE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198124; c=relaxed/simple;
	bh=UD2KMfzzPMYVRBtrH5Lyz7KKBIJRodXc/eF6QsKXCO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOxL6fKKdsnbKw/wZasoJRxQpe3bm2FN0O+imkj7oX55AeXvYtSdBDRUkkMaoBBfFWZJoWtzGajBQxzXP+VzFQOw69rWS8Rsowyw23xCr5hS5GK9n8zYwTv8rKpZlyB4rBjP1x7fc3/MBIBdxY4TA5FnVVSjxy4x1ysPxoWptp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=K3Jj7jzQ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="K3Jj7jzQ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 813E140E0173;
	Wed, 23 Sep 2026 21:15:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xgZOIdqLB7XL; Wed, 23 Sep 2026 21:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790198102; bh=KmWnxQ54EHf62tGstuxqERWypFlevLz1loi5x8CI8SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K3Jj7jzQYpWcmlrnk7V3Db49GPFTMAr5pXwfsWyjyhKT4XwDJaAMUy8W/Ds3W181p
	 MDFZJxjKLD45YkfYub/jvUczsCvhQlZV77oMkIX6wRZd1hUhEyTaRAKVIeB1UlOfaj
	 Fua6QAjfvuX1v52ak8TU37JepBFNolzXZJO/VtdtUZN6KRg6db+ocGXKbuMFJtBVL7
	 QiLHZB2N9jFe1xV42i0SuizERe2lOlF+TZ67H27LxJ9nd/GE0RdRfeBeGubUjZbzpO
	 pxwLrvufIAyNOuU/5QWK9b+m8L++sbuFrJTfpUqL9oSf/91Uq3PnxbpHJyLjw9NH9s
	 AwXWf+pw9SRCm+0zLeZimuG/9OHFlRUIehpNcbcq5UhmT4dHD3YU0AedG32JL2m7Vu
	 UK7RqqBVNTgQ9uD+oIfhSl+yQGichHLY9ZgnRIUcqTTzhNgCgLP3jFcmWsDnXLPW/Q
	 XqEx5ufhRrw9AhlwyYvJxaoL0i/lFdm0d/FVqPaVDAgPAVciXmYI7G9PkcVtjgi3H3
	 vS12WHw4bev7wsTUBCfIee980C06bZbqLAzU4d8OZOj55GdgU1bAym7LKjJ43YsCF7
	 pAMY62lNRdKEvJxAhC7aLbTve13XIw8OL6c2sxuqyBqqqpjTtdH09+arHZve9T83RS
	 N+m1+EPAmk8x94TmYqg0dG+E=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5A0C640E016C;
	Wed, 23 Sep 2026 21:14:54 +0000 (UTC)
Date: Wed, 23 Sep 2026 14:14:50 -0700
From: Borislav Petkov <bp@alien8.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] x86/fpu: Remove unnecessary checks for X86_FEATURE_FPU
Message-ID: <20260923211450.GBarRBSoXGFKvUBwe7@fat_crate.local>
References: <20260831185706.90103-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831185706.90103-1-ebiggers@kernel.org>

On Mon, Aug 31, 2026 at 11:57:06AM -0700, Eric Biggers wrote:
> Since commit ab05214025ee ("x86/fpu: Remove MATH_EMULATION and related
> glue code"), X86_FEATURE_FPU is mandatory.  If it's absent, the kernel
> halts execution in fpu__init_system_early_generic().  Remove unnecessary
> checks for X86_FEATURE_FPU that occur later in core x86 code.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  arch/x86/kernel/fpu/bugs.c   | 4 ----
>  arch/x86/kernel/fpu/core.c   | 2 +-
>  arch/x86/kernel/fpu/init.c   | 2 --
>  arch/x86/kernel/fpu/xstate.c | 5 -----
>  4 files changed, 1 insertion(+), 12 deletions(-)

Sashiko might have a point here:

https://sashiko.dev/#/patchset/20260831185706.90103-1-ebiggers%40kernel.org

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
