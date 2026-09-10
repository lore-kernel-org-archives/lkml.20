Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069C3876DF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081533; cv=none; b=hhfE+2wIXl7QEWzxQMa51+/Q5fmqUjEtEmXA75RHMQm73nQfHb+auGo2RmlGHP9eWL1gq31owfgGSxKGT761RqIMuNqAhtr88t99+UOmik44Mr89zzQjJ8uMWqf9r+atHOYeXmTkkBDtbzf1GQOanp/WoiZOjpYNwYHxa+fuZ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081533; c=relaxed/simple;
	bh=EYxqIBRnHdPzMGItZOP96wrO/LDgbK1BMtGLH/fKksw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YRXfJWMgy3ykMxk7ehOyrCgxqnhPhuv11sjeapy6io1OZNotgDIpNDnaEmhFp5NC5FV0RxxAvOVb9f+3qmwfXEHLOO5C7Ej50sv/jgKlauj6d/qG3zkpC8uPkhKOexifg05yUf3J+zng3EFP29sRx8OcHMhnlyuCtLPmJls2+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=le70C3Mw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="le70C3Mw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2CA1F0089A;
	Thu, 10 Sep 2026 23:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789081531;
	bh=amOPDCiAno1NOdE5Q6HrVP/LyJBGQ/6Zm7f6CaXwps4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=le70C3MwovpeE01RxcZJn1UDUGEwvptIsnglPECn2vVXSRV/mOw5SMBvnbaToZ4S0
	 qTPlQuNwI5FWDEAR2xG5pt1/LdXA8KsYnFb5axvqc9ICceuZGWpSJuV2FGZ1pCNsNu
	 n22fMkC50Uit+9LFUO5g6CN8eiTL6aPhvywiZC/U=
Date: Thu, 10 Sep 2026 16:05:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, David Hildenbrand
 <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko
 <mhocko@suse.com>, David Laight <david.laight.linux@gmail.com>,
 "Liam R . Howlett" <liam@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH v6 00/17] mm: Introduce section-based vmemmap
 optimization for HugeTLB
Message-Id: <20260910160531.64390c48445e8844b6f672ea@linux-foundation.org>
In-Reply-To: <20260910063256.64386-1-songmuchun@bytedance.com>
References: <20260910063256.64386-1-songmuchun@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 14:32:39 +0800 Muchun Song <songmuchun@bytedance.com> wrote:

> This series is split out from the earlier, larger series "mm: Generalize
> HVO for HugeTLB and device DAX" [1]. While the parent series generalizes
> vmemmap optimization across HugeTLB and device DAX, this subset addresses
> a single, self-contained step: making the generic sparse-vmemmap code
> section-based optimization aware and switching HugeTLB bootmem pages to
> this path.
> 
> HugeTLB vmemmap optimization currently has its own early boot setup
> path. It pre-populates optimized vmemmap mappings before the normal
> sparse-vmemmap population code runs, and sparsemem carries
> SPARSEMEM_VMEMMAP_PREINIT only to support that special case.
> 
> That makes the HugeTLB vmemmap optimization path harder to share with
> other users of sparse-vmemmap optimization and leaves a fair amount of
> HugeTLB-specific boot-time state in the generic memory initialization
> flow.
> 
> This series introduces section-based vmemmap optimization support in
> the sparse-vmemmap code and switches HugeTLB bootmem pages over to it.
> Instead of having HugeTLB pre-populate optimized vmemmap mappings
> itself, HugeTLB now records the compound page order in the corresponding
> memory sections. The generic sparse-vmemmap population path can then
> allocate or reuse shared tail vmemmap pages based on section metadata.

Thanks, I updated mm-unstable with this series.
