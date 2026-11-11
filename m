Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418513;
	b=yehAAriCPUL0yhfNAJtfvw9UqfoHEvGi1uJPBWaP8aHynO+F2yoi93rb+ycV2Gm2Us8N
	 49gy4fC7x/xa7Ffgp3OKTLYiJCIcC8Ye4yTDftxPwif/rHloJVq+PjT6hU4IpxvSSNYVY
	 OqaeflB/aV7yW+BWdQyt61eYn1yBHdqRgMWkDiLj/CEkC/u6tNCX7BLW0ZVckYzX0FcTo
	 NH7ZH0bBQe/rGtzm/pcFrZ/NL26ikOCe5RQ6144Sp1h9UUJO0hcBrr1i8BeZKH/0EzNUc
	 zUBRZfZ0J38srZP9XqAqIer/tJN1+dRYMW6VCkg2n6rryVhHDuQaPygbvC4TmLR+SqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418513;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=t2tMbMlMUgA0x3ONKcoOJiyALI2CAjBxMqrWxQvzdZw=;
	b=GtXOrlB3NQfLBMgPBCGx0G/yJOspfJwPFkRFQ39lREAshNLATTW9SsxvsD6hyEwLRN5T
	 OgB1ajRSltRprN5QOF6jyrziXMuqHyreqGv/CCq+EIbtnPdOO0Xp+SshtAXFa+VErpSKA
	 i1b5xor0s+lchnOIsdVP5sC7SDTvXvDCHF4H8EUHwbgwwrMdn1lH91wtm/2FHCIPgJMS3
	 Q793q56RXl0D59PaEldWGIjDBgzFJVoSorb24Bc4REWcbNTKdIOU0dFn0DTZyG3MKwT6L
	 UJjgxrbb5PlPfMrkDbGkMWA5bSBTy5ts8YF8xyP0sunnpJOOG8jwMd+PWPIbhLlzang==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lcpl0JmN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A15606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lcpl0JmN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056771F00A09;
	Wed, 11 Nov 2026 17:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418512;
	bh=t2tMbMlMUgA0x3ONKcoOJiyALI2CAjBxMqrWxQvzdZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lcpl0JmNfi0hGiZdgHhI35YjoBPYwQfagsfOk06DSWRnOS6tAZ29Dekzd6uOu/fGA
	 7x55jW/tGA9b3NDlb7uX52rBf9t5Kb8Bjd3grfD09Tp5l5aIGRcSMRl3tpH1iRrlCZ
	 p+EB1cv+fNBUPGf0VNQxfPTsLsB/8N5dWDk+zeRcnzywiXAgLxo+4kI4s8XSN6bTW2
	 VqbMaWv8frsAxHReEMxc+OLUK/vKwOwcNC7ElT+4TWOiwP6PZM7I//1QjiIezVjnva
	 DRo6TwdDx/8jk/YZPiN1f8eZB5KJ8u0+fpVzNY6w2QQdF4m5DCNHuzNBJvSBrd1ZUr
	 BxMcstaEjcWeg==
Date: Wed, 11 Nov 2026 18:35:06 +0100
From: Thorsten Blum <blum@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zishun Yi <vulab@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: process: Use str_supported_unsupported() in
 compat_mode_detect()
Message-ID: <avSnSvPLqdkGWWYF@kernel.org>
References: <20260924213256.122530-2-blum@kernel.org>
 <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org>
 <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com>
 <aruH26spDeM8O9dh@kernel.org>
 <7d4e8a05-4e4e-55be-2a9d-715c65787c38@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d4e8a05-4e4e-55be-2a9d-715c65787c38@kernel.org>

Hi Paul,

On Thu, Oct 01, 2026 at 10:45:11AM -0600, Paul Walmsley wrote:
> On Tue, 29 Sep 2026, Thorsten Blum wrote:
> 
> > On Tue, Sep 29, 2026 at 11:11:55AM +0200, Geert Uytterhoeven wrote:
> > > Hi Paul, Thorsten,
> > > 
> > > On Sat, 26 Sept 2026 at 01:48, Paul Walmsley <pjw@kernel.org> wrote:
> > > > On Thu, 24 Sep 2026, Thorsten Blum wrote:
> > > > > Replace hard-coded strings with the str_supported_unsupported() helper.
> > > > > This unifies the output and helps the linker with deduplication, which
> > > > > can result in a smaller binary.
> > > > >
> > > > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > > >
> > > > Thanks, queued for v7.4.
> > > 
> > > Thanks for your patch, which is now commit a06776565b9e7351 ("riscv:
> > > process: Use str_supported_unsupported() in compat_mode_detect()")
> > > in riscv/for-next.
> > > 
> > > This fails to build:
> > > 
> > >     arch/riscv/kernel/process.c: In function ‘compat_mode_detect’:
> > >     arch/riscv/kernel/process.c:138:17: error: implicit declaration of
> > > function ‘str_supported_unsupported’
> > > [-Werror=implicit-function-declaration]
> > >       138 |                 str_supported_unsupported(compat_mode_supported));
> > >           |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > as it has a hard dependency on commit 5383cf280ef4f00b
> > > ("lib/string_choices: Add str_supported_unsupported()
> > > helper"), which is only present in the for-next branch of
> > > https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git.
> > 
> > Hi Geert,
> > 
> > It's also in linux-next:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5383cf280ef4f00b15f1d9e2a2886d0d02c0118b
> 
> I'm dropping this one until the dependency lands in mainline.  

Do you want me to resend this patch now that the dependency [1] is in
mainline, or can you re-apply this one?

Thanks,
Thorsten

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ccd5ff410feb2adcf3840d071cf796cc5c549520
