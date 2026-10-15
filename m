Received: from mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAC1328267
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043051; cv=none; b=dzR2dEqVv9WlHfVst5aaAw2T3ptD6AIhOombxzf/wP744Jb2buh8FraO6jJDLLmGNCyWBOmTGGisKkVnsuGDtOVNbCIVGZaQ0KgtxFqkOR/3YjDmjC82MYj2nTf3bIYDDqa+XHNc8z7otjGJwfJCRT+rKhu5pAWs4or+9k99JAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043051; c=relaxed/simple;
	bh=v+4Oxbknnw5zvosEcJfstlpki+qDanDvF0iTNHtcWZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i8HFo5odtTbWJxaI7a2Es4Bmx49fUD1CogOX9GWpDYAd+dJzExqDminwThoTjReS9TMv6qV9CwgRepSd2u1P6MPn6BylBVzamJkWYh0OpF90ZOqAh5UcpHV9K5zsxca1smlF/vWJPWpRH+6D90peas03hrpPy0eXmnN/UxVyCK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T2QrYAnN; arc=none smtp.client-ip=91.218.175.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T2QrYAnN"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=v+4Oxbknnw5zvosEcJfstlpki+qDanDvF0iTNHtcWZk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792043047; v=1; x=1792647847;
 b=T2QrYAnN7r4pHFbnp0GoFy3gx0QOeDHO3lgBfNXTAIlGF0nIa6uQB6Uia2d6MrhF60Qkn0Xa
 B8nxRSPSNK5RnluNv64lmw670lJgtuZ08hHMrUgQ34JMUDRE0wFzNA83/7zZNn4JIfAUiTGp/1K
 zO+TQ9CLhaZoiYegpJLPDTFE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3d19a9c5ef5547b4;
	Thu, 15 Oct 2026 05:44:07 +0000
X-Mizu-Trace-ID: 3d19a9c5ef5547b4
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
Subject: Re: [PATCH v5 9/9] mm/collapse: separate scanning a PTE table from collapsing it
Date: Thu, 15 Oct 2026 13:43:58 +0800
Message-ID: <20261015054358.65376-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261014171145.3292736-10-kas@kernel.org>
References: <20261014171145.3292736-10-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Oct 14, 2026 at 06:11:42PM +0100, Kiryl Shutsemau (Meta) wrote:
>A collapse is two jobs.  One reads a PTE table under mmap_lock and decides
>whether the range is worth collapsing.  The other allocates, isolates,
>copies and flushes, and wants the lock given up first.
>
>collapse_single_pmd() did both, so the boundary between them was somewhere
>in the middle of a function.
>
>Give each half its own function:
>
>  - collapse_scan_pmd() scans one table.  It picks the side:
>    collapse_scan_anon(), the anonymous scan that used to carry the
>    collapse_scan_pmd() name, or collapse_scan_file().
>
>  - collapse_pmd() does the collapse the scan asked for, and is handed
>    what the scan returned.  SCAN_SUCCEED means there is something to
>    collapse.  SCAN_PTE_MAPPED_HUGEPAGE means the page cache already
>    holds the PMD folio and only the PTE table is left to retract.
>    Anything else is why there is nothing to do.  It calls
>    collapse_anon(), formerly mthp_collapse(), or collapse_file().
>
>For now collapse_single_pmd() stays, as the two of them with the
>mmap_lock drop in between, so its callers see what they saw before.
>collapse_control_init() sets a control up before its first scan.
>
>What the scan found and the collapse needs travels in collapse_control.
>For an anonymous table that is the orders and the referenced and
>swapped-out counts.  collapse_anon() and collapse_huge_page() now read
>them from there instead of taking them as arguments.
>
>For a file it is the file itself and the offset in it.  A file collapse
>works on the page cache and never sees a VMA, so the scan takes the
>reference while it still has one and the collapse gives it back.
>
>The file scan moves under mmap_lock with the anonymous one, where before
>the lock was given up first.  The lock is now held over the page cache
>walk, an RCU walk over one table's worth of slots with no PTL, and taken
>fewer times.  collapse_scan_mm_slot() ends its walk whenever the lock was
>dropped, so a refused file table used to cost khugepaged an unlock, a
>trip back through khugepaged_do_scan(), a relock and a VMA lookup.  Now
>only a table that goes on to be collapsed does.
>
>Assisted-by: LLM
>Acked-by: Zi Yan <ziy@nvidia.com>
>Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
