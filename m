Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5797377A82
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140296; cv=none; b=cwAhIOPz1UxxWD//LHo8P6zlTS/v2lP3AxLfp6sgLl/vTCVqRqx0IBSIkOvP/zjaykOp8NWVWgmBWvmXTq+wrHKFeSOkIOFGr95t+7xK421TyZUH8gy/EJft71HOO+mbtVH7v1IxUIdsySekS8NZ87YwgTF9CRVOc2IzUQ7HyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140296; c=relaxed/simple;
	bh=vJsMiuSSl7OOUCYsBkM8650K2BhhXPF3mMDSrYWV6vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BB2oP/zv+OXf7nwF91/RB2ugCLxol8k40eEwd4d+HXC/lnW+7hxW0AA/wNsHdPdPtLrY6K+A8/Cvo+4njxBIM9deJ3b3ds5VB7iRl44RGXIqE3Jcp/6pdtqnQsyEHOCvpoIyVLHlmNUZ/WY4UDAKo2oWsKMIT02mMqM3niptkVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=XrTwOd06; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UtGeVKxj; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="XrTwOd06";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UtGeVKxj"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id E211FEC03A9;
	Fri, 11 Sep 2026 11:24:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 11 Sep 2026 11:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789140292; x=
	1789226692; bh=HAUzE7enydkaOLoMLY2SEAq0TLztLqE8++ymmdkXwxM=; b=X
	rTwOd06S3cmlFUR/8CmFPLqHYPzH0GAdJErMbx1qtnsFZtyZwmaZ16fH449B98mD
	15P8/eGL7KJuMRrMR/bfsY/CKslGVhFsJaE4wZdEYyIEYtiWiP0BsuIxQOMgay3G
	TrTukiUaYJUmFsWxbb2JdPFYXKybguv9FVyRiNZhkFIO9Cg7hFkuYIrmQbz8FXAz
	8l4a7PN2ufOdCSHOA1A68egPhhNGIqVdJmWAz+K2ePao1Ghv5FgM+q0mqgSR6ZwZ
	T0igMD4zBgBzYJa3Ek5EEqtkTfjQ1wyGiT6qKcjdFAFLxB88rrC5lXDFFfshWGZC
	KxsHhDVhNCUQrSarRAb0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789140292; x=1789226692; bh=HAUzE7enydkaOLoMLY2SEAq0TLztLqE8++y
	mmdkXwxM=; b=UtGeVKxjsRWuhHiGsqL83O/bWnqXFZiookqn+h/qr5sn6yIfCIq
	mFnKsd/Mw5djcncr1LgNIKUVN0uaFk4Arrz42H2ukunshCMtUY/x6xHk5epirdGM
	RWFhBIlQFnU1ihIQY+xReR+FEbjkzkytJsX8nsmpMFq8T0oajgCT/XTc8n+1/Nm+
	LZIWuvf2lr6Uz+HoQn78C0UvOMjDcgtTq//Oemxk5ipvrhvH/M6e2JpRA29kkAvZ
	SmHK04KNSERPWwEXgzHIhP8WOpDVJkIxR1F5dZ2rAnuywhNudUYwOgPIatIgorBz
	27miCYqsdbmOvXDAbLsM2qov+2IQtUvP3LA==
X-ME-Sender: <xms:RB2kaixKMa73AXpse3t7nmu2tt5n2E63NMdjvV3AS2EIwrOIe0O8oA>
    <xme:RB2kapGuaMscCcaFKT2A-_lTqJU0iWJ8UvEW2HsnVofP_XfPO7wgRV5SBHq8JzNH2
    2M8r8hXPI2_bTL8iK-slAseWK__p3uQU-DRcM4nzA_tCP6zcrYZVKU>
X-ME-Received: <xmr:RB2kailmPCbBApO5xFPpYCgKFSEVBv90ncf2nwDIxH7lxbI5i9yvza-u8LQ>
X-ME-Proxy-Cause: dmFkZTF8LFgWtizom6IF8DNYZLn93DBEGoF0JIc/0HbvOUgORNJd3EKvjslq44ktpk5VHO
    qvTYPuoI9Sp6S9b04PH5PhJ1ShvFJJtaNvccolXPixjRd04BXGXL0IIJizgNYjbLTxoYr0
    XxiqsO9yNkn64vwtU07xFyJvRJWmK8gFguw3GYn3svneYKfYoiIgO1u79ummMhROnx0aJ/
    atJuv5FfKd6tapVpJTslwSTllXPEEyxNVeA1n/VouCcU0dekT7GnAj421eUGIOIXKtrTIb
    Q/0X6ZNM9xWzCNNzW4/ZsAUo6rM7fa7W4hlv1gfYqoztY4KnlggWKVQSrVr+XgJ+8NwdUY
    wh5u8rx1ouHoafEoKZ6okSNIJHZDqk5REg4D1Tx9Odwzo/nD6ASa5uyPhd/1qlrFUEntr1
    Jqka62hZnyauxqOwWN/hq2+GPhtZtpCgnhCGR0mECEDPwnVZkevKWH9vLQEgRqUHakSc2q
    7jdTZcrySlgCYbjKwL4ZLqtKFXfe+t2BETcIOJJEUP4GXAgWuqctpaNnp6s7EikcN6S3R2
    EHim1sNf+3XWHxE0X94uIGQQFxOfV+R6Dbsuu0hLzQgN2y4dmSIBlxKt3zDS/Qrj8wddLX
    bgpsj+O8qiVbF1kb6ZHU+M1JGBMtmr2VOVs6MDJxr6DqjJJlfXYPQ2+FZdjw
X-ME-Proxy: <xmx:RB2kaoENNFEFighu9SMs6OGDMyb8hLsiVyKfjMGR80nxbH-YIRgLEw>
    <xmx:RB2katwmx4tTo8TeZuf527MqE4GaWcyORcOzpqULTfdNm7oVNxEwfA>
    <xmx:RB2kapZ-Yxbnai99g1j_nbv1FIR9jlhmTSFz4YAPvCYfh9C-qs00Og>
    <xmx:RB2kagnGtG9mZ24eM8f-vTzbVzfoTedCRoW3O62um8T5DcPhGbvL_w>
    <xmx:RB2kavLBC_UqyhrL0wwWLxU0MNqZXIQt_nUXQwTvlmv2roNc2J4J7Hc1>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Sep 2026 11:24:51 -0400 (EDT)
Date: Fri, 11 Sep 2026 16:24:51 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v2 09/12] mm/collapse: open-code collapse_single_pmd() in
 its two callers
Message-ID: <aqQaxyxQYD_1KHju@thinkstation>
References: <20260910120238.2529819-1-kirill@shutemov.name>
 <20260910120238.2529819-10-kirill@shutemov.name>
 <DLCKQ4T6VJZA.3KVN87GD21IBI@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLCKQ4T6VJZA.3KVN87GD21IBI@nvidia.com>

On Fri, Sep 11, 2026 at 10:57:46AM -0400, Zi Yan wrote:
> On Thu Sep 10, 2026 at 8:02 AM EDT, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> >
> > collapse_scan_pmd() and collapse_run_pmd() each have a clear locking
> > contract.  The scan is called with mmap_lock held for reading and returns
> > with it still held.  The collapse is called without it.
> >
> > collapse_single_pmd() kept that boundary inside itself.  It dropped the
> > lock on some paths and not others, and reported which by way of a bool its
> > callers had to carry along and then act on.
> >
> > Open-code it in the two callers.  Each scans under the lock it already
> > holds and, on SCAN_SUCCEED, gives the lock up before running the collapse.
> > khugepaged's lock_dropped and madvise_collapse()'s mmap_unlocked both go:
> > the code dropping the lock is now the code that wanted to know.
> >
> > khugepaged's walk carries on to the next table while the scan keeps
> > refusing, and ends once a collapse has taken the lock from under it.
> > madvise_collapse() re-finds its VMA after a collapse, which it did before,
> > and now uses a NULL vma to say that it has to.  It still reports the drop
> > to its own caller, from the line that does it.
> >
> > The lock is given up and taken again at the same points as before.  No
> > functional change.
> >
> > Assisted-by: LLM
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > ---
> >  mm/khugepaged.c | 102 +++++++++++++++++++++++-------------------------
> >  1 file changed, 49 insertions(+), 53 deletions(-)
> >
> 
> LGTM. Thanks.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> 
> One question:
> 
> What prevents us from doing:
> while () {
>     1. mmap_lock
>     2. scan_pmd
>     3. mmap_unlock, bail out if needed
>     4. run_pmd
> }
> 
> for both cases? It improves readability. What is the downside of
> dropping the lock during multiple scans?

The scan/run ratio.

Once memory is mostly huge nearly every scan refuses, and a refused
table is cheap: one pmd read for SCAN_PMD_MAPPED, one PTE walk under the
PTL otherwise.

In your version of the collapse loop, mmap lock/unlock plus VMA
revalidation would dominate the cost. It is not productive.

Note that scan in khugepaged is bounded by pages_to_scan so we would not
hog the lock.

> for madvise_collapse(), I see mmap_read_lock is held when it is called,
> so it can be dropped at the entry and the code makes sure it is held at
> the exit.

That makes every MADV_COLLAPSE report lock_dropped, including one on a
range that is already huge, which today never lets the lock go. The same
performance consideration as above.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
