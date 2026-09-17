Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2773353A62
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619175; cv=none; b=LeBj8GeOdAhOUXsX+JHs1lt4sfNChVp0NX4uqJGfteFprSH6VA2debcp/1DuH2AmVM+lcVS8GbuSunOnMVpPQcq0ELBrIgGgIJoCJdSxUN+eIYg/RR6bZXNUsEb6KlEWIiekoRCMHjG5ZRV0I9Ed0fPXkaTd4gzokgZQziAB0sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619175; c=relaxed/simple;
	bh=EgXTNuPyQIL5qR2/Uw/QQJ0weEFCg16n/wsDo/uqsqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yna8j4AimNNZBwLh/HGAP8KRJLN/zxaoJD9d11TdCoU1OlWNLQmCpLhDtsBrKoAw0miLXvFHgth7k8ZQo/AA4MuUXgqJkXK/o681Un80bea1n7CCVGGndQqoHq5LdbbmPHoAsF/PVWCwBnQrDv2+UrwTp4b6mo71w0DsUjYJdEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LYojUdTg; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LYojUdTg"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1E361476;
	Wed, 16 Sep 2026 21:26:09 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 713783F882;
	Wed, 16 Sep 2026 21:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789619173; bh=EgXTNuPyQIL5qR2/Uw/QQJ0weEFCg16n/wsDo/uqsqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYojUdTgIB2UPdkBV85+uIudRJGbmFduw8RmczXhFdRRGnBzUEGmqZPPxq8lAzPMQ
	 UlnzPf852DScCiQ9xzX6ugLDLyZlTF3Vrvc7mgae38oSyuBdnMzK8ZOvPcUS5ue7U2
	 Nyc2E8MlEPVadDDIUDzOmU/1qSSPUItaMJjfZaCM=
Date: Thu, 17 Sep 2026 09:56:09 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V2 02/14] arm64/mm: Route all pgtable reads via
 ptval_get()
Message-ID: <yjqldpl7il6uqfoqrszaopchqthhlffssprmlqjkljvpkbpwkt@zetb5hyvllsl>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-3-anshuman.khandual@arm.com>
 <05a7ac7a-b7bb-4f75-a395-6854874fb8c7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05a7ac7a-b7bb-4f75-a395-6854874fb8c7@kernel.org>

On Wed, Sep 16, 2026 at 03:38:13PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 05:50, Anshuman Khandual wrote:
> > Define arm64 platform specific implementations for new pxdp_get() helpers.
> > These resolve into READ_ONCE(), thus ensuring required single copy atomic
> > semantics for the page table entry reads.
> > 
> > In future this infrastructure can be used for D128 to maintain single copy
> > atomicity semantics with inline asm blocks.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >  arch/arm64/include/asm/pgtable.h | 38 +++++++++++++++++++++++++++-----
> >  1 file changed, 32 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index 83087b70f192..f764132ca34e 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -84,6 +84,32 @@ static inline void arch_leave_lazy_mmu_mode(void)
> >  	arch_flush_lazy_mmu_mode();
> >  }
> >  
> > +#define ptval_get(x)		READ_ONCE(x)
> > +
> > +#define pmdp_get pmdp_get
> > +static inline pmd_t pmdp_get(pmd_t *pmdp)
> > +{
> > +	return ptval_get(*pmdp);
> > +}
> Ah, one thing: you could pass a const pointer to all these read helpers.

Sure but first will have to change their defaults in include/linux/pgtable.h

> 
> -- 
> Cheers,
> 
> David
