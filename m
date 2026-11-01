Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793515916;
	b=qR6TANSw60Atm5oAsEkZw2b7yKuzMmp1n4oGGqsdWWGGhqNHUqjEHt8JIBUHJuJo59v4
	 7OZ7icDaqlbw3AVFfbxzRUEZTHx1GuFxgTB87mLnotnTbL6hIZcl4We7rIi3icl8aacyF
	 dCXKwiRsgste9pApeCfudfwl7szzqF//QCmzSW8LefvWSfBjlbsNBP8aaGvYckRDpeW7g
	 sh+mH3arcC9LrWzhWH2HwnzLGD2PThAB2wdvjNq8YsImmMaHNtAta9RxK8sk7iHNuTw9i
	 6ht57yNmAMY2JU6OieTFKynkScBK0HOxQj/m63MzQMGPLOV8tY2jZBZtbbV2jcAyRqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515916;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tuwGBOzAiVCP+vrlW5UwmQsu01V4i5/BJRy78zItdGE=;
	b=CVR169PSPIWJVhLsFkdnjiElbjxXb5rZNvdV94qVQ1VVjRQGg1ZT60ooN2ycHHAzJ5BV
	 eAnJh64RRf1nzlLlFMfR/aGEK6fXUv29xg1p2QkNKFSc9BVsF4R2bHzxRYLohBSRLge+3
	 g7Ow7h18cGcS8bxkn+onAyFBix9/Fchr+yXnWZYQidL8wkaXqoXzupENnOYJf4yBHt8a8
	 6tSdlNuqEOt9LNZkieT0+tZr7eedJXn8XKvphfTSYXvvB0QrEOP5WFF67XfamVNV4oZcg
	 zxIFHiE1noublhXGlw1LyvlqCHJeygJE24TVDj3pvVz2QLdDJw3cv2QfcIV7wkjbMqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Ko/MkeP/";
	arc=none smtp.remote-ip=91.218.175.174
Received: from mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA84606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA84606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ko/MkeP/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VLeE2/rDXpLDVi9e5DrH1IIJumuqSoLutYfcLgv+pXA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793515913; v=1; x=1794120713;
 b=Ko/MkeP/JuNRQcANUqPeEjZdTGUFRZxfe0Z8Sv05EKfQJ87wbcFQnbfn3Xwgno6gb88NaTEX
 Mdfqr8dIuqvo2Q2KNGq22CqfsBd/gtugHlAWAebky3j5j4iT0t7KmpZgwuBUHoj5E/VNcIIiJBS
 MjIhgDLZ4eEhHtK3xHUcDhwY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 43a291ed986079d8;
	Sun, 01 Nov 2026 06:51:53 +0000
X-Mizu-Trace-ID: 43a291ed986079d8
X-Migadu-Flow: FLOW_OUT
Message-ID: <2fb322ca-d54f-465e-b342-cb4e3ce55621@linux.dev>
Date: Sun, 1 Nov 2026 14:51:47 +0800
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
Subject: Re: [PATCH 05/12] mm: hugetlb_vmemmap: unify writable vmemmap page
 preparation
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, James Houghton
 <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <20261020115824.823278-4-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115824.823278-4-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:58 PM, Muchun Song wrote:
> Installing a writable vmemmap page requires consuming a replacement page,
> copying the current contents into it and making the copy visible before
> publishing the new mapping.  HVO currently splits this sequence between
> the page-table walker and its caller depending on the remap path.
> 
> Centralize the sequence in the walker so all writable replacements follow
> the same copy-and-publish protocol.  This keeps page preparation with the

This makes the copy-and-publish protocol much more solid and easier to
reason about. Nice cleanup!

> mapping update and removes path-specific handling from higher-level HVO
> code.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/hugetlb_vmemmap.c | 40 +++++++++++++++++-----------------------
>   1 file changed, 17 insertions(+), 23 deletions(-)
> 

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

