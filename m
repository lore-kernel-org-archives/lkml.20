Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477675;
	b=oc6cMczE6FWzKqGV2lhN6NOPSMpC9yQBXq4Ab0IapZL+R8Cskj+PzRSBJaG/DsX6nA3Z
	 BQXB8deciStcEZ3g1bDZyoJNk5nxrG8gMwf+/chV4Y/znePPseizV/bqM90ItzqMKqb4j
	 81RdKeUdD73CWB43cqoOje13Nuh8UE71JuZXfUooFPU1aeRG5x1Dh939WlFsoKhNS3RQ3
	 miWqCPbS5hWfHJUICTAMXU9NJIuP9TI0pw/jFS5gy/VXD9h+MCN3yWQrjpxqxXWH0uaJP
	 n4P+0FgTkqh5DBaTZqUkU3vZa3z+sVuqPWDPg9vJ5gePJC7XVvry27VESPrUA9Uu/wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477675;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oXWoMZ1H2pnRsuoYdPPZZtfsEnR1q3jeWNCSU2sUjT8=;
	b=sV5ydcrRdttthO1k5oCiwwaUyUxU9g4T3L5NO/k5IXpvUP9NTxuu7uJUMxQbtdrcFWAq
	 S5lt07wOvJuxYyGZai7WJNPQRmZoAiXUctovjkEOxZ59c1i+gaLkcgqgRAaq4ZxRZ91Md
	 41BT9n8UErOIqt91lUHFFagrVl/FCwr+4CaogLbuBBwYV2iv6ozRImj1pxSTDXz/4/fA2
	 2cUNmCmKqXbgVtl7hc2XYb+Dpqa3t5D4j2FtmZoGPsIVs4iBWCruCzlvcy/I8fqogR0Nz
	 ws48kz3XN1YPjoDvrZ4Hj+E3tYZSrCAUDtSgKJCx/LUJpXxhcbeZ+fQgWiYfnuDLpyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AsNyDcLj;
	arc=none smtp.remote-ip=91.218.175.186
Received: from mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C4E606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C4E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AsNyDcLj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X2OA0zhonpjv/0S8MYbPOzRw5uUgYP/J0+GBxLUXBOI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792477671; v=1; x=1793082471;
 b=AsNyDcLjkdu2n0NL7PxGF3/m6VarwougfDaUnY3GcZdm+lvmOqbgCt6fVITMQjtAvOtP11et
 Z0vvO9Jt4L9kdNOJEiKHNXCnYDj4fzxypgv0gpS/ZidlNnA339d+SL81/zoMIeWAEu+Ij3gkBry
 BPA7mVq/kQMPooxWn2mzSsPY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3dba75d8f5189ea6;
	Tue, 20 Oct 2026 06:27:51 +0000
X-Mizu-Trace-ID: 3dba75d8f5189ea6
X-Migadu-Flow: FLOW_OUT
Message-ID: <a3d410eb-e7ac-43e3-bdb7-d00445cdc7d6@linux.dev>
Date: Tue, 20 Oct 2026 14:27:39 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-new] mm/mglru: clarify the generation placement in
 lru_gen_folio_seq()
To: Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20261020023548.3242028-1-ridong.chen@linux.dev>
 <CAGsJ_4wnuQhyCkMq1Dub8HgB+uYAjy+LkgBxCRJG_kZiwAxA8w@mail.gmail.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <CAGsJ_4wnuQhyCkMq1Dub8HgB+uYAjy+LkgBxCRJG_kZiwAxA8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/20/2026 1:43 PM, Barry Song wrote:
> On Tue, Oct 20, 2026 at 10:36 AM Ridong Chen <ridong.chen@linux.dev> wrote:
>>
>> From: Ridong Chen <chenridong@xiaomi.com>
>>
>> lru_gen_folio_seq() computes how many generations below max_seq a
>> folio should be added to, but stores it in a variable named "gen".
>> Elsewhere in MGLRU "gen" means an index into lrugen->folios[], i.e.
>> seq % MAX_NR_GENS, so reusing the name for a relative offset is
>> confusing.
>>
>> The comment table above the code also no longer matches it. It only
>> covers the PG_active and the final branch, leaving out the reclaiming
>> and "can't evict yet" cases, and it lists LRU_REFS_FLAGS as an input
>> although lru_gen_folio_seq() never looks at it.
>>
>> Rename the local variable to "age", redraw the table so that each
>> branch maps to the age and seq it produces, and note that the result
>> is clamped to min_seq[type].
>>
>> No functional change.
>>
>> Assisted-by: LLM
>> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
>> ---
> 
> Hi Ridong,
> 
> The cleanup might be right, but this part is changing rapidly
> with Kairui's MGLRU-FG series. Maybe we should wait until
> that series lands and then see if this cleanup is still needed?
> 
Sure, I'm fine to wait. Looking at MGLRU-FG v4, though, only [4/17]
touches this function, and it mostly adapts the workingset checks to
LRU refs. The local is still called "gen" and the table still leaves
out the reclaiming and "can't evict yet" branches, so the function
stays just as confusing after the series.

Or，Kairui, do you think this is worth cleaning up? If so, would you
mind adding a patch to MGLRU-FG to clean it up, so it doesn't
conflict with your changes?
-- 
Best regards
Ridong

