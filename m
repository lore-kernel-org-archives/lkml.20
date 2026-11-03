Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793728161;
	b=bAf429tkN73LaZg0DnS99xbsNB9ZujHAPA/tX0/BLXCUZVkfZmvxna7JBQ7FDMwrr2Go
	 2CXRSZVuJ33v72JaoAn2rZJlw4/YA6QVs7gDCFi//LvihHHAq2tBPPZHO9wDkPxOEWo0V
	 eDNte1/cZDJ1CYjFgHT0bA7m3sFXnOmIBf8y8JCHH1dX5eIoQJNv7sxXGlX2qBNJAAYMi
	 1bbnRTn2qksS5diosZybjOhI01DtRjhqr5rxmW+uZr1jIQ7dBYnyJWg9+lO40vFOYAJOR
	 MDjL5gx8L6NkHGps6h7TC8eAAdMUpBbiz5JXQRlOqZk6G/qgaGJMtkQH16cYrUOPcdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HaiyNOaAuQa6ZOZsdJi3zkNAl8c9fizH8Hxx07wxITA=;
	b=qh0nHnLxZkwuZCvuMIhXY2/92hKQxeyti8VOoVfqkeYqWfdD+vb+TUIdyj+Wh5gnjNGS
	 d/Xl5/jn/Gq0tFNTHHbSeNPtRlXOcv4NGzS8wiORNOIhg39s0fPzT3mJ9KrX7fYWKU/H2
	 phSfZYlB3SIv/v2/ajFli/IzrS4Zm5i2dbm4CS3kF0ldHUEiu3elNH1pWIyaXWjOQarp8
	 MreKdY49mEHGUTqM2slz6yZcxVI6KpZjgw68+p3rK8umpwM7zJjzMWO2xYt3H1wSesw6z
	 3+E8AqxtUDhNAb4mcaJAB1fUBuc4jTjNSl372ZjI3ksMxVSclO313SisHKDQOZeZ+Hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PfxUrp1x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB40606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB40606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PfxUrp1x
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-54492d8a988so581cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728160; cv=none;
        d=google.com; s=arc-20260327;
        b=UpSJPtwYV9hNnHSmwP4/FVBLB1IptxbhppncrW9fsJCRZepo8/Hor5vncVqhO7au4f
         6i+wuNasHQM/aVb+dgz1dcqUaTsiLJ8GYkv6keLTThUOeClXGIfbOEm4B3ZpucLxytUB
         O4fdXjPfyWrqmEU7uGHcQBxSyfPNAR6lEb9MunNCpLWrz7zAIczQHeok77xfZSvvXl/n
         e+t+bJHprAq7pVmWTVms0HLPK43ZlDMqQI8IQ0VRFIu90jePpWWaGInSoKrecAG/NaAt
         rvNsnlo+iYZ/Qp9sSe4yCsKZRBren41YBEy02jhbZWKJ8n2qCVjDWPMVPuMpc9dGLQm0
         uFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HaiyNOaAuQa6ZOZsdJi3zkNAl8c9fizH8Hxx07wxITA=;
        fh=R6y5GHr5fsxphkaV4BOwTxkNYtUSablcRFCGXWzgx3s=;
        b=J3i1j3JXhy/qBAjOW3rQookQUNmtEc6VkjnngHWzOtSCnOZkS5HyJh2Qwnop3tDX3e
         rx679sae2dWKvbpGOe6h0ay2ZAZVh+qo3L3K7ETOAbGJIZyYNbKlfh/fooSMXZ4lzJ0V
         H7Xt/Vc13F3ZcKGOcXDZWxSDjVHAsINeGIZdck9TJEq4WDrif6Uhkg5hn2i+ruSicI/i
         +GlFT7Fva98N9PpdX7Axl6dIUERERRbmSwStRCia7yvaP6CFKHXU90NBK5uUIJuZGTnb
         GFR7gE0GBgqrp/VkG/HjqAb8RMJ8e3dq8mMr3Ik8/pmE1WCi81+xeZoEUMD4CLPQUEB2
         ta8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793728160; x=1794332960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HaiyNOaAuQa6ZOZsdJi3zkNAl8c9fizH8Hxx07wxITA=;
        b=PfxUrp1xL/xlRHlatl/APtUW2XIlBu5ELs4qO0bYPcPnlTepWoL+DzZncAfXIF4VDk
         MwzYaK5RmrfP+DnauZ7RnIe+NdTF7G9Gnide7HR53WwWHKISkCglHZGQX2mG/K3GuLuk
         II0OQTdrKdRtCCV6mIYwBjKhUNNhQogJ2eMVO8s0C+Y+MgGQm75g4JIYPmfuXQkUnI1u
         NtMgg9ffBqn2Fh2wDP6olfcSKyQKhXN68xzKrWc6niOFxf8eoH1qzbDrSIwc09lA+yCT
         DfqNfRRVPeJAUwoD+Mw0QeK6H3UV94QMjRf+UHD5ATFgRAfl+f3UVi5bVbKUGgYsIW5X
         hB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728160; x=1794332960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HaiyNOaAuQa6ZOZsdJi3zkNAl8c9fizH8Hxx07wxITA=;
        b=tyyP86SoKZlj0B4VgLLMHVVgm/mi6vcezhAnpiEEFMFUHP+oc5BPQLJ2sdqZI6GUjT
         /gNOYwraoc+DKNrSDCoprG698uEer2ulUynimUR1hc5hTMx7Wh61rm2cwSkeKIgbWjJw
         wS9Vxc9xRaHPsHzXgsulaBz9VVen9AO5HoCYd9nxTCu4PhJX2ZW8wJPwdO5VLeMwkxBG
         GM8F8lzUxL5/aNaFKbeOChF0ventfiFfIGgZ8P+9TZrkz6Yj66m/2V76QkkOrtTWiYyT
         qHojUSy+e1rjDLClThZakkwWDnvx9DUSVYww8yfAphXiPTJqAmMfEHg1Z+2PTgjs2jyM
         0qJw==
X-Forwarded-Encrypted: i=1; AKwUvBzeN2rkerjyeEs8Ce1RD1jNYXWcghbs+w084K8Gt22oaHbIfsAN5EToNkLE30L4Eu2RZrOzKmbSsZGXYrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3F5MluilEToNB7x/FL3igedO0yPrdzAhSo9rDXB8cOGIllIMb
	x7wRmZCozuIbgGSN/8D7sDAlIk3Q+Qb4wOMg1LWulNapG2zkdtls7HK+j4JojB//k3IGBNL/aJ3
	1E52LuSuf7W0FBkCSGj4Zyn79XdmZxB2BGbRalYMp
X-Gm-Gg: AYBFou3XIZm1bvddx24N7IAbcjvAJpGLOalJFBFuRrIsvnGx1GZiDIoyu42/c/L1fnI
	2c5sVZLdG3k0TSwrX0rfzd9eSPFLEt380/yfl+P0X0imcRm9L5aOURtbCvYoaXdMP6ebVjdkeYA
	6aEyo+0vwaEF9tI5w/6y3qhQ0Ks0sZ8ibz8DtIwXI0LxZpqx+4OsB5ECXIFz6/rlcnjwSLzdyVp
	qhaoUMjBNOXDTyoSVR1tgMQnup0HQiFzrG7Wqs0T4FCll7IoJRPR+mrMSAE2f76ORAgVI26EFhH
	whp0YJQcUPn/JiLi5jh2mTjokOAQxD3j6ksmTKYEuYLsAsE4lnyOE3FRb9SOZGZmebGyi0CKr4k
	OWq1xJSbNxCRfdmZGqdaz8LjbAggGSDyOUTjJlLphwRoqLhTgouZGuxK1WnZlImnYjA8lFHX1cb
	bYG1za0Xk8mg==
X-Received: by 2002:a05:622a:2447:b0:530:e335:4ef with SMTP id
 d75a77b69052e-549ba0e24f1mr24262071cf.2.1793728159250; Tue, 03 Nov 2026
 09:49:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260705180714.3708947-1-jiaqiyan@google.com> <20260705180714.3708947-5-jiaqiyan@google.com>
 <c5d4a1e4-cc3f-5cee-2ec3-53d5eb01bbb2@huawei.com> <CACw3F52RfFR4gZ9+kAmi6fkq39t6Sk1oUW0jqiXOFAAgn0iOyQ@mail.gmail.com>
 <d908b3d6-e3db-6eaf-100f-ffc1dd765c55@huawei.com> <CACw3F537_QTg8eax-aB2jDv+tEqgg8GqsP=T9wEfpH+zNttanw@mail.gmail.com>
 <b7319726-4621-1896-07d0-f83a7fc37258@huawei.com>
In-Reply-To: <b7319726-4621-1896-07d0-f83a7fc37258@huawei.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 3 Nov 2026 09:49:02 -0800
X-Gm-Features: AclHuK_v_z4Y5l6gQ9sQwU8ESG-N9nhXyXZaDd_ADZi26NE2v0VyKjxUdHSgXLU
Message-ID: <CACw3F51sDrZCWoNOhUnv3Sbs-FHztOQdhuouAfYBjPpaBYmX=g@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] mm/memory-failure: skip take_page_off_buddy after
 dissolving HWPoison HugeTLB page
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: osalvador@kernel.org, willy@infradead.org, osalvador@suse.de, 
	jackmanb@google.com, hannes@cmpxchg.org, nao.horiguchi@gmail.com, 
	david@kernel.org, william.roche@oracle.com, tony.luck@intel.com, 
	wangkefeng.wang@huawei.com, jane.chu@oracle.com, akpm@linux-foundation.org, 
	muchun.song@linux.dev, liam@infradead.org, rientjes@google.com, 
	duenwen@google.com, jthoughton@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, vbabka@suse.cz, rppt@kernel.org, 
	shuah@kernel.org, surenb@google.com, mhocko@suse.com, 
	boudewijn@delta-utec.com, ljs@kernel.org, ziy@nvidia.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 2:06=E2=80=AFAM Miaohe Lin <linmiaohe@huawei.com> w=
rote:
>
> On 2026/8/18 11:30, Jiaqi Yan wrote:
> > On Mon, Aug 17, 2026 at 12:23=E2=80=AFAM Miaohe Lin <linmiaohe@huawei.c=
om> wrote:
> >>
> >> On 2026/8/17 8:29, Jiaqi Yan wrote:
> >>> On Fri, Jul 17, 2026 at 12:37=E2=80=AFAM Miaohe Lin <linmiaohe@huawei=
.com> wrote:
> >>>>
> >>>> On 2026/7/6 2:07, Jiaqi Yan wrote:
> >>>>> Now that HWPoison subpage(s) within HugeTLB page will be rejected b=
y
> >>>>> buddy allocator during dissolve_free_hugetlb_folio(), there is no
> >>>>> need to drain_all_pages() and take_page_off_buddy() anymore. In fac=
t,
> >>>>> calling take_page_off_buddy() after dissolve_free_hugetlb_folio()
> >>>>> succeeded returns false, making caller think __page_handle_poison()
> >>>>> failed.
> >>>>>
> >>>>> Add __hugepage_handle_poison() and replace __page_handle_poison() a=
t
> >>>>> HugeTLB specific call sites. The being handled HugeTLB page either
> >>>>> is free at the moment of try_memory_failure_hugetlb(), or becomes
> >>>>> free at the moment of me_huge_page().
> >>>>>
> >>>>> Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> >>>>> ---
> >>>>>  mm/memory-failure.c | 36 ++++++++++++++++++++++++++++++------
> >>>>>  1 file changed, 30 insertions(+), 6 deletions(-)
> >>>>>
> >>>>> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> >>>>> index 3d15b4c1b694..a37b67550718 100644
> >>>>> --- a/mm/memory-failure.c
> >>>>> +++ b/mm/memory-failure.c
> >>>>> @@ -174,6 +174,30 @@ static struct rb_root_cached pfn_space_itree =
=3D RB_ROOT_CACHED;
> >>>>>  static DEFINE_MUTEX(pfn_space_lock);
> >>>>>
> >>>>>  /*
> >>>>> + * Only for a HugeTLB page being handled by memory_failure(). The =
key
> >>>>> + * difference to soft_offline() is that, no HWPoison subpage will =
make
> >>>>> + * into buddy allocator after a successful dissolve_free_hugetlb_f=
olio(),
> >>>>> + * so take_page_off_buddy() is unnecessary.
> >>>>> + */
> >>>>> +static int __hugepage_handle_poison(struct page *page)
> >>>>> +{
> >>>>> +     struct folio *folio =3D page_folio(page);
> >>>>> +
> >>>>> +     /*
> >>>>> +      * Can't use dissolve_free_hugetlb_folio() without a reliable
> >>>>> +      * raw_hwp_list telling which subpage is HWPoison. So do not =
free
> >>>>> +      * them to the buddy allocator. dequeue_hugetlb_folio_node_ex=
act()
> >>>>> +      * will ensure to never re-allocate this hugepage.
> >>>>> +      */
> >>>>> +     if (folio_test_hugetlb_raw_hwp_unreliable(folio))
> >>>>> +             /* raw_hwp_list becomes unreliable when kmalloc() fai=
ls. */
> >>>>> +             return -ENOMEM;
> >>>>
> >>>> There are some branches in __update_and_free_hugetlb_folio that will=
 leave hugetlb
> >>>> folio untouched:
> >>>>
> >>>> static void __update_and_free_hugetlb_folio(struct hstate *h,
> >>>>                                                 struct folio *folio)
> >>>> {
> >>>>         bool clear_flag =3D folio_test_hugetlb_vmemmap_optimized(fol=
io);
> >>>>
> >>>>         if (hstate_is_gigantic_no_runtime(h))
> >>>>                 return;<-- 1
> >>>
> >>> Thanks for catching this, Miaohe.
> >>>
> >>> I think the most challenging part is that
> >>> update_and_free_hugetlb_folio() must support deferring freeing (via
> >>> schedule_work()), so adding a return value isn't that straightforward
> >>> without some refactoring...
> >>>
> >>> If making __hugepage_handle_poison() check
> >>> hstate_is_gigantic_no_runtime() =3D=3D 0 (or
> >>> gigantic_page_runtime_supported() =3D=3D 1) isn't an absurd idea, we =
can
> >>
> >> I'm afraid this might not be a good idea. Maybe we could re-check page=
 state after
> >
> > Any specific reason? It seems to me that code that included
> > "hugetlb.h" can access gigantic_page_runtime_supported().
>
> I am concerned that with the changes of the implementation of
> dissolve_free_hugetlb_folio(), gigantic_page_runtime_supported()
> might not be the sole reason causing dissolve_free_hugetlb_folio()
> to fail. This would require __hugepage_handle_poison() to be modified
> accordingly but we might miss that in the future... But still no strong
> opinion here. :)

Coming back from a long vacation and catching up with this conversation....

I found commit a363c62a653c ("mm/hugetlb: do not dissolve gigantic
pages without runtime support") has landed in akpm/mm-unstable, adding
"if (hstate_is_gigantic_no_runtime(h)) goto out;" directly inside
dissolve_free_hugetlb_folio(). So for this particular case, I think no
more checking is necessary.

Your concern in general still holds. Usually or at least sometimes,
caller of dissolve_free_hugetlb_folio() expects its return value
reflects the true results of dissolving and freeing; however,
update_and_free_hugetlb_folio() can bail out silently.

>
> Thanks.
> .
>
> >
> > I feel checking gigantic_page_runtime_supported() upfront is cleaner
> > than checking page state after dissolve:
> >
> > if (!gigantic_page_runtime_supported())
> >     return -EOPNOTSUPP;
> >
> > vs
> >
> > /* Direct state check after dissolve */
> > rc =3D dissolve_free_hugetlb_folio(folio);
> > if (!rc && folio_test_hugetlb(folio)) {
> >     /* Dissolve failed silently due to unsupported gigantic runtime fre=
eing */
> >     rc =3D -EOPNOTSUPP;
> > }
> >
> >
> >> calling dissolve_free_hugetlb_folio?
> >>
> >>> just do that and avoid adding return value to
> >>> __update_and_free_hugetlb_folio().
> >>>
> >>>>
> >>>>         /*
> >>>>          * If we don't know which subpages are hwpoisoned, we can't =
free
> >>>>          * the hugepage, so it's leaked intentionally.
> >>>>          */
> >>>>         if (folio_test_hugetlb_raw_hwp_unreliable(folio))
> >>>>                 return;<-- 2
> >>>
> >>> __hugepage_handle_poison() already checked this, and with mf_mutex no
> >>> one can set raw_hwp_unreliable.
> >>
> >> Agreed.
> >>
> >>>
> >>>>
> >>>>         /*
> >>>>          * If folio is not vmemmap optimized (!clear_flag), then the=
 folio
> >>>>          * is no longer identified as a hugetlb page.  hugetlb_vmemm=
ap_restore_folio
> >>>>          * can only be passed hugetlb pages and will BUG otherwise.
> >>>>          */
> >>>>         if (clear_flag && hugetlb_vmemmap_restore_folio(h, folio)) {
> >>>>                 spin_lock_irq(&hugetlb_lock);
> >>>>                 /*
> >>>>                  * If we cannot allocate vmemmap pages, just refuse =
to free the
> >>>>                  * page and put the page back on the hugetlb free li=
st and treat
> >>>>                  * as a surplus page.
> >>>>                  */
> >>>>                 add_hugetlb_folio(h, folio, true);
> >>>>                 spin_unlock_irq(&hugetlb_lock);
> >>>>                 return;<-- 3
> >>>
> >>> __hugepage_handle_poison() should not get into this if-block because
> >>> dissolve_free_hugetlb_folio() must have
> >>> hugetlb_vmemmap_restore_folio()-ed successfully, so clear_flag must b=
e
> >>> false here. Otherwise dissolve_free_hugetlb_folio() already returns
> >>> early without update_and_free_hugetlb_folio().
> >>
> >> Agreed.
> >>
> >> Thanks.
> >> .
> > .
> >
>
