Received: from mta0.migadu.com (out-226.mta0.migadu.com [91.218.175.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA7337E5DE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526196; cv=none; b=b5u3MGcBK4maxjfX0lKHAoU2lGiLxV55SeCc4XHeujqHFq9rozeTxa4qrkPSW459BeQDziavx0a/ZH0StwbKbtMdwEDSIW+7cVyuATOoxJxoQl+YO3IX4n7CfZYu1Q/uRO07Kk+Ws6fVy5DnKFVvEGgKCs4lLmIn1VNdWxFzbXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526196; c=relaxed/simple;
	bh=7Dz4fms3T/cjCdtsDYuHqhdriRacQBPm6AH3anwvlj4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DRVeZMs1CCbU2PejMo6wzQ+jYxdD7Jr5+v1lVjtq/yHyImdCut27K9See9LtmtltzO+1Ve1pREzuy6e7Ksmgev/DNmLAIgAejdCHLMV7TYC+wTQJze8VM8GF7ME8J0lPQwAEWZ61gJJXdJevq5Nbr51UHGhWOEW2F1j7L5IOfik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ttFq3DWY; arc=none smtp.client-ip=91.218.175.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ttFq3DWY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7Dz4fms3T/cjCdtsDYuHqhdriRacQBPm6AH3anwvlj4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789526186; v=1; x=1790130986;
 b=ttFq3DWYHJZhgvzRXlNISEXYnO9+a0TLmYENr95Sir8R3XqPdJSJAmgdHapbjlea+8ffH6HQ
 bG8OH1LIvXMk/RLyxUtd7KxUxdHXZUepRxw2IDAJC2LHDSlrO3LFXerkoKiwEpVoOiaddVCJ1u/
 oFz3PkKYN5o0RLu7RsIA41gE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 9d20baf603adb599;
	Wed, 16 Sep 2026 02:36:25 +0000
X-Mizu-Trace-ID: 9d20baf603adb599
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v3 09/11] mm: memcontrol: constify the swap accounting
 helpers
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260915-folio_memcg-const-v3-9-c239a6010b58@columbia.edu>
Date: Wed, 16 Sep 2026 10:36:09 +0800
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Kairui Song <kasong@tencent.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chris Li <chrisl@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>,
 Youngjun Park <youngjun.park@lge.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 cgroups@vger.kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <B52CEE68-38E0-44BB-A375-E733BC5BD37F@linux.dev>
References: <20260915-folio_memcg-const-v3-0-c239a6010b58@columbia.edu>
 <20260915-folio_memcg-const-v3-9-c239a6010b58@columbia.edu>
To: Tal Zussman <tz2294@columbia.edu>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 16, 2026, at 07:20, Tal Zussman <tz2294@columbia.edu> wrote:
> 
> mem_cgroup_get_nr_swap_pages(), mem_cgroup_get_folio_swap_margin(), and
> mem_cgroup_swap_full() only read swap counters and limits. Constify
> them.
> 
> Remove externs from function declarations while at it.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

