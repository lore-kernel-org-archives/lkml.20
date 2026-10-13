Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3255111B2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910215; cv=none; b=qUMHgoWY27q+X77XLsOLQZiOxbdmzUQXlQzyeh6HpJoMy0COdQI4hPFrLFejFeIWa6A11uMLXsQ2diS9lzOSI9gn219Ie3UiSP6iuFqBhRuS4/D9S0rZvtcNyEIJMrng0KC3L4K/CuluVjWX+1d/cM35Thi94I416nm0cnfiTy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910215; c=relaxed/simple;
	bh=qED70+RWlfuBHcgcLEuFZuux6YYhLmfl3BHI7sS3mDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIKmgeN5HULJKO+hYZw3L7GwUQ51zFn7lIV44yiq4GReKC+0vaoS59CfJ8KDjEuYmvgl0WkF55HzwwZMWH8ePC29/IT9xbwQitdTu8bSfxzOi1gkiUQCYSikjw/548c3Huc3vfr4X2mqkECCkmigDHkQd/MomR6qhoXK5Yv1Kmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NI/rrzzZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=upwBwied; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NI/rrzzZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="upwBwied"
Date: Tue, 13 Oct 2026 18:50:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791910212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ExQbaef5GZGKZ3sQcAM+mG10UMW8RBu8l6y1ZSPAPEA=;
	b=NI/rrzzZ/8WkZpM622e3fli0Je5tBXDdMMw5iaFkGzjgpFjUlkfNEPoIzQfLilcLKKPRRi
	Z1V26rpWrzjEZ5csrXP0unIgYcZFp6apTdpmjCHkr12SHAy3VXQLWzzt/RjDTNbvPTrb36
	tWauzbrfBChN7K+In074mkMEnGamZthsrdRatlCNvdEHG3/NIdCYbRhHlcI5QBlkRkOYQI
	UQ5pUwJS/AALtjP2qeBp17LgAD4jBao3xrYWSwB4ueYSGXJlA/KmHWHUuH3QkHZrXoHlLJ
	svslWu2i6GVg+c5pNXnI2V/nt0cfK4qZg9T2ztlDX+Ppdj/fW7KZPFfShDD1UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791910212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ExQbaef5GZGKZ3sQcAM+mG10UMW8RBu8l6y1ZSPAPEA=;
	b=upwBwied/zBjTvmw5BHpy37ioPCixyLHoWX5QPSNaNJn7sYPmWIYrDtgppnMUXvbyt6NdN
	KoYCI9t+btqaeDAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: Re: arch/riscv/kernel/alternative.c:208:6: error: use of undeclared
 identifier 'compat__vdso_alternatives_start_offset'; did you mean
 '__vdso_alternatives_start_cfi_offset'?
Message-ID: <20261013184932-44a4153b-a146-4754-83d4-e6586359f140@linutronix.de>
References: <202610131828.0hZsGdvF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610131828.0hZsGdvF-lkp@intel.com>

On Tue, Oct 13, 2026 at 06:32:32PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> commit: 42cd1e1fc8995ec7ed5cc61957fc503eb065e0eb riscv: alternative: Also patch the compat vDSO
> date:   10 weeks ago
> config: riscv-randconfig-r2104-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131828.0hZsGdvF-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131828.0hZsGdvF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 42cd1e1fc899 ("riscv: alternative: Also patch the compat vDSO")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610131828.0hZsGdvF-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/riscv/kernel/alternative.c:198:6: error: use of undeclared identifier '__vdso_alternatives_start_offset'; did you mean '__vdso_alternatives_start_cfi_offset'?
>      198 |                                         __vdso_alternatives_start_offset,
>          |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                                         __vdso_alternatives_start_cfi_offset

Same as https://lore.kernel.org/lkml/20261013180342-b562676b-7fd8-433b-8d3f-a6daef549a5e@linutronix.de/

(...)
