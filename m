Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD243B42C0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625923; cv=none; b=kNu3JPROsUZV44GJ7xuLs/QAYgiE4udKCpXzohz8JlFjCxggagBGcw/0Crpu4CUOsuZslXPClQLpE9dn33ljMhBXWWfXkWxZ/4Ec5MD0AzwSg0/iNmMn14Xr9wSU+292sbp0JLu6gjrzIwXZ9KOvcnfai2KbvS/Ggy3OFS5D7bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625923; c=relaxed/simple;
	bh=5r38bdBPwTF0dKcq39wGt84GgYIEr0WGkYnRDt6n+mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxS9kxdecHz45eXL2ykHCQhra7KcV/uV+B2/VcbsxbjIcd5bbuT4zWx/Xvgh5EBGzrL54WzAVgjbhD5d7Oo9wFNLjiGSHggl0aT54seelx2lrOJNlAysWVIuIz/CWchjf3Ndpnme7jsF1GoFTDQOh9HAY4rinWsU2wjbo6/mutQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kJtvYv00; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kJtvYv00"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA7F41476;
	Wed, 16 Sep 2026 23:18:35 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C32C13F882;
	Wed, 16 Sep 2026 23:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789625919; bh=5r38bdBPwTF0dKcq39wGt84GgYIEr0WGkYnRDt6n+mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJtvYv00iOOtQNWrUiPJgkunbZExZ9AoaM+TawX53wEJeFEfHYJnbH9aeFZT81Y91
	 MEMhDAFakHNbfdim7oqxayZbv5pf5JaGb0mBpGx/dtTNOhjzCgL1ulUdTWkr/Caupb
	 +d4+lEau/tWsjjqSA5GLJiGG/qd1lBQYl0PSilro=
Date: Thu, 17 Sep 2026 11:48:36 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V2 06/14] arm64/mm: Enable fixmap with 5 level page table
Message-ID: <pi6o4hjdaz2tndzlx64qvzbgxhuyh3kyewpfetiqnnetbtpzpa@prrxusgc3lpm>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-7-anshuman.khandual@arm.com>
 <be1c0a62-4589-4fe4-a500-d3fe16a6e610@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be1c0a62-4589-4fe4-a500-d3fe16a6e610@kernel.org>

On Wed, Sep 16, 2026 at 04:30:05PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 05:50, Anshuman Khandual wrote:
> > FEAT_D128 halves PTRS_PER_PXX thus shrinking the VA range coverage
> > for each page table level. Hence in order to preserve all existing
> > VA range configurations, some geometry now need to become 5-level.
> > 
> 
> Hmm, wasn't this 5-levels before, but other code allocated+initialized the p4d
> table for us?

But fixmap was never 5 level earlier.

> 
> I mean, I see how we are filling in another level, but I don't see how we would
> reconfigure something to use 5 page table levels?

IIUC existing configurations which never required 5 levels would not need
this reconfiguration even now.

> 
> > Since fixmap is used to build and manipulate page tables early on
> > during boot the mapping must also gain that additional level which
> > was not required earlier.
> 
> I am no expert ... but I am confused :)
> 
> We do have a loop only in early_fixmap_init_pmd(). So we cannot possibly span
> more than a single ... PTE table?
> 
> > 
> > Enable fixmap with 5 level page table when required. This creates table
> > entries at the PGD level. Add a fallback stub for pgd_page_paddr() when
> > (PGTBALE_LEVELS <= 4) which helps in intercepting any unintended usage.
> 
> 
> Again, I am very confused. Is it really just "As the page table layout changes,
> we might no longer have a p4d table pre-populated for the range our fixmap falls
> into. So if there is no p4d table yet, populate a static one just like we do for
> the other levels."

Right.

> 
> -- 
> Cheers,
> 
> David
