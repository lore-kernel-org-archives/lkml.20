Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793040264;
	b=OUZVKe6pVQjehKMEGu+shMbcvVGHuzFJdoMngcHA7VwUh5s+VUQRPYOs/8ycpugPhPUM
	 cCSSnNLMekwct702XNb5j0XA2AiJSlBvzl7e5ZtcS1O7OgK0CBpjqve5K+sFVk6Mf32tD
	 fyEPV88D5SeEvSn938nwOSBTpNzrlIdZuVM6vozssoP1jp5Ov2dYiIezIkLPy3TX29R7C
	 oUuqDNcrIpXfMNSgwDItWBvaOtcLueRh6UQycN18L6wlBEBa2XlI66KSX4Y1z5NP+4P0W
	 xShs1jgS6dNXrh2B2Jno/+bJAhQ2ZL8YriJyPewWHPxAmI4xULnpLP4ZZFJRW44RTZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=46y44saD8P5rxD+OY5cJ+zq51H1Duo7SHt2Bubu77+E=;
	b=usRoklffp0nfP+bEvXSyLvFeFHFhjKYVSf7FesredOIpgj6v9eNpMaY54LjwYVx9MOz4
	 PpVK9YR+STG2VaSAjwIh7B2sRdqy7VlYO1kpk1IZrcpZD6ndogR/cXbLh/ZFxsX6jenRG
	 Lhjaaf9GVkwf1DSKaPsmyw8MXL25BI6VsZIml1nIs6DjKscxwqP0TXNxf838f1Hg5lziy
	 TqDPkCoxkE9VVD9TPLVAcOFt8c+6OT+WR3MFQzXAUiFy7ot9K5YmnvasIbs/9RPg/Tmfg
	 TjZaWxPz7xgvptDfdJi2JN998XOm+iEID3f4Fzl3B60rv+eTVJNvExPHX5Q7x7wwuxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcSiTSg2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18289606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18289606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcSiTSg2
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so21517775e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793040262; cv=none;
        d=google.com; s=arc-20260327;
        b=ERys8XY/UzPSCOsxCbWE03+ZSPk9Q6YtqYJxNs1RFOfo++5VNujw9QfVcuujS8+sy3
         ORY+R62VJqpWOov6sj4WstUK7QyahQHkhEVViB3TBO8G/ZKi/OCj0N5+E4i8b/XVAblo
         RbGpXrdFFO18ktwLat2kZ3/sEHQ4urKDhfaF9+0abOuX43OmBxyGx7pZzYi1UPF0Xjfd
         8LhrG2bYIc9MHFvgV53UpPtKAYmIfoP+/UyvkzegDgx1WIpgSWEl0za/CCmGtByWLu+c
         Z3ssQWlJzQUfkzszoRgNX3PNugyJX6PeFEJMc9oydEiv3DQBDsSghpDvUWeSI/o9yAKG
         Cung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=46y44saD8P5rxD+OY5cJ+zq51H1Duo7SHt2Bubu77+E=;
        fh=B8a+dZ/JKX7k892dD0s8uBaujCPFmo2zt+ly/X8PTBg=;
        b=l68d59/eaP10x2SUbhtlK57n8ffr3JaAZi8/SJFaYs6clHw46olEdJAbve0yg3O8gY
         RCY0vetimvvrY5Kb7eJHqZVGW6EO+tzFeBwjDOSQIGcHR6fCYm5AxnSrRI9YH1fbrb6c
         dP8RpPtrxAw2X0GN6l5ap/Qx9+SMsV4iud851Dd/esscSsV19jk05hXYSFgR1raxzbkU
         Gh6TbOkqdC+PiVR1vYelyjjewrrw6uMROuHPQJywGuwzu5ot5iMhC2LeNoW28tvrAZ+5
         ygyQgtjQAToDoVN/xBdrWO9qWPtsK5XpQicxDMJfgNH0jxlVByik9lQe211DIswlGLQy
         Helg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793040262; x=1793645062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=46y44saD8P5rxD+OY5cJ+zq51H1Duo7SHt2Bubu77+E=;
        b=ZcSiTSg2kXT0fCIGnN10QbwlnCbo5gGNO8C4qOdBgTzHsRR/uy1Bm3/Hbw+fSQRCq3
         fWPUaZCfsA1c0dBZNRTjmzedx9OV9Dr3h2v/oU2IARMzpqYsFRitDZ9CWvMNI/jXHumt
         WP4LvJdCBC9rlei59OqwrB5GjTQKzOy90WqsgOdXXxvzO1zw+Zcs+ssQANQ+5gvIqpzH
         x5JWrhtigQQDFJK5YDxpxdKQJrxc/DyCQ+EOvCVMT5VvvkEci4ICwnkbBwAgEgjTbOoS
         0n4+7lIeaf8nn5Gv1E90QHxIDlXZwmVaI2GRBBQnWXAnCXkUROul7o8n10yjiGwqKzTA
         q15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040262; x=1793645062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46y44saD8P5rxD+OY5cJ+zq51H1Duo7SHt2Bubu77+E=;
        b=bbWvT6ZLPxFEzJ+Ty9YSSyBNovI50qS3wl4e69/WB8HhFWgaS7Nb5Q/UyWnRVqiGCg
         qcIUkdAjGS7yixQdpBB6gqRdtLfHECCRaioqaMdKcRG557F/dc2wW3EsoMHv+KyTZhX9
         Dtc6kyNb7Fii+LwYIdttNvwgXXnF0HeE0J9oVebXm06hGRnzgeUbUosgMZsvqmlJdZJZ
         RltZxMqOkBeSLT2KnzANsod2yCVAvfMoFJcFftcN71qfGfik1YSrtl9J4P/uE0f9iyf5
         42onQvoOZpIgmd4eisJz482yVCF0fVE2SVBZpJPHuCykSg6dDienpeaeZ0yffV2850bT
         Gjuw==
X-Forwarded-Encrypted: i=1; AKwUvBxpy56nCyXO6SAlYew9TotbxFv0nixIh1TA/zw5nPsgTcW7vCqASD3HWzzd87PUPOCV8tX/G0/16bgA56Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAAo2gX+Fe1cQ64iYOkumCsHszHf05h2T6NpoeqszSL3YAY+H/
	az2hVg3MhgXYNrE4/0giOVPyO8r5IOqnfx/GNBrLIiwF29w1fX9uYXSPPN27IoILmlrfgCkOHMs
	Doi7jJOB96oHqoHMfRZx1aC4A2YXOrRg=
X-Gm-Gg: AYBFou2UMUANZm/92PacCuURXAwD7owtFAZwEOIB7a8ss1ieWErCowpoODQQHKmA7TL
	C30d7D6wLbP47Q7JlFOuDC4BeszcBh9owhFDd1yxwjB4BCzkzVek8iyXbJ3ekfbbvVCOqVoL4XJ
	Fji0K3P2i08xExcvWcUFyNM7LZL8gkldBkAJTmrJKETkeBKNBVskBMaXCFxINunxwwHpkEUtWO4
	xit63ItN8fmDyGRLqoADrneJA5jhoAvZTwPx+/F2ipnf4fl9+O+ubJ5HZzZmhsil11N90Epc9d+
	YPJSpyWYFOvNd2jOASUnyiBuvewfNXWR3/oAUoOF+jbfuvm/5cbAUj0jCbkNxGL+3bJv0X/neKs
	s0BBajAohIqurmQkLhxTHVUQUY9jIn5wzsE8lwpfQ4hdg/XpW3jHYiSdmnvFHxNpePbta4ZPfPt
	c3/RmeiX4e4ODdBhPbOeUqamsgODz7Ao6RJ/wA456QS8iZ5cuhHxLz
X-Received: by 2002:a5d:5e8d:0:b0:48e:6f:19b9 with SMTP id ffacd0b85a97d-48e3eb83497mr12334198f8f.23.1793040262329;
 Mon, 26 Oct 2026 11:44:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-fixes_shmem-v1-0-703206d5fa0c@kernel.org>
 <20261026-fixes_shmem-v1-6-703206d5fa0c@kernel.org> <at9hs0Unq0EOg2M2@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <at9hs0Unq0EOg2M2@pedro-suse.tail5790ac.ts.net>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 26 Oct 2026 11:44:10 -0700
X-Gm-Features: AclHuK8AArvz4X8t1WY3GQA4kuy3-FUfTY-4j5HzxhSUW6GQg7l6zLPND04oXb8
Message-ID: <CAKEwX=Nkd5057Yze+9jbk+VQ+b7i-5x4EorQCyK94qWetOb_1A@mail.gmail.com>
Subject: Re: [PATCH 06/16] mm/shmem: hold off eviction in shmem_writeout()
To: Pedro Falcato <pfalcato@suse.de>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Vladimir Davydov <vdavydov.dev@gmail.com>, Michal Hocko <mhocko@suse.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Lukas Czerner <lczerner@redhat.com>, Carlos Maiolino <cmaiolino@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Verkamp <dverkamp@chromium.org>, Jeff Xu <jeffxu@google.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Stevens <stevensd@chromium.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	William Kucharski <william.kucharski@oracle.com>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 8:14=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> wr=
ote:
>
> On Mon, Oct 26, 2026 at 10:40:39AM +0100, David Hildenbrand (Arm) wrote:
> > From: Josef Bacik <josef@toxicpanda.com>
> >
> > Once shmem_writeout() has moved the folio from the page cache to the
> > swap cache, the folio lock no longer keeps the inode alive: truncation
> > and eviction find a swap entry, free it and do not wait for anybody.
> > That did not matter as long as swap_writeout() was the last thing the
> > function did.  But since it puts the folio back when swap_writeout()
> > returns AOP_WRITEPAGE_ACTIVATE, it uses the mapping and the inode
> > afterwards:
> >
> >   reclaim                               last close of an unlinked file
> >   shmem_writeout()
> >     shmem_delete_from_page_cache()
> >     swap_writeout()
> >       zswap_store() fails               shmem_evict_inode()
> >       writeback is disabled               shmem_truncate_range()
> >       return AOP_WRITEPAGE_ACTIVATE         shmem_free_swap()
> >                                         destroy_inode()
> >                                         ... RCU grace period, freed
> >     shmem_add_to_page_cache(mapping)
> >       xas_lock_irq()            <- use after free
> >
> > swap_writeout() behaves that way if zswap is enabled, cannot take the
> > folio and the memcg or one of its ancestors has memory.zswap.writeback
> > set to 0.
> >
> > shmem_unuse() already added infrastructure to deal with that.
> > Reuse info->stop_eviction to protect the inode during writeout. Increme=
nt
> > it before removing the folio from the page cache, and decrement it afte=
r
> > swap_writeout() and any attempted reinsertion and inode accounting.
> > In shmem_evict_inode(), wait for the counter to reach zero even if
> > swapoff has already removed the inode from the swap list. Add some help=
ers
> > to make the code easier to digest.
> >
> > Fix generated by an LLM and sent by Josef Bacik in private.
> >
> > Fixes: 6344a6d9ce13 ("mm/shmem: writeout free swap if swap_writeout() r=
eactivates")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > [ david: code cleanups; improve description ]
> > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>
> I've been looking at this for a while trying to get a smoother fix, but:
>
> Acked-by: Pedro Falcato <pfalcato@suse.de>
>
> Things I looked at:
> 1) Could we just drop this logic? No, it's fairly recent and seems to hav=
e
> impact on zswap setups with no writeback.
>
> 2) Could we reorder swap_writeout with removing the folio from the page c=
ache?
> Perhaps, but it would be a larger change. I'm not sure if the logic all w=
orks out,
> but you could possibly have a:
>
> error =3D swap_writeout(...);
> if (error !=3D AOP_WRITEPAGE_ACTIVATE) {
>         shmem_delete_from_page_cache(folio, swp_to_radix_entry(folio->swa=
p));

Hmmm, say the backend is zswap. On successful zswap_store(), we drop
the folio's lock (in swap_writeout()) before returning.

Would it still be safe to delete from page cache with the folio
unlocked? :/ Seems dangerous - without the folio locked all bets are
off.

(analogously, filemap_remove_folio() even explicitly bug-out if
folio's lock is not held).

Maybe we there is line of reasoning to prove that this is safe that
I'm missing, but it just seems rather shaky/untested...
