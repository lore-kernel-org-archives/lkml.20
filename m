Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871634;
	b=zQgRqu1hdP2KiJ77tW97WVkcHC4yus16SiScqtlI0+Avyw3apZ93ULKxdnl6aw/ajUS/
	 6q03cCvZFpjw0rNxT0WtSfVePXLC2R04FBuw/nfY57pY7MmVdR2o3c1//AEUy82ejbAi1
	 h2xUhwd8I7DruOMELZNYBOeMJRWosF37n4bXoNCjVJTxjpM125OLMIn2de2BGMQRa5/ZW
	 +DHEtB51ZSXJddNDpHqAvIzsrT/pIsdHAd9GKKSc8x5aH7UkfdvW+3W9V7kYZVw5W9P/Y
	 iY5Jx625I+EtBTIN61cLwOotZW6PSCzXvHdoo9lc7dVfZ2VqiNF8Fnl414esUcoTOng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871634;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=fNJAaZwZg/NlUwIwsUXdsW6SMrErhNT8mcGAusSULhA=;
	b=iH+xTnfWbDcymbMpWqeEhE8qfqAEOKdDcqj34AAwODHcZ8P+4hEG6pCWHKHCgAwVJZWW
	 y+njCi+RyRQd8iUjLJscPRwkuJn+idxApMlWH1xVQG/MxzYoLFkxxp1en0YFTH3/OSmFT
	 F+bbybvoNsAhFTWAhLFACX382Qg/ZKmsrOadyuQ0vpn9lHrFuWREt3xTVOr8C9m01S+Se
	 W3wZI1HdvlLOskC0co7g0JB4Ky7DYmBsLoOInQ/1ACO4cnNFDUQz2CwR+T3BtHVFO3R2B
	 bd5gIP38aaKD/tbGOBbMYPJj78c6XvxM6e/6s0LtjCfSqE2KIaN30ZpT9yHQVsludXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFHZQ0+B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E29606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFHZQ0+B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1882F1F000C1;
	Thu,  5 Nov 2026 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871634;
	bh=fNJAaZwZg/NlUwIwsUXdsW6SMrErhNT8mcGAusSULhA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JFHZQ0+B2pCdL2m7OmeatH+nXT7ERwyRnjO7ucStV2zTSV6hDRBg7ZjO58r4XJNc3
	 6J19dRZjLktv4cuG8OHzMgprb3YQRgYMOlQq9iFkZ0CmH88laE+DtyMso0puQW7NVa
	 y0h9zTTDZXkIaxA/U7I/nnH+983gE7L4e8JIsVgpMQUrp3Qy8/Kbx2lRyIDxeiKBmV
	 YNwjargTypudlyx0E844Ecd0GEGFNuAxf1zSt+1m/yiUG7/b3dEtt+pMhqzmqQI75F
	 JyGXjN6Vg3Bpcp9rxwEDnRYKgBIqOtDyvplFEfTJ+5PHg4XvTdF7cURUslAGn0uYVK
	 5SKQXsEPknI1g==
From: David Hildenbrand <david@kernel.org>
To: David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, Rik van Riel <riel@redhat.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zhao Gongyi <zhaogongyi@bytedance.com>
In-Reply-To: <20261102-ksm-anon-rmap-fix-v1-1-68962acfb59b@kernel.org>
References: <20261102-ksm-anon-rmap-fix-v1-1-68962acfb59b@kernel.org>
Subject: Re: [PATCH] mm/ksm: avoid unsafe anon rmap dereference in KSM
 merge
Message-Id: <179387163181.11797.15205182972949028650.b4-ty@b4>
Date: Thu, 05 Nov 2026 10:40:31 +0100
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

On Mon, 02 Nov 2026 12:32:25 +0000, Lorenzo Stoakes (ARM) wrote:
> When KSM examines candidate VMAs in scan_get_next_rmap_item(), it
> accumulates (mm, address) pairs in ksm_rmap_item objects, assigning them
> via get_next_rmap_item(), pinning folios via a page walk in
> ksm_next_page_pmd_entry().
> 
> Throughout this operation, scan_get_next_rmap_item() holds mmap read lock,
> which it drops afterwards.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: ksm-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/ksm: avoid unsafe anon rmap dereference in KSM merge
      https://git.kernel.org/mm/core/c/d8d12d97

-- 
Cheers,

David

