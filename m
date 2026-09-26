Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BE7547065
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790381680; cv=none; b=PCQ+45wxhq3la6kLvXJsXapn301ry3WGlHq17miJGNUz7ZARavyAK/KM5kTiv8osFGur9FIDhiu/wtqPM1W9v/lbY+VxCOcBq9C+eTTbzNu2E1PO96EFJ1+6D0PzL3+ubLaGUsXuN+xrZwlAG0VSOLZwmfWQJiH5o7J/6IEUo0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790381680; c=relaxed/simple;
	bh=H7RozWkCVzbh/yTIvT4DuXpKYcGai/XMg5Nd4pvdD4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b16sYoBpX6fWoEA+FNAbzjzlDlzua3MdgEdf6Ky/V8Aa5deKM86OdarYmCWzfDOHEexKwmk67NnaG2c5ldHsAfyTPs0P8dFPJvoX3U/5N3EPcVhnAt7zXVs4J7F+Lz2bFEKytC0N5aPvqwrpxhYwB/K4unvb0m/WDNnwjJ/md4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=E+paFzA4; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="E+paFzA4"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CD28540E021A;
	Sat, 26 Sep 2026 00:14:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id K_hbUdk3ZPi9; Sat, 26 Sep 2026 00:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790381663; bh=kg/8ZgQCi85uSKI6WRZVpIc2E5Nt0smTNBdvE67Bz2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+paFzA49qxeUCCgFvu/rsgT5WYRCslhp9zrW8XyCE0rQv72t05ZjLsku60OMigfv
	 rbFKzm5mHuB+jqkzTJC91DUZ4NiIvb8cxFhzPfzmOj1eTySpGNcKa5OefC79Xi4pAM
	 oPaTPBq8rHnspQsVNj4lslbaNeGv0sLfHCh4mhZ6ZzfNCcr9gDTA/e9iNltIvTWDRN
	 Q5zXyl1xp2r0yCm+l2fDtTmt6znNauKOnE5s8oCQhS5zqbF0Paba5b59BeRU0iQrxD
	 RZEHseIwcR6q5EfNJl9G3A7GZMxoELhU1em8luFMG9oiYSs9pa27WX13+pqrL6xk0k
	 T/zMfhRdJWklkGNYixo/oD2Qurg69x8Ir9MhsUmTfmrohkUtT98MaHmHby2V6NWisr
	 0pY/UnBucHxXr3w7jhskSa93+pJzaslsqK1uud2Fqn5h418jrffCKyviRuAUMGh4H5
	 nKOfsraY6cdIiL/DbqvKhAjP3ajB8UOmWAizcwsDl8dmJdm/7SzJKZYH4pmAduoO3n
	 QemJZ5HXsz/mif/+zLoY0CVNLuBYTIoBmTkYlI0bJQR7AXsCy9JkLtb5njo51IoejR
	 brgcvaYtOe7hw1QMZIms/HYRY+d3wwqrHLcMMIkJ4emDaFkApRMcTPbEZIK7hSp/Cw
	 GKDk0aB1vwLaTGhMTisNLFco=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7A88940E00E7;
	Sat, 26 Sep 2026 00:14:12 +0000 (UTC)
Date: Fri, 25 Sep 2026 17:14:08 -0700
From: Borislav Petkov <bp@alien8.de>
To: x86@kernel.org
Cc: Andrei Vagin <avagin@gmail.com>, Andrei Vagin <avagin@google.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	linux-kernel@vger.kernel.org, criu@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 6/7] x86/fpu: Pre-fault only required size of xstate
 buffer
Message-ID: <20260926001408.GBarcOUHft7plcljAO@fat_crate.local>
References: <20260924210121.87032-1-avagin@google.com>
 <20260924210121.87032-7-avagin@google.com>
 <20260925040215.GAarXyR6cUzn9OH4ZD@fat_crate.local>
 <CANaxB-yxzmDr3K4qQ+f-pVyUOjn8jKJeEydR7adi5N+_TiFHZg@mail.gmail.com>
 <20260925191608.GAarbIeDRVdrWMczbx@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925191608.GAarbIeDRVdrWMczbx@fat_crate.local>

On Fri, Sep 25, 2026 at 12:16:08PM -0700, Borislav Petkov wrote:
> On Fri, Sep 25, 2026 at 09:51:03AM -0700, Andrei Vagin wrote:
> > I've sent v8.1, which is based on tip/fpu. In this version, I moved the
> > xstate_calculate_size prototype to arch/x86/include/asm/fpu/xstate.h.
> > This matches b84c96283684 to avoid the same problem when tip/x86/fpu and
> > tip/perf/core will be merged.
> 
> Thanks, makes sense.
> 
> Lemme queue them and see what conflicts I get.

Ok, this is for my tip folks: merging this into tip/master gives a wrong merge
resolution, see below.

The proper merge should be to drop one of the prototypes.

HTH.

commit c59a5d54d06d4a025f925b0b3b4c63f2b81d75e7 (HEAD -> refs/heads/test-merge)
Merge: a14fcf2723cc 391cac638edd
Author: Borislav Petkov (AMD) <bp@alien8.de>
Date:   Fri Sep 25 17:11:39 2026 -0700

    Merge branch 'tip-x86-fpu' into test-merge
    
    * tip-x86-fpu:
      selftests/x86: Add tests for signal frame FPU portability
      x86/fpu: Pre-fault only required size of xstate buffer
      x86/fpu: Fix potential underflow in xstate_calculate_size()
      x86/fpu: Document reasoning of FX-only fallback
      x86/fpu: Extract restore_from_ia32_fxstate() and clean up fpu__restore_sig()
      x86/fpu: Clean up and rename variables in signal frame handling
      x86/fpu: Document signal frame layout and portability
      xor: Add AVX-512 optimized xor_gen()
      xor: Remove redundant X86_FEATURE_OSXSAVE check
      lib/crc: x86: Stop using cpu_has_xfeatures()
      lib/crypto: x86: Stop using cpu_has_xfeatures()
      crypto: x86 - Stop using cpu_has_xfeatures()
      um: Check for missing AVX and AVX-512 xstate bits
      x86/fpu: Check for missing AVX and AVX-512 xstate bits

diff --cc arch/x86/include/asm/fpu/xstate.h
index 19dec5f0b1c7,33343e5d54b0..25308312cd78
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@@ -110,10 -110,9 +110,12 @@@ int xfeature_size(int xfeature_nr)
  
  void xsaves(struct xregs_state *xsave, u64 mask);
  void xrstors(struct xregs_state *xsave, u64 mask);
 +void xsaves_nmi(struct xregs_state *xsave, u64 mask);
 +
 +unsigned int xstate_calculate_size(u64 xfeatures, bool compacted);
  
+ unsigned int xstate_calculate_size(u64 xfeatures, bool compacted);
+ 
  int xfd_enable_feature(u64 xfd_err);
  
  #ifdef CONFIG_X86_64


> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
