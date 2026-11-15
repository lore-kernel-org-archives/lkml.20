Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728796;
	b=zlmnp3QbYXU3yZFOHKW2YPtSoZy4f6en8ygo3mPMVEhc+zDXFaxAbGThAa5FS1FvfvxJ
	 DgiO0HszRI07CkvNg5zL1yd2w29TGsa/HJhaRayEX4owu3tHGlecicRu6Y2UFf/+CG+5I
	 nvYE16nDONEaAI1fsQEYZbRFPIv7IPYGfCOJmLfqkJnMrCKPhJqlnORpy7TC2RVPMfe+B
	 ipkmfYBw20hh+/6CLrgKq0Gw7WvifZYFb3c0Uo+av+3QLcHsoWh7sfs93orqQTpIcqvUy
	 oanpvmnPoHaT+Xyk8qfZgr0Wwrd0pg7WkzaZ0DHQPzmjgU4dyGzPflLraSK2++swToQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728796;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=DK+L45fLM0eTFpXkrDmE+xve33EF/t7QiHzPin4KYzg=;
	b=J3WaEXlLow7NLTjQILDDuKupChbkQH6xiSA2Xt7v7I0ZgYIMcoFqyx0kFOBB8eOuQrCN
	 UIjeOdMTDpYGy2XF8/mIaTU3izBOZrcoPpizde1ZDs+/oANIcbsoTQ3r8AK3ZsylV2net
	 +B2eRtlFeiHxCVvMftAdPAL1Rbwd98QmIgd/iKzMGlQbQI1pZMPpZ+SA7Mh8C+9gMPTZf
	 bSWOhlwx4mdlVw6ab1eNQKilUht0F0577FJ2FfxUEfDk58rOPnFpV8XDU+FrnDipkanVR
	 6IbTZ9P0fzYV33iZFL/+dqcTDsGzu78LaOk2ipTJY8385/VxWJElV15SJ1GhGiVJ3Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n9p1g7x2;
	arc=none smtp.remote-ip=95.215.58.208
Received: from mta1.migadu.com (out-208.mta1.migadu.com [95.215.58.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EF4606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62EF4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n9p1g7x2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yF7XHudIlIhypmUU5oxh4ylUNM+N6uQezOp9runcKhI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794728792; v=1; x=1795333592;
 b=n9p1g7x2kHBX7I8RnjxwfQyilnfieit86jtKgXYGOl3Ttm9zXtgtDfERuRj0wghj51/bcYWH
 mn/dsEd/sS8mBN8HTMIqbnAkeSeq2ONqn5CUP0g4G46XUg7Hbr/79CPN1fqF8vytTYF9dz6u//D
 NBGRRclkoAPP5ontmpu7aAYU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id b9e7cdb8db06deaa;
	Sun, 15 Nov 2026 07:46:31 +0000
X-Mizu-Trace-ID: b9e7cdb8db06deaa
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
Subject: Re: [PATCH 3/3] kmsan: fix metadata loss during HugeTLB struct page
 reinitialization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261114222347.227199839f5ffa44@chrisdown.name>
Date: Sun, 15 Nov 2026 15:46:06 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Mostafa Saleh <smostafa@google.com>,
 Ketan <ketan.kishore@oss.qualcomm.com>,
 Usama Arif <usama.arif@bytedance.com>,
 kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 Sashiko <sashiko-bot@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <B8C10EFD-DC12-4388-9228-DC460CAA5632@linux.dev>
References: <20261114104150.58424-1-songmuchun@bytedance.com>
 <20261114104150.58424-4-songmuchun@bytedance.com>
 <20261114222347.227199839f5ffa44@chrisdown.name>
To: Chris Down <chris@chrisdown.name>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 15, 2026, at 14:23, Chris Down <chris@chrisdown.name> wrote:
> 
> Hi Muchun,

Hi,

> 
> I can reproduce the crash and the series fixes it, and I think page_ext is
> the right place for these pointers. I do have a few comments, though.
> 
> Muchun Song writes:
>> -	struct page *kmsan_shadow;
>> -	struct page *kmsan_origin;
> 
> This takes struct page from 80 bytes to 64 on a KMSAN kernel, which means
> that hugetlb_vmemmap_optimizable_size() no longer returns 0 and HVO can be
> used there for the first time. From a quick check with
> hugetlb_free_vmemmap=on it seems to work, but nobody would guess that from
> the subject, so I think the changelog should mention it.

Make sense. Going forward, KMSAN can now work with HVO.

> 
> Documentation/dev-tools/kmsan.rst also still describes the two pointers as
> members of struct page, under "Metadata allocation", so that needs
> updating as well.

Right.

> 
>> +ifdef CONFIG_KMSAN
>> +KMSAN_SANITIZE_page_ext.o	:= n
>> +KCOV_INSTRUMENT_page_ext.o	:= n
>> +UBSAN_SANITIZE_page_ext.o	:= n
>> +CFLAGS_page_ext.o		+= -DDISABLE_BRANCH_PROFILING
>> +CFLAGS_REMOVE_page_ext.o	= $(CC_FLAGS_FTRACE)
>> +endif
> 
> This takes the instrumentation away from all of page_ext.c, when the only
> thing that needs it is the lookup. page_ext_size is already visible in

Absolutely right!

> page_ext.h for page_ext_next(), so I think page_ext_lookup_raw() could be
> a static inline there instead. That way it gets compiled into
> mm/kmsan/shadow.c with the right flags already and needs none of the
> finagling above, and it saves a call on a very hot path as well.

I'll include this change in the next version.

> 
>> +	preempt_disable_notrace();
>> +	page_ext = page_ext_lookup_raw(page_to_pfn(page));
>> +	if (page_ext)
>> +		meta = *(struct page_metadata *)page_ext_data(page_ext, &kmsan_ops);
>> +	preempt_enable_no_resched_notrace();
> 
> This is quite a lot more work than the two loads from struct page that it
> replaces, and kmsan_get_shadow_origin_ptr() has to go through it twice
> for every instrumented access to direct-mapped memory, because it calls
> kmsan_get_metadata() once for the shadow and then again for the origin.
> You might think that's a bit academic, but it does add up. For example, on
> a 2 CPU VM, perf bench sched pipe -l 30000 goes from about 1.37s to about
> 1.58s with the series applied, perf bench syscall basic -l 300000 from
> about 0.66s to about 0.75s, and a dd of 300000 blocks of 512 bytes from
> /dev/zero to /dev/null from about 1.63s to about 1.90s.

Good catch, and the numbers are hard to argue with.

> 
> 1/3 says that keeping the pair together lets callers avoid duplicate
> lookups, but the caller that matters most doesn't make use of that yet.

Sorry, that's my oversight.

> From a quick hack that has kmsan_get_shadow_origin_ptr() look the page up
> once and take both pointers from the result, the same three come out at
> about 1.38s, 0.62s and 1.54s, which is no worse than before the series.
> Could you do something like that here?

That's a fair point. I'll amend patch 1 so that kmsan_get_shadow_origin_ptr()
uses the shadow/origin pair introduced there and obtains both pointers from a
single page metadata lookup.

Thanks very much for your review.

Muchun

> 
> Thanks!
> 
> Chris

