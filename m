Received: from mta1.migadu.com (out-237.mta1.migadu.com [95.215.58.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB03EDE60
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042774; cv=none; b=Rg8BqAWqpR6YqO/L0F72AiR/o7A11xGBm06mdCFrxM8zpsyva+ivkangzJ4Hq2OUkyGN7r7t97WnztlelagWtRLXuV7KY+losvZ22Leh+8onKf6Xng0CrgWPtY7rwLRTjHvkKOSYVgaGnFHydl9ewXWdJBosu2nygKz7QfcpUp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042774; c=relaxed/simple;
	bh=7FbM2+eg5UOfZmuq9hM1PptzWVaYqJbij9uFNK5DEfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jz2F8KoJMEEH+TCzS8/ZrpyuGM3KfLX8v7+MzYdIDAE0rmZkjV2hvxcsDl/sepfrMXhDAGn6gLLi2l5JzMsCoRjo17mAOqX/C0vW10LOKMMnPsCE6N9spvYCOzGxYiPkX/XVDNpqVB0reGztMD7Zo8rNcSxvitssgpMgKHBF4YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=plnongdN; arc=none smtp.client-ip=95.215.58.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="plnongdN"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7FbM2+eg5UOfZmuq9hM1PptzWVaYqJbij9uFNK5DEfE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792042769; v=1; x=1792647569;
 b=plnongdNlx/ABXxa3ODTNMeAa9/Ne7seuCIHHmuMvF8xSjU91QiUZkvIHCR28Ei+7C3ETtMH
 f7YCkRrt4N3aXa/cmMYrJ/qVmdwgvBKTwLllIxv6/V25nxQCXh/Q7VlF4+z4t30UsN8qU2Uy2q5
 ZXEmzh00Kbkh/ClF0/f6FY5Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d9d6b683631b8ce6;
	Thu, 15 Oct 2026 05:39:29 +0000
X-Mizu-Trace-ID: d9d6b683631b8ce6
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
Subject: Re: [PATCH v5 8/9] mm/collapse: call collapse_file() from collapse_single_pmd()
Date: Thu, 15 Oct 2026 13:39:20 +0800
Message-ID: <20261015053920.64675-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261014171145.3292736-9-kas@kernel.org>
References: <20261014171145.3292736-9-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Oct 14, 2026 at 06:11:41PM +0100, Kiryl Shutsemau (Meta) wrote:
>collapse_scan_file() reads the page cache to decide whether a table is
>worth collapsing and, when it is, calls collapse_file() itself.  The
>caller cannot get between the decision and the collapse.
>
>Move the collapse_file() call up into collapse_single_pmd(), so the scan
>stops at the decision.
>
>Two things change with it.  The writeback retry re-runs collapse_file()
>alone instead of rescanning first; collapse_file() repeats the scan's
>checks under the page cache lock anyway.  And mm_khugepaged_scan_file
>fires before the collapse, so for an accepted table its status reads
>SCAN_SUCCEED; what the collapse made of the table is for
>mm_khugepaged_collapse_file to report.
>
>Preparation for splitting a collapse into a scan under mmap_lock and a
>run without it.  The file scan has to stop where the anonymous one will.
>
>Assisted-by: LLM
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
