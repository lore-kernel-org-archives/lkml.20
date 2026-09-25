Received: from mta0.migadu.com (out-200.mta0.migadu.com [91.218.175.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34FC37C0F5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362429; cv=none; b=fc5RKXPHiJJhFWNuqpnM8q00viIkT/FEWtFnLNfhqsJ0vcj4ENf7MM6azBztFHrPS8D5rN2Gh+Vy1zcJo8fZNKZwPz7ATDI1TCnbo3Ki9kvJpHJFXfRQ8adgqzFxOTLDS/Y3JSV28ug1oK/3LvwhEG9vL81URjHqMu/SMqKU1V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362429; c=relaxed/simple;
	bh=MYAsyhMrxVLSyyzXXZiuzFZn94HW4dHyFnyA6oBCThw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzooO8tiK1aStDFaWNX+izZz57YvNLh52c0BNUMMYmWd9RpdLbnG17T3HWMvVDqhsRFU/mW6XFZc7bz8RSds00FMHrvfpXbde5ig68b3Bc6mQeGN9p/MCGyBXnGXto+6XwMfxlGcn4SMJDPW8TMrJ7dUg+hAr8GmYtwKvwFtkvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tYoo9+Ny; arc=none smtp.client-ip=91.218.175.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tYoo9+Ny"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MYAsyhMrxVLSyyzXXZiuzFZn94HW4dHyFnyA6oBCThw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790362425; v=1; x=1790967225;
 b=tYoo9+NyhxSXKhedqSoHTWRCrwXz6zuA8loR5u6xsNMsFNMzoO2SN92MORF8xm5vQ8Mxo2Kx
 XoBTCTPHgvNi8yko8+eVyP5hsyNUlr4CGY6kWvNNwoeDKt9WtY3x1ZBkCDw4zmS1ClZNcquRVdA
 lIewiyAa/HqECYW/VC0BPWRk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 07de4f991be2ed7f;
	Fri, 25 Sep 2026 18:53:35 +0000
X-Mizu-Trace-ID: 07de4f991be2ed7f
X-Migadu-Flow: FLOW_OUT
Message-ID: <99740342-e0e0-4ce0-ad4f-563d9c46a7a2@linux.dev>
Date: Fri, 25 Sep 2026 19:53:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: remove the unused zone->unaccepted_cleanup
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, axelrasmussen@google.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, baoquan.he@linux.dev,
 david@kernel.org, kasong@tencent.com, liam@infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 mhocko@suse.com, qi.zheng@linux.dev, rppt@kernel.org,
 shakeel.butt@linux.dev, surenb@google.com, vbabka@kernel.org,
 weixugc@google.com, yuanchu@google.com, hannes@cmpxchg.org,
 kernel-team@meta.com
References: <20260924191103.3475117-1-usama.arif@linux.dev>
 <arZlCx9oAWXr71Y3@thinkstation>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <arZlCx9oAWXr71Y3@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/09/2026 13:16, Kiryl Shutsemau wrote:
> On Thu, Sep 24, 2026 at 12:11:03PM -0700, Usama Arif wrote:
>> Commit fefc07518227 ("mm/page_alloc: fix race condition in unaccepted
>> memory handling") removed the zones_with_unaccepted_pages static key and
>> the work that decremented it, but left the work_struct behind in struct
>> zone. Nothing uses it anymore, so let's remove it.
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> 
> You missed me on the CC list :(

I would never do such a thing. perl scripts on the other hand...


git show | ./scripts/get_maintainer.pl
Andrew Morton <akpm@linux-foundation.org> (maintainer:MEMORY MANAGEMENT - MISC)
David Hildenbrand <david@kernel.org> (maintainer:MEMORY MANAGEMENT - MISC)
Lorenzo Stoakes <ljs@kernel.org> (reviewer:MEMORY MANAGEMENT - MISC)
"Liam R. Howlett" <liam@infradead.org> (reviewer:MEMORY MANAGEMENT - MISC)
Vlastimil Babka <vbabka@kernel.org> (reviewer:MEMORY MANAGEMENT - MISC)
Mike Rapoport <rppt@kernel.org> (reviewer:MEMORY MANAGEMENT - MISC)
Suren Baghdasaryan <surenb@google.com> (reviewer:MEMORY MANAGEMENT - MISC)
Michal Hocko <mhocko@suse.com> (reviewer:MEMORY MANAGEMENT - MISC)
Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
Shuah Khan <skhan@linuxfoundation.org> (reviewer:DOCUMENTATION)
Randy Dunlap <rdunlap@infradead.org> (reviewer:DOCUMENTATION)
Kairui Song <kasong@tencent.com> (reviewer:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU))
Qi Zheng <qi.zheng@linux.dev> (reviewer:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU))
Shakeel Butt <shakeel.butt@linux.dev> (reviewer:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU))
Barry Song <baohua@kernel.org> (reviewer:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU))
Axel Rasmussen <axelrasmussen@google.com> (reviewer:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU))
Yuanchu Xie <yuanchu@google.com> (reviewer:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU))
Wei Xu <weixugc@google.com> (reviewer:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU))
Baoquan He <baoquan.he@linux.dev> (reviewer:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU))
Baolin Wang <baolin.wang@linux.alibaba.com> (reviewer:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU))
linux-mm@kvack.org (open list:MEMORY MANAGEMENT - MISC)
linux-doc@vger.kernel.org (open list:DOCUMENTATION)
linux-kernel@vger.kernel.org (open list)

I have a script that just takes the last N patches and converts it
into a list from get_maintainer.pl. For trivial patches, I dont think
much about its output and just use it without thinking.

> 
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> 

