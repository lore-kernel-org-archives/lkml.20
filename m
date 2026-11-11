Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419234;
	b=tmBVeZTzP+k6tG82IVTBcr9cXlfQKc79U0TURUJPspvwx30L4dZ55evTZitvIBOvfXGz
	 lIbw2QzN4ogzDXR6Sw4qxKTUrK80UFo9UYsnp2U65yZOZnomRjQC0Lw7m3pxUWwWKtWt3
	 BuENDS833c5TdAYXsqECTihYuvlQ93joaZyLkEkwMQVWFsDb6BCfX38iNJf0hqOr+eNrE
	 7K39+IXEm40UQ+lGThrDWsPECT3wBHEvTyZKGw3slSS+qKNz1clxYnk3J6OuFOMz+cUOy
	 sozyozv3nnMdUgS5yopT1w6Vrn10PWYLJ2ugc7eXyUPZJI1aezkSnk5NcOGCpxpQrow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0MglZ2+4MgA6qoVKrAGxsEiMN/rG/VnPk4yp/O82FwA=;
	b=mOJkw2629smgYsu5AGHqNm3YGriqw3MyjLW0poNRnQlhwYlA/WSghePDjsbt6SCqlrE3
	 LtdfOZ3vrXFT0PavbffjQpcSJ3rHuM9qNEB/ZKQCDMmMaT/KrqTbdiulGTV7O5Hv5iock
	 IELynJ/LjKSC0GzeUmwFgF0paHLdKk2lu6pc7Gg/y6sOAxqfWKsCNx5wRufbKUx9Nh6+e
	 /TrrPReP7bVg7iAjN1fPqkcQYnl5H+0NnEEPd9gU+BnftdPjvzWg0i23KPu5ycfHlbogu
	 Q0/KYlh3U8yq4GkYASMEiPuixSG4rWV++m7BKChzpZgzI7TOTd/V3GFJpcQfvIJaUaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UJFRxnSa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F8606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E28F8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UJFRxnSa
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b6266b5bc4so40725e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:47:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794419232; cv=none;
        d=google.com; s=arc-20260327;
        b=NA2Vw351W7Yzn06V6bZ4KNqAGNAX9EizeaCmHDtoa7xIRwtIp2rEOQGxrVtQpPtkl1
         hTfejwI/wIHb8jwFcU457OljZFGsGWpAPP8wICP2spPP2nDuM3k7jgCQX7D/427mhBkw
         fFp+m/0SP3ZhoJFZjRqvzORPRJDRgYTiuFwEDKo4Jy9wpjaNstzAz8LU3kq3sKj9rS0B
         Z9rOnkByJTZlSP3nSfee4a8SFKnADzU8PJ6pKnWsYS1vA57k5ZaOYuVqNXISjra1/qst
         TgIc4Ip9HMvwuEOxfDVhvyfqCv7CSKB2yYWk25KfQthNTe8UE0EsFFTekcCaeUAXF3Hl
         muFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0MglZ2+4MgA6qoVKrAGxsEiMN/rG/VnPk4yp/O82FwA=;
        fh=3HqgXK6FrCRMH42lbSMGjhT2JL8O/yxuXvknPA1GrJk=;
        b=mt8bGEdIZ/8BVsXHhv7Kq200TIR/PZ7fpqbkPett7mzDXJ8lf1a0MJ/F7vlIe/M25a
         GJvsrALtHSWXX+HOzPzdc+JrrDe9A/ZAwMi/PazqGZOH46A9sDbLxOwHeTn7g91wo7Zx
         NCva7UMcLE8zu1zTPFbAX/5nXtoDpHscUccMgza+8O4A7kin4zISodJzAdlyuZalIeyn
         372c9IZ9oh4tDr62zqlLexWkTdVE0i8jpu6aHd6+jspr84mM7o5iHkvJCt7FPeEEkzix
         qNsGSnsD7oEdxf58fRju0pwqg/fwTBNlt6VTvWN+DFHV9QLE9tWrGB2v3suv8MPG2mF6
         qtlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794419232; x=1795024032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0MglZ2+4MgA6qoVKrAGxsEiMN/rG/VnPk4yp/O82FwA=;
        b=UJFRxnSa+vHghtttTmGavInSSuDTXchxfle8KVvUyb0y5xhCjtB4P92oJw7AlNg5O5
         fq5P2bEzNKgtlNGM0I7CVCTU7S55r5lpNdVJbqg+uivLNUPpc6CWdbiO6bp1vp6H3UyI
         LeKO7LuEFDJsYUtlUep53WEZvcdHLhQV66C6H48TgC5xrHuQqTPmvP8Psope4MJfHTEm
         HGjnCMgyFcwkwfDu3GG9/BXOnCPLqPNaO1Vd43wV21s/5pQuN/J8+nCH7cszfRhChphY
         MzWz3qw0fWT1Fg7A5Q9c34d8BbB6p4lg9OQ6GjWeLEfWFljvz/eZf9N8Y7uWnjaATn1Q
         YQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419232; x=1795024032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MglZ2+4MgA6qoVKrAGxsEiMN/rG/VnPk4yp/O82FwA=;
        b=p6arx2zamSLEXSnflrHqYTcwkn/COOY58dYLxYvoiuyaL9UCypI2F0Nchgn9qf3bg5
         0FWMu39Ve/bCigE/NlFZCg1XFZNrskpnbelbPUq/PVKarI13NLPrEsWmLt2CuB87Qxex
         0PvEnwEkj0Aa80itYsp+lmDVmZAnX1VuKpL2hNx12Tl2GVFa/uHWvVrFy/GZxLxkvpvg
         3R7Sl/PpfQDwqFRUMQhdFt1GjzzhFbaEHGztNnLh9IAll6u9FZ0Am0KvYs2JLxZiGLZU
         MIFpNkW7mZTQh9LuTV/NfZib61mOXw1AopTCCMZjUgZapXZZWlTBlIwImd5BtNmc9/NT
         HT7g==
X-Forwarded-Encrypted: i=1; AL+hErE5btkBQK5YX9XyD4wsYRk+Sep+cCcvBTO2YdlvuDFIoM7A8QUzL5efoch+aMCJVXVkMQRmd12d7Ti9BbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z87AKfQz6hSG/Fy2nyvvSoxYAoYZ6MSq1ikQEJbN4R56OZ/rR2u
	9RlWXBLVpJk1uLJ0vOU8IkqIoYEeibYN+Iceuvp0QBPwblB/bVUZmzpwZ3VvJ+4i7wWM90egOnG
	aIaMeLg+Tb60Tz6HSFofgPbs47mQ95Qk8BrF0ecjk
X-Gm-Gg: AYBFou1mu4X40ZJMDCSMng5H3VqXHND5xjZfhNb2Iht1rpTmfCbeCMv1VL6SWxkm2Zw
	Ygqhk+mriW+loB6Vn/gYR6sZ7ppwV5oz3iQeD9Gdty2l609061sN8KyRadUQ6fB8KkKWv4JT0zj
	oSyHOqY1Kl2pfAkmAg+KJhBXaj/7VwK3mSGP/P1jgjVOjNZn+GLiaqbXO/sEo02awspbQvrOPhP
	NS4D4FK9p26w4iq7geMYEO8upsgapRFIpZ2mZLCBrLJVh+ZCy6T1LleoYU1NvsnAR/vpMos6OZJ
	mxZgB6HVhaSWxryhZTwCo+DDBhbyLZDO4ye7OhGofdN5BUQRGi8sD7tXHsWXdCfh3Ma/ToJUive
	IV54a9oC278Zpe4ERUk6XV97RwgYNU4nO2ET2WEGy/QTKsUZGRQVn+oty/gaEw/v1nDw=
X-Received: by 2002:a05:600c:c086:b0:4a2:1912:6687 with SMTP id
 5b1f17b1804b1-4ba09170ee3mr852245e9.2.1794419231803; Wed, 11 Nov 2026
 09:47:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111093747.50048-1-songmuchun@bytedance.com> <20261111093747.50048-2-songmuchun@bytedance.com>
In-Reply-To: <20261111093747.50048-2-songmuchun@bytedance.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Wed, 11 Nov 2026 09:46:59 -0800
X-Gm-Features: AclHuK8z5FnzGqe8u0PQ4Ulh8pu20DR0dU1bs3qSGpuaTxaD_TsAlYrPl_76rQ8
Message-ID: <CACw3F50296rRFQaxopftKTLUr7N2X+v+zN8wX9=su36wQj185Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mm/hugetlb_vmemmap: fix lost HWPoison state during optimization
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Muchun Song <muchun.song@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Sashiko <sashiko-bot@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 1:38=E2=80=AFAM Muchun Song <songmuchun@bytedance.c=
om> wrote:
>
> HVO copies the vmemmap head page before remapping it to a newly allocated
> backing page. Memory failure can update the old head page after the copy
> but before the remap's TLB invalidation completes:
>
> CPU 0                            CPU 1
> init_new_hugetlb_folio()
> __hugetlb_vmemmap_optimize_folio()
>   vmemmap_optimize_pte()
>     copy_page(old_head, new_head)
>                                  try_memory_failure_hugetlb()
>                                    get_huge_page_for_hwpoison()
>                                      hugetlb_update_hwpoison(old_head)
>   set_pte_at(..., new_head)
>   flush_tlb_all()
> free_vmemmap_page_list(old_head)
>
> The raw_hwp_page linked to the old head is then leaked and the folio's
> HWPoison state is lost when the obsolete backing page is freed, allowing
> the poisoned huge page to be allocated later.
>
> Serialize HVO remapping against HWPoison updates. This ensures that an
> update is either copied to the new vmemmap head page or applied after HVO
> installs the new mapping and completes the TLB flush.
>
> Fixes: 11aad2631bf7 ("mm/hugetlb_vmemmap: remap head page to newly alloca=
ted page")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-18e93f17-529b-4d84-ba44-a41829f4b=
e64
> ---
>  mm/hugetlb_vmemmap.c | 10 ++++++++++
>  mm/hugetlb_vmemmap.h | 24 ++++++++++++++++++++++++
>  mm/memory-failure.c  |  2 ++
>  3 files changed, 36 insertions(+)
>
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index ba8e11e399b2..79ca68dff635 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -15,6 +15,7 @@
>  #include <linux/mmdebug.h>
>  #include <linux/pagewalk.h>
>  #include <linux/pgalloc.h>
> +#include <linux/rwsem.h>
>  #include <linux/vmemmap-optimization.h>
>
>  #include <asm/tlbflush.h>
> @@ -41,6 +42,8 @@ struct vmemmap_remap_walk {
>         unsigned long           flags;
>  };
>
> +DECLARE_RWSEM(vmemmap_remap_rwsem);
> +
>  static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned lon=
g start,
>                              struct vmemmap_remap_walk *walk)
>  {
> @@ -333,6 +336,9 @@ static int vmemmap_pteify_folio(const struct folio *f=
olio, unsigned long flags)
>   * responsible for freeing the pages left on the @vmemmap_pages list, ev=
en on
>   * failure.
>   *
> + * Note: The caller must hold vmemmap_remap_rwsem. If TLB flushing is de=
ferred,
> + * the lock must remain held until the final TLB flush.
> + *
>   * Return: %0 on success, negative error code otherwise.
>   */
>  static int vmemmap_optimize_folio(const struct folio *folio,
> @@ -348,6 +354,8 @@ static int vmemmap_optimize_folio(const struct folio =
*folio,
>                 .flags          =3D flags,
>         };
>
> +       rwsem_assert_held(&vmemmap_remap_rwsem);
> +
>         VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
>
>         if (!vmemmap_optimizable_order(folio_order(folio)))
> @@ -536,6 +544,7 @@ void hugetlb_vmemmap_optimize_folio(const struct hsta=
te *h, struct folio *folio)
>  {
>         LIST_HEAD(vmemmap_pages);
>
> +       guard(rwsem_read)(&vmemmap_remap_rwsem);
>         __hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, 0);
>         free_vmemmap_page_list(&vmemmap_pages);
>  }
> @@ -588,6 +597,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h=
, struct list_head *folio_l
>
>         flush_tlb_all();
>
> +       guard(rwsem_read)(&vmemmap_remap_rwsem);
>         list_for_each_entry(folio, folio_list, lru) {
>                 int ret;
>
> diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
> index d057e8b12bf1..8b28063d78cc 100644
> --- a/mm/hugetlb_vmemmap.h
> +++ b/mm/hugetlb_vmemmap.h
> @@ -9,9 +9,12 @@
>  #ifndef _LINUX_HUGETLB_VMEMMAP_H
>  #define _LINUX_HUGETLB_VMEMMAP_H
>  #include <linux/hugetlb.h>
> +#include <linux/rwsem.h>
>  #include <linux/vmemmap-optimization.h>
>
>  #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
> +extern struct rw_semaphore vmemmap_remap_rwsem;
> +
>  int hugetlb_vmemmap_restore_folio(const struct hstate *h, struct folio *=
folio);
>  long hugetlb_vmemmap_restore_folios(const struct hstate *h,
>                                         struct list_head *folio_list,
> @@ -20,6 +23,16 @@ void hugetlb_vmemmap_optimize_folio(const struct hstat=
e *h, struct folio *folio)
>  void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head =
*folio_list);
>  void hugetlb_vmemmap_optimize_bootmem_page(unsigned long pfn, unsigned i=
nt order);
>
> +static inline void hugetlb_vmemmap_write_lock(void)
> +{
> +       down_write(&vmemmap_remap_rwsem);
> +}
> +
> +static inline void hugetlb_vmemmap_write_unlock(void)
> +{
> +       up_write(&vmemmap_remap_rwsem);
> +}
> +
>  static inline unsigned int hugetlb_vmemmap_size(const struct hstate *h)
>  {
>         return pages_per_huge_page(h) * sizeof(struct page);
> @@ -59,6 +72,14 @@ static inline void hugetlb_vmemmap_optimize_folios(str=
uct hstate *h, struct list
>  {
>  }
>
> +static inline void hugetlb_vmemmap_write_lock(void)
> +{
> +}
> +
> +static inline void hugetlb_vmemmap_write_unlock(void)
> +{
> +}
> +
>  static inline unsigned int hugetlb_vmemmap_optimizable_size(const struct=
 hstate *h)
>  {
>         return 0;
> @@ -69,6 +90,9 @@ static inline void hugetlb_vmemmap_optimize_bootmem_pag=
e(unsigned long pfn, unsi
>  }
>  #endif /* CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP */
>
> +DEFINE_LOCK_GUARD_0(vmemmap_remap,
> +                   hugetlb_vmemmap_write_lock(), hugetlb_vmemmap_write_u=
nlock())
> +
>  static inline bool hugetlb_vmemmap_optimizable(const struct hstate *h)
>  {
>         return hugetlb_vmemmap_optimizable_size(h) !=3D 0;
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 78f0a13349cb..164a02866fd5 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -69,6 +69,7 @@
>  #include "page_alloc.h"
>  #include "internal.h"
>  #include "memory-failure.h"
> +#include "hugetlb_vmemmap.h"
>
>  static int sysctl_memory_failure_early_kill __read_mostly;
>
> @@ -2038,6 +2039,7 @@ static int get_huge_page_for_hwpoison(unsigned long=
 pfn, int flags,
>         bool count_increased =3D false;
>         int ret, rc;
>
> +       guard(vmemmap_remap)();
>         spin_lock_irq(&hugetlb_lock);
>         folio =3D page_folio(page);
>         if (!folio_test_hugetlb(folio)) {
> --
> 2.54.0
>
>

LGTM :)

Reviewed-by: Jiaqi Yan <jiaqiyan@google.com>
