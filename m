Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA1B55930D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959097; cv=none; b=T9YfTBfibIoBx0kkNhxJcvA2EqexaouRXU6drOe6Jds1M3ZrimoccqY6MXp8sH7wSltExPku30L+3wjGb0UKkEVuHPQLwN6DtutkGxU7wm40xShUE9/RaqrFEC9o06tqiIKe0gEL5Dj/D3/DONmmmdgzbFbmv5iWqxp3GslHhHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959097; c=relaxed/simple;
	bh=WO65y5mp2AwUj70pJWexzE8QK0V6BWthMQZ/LZbsR2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwIckNK61mtSPS6+0VIKZhXJg/uQf0wZudnGfHXY7kcL/OKbiYvUziwy1pC9iDa1Qxth6MOyqvUR8nJMjZYU7uPlKiLj3DGTeOPcY/vDktHr8ATeByeFAUCl2F+058vsmSbhn4QICj/MkN5XF/P0VTH+XrLu3GN9lqp8pEf3ESw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBrCSlZd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBrCSlZd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541401F00A3A;
	Wed,  9 Sep 2026 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788959096;
	bh=KOTyaBK2KKJpatsunAGspQ5hLNvxaFeB75t6zJtPUos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mBrCSlZdpNET5vXckVufbjagiAVg4XHBw76w1UoGlyTZ29Y7yam5UTgUTzNxwhjAH
	 9p3AzZ3X1F+eXdaS3Ie06eqlOXHML+7woAtl9ENsEl7JvQPVVrJacYKKoyLl4IC4Jt
	 av50Q9DsSei9LmDbgT8sFoaLHjkXBQ6NVaq9ypZZqta8djSfRj5TbwkNJYROpG5+8q
	 q9InoiPSbbgAskhF0PxHsXgP1sNOfZnIJpy/U/odGh0crr3nhSI93KrAnuUeI4O1mB
	 Xix49eTvas35TVxa2uFaBg3fKGALP53lnM4FgyrR3rk420ddJsVqafw3DK0KkbKmBJ
	 lJElcrDMUp4xg==
Date: Wed, 9 Sep 2026 14:04:50 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Zeng Heng <zengheng@huaweicloud.com>, suzuki.poulose@arm.com,
	anshuman.khandual@arm.com, gshan@redhat.com, david@kernel.org,
	wangkefeng.wang@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: io: Reject present-invalid user prot in
 ioremap_prot()
Message-ID: <aqFZco-0kpQIIxZQ@willie-the-truck>
References: <20260905033148.3657516-1-zengheng@huaweicloud.com>
 <aqFWAWNzYagW2NNH@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqFWAWNzYagW2NNH@arm.com>

On Wed, Sep 09, 2026 at 01:50:09PM +0100, Catalin Marinas wrote:
> On Sat, Sep 05, 2026 at 11:31:48AM +0800, Zeng Heng wrote:
> > From: Zeng Heng <zengheng4@huawei.com>
> > 
> > Mapping a stack-top page via /dev/mem with PROT_NONE and then reading
> > that process's /proc/<pid>/cmdline triggers a spurious WARN in
> > ioremap_prot() through generic_access_phys():
> > 
> >   WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
> >   Call trace:
> >     generic_access_phys+0x1c8/0x228 (P)
> >     __access_remote_vm+0x2b4/0x398
> >     access_remote_vm+0x14/0x30
> >     get_mm_cmdline+0xf8/0x2a0
> >     proc_pid_cmdline_read+0x68/0x120
> > 
> > generic_access_phys() passes the full pgprot derived from the user PTE
> > to ioremap_prot(). A PROT_NONE /dev/mem mapping is encoded as PAGE_NONE,
> > which clears PTE_VALID and sets the software PTE_PRESENT_INVALID bit.
> > On arm64 such an entry is still pte_present(), so follow_pfnmap_start()
> > reports the pfn and generic_access_phys() reaches ioremap_prot().
> > The PTE_USER assertion, which is meant to catch kernel prots being
> > passed by mistake, then fires for a PROT_NONE user mapping
> > that legitimately lacks PTE_USER, producing the spurious WARN.
> > 
> > Reject a user prot encoding a present-invalid (i.e. PROT_NONE) entry up
> > front so that generic_access_phys() cleanly fails the access instead
> > of warning. Note that PTE_PRESENT_INVALID aliases the PTE_NG bit and
> > is only meaningful when PTE_VALID is clear, so both bits must be
> > checked together.
> > 
> > Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
> > Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> > ---
> >  arch/arm64/include/asm/io.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> > index 21c8e400107c..bbfbc4682639 100644
> > --- a/arch/arm64/include/asm/io.h
> > +++ b/arch/arm64/include/asm/io.h
> > @@ -272,6 +272,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
> >  	pgprot_t prot;
> >  	ptval_t user_prot_val = pgprot_val(user_prot);
> >  
> > +	if ((user_prot_val & (PTE_VALID | PTE_PRESENT_INVALID)) ==
> > +	     PTE_PRESENT_INVALID)
> > +		return NULL;
> > +
> >  	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
> >  		return NULL;
> 
> I wonder whether we should just drop the warning and return NULL if
> !PTE_USER && PTE_UXN. The latter check would also catch execute-only
> mappings (Sashiko pointed out this case still trips the warning). The
> PROT_NONE case would be covered automatically as well since PTE_USER is
> cleared, PTE_UXN set. Maybe add a comment that that pte_protnone()
> relies on !PTE_USER && PTE_UXN, so it's not that we avoid the PROT_NONE
> issue by chance.

Hmm, do we want exec-only mappings to be readable via /dev/mem?

Will
