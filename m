Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E08A3B5319
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261774; cv=none; b=SP0h4LRzyjo/gyU51NZLUz5wCQHoa3Bz36+RpPutUUUv9WaWnnWQNAoZbIRsC7QgfQqoh5F5FMqzYPFqoHkYpB+latQ8EKaLFsecTRQhgbhjtzj0AIZwHtKqNbW1Ih4I5nRbrQdw7bzO7btZOsVv7E0vHg9XF2XrMhj/ow8fdCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261774; c=relaxed/simple;
	bh=eOkmpjOIVs+qBgs5v7B6WIsO31vk0arSS3EF0lrLD5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePhWbsBODaCEMb1aGoQPKBmAzkZT/KIy3dDDjVNyhF1a4pegimqn4cCReitz7Gd/WSzy6e1uf3rkWczagUTDRi6ulua9F4JOr37LW7yiz47UsdVY36qTsYuYtwMVx6dJlKbBGu2hI2ch8FX/PZW6eGRa0m9xIQHS+DSN1I+C6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Yo5jOJr7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aMPccB4L; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Yo5jOJr7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aMPccB4L"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 915F97A00A2;
	Thu, 24 Sep 2026 10:56:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 24 Sep 2026 10:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790261770; x=
	1790348170; bh=7Zf7UhNhsq+m5MHp88ue4Z8T5ykpaIrCSq+h+GNOPCQ=; b=Y
	o5jOJr7HkYESWPD7VL4ga0L6PQnqODZFH3M8I1Ye3sZzOh+w6QkHYTKsrtvgeQ+M
	TG2CadFM0R9nnSStChhahL7OsnnSlsAHTVNXUzMT7/gLNzbfvqCIZM77aTeHiE3b
	YnmSLiuiQF16RT5c6WT8IPxT3XqfPP/nZiWSOfI/X0zS4zwcgFOQqPktNpGy1WrZ
	O0qiOR/EoM9uScVdvTmsfhlZMCC1TsdeWAasv422xLoC4IjILYLknPSYjx5ml7kt
	ay/4/M9rP0DG2o3A9qy8hnLPQc913Ae37rp+lMtk9JgLCjokHhTRlCrKfi1pQIol
	Z9MVRL+8O+Taks4nnMFog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790261770; x=1790348170; bh=7Zf7UhNhsq+m5MHp88ue4Z8T5ykpaIrCSq+
	h+GNOPCQ=; b=aMPccB4LzKgv2Xl1CNxzJ73UiN5MKUgG/oEdnwiKYnX5zpJF2TG
	mn4D4KVJDD4I0oKD0ssm5mVkC7rOg9JFJ0Xb9GNja2S6SSFhLDGCF5MOG2Rg7j4b
	/cvXnk2SKsemTcRb0L4nKDAVoodVT0i5tz65LSx/dB7KPhD88Okej/7aCmY2B5YZ
	y1xzAcD0X5aTTJPL1EAEQbLLHY0vL/jJTIjqJFZ+eoWRMFBkquJEz6Op4/pVHG6P
	hXvI6mSgArLS7oThmhiS5Gwc7QjyYY21QBTjwqBltKyz/G1iWlpiJYAPm30fBdpK
	Up4qJNtYm6aH7OKvuzAxSCNscxFg+O5+ryQ==
X-ME-Sender: <xms:CTq1aqMj3BEof6H8wXpOcmnU5RgIQXLHncxJ-c8HBUg3x-xtZDGAWw>
    <xme:CTq1amlZo-SECRR8BthPpV5zmDwOG8Tw_yHo9DrpDQ03elrnbSedxlhGSGp2f_hic
    -Jgbz4G0XO8OhoE2wn9-MeQO1HFIT1dl2W2J0_bLfuXoE0nDUZBxxJ9RA>
X-ME-Received: <xmr:CTq1aor55WVV1F4xbvZ5FDEsTqHWnovtamqVKzkfhdp690ho1iVkSDkFUJQ>
X-ME-Proxy-Cause: dmFkZTEm121JmsM5WFX6TDLqpqwjAt7B+uos9puGugA7o1qqmXn88fL/H1ePvop0i/LXov
    tPO5Pnpg8ogWRE+0d8EpdKh/RBdx0uQvC0VQz8189EvnP/wykjNIOc1B0SJFOlQ1PaU+I1
    gjE9nHMd1cSXU6xngE0kLMDSZyBacVjLV82trwEaG/PnuK6kMM/do1fIDzvJmA5fw9nPfQ
    AaUhBhZ3MAIwIcipCOw7vmFKav9t/s9TlH3hq/mfjrI6JK6lMVc3JbTHXQs6p6y3q6h338
    U+OOVetaNL6J1uwACNrE1BxVgbkDqcdhOioMAQW7Aihn5Ovbn8Ozoekz6wRpUq1Halt6mt
    q5lcgBomB966B7loBHPC1FVIe4WdBPkf71raIa94xKztjMOiDEkgVQT5/E7itPP+V7vR75
    Mk9wbVCBUWhT0aJSy3N30xSkYyyMlXm1n6J8w+gS9Sgue2CEtlvvSNwCp1PdLOXHLA0EkB
    uitFyJnSXrhX1GU082B5DMQ7WNc+NPiXn5+MqOgrZNUFEf09NwvlkNU2ryUHila/NRUYly
    +qwSoNb5gEFgzPqLpq2WNiwhopg93ssgd0VkKBrq4fCguyD5JxNeIyrkCNocCxs407vLxH
    USrxOFH31bvN6HfunPc0guB6RELJytiKi9n9Skre+6hY7J7EK0yAwV953B2g
X-ME-Proxy: <xmx:CTq1ai4IfYpnICN3DRz00cedHKLxWpYDCdpZ0GUbR4VjFOrXfbAXcw>
    <xmx:CTq1aqKH5cRSwQSmG4--GspL7Av_fuelDj1Gqedz6AQX4PdjEIXEEg>
    <xmx:CTq1aunMfXY0yTA1O7moWbdamrt2Ipa65I4lFcldxIS26jxnwdUF9g>
    <xmx:CTq1ah_gU3l04Crgfzd-keoASyegxIuNES11KRezM2No5GQIEGrebA>
    <xmx:Cjq1avwcFPhORVd0Fvlf4EKrzNy-iiimWmbTJPDwhURH52l6Q7bh-Fx_>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Sep 2026 10:56:08 -0400 (EDT)
Date: Thu, 24 Sep 2026 15:56:07 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v3 09/12] mm/collapse: open-code collapse_single_pmd() in
 its two callers
Message-ID: <arU2L6CDg0FlC4yI@thinkstation>
References: <20260916093145.4022188-1-kirill@shutemov.name>
 <20260916093145.4022188-10-kirill@shutemov.name>
 <0b421935-d83f-473b-a21a-e7f29f8585e3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b421935-d83f-473b-a21a-e7f29f8585e3@kernel.org>

On Wed, Sep 23, 2026 at 03:08:55PM +0200, David Hildenbrand (Arm) wrote:
> On 9/16/26 11:31, Kiryl Shutsemau wrote:
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
> > holds and, when the scan found work, gives the lock up before running the
> > collapse.
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
> 
> I'm not sure I see the benefit. The code in the previous collapse_single_pmd()
> callers certainly gets more messy?
> 
> Is there some other patches in this series that depend on it or what's the
> motivation?

The locking. Scan and run have different locking expectations.

I tried to explain it multiple times. Probably not well enough.
Let me reiterate.

The scan reads a PTE table under mmap_lock, fails often, and does not
drop the lock to move on to the next table.

The collapse allocates, may sleep in writeback and takes mmap_lock for
write itself, so the lock inherited from the scan is no good to it.

collapse_single_pmd() hid that boundary inside one call. It dropped the
lock somewhere in the middle, on some paths and not others, and
lock_dropped was the only way for the caller to find out.

With the two calls each has one rule: the scan runs in the caller's
locking context and never touches the lock, the run is called unlocked
and takes what it needs.

There is nothing left to report, so lock_dropped and mmap_unlocked go.
It is the same move as Nico's da98790891a4 ("require collapse_huge_page
to enter/exit with the lock dropped"), one level up.

It also makes moving the scan to per-VMA locking trivial: the caller
owns the lock and the engine never sees it. I said as much in reply to
your note on v2:

  https://lore.kernel.org/all/aqQf9hSy0iNjnL6t@thinkstation/

Patch 12 depends on it, since madvise.c gets the two calls and their
lock rules rather than a bool.

On messier: what the callers gained is an mmap_read_unlock() where they
decide to run, and what they lost is a bool telling them whether
somebody else had dropped their lock. Each caller now takes and drops
its own lock and knows it, and the engine never touches a lock it did
not take.

That is more lines at the call site and a simpler locking rules.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
