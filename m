Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4122E4734F3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847490; cv=pass; b=Vg1zZGpYnsDOEbz4lkVeXgbYtJTLMT5MMimBBwvwdWfU5DtxgNfvSebgdLSDVQb/r1ZxksrTxckpmtmkEY0PDbGW3Y+Ca+yEgSwbKqZw5Aey5kdaBITZ856JDN4ts+NYx2m1MI5qJbHPAEHxdBfPLTn3Iflt5PlYitV0lesOYzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847490; c=relaxed/simple;
	bh=Bl9N4NIOdfVqZOwR5kgJa0N0qb0p2zQM+IJ95fURflg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHHWqstTkc/ertTiZ7/sT4JEv6ZWHkqTjMfmWB6w3CZWmML4HlFrkAh+7iYzdswibA+150m/qxnpCt2q0DOBPoDSYi3QVzLzxk0dB5H/4dYjfiS3BUiXTUCHsHunKVQLJda9fU2iqbkP41nCAOy4ucZOKYpvIuvPejqi991fabM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T1PGb84t; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T1PGb84t"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so11397a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787847486; cv=none;
        d=google.com; s=arc-20260327;
        b=Gq108ebsvHnyrV97OaHnEktsTH69xdo8UeasnD5tsouV5inB4IzXkYFoedz2wIjVX8
         4c7pZ0bM3h0mpPQuPxnjI2Szz0oP8wW7AkvVX8voJZMXfXPk2YzcbNt9eS7Q4gJ190bZ
         +jtssHDsjhHYxx2iB6qoPuighdhdrTl+SR8+zMZb4uOfhGwOWdTrJGcFL8LWuvvm5NpA
         DRQCsw01RHb4R/ZN/wk1SKFNcV+gs30Uly+uNZpo2/FP+U72DUY2pHc9HzkT+R3pgsip
         XB6EhNiOj5q4e6WI+rkY/E8emwM864v13Nq0MF5Hhd55xcFGlx7kPUD+1etR5mSgZPQ3
         jn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m7ZkTNQPG4sK1dnK6dVjipvBVeIi19Kxu7dkafH7UEY=;
        fh=e+Girt6PoFPTCt1D9JqCmx6pL2ORx+haDuNatqJLn/o=;
        b=URxG6vN5K8detkCj2YeGclE5ZS5PW+TufQjpj3xl0T/J12baf/UpKxlgVwWh6FCXxU
         dtgZYsECnTR6KsephaH3+llqFido07SR9vq+wYIdS64K1M9RMSypSs0o9rORGFPEebM0
         IIvO39h0IW0McsEvagLvwuxppb5YZ/pUkDDujivAHmJuc2PRASff9+ZzZliJXkHaNw0m
         Bj7Vu6BoDVEzS2Lpeqtvp+0yDgy0FGPq70aB1Xh8xDqeesbFB0fR3gCZtKvjRrC5y3XG
         ScRBjdsyFPao+0jaNYMtQb3sjC8VQaIDmfAguLSdnf4/L9bw+MgBnztVz8vMnvMxa6cK
         3BnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787847486; x=1788452286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7ZkTNQPG4sK1dnK6dVjipvBVeIi19Kxu7dkafH7UEY=;
        b=T1PGb84tD/lPoa7sJkTASBWfDOmkgemFOcOS2aBxu3NmH0kkUQUJiK6JidqijvohMp
         WkNxQL6guXZivI/+MePZTrkNb1kLaSI3fOAwRX/1iDYKHccZm5RtnDDE5hJDqbzSNdWY
         dzz+0ChQmKrSUhc2V9kICw2/EuULs/DU5Qiitst7tMUiXrAZoauxIpkKQP+dIZIrEpCe
         GEvdvvbWQag9V8J3R+fCZKp8duINnvvvKBRvcWawZDNdRb10aIZ3Pa695LgpDlJooKSO
         ohT77MG0kef/KNOQcBMJEJDy9GKgT7K4W1MWK/Hyc+l3fx5XZuO7G5YvJidlZQyqZMW7
         Bv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787847486; x=1788452286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7ZkTNQPG4sK1dnK6dVjipvBVeIi19Kxu7dkafH7UEY=;
        b=ABxhENanINmutdQaTTqxE8w+FZT+9rq/j/kNA3sXcjHz11VqK8ytWq1a/8cmwWSHjc
         EcjcXdXqOJtMVe+k5HoJC3IFs3xayANz5WUecw4tJoNxLS/1rKSU9l1w79Nh0XRG1ZFs
         uX2xTRbmikhIFVBz3mKg9GSWLFk+KtIFBvLwaAEQhDItf1+SEq9MGg507v1T9fpS6M9i
         OrrMx6WwrxApml+7MiXQQlX8QGls9In3xoHb2s8KQnilWglwbNv7T98F/ojueVQTzf+w
         OvBlDL+ydkdokS2eTgUbsUhA4MpGAx5lyv/lvP4dclDZpTKv0dkMQWLE9oy1A97tgeVh
         ki8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqA2Ug2Bm/RwUTA9FsJcleAkm6NiaL6ysy/Lma3GQMhYMsr4ceKh9jLd1uGvpa3On7cmkk6N1fTs26B84Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mAcoQeOYTXrUdY1K8wO1tHRIMt2CCHCANpauDuKZBuPtlEDhhs
	ZYS3Z4hReEFJm9MBvl1pOuxOWhyJELdKfG8sPg8POYzkSUwzTom+92ZjBsjsNVC+tChNQTSSQSI
	cpfWgFH2kqOjtvK3XuREwNtx+vLhjQtzk6T8quutc
X-Gm-Gg: AR+sD11j2bGm6FF8B1c3vie386/7dH8pIC+4FNpeMPkSxtBol869bu2okHy9UfC8bhS
	YAZEkg+9wM28QR069dl2M9XFpMjgpf/LTfWJS2HDnwrDK63r5Jbj3NodE+HZbNFD2LpVnSTlD8C
	TUZQtjHgAkH8Pcyl/O14IQrIZ99MPMAUmyX8XbQLD/b2+ufA+O1GbMWWXNZwqOHXnEJf6Mej2Hj
	9M3Rxi8yWI2+4eIccAPKebzMOtJePvjwXlVfEjWdYkHeTz3yimSjj/CqM0AnZUQHi6tX2snIDOz
	h3pduo22v5h5JrmydpzJNJWXUdgxftdERnhD0D16zyTxmT/Co27w/2S94gsO2Lim3j3wpePVJuU
	ipw==
X-Received: by 2002:aa7:d514:0:b0:672:117e:55d4 with SMTP id
 4fb4d7f45d1cf-6a5f56fbb2amr67818a12.0.1787847485181; Thu, 27 Aug 2026
 09:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827145855.1616223-1-xiangzao@linux.alibaba.com>
 <20260827145855.1616223-2-xiangzao@linux.alibaba.com> <apBiJk_zhaNjW0er@google.com>
In-Reply-To: <apBiJk_zhaNjW0er@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Thu, 27 Aug 2026 17:17:53 +0100
X-Gm-Features: AcwNN1WR6tg9hLH542gIZv7DpP21v-yYeSwugCbSEAU1tVFSn-44FUNwUbQjGhs
Message-ID: <CAFgf54qF=nyLvyOPKB=aLmWJ=C40ZTXeNaBhsdFgnzT3jyLKEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu: Add __iommu_debug_unmap_phys() to drop refs by
 physical address
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: joro@8bytes.org, will@kernel.org, jgg@ziepe.ca, robin.murphy@arm.com, 
	baolu.lu@linux.intel.com, kevin.tian@intel.com, praan@google.com, 
	skhawaja@google.com, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 5:13=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> On Thu, Aug 27, 2026 at 10:58:54PM +0800, Yuanhe Shu wrote:
> > The IOMMU_DEBUG_PAGEALLOC sanitizer takes a reference on each page at
> > iommu_map() time, keyed by physical address, and the only way to drop
> > them is the IOVA based iommu_debug_unmap_begin()/end().  A path that
> > tears down a page table with mappings still installed has no IOVA to
> > unmap with, so add a physical address based counterpart of
> > __iommu_debug_map() for those paths, sharing the counting loop through
> > __iommu_debug_update_phys().
>
> But the IOVA can be calculated when walking the table from freeing
> context or am I missing something?
>

Ok I am missing that it might not be possible to call in the table
(iova_to_phys) while it is being freed.

> Thanks,
> Mostafa
>
> >
> > Export the iommu_debug_initialized static key, as the generic_pt format
> > code using these helpers can be built as a module.
> >
> > Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
> > ---
> > Build tested as built-in and as a module (AMD_IOMMU=3Dn,
> > CONFIG_IOMMU_PT_AMDV1=3Dm).
> >
> >  drivers/iommu/iommu-debug-pagealloc.c | 30 ++++++++++++++++++++++++---
> >  drivers/iommu/iommu-priv.h            | 24 +++++++++++++++++++++
> >  2 files changed, 51 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iomm=
u-debug-pagealloc.c
> > index 80164df5bab1..a2e55164e6a4 100644
> > --- a/drivers/iommu/iommu-debug-pagealloc.c
> > +++ b/drivers/iommu/iommu-debug-pagealloc.c
> > @@ -15,6 +15,8 @@
> >
> >  static bool needed;
> >  DEFINE_STATIC_KEY_FALSE(iommu_debug_initialized);
> > +/* The generic_pt format code using the key can be built as a module *=
/
> > +EXPORT_SYMBOL_GPL(iommu_debug_initialized);
> >
> >  struct iommu_debug_metadata {
> >       atomic_t ref;
> > @@ -96,7 +98,8 @@ void __iommu_debug_check_unmapped(const struct page *=
page, int numpages)
> >       }
> >  }
> >
> > -void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, =
size_t size)
> > +static void __iommu_debug_update_phys(struct iommu_domain *domain,
> > +                                   phys_addr_t phys, size_t size, bool=
 inc)
> >  {
> >       size_t off, end;
> >       size_t page_size =3D iommu_debug_page_size(domain);
> > @@ -104,9 +107,30 @@ void __iommu_debug_map(struct iommu_domain *domain=
, phys_addr_t phys, size_t siz
> >       if (WARN_ON(!phys || check_add_overflow(phys, size, &end)))
> >               return;
> >
> > -     for (off =3D 0 ; off < size ; off +=3D page_size)
> > -             iommu_debug_inc_page(phys + off);
> > +     for (off =3D 0 ; off < size ; off +=3D page_size) {
> > +             if (inc)
> > +                     iommu_debug_inc_page(phys + off);
> > +             else
> > +                     iommu_debug_dec_page(phys + off);
> > +     }
> > +}
> > +
> > +void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, =
size_t size)
> > +{
> > +     __iommu_debug_update_phys(domain, phys, size, true);
> > +}
> > +
> > +/*
> > + * Physical address counterpart of __iommu_debug_map(), for teardown p=
aths
> > + * that destroy mapped entries without an IOVA.  The OAs must have bee=
n
> > + * accounted by a prior iommu_map().
> > + */
> > +void __iommu_debug_unmap_phys(struct iommu_domain *domain, phys_addr_t=
 phys,
> > +                           size_t size)
> > +{
> > +     __iommu_debug_update_phys(domain, phys, size, false);
> >  }
> > +EXPORT_SYMBOL_GPL(__iommu_debug_unmap_phys);
> >
> >  static void __iommu_debug_update_iova(struct iommu_domain *domain,
> >                                     unsigned long iova, size_t size, bo=
ol inc)
> > diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
> > index aaffad5854fc..12528a40bcd8 100644
> > --- a/drivers/iommu/iommu-priv.h
> > +++ b/drivers/iommu/iommu-priv.h
> > @@ -71,11 +71,18 @@ int iommu_replace_device_pasid(struct iommu_domain =
*domain,
> >
> >  void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys,
> >                      size_t size);
> > +void __iommu_debug_unmap_phys(struct iommu_domain *domain, phys_addr_t=
 phys,
> > +                           size_t size);
> >  void __iommu_debug_unmap_begin(struct iommu_domain *domain,
> >                              unsigned long iova, size_t size);
> >  void __iommu_debug_unmap_end(struct iommu_domain *domain,
> >                            unsigned long iova, size_t size, size_t unma=
pped);
> >
> > +static inline bool iommu_debug_pagealloc_enabled(void)
> > +{
> > +     return static_branch_unlikely(&iommu_debug_initialized);
> > +}
> > +
> >  static inline void iommu_debug_map(struct iommu_domain *domain,
> >                                  phys_addr_t phys, size_t size)
> >  {
> > @@ -83,6 +90,13 @@ static inline void iommu_debug_map(struct iommu_doma=
in *domain,
> >               __iommu_debug_map(domain, phys, size);
> >  }
> >
> > +static inline void iommu_debug_unmap_phys(struct iommu_domain *domain,
> > +                                       phys_addr_t phys, size_t size)
> > +{
> > +     if (static_branch_unlikely(&iommu_debug_initialized))
> > +             __iommu_debug_unmap_phys(domain, phys, size);
> > +}
> > +
> >  static inline void iommu_debug_unmap_begin(struct iommu_domain *domain=
,
> >                                          unsigned long iova, size_t siz=
e)
> >  {
> > @@ -101,11 +115,21 @@ static inline void iommu_debug_unmap_end(struct i=
ommu_domain *domain,
> >  void iommu_debug_init(void);
> >
> >  #else
> > +static inline bool iommu_debug_pagealloc_enabled(void)
> > +{
> > +     return false;
> > +}
> > +
> >  static inline void iommu_debug_map(struct iommu_domain *domain,
> >                                  phys_addr_t phys, size_t size)
> >  {
> >  }
> >
> > +static inline void iommu_debug_unmap_phys(struct iommu_domain *domain,
> > +                                       phys_addr_t phys, size_t size)
> > +{
> > +}
> > +
> >  static inline void iommu_debug_unmap_begin(struct iommu_domain *domain=
,
> >                                          unsigned long iova, size_t siz=
e)
> >  {
> > --
> > 2.43.5
> >
