Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788299;
	b=ItiFn2aqFXb27C2VWU+HJF+mZnY1yVlm+FlaDWct1ETNURz0hXUAA6/4mHHySlmrSVlD
	 wyOz5xXtCmScig9vz8PTtXJ8mzrg8ubGBZg35P/YOUe/+0Vbt0yGjAEj9ClXxjcLmrwAU
	 c5GvXYUrKgVnLC6S3AjBDMriHHAc5coqXv5ggaPick9ckj69PfmwJzyadFn19GW0AltUZ
	 ft1wbc2u4XTvMPhEdrUFTpXaSFrhnLbWSvSaZVnreANqo5REsmocWPqqvrzDnt8Kb5BRt
	 PUECaJ2KSkqrHBw9zahXg1dJEiMiEvbCNeeCjSFGAwtzDSzviB2YJ+H5lzg1Vagrw8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788299;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L4FLZcP43DZnnGwB2Ff/3PX8AXs5+l2GsOb5VDmefFY=;
	b=Ww70xvoalcNCXxKbxwS+aaII5LUAbL00tzAKtZDi7Cng8+HnN90drzgZVYepgOrYSiEL
	 Oc8wFl995M78Jw9+WyRPoIdVrinPYwWpBtglbUJfmNdLGZGc/k699B0nxjDjSHuWf5Icg
	 LmJQxqoZLq8KgLMCr2lT9NPPqjzYD/tQ0B/L2p8X3/mE922+Tx3r3szDCbKf85O90voyC
	 XHsvC4/92NXf0pS3FiPFBAq3UICPKA10WFWeAZoF5GIK+kIQugk/5rRFBALchKPhM/+2N
	 ChqueeApnbgAuPdCCZZ/v6co4js9rE2SzxWFJoHo07VPsJ0mDBQuTcbz6cGfYPbH4rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BckKRnto;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C73606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BckKRnto
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75BA1F00A1E;
	Wed,  4 Nov 2026 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793788298;
	bh=L4FLZcP43DZnnGwB2Ff/3PX8AXs5+l2GsOb5VDmefFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BckKRntoBWtnIaO1wAT9iKwLdh7ctP/N2hyM2T7ImOR+lBQOkxttg3u2XtBw3EZTR
	 VUUTzXly3EpovKme4CyI1X5JXbwUHb2Q8Q4gvEnwz8yZX1SOcF5cGF2WrZa9G3TToU
	 5DNAdHpqkJD8uGBH4AW0F7zmRNa7YRbeRsYD9QHZtYj+l3nrqyNurxVHkSutfMRY21
	 OKhsJtGUy0QDs4kdKisIwrBrUo+8tZyPoMi837Ex+eDS26Hfc5ubQhOvMw7JEh1m3K
	 1BnZ7mKnFMLNUoF1vS4NopGIf7mmixPEWyBQxeKqi6lQPqCoeSSpGoE3EJc4dS+dCf
	 Ke8peo41Ws8eQ==
Date: Wed, 4 Nov 2026 11:31:31 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/12] mm: hugetlb_vmemmap: simplify shared tail page
 handling
Message-ID: <ausJg1hMuE4UJDH4@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-8-songmuchun@bytedance.com>
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
In-Reply-To: <20261104023510.260766-8-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:35:05AM +0800, Muchun Song wrote:
> The remap walker currently carries a shared tail page selected by its
> caller, even though the optimize and restore callbacks can derive the
> same information from the folio being processed.  This adds redundant
> state to the walker and couples its interface to caller-side preparation.
> 
> Derive the shared mapping state in the callbacks instead, keeping the
> mapping policy with the PTE being processed and simplifying the remap
> interface.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
