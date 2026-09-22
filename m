Received: from mta1.migadu.com (out-68.mta1.migadu.com [95.215.58.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80328542805
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082370; cv=none; b=l5CKjDPoTEKLuTCFYpBZApxLAI9UNVD/g09fRmmm41UpaftXX435gU++0sknE5/RcqqKq3o13fbnBxij3TANglQ75q/qwwIW8GewZG0l1qhHJ1TCmex5lCX1RoBje3mdRxN+Z+zNLMLQW+qy/9k4kGg4RfMSTrbx69FaRNQpsYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082370; c=relaxed/simple;
	bh=IvS+YyqlHz+K1r1LlmSG9IHF3Y0fYo9PEhMGEyAyhB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F5qk/CNxg2JODgcPcwMCYvZWgtFUIVj7JKSFajzYl/+JXiu8Z52Mkq+vGyJ75RQLDMqs9ZxwUQalE6AkVlIvgObHcFjS/VsUp5aSIbMFFYrm9uA7/nsHQVYieVem6f9K6D7jOoPJVvYDxAeEerouasMAVJDjL+gDMf+eGZhCNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=urDT+BM/; arc=none smtp.client-ip=95.215.58.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="urDT+BM/"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IvS+YyqlHz+K1r1LlmSG9IHF3Y0fYo9PEhMGEyAyhB4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790082365; v=1; x=1790687165;
 b=urDT+BM/utKAnQyIPaWgjXdeBXlX9GiHF+Vr4EgfEcMrCvO1kw9fiRoTk/nGOOy5SQU003ox
 oZPQVs6tAEnkp5z71VUtwsqkPkI5mswLnu9AWHm8iCLLf6SZWoN77EjbxGkaCPREhc2nqgXvo8V
 JMbv3KrD3uiGF+x9zWKKDjaM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 31c7473652c7ce96;
	Tue, 22 Sep 2026 13:06:05 +0000
X-Mizu-Trace-ID: 31c7473652c7ce96
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: gourry@gourry.net
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com
Subject: Re: [PATCH] mm/page_alloc: let the bulk and folio allocators carry alloc_flags
Date: Tue, 22 Sep 2026 21:05:58 +0800
Message-ID: <20260922130558.48402-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260914155115.439742-1-gourry@gourry.net>
References: <20260914155115.439742-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Mon, Sep 14, 2026 at 11:51:14AM -0400, Gregory Price wrote:
>__alloc_pages_noprof() takes an explicit alloc_flags, but the bulk and
>folio entry points do not, so callers cannot select allocator behaviour
>(e.g. an alternate zonelist) through them.
>
>Thread alloc_flags through both, matching __alloc_pages_noprof(), and
>keep the flag-carrying primitives mm-internal (page_alloc.h) so the
>public gfp.h wrappers stay flag-free:
>
> - add __alloc_pages_bulk_noprof(gfp, ..., alloc_flags) in page_alloc.h
>   alloc_pages_bulk_noprof() becomes a wrapper passing ALLOC_DEFAULT
>
> - give __folio_alloc_noprof() an alloc_flags parameter and moves
>   __folio_alloc_node_noprof() moves into page_alloc.h
>   __folio_alloc_noprof() is no longer exported
>
>No functional change: every caller passes ALLOC_DEFAULT.

Yeah, but what if a caller passes ALLOC_NOLOCK in the future?

__alloc_pages_noprof() checks alloc_nolock_allowed() first, but
__alloc_pages_bulk_noprof() can enter its fast path without that check.

That fast path can reach _deferred_grow_zone() or pcp_spin_trylock().
Shouldn't we do the same check first?

Or am I missing something?

Cheers, Lance
