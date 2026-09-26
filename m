Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058335839C;
	Sat, 26 Sep 2026 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790449227; cv=none; b=DtLZTEaHsPZ5xKjnS0BsRxqsVvIl0A9iT0tqLnZnHWlAn6teMIL5YDd8neHyZE9a1ZEkFbbrW8Ss2JRYBtwY6oG/DEt3UqMflSk86TG+7FWH22aXiCdCgAH97WRMHdX6x4oQsjG5TJjyEPm6QwJkPKazuBWJbTeuLqdzLzdAZSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790449227; c=relaxed/simple;
	bh=fM5RivQaWOtHiTJal6x6EBNfPEuOofEDcbUHS5HGSuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXBJhpBUkrv2j0ns+DVINRPuIWJWHpzS+lH0kdLDbPhTC2pua7d0S0U4Nkci8MNDoOvjrrhwaoqcMReuiMd5U+oFik7M/ihkKRxY5EPJxVrzZasTj7XW+AeewMHDtvBGCLGTWWq12Y4P25Q/gxoh9RiPyNAwngvnDZOVY/WBJgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Pm3QsuWl; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Pm3QsuWl"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1DFCC40E021A;
	Sat, 26 Sep 2026 19:00:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GaazPhI6-TZu; Sat, 26 Sep 2026 19:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790449204; bh=Oc4CFS3m9q5cCTFNnVZ62das+xWWMKBlgTXKyhe+WxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pm3QsuWlL/a09OeN1xLU/EOYRCxYsJRQIYiD14ztv9mzKtp56o3qEhvedJ19qY6ZT
	 QRs5bVWbCfsD8kHGlfLivDNGyEMhFGBy+81n+wJFFv4nx6k7f7ruPr1NDQZZWlKJNO
	 4ta80/elx7xUljoEiK+d9qgC7x3SuA1vkJljNuKlzMU15JhMdZRJeUwTbvt38+BeCQ
	 yq6QlYbLhEijBkt/SvoxBzgWp5ZtxU5p1+4GOkVnGslC58oLk9VvG2yKHiKxj3w7Uo
	 t65HBlfXHEHXiJn+9/9bVgt6tVllhgz6n9wRW1E25Nv6iLHV0jGPjaOJ0qP6mmKbW6
	 k0paoDT8vyBcdenQBD9zJoBwcg0NVIoA3EiNADzBwwl1VrP8j1UAR5YkXXTkA+crv3
	 2GZF2nO5pSf+eIHh8fpG033tJVtLbpIBJ1f+JRzJg6G3FXAVOTywY46+UW3+ZmHqVL
	 91JGPa3cLLU4+v9Dbsjwxds8xE3MnVCGuHIl5c1SVb6xRiI1ie//tFbW96vipNkuUW
	 ZE8AdZPo7A9N9DoorGPymBEijXIX7036httgmAkIGC2szv4iMkSQlgmBBLcdEEudCe
	 oNbDEJiiKSlb46E4u+GY1qLdAHKw57XnxcD/94yz1hjWEbBsZgX+bohFfHaPWxuu2E
	 t1DtQfr4e+zqUpI2E5uD/ZJ4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 07D8C40E00E7;
	Sat, 26 Sep 2026 18:59:58 +0000 (UTC)
Date: Sat, 26 Sep 2026 11:59:55 -0700
From: Borislav Petkov <bp@alien8.de>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Rounak Das <rounakdas2025@gmail.com>, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] EDAC/altera: Fix device node reference leaks in the
 SDMMC ECC setup
Message-ID: <20260926185955.GAargWKzpAwXXC4CQW@fat_crate.local>
References: <20260926120846.35716-1-rounakdas2025@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260926120846.35716-1-rounakdas2025@gmail.com>

On Sat, Sep 26, 2026 at 05:38:46PM +0530, Rounak Das wrote:
> Under altr_portb_setup() and socfpga_init_sdmmc_ecc(),
> of_find_compatible_node() was being used to look up the sdmmc-ecc
> node. This node wasn't being dropped using of_node_put().
> 
> altr_portb_setup() did not drop its reference under its success path
> or on any error path.
> 
> socfpga_init_sdmmc_ecc() did an early return thereby skipping the
> common exit label and thus leaking the reference.
> 
> Add the missing of_node_put() calls in altr_portb_setup(), and route
> socfpga_init_sdmmc_ecc()'s success path through the common exit label.
> 
> Fixes: 911049845d70 ("EDAC, altera: Add Arria10 SD-MMC EDAC support")
> Fixes: 788586efd116 ("EDAC/altera: Initialize peripheral FIFOs in probe()")
> Cc: stable@vger.kernel.org # 6.18+
> Closes: https://sashiko.dev/#/patchset/20260708091135.94114-1-rounakdas2025%40gmail.com
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>
> Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
> ---
> v3:
>  - Rebase on top of Dinh's "Address sashiko reviews part 1" series (Dinh).
>  - Limit stable backport to 6.18+.
> v2: https://lore.kernel.org/all/20260717131720.19038-1-rounakdas2025@gmail.com/
> v1: https://lore.kernel.org/all/20260717102549.13309-1-rounakdas2025@gmail.com/
> ---
>  drivers/edac/altera_edac.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied, thanks.

Btw, Dinh, that altr_portb_setup() needs proper scrubbing and reworking of the
error handling into using proper goto labels. Otherwise, there'll be more
sprinkling of unwinding functions like in this patch everywhere and this'll
turn into a real nightmare soon.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
