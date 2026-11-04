Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793757566;
	b=pKYYkOm9feepK4nygcwEXEvsFuwubAtFUPRTjYW2kV4YiISQLlqHlwqyWLyL+28D7BhY
	 +ybnOpafjbW2lIkw8u5d8PZswMYi33nZ3cSpfXNUucR/h6lp4wIpXKJ7gXe0ZNWulvpBa
	 kKcHh91lKW5AK4dskIXsdodmNDKhSdKOEbcjNFrompCTSttfwIBaH58Fd/O8CGDmgri1T
	 bOf68mC0tk5EqNe8XbbzNs4lZ10gJJuOgsVLe5vnLK7pJmJixH+3jf/use140AdhNlu5M
	 QU7bemmSFNIQG4G8t8Xq8nZBRYFmuLWK4QX09I+ozq0nl0hRRt4Yi3R1sw0T32upo0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793757566;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vtQc/hP3UAI76zkIv9UdY4+7Ue+hQnIdUcRDPGnwDYI=;
	b=KVfjHVwOY1UxdXqBSkrMl8bQmvpTC62it7iaOsXcT/OLGX0MCb30yvcZ9AVNpXSOp2UH
	 DxADlTAxXcSYnt0lTKyajPc0l1/4tGUSp8bA5nYMmKkDbxiKnmM+zrf/Ohrm6pxWWEtGI
	 cB6l2l+lR5VQuwifBiBmk6dwHzFO8HSh5b6i7Dci8OuT7CWCTP0jNJxQUPa0NtNmGJx0E
	 WoRANZjCTYlF+/UManp01++tyFOEwLEW5QUW1/kbum8RPBQr0R1XmKZo5LyInrN6X5p76
	 GCs4gww6t7B9Q+T2XghZgE4QxgganrcKKQhaJnW/2FYysQ7ksUZ+ehiO4Fc3rPtHNxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A2WVZoGt;
	arc=none smtp.remote-ip=95.215.58.137
Received: from mta1.migadu.com (out-137.mta1.migadu.com [95.215.58.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5068F606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5068F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A2WVZoGt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dEfpVcqaKwJtgCHoqizd1/ayWuwTWWIsmQKh7kUEEfQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793757562; v=1; x=1794362362;
 b=A2WVZoGt2KIuU7thWtNqyKE2fIOPMC62rT+8J8Gm3hHFG3vmJoFY1YeHXImUuFBMuCtu3/D1
 EyhSjAeXA9lNiVQplWoHixIJqTmQE1ogAvL0MndHeR8MWo+bHYggWHkj/YI+Ow9rVGv4KnKuz8l
 KE8pcze3J6rMj9d/2DD4ekPQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8f7e9dda1911563a;
	Wed, 04 Nov 2026 01:59:22 +0000
X-Mizu-Trace-ID: 8f7e9dda1911563a
X-Migadu-Flow: FLOW_OUT
Date: Tue, 3 Nov 2026 17:59:11 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Ababneh, Ehab" <ehab.ababneh@intel.com>, 
	Barry Song <baohua@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"ziy@nvidia.com" <ziy@nvidia.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "buddy.lumpkin@oracle.com" <buddy.lumpkin@oracle.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kasong@tencent.com" <kasong@tencent.com>, 
	"qi.zheng@linux.dev" <qi.zheng@linux.dev>, "axelrasmussen@google.com" <axelrasmussen@google.com>, 
	"yuanchu@google.com" <yuanchu@google.com>, "weixugc@google.com" <weixugc@google.com>, 
	"david@kernel.org" <david@kernel.org>, "ljs@kernel.org" <ljs@kernel.org>, 
	"liam@infradead.org" <liam@infradead.org>, "vbabka@kernel.org" <vbabka@kernel.org>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, 
	"mhocko@suse.com" <mhocko@suse.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"baoquan.he@linux.dev" <baoquan.he@linux.dev>, "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>
Subject: Re: [RFC PATCH v2 0/5] mm/vmscan: adaptive multi-threaded kswapd for
 NUMA-aware reclaim
Message-ID: <20261104015214.GA1088663@shakeel.butt@linux.dev>
References: <SJ1PR11MB6105E073723CFEEE8C8EDBF48C832@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <cover.1791577417.git.ehab.ababneh@intel.com>
 <CAGsJ_4wmSL7i4EPLWLKhDD6J=1TywBi5EYYDxp=SvOuXdmLGjg@mail.gmail.com>
 <SJ1PR11MB6105E839E55E9B0BDE183E9D8C9D2@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <SJ1PR11MB6105A05870574FF39B449CE28C692@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <ee9d317a-9829-47c1-81c7-1145304ea484@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee9d317a-9829-47c1-81c7-1145304ea484@intel.com>

On Tue, Nov 03, 2026 at 04:15:44PM -0800, Dave Hansen wrote:
> On 11/3/26 15:41, Ababneh, Ehab wrote:
> > I would appreciate your thoughts on how we might achieve a similar
> > performance improvement without increasing the number of kswapd
> > threads.
> 
> It also just plain doesn't seem like folks are very interested in
> optimizations in this area at the moment. Feedback that's basically, "go
> optimize something else" would also be very welcome.

Hi Ehab and Dave,

My appologies for late response. I have not gotten the chance to look
deeper into the series as I am stuck in something else but I am very
much interested in this (line of) work.

I have discussed with Johannes about multithreaded kswapds but the
motivation is more about scaling kswapd threads corresponding to the
number of cores on the node. We are getting CPU with hundred of cores per
numa code and kswapd is already too late or slow to keep up with
allocations happening on all of those cores. So, I definitely think we
need multiple workers doing the background reclaim.

Please give me sometime, I will organize my thoughts on how we should
aim to tackle this challenge. I will also ask Johannes to provide his
take on the issue.

Thanks for pushing this work.
Shakeel
