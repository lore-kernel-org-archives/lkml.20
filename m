Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB0D446070
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389991; cv=none; b=oErKUSBvCemuqSS1xW7NAZTb+c6pWbQT6Tw9AMq+VeqegVKoVBcsSgQCiqypCPYBzmJVICUv6XACMM28nsBt9lrobz235klKnRdO96BtLvlFvWPT2XDaCHQOJy+ayOcj1IwrjDVdjeetQcccdt5ig0aYpoyoWRi+DajM9FKvocw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389991; c=relaxed/simple;
	bh=PAV/4XheBnUf+eFjtLAnGVj+GexcIqJdwTJ4MJKQQW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VG4c5d+ZVzDUohE2HrtQw4lfRteBOc4DCLGcVRundADFoGj5Wnmj9EXrffLwWn6iiNIfhb15SWNzKgFGZQ8jtffZWvXZvH0qpYs+qeEl4cPoQe6oZ7SMYhwC3ujRlvau+UGVnLx8Cly3dqCk+0tblJKqb2IY4IEJ5sTB1Ybtpu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uIKbwKcY; arc=none smtp.client-ip=91.218.175.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uIKbwKcY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PAV/4XheBnUf+eFjtLAnGVj+GexcIqJdwTJ4MJKQQW8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389987; v=1; x=1789994787;
 b=uIKbwKcYZyCaoxBI0E+BHHHL1fHUMPgZ8/Seh92hzEYCrSeNItNMP16tdc63+62CWMODQX5O
 e852tTZOmSb6Eh3GEst20ThLvkwT35LyfjAwpDvjzMafDgUupNlnhmnAc6kVgAkX7gSqWYQcxwr
 ddm9939IKX3MVC/Og7DQ51js=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 01c12c3a66a72b2b;
	Mon, 14 Sep 2026 12:46:26 +0000
X-Mizu-Trace-ID: 01c12c3a66a72b2b
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com
Subject: Re: [PATCH v7 00/29] mm: PMD-level swap entries for anonymous THPs
Date: Mon, 14 Sep 2026 05:46:22 -0700
Message-ID: <20260914124623.331589-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914114320.12988-1-usama.arif@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Sep 2026 04:41:52 -0700 Usama Arif <usama.arif@linux.dev> wrote:

> When reclaim swaps out a PMD-mapped anonymous THP today, the PMD is
> split into HPAGE_PMD_NR PTE-level swap entries via TTU_SPLIT_HUGE_PMD
> before unmap.  This series introduces a PMD-level swap entry so the
> huge mapping can survive the swap round-trip and do_huge_pmd_swap_page()
> can restore the PMD mapping directly on swap-in, without waiting for
> khugepaged to collapse the range later.
> 

I somehow messed up sending the v7 series and only 10 patches got sent.
I have resent it in [1]. Apologies for this, please direct all reviews to [1].

[1] https://lore.kernel.org/all/20260914122950.3283997-1-usama.arif@linux.dev/
