Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307898;
	b=RVuvJqaqpHdg6G3qxSKrTh6HBWvo8n3Agd8HXJqwo7CmQic5GVNICVokdg4+nVJz1SWs
	 mVF2JlaO/uRjIc00LX2IHTm9uHd9knIDB53as2Yigd7EhcgdfSsze0SwLM8vvqCEGuGTs
	 rwO0hOGtZ5hv3jS6o9IVimgQOChav//225f/XHVnuVmAcG/6225Nlw/pkOCPohb+TK4r6
	 pcuHleObPjnRdwkOFCO86JHRTI3ixi5TwtIO6ZII/hqTJE3NUXvZquR2+oxnSpWO9C9er
	 xHrmJpChAp4+30x8eTvY605SbIJdXq+wnF5AsGDP1N7d++YijQ9yVha/YydokuJEXdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307898;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pvnY73Q0V05Um+rlosdIP96Yb0fzFhR9UVvX1gsB0Yo=;
	b=UHJmBxSQkCVwRK19nGsbY4W1RggOyQxRUWP8Hsk6134yGZUk5+fUFKaPjG2sym1FMQMp
	 96qhd0vhl4C91FR+0qssiZ+Z7kU62624A6BL+vORjfaWcd3nWw8vkVWQQ4SSd2g06Fs9+
	 0rhIUy5ud/g2QQgrczJpP3SLzn3ktjqyXtlWEBUX5srr4PZZyWcOpVNlGBV0IbLqtLMn3
	 sdbm5ay276hpm3+/0Wb0kILNvC/kBnMWoPq8dOXMId69ZwekW2rpbbzPglCKFYJxFhWSo
	 ZYi0gotodfABd179Se312wHp0vpit1kg3NEdlYF2f9gBOPVTsGe7EKT+f6rPM5KGyag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="LSb42G/4";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D674606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D674606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LSb42G/4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D96A81682;
	Thu, 29 Oct 2026 14:04:53 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2AEB3F59E;
	Thu, 29 Oct 2026 14:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793307896; bh=AnM4OnNBjAGRdciRyyuMhYkvFvjMOCFE7WXWqQyeFXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSb42G/4AzMi28jRIjLxA2hy9xVDdhvjBX3T0x5KL21W4mh6bcAeON7PSzOy7v7gH
	 pJq/0Ntr/E1A0YLcik771E8X28SlnQY77AbmdbXcZPi5W1ncvnF9+zN9YP0mdbgCbo
	 xnVgMB6oAYh0DMA6ub7ED1hPi1ks4rRphmD/zsDw=
Date: Thu, 29 Oct 2026 21:04:53 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: mm: Stop using the previous ASID for init_mm
Message-ID: <auO09UUOqkhXXuoI@arm.com>
References: <20261027100231.31184-1-jiangshanlai@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027100231.31184-1-jiangshanlai@gmail.com>

On Tue, Oct 27, 2026 at 06:02:27PM +0800, Lai Jiangshan wrote:
> From: Lai Jiangshan <jiangshan.ljs@antgroup.com>
> 
> Switching to init_mm should prevent further accesses through the
> previous address space's translations.
> 
> Commit e53f21bce4d3 ("arm64: Use the reserved TTBR0 if context switching
> to the init_mm") avoided installing init_mm.pgd as a user page table.
> At the time, the ASID was held in TTBR0, so installing the reserved
> TTBR0 also switched to ASID 0.
> 
> Since commit 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1"),
> installing the reserved TTBR0 no longer changes the active ASID.
> Consequently, switching to init_mm leaves the CPU using the previous
> address space's ASID. An empty page table does not prevent TLB hits
> for that ASID.
> 
> This can retain access beyond the lifetime of the backing pages.
> During fullmm teardown, user data pages can be freed before their
> cached translations are invalidated. If those pages are subsequently
> reused for kernel data, an erroneous uaccess that hits a surviving
> translation can read or corrupt that data instead of faulting.
> 
> Fixes: 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1")
> Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>

Thanks for the report. I think the problem identified is real. My TLA+
model (apart from having a bug in how it modelled speculative TLB
loads), did not exercise this init_mm case. I updated it and it now
shows the problem.

We'll check your fix in the next few days.

-- 
Catalin
