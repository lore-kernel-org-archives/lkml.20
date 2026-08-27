Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C804499F0B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851340; cv=pass; b=nrL6xh996qGc/a17nHXikh8yqLa6ZGCYFUN93NJe193SDy2dt7fh+PIVr3Mt/UQXciX1NvLL2IeKqaoWPHIt8EFabkLDuvVeqwIfD1wEa9gZHCcVEux5O1qDmpXn0ck/HYaj6Cb58HxaTTQWA+xTQxf8LvKlqcFabUEBGUOzrAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851340; c=relaxed/simple;
	bh=8bd2Y797uynTFPXBQtKo4OLxQ13DQqaAlC1NDt3Dco8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RK8UqNL8Qw9RbyEGXllSiZynW6PJUqe1q2LaF9CO+k1ACVSEIgu4DjYBMv7JooO9SXNiuWQVki9MaZqMfI5Zi+KbsY2N0oRMzBEs3XQKuAZ3GV7dqQ5Xp+sg0XCMgs0amnvuk72CBKDQTo+eM1Nl4KFX96IyILite5e0x8ZOS3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EO/d++Ue; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EO/d++Ue"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so23922a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851337; cv=none;
        d=google.com; s=arc-20260327;
        b=C4DfVot/tOtf9eD885DrLtstVvjbl1PvmjTTKowo5lq9HheZidGVPhejclcDwH7Yqd
         wRdBSuYdZQZP5rW9+ECiRTOd+4M70A8k635UXqw6OF0MiSeWEyZFvjynEAWIUyd9up5K
         PIoIb47R2qfLrwlP3tgxJHPUErXiVAMRE3ISO09+oDDGG3RRNgLoHaflZzT+kEekHTaW
         xU+QPuw9a/cTBXjiobsCjxaoxxha/WO5/IHgnvb3ZcqnIUBvrk5mfDvtMUMpyROdS+Hm
         XmjtA4JF67wuttOQD8YFHIuvp7fR0TZoaLBgnLJtUU+SM/ZcSrUvlEA5ynm97mYUoXrn
         gl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tltuI5yMhdPmNzhZrv3APrkDegnN9eE8RZrbuDy3HtE=;
        fh=8OT3HhMhpVTdKOVj6Yo6wNbTa+xu9VBrDB//hM/t3Ac=;
        b=j2mmko9cXNL5inp5TgkqGU/aPhkC/ATHqGcvjKxwaJBsN8gHe5wnCWT0b7EZZs/sux
         xBpJHG7GBsgAp1L0Frts0B9zPiRdRSEiY9ZYuxZv47k4T+SE5DAlIdybAExPWZBOxPcX
         R53oObPVWkyLnm1gSYq0q75pDOYAjg7bt3qpGpOeAnbcMVdu3bhfXhB9s17zkJIa1ue7
         5H/Q3E5+zFDgbF58WxEe7JT5PIJQOPAwM5Pt7u3J8+92PzThAPLtep594rqRPJ8Rzgb4
         7SSIMtpENAAV3JcBThrvF1oBXKGZvKPlOP5s7YMWMDsI0++iz1s+G+PgCLhlwjj2c7xd
         Ex5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851337; x=1788456137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tltuI5yMhdPmNzhZrv3APrkDegnN9eE8RZrbuDy3HtE=;
        b=EO/d++UeJXZ6t7A17VU5mCqXCR7xPZ4pC06ZppwoYxIXs8e6OIud97B8B362IpA2EU
         bTr+4lg1kIEEzR+kubXy59184pTJlr22DKEVl1AyXh5o87gmUEiJJdtRku4TGe9Sli4x
         SgAampJwHkewmRrlud5l5/jldqYiKR8npysZpWXzn2Gv/RERPXZf0SqaeNk1gGViUoZW
         efBhoPrh0/RJtesHrrDBP8LfRLkkaZu98++thmu9mHXd7uP5o62pyUuwqbOhBUwMbB2s
         b2w/OIKe5sqEliVcDqqvFfE4k3fKTRYk+z2ZxJZ2+pWloGGSDs8i5e1MsEdI0iKjUkit
         Rp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851337; x=1788456137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tltuI5yMhdPmNzhZrv3APrkDegnN9eE8RZrbuDy3HtE=;
        b=nxKtk1ma3gP6vwHf3uKIbZngYTExX6cKf6ubilikztWgETMkEpLh7oj7lMH+e+nZZ2
         dezZ8WdhTGJnpUYCwf5M0DCTLYSBEnl3kCQw2F8Vc9PQ/nCQHVDCp+lfTzCVwCxRh20l
         lvZI7cyYoZ7XykG9ZbysUXZ2TPAeSAIxxJ5A8F+VvTzfGh8+/UePPVPuypkVwPqhLOPc
         hU0Afv3OqPbErdmwYUmnhGQH+DPqxROP+5MEsVBIvWLzj/8K5zgG6QVf125LSun++IM4
         WVB37aWS0WP4IFGqdBSi86mezZDcsfuuix14AC/OTAX/v5eCLC71A42oQRACYd8jo0i3
         WGRw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7wHuzRaJhj0QcwwsmKL+FyVdoHUr9ZvTrtifTUfBPuiVcqxkyolBxwgCTL1wRNvq1A8nGVW6STQuyP/k=@vger.kernel.org
X-Gm-Message-State: AFuF++nmPZxqq1O9ZWt+ahMJ05jCxc8IcPQQyMVOY9pozRflTWAP+szb
	2CMMPlJotG22Op2oiLvnYXfBWUMU6HSdT70cRxZs4ldW30Z2yFtSA6NrfOYzlXEcSVTiBkZ9LuF
	uunSVhcp2gdNUFiCOUkLruVn9NC2zEso=
X-Gm-Gg: AR+sD1348rwbKe86wulVJvTIX+T1LfdnzwL2KRv2dZIbTOzrkMO0dhtZq3cyyghEWj/
	6bT6U0fvLQl6uekyu/gvdzpQXQFftQyhIEPnEvqDTy4egAwSuEeHXYwgEaMnPM61KZfYkqQgFBA
	RR5D9RTo6KVNTbEBjOVqJpvIb7isxGwrXTOl5Fen6hGsW7QByFXpA3UGmILZDd3eKsB8ugDxYCy
	dhxTDx60kPO8IL/1wl2yg5foZPWc/Ili+qPMYfnkNarRFwEJyJ1cwRay6BjnSKdnjyDSl4dMUnj
	rgx8FkSGHO8ul6tvqqClgWZ2KGBJ0v58J4q64URrQ4kXCfQQp3+sWxVfZyNS0sksb0Fy9R/Gyhc
	H
X-Received: by 2002:a05:6402:23c3:b0:6a5:f4f4:5c0e with SMTP id
 4fb4d7f45d1cf-6a5f4f45ca1mr5745899a12.14.1787851336822; Thu, 27 Aug 2026
 10:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-5-9b43f5163238@tencent.com> <apBQqJZ89MHZi2RJ@thinkstation>
 <c796694d-7783-4f99-9ce2-331e1c551415@kernel.org>
In-Reply-To: <c796694d-7783-4f99-9ce2-331e1c551415@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 28 Aug 2026 01:21:40 +0800
X-Gm-Features: AcwNN1XqqM0BAQHr_O9sXhmt_pq-8O_uB9N2siAFg-mlZCN69ElipsNI9_k2JTA
Message-ID: <CAMgjq7CnErLhEE1RSaY=-CdK6WErNedycCD3eRBn_o3edVrO=A@mail.gmail.com>
Subject: Re: [PATCH v3 05/18] mm/huge_memory: rename __split_unmapped_folio()
 to __split_frozen_folio()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kirill@shutemov.name>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 12:22=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/27/26 17:06, Kiryl Shutsemau wrote:
> > On Fri, Aug 21, 2026 at 02:55:18AM +0800, Kairui Song via B4 Relay wrot=
e:
> >> From: Kairui Song <kasong@tencent.com>
> >>
> >> The helper splits a folio whose refcount is frozen: the frozen refcoun=
t
> >> is the state it relies on, while unmapping is arranged by the caller
> >> beforehand. The old name caused confusion and people may try to call t=
he
> >> helper on non-frozen folios.
> >>
> >> Suggested-by: Zi Yan <ziy@nvidia.com>
> >> Reviewed-by: Zi Yan <ziy@nvidia.com>
> >> Signed-off-by: Kairui Song <kasong@tencent.com>
> >
> > This patch is fine:
> >
> > Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> >
> >> @@ -3989,8 +3989,8 @@ static int __folio_freeze_split_unmapped_anon(st=
ruct folio *folio, unsigned int
> >>      if (do_lru)
> >>              lruvec =3D folio_lruvec_lock(folio);
> >>
> >> -    ret =3D __split_unmapped_folio(folio, new_order, split_at, NULL,
> >> -                                 NULL, split_type);
> >> +    ret =3D __split_frozen_folio(folio, new_order, split_at, NULL,
> >> +                               NULL, split_type);
> >>
> >>      /*
> >>       * Unfreeze the post-split folios and put them back to the right
> >> @@ -4053,8 +4053,8 @@ static int __folio_freeze_split_unmapped_file(st=
ruct folio *folio, unsigned int
> >>      if (do_lru)
> >>              lruvec =3D folio_lruvec_lock(folio);
> >>
> >> -    ret =3D __split_unmapped_folio(folio, new_order, split_at, xas,
> >> -                                 mapping, split_type);
> >> +    ret =3D __split_frozen_folio(folio, new_order, split_at, xas,
> >> +                               mapping, split_type);
> >>
> >>      /*
> >>       * Unfreeze after-split folios and put them back to the right
> >
> > But now you have *unmapped_anon/file() call *frozen_folio().
> >
> > Given that you introduced *unmapped_anon/file() in the previous patch,
> > why not give them the right names from the start?
> >
>
> +1
>
> And just for completeness:  we cannot possibly freeze a mapped folio. So =
frozen
> implies unmapped.
>
> So the function can possibly just be called
>
>         __folio_freeze_split_file
>
> And we can can add a
>
>         VM_WARN_ON_ONCE(folio_mapped(folio));
>
> to self-document the expectation in the code.
>

Right, I'll just squash this into the previous commit then?
