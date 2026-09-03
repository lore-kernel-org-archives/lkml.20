Received: from mta0.migadu.com (out-165.mta0.migadu.com [91.218.175.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505C04D90D5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458233; cv=none; b=AMAZVp+0XNuRfCWtHTVSoiaEebZ+9LeBDF3lefxa6z9gh50IUh4/OXkKbw+MmlVIUfoLH5xngufSh2KvqzSjEC5Amm6zXTGWFxap7d8SMmUQuIFpe6Uqr9o1n5QBVUOs1F6iLGnZJyG+6YdP0By0YqrVul2h6TD+frdgz9jqdYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458233; c=relaxed/simple;
	bh=FUgc+fVrFtLC9X8AHnzWDs712XgUX1Jr5Y/gjnGpuAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbvcvtFZQJF1wwI2zXh7gFzh24vEO/ogIJmyjIPB2YJceO8Cjzpbqo2RZd+KSkHb0tQYIHoNItMSPaWnoM3Dd2uSssuvGB/ZKhyRAJ9AOp+xEPFyE/lKG28qYqu+/bxXOxKNNIU6qPQlMJKSsb2EdnJEJxg4nMm0SHvfLptW4P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bTMUZ30c; arc=none smtp.client-ip=91.218.175.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bTMUZ30c"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FUgc+fVrFtLC9X8AHnzWDs712XgUX1Jr5Y/gjnGpuAs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788458230; v=1; x=1789063030;
 b=bTMUZ30cKVsb7lFaJXg1dUncaE2NhoDm9kxEGWbjyHWxjKmDvQD+wVlMCwLmX0H557IvgNkd
 v3umFX7EQLH9H4EGDWWg207vlnBWlp61/UyN8uOnPBJdUf/kdBZvXfT240NkGRBIcxg2AUqDpz6
 TeCRs2xMo0F5jYjNkF7MNIik=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id da9ba4cda93ba682;
	Thu, 03 Sep 2026 17:57:09 +0000
X-Mizu-Trace-ID: da9ba4cda93ba682
X-Migadu-Flow: FLOW_OUT
Date: Thu, 3 Sep 2026 10:57:08 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH v2 3/3] mm: memcg: skip the RCU lock when the memcg is
 not dying
Message-ID: <apm0372x4vOtJvSs@linux.dev>
References: <cover.1788169145.git.zhuhui@kylinos.cn>
 <3fc10f32131097bb57efaec72d049d635b227cf1.1788169145.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fc10f32131097bb57efaec72d049d635b227cf1.1788169145.git.zhuhui@kylinos.cn>

On Mon, Aug 31, 2026 at 05:46:11PM +0800, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
> 
> get_non_dying_memcg_start() takes rcu_read_lock() on every stat update, but
> the lock only protects the upward walk to a non-dying ancestor, which
> happens solely while a memcg is being offlined.  The dying check itself
> reads the CSS_DYING flag of a memcg the caller already holds a reference
> to, so it is safe without the lock.
> 
> Check memcg_is_dying() first and return immediately when the memcg is
> alive, taking the RCU lock only on the rare dying path.  On an anon
> fault/charge churn workload in a memcg this recovers the ~0.6% overhead
> added by the previous patch (4368077 vs 4343159 pages/s before, back to
> ~4377000 pages/s after).
> 
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
