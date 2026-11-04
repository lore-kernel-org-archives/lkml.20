Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815482;
	b=4wrvyFznUjqbFaaVz5ZT8a45D52KORCS4Gaw9mNGHcCOXihQpZ5lmZR8bJtiAiBj8s5A
	 RbojRQ22QCenWFUeeGq2/E7rdxBtLvCL+cLF48kA1aOI1x8Q0DMfNDGEWj1+TE5PNU6Dy
	 fHI+xWPsn+hV9NHj6cbNDJKiq0WLeKco0bwbWoqnDWacElx8AJVZu814++867gD7n6MFB
	 WZc2FE0+9a9EkBRgLhz0dgXA4bMX7EhE8m75KKIK6lfWsfJsfzrA916tj8zTOAEhVrILL
	 VkcDwjndSszHSnCdROItNvJIPTtep779PPnMDIVe+pj0rMnZkNdBEEQ6CQqDRHr5ahw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815482;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Azf6TC2ItbtESITBREZK8lgVBXV8KG+jdp6q1EsvJTQ=;
	b=ht1rnr0RmFhvW1UC3ShndmWBxt3j6jRDUIMrkHIOqpWn2Qnt3/zr5kbq7y1zO1a62fNo
	 aaASQ93R/aSb3hRmGIYOxYE7Hj6i6XeP2f+5qPE9ECd0nikjQzklsovlsSoIlQr63xsod
	 AlriykkRIGA5Tg4YbFlWVF7URDYL1MuXIqoqhqtY35b+1z5h4LUYas/eL/Riua+jeXEFw
	 ncL9mAwgOuaThmz+SgDJ6gbDzXQINxisbL5KiZhw7HXwvE+slWS/WY/MBPYxPNNANiU4D
	 4bbPM0nZidQXY/jTkpWMxTaplB3oziDYe8afz03MpvFmN1POnHOCrEdCIKNlVOlKcNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=La2MMcwW;
	arc=none smtp.remote-ip=91.218.175.142
Received: from mta0.migadu.com (out-142.mta0.migadu.com [91.218.175.142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB68606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB68606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=La2MMcwW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ORJcbkhhXOFfbATzkO8WtvYxCcPTsF3B0i26iSqffrs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793815478; v=1; x=1794420278;
 b=La2MMcwWMgi4PDijnNwiMykgsWgwQKq3xxZaQP+o1XbRcOLU6VPacO/eMm5RbZfSvR/wZQbb
 amJlgSL8pAcV+020YY30LZF0v65t7tjDi2oBFRy28M+TkDUuBF0/mn8/ZGtRoE798iIDyt5u0V7
 je1XeJ3ANoc8688UwP0qfwbg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 257a1af166e02d15;
	Wed, 04 Nov 2026 18:04:38 +0000
X-Mizu-Trace-ID: 257a1af166e02d15
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: "Zi Yan" <ziy@nvidia.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	linux-mm@kvack.org,
	ying.huang@linux.alibaba.com,
	"Baoquan He" <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	"Nico Pache" <nico.pache@linux.dev>,
	"Liam R.Howlett" <liam@infradead.org>,
	ryan.roberts@arm.com,
	"Vlastimil Babka" <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com
Subject: Re: [PATCH v8 10/30] mm: make PMD migration-entry splitting explicit
Date: Wed,  4 Nov 2026 10:04:33 -0800
Message-ID: <20261104180435.1520363-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DLZ48KMS7YG8.3BTM0UUU8CTU2@nvidia.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 07 Oct 2026 22:53:51 -0400 "Zi Yan" <ziy@nvidia.com> wrote:

> On Fri Oct 2, 2026 at 5:52 AM EDT, Usama Arif wrote:
> > __split_huge_pmd() and friends take a "freeze" boolean that every caller
> > has to pass and almost every caller passes as false. The name says nothing
> > about what it selects, and the one thing it does select - PTE migration
> > entries instead of PTE mappings - is only ever wanted by the rmap migration
> > path.
> >
> > Rename it to to_migration_entries, keep it private to mm/huge_memory.c,
> > and add split_pmd_to_migration_entries() for try_to_migrate_one(), the only
> > caller that wants it.
> >
> > migrate_vma_split_unmapped_folio() also passed freeze=true, but only ever
> > runs on a PMD that is already a migration entry, which the generic helper
> 
> Is it always a PMD migration entry? Can a concurrent MADV_DONTNEED zap
> the PMD migration entry or split it with a partial zap? Although it
> does not affect the correctness of the patch.
> 

Yes. Migration holds mmap_lock for reading, and MADV_DONTNEED can
clear or split the migration PMD without taking the source folio
lock. The PMD need not still be a migration entry when the split
helper checks it.

> If that concurrent zap is possible, the existing code can leak a ref,
> causing the folio to be not freed, since
> split_huge_pmd_address(freeze=true) does not drop the folio refcount
> when the PMD is zapped or becomes a PTE page.
>

Agreed. The old extra folio_get() leaks if the helper finds an empty
PMD or a PTE table and returns without consuming that reference.
folio_split_unmapped() can then fail because of the unexpected ref.

> We might want a separate fix for it.
> 

Extracted it into a separate prerequisite fix, with your Reported-by,
a Fixes tag and stable Cc. It removes the extra reference and passes
freeze=false using the old API. An existing migration PMD becomes
PTE migration entries either way; a concurrent zap or split no longer
leaves an extra reference behind.


> Actually, Mika Penttilä's "migrate on fault for device pages"[1] also
> talks about the race.
> 
> [1] https://lore.kernel.org/r/20260924065313.899730-1-mpenttil@redhat.com
> 
> > expands into PTE migration entries either way. Its folio_get() only existed
> > to balance the put_page() that freeze=true performs, so both go.
> >
> > split_pmd_to_migration_entries() is only ever handed a present or
> > device-private PMD, so assert that in __split_huge_pmd_locked() instead of
> > silently skipping anything else.
> >
> > Other than that assertion, no functional change intended.
> >
> > Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > ---
> >  include/linux/huge_mm.h | 21 ++++++------
> >  mm/huge_memory.c        | 74 ++++++++++++++++++++++++++---------------
> >  mm/memory.c             |  4 +--
> >  mm/migrate_device.c     |  7 +---
> >  mm/mprotect.c           |  2 +-
> >  mm/rmap.c               |  8 ++---
> >  6 files changed, 65 insertions(+), 51 deletions(-)
> >
> 
> <snip>
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 0c437004329d9..4a0b61d50d222 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -918,12 +918,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
> >  	unsigned long flags;
> >  	int ret = 0;
> >  
> > -	/*
> > -	 * take a reference, since split_huge_pmd_address() with freeze = true
> > -	 * drops a reference at the end.
> > -	 */
> > -	folio_get(folio);
> > -	split_huge_pmd_address(migrate->vma, addr, true);
> > +	split_huge_pmd_address(migrate->vma, addr);
> >  	ret = folio_split_unmapped(folio, 0);
> >  	if (ret)
> >  		return ret;
> 
> This part can be a separate fix for the refcount leak.
> 
> Otherwise, LGTM.
> 
> 
> -- 
> Best Regards,
> Yan, Zi
> 
> 
