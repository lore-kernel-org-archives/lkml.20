Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F6D134CF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789618151; cv=none; b=Z2+j9LxpgxMOhdc6rqgWiYlr875jO29sxDdxQA8LRKNWvbK89Z49eFC8HcEiNXs6Q/y0Kv9f9asZRykniAobhpx6crejhlm55izVz6wH2TyKoTyyF8VRrFbIMs9bOJy8ENyLQ1G6CrGASfDy65qa2J559vyLTSu+ni4Z/+t/mj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789618151; c=relaxed/simple;
	bh=5GXteUxX4b4RFIQjbUzEzoICCQe6hAeor7DxccEGQU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6S0vJOZ5eEqWv8Drck2spL/NFFmLEwPEUMq/XPFSBF+vWyDAh1YQOBepUqzE/QY0cKehghFU7U8FPNSnyAW3MOIai8x0O9sspJ2CzPw/Cp1vPdw1mMhEkGNJwx307wXKCLP6oYeyi7HhwUse0e6HCVsmoUO45llnSNmEO6iWa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HAHadbtU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HAHadbtU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDD791476;
	Wed, 16 Sep 2026 21:09:03 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 912E13F882;
	Wed, 16 Sep 2026 21:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789618147; bh=5GXteUxX4b4RFIQjbUzEzoICCQe6hAeor7DxccEGQU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAHadbtUWor+UPPD2El1Ab1cLvu9Izc8++N5S4s7CeE7KFBgmGEZXWsnXfIuWP4Mv
	 HAc+BNzsQF5s88XfpBnGVobDPR0JDXHHP72RfKJDuZ8wxOXfQO4WHUOU6lXIN9UU+Y
	 +Bi0DzCzabD1DvTrF3pC9rUTS22Ux+BhRv3HIZDc=
Date: Thu, 17 Sep 2026 09:39:03 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V2 05/14] arm64/mm: Override read-write accessors for
 vm_page_prot
Message-ID: <gyb53u42u6klaqvkqdzsqjp6tzjrywnfi6ceg4a2p7nxftbll2@wi7i7sytr46a>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-6-anshuman.khandual@arm.com>
 <51993407-083f-45b7-990b-105a0c08a5a0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51993407-083f-45b7-990b-105a0c08a5a0@kernel.org>

On Wed, Sep 16, 2026 at 03:39:31PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 05:50, Anshuman Khandual wrote:
> > Override pgprot_[read|write]() accessors using ptval_[get|set]() providing
> > required single copy atomic operation for vma->vm_page_prot.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >  arch/arm64/include/asm/pgtable.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index 66bf5bbe484e..2b457db19be0 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -122,6 +122,18 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
> >  	return ptval_get(*pgdp);
> >  }
> >  
> > +#define pgprot_read pgprot_read
> > +static inline pgprot_t pgprot_read(pgprot_t *prot)
> > +{
> > +	return ptval_get(*prot);
> > +}
> 
> Similarly a const pointer here.

OK - will change.

> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> -- 
> Cheers,
> 
> David
