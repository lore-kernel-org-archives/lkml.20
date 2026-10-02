Received: from mta0.migadu.com (out-104.mta0.migadu.com [91.218.175.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC3F490C17
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950552; cv=none; b=oEsTYBjekOUZe3ENu7rvtTfdshLV4odmqq8Y8NRxguPfV1ze2tPCnj+5zVhG/1CMf+0BmDUbgTF1KCf7Kw3iH4mMwDo/eeOoNvxg4wkgtEIKtEMWJoxlRoVG6hdYZEvm1ebrxb+8Sk/8qcbqQqE44sZ20VQMAta1DmvCvJXbnJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950552; c=relaxed/simple;
	bh=GoZ23+ZT4mQGNUcJbwzUPAqDWvOWW3sI/LyHl8Zbpp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kv1pFJGSCpyL5OzFsK9GlbbEXPGZMhTSSmlcIiLIg1LFPpUuRB1XhlkwwSi57v9ndUgBXpihEJX8TAt7wBivjv8H8vIlJdmvk+YExjmddyj/NCLt/cY0YPGjfBVLLYqYZFkwcNN22GZWLatkjKt5J6CXyQ9P4LeqZm1mVdgcYuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GFGvfIfy; arc=none smtp.client-ip=91.218.175.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GFGvfIfy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GoZ23+ZT4mQGNUcJbwzUPAqDWvOWW3sI/LyHl8Zbpp0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790950545; v=1; x=1791555345;
 b=GFGvfIfyoaTkFjVdl6USK3ZVVJqBL5o4IndYLuD0fTs8E7CoekuLUV2ieqUZ07w5j+coE3xJ
 NKG0drsro4+JvkRxivXw3L061IU7BhFypDNVQ4HeHzDy7BYc5EC9AyAZ1vEIPo8GyYS/NO1unUR
 14fQYHHyHY644WxMUhXR5BVM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ae4e3d5f1d27fd0b;
	Fri, 02 Oct 2026 14:15:45 +0000
X-Mizu-Trace-ID: ae4e3d5f1d27fd0b
X-Migadu-Flow: FLOW_OUT
Message-ID: <28f2c85c-d45c-46af-bd2f-e97696f42f7c@linux.dev>
Date: Fri, 2 Oct 2026 22:15:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/vma: don't remove VMA from rmap if pgoff unchanged
Content-Language: en-US
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry@kernel.org, jannh@google.com, pfalcato@suse.de,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, pan.deng@intel.com
References: <20260930-speed-up-inplace-rmap-v2-1-ac1aa19708aa@kernel.org>
 <20261001154511.23931-1-lance.yang@linux.dev> <ar-53boTrPQijDUt@gremlin>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <ar-53boTrPQijDUt@gremlin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/10/2 22:05, Lorenzo Stoakes (ARM) wrote:
> On Thu, Oct 01, 2026 at 11:45:11PM +0800, Lance Yang wrote:
[...]
>>> +static void anon_rmap_tree_update_inplace(struct anon_vma_chain *avc)
>>> +{
>>> +#ifdef CONFIG_DEBUG_VM_RB
>>> +	avc->cached_vma_last = avc_last_pgoff(avc);
>>> +#endif
>>> +	/* Propagate all the way up the tree. */
>>
>> Nit: propagate() can stop early when rb_subtree_last is unchanged ...
>>
>> Maybe:
>>
>> /* Update the subtree maximum and propagate any changes up the tree. */
> 
> I think in this case it's ok to be a bit blurry about it :P it deciding not to
> unnecessary work is fine but I don't want to put too much in there.
> 
> The point is as a simple sign or pointer to help somebody wondering wtf that's
> for even if it's not quite the full story!
> 
> Hopefully that's ok? :)

Fair enough. Let’s leave it as-is ;)

> 
>>
>>> +	__anon_rmap_tree_augment.propagate(&avc->rb, NULL);
>>> +}
>>> +
>> [...]
>>
>> Acked-by: Lance Yang <lance.yang@linux.dev>
> 
> Thanks :)
> 
>>
>> Hammered it with VMA churn (split/merge/mremap/madvise/fork) + concurrent
>> rmap walks + hwpoison injection. Nothing complained :D
>>
>> Tested-by: Lance Yang <lance.yang@linux.dev>
> 
> Thanks, very much appreciated! :)

Cheers!
