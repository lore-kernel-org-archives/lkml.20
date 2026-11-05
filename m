Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907947;
	b=wPzGoIccyVcB9aFP00B0lIF4h+fobNXuXto8Xm1eUt60ifqLDWJcrSBOHV9X2zgxBUmO
	 /oiy0/hwpbYaU+fqAkgUZchhSF0NlkmRnJWSe9jNgE9HIk+XoNE62/cIf1x4w+g46zPC6
	 xQbSRPy/XN97gJrXx6Oe6V9eK+e8+PloMsp623mJgTugpSXu0bbc0XRLwVByPtycCD3LT
	 V2VPoW4vQlUPFaKlr2Gmrh0szyBMiw2NgxiLyi4rsSKLheqgdF/SrpL8iErXoxTWsZ4Kw
	 Tr+ZQ2PzfacsR8Xv2NFPHd5WNAtz/ptsQRA4XOw9TLxzgvWj0+CkIa/kFarWL+QEvRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907947;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O+b2CEdDKEdEJRUd5RHgrY0iO3z0E6MZ13SB7PplqWY=;
	b=ByDhdLuo140r6ZAROjSRKhr65Huv5pXsmfdK8d4pwe2La/EXbM9uxyGnGO/84WfqANET
	 cbrfSAnc0En23AhueHGMJ6wCLYzuJa1Oow8ekGUy1jHK1Nvg0IILkcMdwJrDpJJ+SVedE
	 Kk29s3tuLveMykLBF+a1pDvq96UnoCzNYixpdkxPi7hmPG25sYMXbEpxVOWOZl+wZJpi3
	 3+Q6yf0tnKlqVvE5BUDBtXRdn9nwKc7n40VEZH2LFCNxmg5PM/nJMFA7/57ECWoq72YK+
	 im0twgqEeNTzuMEUdgFZYZVMHS+tlVhI68yQeQxYdnqDg6X+Q/OblNztaBf8p5Z3LPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=iPmd+A8K;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5FD606EEA4;
	Thu,  5 Nov 2026 19:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E5FD606EEA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=iPmd+A8K
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 88B8140E02C2;
	Thu,  5 Nov 2026 19:45:42 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WBePi9-GTnC5; Thu,  5 Nov 2026 19:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793907937; bh=O+b2CEdDKEdEJRUd5RHgrY0iO3z0E6MZ13SB7PplqWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPmd+A8KEd0q4hN95Nr1QYf2Csgjuffx7FYoEQYjauSlO27kgJCK4u+vIt0+Jkon0
	 AreUeg3+LS+4LT1YTkwW17gyGdPyvxemMLJbpv7bBh9qwwxFqNsa8C/NPadaqtSiD6
	 qQb+VkOT6pYF+Q/EyNWjJTYzuRnKYccxm1trHSS92IGzriZjyeDjSZTMGY2scp9Djl
	 /oMkNpsWrJCzxCQyFIzdydE6cvVYp1spRJPwSqLC+LTL3wf0ATQdcxa5NWoOaZe0NG
	 csJgEn9R4cWl20kq8dfHWgYIIHaFp5nA/6BA6Hn98xd90AOuve78w9nccIjpveDPrU
	 sd9/Sl9uOvZiD7z5BLHJhNRZV9KHVqFq06xCsgXkh5yrViAW0bJGZhZtB6iIYMpj/Q
	 umychTES7E8Muu5pSkUOj2OKihCrnVFMiQ62U63KCTmb/UU7xJkEP3+v7wJauci9wK
	 fFwvqfWDFaachAz2TgKvn1TiY5yLQpbLGfzw8pyrrhbL2YH3E8R5N0cFiob7OCA1m8
	 kFliA50y0VAfZ7KxjP0oT4o7qrZHn4+DnuSnuqXF2AgNriadws+/nd231ca4hQl/sh
	 6bbwyIZMU1mweBs4XDwqeS8RauK9VhBjyDqal1gwWicCkyIfSEeBhS0mM01BgzADF9
	 h94aIDZ5zrUConvG7MezKcAI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2058240E0184;
	Thu,  5 Nov 2026 19:45:32 +0000 (UTC)
Date: Thu, 5 Nov 2026 11:45:29 -0800
From: Borislav Petkov <bp@alien8.de>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/i3200: drop the PCI device reference on module exit
Message-ID: <20261105194529.GAauzc2axWPncLCpVo@fat_crate.local>
References: <20261104033833.1566974-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104033833.1566974-1-vulab@iscas.ac.cn>

On Wed, Nov 04, 2026 at 03:38:33AM +0000, Wentao Liang wrote:
> i3200_init_one() takes an extra reference on the memory controller with
> pci_dev_get() and stores it in the global mci_pdev pointer.  When the
> driver probed a device, i3200_registered stays set and i3200_exit()
> calls pci_dev_put() only in the !i3200_registered branch, so the
> reference is never dropped and the PCI device can not be released.
> 
> Move the put out of the conditional.  i3200_remove_one() still has to be
> called by hand only for the i3200_init() fallback that probed the device
> outside the PCI driver core.
> 
> Fixes: dd8ef1db87a4 ("edac: i3200 memory controller driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex

Grep the kernel tree for Assisted-by guidance.

> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/edac/i3200_edac.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

$ ./scripts/get_maintainer.pl -f drivers/edac/i3200_edac.c
Borislav Petkov <bp@alien8.de> (maintainer:EDAC-CORE)
Tony Luck <tony.luck@intel.com> (maintainer:EDAC-CORE)
linux-edac@vger.kernel.org (open list:EDAC-I3200)
linux-kernel@vger.kernel.org (open list)
EDAC-I3200 status: Orphan
		   ^^^^^^^

All your patches touching orphaned EDAC drivers are going to be ignored - you
don't want to spend any effort or burn AI energy on them.

I already told you that the last time you sent patches. It looks like probably
no human even read my responses.

Quickly grepping through lore.kernel.org it looks like this effort you're
doing is some AI gunk mindlessly sending kernel patches.

So you will be ignored too.

Just remember that if you don't listen to maintainers and ignore their
feedback, all your effort and wasted energy will be for nothing.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
