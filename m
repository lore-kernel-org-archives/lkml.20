Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C24E9C04
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674914; cv=none; b=H2pDsMNNCNBW0CQsu0BHHe3w3XushoXSQtVzUlYlQdkTqT0h37Sr7+ejMZaZgaZUhYOm0qL95fz0/ZnISsOPc/j4pTfv7Stj3/DJ2+8wE/gf49lNpWZ87WXn3R9kf6lwqUen+mJQRw3ZP2icJkreNqjPopC0qYn6mVHGkNAO/gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674914; c=relaxed/simple;
	bh=gEFQcdl7qTsUXGeFDfge1bU5rQQM7owHkKfffjE/c8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP0nR6iynYsJ1Zr+DNU9K/rM5+aafipsCuHr5p4Fa0ZV5U56CnMQyIm1wRip8yO7V12afTtO4QnkgxmD+PTqdR/pG+VeVpFJTwC1rqOhVJancDivsswY1VW5ixffPw8ayR5Hmy93huqIlDbk97Rwo3fq4OmJGyJWFnPxwSqmhN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=di9ZkO5K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="di9ZkO5K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57051F00893;
	Tue, 29 Sep 2026 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790674913;
	bh=+F5NumrZf1XyIZbQp91DpBQmedu/Ecq+2WveBOr2pps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=di9ZkO5KspEV6z4evgG83zBoudsAPd4OAJTLUsZbjopg08XUdO0h2CvjtAM/m7GvZ
	 UcaKiUtYl8RSDOcJGUYicjHrUgEzPDFlAsp2Mlq8tfcIsI9brGeRa4v59dRSLaf9jr
	 ENqMa7FgPAb0v6uI1Fa3P5r43kM7QdPC0+RUmoLzeyqN35lNpn6xdCv2TjlomdgdY6
	 KbyS5AnAFHNULK9BypuiYVpaJHDzobxM5nMVRGdBSXn8RuvI0xoDeQj4NzGG8c3BxO
	 2Et8qZ7KPAGTlIMeafsQGTMJxxjfErPumMiFiZZSHHMKirE7dzI6Qk8NpAParF87BX
	 3d9+Qj/wCmXZw==
Date: Tue, 29 Sep 2026 11:41:47 +0200
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zishun Yi <vulab@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: process: Use str_supported_unsupported() in
 compat_mode_detect()
Message-ID: <aruH26spDeM8O9dh@kernel.org>
References: <20260924213256.122530-2-blum@kernel.org>
 <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org>
 <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com>

On Tue, Sep 29, 2026 at 11:11:55AM +0200, Geert Uytterhoeven wrote:
> Hi Paul, Thorsten,
> 
> On Sat, 26 Sept 2026 at 01:48, Paul Walmsley <pjw@kernel.org> wrote:
> > On Thu, 24 Sep 2026, Thorsten Blum wrote:
> > > Replace hard-coded strings with the str_supported_unsupported() helper.
> > > This unifies the output and helps the linker with deduplication, which
> > > can result in a smaller binary.
> > >
> > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> >
> > Thanks, queued for v7.4.
> 
> Thanks for your patch, which is now commit a06776565b9e7351 ("riscv:
> process: Use str_supported_unsupported() in compat_mode_detect()")
> in riscv/for-next.
> 
> This fails to build:
> 
>     arch/riscv/kernel/process.c: In function ‘compat_mode_detect’:
>     arch/riscv/kernel/process.c:138:17: error: implicit declaration of
> function ‘str_supported_unsupported’
> [-Werror=implicit-function-declaration]
>       138 |                 str_supported_unsupported(compat_mode_supported));
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> as it has a hard dependency on commit 5383cf280ef4f00b
> ("lib/string_choices: Add str_supported_unsupported()
> helper"), which is only present in the for-next branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git.

Hi Geert,

It's also in linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5383cf280ef4f00b15f1d9e2a2886d0d02c0118b

Thanks,
Thorsten
