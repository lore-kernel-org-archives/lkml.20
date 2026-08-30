Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F48E272E6D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788050572; cv=none; b=mbnC6fD8v66nM7Cxs1pQqz1c1zquY7FJKnBjWGQ21jBsKacC2Vkf30vu37Ezwdt89IRX0WdjteHt7jFRdZ5cgukoW5TabfDZ9iGCh4w6XmY8mRlGj/cveFD6zvqUmVt+DSNxX+RD7X3EHWnaoFATD3QQ6Kn+6r+7nY4/BDAdB5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788050572; c=relaxed/simple;
	bh=s5BKx2iSb8vLDzDquPpMfTn4fC8nKKZAdun3GFk61z0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GuJ3JBSszGdvKxvElKkB+5r4VBBP4S6D+dHiPSXJw2cCUU2OVMTaVVK7NBaodUEg6+421dwGzAuh8/hGrS6kWWD9nGR0sHZGap7FR2Jq+yYMOiTHJ0hs/A2jJfWmpYkiNYLRu5G+tO1rNO3mhcUwMAgXERiOSkcp/YhgoWVD/00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zxNO408o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zxNO408o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A761F000E9;
	Sun, 30 Aug 2026 00:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788050571;
	bh=maR1l87kHhHusUVm0LI9qVbcTjv61h6QEJDc+PMNXcY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=zxNO408oaOfEa8+UlW7umi3SreTJuVDWLj6UFBsCNWwGdbpZhuSRvgyyldQeQ+0Rb
	 6TeRd8ozQpqOQE+nnwCwpTvODnmhRnJ2IWuc3U99L0+C3Yhh/OSlgetDVrDGnSpVPg
	 U/GW3MPU1iMX8N392ZtuwFT9JX5Yfu6XP73VTNmU=
Date: Sat, 29 Aug 2026 17:42:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng
 Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, Youngjun Park
 <youngjun.park@lge.com>, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Hugh Dickins
 <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Peter Xu
 <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed
 <yosry@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 0/2] mm, swap: don't spin on a bad swap entry
Message-Id: <20260829174249.d723a5f0c29b9eee8d59826b@linux-foundation.org>
In-Reply-To: <20260818-swap-v3-0-d3fa52598a59@debian.org>
References: <20260818-swap-v3-0-d3fa52598a59@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Aug 2026 03:06:22 -0700 Breno Leitao <leitao@debian.org> wrote:

> I've seen some machines at Meta fleet that show the following type of
> problem:
> 
> 1) It gets some weird warning:
> 
>   BUG: Bad page map in process khugepaged  pte:f000eef300000017 pmd:00000067
>   addr:00007f57c0a01000 vm_flags:20200073 anon_vma:ffff88829af7c340 mapping:0000000000000000 index:7f57c0a01
> 
> The corruption is most likely the collapse/PT_RECLAIM race fixed by
> commit 366a4532d96f ("mm: fix the race between collapse and PT_RECLAIM
> under per-vma lock"). But this series is not about this one.
> 
> 2) Then the fault never makes progress. do_swap_page() returns 0 when
>    get_swap_device() fails, so the fault is retried, reads the same
>    entry and faults again. Nothing in the round trip changes the PTE,
>    and the same line comes out on every pass:
> 
>   get_swap_device: Bad swap offset entry 3ffffffc043c5
> 
> Patch 1 makes get_swap_device() return ERR_PTR(-EIO) for a malformed
> entry, keeping NULL for a device swapoff is taking away, and converts
> the callers. No functional change expected.
> 
> Patch 2 uses that to return VM_FAULT_SIGBUS instead of retrying.
> 
> The rate limiting patch that used to open this series was split out and
> posted on its own as a backportable hotfix [1], per Andrew's request. It
> should land first: patch 1 here touches the lines next to it in
> get_swap_device(). This patch will probably conflict with [1], but the
> merge should be trivial, given the only change in [1] is the
> addition of the __ratelimited() suffix. 
> 
> 	pr_err("%s: %s%08lx\n", __func__, Bad_file, entry.val);
> 	pr_err_ratelimited("%s: %s%08lx\n", __func__, Bad_file, entry.val);
> 

Thanks.  The patches have bitrotted a little - get_swap_device() was an
easy fixup but please double-check that I didn't miss anything.

Or perhaps just refresh-retest-resend if there's any doubt.


> The rate limiting patch that used to open this series was split out and
> posted on its own as a backportable hotfix [1], per Andrew's request. It
> should land first: patch 1 here touches the lines next to it in
> get_swap_device(). This patch will probably conflict with [1], but the
> merge should be trivial, given the only change in [1] is the
> addition of the __ratelimited() suffix. 
> 
> 	pr_err("%s: %s%08lx\n", __func__, Bad_file, entry.val);
> 		pr_err_ratelimited("%s: %s%08lx\n", __func__, Bad_file, entry.val);

oh, you already said that.

As usual when inspecting our error-path code, Sashiko said "you all suck":

	https://sashiko.dev/#/patchset/20260818-swap-v3-0-d3fa52598a59@debian.org

These things do seem on-topic for the changes you're proposing here, so
please take a look?
