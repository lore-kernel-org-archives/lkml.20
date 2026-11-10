Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301395;
	b=VG1JpG86+KGkZk7kcusdSjaPsSKFtRHIKLbcVif0xJ8PYKv7U+pSx06GEEadSDXq7zIE
	 wTYoAi1z+Lxf1h+0ZXmOIw48pfPUms0g7t+W+lsD3mRZIb3s2/ukvhZvfJ8vRAi6CLnPu
	 uD94cfzDSZHqYgP5eLrx498md1cIR2opeAnDb+SVkmkMQQ2/r5hHDtf+vkBSm3eES+6pu
	 QsTB4eQxWXF3D6pdIn1iNubi++yLnUz4a1YxEndSf1tdRLkMtS2dFJLDfFVWYPlYkw62v
	 5MJKSVouIt2g1MSkTkz+BcOngxU58Mz/ilnATWyx6A1tsZLmku2GjSMX7yWv23RUShg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301395;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UN7p19OyMGXLbamSH+wFhIULRO0LLyPQSfmopQ5zmR8=;
	b=XIJp5Yhz8T2cSTLHa3nOX7PxPGDwoCl9QGlyT1I8Yv35PKfdCVKKr9XthHT1rREnSUEs
	 KYZ1n84eWWf1YGTwbmVRgosJ/5Lb7tvOu7MROpFdbYL9L8flR45Pi05FLql6QDvr9a6pT
	 fFS0s2ooWRRB6ssWhjI8gmOCAmIduMVIk9uEtVhJ3DfV0uHjCo3+jda84OJRNve6rjxE+
	 4u0DuNgwqbCG6Y0tlxQj7DAfoTrTH6nXP1P9p6brBwb6Z/Ch7KL/FI4Funsqfq7FMG/E6
	 DiV9M2c7rn/Bd12dQFNGEeHBE1gaR8FCbUo5YJVo5luD6MDv3HJNufgqaJu4G9XAkjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jK0tcEmI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44782606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jK0tcEmI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311FF1F0089F;
	Tue, 10 Nov 2026 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794301395;
	bh=UN7p19OyMGXLbamSH+wFhIULRO0LLyPQSfmopQ5zmR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jK0tcEmI6igUednx4vQE+N+S9Pt1y2MTZIPDnTORJ1w7u0Jp4RlT7h3iB2fs4pAm2
	 MDv82EhQ6mUJCZZEiCrSxh/5x44BchElAtu9KGvEOBGXZQf62MmVVdDztXpJUdVktd
	 W2txIj8pH43MoyVH0iKT4SoZ4memPQJteZyPXtd8p367EgCYI1Wd7NIW6M8KcNAJhz
	 pNOYo8iYoJUNQiDOdrK5Y3NO5xPK/juuel1NYPZV1E0xl/ACXjzmpxXtkRBhqP9NT4
	 vfGC+rakO6TDbUwCIKxqx7O1WhdxZOILv2zXGj18EQ0gpoF8b8sxo+3UomaKszNdtW
	 SBfRKIosVA6Tw==
Date: Tue, 10 Nov 2026 11:03:10 +0200
From: Mike Rapoport <rppt@kernel.org>
To: n3rd <18670333770@163.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, peterx@redhat.com,
	ljs@kernel.org, akpm@linux-foundation.org, security@kernel.org
Subject: Re: [SECURITY] mm: mremap() merge silently disarms a userfaultfd VMA
Message-ID: <avLdzhUz2uUIEGkR@kernel.org>
References: <10acf436.5b2b.1a1c45e0bb8.Coremail.18670333770@163.com>
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
In-Reply-To: <10acf436.5b2b.1a1c45e0bb8.Coremail.18670333770@163.com>

Hi,

On Tue, Nov 10, 2026 at 03:31:00PM +0800, n3rd wrote:
> Hello,
> I am reporting a security bug in the Linux kernel.
> 1. Affected kernel versions
> Linux v7.3-rc7 (mainline, built and tested as 7.3.0-rc7 with KASAN) is
> affected and the issue was reproduced in two fresh QEMU boots plus a
> control boot on it.

...

> 6. Suggested fix
> mremap_userfaultfd_prep() must only drop the context of the range that
> was actually copied, not of a pre-existing VMA that absorbed it. Either
> have copy_vma() report whether it merged into a neighbour and, in that
> case, restrict or skip the reset, or refuse the merge in
> vma_merge_copied_range() when the neighbour is uffd-armed and the
> caller does not have UFFD_FEATURE_EVENT_REMAP. No upstream patch exists
> as of v7.3-rc7 and no patch is included in this report; one can be
> provided on request.

This was already reported [1] and fixed by commit 68cb098eadda ("mm/vma:
avoid broken uffd merge on mremap") that is in v7.4-rc1 and is tagged
for stable.

[1] https://lore.kernel.org/all/20261020110748.959870-1-shawnq1@163.com/

Please check the latest upstream before sending reports.

--
Sincerely yours,
Mike.
