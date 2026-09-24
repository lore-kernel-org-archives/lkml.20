Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6BA4052BB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245200; cv=none; b=iU/BBbRQNPcQkc7StmhAZuaXtl7rI7q9R/yJ7JKBGzW6fwWL678/IP4C21nU30wSfCMo0qKgSVtj4juzB0kVyl0DWGlcUOdc6IIF5AByDAgbrjeSWit9FPIvuYFGCCkl/ddNHOmjMXMyrXQwLI8CcOlBUGBw+SVoh46BgSmO/xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245200; c=relaxed/simple;
	bh=H6qyIMrYe7iz8AdnWWG5WmMCCAcRYN1m8wWC3Jo6rHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LytK0Im0IBjrFN6aT5hHZ9lk5b+llb2/GtSOux98rVBVi5ItRJZWBOVRg/P16VIw/3gXnFID37OvE+fQf8vGDAv9ELTES8vjXWSr13FUYrRY5uvRDZwCk7yCtpgmH7VwJBZxi8fHXNh+cBVtxF1ulczvY4I/pHlOB35r9VeTois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ESQY3yno; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ESQY3yno"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2FDD1516;
	Thu, 24 Sep 2026 03:19:45 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDBE23F86C;
	Thu, 24 Sep 2026 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790245189; bh=H6qyIMrYe7iz8AdnWWG5WmMCCAcRYN1m8wWC3Jo6rHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESQY3ynobYcSFvJBweaWPCannUZiil7EoNCgE+R4PbydTgpus0xNezG8/nolmGUWL
	 b7NvGrhlB+zRMF4BFEVy1qvd2wIJAcvY7KvGIvFvXie4xaumiZ3tI1pkPMh66ylagf
	 iQDYSyAyJD1vFph1jUsqQtWSfK616sYEggvla6AY=
Date: Thu, 24 Sep 2026 11:19:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V3 0/2] arm64/mm: Standardize printing for pgtable entries
Message-ID: <arT5QXAXFD6u9tOB@arm.com>
References: <20260916044933.2689426-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916044933.2689426-1-anshuman.khandual@arm.com>

On Wed, Sep 16, 2026 at 10:19:31AM +0530, Anshuman Khandual wrote:
> Standardize printing for pgtable entries using recently introduced generic
> helper ptval_bytes_to_hex_str() in core MM which automatically enables 128
> bits entries when added later.
> 
> But first move __check_safe_pte_update() outside <asm/pgtable.h> to avoid
> a cyclic dependency while accessing these afore mentioned core MM helpers
> defined in <linux/pgtable.h>. This replaces the original page table entry
> print standardisation proposal which was part of the D128 series.
> 
> https://lore.kernel.org/linux-mm/20260729122452.3797443-11-anshuman.khandual@arm.com/
> 
> This series applies on v7.3-rc3 but after the following.
> 
> https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

I think this one was queued by Andrew, so I can't take these two patches
via the arm64 tree. I'm fine with Andrew picking them up as long as
there are no serious conflicts (I just started queuing stuff for arm64,
so can't tell for sure).

For this series,

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
