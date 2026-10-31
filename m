Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793444138;
	b=zeTsygx3FRgM2FPzVaJS0BS1OxNMG/O1y1q14DiEBnNo9xBV29dyagozhRmagTuyI2q3
	 QS184aw9akH0BPnpHSiRTqdK+SMc2ZvFwDxBGvnmy398TONj90OCkmP6cK61+0jF2+ixZ
	 /gVI1mh40x9TG50wgSYguvdZpRsdTHOZP1zTDNILCCDgBM9VsSXLYVHW08UvBDxcrTHKa
	 OYGj5I+Sxe5mYYD2gxzTd9LNqEt7tHVteDfoOqsFBxFPIfSeVOBOog01llihBx4ScDE0N
	 IZYb4+ZqPCaLhTKpuMuh1Y13Y+Hk72wjxyPzqslithvTNz78h5TCwF7tq7tQiOFnegw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793444138;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=7b46y4s0/zi9X4zHo11yWW6Vbp88X1A148hn2dA9HOA=;
	b=TrEgMosOtw2IO/6E1XKnBnBBRJARc+L4ieTNHvjrSLB5hfhaLC491t6BrbYL344aJ7G+
	 IFI4hplk5RtsRrdh48yGG1SzRIHZ9rTuoJGNzc5wOug3iQ5fGQ4s9SVNH+PUdHo6TTZqr
	 QPn4YKJB+hqgX2AK4p3bcfD1RDcnT+duC6h04x1H46yGn7hlKjFmMjIJd4Vf5agazIgZb
	 +xv90uNXMjrQ7FMkJ2fgtSAVeRfcn3agPouLnhMWsCHo5LfeKsjhZ0q7Q/hMvoLsXMbtD
	 Zwa2M/HcswqVamllC6aKpsjBRUurjLj8wTKXz/InlIeZf8ze7GcE7e6jVOfEFaCAX1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LX0RjJQJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DD0606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LX0RjJQJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210BC1F00919;
	Sat, 31 Oct 2026 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793444137;
	bh=7b46y4s0/zi9X4zHo11yWW6Vbp88X1A148hn2dA9HOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LX0RjJQJpWdppLt42SNRn7EQV2Ff5N7jMe3itfLCjplO/MRkUZIp3jFNWvcrwA1mQ
	 UcCj6Mk2yZ8lLHHTQDlrfQDnCXDNASSI3GyG08p720TBjS7E7BDx/hdhXgrHg1QsO3
	 LbeRvsMZBc5KtLwSi7wWODzYoqe6aeCx8rzl2jQQSBqaCz+nLmFTtRvNi8zQ4mcSLK
	 IWFp1W844QfHer5jTZdGQvH25z2biHGD6EeJx++6y7oK/Hf2tF4RjSoEn4R3z8Xtnk
	 8m+5hfjRvvOela8b76hyVYCr8+w5vrvKSzquGangM6VzaPOpzRyecLva2TLMDrvoyV
	 b8B8LK0WZHFHg==
From: David Hildenbrand <david@kernel.org>
To: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, David Hildenbrand <david@kernel.org>, 
 Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Pavithra <pavrampu@linux.ibm.com>
In-Reply-To: <8b853e5f9f16145859407b28af654b0f79e12642.1793318297.git.ritesh.list@gmail.com>
References: <8b853e5f9f16145859407b28af654b0f79e12642.1793318297.git.ritesh.list@gmail.com>
Subject: Re: [PATCHv2] mm/huge_memory: set the mmu_gather page size in
 zap_huge_pud()
Message-Id: <179344413383.15514.17004105179365165951.b4-ty@b4>
Date: Sat, 31 Oct 2026 11:55:33 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Fri, 30 Oct 2026 05:37:36 +0530, Ritesh Harjani (IBM) wrote:
> Unmapping a device-dax mapping with 1G alignment on powerpc radix kernel
> built with CONFIG_DEBUG_VM triggers this warning on every munmap:
> 
>     WARNING: mm/mmu_gather.c:176 at __tlb_remove_folio_pages_size+0x38/0x230
>     NIP [c00000000063d508] __tlb_remove_folio_pages_size+0x38/0x230
>     LR [c0000000006fb688] zap_huge_pud+0x1b8/0x2d0
>     Call Trace:
>      zap_huge_pud+0x170/0x2d0 (unreliable)
>      __zap_vma_range+0x1604/0x1e20
>      unmap_vmas+0xa0/0x1f0
>      unmap_region+0xb0/0x130
>      vms_complete_munmap_vmas+0x120/0x310
>      do_vmi_align_munmap+0x1ec/0x240
>      __vm_munmap+0x148/0x220
>      sys_munmap+0x28/0x40
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: for-next-fixes

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/huge_memory: set the mmu_gather page size in zap_huge_pud()
      https://git.kernel.org/mm/core/c/0ba86a16

-- 
Cheers,

David

