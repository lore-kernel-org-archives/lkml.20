Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8B53C3C06
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576930; cv=none; b=n1htu5gBwnDdTq0v7sTq+o9KID9XVYKkYJHlHpUE9BhvC3VRCOFgp/hlUhDjoN01Ne1jhzQzj94N/vGRWImYPMEyP8W1Ckb71M+lxmQ+lm2tuIb9GENt4zcaLsoC5O4KBWxFRTYT+5GTxbyl5hDxCBwkn++hANL0SmH8VtTrnuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576930; c=relaxed/simple;
	bh=m3KPpRq+cNgFaSPI3z9noRAscHUfVOmBnPDUVtycS8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dg8HCUixxkJ4zrIuFtD5564B7PZFRWJgggNrMn2PM7jgWPXDr1UDx9tqqFtzrlEas/6iWjX9TyiReelPYkdrq/sX+qSkWEHsnIEDFWSI7zcQcdbjOZRZJDQQ1cUlbpFDHMzyCT9DsfzTP60kZbNvG6iyfWnIbS54AMy1TZfq08g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3YEDA/s; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3YEDA/s"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2076487f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790576927; x=1791181727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mlTeCabh7BYu07oJry0uYVnPTkXCqqBZzgHeANLiL5M=;
        b=q3YEDA/s8miV/tQDWLeiw2qpDxUhHcd2UyG/WoNruGzydR+fzBfIhK2OSjuYISUIF6
         rhNHP2kwj/Ui93DejjrKJvhYcOso2I/Au/5Uw1Xa8gGDO5roBK+fneDEGCPsWANfQKgQ
         gvvNlWfdgiiYEX+qr2Lk2HBqffH92UiieAXc09chiXyDbxNzu26XzjQrw0VGXYQG4qLu
         JCci3KpkrX0vwMg2g2tZyXOP3Fm776nPBjqg+B0a62tHBg2TTFHqWfKuvAjlifZScemZ
         i7wmFxEcxD+nKXx6GxAIgyMv5pxwg0BzR3yJI+8duuKz98MclTIh23wafW+cGEk5XTZf
         Ye5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790576927; x=1791181727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlTeCabh7BYu07oJry0uYVnPTkXCqqBZzgHeANLiL5M=;
        b=di6+f4sX4jxSvPx27F7wO5CSSyEWmuJCU4HTSPXFqcD6t2bdZQxme5iqKMBjOCzsBN
         IpKC1pXvPHQ/duw8o29DCA2z9JhoZ4r98usBa8wnJMVj7GpY89Hm1HtlhzlHgeDVYae6
         mBXM2Ui0J/KQNRFYZe2msOwc/n43USVrQfp9Q7P8VcSbZkjN3C+1c2ws5xDe/bE22nvT
         znyB+rwutMpQFL6sbihgxuMFSyuu0gykvS0BtWrO5GC9zLXIuykkhB2xaxgur4hA2wL2
         2feW7ItVyvR2gYNH2ayp+gAA4VucKOJOtDatfseBETFpm7jPSempz2w0JdgqkHq4IB0Y
         qqwA==
X-Forwarded-Encrypted: i=1; AKwUvBzg3D/OnH3YZMATg7TkYKlV6NoiuYTS9Jp91x6PPJt+NR4mkjnNWTIzofF6/0P5WzmP6Q4U/z59w215tGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSWsl/xU951I+lkA6jd8o0019BCl80g6C4sgIaUl+/cgYz7ZSv
	GtNtiuO4LJ9F2F1OUeWtzwh602VMKHvIiG5UQydTbigb7IGLrB7DjdJQ
X-Gm-Gg: AYBFou3HQgtE2ASx0dHmpq3mPjJkAHzWgUFxL+OKAmLOlcb9W3Yw7OyBk26KvDoSG2t
	FTUl8Vw+ffoPDb5wFq2BdiGMVDRlxxQ7RvaT4lU27/l3Nc9yXvDK/DgErf73KBI5ZlD/e8Qfr1R
	GM+NuVRaVhVr+ElmyRjlVD2Qx/nfJwUO1pTdwwL6lrN/80LMf9pb4RFDTrAKzJxBTZYNgBO2v34
	+JiZ7tw/iDSaWfJQuYMmqd2v8dF4b9OTW+VivG8d5r8jobOwSDZP8wne55G7aAAFGpv+pAnvUOC
	+wYARxJ3fAzOMP9MJ/jnRmLSrykAjzS4TDAcVsmH6VN/ORgb9hDfs2sgspZShzyligmrVYQjDSB
	iRghMV3tr6w+fQ/fv3qWKAfUi9bPJUBTzosIb+a0abWBWQI1QFMRfxv8spzCs/IMJMgYuVlaWV9
	Edg76u6v9ZCqXS/Sif016qJIwhmxruy5OJtetm+VcrJperXA57rO5ueNALnh2Wpdvsv9bsEMv3u
	PIODpAmJxzby6yXqUQKmHV+vVBjx0gYFnKX+CnQGJ3jkuIaP3DGpXsbNqYcLkGvMWvRk9eKqYHn
	f58gs9hp6M9rdaI9gbTY5YmQfejLUeU9KPtDjUy/SpybnSZQB3rI0cKnKcvm+gNiC/5XV1AV6Fg
	hus8=
X-Received: by 2002:a05:6000:4908:b0:487:2805:6834 with SMTP id ffacd0b85a97d-48872ac763amr22046956f8f.42.1790576927074;
        Sun, 27 Sep 2026 23:28:47 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-acba-a601-4494-3582-465b-0eab.310.pool.telefonica.de. [2a02:3100:acba:a601:4494:3582:465b:eab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ef3asm25338956f8f.30.2026.09.27.23.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:28:46 -0700 (PDT)
Date: Mon, 28 Sep 2026 08:28:43 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Zhao Li <enderaoelyther@gmail.com>, 
	Jinmeng Zhou <zhoujinmeng@bytedance.com>, Alex Shi <alexs@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hongxiang Lou <louhongxiang@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, Naoya Horiguchi <nao.horiguchi@gmail.com>, fvdl@google.com, 
	jthoughton@google.com, rientjes@google.com, vannapurve@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mm: hugetlb: Fix subpool usage leak on allocation
 failure
Message-ID: <aroH94a5F4Mzuqgd@gmail.com>
References: <20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com>
 <20260916-hugetlb-subpool-always-track-used-v3-3-38aae9b5ccdd@google.com>
 <20260927170426.2467-1-kmehltretter@gmail.com>
 <CAEvNRgHQLifmcD1NO6cd7EVcCiQb6gJgNUo4HkFhZAvzuwMq0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEvNRgHQLifmcD1NO6cd7EVcCiQb6gJgNUo4HkFhZAvzuwMq0w@mail.gmail.com>

On Sun, Sep 27, 2026 at 10:19:08PM +0100, Ackerley Tng wrote:
> == Questions for Karl
> 
> (Independent of the "Path forward for 7.3/7.4")
> 
> 1. Does squashing patch [4/4] of this series into [2/4] [3/4] resolve
>    any of what you found?
> 2. Does patch [1/4] introduce new issues, or does it just not fully fix
>    all the issues? At this point I think we have so many bugs, it's more
>    about fixing bugs progressively (not regressing) than finding a
>    complete fix.
> 3. Would it be ok if you integrate your findings across your two replies
>    on [2/4] and [3/4]? They're similar yet slightly different so it's
>    kind of confusing. If you have reproducers, it would help to share
>    them! :)
> 

1. Squashing the unchanged patches does not fix it. Full v3 already includes
4/4, and both controlled tests still fail:

  Path                     Cleanup       After files / after unmount
  -----------------------  ------------  ---------------------------
  hugetlb_reserve_pages()  +2, -ENOMEM   2 / ULONG_MAX-1
  alloc_hugetlb_folio()    +1, -ENOMEM   3 / ULONG_MAX

Both should end at 4 / 0. I got the same result with one and four vCPUs.

Patch 4 fixes the later region_add() failure path, where the global
reservations have already been acquired. These two failures happen earlier,
after global accounting or folio allocation has failed, so 4/4 does not
cover them.

2. The exact v3 patch 1 does introduce regressions as an intermediate
commit. It starts tracking used_hpages on min_size-only mounts, but the old
failure paths do not undo the new charge. In the ordinary tests, with or
without the two queued fixes below it:

  - after the SIGBUS test with no files, HugePages_Rsvd is 0 instead of 2;
  - after the failed mmap and unmount, it is 3 instead of 0.

This does not mean always tracking used_hpages is wrong, but 1/4 is not safe
on its own. A reworked series on top of Zhao's and Jinmeng's fixes will need
new testing.

3. In both races, hugepage_subpool_get_pages() first changes the local
subpool state. The later global charge or folio allocation fails. Another
operation then releases capacity and a separate mount consumes it before
rollback. Rollback restores the local minimum, but its positive global
correction fails with -ENOMEM and the error is ignored.

I put the exact test hooks, both userspace controllers, QEMU helpers and
validators in this test-only commit:

  https://github.com/kmehltretter82/linux/commit/3ed79d756dc3845b9af9dc1dec3daa8cb141a500

I support merging Zhao's max-only fix and Jinmeng's combined min/max fix
now. They are useful, narrower improvements and do not try to cover these
min-only races.

Karl
