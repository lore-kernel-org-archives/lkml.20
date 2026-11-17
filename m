Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906569;
	b=g1zuHlgphV0DMpfXwTYdlzxRcMFuPEYJDOERxLqzE0mEePLNLdz7dDUg6V0nNh9gSJS9
	 zt4XWXw9Hu34CmKWCD4yGtQmNAtQm1KITu1CFx58+92Uz1u7oAoKtn8rfRRPIk+cGSBmm
	 HUyni3ElshhvlFFVWLpJTma2Cwjgwbfhi+Ol6GThr2rwJAoeyd13b+jq7LgdYuDrkc7M+
	 oFiAmZ0Xm2+SM/gqVWeIs5ugN7I+30x8RWR0ggESOc3HPaeLaeQhB6F77nwiPaIx/TC6L
	 QJp7tnK00lZnvw0KJIxpKowXFb4kGuw6x51Zsz8Nt2A9Zksx3/ffewUf4ZDgiXjFNJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906569;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=4j68du+QqrdYo0mkRinPnN6ZWQftz36UXeshS3GPhUU=;
	b=Pv83yMDMoHMjM+ARyrfl7YeuvezabjO0hfkI/MfZMyl14ue/QLOnydC4vk897SIZ23gH
	 iJ5F9Ctv3L+uJtxrXNAx5+kczrMuwLwoel+csTnLopzPW9QJuJt8gB3REQ2hQk38A+nj4
	 4XAcxiHlOEEkHh/kebSnd947GvkuROAnYKjEPtw2kR6f4o5e9Y4MRM+eSWJCeN1R/+qOm
	 16H6hjNTD+REkhyERpO5AKVrsYkVBgz9Uxv7YpKUq7ZYXptzsjNJFf/vjIvXA2UoBV8JP
	 +aa0OhNaW4c409sgybguvatmUItyOkXHY0OkCvKquSYBKRUtGSpMIEWjbHVUEnRe2xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LPKRQb4y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B5E606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LPKRQb4y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363FA1F000C4;
	Tue, 17 Nov 2026 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906568;
	bh=4j68du+QqrdYo0mkRinPnN6ZWQftz36UXeshS3GPhUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LPKRQb4y3SHB6n3wVr1JYri8GotsV4oPdRPiR7zJmJl+MCdWBR7m0MtshOnWULYbD
	 mILxrFFNR+8elVObe9U4VmA/qcWXHKIZQj2Q/QYPRMwjdMO3wJzwNRRrr3D19oIAQw
	 9dKedsp+767EKn3I4Ss3VBqATSnODpHwizcox1dTBgL35Y/6wEACwcxVRfWhiYJpOq
	 Q6Q+9XEHctPxSdKec3MweC6MTNhlLJvXLYl7oegwCRlzcJbFiu3NGRhJnIKCYE4WIs
	 28Ygfi+PXtHDm5fsH3HPB87RPs3IwoBU7F6K3J166GdKhJJnJ+T/Gj0X8flMtjfv62
	 Bip8OHjqOpiTw==
From: David Hildenbrand <david@kernel.org>
To: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: riel@surriel.com, liam@infradead.org, vbabka@kernel.org, 
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev, 
 qi.zheng@linux.dev, baohua@kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <71980310d9bf1bf9733ea0e4b772635e1b2bc5c5.1794886401.git.baolin.wang@linux.alibaba.com>
References: <71980310d9bf1bf9733ea0e4b772635e1b2bc5c5.1794886401.git.baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2] mm: synchronize with PTE table reclaim for all
 folio sizes
Message-Id: <179490656487.3795.10506084518247823925.b4-ty@b4>
Date: Tue, 17 Nov 2026 10:09:24 +0100
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

On Tue, 17 Nov 2026 11:40:22 +0800, Baolin Wang wrote:
> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
> with concurrent page table reclamation via zap_empty_pte_table().
> 
> page_vma_mapped_walk() is used by many functions including try_to_unmap(),
> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_ptes(),
> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_unmap()
> and try_to_migrate(), the other callers do not perform post-walk accounting
> checks, so the race has no observable impact on them.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: core-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm: synchronize with PTE table reclaim for all folio sizes
      https://git.kernel.org/mm/core/c/bf4c270e

-- 
Cheers,

David

