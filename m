Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810165;
	b=abSUvMrn5ccdDv+wZ4Iv0jwCxfSAcBU9j71wXaMsMalfCHmPe04BFvUyi3zuAGNqvPqi
	 vSH4fPHctSo1ZF40j0FpefyKc7OaOIQUta/Qt6So/9slN3jEt2WgUh/NotJB/X643+mVB
	 Hn1tcUCBPSOk5v56fMdGtnjf9yj9WI783eWFsDwrl8d081XTEJkf6yZLylQ7kXcH/QgXQ
	 CH9rPby7AVCzoZDMo2QQ34pftHvFJ4DqlkdF17GUxwGceU8cVOPbwD6+5Sk/dNAG8RJRb
	 L3XX5Z7i5bGyKnQqUxa+di53F5mL60e+sgV3JJw06gCoxqi20fn43yFaijqEmMuESyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810165;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0eWbBWnFJl+uiLzhbPXd3D9E7kgIone5xiQRAQoBq94=;
	b=d+3QXop3TaPQf3XAm0Qn5Mgw47JaG6bFUOQzEr8ParTzANyD5KZeIeBXG1aCGF6z8NYY
	 C/2r3eEb5WBrenk+HweKEbLxiUw/rryyUxp4A2Jr0HBGcYtM7Fr8G/z2tXRdHrEtZsFR/
	 kYvBnvcgdHUs/3k2XkDpoRzwwWdkQ7SOd3uqYmLLVH0zbLRzKtwcs7q9DsvrmxqiO9/dv
	 51Ou5h4vnp50znaIWjDMhIgqN1k5NHYcefjGTt+iE2lW7WhGc9rkMiL37yFBQiKbINcYC
	 rLoOiPv8MQnz+/6vgi0iqsk1YvDNwmNMV3pLfb6CxiGD7SWzxzmYUfGzH7EJ5+vHoDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wCjGeI6Z;
	arc=none smtp.remote-ip=95.215.58.185
Received: from mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A16606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A16606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wCjGeI6Z
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ck0BKnLiDu5kTQsaHCMIpLW/PX9Nr/jcRPf51hdq1dU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793810160; v=1; x=1794414960;
 b=wCjGeI6ZTYzB72AcZahHsWTRJQDfQ36wYmXE6dn6RY/CNegdZvHiHLy5aX3D+8suz/prsxcN
 MeCycpuBQ5Ih7AY5m2HvwZUQlJg+dS+eX8U8tv61bbOrcjLywOZOqXhnpQTYX8YdWl2Y0XlYEEE
 lBDKO6ENQHHuRhXTwdxWyXNA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 86022f17ab87f471;
	Wed, 04 Nov 2026 16:36:00 +0000
X-Mizu-Trace-ID: 86022f17ab87f471
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
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
	Nico Pache <nico.pache@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com
Subject: Re: [PATCH v8 14/30] mm: zswap: reject high-order swap cache allocations backed by zswap
Date: Wed,  4 Nov 2026 08:35:51 -0800
Message-ID: <20261104163554.3508359-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAO9r8zN+9F0yh0bTDsysumziGc=zgs7vZMLvt-nWPhxq36wT0Q@mail.gmail.com>
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

On Mon, 5 Oct 2026 13:18:24 -0700 Yosry Ahmed <yosry@kernel.org> wrote:

> On Fri, Oct 2, 2026 at 2:56 AM Usama Arif <usama.arif@linux.dev> wrote:
> >
> > zswap stores swapped-out pages one at a time, so a range of swap slots can
> > be split between zswap entries and the backing device. A high-order
> > swap-cache folio over such a range cannot be read back in one go: the disk
> > read would return stale or zero data for every slot zswap owns.
> >
> > Reject that in __swap_cache_alloc(). Do the check after the folio is in the
> > swap cache: from that point zswap can neither start storing nor start
> > writing back any slot in the range, so the answer is stable. Callers
> > already fall back to order-0, which zswap_load() handles per page.
> >
> > Export zswap_is_present() for the PMD-order swap-in users added later.
> >
> > Co-developed-by: Alexandre Ghiti <alex@ghiti.fr>
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> 
> Overall looks good, but I think it can be split into 3 patches (one of
> which doesn't have to be part of this series), see below.

Thanks for the review! I have followed your suggestion and split it into
3 patches now.

> 
> 
> 
> > ---
> >  include/linux/zswap.h |  6 ++++++
> >  mm/swap_state.c       | 39 +++++++++++++++++++++++++--------------
> >  mm/zswap.c            | 12 +++++++++---
> >  3 files changed, 40 insertions(+), 17 deletions(-)
> >
> > diff --git a/include/linux/zswap.h b/include/linux/zswap.h
> > index df6cafbe95dc0..94746fb71bb65 100644
> > --- a/include/linux/zswap.h
> > +++ b/include/linux/zswap.h
> > @@ -35,6 +35,7 @@ void zswap_lruvec_state_init(struct lruvec *lruvec);
> >  void zswap_folio_swapin(struct folio *folio);
> >  bool zswap_is_enabled(void);
> >  bool zswap_never_enabled(void);
> > +bool zswap_is_present(swp_entry_t entry, unsigned int nr);
> >  #else
> >
> >  struct zswap_lruvec_state {};
> > @@ -73,6 +74,11 @@ static inline bool zswap_never_enabled(void)
> >         return true;
> >  }
> >
> > +static inline bool zswap_is_present(swp_entry_t entry, unsigned int nr)
> > +{
> > +       return false;
> > +}
> > +
> >  #endif
> >
> >  #endif /* _LINUX_ZSWAP_H */
> > diff --git a/mm/swap_state.c b/mm/swap_state.c
> > index 625c185a1ca4d..251b48b2c60e1 100644
> > --- a/mm/swap_state.c
> > +++ b/mm/swap_state.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/kernel_stat.h>
> >  #include <linux/mempolicy.h>
> >  #include <linux/swap.h>
> > +#include <linux/zswap.h>
> >  #include <linux/leafops.h>
> >  #include <linux/init.h>
> >  #include <linux/pagemap.h>
> > @@ -466,26 +467,27 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
> >         __swap_cache_do_add_folio(ci, folio, entry);
> >         spin_unlock(&ci->lock);
> >
> > +       /*
> > +        * Now that the folio is in the swap cache, zswap can no longer start
> > +        * storing or writing back any slot in the range, so this is a stable
> > +        * answer. Reject a high-order allocation over a range that already
> > +        * has per-page zswap entries.
> > +        */
> > +       if (order && zswap_is_present(entry, nr_pages)) {
> > +               err = -EBUSY;
> > +               goto delete_folio;
> > +       }
> > +
> >         if (mem_cgroup_swapin_charge_folio(folio, memcg_id,
> >                                            vmf ? vmf->vma->vm_mm : NULL, gfp)) {
> > -               spin_lock(&ci->lock);
> > -               __swap_cache_do_del_folio(ci, folio, entry, shadow);
> > -               spin_unlock(&ci->lock);
> > -               folio_unlock(folio);
> > -               /* nr_pages refs from swap cache, 1 from allocation */
> > -               folio_put_refs(folio, nr_pages + 1);
> > +               err = -ENOMEM;
> >                 count_mthp_stat(order, MTHP_STAT_SWPIN_FALLBACK_CHARGE);
> > -               return ERR_PTR(-ENOMEM);
> > +               goto delete_folio;
> >         }
> >
> >         if (order > 1 && folio_memcg_alloc_deferred(folio)) {
> > -               spin_lock(&ci->lock);
> > -               __swap_cache_do_del_folio(ci, folio, entry, shadow);
> > -               spin_unlock(&ci->lock);
> > -               folio_unlock(folio);
> > -               /* nr_pages refs from swap cache, 1 from allocation */
> > -               folio_put_refs(folio, nr_pages + 1);
> > -               return ERR_PTR(-ENOMEM);
> > +               err = -ENOMEM;
> > +               goto delete_folio;
> >         }
> >
> >         /* memsw uncharges swap when folio is added to swap cache */
> > @@ -499,6 +501,15 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
> >         /* Caller will initiate read into locked new_folio */
> >         folio_add_lru(folio);
> >         return folio;
> > +
> > +delete_folio:
> > +       spin_lock(&ci->lock);
> > +       __swap_cache_do_del_folio(ci, folio, entry, shadow);
> > +       spin_unlock(&ci->lock);
> > +       folio_unlock(folio);
> > +       /* nr_pages refs from swap cache, 1 from allocation */
> > +       folio_put_refs(folio, nr_pages + 1);
> > +       return ERR_PTR(err);
> 
> Nit: You can pull the refactoring into a separate patch (as well as
> most zswap changes, see below), so that this patch only has the
> logical change to bail for higher orders if any entry is in zswap.
> 
> >  }
> >
> >  /**
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 507f2d19fd2a4..f5b5827d30084 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -1587,11 +1587,14 @@ bool zswap_store(struct folio *folio)
> >   * @entry: base swap entry of the range
> >   * @nr: number of contiguous slots to check
> >   *
> > - * Context: The caller must keep the range pinned, otherwise the answer can
> > - * change under it.
> > + * Context: Unless the caller keeps the range pinned, the answer is only a
> > + * hint: zswap can store or write back a slot right after this returns. A
> > + * caller that needs a stable answer must pin the range first, as
> > + * __swap_cache_alloc() does by inserting the folio into the swap cache before
> > + * asking.
> 
> I would rather avoid naming specific functions as it will go stale
> quickly, and instead list the ways of "pinning" a range.
> 
> Also, generally, the changes to mm/zswap.c seem orthogonal to this
> patch and can be a separate patch (which would be clearer if
> __swap_cache_alloc() isn't named here).
> 
> >   * Return: true if at least one slot in the range is in zswap.
> >   */
> > -static bool zswap_is_present(swp_entry_t entry, unsigned int nr)
> > +bool zswap_is_present(swp_entry_t entry, unsigned int nr)
> >  {
> >         pgoff_t offset = swp_offset(entry);
> >         struct xarray *tree = swap_zswap_tree(entry);
> > @@ -1605,6 +1608,9 @@ static bool zswap_is_present(swp_entry_t entry, unsigned int nr)
> >          */
> >         BUILD_BUG_ON(SWAPFILE_CLUSTER > ZSWAP_ADDRESS_SPACE_PAGES);
> >
> > +       if (zswap_never_enabled())
> > +               return false;
> > +
> >         return xa_find(tree, &index, offset + nr - 1, XA_PRESENT);
> >  }
> >
> > --
> > 2.53.0-Meta
> >
> 
