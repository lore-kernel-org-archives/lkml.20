Received: from mta0.migadu.com (out-79.mta0.migadu.com [91.218.175.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EB7383C7C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525927; cv=none; b=Elfj1hkdNoGjDX0le1Qem1WI1bNJWHZv5/pL1mVBZnDP2clk2i3mxsD3e81MDVYFaCgodnHsU3favnvfmmrUdz4TGJqsVzioVyg5TRLlloTSCbucmXLbr+RIqJjqZM4Igl+rE6Abrs/4YjD6UdDQw2Xc302IWHisVF7vFMaL+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525927; c=relaxed/simple;
	bh=6W4t1O6zL3vim3e+wdusHCDSqONbr3dliD7/v/Y/1c8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=c2m3ovJV/NJARgpJSB3bhr5csHXHH8FptkFPFBTkcVvIakevAcUvI1aZBefz3gA4qaIdQTWah5oBtNcL5C0adsjIsFrtEbeCBRS1tOId9Q7uHOoCIEJ7CBu/iWc0dFCv+HqZ+VQjHN2XtdtbdmCB6hcHD/IiADf4BwKMhcM1W/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BKevCqde; arc=none smtp.client-ip=91.218.175.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BKevCqde"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6W4t1O6zL3vim3e+wdusHCDSqONbr3dliD7/v/Y/1c8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789525920; v=1; x=1790130720;
 b=BKevCqder0SVJxHtfV67s+LrqRff5qOlXLFQxjcR0GvnND/mp+2QrBCp/yoJmKLHpvxeF68v
 n8w0vlQcdKIQV0gfdh7EEbHAKw4vuXgJ4v+BsUCyBEWZIFEiiN6CBqCQPYquwx6QcStvTrjdZML
 f9PAof3JOs4ZHUiq9STAhNG4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id ad698002a27eb520;
	Wed, 16 Sep 2026 02:32:00 +0000
X-Mizu-Trace-ID: ad698002a27eb520
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v3 04/11] mm/page_io: take a const folio in
 bio_associate_blkg_from_folio()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260915-folio_memcg-const-v3-4-c239a6010b58@columbia.edu>
Date: Wed, 16 Sep 2026 10:31:35 +0800
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
Message-Id: <CC7B7144-E53C-4A6E-8B47-61D4A440173F@linux.dev>
References: <20260915-folio_memcg-const-v3-0-c239a6010b58@columbia.edu>
 <20260915-folio_memcg-const-v3-4-c239a6010b58@columbia.edu>
To: Tal Zussman <tz2294@columbia.edu>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 16, 2026, at 07:20, Tal Zussman <tz2294@columbia.edu> wrote:
> 
> bio_associate_blkg_from_folio() and its helpers only read from the
> folio. Constify their folio arguments.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks

