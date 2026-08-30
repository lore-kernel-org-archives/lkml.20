Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D562EB5A6
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788110361; cv=none; b=d6uTRiGU41mfablECnftwSMr4jE8FPPas52f6DUYtXKbMnrlZ6Xbr7wfx5jEGCeuF84OumT6O/syX/WIWIywJWdxevholtAYD1nr6C0NQvu2gTa9j0/eP3J8hsz7GzoIV1GdJkjhBR23yeJd6ApTtqhQiNwqNIWl9mQRZU7qRuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788110361; c=relaxed/simple;
	bh=xph1ZbpAuVGBQ9BGgKp2r4tB6wXDf4tOCzRDoW0QHA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucDgMwRFx2nNBc+szZJHui9puFdf/tPXNshEluw3zzb8NaAGhv3X/wOE2Moan/IXq+h8j9lfMO+EIOCW2JLBAG+sd87ZjECSuuMVLAjprv557ZlCi8axV8PFUWZTJgPsWRC+DY8UQstdPYmF2TouOkPH6AiClkj6w693u31TeOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmvnw6sS; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmvnw6sS"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d91ff7d9acso1716665ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788110360; x=1788715160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y2hq6QuB9tMpONgBvXPbELPoG76SYlrSEl+e1j2HRJk=;
        b=rmvnw6sS3CWG9WYTJu9J/0CSqiaY9+htmnU3Ew4kIPBYypubJMojH6hkyw/xCFxmoH
         GwJjQRCYcYxXnwrtnxBmvf4SflJvnBPGFLfXxtLTi6BXLywXAtUKWFUgsBZ+hNXUrsyb
         oZG5H1OlqWPMRTtmhVDNEKcMvmWL64sjcET33SQLk7hAyIZfxUcfFqL72CqYI2Y8v+Pw
         fCZmyR6g/R3OKqt5xLdGCGnyPdUJK94ppz9u1lUgXj4g0VPNKsJoR1cNM96+kXqMiWt3
         c7InbcdDyaz11CWcJ9/1BLM0sU7QPeC4Pbp4adXwi4NU0BVZkT0eGpCXeiNDpsvx29ep
         QdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788110360; x=1788715160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2hq6QuB9tMpONgBvXPbELPoG76SYlrSEl+e1j2HRJk=;
        b=fTsthTG0KtkB6gqjxwXy5/F2WbVToK9P0MSVPpvFnnbcO9JMmcjOiSxSa+8nno/Q51
         C+CnPhZuRfQQLanf/6TQwNgsBHT4aNtmmyuhRcO5/VHwlc0RL99rFdZr+v+7oy3atNJ8
         MWq4N+shej9yNm9fITiH0lidvszDclqYreYIw1ZwPim2NUtlfG2TmRhXUGGVP6yayWpw
         7seYTfXnGtkgF8CrWyY9nmLEpWGuhDMYFAx69cmd/B1RM+hRFmqcuV7Aoxi77dp4YzHY
         eK7gi5EQ9jQg+1ZK9eQujIBwE2wbkJO/zwHIKzlD8UbubQx51iPRIauCF/x2gW9l1Vun
         GgZg==
X-Forwarded-Encrypted: i=1; AKwUvBzNq19ZzD8012DaPgFvftxWOpGvjw0P23Js5i16d+Spd8WcE+J1UYt3/DUh8jG8w8LTXSlLpIsGEeFvMfY=@vger.kernel.org
X-Gm-Message-State: AFuF++ky00NMaKDda1f6cF3796E3DDFPUTZb1UqrRGDN1qTnhn3yp4iQ
	AaovEBAJaXYcGfX6ganEVUa6C0yTN8IiLpMg2FtXSTn17+OLHPY1pTiM
X-Gm-Gg: AYBFou2z0WioGnNEXhUvfES2a1B30+7Z38C9QQgGE2e+5McP8egUY6p/S+glQYEhHl1
	Aq6l9OFWbr5w1yY9zpguWGZsIPWmaZ0jUCUaxmHcomx5jFMFCbRZQJNE/A5jgED/8flVKJsa0cS
	Gt5TmAs4W4gZOrEQ5w6rscvblcASE3Zpbs9oNTsf5RushRPtT06OtidIZ/4HEf3+NPwGOjpd62Q
	qBD3wcE1niRU+Enb2oROyQtLh4O3kKXibCujNPp/5It3ZBmFnZlvz1oXDfgWvW1z51LuQszXCrH
	IAtm4gPwVUDDZCC89PKTGLq17zNPiNonXFFHG8cBGRidLkKffiPw7QZS6nQKA8WLzpcxolgyH+F
	CVKX0yGYwDgMXgh90zlq5YrqNiXwadFtTY33fppOsrEJIESqjzpcLso9litda8vdkUgtlD1GCDo
	jOECNNwoQOzrh7O8Me5Yl8fzZNSYnRr+OHiHEoQG/Xq4/xSKCjnVBTxIvKnhtt7vMVcLE+IALkz
	Omr0TaIpfofPDXU/ZRF73ZvXoxEON3n/FM=
X-Received: by 2002:a17:90b:54c5:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-396d0e5ccc7mr35280422a91.3.1788110359674;
        Sun, 30 Aug 2026 10:19:19 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1992e05sm17245893a91.15.2026.08.30.10.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:19:19 -0700 (PDT)
Date: Mon, 31 Aug 2026 01:19:11 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] mm/mglru: introduce helpers for manipulating gen
 and refs flags
Message-ID: <apRkq7A-tvmNvO0O@KASONG-MC4>
References: <20260826-mglru-flags-cleanup-v3-0-d9f1c75549c8@tencent.com>
 <20260826-mglru-flags-cleanup-v3-2-d9f1c75549c8@tencent.com>
 <ad8acdc0-7618-4caf-88ca-4780e39ff324@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad8acdc0-7618-4caf-88ca-4780e39ff324@linux.dev>

On Sun, Aug 30, 2026 at 04:39:33PM +0800, Ridong Chen wrote:
> 
> 
> On 8/26/2026 1:53 AM, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> > 
> > Instead of doing bit ops on folio->flags.f, introduce helpers for
> > adjusting a folio's refs and generation info, making the code easier
> > to debug and understand.
> > 
> > No functional change is intended: some combined atomic operations are
> > split into two, which only creates harmless transient states. There is
> > no measurable performance impact, and some paths even look slightly
> > better in the generated assembly.
> > 
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >   include/linux/mm_inline.h | 76 ++++++++++++++++++++++++++++++++++++++++++-----
> >   include/linux/mmzone.h    |  1 +
> >   mm/folio.c                | 19 +++++++-----
> >   mm/vmscan.c               | 61 ++++++++++++++++++++-----------------
> >   4 files changed, 114 insertions(+), 43 deletions(-)
> > 

...

> > diff --git a/mm/folio.c b/mm/folio.c
> > index c02dcea9c03c..a932059057ac 100644
> > --- a/mm/folio.c
> > +++ b/mm/folio.c
> > @@ -353,26 +353,28 @@ static void __lru_cache_activate_folio(struct folio *folio)
> >   static void lru_gen_inc_refs(struct folio *folio)
> >   {
> > -	unsigned long new_flags, old_flags = READ_ONCE(folio->flags.f);
> > +	unsigned long new_flags, old_flags = READ_ONCE(*folio_flags(folio, 0));
> > +	int refs;
> >   	if (folio_test_unevictable(folio))
> >   		return;
> >   	/* see the comment on LRU_REFS_FLAGS */
> > -	if (!folio_test_referenced(folio)) {
> > -		set_mask_bits(&folio->flags.f, LRU_REFS_MASK, BIT(PG_referenced));
> > +	if (!folio_lru_refs(folio)) {
> > +		folio_set_lru_refs(folio, 1);
> >   		return;
> >   	}
> 
> Do we still need this branch now?
> 
> If folio_lru_refs(folio) == 0, that means refs =
> lru_refs_from_flags(old_flags) == 0, correct?
> 
> If so, the do-while loop below already handles this case, making this early
> return redundant.
> 
> Or am I missing something here?

You are right, it can be optimized. And that's is not the only part can be
optimized after the cleanup I think. But perhaps optimization can come
later? The helper convertion will be harder to review if mixed with
optimization I think.
