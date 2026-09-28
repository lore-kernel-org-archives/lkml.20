Received: from mta0.migadu.com (out-83.mta0.migadu.com [91.218.175.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEEA347533
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564977; cv=none; b=pv8lleGtQtZ4yFLDJymAbZMu1MQma0qoo/2K7GHNuyESqO3p2ExPnl0TjzZsZ73XoHn6oq1J9Wlfr5ABs8lCXcCdu29qW2j0X7R2Zm+1SwGsvU2kOLzbLJszMUFrWLbfLfAh8aGpOUSurmyB2fJEVvyRtGF3Y0NShvZ7wFoVIGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564977; c=relaxed/simple;
	bh=2m+NU9deBab6lT4HoCkvMMoFBLuSQjYvO/0juA/rOEI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=J1H7ppkr4tl7R9CoEenpvCE3QFjyy19w12x4zkF+wIUEYAUFhNDtJ77jb5Pp2hMKLjU5/hdz23mXwuvYsjbzviGpOfKKIkS7Kx5MiJMb0nsspuLSeT6UtADXS4f8eMTZHi+ERMNAUvBbxpKZRpETYiJnE1s3feEdCIuSJyScx8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tFuFBTPF; arc=none smtp.client-ip=91.218.175.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tFuFBTPF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2m+NU9deBab6lT4HoCkvMMoFBLuSQjYvO/0juA/rOEI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790564972; v=1; x=1791169772;
 b=tFuFBTPF96qxlbbzscreEqcfkjw3woBis79wdlBuTOC2LUcf+i00J05QKkx3GQExQbo/zVQF
 mm+DZ4IDEqVFRBMKXwiwKTR8gDvQlwu9JMScF11waOErvP4oKIxwaBTkd5KcxqJmO+u3UYt5N6y
 H0tHy1BheLxiCtR/QJ+Vl6QI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 2350573a62ce507b;
	Mon, 28 Sep 2026 03:09:32 +0000
X-Mizu-Trace-ID: 2350573a62ce507b
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v4] mm/hugetlb: fix overbroad MMU notifiers for unshared
 PMDs
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260928024723.87708-1-lizhe.67@bytedance.com>
Date: Mon, 28 Sep 2026 11:09:16 +0800
Cc: akpm@linux-foundation.org,
 david@kernel.org,
 osalvador@suse.de,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 aiqi.i7@bytedance.com
Content-Transfer-Encoding: 7bit
Message-Id: <47EB85CB-D961-4A41-9842-A842C9E620C3@linux.dev>
References: <20260928024723.87708-1-lizhe.67@bytedance.com>
To: Li Zhe <lizhe.67@bytedance.com>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 28, 2026, at 10:47, Li Zhe <lizhe.67@bytedance.com> wrote:
> 
> Hugetlb currently expands MMU notifier ranges to PUD boundaries whenever
> PMD sharing is possible. That is only needed when huge_pmd_unshare()
> actually detaches a shared PMD page table, because clearing the PUD
> invalidates the whole PUD-sized virtual address range.
> 
> For hugetlbfs hole punch, and similarly for other hugetlb unmap paths,
> a shared mapping can pass the "PMD sharing is possible" range test in
> adjust_range_if_pmd_sharing_possible() even when the hugetlbfs file does
> not currently have any shared PMD page tables. KVM then receives a 1G
> invalidation for a 2M operation and zaps unrelated secondary mappings,
> so the guest has to fault them back in.
> 
> Avoid this by tracking active PMD-sharing attachments per hugetlbfs
> inode. The count is incremented only after huge_pmd_share() successfully
> installs a shared PMD table, and decremented when __huge_pmd_unshare()
> actually detaches one. Since huge_pmd_share() can run concurrently under
> i_mmap_lock_read(), use a 64-bit atomic counter. A zero count is used to
> skip the conservative notifier range expansion only after excluding
> concurrent PMD sharing with the mapping write lock.
> 
> On a Redis-in-VM workload that punches cold 2M hugetlb pages, this patch
> improves P99 QPS stability while punching pages, reducing the QPS
> degradation ratio from 7.09% to 1.45%.
> 
> Reported-by: aiqi.i7 <aiqi.i7@bytedance.com>
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>

Acked-by: Muchun Song <muchun.song@linux.dev>


