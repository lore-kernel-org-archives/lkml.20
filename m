Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793310281;
	b=SzYRG8smv6w64vDKfSFpeRUeNeYX5aUEYSpDTKJc5YQA7fKs4ZzIm57Lw71sVqETKB3W
	 wUXWTqQPq6bBsUVV3bY/DKEkLn72vP7J+i2rYhTMDgeaHV3y2CTKPB++HY7jWlct9laz+
	 V44MTjCkp6H4CPovMd3fKZiWITjRV6dcymBUkpm8XPfuUS4XIbtI4gTULLrxVYKikurCm
	 fFhUgnNq7n9qk2FN/O4s7/H4PFB4RcP9cs2utttn+ffL7bBUbpIK3eNyQyXb9/Lu8YZdJ
	 +7fOE+A4fCbOmeyW/erWG9gr8/zwp3GPFDMD2t4v6GI0VkmXsgDQTeNHchk60krvUxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793310281;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Xrs5nmJVJab8tRZxFKVKeWjGi/2IO56BZp571uVAax4=;
	b=pNEHa/gnu2BiHoElEH3NHDYk/gflaUTJxYL16ERsk3kx+G8+kOpV8oC0aIh6SVXqCzQK
	 vwszstnpacE31Ydd4klvhKG+0QZ3bj1aHBBjE/BBN5JIRaMKTGtGtC4MNk0VRmMQISZmV
	 Hu8wV/qkrfDvg5cgx/q2RuqcAqfA+yHI83au6pWiJCmJhDSGyuyiLsSxXNTAS31oqG+xX
	 tTRk+nkps/ADZv/KHfYOfJD3fwZhSafbK1Jab7sWGjRTgOxgI8cjIVQllN9jo8ILZbUKE
	 AFfTKpa2YL4RVqsLsR9lYXw8QEDgc/3tsMcbWhIKc5D926AEUJ6mraYYN4R9XRcHi7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZvaTBnXw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65903606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65903606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZvaTBnXw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CBD11682;
	Thu, 29 Oct 2026 14:44:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 807CA3F59E;
	Thu, 29 Oct 2026 14:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793310279; bh=1Jc6BQnB39kf9zB+DQFACw/SOjdeZK68FOMqJEkdGZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvaTBnXwk4vEh9RGdEieYrP+lcbbLQFeswH4ozshE0llEbLfdUJT22PqsrlbpTnwp
	 RPeiQtuyX1sWs06Kh6O1kM+aQZudBXMLuPvlUaKRZ5/1cxj3tLJSYILv7GVESBB/H/
	 MsCtUL3cBXEqH4nzkhbDr5bv3ZjwFLSEy4lCwIq8=
Date: Thu, 29 Oct 2026 21:44:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] KVM: arm64: Clear the whole hugetlb folio when
 sanitising MTE tags
Message-ID: <auO-Pzqy-bp8fT4m@arm.com>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
 <20261021110700.493315-2-fuad.tabba@linux.dev>
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
In-Reply-To: <20261021110700.493315-2-fuad.tabba@linux.dev>

On Wed, Oct 21, 2026 at 12:06:57PM +0100, Fuad Tabba wrote:
> sanitise_mte_tags() clears the tags of the pages about to be mapped at
> stage-2 before marking them tagged. For a hugetlb folio the flag covers
> every page in the folio, but the loop only covers the mapping being
> installed. Stage-2 maps a folio in pieces for the contiguous hugetlb
> sizes, and for any size under dirty logging. The first fault then marks
> the whole folio after clearing only its own piece, and the rest keeps
> its previous owner's tags for the guest to read.
> 
> Clear the whole folio, as mte_sync_tags() does.
> 
> Fixes: 25c17c4b55def ("hugetlb: arm64: add mte support")
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
