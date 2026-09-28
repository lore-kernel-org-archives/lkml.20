Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816EF352F95
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573175; cv=pass; b=mfcvljJmZfda5ZPr3lX1skj9gr2lNVqLJVXsQ5EwD5s2itbDa+Fy2eZkAVPDul51mZS8EGUfHOBbP1MXJZITrEBqcEgwzxgaGU1/FUwD8bg37cLWFxyqHMZFfNiUWY16rskg4tqm0dwGR+x4YZRwFdz9zwe4Ah2OaPN8e0JYBvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573175; c=relaxed/simple;
	bh=ulKfwKoh5ZniJSXC97YGKCyDolFa0F2AklKeKJ+3iYI=;
	h=From:In-Reply-To:MIME-Version:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=sc+GpJmZfK+msB5J6NL23NIohTHO/PjEHTSOBeLj/Q6j+4eHSYYhJ6Nl+s1VzPtdL9HLqZJGDSMfAOnXWE6eEBZYhv/wfEzLd9/iSjhcYyb0WAjSEq67kmF5zbuRbkC8W7XkVSv1VRxcVmT6VwTnCsHcfx0JA+B64wIxQ9XzXJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rGylari8; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rGylari8"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-53320dc09fcso12718761cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790573173; cv=none;
        d=google.com; s=arc-20260327;
        b=Uu53dO26Zsbr6Qsc236xkcat9EGXNuztt/hO4aiC45sdyTFQFONAAhLqy28FwwjZQk
         6fHyDXF5hj1PeDQQjCl99oOfc48bqRAGI4W4YJAxe+ETsut0jmt9Td3EJuaKuZWt1yLv
         K4XfSJzY3Ex3Vlz9psZFUme8oVqZ7wCmGyofQF6tM4fNrzGR1pEK3jcAdr10fdxibiSh
         kOywsq6OG0IJU4DH2HvETqGlKEzPqhoSUVopddc8+wcVe5EFkqPzZf88gxMGvcmS8BTt
         q+599vXgGJh6irTLOL9sZpArl5jSuR7nH3Zw22/r8fnzS6bldTcwe4s6GSi+BNpXiVCq
         04UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:from
         :dkim-signature;
        bh=9uhJQMU9Md0aI6D1ejMKihBiU/dixd7kNMrT0BD86Fg=;
        fh=VvDdjU1dwJ5lk1gXRjE+f/G8iCsI4NroUAlZ8AFADoc=;
        b=nmTCsN94woNyvE5BSbreYa6/BDSugCUuMVAJWjmkZIXfjcrwUG+IQ+DIcj5vo3WSks
         k6Ei8ogxrHGVg5b9RqAhdt8T2uCESVDu+s3N2Gdx1noPTk3fAq6a2wlwarBTO8N6nU+r
         do4HfNVirkd1lJsNhp2KwmNhLcmIB/z7V49HX9GHTEWBvk3w29LoJX91IgTwDT4uoLDq
         5OIvN2GnlKqJTV9AcvW83I2msgNH40hZwP6sXRL/0TARPgusgzw4443Jp5vVwwOdL0gx
         /wt6hgufS7ZwnJr1GQsF1eI1yzucwor7/4R3xXCdNQA6C6Vc7GLUJsUeQM2k9bQ8gVON
         NKYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790573173; x=1791177973; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9uhJQMU9Md0aI6D1ejMKihBiU/dixd7kNMrT0BD86Fg=;
        b=rGylari8NB9WHgBT/7ONM8TF/2z9mTbaMDKA2DM3GQfzAK/YkLj/MyzDdpwlfb270K
         kPdfVmtBFtKobZ0xW6nn329thwv2KIL0A4tBPk14ATd2im4jGqNenAuIXvdsBB4jnTAH
         Iqks0jAUJ2oPMJOe92YtMPxhuDBOoqTQifVIOEh9ycXTr/A8f0ely+OXA6K0IREj4B5E
         M4v+m7dGmAY5kJCeIY5r4z8u3lkdANX5o+WROKFPqXvpeQVlOf/8XBdl4leQj6z+3RdS
         n7sn0k7p8LYGkrqgBqkWHH8PtwxOrLvH2bOMc6CoDZ2AYSA40gtmEUdAEKEflQMAo/Lm
         Vwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790573173; x=1791177973;
        h=content-type:cc:to:subject:message-id:date:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9uhJQMU9Md0aI6D1ejMKihBiU/dixd7kNMrT0BD86Fg=;
        b=lTbTdeHPXkFpUkmWaUYTq0cT9Jb9UHmmPxvDuaUIFRYHLp2+O+lJ+ID2WlOBEzEO4l
         LL2y3kkAz+zkDyWLI8nDiiXzL0a0wMEHvQb19UO6R6eBFoNBhgqlfKh1FblVp7BKbs7D
         rJF3cujCnun7tB22Kfx1tzrRuin2GeDGRWZA3oRpZ1uZcL+iCNXpV3stwH/ycTxHwzGz
         z7i/cK3x1XGqG+Nu6c0NYtTmcPOU2IR8AF+LkS3Ei6w/qo1o1WGuMU+05f/UgDmVajnV
         HeoyLgkw8wWZm/lNOpumFBTTsKjAQj8sVpy+FjVV29QgI5oZ4jsXYDvYMXJhHTTTJj2V
         c7Lw==
X-Forwarded-Encrypted: i=1; AKwUvByrUFWFCAqoq+yCxJGzDqsbrNRGYV6eOmfqaRDOfD8vtc8hoYxSALIpWdMEuJ8rri51rvVu5fgYTdoWl8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQVvvjX/+hTgyysSO1HKYfI/yzBNKX0iyPlO7kMa+hhdoAe9Ts
	qVTTyajW8XYhNaxqN8sTYZA2ZtbooybhLXX8t5toFZpMR7fqusJtLmzOyJLw9oiqsDJ7ZOLZTAn
	lVOkQ0ScH2YssmJ01jPk+gxinLT0osFXTtnuzGiHE
X-Gm-Gg: AYBFou2vWMJ+/WPZFzNjSJ/bTNKzAJq8LhUC/2Sw5OzfjD4OdajlXwqxYb5CdIB/DBL
	s5JFOSqFJ1TuX/q4ccDMk7PjCXhN13w8b8mQ8Y/SVZC4mwyo6W6O0BOcSb4eLY6eNLOMI17f3hw
	A2Nw2Qc3pWAqyrESrG37qQ0rV51Btc6bXfrTFZLxrHIWpw8Y01p0rJYLCe6b/1669I8HvsbBKFN
	8CfAOuVBvydeQ+JEFkL6Yk9Ziqwo5OL6hMUfJB9+RcrE53AqfNerphgcWJKvFSj1othBGLTgu50
	Al9LFGSQ3aZXrrfKfMwNbpCSpQhNXO93ZBcGH0EM+4z7dDUD4WbX7JKdccYVGtu8g3AobjlOE9q
	VQ6q3zS6ITg==
X-Received: by 2002:a05:6214:27c1:b0:90e:8dcc:4e5 with SMTP id
 6a1803df08f44-9142f919107mr186704706d6.28.1790573172597; Sun, 27 Sep 2026
 22:26:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Sep 2026 22:26:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Sep 2026 22:26:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260428113037.88766-2-enderaoelyther@gmail.com> (message from
 Zhao Li on Tue, 28 Apr 2026 19:30:38 +0800)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 27 Sep 2026 22:26:11 -0700
X-Gm-Features: AclHuK8teF1_hnBMYASoAggcWTeG1bGk-jNppBGAEy7BhwDUpekXIrCo_Z7K6QQ
Message-ID: <CAEvNRgEh9_cMQmiNLXumFLt7JtFy0VNNCNB=1mY71bz9JzUxtQ@mail.gmail.com>
Subject: Re: [PATCH v3] mm/hugetlb: fix max-only subpool accounting on
 alloc_hugetlb_folio failure
To: Zhao Li <enderaoelyther@gmail.com>
Cc: akpm@linux-foundation.org, mawupeng1@huawei.com, muchun.song@linux.dev, 
	osalvador@suse.de, david@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Karl Mehltretter <kmehltretter@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Zhao Li <enderaoelyther@gmail.com> writes:

> alloc_hugetlb_folio() calls hugepage_subpool_get_pages() when map_chg
> is set.  For a subpool with max_hpages != -1, that bumps used_hpages
> regardless of whether it returns gbl_chg = 0 (rsv slot consumed) or
> gbl_chg > 0 (used_hpages slot only).  If the allocation later fails
> before a folio is returned, the unwind must undo the used_hpages
> bump.  The old cleanup only ran for !gbl_chg, leaking used_hpages on
> the gbl_chg > 0 path.
>
> For gbl_chg > 0 on max-only subpools (max_hpages != -1, min_hpages
> == -1), hugepage_subpool_get_pages() took only a speculative
> used_hpages slot.  Drop that slot directly under spool->lock.  In
> that configuration hugepage_subpool_put_pages() cannot restore
> rsv_hpages, so the direct decrement is the exact inverse and is
> race-free against concurrent puts.  This matches the used_hpages-only
> part of hugetlb_reserve_pages()'s out_put_pages cleanup, but
> restricts it to the max-only case where no rsv_hpages restoration is
> possible.
>
> Mounts with min_hpages != -1 are left unchanged for now.  v2's
> approach (hugepage_subpool_put_pages() + h->resv_huge_pages++ to
> back a restored rsv_hpages slot) double-counts global backing under
> concurrent free_huge_folio() and creates phantom reservations under
> concurrent hugetlb_unreserve_pages().  Safe cleanup of that quadrant
> needs a coordinated fix across multiple call sites.
>
> Reproduced on size=20M hugetlbfs with the faulting task in a hugetlb
> cgroup whose limit is exceeded.  Vanilla leaks 6/8 hugepages of
> subpool quota; this patch leaks 0/8.  Verified under QEMU.
>
> Fixes: a833a693a490 ("mm: hugetlb: fix incorrect fallback for subpool")
> Cc: stable@vger.kernel.org # v6.15+
> Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
> ---
> Changes in v3:
> - Replace v2's hugepage_subpool_put_pages() + h->resv_huge_pages++ on
>   the gbl_chg > 0 branch with a direct used_hpages-- under spool->lock.
> - Restrict the cleanup to (max_hpages != -1, min_hpages == -1) where
>   the direct decrement is the exact inverse of the speculative bump.
>
> Changes in v2:
> - Skip the gbl_chg > 0 cleanup when max_hpages is unset.
> - Add hugepage_subpool_put_pages() + h->resv_huge_pages++ on the
>   gbl_chg > 0 branch.
>
>  mm/hugetlb.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index f24bf49be047e..cfdeaf6394c5b 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3025,13 +3025,24 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>  		hugetlb_cgroup_uncharge_cgroup_rsvd(idx, pages_per_huge_page(h),
>  						    h_cg);
>  out_subpool_put:
> -	/*
> -	 * put page to subpool iff the quota of subpool's rsv_hpages is used
> -	 * during hugepage_subpool_get_pages.
> -	 */
> -	if (map_chg && !gbl_chg) {
> -		gbl_reserve = hugepage_subpool_put_pages(spool, 1);
> -		hugetlb_acct_memory(h, -gbl_reserve);
> +	if (map_chg) {
> +		if (!gbl_chg) {
> +			/* Full inverse when subpool_get_pages() consumed rsv_hpages. */
> +			gbl_reserve = hugepage_subpool_put_pages(spool, 1);
> +			hugetlb_acct_memory(h, -gbl_reserve);
> +		} else if (gbl_chg > 0 && spool && spool->min_hpages == -1 &&
> +			   spool->max_hpages != -1) {
> +			unsigned long flags;
> +
> +			/*
> +			 * For max-only subpools, subpool_get_pages() took only a
> +			 * speculative used_hpages slot. Drop that slot directly.
> +			 */
> +			spin_lock_irqsave(&spool->lock, flags);
> +			if (spool->used_hpages > 0)
> +				spool->used_hpages--;
> +			unlock_or_release_subpool(spool, flags);
> +		}
>  	}
>
>
> --
> 2.50.1 (Apple Git-155)

This fixes out_subpool_put in alloc_hugetlb_folio() on a mount that
specifies max_size only, and does not introduce any further bugs AFAICT.

Tested-by: Ackerley Tng <ackerleytng@google.com>

Further details at [1].

[1] https://lore.kernel.org/all/CAEvNRgHQLifmcD1NO6cd7EVcCiQb6gJgNUo4HkFhZAvzuwMq0w@mail.gmail.com/
