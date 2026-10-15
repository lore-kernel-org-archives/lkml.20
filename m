Received: from mta0.migadu.com (out-139.mta0.migadu.com [91.218.175.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB05255F2D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039463; cv=none; b=Y0DsY1cwj4CqikHb5E4pIIPwRRHPDv5zV3rbJaJP5v+Ma2zK6wjVGT6pj0MwYy9IlaREDTl3weAZHh/BY+kbbc45UOD2/+sklIx4mxnvwb3vHJUOoGLWRao9fUXTIcw/vSXCqKDBz6X4wAXKRqisUftHyLpZ0I7J2O8Zeh36Yac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039463; c=relaxed/simple;
	bh=aGlnLzyGCL/dDUNRQSSy9O1CUukazj9+owEk42tU4Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOqxhwijQ+ISPcSVo4OP4O1AD8+W+666l2ExNEW6baWay+SWdhoCmD77MtyjosR2TZKHgU0xhEHmRgBCCDndePSUb1lJ/XVxwx2P+31DNEkYl/JEZE+rOC5CZMSt0we5rQbdsw9qYzGUqXW1pOwXItB5RTNaAJJkAPqjoGLwo2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PkRYrnBL; arc=none smtp.client-ip=91.218.175.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PkRYrnBL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aGlnLzyGCL/dDUNRQSSy9O1CUukazj9+owEk42tU4Sk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792039458; v=1; x=1792644258;
 b=PkRYrnBLZZFWCXYAxaaCVkGcKqzqvPoCx44L+E5rg+xZj+44Ouk3JnTqPhCILKucMef6WZlr
 8lrNf3OHaqDAucJFqzivscxgmEtRIl7AT8wittC7jhn8QqZFEnevwBx4KrgvxIJJpdVZIlsPjK3
 vFDh1OpbN9DgBXNCtNnfLaqk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a0904006b7d12751;
	Thu, 15 Oct 2026 04:44:18 +0000
X-Mizu-Trace-ID: a0904006b7d12751
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: kas@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	jannh@google.com
Subject: Re: [PATCH v5 5/9] mm/collapse: state what a collapse may do in the policy
Date: Thu, 15 Oct 2026 12:44:12 +0800
Message-ID: <20261015044412.58610-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261014171145.3292736-6-kas@kernel.org>
References: <20261014171145.3292736-6-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Oct 14, 2026 at 06:11:38PM +0100, Kiryl Shutsemau (Meta) wrote:
>Tests scattered through the collapse path decide what a collapse is
>allowed to do by asking whether khugepaged started it.  Between them they
>settle:
>
> - which VMAs are eligible, and how hard to try for a folio;
> - how many empty, swapped-out or shared PTEs a window may contain, and
>   whether a sub-PMD window is held to a stricter rule than a PMD;
> - whether a range has to look used, and whether a MADV_FREE'd page is
>   left alone;
> - whether the PMD is mapped as part of the request, and whether dirty
>   pages are worth writing back and retrying.
>
>None of those is a fact about khugepaged.  Each is something the caller
>decided before asking, and the collapse code should not have to look up
>who called to find out.
>
>Add struct collapse_policy for the caller to fill: khugepaged from its
>own settings, MADV_COLLAPSE from the fact that a user asked explicitly.
>Every test becomes a read of a field, and cc->is_khugepaged goes, having
>no reader left.
>
>The PTE limits come as two sets, one for a PMD-sized window and one for
>anything smaller, so that the helpers pick a set for the order and read
>it.  khugepaged takes no swapped-out or shared PTE into a sub-PMD window,
>and empty PTEs only when the knob says all or nothing; the warning for a
>knob value in between moves to where khugepaged fills its policy.  The
>fields only one side reads say which: anon_ or file_.  David Hildenbrand
>asked for both.
>
>khugepaged fills the policy once per scan pass, MADV_COLLAPSE once per
>call.  That is the one change in behaviour.  The max_ptes_* limits and the
>defrag setting behind the allocation mask are sampled once per pass rather
>than on every table.  A table scanned early in a pass and one scanned late
>are then treated alike.
>
>collapse_file() also drops a NULL check on the collapse_control.  It has
>one call site, reached only from collapse_single_pmd(), which dereferences
>cc unconditionally, so the check was already dead.
>
>Assisted-by: LLM
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
