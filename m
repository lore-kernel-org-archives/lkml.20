Received: from mta1.migadu.com (out-235.mta1.migadu.com [95.215.58.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC8C19DF62
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039145; cv=none; b=ihfFJjRKxAzgecznKb+ZADEcNx6OnYb/+PtI8/DfXysk7vNU39OCygIJRjxslX0sxSFKZhJih1xbK67nyQzCiIH474MjaliyiHiVuUoRgHlHez7mXSjcKq7lnoJQMeyE2nlv5QkyseozrSoqXTy8tJxqzwMnbKOeAJ1QmbJXhV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039145; c=relaxed/simple;
	bh=JFsUqK9yz6nBN5iUAJ9e32IybN4bnnnH2DWUUmALfcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N7xK6Iyu3LXdDJAuFOcf+BQQe0PGMtNPeIWqM3yeMl/C7BYyui+53LJIDFkf4fvkZhfEf6Ex6kEjS9WTHTiQHLXpNMEhXfG3ACPILob74SkhUrM1iF5cot2s2cZLrj5Dy+y8LDtXvhhhahHf7Xo7lDWMJ6bf4rJvbFDH1InKIwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OWog/lXA; arc=none smtp.client-ip=95.215.58.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OWog/lXA"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JFsUqK9yz6nBN5iUAJ9e32IybN4bnnnH2DWUUmALfcY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792039141; v=1; x=1792643941;
 b=OWog/lXA5VZDLVF2pC//6caNS6Gvc5+UTbSLxt7rmHASGKodDgbWh0jqO8VrlxwhNhNXf0po
 dJxunqEMNUAEMpmu3A4xCJThaX7oxI7HiTyt3MC3eED10wnAgb8IuFPBJXA26TC/jgwsz0IuH1F
 jVaUw3OnfHcjg7V3P1yXWABk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 90cb0f3fd8c9c893;
	Thu, 15 Oct 2026 04:39:01 +0000
X-Mizu-Trace-ID: 90cb0f3fd8c9c893
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
Subject: Re: [PATCH v5 3/9] mm/khugepaged: rename mthp_present_ptes bitmap to eligible_ptes
Date: Thu, 15 Oct 2026 12:38:56 +0800
Message-ID: <20261015043856.57881-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261014171145.3292736-4-kas@kernel.org>
References: <20261014171145.3292736-4-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Oct 14, 2026 at 06:11:36PM +0100, Kiryl Shutsemau (Meta) wrote:
>The name says less than the bit means.  A set bit means not only that the
>PTE is present, but also that it passed the other checks: uffd,
>lazyfree, anonymity, sharing.  The PTE can be considered a collapse
>source.
>
>mthp_collapse() then reads the bitmap starting at the PMD order, so the
>bitmap is not specific to mTHP either.
>
>Name it for what a set bit means, and update the comments that named it.
>
>No functional change.
>
>Assisted-by: LLM
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
