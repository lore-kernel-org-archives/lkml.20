Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686753;
	b=y30RQ1ksQM37mocxBYPPhBna+WxLhWIiBrM04KN0F/3zgYB/6rkTAlnxCEegpr3Gi0iB
	 cBdI8hVup3cwvbs6+UTi575P9GkKeT6bUDwhVPa16qv9POl6wIGkrbivTsFztXQZetWGF
	 Le2f0sT8N1SsDGt+QBTzMu3bH14VTGaWvsB4gZ1yVN25dWMv2IgrPyH6RfU5uToWb85Yf
	 TT+/qJuGLX1BK2bNd/V+S67cxJn0VKVTwPQCVim9TxD+Rr0hNctiWxIlII3s4XbPOuXzK
	 oI7fOT/0Ete9dFbq/RXQIAtfWXSjX4j1Pqtea3qXa5UM8V8en+klL2JF3uC95SAYqkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686753;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=O+E03NrkWyAgYx/OnIv1Bo6JdTIFdK42G1CbBxjO+jc=;
	b=5kmEkjYVYmSF4kO5QTPHBLqVfl03lpp5hNmg6W9K0LwG77ulr+fyat1FZ2EJoZ3A//Eq
	 Uwp3v0HGLXYQurfDeVovdlWhcbXDqy4vDtvBDe+A7xWizE6wz3GvQ+GuTZg1eGw/v/oI5
	 wHwaG/J8WGyz7tsVYITvVCcqope9uGF7YToftIGZzdNIZVASFfljhZ+q86Gkt6HkAsdWq
	 MLR49Klzc5BpHCfVCVexFr/noSAvr23kk8L6xG4et04CFgOLQeSXENT9VRWLqQOX49Nhi
	 eJ1t/nG0sICRdCDAUXxIRieJrZROljptmuRP8JCSLVEcsUhTxOJgDVu3CSLmzY2ExIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CFqeP8ej;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC33606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CFqeP8ej
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O+E03NrkWyAgYx/OnIv1Bo6JdTIFdK42G1CbBxjO+jc=; b=CFqeP8ejq/ch5RAZMGMFhf2vvi
	j7JcjPQ10biIlynhtR6++MCr0kLdhl4bT5RLJV1dUPOu7vH3V3K2aCCk/9R7R8zqDeksgzvYqcGdy
	ljPNXS3YpBmx+hbojquHp6eAsQBFOFfLxUodOB3XC2VIlFEUcO3blNZXkPsyqlsBTgbU24+U4XZgn
	v3IK6jIyKgcNfuHSGFk67VkdYLXOmeV/JP4Yj2jPKaO3XVPCFGTLItKW8QEbsM0UEleARiiHpby+g
	Svxfmf7+Ny8VR1E1N3L+wLMKhaiILB9kmCnCYCPMZDk0PgqD0KyK/Z278FxBankkujXc0hXyKeGvS
	PRKROQow==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJviO-0000000EUsO-3sxh;
	Thu, 22 Oct 2026 16:32:29 +0000
Date: Thu, 22 Oct 2026 12:32:27 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Florian Schmaus <florian.schmaus@codasip.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Ballance <andrewjballance@gmail.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/3] maple_tree: fix two bugs when freeing RCU-mode trees
Message-ID: <dtet2zelrbzt36i3jbwgsi5iv3nnwtlhtnhbgdvj3m3kzewcvs@vdgjqdivisf7>
References: <20261015-maple-tree-fix-slab-corruption-v1-0-160d97f7304c@codasip.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-maple-tree-fix-slab-corruption-v1-0-160d97f7304c@codasip.com>

On 26/10/15 05:11PM, Florian Schmaus wrote:
> Destroying a non-allocation maple tree with MT_FLAGS_USE_RCU defers freeing
> its nodes to mt_free_walk(). There are two independent bugs on that path,
> both caused by the metadata that a maple_range_64 node may keep in its last
> slot:
> 
>  1. mt_free_walk() takes the metadata of a node with 15 children for a
>     child node and dereferences it.
>     Reproduced with: 2768 ranges / height 4
> 
>  2. mt_destroy_walk() takes the last child of a full node for metadata
>     and corrupts its pointer, so mt_free_walk() frees a bogus address.
>     Reproduced with: 120 ranges / a full root
> 
> Patch 3 adds a regression test for both cases to lib/test_maple_tree.c.
> 
> Testing: on x86_64, in the userspace test harness
> (tools/testing/radix-tree) built with ASan and UBSan, the new test fails at
> 120 ranges without patch 2 and at 2768 ranges without patch 1. With the
> whole series, all maple tree tests pass. The full suite also passes on
> s390x (big-endian) under qemu-user.

Thanks, but did you see Dimitris' patch on the 5th for this [1]?

I believe this should also resolve your issue.

[1]. https://lore.kernel.org/all/20261005-fix-maple-tree-range64-rcu-v3-0-ebe7fb278e20@cslab.ece.ntua.gr/

Thanks,
Liam


> 
> No in-tree user is known to hit either bug, because all in-tree RCU-mode
> trees (mm_mt, sparse_irqs) are allocation trees, whose nodes keep the
> metadata in a separate field.
> 
> We identified these issues on a CHERI [1, 2] system, which provides
> fine-grained memory protection through architectural capabilities. Our
> CHERI Linux port uses plain RCU-mode maple trees for CHERI-based temporal
> safety via revocation and destroys them after every revocation sweep, which
> exercises a path that in-tree users do not reach. Unlike traditional
> MMU-based protection, under which zeroing the low bytes of a node pointer
> silently yields another "valid" address, CHERI invalidated the damaged
> pointer: the partial write cleared its capability tag. Consequently, the
> kernel trapped at the next use of that pointer, and the bounds of the
> faulting capability, exactly one maple node, pointed to a corrupted maple
> node pointer. We then reproduced both bugs without CHERI on x86 with the
> userspace test harness under ASan.
> 
> 1: https://www.cl.cam.ac.uk/research/security/ctsrd/cheri/
> 2: https://codasip.com/solutions/riscv-processor-safety-security/cheri/
> 
> Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>
> ---
> Florian Schmaus (3):
>       maple_tree: do not descend into metadata in mt_free_walk()
>       maple_tree: do not clear the metadata of a full dead node
>       maple_tree: add a test for destroying RCU-mode trees
> 
>  lib/maple_tree.c      | 19 +++++++++++++++----
>  lib/test_maple_tree.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 4 deletions(-)
> ---
> base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
> change-id: 20261015-maple-tree-fix-slab-corruption-d1f098521d15
> 
> Best regards,
> --  
> Florian Schmaus <florian.schmaus@codasip.com>
> 
