Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD6E40B360
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087754; cv=pass; b=LvoW+35sPtqXQ7TcVXEJg/s2NJn6NYqk3w+NnlJNN6wmi79txgIHSX0wfyu2UOsnc+Ua8Or6rLm8TV4QhMwz/rXMfBHlG6gMUjNLuHWAO8eUxBFNqsBwwiTmoGioiwmC7HXxJax8oWfVE2ZSkUliB0Wi6c/rkcnr8iV63ZyYiHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087754; c=relaxed/simple;
	bh=F6DxW3SXJZHdbOOUfkwznpoF++sRCvwou8e7w4hV31c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScL5VhDEMKsCrMfGijXeEMJ5lJ9pIlTIMNDwuTubfQcwmWh51R4BLTV/EPysRABl6zyWzXk8YxTUWCSymUAaNsxqKEYFXf5e8w3F00HZgKBKcaJDUTIgpAWWDGeIqv0Ez0XOeSL5dzMabhM3ki3CgAEOUwmXwza6u1mnLytcQwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TdH0UltI; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TdH0UltI"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so12139a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087751; cv=none;
        d=google.com; s=arc-20260327;
        b=OvdEpTNT1RMmOKm0isLNJnLHFabViXH5j8Mb3zfd0ZuMm3AQ+Of2iM00/jH1dBF0Z8
         rNexF9CJ8R0o8Cu1lgQlR5cS3gcokP7PAiBFI3vSNMQAa9v9BN5XQFL4XQwccPf/Wm9V
         hWADTUeYNGc0jkem+/Lcbk2lLyE/icgV70B/BWwEJKAGViXXxYWtzB2U20WhMEip2Gwy
         LHAHjTR0zk9Pb5ix6QGsBm9Wg7Y8f6YiASEqRozBGdf2KoapQSIo+yilISasdIQqHKwj
         dKuy6wjLYqsKdac0l68Ug/PTqqy9ZIMshi1+fCpyHln7V4dakbKMeaRvlILagN9l2eI9
         tIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KdISmA3ixIlNjIAB3K7umMj0lq95tzNubXcY7qdlJJ4=;
        fh=RyWEvbhVNdLkhOs8OxsMzwAXroWRo6+ybnfbeKi6pDg=;
        b=oab+V6NGP9ErPCOXH2rNmMQjW2Q6gPYKjjbDKunleXpeCs85iw+D8ruhbHMsWEl8La
         T7OenNGJdb7ar4XfSCXn2YeD8b8Uc4sTA6btZ1/sP+725LmBuiLTliuTKfhrmg+aFvYQ
         eIa/rxeG+cuZw+vub3N5COKEGMedYEDFyd1zGO/BjYlcvqgDIHEsmBW46V8ZZTVsyV80
         Jyx5laGdhWMC1RnOCDrl5EcvFnsfOVG7gGT5+JOATm1TErfH10ArV4i1S9fAqw1r7Bh9
         VgtZLY/ndfHNjnbSnEx5HVBJCD4IbIEDzPXOMdFXyCyfakDLahecdZBAQwk1I2Sfe0oc
         Kdzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790087751; x=1790692551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KdISmA3ixIlNjIAB3K7umMj0lq95tzNubXcY7qdlJJ4=;
        b=TdH0UltId9Tai67AN8ivlyJINHQ9jH/f8L7hqvHF0VH6iXBz9O3tw6mGwVK5e3yMJz
         8FH38OWmhSIKEpRJNuX0aaJXwtFgsI4HE9lsjT8Dwjr4EayzY6vUzaXzDFBVGjXKyX9n
         7QaRrqj3xDnxTlvoeS10kgFvQ0jo2olJdBRgedrYi2GkXOKea+B7yMfA2Zy4LPKGoR2J
         NuUyhpkTfFSbXLBOu9hKsFoYOFhj4/DeILNgpKuCpRyVE/XI7OKCjamTcv13WcuNVYNA
         jYPkVJ+6xyL3zNKfIUFjpHOr0mYOkLBXYa1hp7crmkCQHD7Iue4hj89gci1xPcignPJL
         Gz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087751; x=1790692551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdISmA3ixIlNjIAB3K7umMj0lq95tzNubXcY7qdlJJ4=;
        b=ErHAa9kFJ9JCPaa/6bQxBCArZhhk3eK1J8Po2cL74JcIYv6xuDs07+Yl+nYcFVCzIY
         0F2cTGK2g3PVLH0TpjxMxnwa8AVZItoJTNSQF1natPRV7XeCzT4MTDANGyY6GgvBEc9u
         SvxEx400H3P2EgNeGpUj5BhQqCJhgGkrlWZVheIqBYyw1LU9zFhjb6b/m4VrlY2oOkmF
         w2qqgxto0fG3e3NkXODQDJJt6VIW91wZEz1RC/YSuJdDWI65NbFHZt0yaYVZyNZsYz06
         722Gks28m49d19zwP0UqrNCbo1WhXqBjYfM7OAuj2P8LpTfoNExGnQynsX0mlj/Wgkyb
         hqkg==
X-Gm-Message-State: AFuF++lAcfI+jtLSyZ3kyvhGVKWtLglkH7xboB27Wyj1hpkFRHPKmaRH
	cwZ+jHbCYQwSB7jJ44FTL5bt0ck8umO366ny6boDilakXpJkCRu0uOFJJqQThJBh9EHeLpsAZ1R
	YaYrVHER9iu3wbpScnrb0VzjG+tythk5tTulkRkqanS7s5Y4JrbH5D2e9CUI=
X-Gm-Gg: AYBFou2GMjZGpxD0Nk3neuX4U4bFWwmGn1ROM6BatYKhKc2NogJBCCB2mQbxWTkgSfh
	hVixBGNKNXUcn0qVIa5EYB6zJ6t+JJ5ImEXV+SIsvWDEd8XxSA5l9Sb88FfbeWzX9nFdhCOeCkF
	NhZgGpeo1Ru1PV/l1H80R/Q6E8LkCc+zHySgEV1SzCtLPWW3NGhdiozQaV/tEU2HTGINfh8cEir
	u1++JRYezz7D5U4hwpdDFfXCi7FJz+1Rgm3LYySsYnZz8kMdhjGTcg+AukLfeovIQPtiwSxp3EZ
	gGDfdPbzTkLciR+ajGSG7+5YLps4/RtHBUZpWbD000s/R7xMPnhWXB6pXSLxof/n1Iu/TleYfnf
	9Ns1JLOGHDMc/Rw==
X-Received: by 2002:a05:6402:23c8:b0:6a6:f2a5:1b4f with SMTP id
 4fb4d7f45d1cf-6aaac5924eemr8663a12.4.1790087750560; Tue, 22 Sep 2026 07:35:50
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715150125.2798116-1-smostafa@google.com>
In-Reply-To: <20260715150125.2798116-1-smostafa@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 22 Sep 2026 15:35:38 +0100
X-Gm-Features: AclHuK-rurQJCakbPVql7LeaZWXspdhQDHQ-9g658VqXPpUrYK4ePYQ8b4RsihE
Message-ID: <CAFgf54rT1wvmGqm+8JqrKShhh+5pEWDS0f4FReT9CJBbcjnk1A@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Use consistent type for pool size
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 4:01=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> All the pool sizes in the hypervisor are "unsigned long" but when
> they get passed to hyp_early_alloc_contig() or hyp_pool_init() they get
> truncated to 32-bits.
>
> That is not a big problem at the moment as to overflow this we need
> 4G bytes of carveout (2 TB of host or guest system memory).
>
> However when new users are added (as IOMMU) it is hard to reason
> about the carveout size anymore.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Ping, as Sashiko reminded me about this:
https://lore.kernel.org/all/20260922132359.BB0381F000FF@smtp.kernel.org/

This has already been reviewed.

Thanks,
Mostafa

> ---
> For example in the SMMUv3 to avoid this overflow, I add a cap
> for the pools size to UINT_MAX to work around this:
> https://lore.kernel.org/linux-iommu/20260715115906.2664882-9-smostafa@goo=
gle.com/
> ---
>  arch/arm64/kvm/hyp/include/nvhe/early_alloc.h | 2 +-
>  arch/arm64/kvm/hyp/include/nvhe/gfp.h         | 4 ++--
>  arch/arm64/kvm/hyp/nvhe/early_alloc.c         | 2 +-
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c          | 6 +++---
>  4 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h b/arch/arm64/k=
vm/hyp/include/nvhe/early_alloc.h
> index dc61aaa56f31..462883c4e325 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
> @@ -7,7 +7,7 @@
>  void hyp_early_alloc_init(void *virt, unsigned long size);
>  unsigned long hyp_early_alloc_nr_used_pages(void);
>  void *hyp_early_alloc_page(void *arg);
> -void *hyp_early_alloc_contig(unsigned int nr_pages);
> +void *hyp_early_alloc_contig(unsigned long nr_pages);
>
>  extern struct kvm_pgtable_mm_ops hyp_early_alloc_mm_ops;
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/gfp.h b/arch/arm64/kvm/hyp/i=
nclude/nvhe/gfp.h
> index 3766333bace9..3a428dc40b14 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> @@ -29,6 +29,6 @@ void hyp_get_page(struct hyp_pool *pool, void *addr);
>  void hyp_put_page(struct hyp_pool *pool, void *addr);
>
>  /* Used pages cannot be freed */
> -int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
> -                 unsigned int reserved_pages);
> +int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages=
,
> +                 unsigned long reserved_pages);
>  #endif /* __KVM_HYP_GFP_H */
> diff --git a/arch/arm64/kvm/hyp/nvhe/early_alloc.c b/arch/arm64/kvm/hyp/n=
vhe/early_alloc.c
> index 00de04153cc6..9fef0c7d2185 100644
> --- a/arch/arm64/kvm/hyp/nvhe/early_alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
> @@ -21,7 +21,7 @@ unsigned long hyp_early_alloc_nr_used_pages(void)
>         return (cur - base) >> PAGE_SHIFT;
>  }
>
> -void *hyp_early_alloc_contig(unsigned int nr_pages)
> +void *hyp_early_alloc_contig(unsigned long nr_pages)
>  {
>         unsigned long size =3D (nr_pages << PAGE_SHIFT);
>         void *ret =3D (void *)cur;
> diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nv=
he/page_alloc.c
> index 57f86aa0f82f..51460d420c94 100644
> --- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> @@ -229,12 +229,12 @@ void *hyp_alloc_pages(struct hyp_pool *pool, u8 ord=
er)
>         return hyp_page_to_virt(p);
>  }
>
> -int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
> -                 unsigned int reserved_pages)
> +int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages=
,
> +                 unsigned long reserved_pages)
>  {
>         phys_addr_t phys =3D hyp_pfn_to_phys(pfn);
>         struct hyp_page *p;
> -       int i;
> +       unsigned long i;
>
>         hyp_spin_lock_init(&pool->lock);
>         pool->max_order =3D min(MAX_PAGE_ORDER,
> --
> 2.55.0.141.g00534a21ce-goog
>
