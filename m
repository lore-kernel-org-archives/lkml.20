Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D9C10F2
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788049102; cv=none; b=Flb92EFRNfZ2IcRnixNqz/OcDdSb4hyeu279OIsuqSa6DJ2/RVDBAHssHqRJcIIn9D/bCRGe+0a3plxXSu0AVilHJWmsPdaellkNcdwcGV8UQgB9ljuGCo98vxd2XLv8fjloyXVsdOkEN36yLe2g9iIfn61XQeLKsIZrODr99Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788049102; c=relaxed/simple;
	bh=3voPvyptRTXJdffJMp/qlbLqaB1iYxDbglqweDyvfD0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XyFyEZ0DyP4f9dxj3IgJrjwdKZnCI5K+LlWD10V3j3N3du4VOW9tGmTizIJk24WE3fVY+IpMwrLGoIZzfYyGX/J/7fjdigkEo2Y1IYbljh27MflFdyrpTo1vkwK6x2u/cKO23MIfg6Don2og93NMmHkaD7lAKb1aJRpFAuY36sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RRRZVrhU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RRRZVrhU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56351F000E9;
	Sun, 30 Aug 2026 00:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788049100;
	bh=rLwaRMYQSdlC9dDrcYF6uhIrk96lZ4AnEwSNRsJJ7Jk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RRRZVrhUsMA1mrxJwrnY8deTAOsAhEgmZGzHX+tXScdO1bRIGsHwN7fDXs08zlApd
	 DpQiip2DP81dFltY/sey8H1holAPNm78Zd1a+kuZ6I1yEeTXDITuoxuy6wZv9njlDu
	 f6SZl0KBRhksKXL0kgUxkApA0hPEe5oPSYgC/EDo=
Date: Sat, 29 Aug 2026 17:18:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: gourry@gourry.net, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, david@kernel.org, ljs@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 usama.arif@linux.dev, vbabka@kernel.org, jannh@google.com,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, ying.huang@linux.alibaba.com, apopple@nvidia.com,
 balbirs@nvidia.com
Subject: Re: [PATCH v2 0/3] mm: reject zone device folios in more folio
 walkers
Message-Id: <20260829171819.e1e8910e7e9a8a46b87c870f@linux-foundation.org>
In-Reply-To: <20260818043143.22297-1-lance.yang@linux.dev>
References: <20260817220810.1175596-1-gourry@gourry.net>
	<20260818043143.22297-1-lance.yang@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Aug 2026 12:31:43 +0800 Lance Yang <lance.yang@linux.dev> wrote:

> 
> On Mon, Aug 17, 2026 at 06:08:07PM -0400, Gregory Price wrote:
> >Several LRU-oriented mm walkers resolve the folio backing a PMD entry
> >(or a physical pfn) and then reclaim, age, migrate, or lazyfree it
> >without ever checking for ZONE_DEVICE memory.
> >
> >This series adds missing folio_is_zone_device() rejections, matching
> >the checks that comparable walkers already perform.
> >
> >- mm/huge_memory, mm/madvise: the !pmd_present branch above these sites
> >  only filters device-private entries (which are non-present).
> >
> >  A present zone device PMD (e.g. device-coherent) would still reach the
> >  folio and be lazyfreed / aged / paged out. Add an explicit check.
> >
> >- mm/mempolicy: queue_folios_pmd() can see a present zone device PMD
> >  (e.g. device-coherent) and queue it for migration.
> >
> >No crash reproducer - this is a correctness/hardening cleanup found by
> >inspection. All checks are placed after the folio is resolved and before
> >it is acted upon, on paths that already hold the relevant page-table lock,
> >so no locking or refcount changes are involved.
> 
> Cool!
> 
> Gave the whole series a spin on x86_64 QEMU with a PMD-mapped
> device-coherent THP. Without these patches, partial MADV_FREE and
> MADV_COLD reliably hit a kernel panic in remove_migration_pte(), while
> mbind(MPOL_MF_MOVE | MPOL_MF_STRICT) returned -EIO.
> 
> With v2, all three worked fine, PMD mapping stayed intact, and data
> checked out :)
> 
> Note that both kernels used the same small change to the in-kernel HMM
> test driver, allowing its coherent device memory to be allocated as 2 MB
> folios so the PMD-mapped test case could be exercised.
> 
> Tested-by: Lance Yang <lance.yang@linux.dev>

Thanks Lance, you're so diligent.

I'm wondering what to do here.  Gregory told us

: No crash reproducer - this is a correctness/hardening cleanup found by
: inspection. All checks are placed after the folio is resolved and before
: it is acted upon, on paths that already hold the relevant page-table lock,
: so no locking or refcount changes are involved.

And you had to tweak the hmm-test driver to reproduce the bug(s).

So when do we push this series out to -stable?  As a hair-on-fire
hotfix, or as a leisurely next-merge-window thing?


And Sashiko was clearly having a bad day, able to find only nine
pre-existing things to shout about:
	https://sashiko.dev/#/patchset/20260817220810.1175596-1-gourry@gourry.net

