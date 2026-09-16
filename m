Received: from mta0.migadu.com (out-11.mta0.migadu.com [91.218.175.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF283A382F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526279; cv=none; b=tuaIGekDlkXF18B2rjwAR0V0MUPUcePY/muI3aNSHdruM0MEP9C/QEfgGpEAqEUdbv/QbR+xeJIt5GURO5KkKa+nYHikdQFCUflgvkuFPCKukZYV4LWS2pE0JX1XKE4lBmH8Fx+IbENZrnRXNO4DngMCLv33CcYjgrSr+Ao1ya4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526279; c=relaxed/simple;
	bh=RqoHRKP5MPir8EDPZ+oY2qrhh/YX3EBSGht0Wmlx5f4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=SVVXzpeJEwDMo9X+rxbVv4KOwx4EuQ8dMK6j28TdJFrrql3Yjt7EbqV5WGItSbrER8gYIcAD9EUKnCuh1clCRn1RzjKYRGtV0JpwQjyXzeUrTHE/sNSSoTenzQVCYbnUq0bFbNg/UIwc/2nl7Dav37vaqjBthsCyQMi8qYIKwAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Y9fTzTLh; arc=none smtp.client-ip=91.218.175.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Y9fTzTLh"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RqoHRKP5MPir8EDPZ+oY2qrhh/YX3EBSGht0Wmlx5f4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789526273; v=1; x=1790131073;
 b=Y9fTzTLhvec9hD6ccIhf87gOxiPLA4GCPk59TBh/vFMFzjN9N30MRia/R1egeRa/3jL91h/c
 a3xu3cIsIjeLTLTH3j+L1phrjuCAOL9DNcvzkpgHd8QPV2PV6vTROIyCvBUO31X9zYz/dS5KmrM
 Sv/wwKsELmyO4Y0Dt13DUzr4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 0076e13c0c48a507;
	Wed, 16 Sep 2026 02:37:52 +0000
X-Mizu-Trace-ID: 0076e13c0c48a507
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v3 11/11] mm: memcontrol: constify the zswap and socket
 pressure helpers
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260915-folio_memcg-const-v3-11-c239a6010b58@columbia.edu>
Date: Wed, 16 Sep 2026 10:37:30 +0800
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
Message-Id: <1BA7E514-82AC-416F-A795-9D12152BDE87@linux.dev>
References: <20260915-folio_memcg-const-v3-0-c239a6010b58@columbia.edu>
 <20260915-folio_memcg-const-v3-11-c239a6010b58@columbia.edu>
To: Tal Zussman <tz2294@columbia.edu>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 16, 2026, at 07:20, Tal Zussman <tz2294@columbia.edu> wrote:
> 
> mem_cgroup_zswap_writeback_enabled() only reads the zswap_writeback
> flags, and mem_cgroup_get_socket_pressure() only reads the socket
> pressure timestamp. Constify them.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

