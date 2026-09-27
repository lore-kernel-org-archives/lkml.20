Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BE441D120;
	Sun, 27 Sep 2026 18:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532919; cv=none; b=Wm25qpcwWPYSVyUm9GXgat4PMy0fc9lD6H51V7dpTMc9q9Xi5UXvAjQDQA1EEMihJpIg60mhkVPzOgB1h2haNQNV1rRvblD3Z/P4VOO3+PlX+UZu0ibZhQ4Ze56/v5ilO0Oo7n5GS2k1NQW0ZZsWJdM8oiw5JN57KIHEXtt9uKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532919; c=relaxed/simple;
	bh=dBn5wJO1h6EwxlcRwNZopdxEdAlPazAKzXsWBHe2oc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFZgQp/zGnAmq6+08lbl/a0IVUobDCaRwdUngwzrWLUJ5B1zUf7Jo2gZB5M8c6jtlTtLOcEaidujjJmQsmceUc1UNy3w+9OMlJXj2Doi0eoieUnIWjh7XGyvbcE2TL2QiBbo/TMbhHGvVQtWIbjI2U1R/EN2Q/gu6NGFa19bo2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=T05VUt0K; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="T05VUt0K"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5FE5C40E00E7;
	Sun, 27 Sep 2026 18:15:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MuGOHA8Mg9U1; Sun, 27 Sep 2026 18:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790532905; bh=fRDXQ9/LZ4sguk1tJkel0tpnrgtz4ISSQE06YARvlYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T05VUt0KBH/tcm6h8idYD3GmLGdMpkhC+OhqKbXV2JJUdx3r9ELUrwHtRHoE7PQZW
	 A5QJ9HMopPoMcDpdU1c9i8304GGGvzw+2a0Duh3owAtzPGD/TI/QAk7fSCKWptDxa/
	 rNqtmMHPig8o6MbwbkgQeF39rK5dMbqdS31j7aT5CgSboqxyLIXQ65jUiG2kjN7nZD
	 HVSNEOUxDy2B+xPatkB4Ur5+ZkPlUzoAR3em3Lf5nPwVf5lF4m/B7VTKuwyPQUqfGM
	 jhh/+D6p9n5Ja07oSZXHywGklr/2oDozqv66Y4yTjrYjEg2mw5mdcYXZc3ZW0Ee4gz
	 +wWXKOAs0FaC+K2Dp1Y+PHqJj3wGGzANTqd6esydsyur7en+1ipAjGrglMJ20BTQ45
	 VIq06HAtUSRBfKtpYzeMm4soGFPUKy7DuSVFXcU1Uw2JLSgiBYZr6hRZrV8xConzrn
	 112G81WW6EWwOiW7qjJgKQKcrksVF0DAEk/ty8INd/hY9SskTRacrX2wQ8clGMsQ2k
	 9UprKk1bjLBgbyROUxM9QEase1TueU+3Zgh0Fmm4N+RAranzdZ2GQkuSuFn0aMLXj5
	 MVuaREP7QAwZIJjsBVKMOiY+Qj+tGUkklCcJkaU9w0R4SRdCDOkhWYy06+OQJ7kJQO
	 c9Gj08ULVZddvgMjVyQ7izis=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C667140E01ED;
	Sun, 27 Sep 2026 18:15:00 +0000 (UTC)
Date: Sun, 27 Sep 2026 11:14:56 -0700
From: Borislav Petkov <bp@alien8.de>
To: Adrian Schlegel <me@adrianschlegel.com>
Cc: Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RAS/CEC: Only count corrected DRAM errors on Intel
Message-ID: <20260927181456.GAarldIBZHgSV3Qe5X@fat_crate.local>
References: <20260927151904.30524-1-me@adrianschlegel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927151904.30524-1-me@adrianschlegel.com>

On Sun, Sep 27, 2026 at 05:19:04PM +0200, Adrian Schlegel wrote:
> cec_notifier() is meant to consume only correctable DRAM errors, as its
> comment says, but it relies on mce_is_memory_error() for that. On Intel
> and Zhaoxin, mce_is_memory_error() also accepts cache hierarchy errors
> (MCACOD 000F 0001 RRRR TTLL) and generic cache hierarchy errors
> (000F 0000 0000 11LL). That check was added in fa92c5869426 ("x86, mce:
> Support memory error recovery for both UCNA and Deferred error in
> machine_check_poll") for uncorrected errors, where a cache error with a
> valid address can point at poisoned memory.

Looking at what calls mce_is_memory_error(), it looks to me like it should
exclude cache hierarchy errors but that's Tony's call.

> For corrected errors this does not hold. A corrected cache hierarchy
> error means a bit flipped in the cache and was fixed there. The reported
> address only names the line that happened to be cached. Counting these
> in the CEC makes it soft-offline healthy DRAM pages, and with the Intel
> action threshold of 2 from d25c6948a6aa ("RAS/CEC: Reduce offline page
> threshold for Intel systems"), two such errors on the same page are
> enough.
> 
> This was observed on an i9-9900K without ECC memory and with a faulty
> core. Bank 3 on CPU 1 reports thousands of corrected cache errors
> (MCACOD 0x0135, 0x0151, 0x0179, ...) with addresses spread over the
> whole physical address space. Within one hour the CEC made 502
> soft-offline attempts on 159 distinct pages. 453 failed because the
> page was in kernel use, the others took healthy pages offline:
> 
>   RAS: Soft-offlining pfn: 0x100250
>   mce: [Hardware Error]: TSC c43a09e330 ADDR 1002504c0 MISC 2514285
>   Memory failure: 0x100250: unhandlable page.
> 
>   RAS: Soft-offlining pfn: 0x24f6c8
>   mce: [Hardware Error]: CPU 1: Machine Check: 0 Bank 3: cc5ffdc000100151
>   mce: [Hardware Error]: TSC 21903b589a2 ADDR 24f6c85c0 MISC 2516485
> 
> This affects any Intel system with CONFIG_RAS_CEC=y and a core that
> repeatedly reports corrected cache errors, with or without ECC memory:
> healthy RAM is lost until reboot and HardwareCorrupted keeps growing,
> pages that cannot be offlined are retried over and over because the CEC
> drops the element after each attempt, and the messages point at failing
> DRAM while the defect is in the CPU.
> 
> AMD already restricts this to DRAM ECC errors since c6708d50f166
> ("x86/MCE: Report only DRAM ECC as memory errors on AMD systems"). Do
> the equivalent for Intel and Zhaoxin, limited to the CEC.

A note for the text from here onwards:

Please, do not talk about *what* the patch is doing in the commit message
- that should be obvious from the diff itself. Rather, concentrate on the
*why* it needs to be done and why your patch exists.

It is perfectly fine to explain non-trivial aspects of the code the patch is
touching but do not regurgitate what it does.

See also https://docs.kernel.org/process/submitting-patches.html for
additional inspiration.

> Add a helper cec_is_dram_error() to drivers/ras/cec.c and use it in
> cec_notifier() instead of mce_is_memory_error(). On Intel and Zhaoxin
> it only accepts memory controller errors, i.e. MCACOD matching
> 000F 0000 1MMM CCCC, which is the first of the three checks in
> mce_is_memory_error(): (status & 0xef80) == BIT(7). For all other
> vendors it falls back to mce_is_memory_error(), so AMD and Hygon behave
> as before.
> 
> Corrected cache hierarchy errors are no longer counted by the CEC.
> cec_notifier() returns NOTIFY_DONE for them, so they still reach the
> default notifier and are logged as before. mce_is_memory_error() itself
> is left unchanged because other users, like the nfit driver, rely on it
> for uncorrected errors. The action threshold and the handling of
> uncorrected errors are not touched.
> 
> Tested with mce-inject (sw) in a VM with an Intel CPU model. A corrected
> cache error (status 0xcc5ffc0000100179) is no longer counted and its
> page stays online. A corrected memory controller error (status
> 0x8c0000000000009f) is still counted and its page soft-offlined.

Testing notes come...

> Fixes: 011d82611172 ("RAS: Add a Corrected Errors Collector")
> Signed-off-by: Adrian Schlegel <me@adrianschlegel.com>
> ---

... under those three "---" of the patch so that they don't land in the commit
message.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
