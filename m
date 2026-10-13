Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79564502767
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907815; cv=none; b=EV5D/Pb48rrpIh974Np5SjTPUVbiJMN4K5kuQjprrc7WvkQHFXNi5z0q7wsmTidDntSGe2chXxKDAwJ2eZoNm9gLstT4n/b2HZS5EHEXVmUFHc9dmRSJHfgUXkJrCFgNruU0rAy819+JK2hZ8WT1gV3Zbh1wLOD/K3CbHnwjFTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907815; c=relaxed/simple;
	bh=8kjH6BEqFtW8iGs578Qah3e0JZ8H8gObSOQuXPhgA6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIFUp5WIvXgQ534fYirrvG032JI0P5IU86k+Id2eP7Qe2qVpyaem7FoiXOoNBxy21Mmi5kyk13+pInnBczgw8UjvazNWQ0OtqAGROSmeVUkypeuAy/LU8IH30BL/dqddRS8M7LZoOZV2yN9jipMZdg7tlDKIMhAccUIAoGzWx1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=akbHu5jk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vIOiHhHE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="akbHu5jk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vIOiHhHE"
Date: Tue, 13 Oct 2026 18:10:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791907810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zJq8JxfE1u5dAwYp63/Krdm7jwWp1EzNhKxbOj04ukk=;
	b=akbHu5jkMYRTLC1+xP/CoqHOh589pW2nO06Px9EnuPugTQMRJx+wi5UtLCSmfNfwaln9Qe
	BqS4hyyOmoKVIwS8lYhfvSzuwjgovebXnqPxcUOkT0GVZ/ncJhUJldQyU4s0a1NMN6QrvF
	UlJGwhWJFxYleK37Fz8jD7TXADosYYhFPs0l0qNZZWDXusE6an10XK1qTbqtkSBxQ/205v
	gZU7YKxDmkT06jlj9JvI7QEF6cbfa3OxYyoPmisjWx4tbPBSWjdxP2qrAUVP6yk8bTtVsO
	nrcLXQECpjVLpt0zwOHgUTzA83weiS2ohlQNjO+uk5RpmABQ+pSNCYPpBNA40A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791907810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zJq8JxfE1u5dAwYp63/Krdm7jwWp1EzNhKxbOj04ukk=;
	b=vIOiHhHES31glFsQR9Pu0klXSPMFuFu5dp/W/aeFVd6TxoLfrobz3weOv0b7J03soAymww
	KOgRT79YfLh15RAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Nam Cao <namcao@linutronix.de>, linux-riscv@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: arch/riscv/kernel/alternative.c:198:6: error: use of undeclared
 identifier '__vdso_alternatives_start_offset'; did you mean
 '__vdso_alternatives_start_cfi_offset'?
Message-ID: <20261013180342-b562676b-7fd8-433b-8d3f-a6daef549a5e@linutronix.de>
References: <202610131613.BpOi6VPp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610131613.BpOi6VPp-lkp@intel.com>

On Tue, Oct 13, 2026 at 05:01:07PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> commit: 63aecaba41a4b2593697f208e91bf542248ec4f8 riscv: alternative: Use the statically extracted vDSO section offsets
> date:   10 weeks ago
> config: riscv-randconfig-r2104-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131613.BpOi6VPp-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131613.BpOi6VPp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 63aecaba41a4 ("riscv: alternative: Use the statically extracted vDSO section offsets")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610131613.BpOi6VPp-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/riscv/kernel/alternative.c:198:6: error: use of undeclared identifier '__vdso_alternatives_start_offset'; did you mean '__vdso_alternatives_start_cfi_offset'?
>      198 |                                         __vdso_alternatives_start_offset,
>          |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                                         __vdso_alternatives_start_cfi_offset
>    arch/riscv/include/asm/vdso.h:29:15: note: '__vdso_alternatives_start_cfi_offset' declared here
>       29 | extern size_t __vdso_alternatives_start_cfi_offset, __vdso_alternatives_end_cfi_offset;
>          |               ^
> >> arch/riscv/kernel/alternative.c:199:6: error: use of undeclared identifier '__vdso_alternatives_end_offset'; did you mean '__vdso_alternatives_end_cfi_offset'?
>      199 |                                         __vdso_alternatives_end_offset);
>          |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                                         __vdso_alternatives_end_cfi_offset
>    arch/riscv/include/asm/vdso.h:29:53: note: '__vdso_alternatives_end_cfi_offset' declared here
>       29 | extern size_t __vdso_alternatives_start_cfi_offset, __vdso_alternatives_end_cfi_offset;
>          |                                                     ^
>    2 errors generated.

This looks to be a only a follow-up error.
The real issue is https://lore.kernel.org/all/20261009214501.GA905361@ax162/.
Which leads to no vDSO being generated and an empty vdso-offsets.h.
In addition to fixing the linked issue, we should also make sure that the build
properly aborts if one of the intermediate steps fails.

> vim +198 arch/riscv/kernel/alternative.c
> 
>    186	
>    187	void __init apply_boot_alternatives(void)
>    188	{
>    189		/* If called on non-boot cpu things could go wrong */
>    190		WARN_ON(smp_processor_id() != 0);
>    191	
>    192		_apply_alternatives((struct alt_entry *)__alt_start,
>    193				    (struct alt_entry *)__alt_end,
>    194				    RISCV_ALTERNATIVES_BOOT);
>    195	
>    196		if (IS_ENABLED(CONFIG_MMU))
>    197			apply_vdso_alternatives(vdso_start,
>  > 198						__vdso_alternatives_start_offset,
>  > 199						__vdso_alternatives_end_offset);
>    200	
>    201		if (IS_ENABLED(CONFIG_RISCV_USER_CFI))
>    202			apply_vdso_alternatives(vdso_cfi_start,
>    203						__vdso_alternatives_start_cfi_offset,
>    204						__vdso_alternatives_end_cfi_offset);
>    205	}
>    206	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
