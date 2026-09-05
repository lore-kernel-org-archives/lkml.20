Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39AA2931E5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 17:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788629523; cv=pass; b=FW//AwRJLds3WUOWxM5txRoXuW0n0A+3WS+iMlznm2tBSxnzqIUCAeHFUN+qgxuMfXDOetW5ug/RaAkVgnHq/1O0jVrUqPmsRIBv7HI8SW0+jlIy17bhCQMMqCb0lqSAkqT7yVhKujhFlsCBA2b0UocC2+m5Len5HQCVLlbBeiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788629523; c=relaxed/simple;
	bh=6SqWxQUNqkycziFg1GQ7wJboenSDKgNq2op/2w7iabM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o55cOocOp1XLT6KZx5worTPbZRz8Oij4j34rR1IO6LI/T7eoJ8ekDEWh3wyCAiXU3hwYmViDWPRE0/1IlrkFg1sgjqTHbv2jg23FhmDeUzNc8fmXb44TF2qk1fR6w4ZcO1GrSsCR9AvVeOWoox1ApCw3c5Ve9rnqx6jJLKXr5e4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drax72qJ; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drax72qJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c20e70a0962so262763066b.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 10:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788629520; cv=none;
        d=google.com; s=arc-20260327;
        b=D2GGEYC1B6p2kMydSr+bzLXdrROZZwjKKwiGXbCZcypP50yX8FB51jT98wWXokpigR
         AVMAz2ioF2kbGDaFK4CdP51EenxnBADQPNa9PIAE4kyE4Tl/OY8O2T3QrzDuso1J2G2n
         UOPNGMW+l6sR1nSo02BrAOuUoANqPhHkBQ+7NO6GUQ1sqYgZ/r9vlS9wQOqwuFaf0ZPo
         /QrcLnezcm+bxNfFXIc+LCoASSWM7xxZsUsdNjuxA1+/abEAI7tPN+eikY5J2dSKZjuq
         xk2jxuWen7bhJY/efkZvyXngxHGmdlipcfMk2b8Sdp0W7MTw59MJhFsvKQQrXeCMof/Z
         yb/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JOW8XuwLJiAY2FOtXpU6W0erUZewcmKtXhsLrPUNiVE=;
        fh=Z7HvH3I2GjJi5DCz7UwXkTanVCB1tfwvx129Unk1f78=;
        b=DRDy5k48eAVYLGwRcg4dK/qUYp+0trmJme20Zt7mf+rTtLLZ+pXTNxUPcOrRx73D8o
         llENc6+yfT11Vuv3N3tO46gzm7gyNfzMIucnmw2hs8ubSz74YZAWLopoZRILMldhjPGV
         DDb1pUX5ep28BRrwPH/URYhLGKFb7ycLc0eoQPOKsf076k98y8i66iVWtcQ833y/ugno
         rAqpwf6/PbEWYSDBPzH+pv7Zdh1LJ9TpMT8TzmaHb7j0xnI3HWNvSKWk3doMIko1KE7B
         eK1B+qRk8u6YNZvu94bZ3bA2v6cghc9yYXRwYdZDNELqgAwa4RePdG189RZY/c/kjn/3
         3G+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788629520; x=1789234320; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOW8XuwLJiAY2FOtXpU6W0erUZewcmKtXhsLrPUNiVE=;
        b=drax72qJDld6goBKj+BAhYBiU++KNynPrfyhQH0fjgI+VHEaGX9fwmzK8cyG3xTsLJ
         lWVUmEVg5I5N1tq7rWFmBAHP9tLHXO4n+pQCIV87/ASCr8xrEQDqvvRTVYkPBgnGuM2B
         Rccdu/5lIIdipKPBH038dGgpqI44AVo4aTQ7gIOMoo9mNJyQJM4RC55f6oNlUYKr2Zkv
         Yu9Kpzapct8mdb6IcWk/wNoPjMu8pAy1awe4Zuc41O52kI6zlItDlwIPZRdzazbB4dvT
         I38cbuHVHHpCu4hWbIciTT2TUUyznFB1dXHJuuppt3vJg2LOjrf1EaxQ0FFHP3vnnG6y
         hy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788629520; x=1789234320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JOW8XuwLJiAY2FOtXpU6W0erUZewcmKtXhsLrPUNiVE=;
        b=OaLL6n1aXRosMHY2QgBwMVe44IZy/AQllFgnSh7rthol93teuRFyuoAP0IcpmKIAI6
         Ypt1YmIYg2Ao39lonGAoWlAuGP28RZDiadH0sYb37kB/BFyEb3fghugIwOXnFBurRsq9
         1s+waDWBhPt2cqlIkchz8wEv4cW3YY+W2MvCc58sVRvrDRn0xn6BXNkw2cmfPoaQbWFk
         QfFh8OhtYPai2EhOr5clyS+oM194i9P1Ic2nVaxDTNRFUkLZx5Smg65FzDKLiqPm0AKe
         +LW2aUHrrKrpH2sG84HqPVyOX83emoOhrjdGGQl0pmmH43MV3rBz9TYSVlgPlzac7O9V
         FEnw==
X-Forwarded-Encrypted: i=1; AKwUvBxCfUhMfwbsYEjiPIIGI8zpJ3zL7QLXbAsWY0lANmSQQJd35ie/T7PnjX/gR1bwhU8/7sgTVP73uBm6D+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kcpxzz+5XrJYauzIkZ8go/AuzN8jOY3+E0QX1KWsOGBI/Oq0Vt
	5D3b/Zlm4mdW4USYWPQOEjUeuPqw2TKfY1fJivZiBKEK51OPbUCmv3Vn44O9Do2+5JY5QY5m0+X
	q361ja42xsSSjax8ItBKywsZA0vO0pu4=
X-Gm-Gg: AYBFou3qyovtbnkINc/SwsRu7WTGbLoYqpFDQlCnl2ii1U26aJpmfJhSK5M43icjfiH
	iqYij0UyWYK6tgnDEI2iczdySgQ8eHjsvmQ0Hwc5vyHsmqCbObhQcnB8HllJmTaULX/2/iDU14l
	FB0UBZ8hsLVrcd19FK+/Oc1Nk6oB5eRwrwlZDeeLe2p764H8jPilfI3QRyh5BA19PBGq9/c9lx2
	DsoCr8t6nu3YiZhvJ+0oSmeCgmQc/zTBaqenCrNWqljm3Akr1223NB/WEjjEHHF3MQWxYI2wlmu
	UY7O/sDWeMpNgeTtb6vKec9DTKJDEQS/qDpPAJ+BFCBrUT1JZwP4BrDiE4YKe1rLvKMDoEjkUrS
	PXUk=
X-Received: by 2002:a17:907:c16:b0:c25:2d27:5652 with SMTP id
 a640c23a62f3a-c260c9d1affmr910733066b.11.1788629519742; Sat, 05 Sep 2026
 10:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-mglru-flags-cleanup-v6-0-9aacbd77d4ca@tencent.com> <20260906-mglru-flags-cleanup-v6-2-9aacbd77d4ca@tencent.com>
In-Reply-To: <20260906-mglru-flags-cleanup-v6-2-9aacbd77d4ca@tencent.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 6 Sep 2026 01:31:22 +0800
X-Gm-Features: AcwNN1W6XiAA7KV5jUk181yU-Mg2q-AQY3I1lcI5rPzfroqnvUHhwkCK3HoP1Y0
Message-ID: <CAMgjq7DTmBQU4D95J2ur2CUYPohx1ychRV=vKvLjR78tNFJwOg@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] mm/mglru: introduce helpers for manipulating gen
 and refs flags
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Ridong Chen <ridong.chen@linux.dev>, Lian Wang <lianux.mm@gmail.com>, Yu Zhao <yuzhao@google.com>, 
	Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sashiko reports (please ignore, false positive):

commit b3b2fc9d5285717c3d36754aee77477780b76245
Author: Kairui Song <kasong@tencent.com>

mm/mglru: introduce helpers for manipulating gen and refs flags

This commit introduces helpers for adjusting a folio's refs and generation
info instead of performing bit operations directly on folio flags. It
splits some combined atomic operations into two without intended functional
changes.

> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
[ ... ]
> @@ -270,7 +339,7 @@ static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio,
>   gen = lru_gen_from_seq(seq);
>   flags = (gen + 1UL) << LRU_GEN_PGOFF;
>   /* see the comment on MIN_NR_GENS about PG_active */
> - set_mask_bits(&folio->flags.f, LRU_GEN_MASK | BIT(PG_active), flags);
> + set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_active), flags);

This isn't a bug introduced by this patch, but does lru_gen_add_folio()
fail to clear LRU_REFS_FLAGS when updating the LRU generation mask here?

When an isolated folio is added back to the LRU using lru_gen_add_folio(),
its generation is updated but the stale LRU_REFS_FLAGS are retained.
Stale tier bits can inflate access counts and severely distort eviction
decisions, defeating the purpose of the multi-gen LRU tier tracking.

===

As it said, it's not a bug introduced by this patch, and I don't think
it is an existing bug either, lru_gen_add_folio isn't suppose to clear
the refs flags, or we might under counted refs or workingset.
