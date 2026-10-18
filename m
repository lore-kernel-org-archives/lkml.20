Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BCA239E9B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792285455; cv=none; b=oIHopBMRzvI61MIkqq3kqtd4ZdQgoyA2R44AN3yUE161V2XRrruWI7JB4f0R20XNsr+X6EOIogAX5IxX+QhS6BAtBAfH6wBxzUhHkn9PN++kJiE0W2Fuzp8Wao7Wn/ErxmLeImAwmxSoAW60EnUQpUIXE6hvqz9dBde9R3yt7NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792285455; c=relaxed/simple;
	bh=NDvJpBkgXlJ9jleGf3wJQt0UZywvdyte7pZcLG/aMdE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CrBEpIQXyAtzOUavqgz8KZDicbXNh31RzkXzzu1RwQfERDJoyt4bKTgF2QDwrP1Vcipl0Rxzpy5C0WV4J1yJQvGvGKPt4qn6UIhlVGXZT2IkU/IM+TQvGspX/zrLau5vvOjaBVfGOA1H4DrHvuyxyj2npNnLFJtCrcFL/+vCkts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rQpNBk6P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rQpNBk6P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3131F000C4;
	Sun, 18 Oct 2026 01:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792285453;
	bh=yBzg1XnqQp2xTgPKm6aEo7hheg/CtG2kAo70FRWV5Qw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=rQpNBk6PIcbBYEEtVcMCyzy80nO9U+u4EV/iOS1fliNGnoTGiXg0V252S8AWxZsPp
	 3q/U+l5BlcKB9IibCRC4lVptDnbNoPCXsbT5riniSZD/gGa6hiibfTBZ1ms3t3f5t1
	 IwdJmCFc6rir3HRCpwCMKJEhgm90/Lem6T6/EFVo=
Date: Sat, 17 Oct 2026 18:04:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mm/mremap: do not charge a shrinking move twice
Message-Id: <20261017180412.a79a36e873c5268df126cde1@linux-foundation.org>
In-Reply-To: <20261017233527.797191-1-nickolai@csail.mit.edu>
References: <20261017233527.797191-1-nickolai@csail.mit.edu>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 17 Oct 2026 19:35:26 -0400 Nickolai Zeldovich <nickolai@csail.mit.edu> wrote:

> Since v6.15 every mremap() that shrinks an accounted mapping and moves
> it with MREMAP_MAYMOVE | MREMAP_FIXED leaves old_len - new_len bytes
> charged to vm_committed_as for good.  An unprivileged process that
> repeats such a call keeps raising Committed_AS in /proc/meminfo; with
> vm.overcommit_memory=2 it reaches CommitLimit, after which every
> accounted allocation in the system (private writable mmap(), brk(),
> fork()) fails with ENOMEM until reboot.  A loop of 1000 calls moving a
> 2 MiB private anonymous mapping to a 1 MiB fixed destination raises
> Committed_AS by 1 GiB.
> 
> mremap_to() first unmaps the tail of the source with shrink_vma(),
> which uncharges it, and then sets old_len to new_len so that the move
> looks like a same-size one.  vrm->delta, the absolute difference of the
> two lengths computed in do_mremap(), is not updated, and
> vrm_calc_charge() charges delta pages for the move.  For a move that
> does not unmap the source the charge only has to cover the growth from
> old_len to new_len, which here is zero; nothing ever releases the extra
> charge.  Before the vma_remap_struct conversion move_vma() charged
> new_len - old_len with the updated old_len.
> 
> Recompute delta after the shrink.
> 
> Tested with the program in the notes under QEMU (x86_64 defconfig):
> Committed_AS grows by about 1 GiB per run without this patch and stays
> flat with it.

So I'm training my LLM to do better reviews.  It sucks in Tejun's
review prompts which suck in Chris's prompts (which Sashiko also uses).
It also incorporates some of the prompts which Sashiko overlays on
Chris's prompts.

And now rather than just checking code I'm getting it to step back and
take a broader, more architectural/design view.  Scan the lists for
similar changes, look into the revision history to understand why
things are as they are.  Study comparable code sites.  One way I'm
doing this, which might be innovative, is to feed it some of the more
impressive human/maintainer reviews I see and ask it "what rules can
you set in place to make your reviews more like those people's".

I'd like to start using it on people so I can also obtain
author/maintainer comments on its reviews.  I can then feed those
reviews-of-reviews back into it to get it to learn and improve.

It's a work in progress. Here's what it said about this patch:


Hi Nickolai,

The code change looks correct to me. After shrink_vma() has unmapped
and uncharged the tail, resetting vrm->delta to zero correctly avoids
charging again for the remaining same-size move. I checked the other
delta consumers and error paths and found no introduced problems.

One changelog correction:

> For a move that does not unmap the source the charge only has to
> cover the growth from old_len to new_len

This is backwards. MREMAP_DONTUNMAP retains the source and charges
the entire new mapping. An ordinary move unmaps the source and
requires additional commitment only for growth.

I'd suggest:

"For an ordinary move, which unmaps the source, only an increase in
mapping size requires additional commit accounting. Here shrink_vma()
has already unmapped and uncharged the tail, so the remaining
same-size move requires no additional charge."

Two minor points:

- "Until reboot" is too strong: other processes can release
  committed memory, although the leaked charge itself persists.
- The vrm_set_delta() comment says "difference in VMA size specified
  by user", which is no longer quite accurate when called after
  adjusting old_len.

The Fixes: tag looks correct. Given the potentially system-wide
ENOMEM failures under strict overcommit, Cc: stable seems appropriate.

With those minor changes, I think this is ready to go.
