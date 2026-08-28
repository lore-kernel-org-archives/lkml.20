Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779C51397
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787960200; cv=none; b=Fz5JzTrEWFLqxrU5HBnWmqV8uYpkOV4dZz9t7xJypvG3trB+rwUM76El2j76JzzkuVmjiIadJh42qhJ6mct1iK0cWA4r0exDPpTK36NheU+QMfDPGqyiep19SxJPrXw9iChna0p7EbU1cd12O19VPZZKSM4gkt7Ty6/PYWp0HU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787960200; c=relaxed/simple;
	bh=mTfBtZ9MsntVYRTDb+jaAA9qv60GfNyRD4WO3tFu/fo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=m/+xeMoR4f0eELBdbG/dTra4rW4rUEpvj4cqJbJpja3rItDOgG0/TD8pCvw0HKeDAdcqZJ8Il5iUueFJBJmM06H1Z6QolilNzeiwTNBFgVnb+XU24WA04B/Wr9FvtfirQMyNiG1whW9V+hlhPH/SoLYnS99mlDqouJ/QEkyBn3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DIP3dfIG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DIP3dfIG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cede6375caso42855ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787960199; x=1788564999; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFxRXbHadEiDMSxjFvFaLGe1M/LzTu9WqCxKEuyRP8s=;
        b=DIP3dfIGRL7kx+qXPZv/NwiGngZmbmQmYl1S6c9F3mJRlvYWLNbtOqGmBiIQB5nGKq
         mlBIEJy2pxEzSOzsNkbd9p0Ky/ml9VlYmtBFv5/7tiEhvGw1SShP1760LL8mLofyNSpw
         J0nBR3aep/bkK5gdOMUgA2LPVUHlslrBVWqtB36uiXJkhpMqN6PM5WESYfTZrt4b9TMf
         t5rsWuHAspEEEGOqbbISstKsn367JVt49/V1nRdtyGfPs/SZ6duZldE9OxEGSK1UwE6c
         4hG7xp1fBpcDrl8whoOEnu0YuO5nNZ2BGfkqMnQ4Lial6+tSW5LMfx/mMWTMpUSrN2J2
         yn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787960199; x=1788564999;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFxRXbHadEiDMSxjFvFaLGe1M/LzTu9WqCxKEuyRP8s=;
        b=QhwPBn2Taai62IKxu7r3pDtX9jOUfrwmrn/+Ho4HToLNogcM+DXgi5Z1WLfAlboODm
         u3LKGPbL++78bjW1wTuCwJGmxLOkMYejV1zpCe+TPK+p635bKCgyzKgg27yblR8oDXbf
         3KodRA6jpNJSzKyF5WYtpZPnIaV7IjqImCYmuW1rHtP+BIwCMVVrFB+DfMs7zSPMj+w7
         D2zpMhNDjYLVeREsF3ptXFgq1R3rslbpR6ELYzg6aTWozXJW4ZWoJ+52xiB3GefDwovA
         JNDy19LRChcVl9gzvPbZF9tl4LJhu6djLvwhuc9OfGre/JoPuMJkfWOVjsyJE5D86NrP
         ZgGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgcF5vB7HAjljPn8X818nUo/dmhGd1K0He3jwahp7OqRJop+QVhwKXHSUQxqOEAWB98ue24dfByFOM6n4=@vger.kernel.org
X-Gm-Message-State: AFuF++nyn0YTQOnH2mCccgAhmy5qbLliH9CvgSvt/n9Je4YfGPipITCr
	YxuSHc6bCehu0F9+zmZxL4vUwpgQtcAmgg0XeTaDpzkN0/Gsp6vDUT9u8LzYWOVOOg==
X-Gm-Gg: AYBFou3rkk8NpreJFm3IgxqPbEGyJdAr1pZyq9QDdX+s/axV1bExtP3EeSJ61pYF1Bn
	tVOWiBp8pFr4G6ofHi9rkHj1+4Ss/DeViSn07AtfijTEPRefO8SXvK0w6n4EY2QdXxxcLHFLsc/
	k5pR44uGWm57D0tV+sjPfyVuu5b/pA5c/vqWxE2LGiAVtqtitPv/qsT25WWKab6N89riUiekG2D
	RAHfCXowE0mIBw3H7TYt4VrYmBDi9Sk0ixSTV9XVrck6n5NVNm15tGzqSiYo2dsgzopxXazDNOp
	uFcqX2QfWWyyiNFb7/ItE5PE/V1S8uQJf79HxLzur89A1tULBNkLpDKuPHzf1Q6WOUsW9RxqLer
	T9s+Ten7VUejrkvcGint/v8hTVJyjPEz++xv/j2xpHq0gXQzhGtL0NMHj7QWyxGnZ5WChiTHsAH
	k60rodFDmXi+yLKGanM/hkUMdtEMc8wia0cY64jl59Jibivuop9lTe0NKMRFQWOrE6+1hu9Ckpb
	858RltD06xWRrtlaCDLkM6onEb9/6IsUGNqjCvk9B+/YS9dBAHr0cjyPnRYMS68jcIYidGA/ZTq
	ceE5QD/QmP06KFw=
X-Received: by 2002:a17:903:2c0f:b0:2d6:3c22:994e with SMTP id d9443c01a7336-2d8dfc511c6mr2515655ad.11.1787960197959;
        Fri, 28 Aug 2026 16:36:37 -0700 (PDT)
Received: from [2a00:79e0:2eb4:9:201d:c4fa:f5f8:451f] ([2a00:79e0:2eb4:9:201d:c4fa:f5f8:451f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312676sm1072389a12.12.2026.08.28.16.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 16:36:37 -0700 (PDT)
Date: Fri, 28 Aug 2026 16:36:36 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
    William Roche <william.roche@oracle.com>, Jiaqi Yan <jiaqiyan@google.com>, 
    linmiaohe@huawei.com, ljs@kernel.org, ziy@nvidia.com, osalvador@kernel.org, 
    harry.yoo@oracle.com, willy@infradead.org, osalvador@suse.de, 
    jackmanb@google.com, hannes@cmpxchg.org, nao.horiguchi@gmail.com, 
    tony.luck@intel.com, wangkefeng.wang@huawei.com, jane.chu@oracle.com, 
    akpm@linux-foundation.org, muchun.song@linux.dev, liam@infradead.org, 
    duenwen@google.com, jthoughton@google.com, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
    surenb@google.com, mhocko@suse.com, boudewijn@delta-utec.com
Subject: Linux MM Alignment Session on hwpoison (was: Re: [PATCH v6 0/5] Only
 free healthy pages in high-order has_hwpoisoned folio)
In-Reply-To: <8f787434-5326-4a8f-92d0-467e817a23b4@kernel.org>
Message-ID: <8f023b9f-53d0-0eb8-6f75-65957761cf40@google.com>
References: <20260705180714.3708947-1-jiaqiyan@google.com> <85cb7ea8-8116-4092-8310-69b61eb8602c@kernel.org> <ee6bcc74-0846-43f2-bcca-b1bedff74351@oracle.com> <1dea7b3c-7740-474d-b9d4-cd2baf47f181@kernel.org> <168ad406-f6b5-4623-adac-9f894e410e48@kernel.org>
 <8f787434-5326-4a8f-92d0-467e817a23b4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Following up on this thread and the suggestion from Matthew (thank you!), 
I think it would be useful to have a hwpoison requirements and roadmap 
discussion on how its support is currently integrated into the core MM, 
get an understanding of what the areas to improve are, and get a sense of 
future work in this area that people are planning.

This particular patch series is addressing an area of interest to Google, 
but it's also quite clear from the thread that there are multiple areas to 
improve for hwpoison in the core MM and it wouldn't hurt to get more 
insight into what dependencies users have on it.

I'd propose this for discussion in one of our upcoming Linux MM Alignment 
Sessions: Wednesday, September 16 9-10am PDT (UTC-7).

No specific agenda other than to gather core MM developers with hwpoison 
developers and discuss:
 - where validation should live, esp with regard to the page allocator, or
   strict invariants in the page allocator
   + implications for the fastpath
 - handling for folios of arbitary orders
 - handling partial folio poisoning and split failures
 - race conditions between memory_failure() and concurrent
   alloc/free/compaction
 - soft offline for pages in the pcp lists

We might even want to be bold and discuss a holistic design overhaul if 
it's warranted.

I'll invite those on this email thread and anybody else is welcome to 
attend as well, the announcement email goes out two days ahead of time to 
linux-mm@kvack.org.

If the time just doesn't work for somebody who needs to attend, please 
reach out to me separately and we can discuss other times.


On Tue, 28 Jul 2026, Vlastimil Babka (SUSE) wrote:

> On 7/27/26 16:20, David Hildenbrand (Arm) wrote:
> > On 7/22/26 10:27, Vlastimil Babka (SUSE) wrote:
> >> On 7/17/26 15:06, William Roche wrote:
> >>> On 7/17/26 12:18, David Hildenbrand (Arm) wrote:
> >>>>
> >>>> I still don't like the complexity of this, in particular, as we have different
> >>>> mechanisms in the page allocator already to try handling this,
> >>>>
> >>>> We also do have cases where we set the hwpoison bit, while a page is just about
> >>>> to get allocated from the buddy. So before we take it off the buddy, we might
> >>>> just hand out the page.
> >>>>
> >>>> check_new_pages() seems to check for PageHWPoison() and make us not hand out
> >>>> such pages. It's guarded by "check_pages" but it seems to do exactly what we are
> >>>> looking for, now?
> >>>
> >>>
> >>> Just adding a comment about this aspect:
> >>> The check_new_pages() mechanism used by the __rmqueue functions should
> >>> filter these pages out, but this has been disabled by default in 2023
> >>> with:
> >>> [PATCH] mm, page_alloc: reduce page alloc/free sanity checks
> >>> https://lore.kernel.org/all/20230216095131.17336-1-vbabka@suse.cz
> >>>
> >>> So it would need to be enabled back, taking some of the performance hit.
> >>> (and I personally think that it has to be done)
> >> 
> >> Would it truly fix the issue, or rather there would still be a race window
> >> left where we check that there's no hwpoison flag in the re-enabled check,
> >> and only then someone sets it?
> > 
> > Why are we checking PageHWPoison at all then in check_new_page()?
> 
> We check all kinds of unexpected state, when that's enable. PageHWPoison
> could have been considered unexpected too, when the checks were made more
> and more optional (first by Mel and then me).
> 
> But indeed it seems the PageHWPoison check is supposed to be load-bearing
> (hi, Lorenzo!). It's intentionally handled before bad_page() (with a taint)
> in check_new_page_bad(). Commits 2a7684a23e9c and f4c18e6f7b5b are also a hint.
> 
> > I think we created a mess.
> 
> Yes, the PageHWPoison handling was made part of debugging sanity check and
> then not recognized properly as load-bearing later.
> 
> > The PageHWPoison check is not just a "nice to have" sanity check for kernel bugs.
> > 
> > So it should never have been optimized out that way before reworking the bigger
> > picture.
> 
> Sorry!
> 
> >> 
> >> Also, can the hardware actually detect a problem with a page that nobody
> >> accesses? I guess if yes, it's only in some corner cases.
> > 
> > Yes, quite frequently I think.
> > 
> >> 
> >> So I'm wary about penalizing the allocator paths again.
> > 
> > I get the feeling that we don't have a proper plan on how to handle HWPoisoned
> > pages. We should take a step back and discuss how we actually want to handle
> > them instead of optimizing here and there and creating more of a mess.
> 
> Fully agree on having a proper plan, because I got the feeling it's been a
> whack-a-mole approach for years. If we then decide to put the check back
> (and live with the residual race window), it should be handled completely
> separately from check_new_page().
> 
> 
