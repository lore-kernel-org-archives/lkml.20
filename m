Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A7E1EB1AA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 00:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788654224; cv=none; b=c/L9REkP0xFMAQoePvnSSS1UGd787WVaAq9Encr4QQK49j0OQI4go88LPZnbx0knTlzO0ApSwlN+7K0ab1aPpLjuh6Qp7ha5EYf8sFMZ2sxNFAnHivFbiM3+Y7iz+dfwbCm3t/uInoRtqi3Cn64bh8w8UumNt2tfyTpSzT5GdMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788654224; c=relaxed/simple;
	bh=oXJWjhbmP5l/jOmACcC7bLuXBhHCubXjzajWaddl888=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NSO4EVApgGVqp5w4waov+vMLSfFsLBXoZUe3xP3CevfoD1a3z1qVeWrZ9QZWlP/WM8WUqcwK5Sx7uRxxTVIs7+h3uTpetQE+iA0YJrTwJdcezV5WwP4fuyxiuaC3kzMd/FIJKpAIP3vgc2U5nmMVWYH/XweAXVvwgsKJrdQGKcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hu8vYvlm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hu8vYvlm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FCE1F00A3A;
	Sun,  6 Sep 2026 00:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788654223;
	bh=o01Kye+IbaFrqz8jkXWQ4cSeCY/YwDxfGVu5J8CSFMA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hu8vYvlmaeC97R2YdQx9QbtsMFN3k+qnx85wubeA8lCOG2v5oiV5oyNwCQ/KtynNI
	 LMCsEWzrpuhUSTl2eSkb+u/pfSy8oiBqj866l9dJr/nqCSaOlg95sylO0c8NpdHbd+
	 EJZVMBz/6LYgMerXDnF3nahP9hmX/pLhCPYyZoNg=
Date: Sat, 5 Sep 2026 17:23:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, Zi
 Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn
 <jannh@google.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH 00/12] mm/collapse: separate a collapse from its callers
Message-Id: <20260905172342.72be31534af21871f8b13f47@linux-foundation.org>
In-Reply-To: <cover.1788533997.git.kas@kernel.org>
References: <cover.1788533997.git.kas@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Sep 2026 16:10:14 +0100 Kiryl Shutsemau <kirill@shutemov.name> wrote:

> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> [ This is the first of the cleanups I said I would front-load ]
> 
> There is no line between the collapse engine and the callers that ask for
> a collapse.  khugepaged.c holds both, and they reach into each other.
> 
>  - Sixteen tests through the collapse path read cc->is_khugepaged to work
>    out what they are allowed to do, when every one of those decisions was
>    made by the caller before it asked.
> 
>  - collapse_single_pmd() does both halves of a collapse behind one call and
>    drops mmap_lock somewhere in the middle.  Which of its paths dropped it
>    is not something a caller can see, so it hands back a bool and the
>    caller keeps track.
> 
>  - MADV_COLLAPSE's implementation -- the walk over the user's range, the
>    per-PMD loop, the errno translation -- sits in khugepaged.c, which is
>    the daemon's file.
> 
> So: draw the line.  State what a caller allows in a policy, split the call
> in two with the lock as the boundary, and move the syscall to madvise.c.
> What the engine offers is then four calls, with the lock state written
> down against each, and a policy the caller fills for itself:
> 
> ...
> 
> Behaviour
> =========
> 
> Nothing here changes what gets collapsed.  Three things a reader should
> not have to find in the diff:
> 
>  - Patch 5: khugepaged fills its policy once per scan pass, so the
>    max_ptes_* limits and the defrag setting behind the allocation mask are
>    sampled once per pass rather than once per table.  A table scanned early
>    in a pass and one scanned late are then judged alike, where before a
>    knob written mid-pass split them.
> 
>  - Patch 8: mm_khugepaged_scan_pmd fires before mm_collapse_huge_page
>    rather than after it, the scan having returned before the collapse
>    runs.  Its status field already reads SCAN_SUCCEED for an accepted
>    table, so nothing changes there; what the collapse then made of the
>    table is mm_collapse_huge_page's to report, per order.
> 
>  - Patch 10: which orders a table is scanned for is sampled once per VMA
>    rather than once per table.  It cannot widen what a collapse does --
>    the order is tested again under the lock the collapse retakes.

So is *any* functional change expected with this series?

I'm reluctant to merge an unreviewed v1, but this comes close!  I'll
sit on it for a week or less, see what people say.  Please poke me
if/when you think it's good for mm-new.

