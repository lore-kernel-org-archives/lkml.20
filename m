Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F44439E9D5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873116; cv=none; b=V+TJk00ZaTnqakD4A3A/ZXUbWqx2JbbOyXHGzDsqRd5r6rrKlbozItSeyzDw23EuLXwiAM83N8+NV1YwyS4OXDPTGTo7TkFUAEfJWFlugCBuj7kRfGNGYeG1TgbhYnOCmd9NBxvIbhZpebYdfnYm7eh7xx8VROVX2j9x+SuQ8jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873116; c=relaxed/simple;
	bh=RCob8u/MS1feSlIbhNwkab1NoYhy9NBcIyQwLhJ46GY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ObIDv/c8V3yF7QxZIv7ouZ0GBUPDmhnNfhVZwQRqRsYIeW1/esQ/sZNcnEtfUQQc6nUtDfCK0Vt67VMMyqsZ+LAYMXab15OMvnlbTzEw6f9OWGfqFnvPK9lxiKkzH9BIdfezHKYkHYxtlBDphDQfpjNPeGllSAE5b7utL15c6lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iT9Mtm6w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iT9Mtm6w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F941F00898;
	Thu,  1 Oct 2026 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790873114;
	bh=oiy1TAmPvuT7fLgnrKrdYEj5f+TvhnwsMZ7DNxp6rLQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=iT9Mtm6wRxYeDEIlw+cANrV8UaSNQf0lRzkY+mc7M4JJ/UisPozUXJ90qCFrebGQm
	 6G3DBn3zXNvHRgJexj/zsUqs0ZbFkPQm5R9jxnORayKqYHXuf5cGv4jEeOeGuNEiPj
	 eKHrDx2bLiBemd0nck2O3srd4zLlKouT2Et4F6cLGTgme0seXFx9s70l2LRexkykAi
	 /OyUOz2G8EP6NqaWOJPV7hQ6Q+39AdsPKxF3VUI100I5yUFmYxSfeLbnCkXHP2NjTv
	 jS3dtnCs6dvhRoiPprGFwgoc82qODCT0Ryp/6y1qV1YY1uAD7/wgEnTxULZcldugd3
	 k6WxzWqub6JXg==
Date: Thu, 1 Oct 2026 10:45:11 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <blum@kernel.org>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>, 
    Zong Li <zong.li@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
    Zishun Yi <vulab@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: process: Use str_supported_unsupported() in
 compat_mode_detect()
In-Reply-To: <aruH26spDeM8O9dh@kernel.org>
Message-ID: <7d4e8a05-4e4e-55be-2a9d-715c65787c38@kernel.org>
References: <20260924213256.122530-2-blum@kernel.org> <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org> <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com> <aruH26spDeM8O9dh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-407165345-1790873114=:2885293"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-407165345-1790873114=:2885293
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 29 Sep 2026, Thorsten Blum wrote:

> On Tue, Sep 29, 2026 at 11:11:55AM +0200, Geert Uytterhoeven wrote:
> > Hi Paul, Thorsten,
> > 
> > On Sat, 26 Sept 2026 at 01:48, Paul Walmsley <pjw@kernel.org> wrote:
> > > On Thu, 24 Sep 2026, Thorsten Blum wrote:
> > > > Replace hard-coded strings with the str_supported_unsupported() helper.
> > > > This unifies the output and helps the linker with deduplication, which
> > > > can result in a smaller binary.
> > > >
> > > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > >
> > > Thanks, queued for v7.4.
> > 
> > Thanks for your patch, which is now commit a06776565b9e7351 ("riscv:
> > process: Use str_supported_unsupported() in compat_mode_detect()")
> > in riscv/for-next.
> > 
> > This fails to build:
> > 
> >     arch/riscv/kernel/process.c: In function ‘compat_mode_detect’:
> >     arch/riscv/kernel/process.c:138:17: error: implicit declaration of
> > function ‘str_supported_unsupported’
> > [-Werror=implicit-function-declaration]
> >       138 |                 str_supported_unsupported(compat_mode_supported));
> >           |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > as it has a hard dependency on commit 5383cf280ef4f00b
> > ("lib/string_choices: Add str_supported_unsupported()
> > helper"), which is only present in the for-next branch of
> > https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git.
> 
> Hi Geert,
> 
> It's also in linux-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5383cf280ef4f00b15f1d9e2a2886d0d02c0118b

I'm dropping this one until the dependency lands in mainline.  


- Paul
--8323329-407165345-1790873114=:2885293--
