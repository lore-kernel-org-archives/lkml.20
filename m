Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515821;
	b=A0gFwbrPQ/j1HOSWrYuqjs7yavYtXE9BZRBBt8KvV2/vTcvJ4h3XKitgMB6NWbO0qTY7
	 GTZCXnw6xwGnu2LUgSr8qfzfCHjqb4tLe6k3kX7DGk5DZpFC7hHD4nhEO3UpHyvIXVXCt
	 qTGR9vI6hupxtJahyaMnOAfyYXocaJ3YAJm84Ik0w/y+YmMkdndKxOHY3N7udTYRlPjCT
	 IK/MH97PTXGdlIwX+MTO1zl2qlYPcgBqPP3QRmIfVXaQP1JTXXej1kmEyR00WWLyrUU3N
	 FXkZwxioE8kfkkvgs7v22rTOXWpaSpdjZMa2Vt3gB1c6UBPdhG5mkt2v5/nLjlV/Tvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515821;
	h=Received:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jDKBdDNUgnFBiehR+3AYyTsALn1WTufXGDvPpnjpNx0=;
	b=G0HEaIUOZuMLwULW1j9XYJM8/IxLkTJ48LT/JZ3uNae9Mpcr8vsPrYBkKQxpOLEeAAef
	 RTX4EOkp2HxrhcoYV0pa7/ApmsKu7ogEjA+KzY+dnHpWk/wB7B8/f+vVDSoCNLC5l6bWs
	 5oz33PpaDEFp56q2vNtN9KQ50c0eBDmISXHxUS6d60+FupTLvOUAMShhp80K4ZgLSo4eC
	 +EYLa41eeLrhN199eli/eYITzjUNmjZbxaVlkNRoAzpbUgeUWuDcEougKrTYTbQXdjS64
	 StWs6ieLuM9kvq+nWj1ZJN2jkRnW+872Q0tTOx6mEhOcIokeNRfzc3PIDpThdNE9lSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC6B606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7E81F000CB;
	Tue, 20 Oct 2026 17:03:39 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 3F2E3198003A;
	Tue, 20 Oct 2026 13:03:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 20 Oct 2026 13:03:08 -0400
X-ME-Sender: <xms:yZ7XavrOIw1_gBGyaziF-ZMtgVeJKE3nH4r7UYLRU8Y_TmizNyllgQ>
    <xme:yZ7Xai_uCVDX6P-UZwskLNQK_Mr3csTBsbSsWKN6waTl5OqsQzGqJ8Pr7dRL0iRZX
    _j46ke_378wETQ-1RfIPMOFkPjph_MOCCCeXi4ExGr8hh3RNejt16E>
X-ME-Received: <xmr:yZ7XakMNXp-fEx-jQVJ_YQhHVX32jE6ZzgozHV5e2RzwwSTx2ezWknKte_0>
X-ME-Proxy-Cause: dmFkZTGkGIb3di2YCLCxxSDu64sQiSzl5RCtVWfkYdh889CF9jK0BQXmVxD4pT3c/xsx5j
    bF0l00c2FSQwMLsevVaWcEbFPrXZuV+j1kO8K6B1q9AIA+Z+td5APm+by2UaUaK7szc4Me
    F65Gr85Jd0nqGWJM4ya7q/ASMJXeMwMqWPC2tHJk1dvqfMc+2MyQv1t2c6LbWGl7yl8lQo
    TGH5DoJc62V0ssUipmWTQVdTt8a87oJAlHy4qY7seWpswcRl33BqtDXMTtlbURGtse1ax3
    XUC6RgZUTGjQrJssIhC+MCX/eTdgBorlngyx26IU2FgGV287DaSW3cBmdqwUiozfPp6eVc
    Uuy/BU9SxgF9qXafjZnRjQguUd+sWoMGPWmJBQZJcnt1SyDhl2lvyck9NPZ7YWuVcRQuI9
    uptTq9sDU8HOH3tpAFHtEKTLJ33COusQ9TyvQuqW5GEgNl6zD8AcFc7KhnbJk1HgiWDxyO
    7wqF7sTEKFe/yTMuXdVBeqEDu1kpBy+PVdFzDIYiVslmun31rtXOUs7TPPeEgbUBMPeccx
    Xg+0EsFUeebSIOe8QPMw9tldi9hpcm4QF0/9Oo1dR+IptD03LRAShFAxx9IicHQmIyygHt
    BtYTOTUxrTbXLY0Z0hSARlrNk8pxjQ3RU3URtGrxyz4WYeeMEDT6svAs0gYQ
X-ME-Proxy: <xmx:yZ7Xask2yfKJnejDpG-XGtzdGptLMV-MvfelgPB05-wMZsR7SuRf7Q>
    <xmx:yZ7Xap-TIprOdGX76uDRQL4kechcy6IhLgA-hmO2QebI2OSgdgUArQ>
    <xmx:yZ7XalMM5WFHMSFizZATTLbYyOTLMMWGJvVe-p3dTm_7yfhoWsc-SQ>
    <xmx:yZ7XatHnwFey-_M-_7WScr6IEHhyu5C6LPVCwwIxzX66l9O6IOPodQ>
    <xmx:yZ7XariDxe-NaLtuu9lzGit0tTgE4P1aXPEkype1kUEKlxfbegLwihNk>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 13:03:04 -0400 (EDT)
Date: Tue, 20 Oct 2026 18:03:03 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Mike Rapoport <rppt@linux.vnet.ibm.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, shaos <shawnq1@163.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mm/vma: avoid broken uffd merge on mremap
Message-ID: <atede4rPZKNVqwDr@thinkstation>
References: <20261020-uffd-remap-fix-v1-1-0f34fc181f0a@kernel.org>
 <b61cbf73-b92a-4869-af94-72c30bbe9527@kernel.org>
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
In-Reply-To: <b61cbf73-b92a-4869-af94-72c30bbe9527@kernel.org>

On Tue, Oct 20, 2026 at 05:51:12PM +0200, David Hildenbrand (Arm) wrote:
> On 10/20/26 16:55, Lorenzo Stoakes (ARM) wrote:
> > Userfaultfd often causes unexpected interactions within mm, and does so at
> > the intersection of uffd, mremap() and VMA merging.
> > 
> > When an mremap of a VMA occurs, copy_vma_and_data() calls
> > mremap_userfaultfd_prep() to notify uffd of this.
> > 
> > However, mremap_userfaultfd_prep() simply drops the UFFD context for the
> > VMA if the user did not register it for remap, i.e. didn't specify the
> > UFFD_FEATURE_EVENT_REMAP flag.
> > 
> > This is OK for the VMA itself, as upon page table move, move_ptes() clears
> > UFFD page table flags, using vma_has_uffd_without_event_remap() to
> > determine whether to do so.
> > 
> > However, this doesn't account for merging with adjacent VMAs, whose page
> > tables won't have received this treatment, and thus latent UFFD markers
> > will be left around.
> > 
> > Worse, it'll break UFFD for any VMAs it is merged with. This is very
> > surprising behaviour for a user, who will then simply not receive UFFD
> > events for VMAs they ought to.
> > 
> > Resolve the issue by explicitly checking for this case via
> > vma_has_uffd_without_event_remap() in vma_merge_copied_range(), the merge
> > function explicitly designated for mremap() operations.
> > 
> > Also update the userland VMA tests accordingly.
> > 
> > Reported-by: shaos <shawnq1@163.com>
> > Closes: https://lore.kernel.org/all/20261020110748.959870-1-shawnq1@163.com/
> > Fixes: 3cfd22be0ad6 ("userfaultfd: clear flag if remap event not enabled")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  mm/vma.c                          | 5 +++++
> >  tools/testing/vma/include/stubs.h | 5 +++++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/mm/vma.c b/mm/vma.c
> > index de5ebc57e7a5..1be613044b4a 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -1211,6 +1211,11 @@ static struct vm_area_struct *vma_merge_copied_range(struct vma_merge_struct *vm
> >  
> >  	vmg->copied_from = vmg->middle;
> >  	vmg->middle = NULL;
> > +
> > +	/* If not registered for remap, uffd context will be cleared. */
> > +	if (vma_has_uffd_without_event_remap(vmg->copied_from))
> > +		return NULL;
> > +
> >  	return vma_merge_new_range(vmg);
> >  }
> >  
> > diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
> > index be8f5161f92a..f786a585caf0 100644
> > --- a/tools/testing/vma/include/stubs.h
> > +++ b/tools/testing/vma/include/stubs.h
> > @@ -386,6 +386,11 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
> >  	return true;
> >  }
> >  
> > +static inline bool vma_has_uffd_without_event_remap(struct vm_area_struct *vma)
> > +{
> > +	return false;
> > +}
> > +
> >  static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
> >  				    struct anon_vma_name *anon_name2)
> >  {
> > 
> 
> @Kiryl that should solve the issue I was raising the other day with leftover
> uffd PTE bits outside of uffd areas? Can you review?

Yes, it is the same copy_vma() merge.

With the merge refused, the reset in mremap_userfaultfd_prep() only
covers the moved range, and move_ptes() has already cleared the uffd
bits there.

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

P.S. vma_has_uffd_without_event_remap() is a mouthful. With negation in
the name...

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
