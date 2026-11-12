Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476095;
	b=1IE2UMMvwaTW3rP0N+fFBvZsEl/SF3nD57O6LyK/BoJprOSdwqTPBRtFu+bPvlfICy04
	 BjXo8qKSOGH0wT0VIRyImyPenpFiX2RVnl7oNyHUFqkSHkUaOJb6nX5QcNunQ9GKEIe7X
	 Qdt4+c3MM7xGXKRfBg7o4rxQA9xBCKjIpNUJYYXsDg6G+jgY6xejz3vr56/WDHQ8ervW6
	 kPgrDSX59YDa4QU5P1bW2Z9rOBloJnkt8ID4gVlEPT1ODusl77GCl/RAWpaBy18nY1VQK
	 05mQJ9khLFidwAJD3y4Fona6qFAu7dsjok2HBUNcpieJnE1nZ+InihHCi6K6W/TtuHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476095;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=BrmqFnFm0Fnej2HGsU0ZSQgM9jSZMkI8yD3YIvJQY0s=;
	b=3bBpF3mHBwoNOpyEjbQkbKFRxjUwh6sSAzIPGNMyCgPxqf1V5s2Ns9OoGI/F2vS+1lrq
	 pDblUdmTL1jwFnbZ7aTWpH7JBmAijCjeAQpzKUVCnzGEVstfBax0YlqwSJUNugIos9Anb
	 5JLHF8VHptfTja7+sHPrDexmebeEyesp7VBH1WnhwUPO4Hck32zrI72A8JlH4gc9gllWe
	 1RcCV0IVN2p/a+TSN8BcgNAvMY5xTZIJF7EQfAutn+a4dW8CQhQb/JaEfQyyJ+BQSFqg1
	 gcYJU+VJBo5MJGg0T6V6sggMksuaZ+yGoNa5Oq1Wk9iiK4/R5y4B+3AKtzjzdQX5HxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bA27PyGi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DDE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bA27PyGi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD8E1F00A05;
	Thu, 12 Nov 2026 09:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794476094;
	bh=BrmqFnFm0Fnej2HGsU0ZSQgM9jSZMkI8yD3YIvJQY0s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bA27PyGiV14EHzMQZGXh8JlDE+YN78Cia6oj4U4zlRghXTQFJnVCagtxF8gqX2tR2
	 eIX3U1Z3TJWH2iW/3zP8bwvlkqnQ2bpyMmO939SLDCFAI1V8bdPORBsep5U/VZfXvS
	 QcPcFE3EbRuTaw2eLNRclKE78TzNERTYUjamotvDLJbSJGvGSDwEpo1byIvQ/r7Yy3
	 wFZhGXvsFIhJWqK2pbYv9zBGB+JsRvziQJeKCZSAzSVApeVAfARDfsPGXxzLywby9c
	 RZh6RbqHBRoPrmi5s+qX4KBL/85nsBYppl1GoX7wqWRhm8bsZ/9nG4PGvO4lp1nORw
	 xG/YdGjA767oQ==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Gregory Price <gourry@gourry.net>, 
 Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>
In-Reply-To: <20261023161003.59086-1-ekffu200098@gmail.com>
References: <20261023161003.59086-1-ekffu200098@gmail.com>
Subject: Re: [PATCH] mm/mempolicy: remove unused mpol_is_preferred_many()
Message-Id: <179447609182.5924.14252894771386618225.b4-ty@b4>
Date: Thu, 12 Nov 2026 10:34:51 +0100
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

On Sat, 24 Oct 2026 01:10:01 +0900, Sang-Heon Jeon wrote:
> Since commit a492abe28bec ("mm: hugetlb: move mpol interpretation out of
> dequeue_hugetlb_folio_vma()"), mpol_is_preferred_many() has no callers.
> 
> So remove it.
> 
> No functional change.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: migrate-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/mempolicy: remove unused mpol_is_preferred_many()
      https://git.kernel.org/mm/core/c/ae06b0a9

-- 
Cheers,

David

