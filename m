Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617382;
	b=NMGmpT9IXUpB6Rek4Bt54wDnayBD6alb3junOy4yJdwX4KzXB7IU7ZLlXmZFLv2oJ/9T
	 INLnymb2VNeb9AIhbVfcdBCOJCONS7oKfVyjgHfp28MPp1vtSdfUEOTXSdlPYdKJwk5kA
	 P/4r2UYtIk3JamU5nFMY+pBRU9aoEwp3aGC7jgv5CGHSjv35Zyt82F6++gasf3tNMtrys
	 iJeH/UM2ZrDjlNUH7U7h06Ako5d0ydf+vYKfFcQcKYjqX5KnnHdVEtjOounhTcKuQlh8A
	 3sYik6YbrARI3xuL6ZGEXisbfCZnLp5Fa4NwU7Fkn+fIBtkyPvNXWncJ9INXLCXXMvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617382;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sLsuIaO/vO0yxwqR0T4S/sMl30AM8Izc7otFPn1bjhA=;
	b=llNQBdrLtkhsK+JR2M/ayQuduSOeQAJ+/PbwjgC2OftKuc7f1PE+aPkFgvvCdDbuqA8t
	 Dr43rmsUCeyRyI4dQZymSeno7LNjgErJ0rHA05vkDKn2Zk/PP/kYsgrax3vt5nodpd7pr
	 a7CA8TJjy9mC4F5HiKHYWdzqrw6td1jimPC1fWicPlFUES8Z0xJXBgO7oKuVF1ed1VTSe
	 qAut9NlKiimxNNRP9WiRT2eslEbfVWUg9BU6u5jm5LHU6x9/MebGJVYXHC19x1w++oUXp
	 HA6y2+O3FlXyWIMaxMZ0Q547lJkdyySqVrO1/wSnR+DXOnSVlHYy3uWEGONc5OEIljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ee/5fqIw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B37606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ee/5fqIw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDB51F00A16;
	Mon,  2 Nov 2026 11:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617381;
	bh=sLsuIaO/vO0yxwqR0T4S/sMl30AM8Izc7otFPn1bjhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ee/5fqIwaWuubHUFiZNmrig8kCTutPcyQDaTWVD/MrUbaZ1J3yb85Jm/UfWNjXSMx
	 SUsE8wsymotgyZij57TwGJWvsvFRmeR9JIfeLuuXKcILia2GHbPzd3momuwB1BvydG
	 hEY55Hdnao6q465NMJIOrmJafDujh15HreWRgoX/RyJvaF0+aJbnMqmybcI3JvsuTZ
	 JBUsmKIlZ3IXyGKP8Q4p4F2/hZA4NHFRz1sM2RXQnAxggAUSsPnuXdh7uqFrvKd3b8
	 JV+0SvKa1Rn1NSpF0SY3dgrACZn87+zVgv24lRYu2Ure1xDAKLslAKSK++USdNAuhV
	 pHwERphOPbCxQ==
Date: Mon, 2 Nov 2026 11:02:56 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Lance Yang <lance.yang@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com, 
	Songsen Yang <yangsongsen@insta360.com>
Subject: Re: [PATCH] mm/vma: read anon_vma carefully in validate_mm()
Message-ID: <auhrcEfT5v5MVcFj@gremlin>
References: <20261102-fix-validate_mm-v1-1-5c309614ef15@kernel.org>
 <auhn01dpDzK47igy@thinkstation>
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
In-Reply-To: <auhn01dpDzK47igy@thinkstation>

On Mon, Nov 02, 2026 at 10:48:45AM +0000, Kiryl Shutsemau wrote:
> On Mon, Nov 02, 2026 at 10:25:20AM +0000, Lorenzo Stoakes (ARM) wrote:
> > Commit 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence
> > KCSAN") rather clumsily converted the read of vma->anon_vma into a
> > vma_has_anon_rmap() without accounting for the separation between
> > assignment of anon_vma and later use of it.
> >
> > vma_has_anon_rmap() is intended as an optimistic check, so doesn't need to
> > protect against a torn read in vma->anon_vma. The caller is expected to
> > take care of this themselves if they then in fact access the field.
> >
> > validate_mm() does indeed then reference the field, so resolve the issue
> > via READ_ONCE(), and simplify the code by separating this into a new
> > function validate_mm_anon_rmap().
> >
> > Finally, add a vma_assert_stabilised() to make it clear the required state
> > of the VMA.
> >
> > Fixes: 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence KCSAN")
> > Reported-by: syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/6ae78418.6552420f.2a0efc.005c.GAE@google.com/
> > Reported-by: Songsen Yang <yangsongsen@insta360.com>
> > Closes: https://lore.kernel.org/all/20261102074414.10902-1-yangsongsen@insta360.com/
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  mm/vma.c | 36 ++++++++++++++++++++++++------------
> >  1 file changed, 24 insertions(+), 12 deletions(-)
> >
> > diff --git a/mm/vma.c b/mm/vma.c
> > index d416ba58eb4c..9f02f19a7845 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -669,6 +669,28 @@ static int dup_anon_vma(struct vm_area_struct *dst,
> >  }
> >
> >  #ifdef CONFIG_DEBUG_VM_MAPLE_TREE
> > +#ifdef CONFIG_DEBUG_VM_RB
> > +static void validate_mm_anon_rmap(struct vm_area_struct *vma)
> > +{
> > +	struct anon_vma *anon_vma = READ_ONCE(vma->anon_vma);
> > +	struct anon_vma_chain *avc;
> > +
> > +	vma_assert_stabilised(vma);
> > +
> > +	if (!anon_vma)
> > +		return;
> > +
> > +	anon_vma_lock_read(anon_vma);
> > +	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
> > +		anon_rmap_tree_verify(avc);
> > +	anon_vma_unlock_read(anon_vma);
> > +}
> > +#else
> > +static void validate_mm_anon_rmap(struct vm_area_struct *vma)
> > +{
> > +}
> > +#endif
> > +
> >  void validate_mm(struct mm_struct *mm)
> >  {
> >  	int bug = 0;
>
> This ifdeffery seems unnecessary. What about this:

Yup, even better.

Andrew - could you update it in-place or do you need a v2?

>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 9f167950926a..2e43077dcd51 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4363,9 +4363,7 @@ anon_rmap_tree_iter_first(struct anon_vma *anon_vma,
>  struct anon_vma_chain *
>  anon_rmap_tree_iter_next(struct anon_vma_chain *avc,
>  			 pgoff_t pgoff_start, pgoff_t pgoff_last);
> -#ifdef CONFIG_DEBUG_VM_RB
>  void anon_rmap_tree_verify(struct anon_vma_chain *avc);
> -#endif
>
>  #define anon_rmap_tree_foreach(avc, anon_vma, pgoff_start, pgoff_last)		 \
>  	for (avc = anon_rmap_tree_iter_first(anon_vma, pgoff_start, pgoff_last); \
> diff --git a/mm/vma.c b/mm/vma.c
> index 1be613044b4a..30f31d3b3e26 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -669,6 +669,26 @@ static int dup_anon_vma(struct vm_area_struct *dst,
>  }
>
>  #ifdef CONFIG_DEBUG_VM_MAPLE_TREE
> +static void validate_mm_anon_rmap(struct vm_area_struct *vma)
> +{
> +	struct anon_vma *anon_vma;
> +	struct anon_vma_chain *avc;
> +
> +	if (!IS_ENABLED(CONFIG_DEBUG_VM_RB))
> +		return;
> +
> +	vma_assert_stabilised(vma);
> +
> +	anon_vma = READ_ONCE(vma->anon_vma);
> +	if (!anon_vma)
> +		return;
> +
> +	anon_vma_lock_read(anon_vma);
> +	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
> +		anon_rmap_tree_verify(avc);
> +	anon_vma_unlock_read(anon_vma);
> +}
> +
>  void validate_mm(struct mm_struct *mm)
>  {
>  	int bug = 0;
> @@ -678,10 +698,6 @@ void validate_mm(struct mm_struct *mm)
>
>  	mt_validate(&mm->mm_mt);
>  	for_each_vma(vmi, vma) {
> -#ifdef CONFIG_DEBUG_VM_RB
> -		struct anon_vma *anon_vma = vma->anon_vma;
> -		struct anon_vma_chain *avc;
> -#endif
>  		unsigned long vmi_start, vmi_end;
>  		bool warn = 0;
>
> @@ -702,14 +718,8 @@ void validate_mm(struct mm_struct *mm)
>  			vma_iter_dump_tree(&vmi);
>  		}
>
> -#ifdef CONFIG_DEBUG_VM_RB
> -		if (vma_has_anon_rmap(vma)) {
> -			anon_vma_lock_read(anon_vma);
> -			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
> -				anon_rmap_tree_verify(avc);
> -			anon_vma_unlock_read(anon_vma);
> -		}
> -#endif
> +		validate_mm_anon_rmap(vma);
> +
>  		/* Check for a infinite loop */
>  		if (++i > mm->map_count + 10) {
>  			i = -1;
> --
>   Kiryl Shutsemau / Kirill A. Shutemov

--
Cheers, Lorenzo
