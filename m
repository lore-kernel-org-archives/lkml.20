Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CF3364E85
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 23:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789256804; cv=none; b=SbHjMTVONMwk0+H+XHOYZlNmjCovWzJaXsr0x8bnsXpnMhqofu21fh/ut+t6HbxtGcNv9qnoh6e9Mt0a5IeBtMmCAIkEWOv7775k9KPCPoxpfQfC3dDStW/xnrIlQ0XGB1nIqq++9SireveRMk4zWKIQKctXuObDwBWkdO/AVw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789256804; c=relaxed/simple;
	bh=Y+Y7jFaIBY1fqvsHyMrlaVgN8ji3JyM0UKEwR2MldH0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WGRuP/tUvzJvpdYX55kRwMt+1FdJVqyOkGbc/cl4ZJPHo4k1hZkl3ehQnLSInHwRXC7WhTF0EcatcYk7ZIPeQvUNdQQq8fvrqLC7QkXDszBNuTm6mdKHCCmEWXgk59ChLIEu8cwKq4N8orv4msxnYd3rIQctUtLpPCr8zqHzvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tdDKYYxh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tdDKYYxh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so15465975e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789256798; x=1789861598; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVsvS8oPhpD7RsA/j/bC9uAynbPr4/hmIZdqzmX+oJs=;
        b=tdDKYYxhhG3Q90T+T2I74scQd0QZpaj6bXd9gYJnQlvUn1k0SfH6l7Use+mSwwH2cS
         1MitrMX39+bM1n75/I5lvVvhFKbf3Fxs+EAquS4dUxmDfK1l3zwO37W7HQ4zykCU5+ze
         S6wOCYQmKGbXiBPx5opCsm+TSd8mY1n0q57udrEmuVrwtwljIlpTXj7rvh79FpCH7+XD
         O0D3Iq4kjdPHoM5On1qOggbJtGYdZcno605QkeJZr25AKVats0RAmol+ZdrD1Ha21Z7R
         ZszssoDSUVMRoSxrjWdNAiL7m5WA1BhhMp85M0KxHyPup9PCDgvP7MwASYoUTCMWgTrn
         Lt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789256798; x=1789861598;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVsvS8oPhpD7RsA/j/bC9uAynbPr4/hmIZdqzmX+oJs=;
        b=WxZNrc4hShYPeeInFuDEJnuFbd5a+NZjMHiZqE32vsyIr4HSxX8dUwv3z73at8lFBD
         tnkf3PsXY1RsXq1k6IRXTo9donUUaLxo4PL6FpvLNzOiEo6oYqzPBd/+1tLZZQwVUWzJ
         QYNykiOhwHwEwzUk5gVCklfHMt+Yx9eWPqwsIV5Yk3aQoybCxpEXryFuns9Y+iEkMK35
         tv7+NArQNucXCnmhrb1IGxyYSBd4G9+m5VzEa9pTZlp9STuboIY00GZ7y/JfBuPB2225
         sdDDhwOBXE2mwhWjSRoQzsquWLTi1asJz13CSog5x+o9iGkqAt6+oajdW9NIe2z4DxcY
         96Ug==
X-Forwarded-Encrypted: i=1; AKwUvBysN0QJaMwgBNkoNUAciAWvs5lx78nkGu6faCP4EdK1hipumgRpa5dBb1R11MdkRiGPme61gBqBUc2+hTM=@vger.kernel.org
X-Gm-Message-State: AFuF++mgWP5blhrMWPxIFfcb8Na93tHmLDArU/4cqRpcDAdwVpCCJ7xo
	8iBX2aS6S3vUuav8f3fTBWjcmmRNBS+gknRFhJo5xChmPNZWfccQCI4lNSHC15JCxA==
X-Gm-Gg: AYBFou04SCDycA8QekK6s38Q9shJG01IxV1CllZZE/pCttmC9o7pvVLXk7WGdWFsFi5
	5CgW2FKK4ZDIHzYbGb9BItSIaRWa25FgREvS/Wa/hiHy/gFEh+1Hxkr+dCkX9inOi4Zn84Ya+Th
	qiaYKwGQW+gCrYBOWtsCFZF8rsCq9m6icuo9Lq3jgSyzHHMVHvmFqWuvcvVc4aF92eUEx1V6OaO
	HitIULu+8nhO/rVyj6tcw+Og7bnNQ6jHNDa8RxAwvygfO79aSE5ccEZRdmFPaRxCvEJfA6aHmkO
	Uof/6t9RkSMWYOYh5Mqe73aAvu4Ioqu4Pos74BczkN1mkmWgV1TFVrJDvigzbyoHo5V544pi2RI
	JfT8aUHX03Po9ksKF8HJiXjw/66VdX28ZM+ySszCtQ1YGidfHnT0SDP1E5oQiifljECWh8WmQbU
	n2oT80Os0VxecOHX6bLBdJTgGMa/V+K7ft97OVMYDE8SgYPIackWHy7zq3D36GiPetxrcUA4Waa
	gBCS6ds486LF1xKD9Bh
X-Received: by 2002:a05:600c:3b1f:b0:49c:fc89:59cb with SMTP id 5b1f17b1804b1-49e61983468mr118820705e9.5.1789256798142;
        Sat, 12 Sep 2026 16:46:38 -0700 (PDT)
Received: from darker.lan (104.157.125.91.dyn.plus.net. [91.125.157.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm139496775e9.3.2026.09.12.16.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:46:36 -0700 (PDT)
Date: Sat, 12 Sep 2026 16:46:34 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 09/26] mm/fbatch: restore mlock+munlock batching,
 without extra ref
In-Reply-To: <ce1e07aa-5600-46c1-b35a-d7df09a84521@kernel.org>
Message-ID: <96fa2371-8a9e-8fcb-08f0-2977320bbbe8@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com> <69ba633c-8fd5-1f4b-2e1e-b9b15b8946be@google.com> <ce1e07aa-5600-46c1-b35a-d7df09a84521@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Sep 2026, Vlastimil Babka (SUSE) wrote:
> On 9/9/26 11:59, Hugh Dickins wrote:
> > Update mlock_folio(), munlock_folio() and their fbatch callouts and
> > helpers, to do folio_try_get()s at batch processing time, instead of
> > holding a folio reference all the while in mlock_fbatch: as in folio.c.
> > 
> > But more interesting is the use of mod_mlock_count(), using try_cmpxchg()
> > to update folio->mlock_count safely when possible (now when on lru_add
> > fbatch as well as when unevictable). While __mlock_folio() is as hard to
> > think about as before, __munlock_folio() simpler because munlock_folio()
> > can adjust mlock_count itself without clear_lru() or lruvec lock, and so
> > do the folio_test_clear_mlocked() immediately for itself (without which
> > unevictable_pgs_cleared was likely to appear high, when it should be 0
> > or low to indicate good mlock health).
> > 
> > __munlock_folio() is safe for use even when the unreferenced folio has
> > been freed and reused. It appears that __mlock_folio() could affect a
> > folio which has been freed and reused, but only if it is reused as an
> > mlocked folio, in which case its mlock_count is spuriously incremented
> > (but usually a spurious munlock decrement will follow).  How grave is
> > this? If unevictable_pgs_cleared remains low, not so bad.
> > 
> > I've gone back and forth on whether to move mlock_fbatch and these
> > functions into mm/folio.c: for now they stay here in mm/mlock.c.
> > 
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> >  mm/mlock.c | 147 +++++++++++++++++++++++++++++++----------------------
> >  1 file changed, 86 insertions(+), 61 deletions(-)
> > 
> > diff --git a/mm/mlock.c b/mm/mlock.c
> > index 2c690f18031e..1050010bbe0b 100644
> > --- a/mm/mlock.c
> > +++ b/mm/mlock.c
> > @@ -58,6 +58,20 @@ EXPORT_SYMBOL(can_do_mlock);
> >   * indicate the unevictable state.
> >   */
> >  
> > +static long mod_mlock_count(struct folio *folio, long incdec)
> > +{
> > +	long mlock_count = READ_ONCE(folio->mlock_count);
> > +
> > +	while (mlock_count & MLOCK_COUNT_0) {
> > +		if (mlock_count + incdec < MLOCK_COUNT_0)
> > +			return MLOCK_COUNT_0;
> > +		if (try_cmpxchg(&folio->mlock_count, &mlock_count,
> > +				mlock_count + incdec))
> > +			return mlock_count + incdec;
> > +	}
> 
> This never rereads folio->mlock_count to mlock_count inside the loop, so it
> can spin forever?

You give me a nasty moment, have I misunderstood? Isn't it part of the
try_cmpxchg() contract, that it reads folio->mlock_count into mlock_count
when it fails? Hence the "&mlock_count" rather than just "mlock_count"?

> 
> (too late here for me to understand the rest today)

But that I understand very weil: thanks for all that you have managed.

Hugh
