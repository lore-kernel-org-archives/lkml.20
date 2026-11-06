Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955543;
	b=xFWOH2zqBsRkjCGWgM94MOg890i/V2wIC79PRYVnWG52DmK1JXQEnOPPsQnVuX6NT2IO
	 5UyDm24k5eGvzcDCPcPICEeJGtKq3pFaeEFXvBIFRzXjp+NxxkQihe9O3zOx6GFh4t1sa
	 jrRAatBVDlEZZQcEYW/Q80xENh41dTJV5NsKLdR/0GLQ0JdV5ER3Wt+ItpZErnWBpCLEi
	 duPSq6WMaTHP/lUFgkjg3UbHdw2UXQR/AFseHakNaIqimfyW4MBgm0xXzcdbtH6Nzt+xj
	 tlMfZLkbTLdboDRKLumeQIoGF80yrajtEMJPBmfrlUk69A1E0211FNSLwzsayZOw2sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955543;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=Yh+ePy4k2Ej6351I944wQj3itVcd2iIkRAI/E3uzaMY=;
	b=Uugs1dQcb++zll9vEIJaKK2IjGKxy38F/GwV2lzfn0t+ZUEi8iuuDK1aAAq0JyKTWC6C
	 QgEG6Oa8KcWnsZi2TU+060m512ioC9lWyseuaNXWeqoHIi5SVOCbbV1WbRLzqoxYZtm8t
	 YCTFh28vbHOPlHNOml7OfWi0c/jbK8cVYZ9QVAd76hvvhsGv0QPQcLaA/zUmjMllA0wzq
	 nJYdtaeluakQlFnl0MRGNWQDTWMxyjut06M454/jI8epS2627oK32OjoMon+yAXV6BO+U
	 tV8bWIcOtg5NgjBzDcgY4qMTOjhix6aA/9yOltntdLvjzi7vBmF1qsF4QXQCxUSNTQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bQggY6Sf;
	arc=none smtp.remote-ip=95.215.58.20
Received: from mta1.migadu.com (out-20.mta1.migadu.com [95.215.58.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC36606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC36606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bQggY6Sf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ragY6FzqrbiIYwHJcjk3800TKOnL9b0LX6exoGgGvrI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793955540; v=1; x=1794560340;
 b=bQggY6SfCbxRY2UHK2EIOX4BV1trzD6hlgH6mA9zcyurzJ9/BA4o5GjbMHM5adXG6nIV92m6
 cMpxhlILSSBPmZnBzNWQYjYznBzO43Uwvukss0Pt0BJJekCqsBaguJ+TuO8AxP9uwGmW241x297
 ZyB076wfrRFg45F4MemmEz78=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id b07fd71a6e5f18a4;
	Fri, 06 Nov 2026 08:59:00 +0000
X-Mizu-Trace-ID: b07fd71a6e5f18a4
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 04/12] mm: hugetlb_vmemmap: generalize vmemmap page
 allocation
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261104023510.260766-5-songmuchun@bytedance.com>
Date: Fri, 6 Nov 2026 16:58:46 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <08143A6C-D96D-4E6B-B7F3-359E9311B272@linux.dev>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-5-songmuchun@bytedance.com>
To: Muchun Song <songmuchun@bytedance.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 4, 2026, at 10:35, Muchun Song <songmuchun@bytedance.com> wrote:
> 
> Vmemmap page allocation is currently tied to restoring a virtual range
> and assumes an empty destination list.  These constraints prevent it from
> being reused when pages are requested independently of a vmemmap range or
> appended to an existing list.
> 
> Generalize the allocator and give it an all-or-nothing list contract so
> the restore and optimization paths can share the same allocation policy.
> This also allows HVO head-page allocation to fail gracefully under memory
> pressure without triggering the OOM killer.

Before this report [1], I did not realize that this unexpected behavior
change fixed a real issue. Therefore, in the next version update, I will
extract the GFP_KERNEL modification from this patch as a prerequisite patch
and place it at the very front of this series to fix this issue, so as to
facilitate backporting.

[1] https://lore.kernel.org/all/20261104133938.50974-1-zhangyili01@baidu.com/

Thanks,
Muchun

