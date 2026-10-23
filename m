Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743510;
	b=k8gkX9WJvcZjbRwI7T/D7/URJw/pKyfDNe+yQadb/G8mDEyAoDaVAnTWuf/SH5MxgNtf
	 kYV/4EGskwz6sWyQi3JqqL04fVgDtx/EK/vqT5VHMzLEFDREHOYj+n30r7rOnSjL6aJ48
	 p8ObDzY9Lb5GKTbSsq8D2a7NOsiLQWXHIZSBnIOeg+rHdoMIgbgQxgN9Eh9EKTJULCfBi
	 zBooOPEoIAyMB0ecMjV/l87BGzkOvJo/Tt4bdhyr1VgwiRRPktNnHEqJyl8HHBk8pvePp
	 13o0NSWHjoXCWeel62zSNahgxJLgzK8cNHzy7rOT/GHEq9oWu8LVSlCdQaA1X/FFEHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743510;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=prHVcZI7ZOeGWeFdFfhU7LU8KIRKEIpIOhbDbC0BxoY=;
	b=UKOxNAUKYTisQFVaBU39eshOpAdjYWDEcWdqqu0irSRIp141lXmA7BME5VyE8zer0EnY
	 rIb5pCkItm3VEuLzBNqqpZVmwH7zWLviB3Ba+u3lJtLFEgLlLb6x16UoMIGCY+tw0zNi0
	 HfpFmkvAmuO6n6vB3CD+UHVKstAJggpkiik7mysoR1hn3D7bTY+hQHHkaXZ6ew72OtrLT
	 ZtnDo14nJnKWMdxh5QgkIyqmH0K7DjAIHytvNUbu1vegIvQ9Y2p/AHUv2Z6vcdOEYI4P9
	 kq7MqO2yP7faeq8Hrf4dsJEBA/v4krXAGR4IA+DjRn5HktJtSAvQ9/qeAdCaNEZXldQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hCY7sdiA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06298606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hCY7sdiA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55B31F01825;
	Fri, 23 Oct 2026 08:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792743509;
	bh=prHVcZI7ZOeGWeFdFfhU7LU8KIRKEIpIOhbDbC0BxoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hCY7sdiAqdyG+S5ZJnzwRNcuf3xJP5Ev73Lay/aIUuHLTU+IVehh4YYIlZl7rOZNM
	 Ec4Mx8SM+w8ZR/+jplutOn3FRG+fsv0RxutkYJ4TOFTnGlJj+Bt+wOCfuOclSCOT2l
	 8gfF83+R7ag4xA2J1hXGPG3ahvNkwt07Yh6wV1dCikJOQVgS1MZoh97iT7eayWW6B3
	 0wnYU0dkfwyclWs4SA7TCTj6g1pBXWshZK05dwL0w92hw2CwlQg7N4Z6hESp5KaJ4g
	 IIBDtdtKQnq1JE2QEWqSJCbe0pkAGZIfJ9SVeKeWTOHbfFaqXhfeE2bZvKrFOakCDv
	 H0j7KuZpodGWQ==
Date: Fri, 23 Oct 2026 09:18:24 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Jakub Matena <matenajakub@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] mremap() fails VMA expansion when VM_MIXEDMAP is set
Message-ID: <atsWop95CHj6oTSU@gremlin>
References: <20261023023106.515365-1-luizcap@redhat.com>
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
In-Reply-To: <20261023023106.515365-1-luizcap@redhat.com>

I'll look into this but obviously we won't make mixed map regions mergeable (nor
were they ever), that's completely broken.

The most recent version of the mm code (which is going to be send to Linus soon
in this merge window) documents why:

/**
 * vma_flags_can_merge() - Do the specified VMA flags permit the VMA to be
 * merged with another?
 * @flags: The VMA flags to test.
 * Returns: true if the flags permit merging, false otherwise.
 */
static inline bool vma_flags_can_merge(const vma_flags_t *flags)
{
	/*
	 * VMA merging assumes that a VMA's flags and fields completely describe
	 * its state, which is only the case for mm-backed mappings.
	 *
	 * Mappings which are not mm-managed may have established state upon
	 * mapping not embodied in any attribute of the VMA.
	 *
	 * Additionally, private (CoW) PFN maps encode the source PFN of the
	 * range in vma->vm_pgoff, which may otherwise cause spurious merges.
	 */
	if (!vma_flags_is_mm_backed(flags))
		return false;
	/*
	 * hugetlb mappings contain per-VMA state, so their flags and fields do
	 * not completely describe them.
	 */
	return !vma_flags_is_hugetlb(flags);
}

I'll dig in + get back to you.

--
Cheers, Lorenzo
