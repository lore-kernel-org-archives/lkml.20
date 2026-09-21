Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519AC45DF5B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981765; cv=none; b=uLqhH91qA+hcyJqYNvgT3hAUJ3TH9flqbkZoavce+DUuP+EqR63HrllQgOt3vRUyj7RNzS9SZ83al0yjkuBcyjReOLjGi9+A1scbMmVDNpq9WWWKRubN6OYeu13YCAnIcy6Tox+m94hHAOch+sUGqf8/RphSrWRHJWNToRHZ6Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981765; c=relaxed/simple;
	bh=NzXT89fT91jRss88v9wu5H7tWKGtVCzsHuCRkJMBwFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QElwOXgxpA+kOZ/EJ+BqTHdsiQ+JbiHRo2SLa2K7WvnDnuhNR4IfgSin78hMFut8FJ6lqg+IH7EopcB7mBuwZ1BfbFkBSA/Ds6ARhW8EVw4MXsxJKEBjKKc3BiiZYcQ6r8mjCv/HHoodgYdigGun31ufq/qMRy8CRBvnFeuchVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KIlF4TH5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KIlF4TH5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A1CD1D13;
	Mon, 21 Sep 2026 02:09:20 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 825863F86F;
	Mon, 21 Sep 2026 02:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789981763; bh=NzXT89fT91jRss88v9wu5H7tWKGtVCzsHuCRkJMBwFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIlF4TH5rCEyZsursZk865vh+sMS4tSuhkm6t2NtH4/1PDNneEHciBiaLXqvLwMyH
	 iHDXuOlz64TJYimgzK1yZnb0ziw4VpAI/oT0uaQ9G34qvyt+WcIJp6Tr0kY0LLCK+J
	 24+7i4E5aN2uOmGV2euDIHnC1OZFX5GkhHsNyIQU=
Date: Mon, 21 Sep 2026 10:09:15 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Russell King <linux@armlinux.org.uk>, Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: errata: document Cortex-A9 r4 as affected by
 erratum 754322
Message-ID: <arD0O8BgRmhnbvSx@J2N7QTR9R3>
References: <20260920032926.452884-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920032926.452884-1-qingfang.deng@linux.dev>

On Sun, Sep 20, 2026 at 11:29:23AM +0800, Qingfang Deng wrote:
> The Cortex-A9 r4 Software Developers Errata Notice (ARM UAN 0009D),
> section 2.3.3, lists erratum 754322 as affecting all r2, r3 and r4
> revisions. The Kconfig help text currently mentions only r2 and r3.
> 
> Add r4p* to the affected revisions so that users configuring Cortex-A9
> r4 systems know that the workaround also applies to them.
> 
> Link: https://documentation-service.arm.com/static/608118675e70d934bc69f143

The document you link to says:

	Fault Status: Present in: All r2, r3 and r4 revisions. Open

The "Open" part means this isn't fixed, and so we have no idea whether
this could afect a hypothetical r5, etc. Listing all the affected
versions is a bad idea as it wil just lead to needless churn...

> Fixes: fcbdc5fe6ebe ("ARM: 6772/1: errata: possible fault MMU translations following an ASID switch")

I don't beleive a fixes tag is necessary. The code works regardless of
what the documentation says.

> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
>  arch/arm/Kconfig | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 0cc289a7184a..c7d631d5242b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -708,11 +708,12 @@ config ARM_ERRATA_754322
>  	depends on CPU_V7
>  	help
>  	  This option enables the workaround for the 754322 Cortex-A9 (r2p*,
> -	  r3p*) erratum. A speculative memory access may cause a page table walk
> -	  which starts prior to an ASID switch but completes afterwards. This
> -	  can populate the micro-TLB with a stale entry which may be hit with
> -	  the new ASID. This workaround places two dsb instructions in the mm
> -	  switching code so that no page table walks can cross the ASID switch.
> +	  r3p*,r4p*) erratum. A speculative memory access may cause a page table
> +	  walk which starts prior to an ASID switch but completes afterwards.
> +	  This can populate the micro-TLB with a stale entry which may be hit
> +	  with the new ASID. This workaround places two dsb instructions in the
> +	  mm switching code so that no page table walks can cross the ASID
> +	  switch.

If you want to change this, you could say "r2p* and later", but TBH I
think we can just leave this as-is.

Mark.

>  
>  config ARM_ERRATA_754327
>  	bool "ARM errata: no automatic Store Buffer drain"
> -- 
> 2.43.0
> 
> 
