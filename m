Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DA3175A9D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792107993; cv=none; b=Ahhok6kIZk40x2P40WFjRNQTBGsHM4Ud7PPKMhfzuzkxQvtN4BKfoAI+tp+mU8GNga/9jgEC9k5DvHxwCRTEW5omCAo1mEN3DlVG7FdhlTNs01CJAgm8t6XCLAzKwum5NyvKZCeuAH43cqBZIMPml1pmhBbbK+TmnIKq7ULEWjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792107993; c=relaxed/simple;
	bh=aH74MVx3BGtVwFNBQAulWRD6pbPpCPyEXrP7DWy2gVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVIHldDGrf7/1Cogtzjm5cvNCZsTcPc4wRmyfOznbseGzHXoNvOY2bMo9Nfd9U1Daglpm1L6pHvhBD1PVJpVmgFZfg8EZMmwcHn0yY0xZuG/dAIXcmX5RqUrXyMSs+nOGIhLgkvuQuceKnz4OXvsP451peZ5T3xZSGIzE0RNJv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knPQqBoa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knPQqBoa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243021F000C4;
	Thu, 15 Oct 2026 23:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792107992;
	bh=KEyBJjOxNHoPN44Ocnab3KH7ph4eN7qBE/3bFv4RRfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=knPQqBoaOSqw1cr48QtzRQ/zK7rsfJesZfj99LIFjlhYY5GL4GRM+09iaRBEacJOA
	 PpW4f89PVRrRa1qaJMXKjPxyYChpmVbmMarHlxKL8oubRYUGRHaf4eTi1eoAmfcs/A
	 z+XALiNhJa4Jg7YLKsIC7/UnO+1MLl6GYroHZiMEo7kmvWSJB6qdNAZTnRBI4GuWST
	 qI/h0y3dJZQmFPfrNNM2OP699l8jk4oH+1CaLnhXtKpUprYoaVt+q3h/AEY48e/NUN
	 0e3CjIjs4puKXlP5mldmRCGiUCT3VzCtNW8QX6wleq3YP0pLnIWO2wHU8yHoGXwDbr
	 mH9dRa8rPmzVw==
From: SJ Park <sj@kernel.org>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: SJ Park <sj@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mm/mempolicy: convert mempolicy refcnt to refcount_t
Date: Thu, 15 Oct 2026 16:46:24 -0700
Message-ID: <20261015234625.113115-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015231322.3392551-1-gourry@gourry.net>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 15 Oct 2026 19:13:22 -0400 "Gregory Price (Meta)" <gourry@gourry.net> wrote:

> struct mempolicy uses an atomic_t as a pure reference counter.
> 
> Convert it to refcount_t so that overflow and underflow are caught
> by the refcount saturation checks.
> 
> This silences the atomic_as_refcounter.cocci warning, which started
> matching __mpol_put() when it switched kmem_cache_free() to kfree_rcu().
> 
> No functional change for correct callers.

Looks correct to me.

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610061946.Bx22ZFrw-lkp@intel.com/
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
