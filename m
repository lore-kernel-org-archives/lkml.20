Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783310;
	b=uXt4ZCd68040fzvM/KqeIgKRAgtzaR1cWyKbguVK9grmseSkxReYvK/toQhKhJusZNgN
	 VH77xx0bW/6b1drVnqejCL+L/XRQJ+LX0CWCbRx4qHBn5csjG2l4YgYmckHOwMmo4pK+U
	 hIQZAwLgF13qngubu/pgDY9aabWzCdUMlG1+LgS+gfe0gsKFpv2n/lT2KLI+fREn9Zu3e
	 Ltx8VY7aivBITouoQ7hILthdm8PW0EGTzeZKKY78aUwueMU2VUD9vRTM1T83C5dxEf4Xg
	 rbRe8fDGEOt2DwI43P6lsRNIfdNMHzkFlbrhKqx/LTLCoJ60l8i9IdeYyyKbk9QLqSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783310;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+NYn9Sk4oUvq/RMmR/hLYOzDbKipm49pgybfm6AGhmA=;
	b=Skf+y4+aiCrqxfe+ocaIQukoRMQM1jDARtLTsqzQ9cqfASsnCROJ6Dz4kJ5thKgzm4oE
	 t7veqLoNSRB3WhISyaDyKbRMMbaSPp2JQaX9LZYZnm5VtTpcSgyvtWQD+wMmAhFs/Rku5
	 HfklHb1Zq+k3rfsp79FVyC0gGoqxfgP4iSx7fa/XYDc03sJLD6+A1+5HJFVr6C1pL/DiM
	 FtoO9H174B8vuGCAzV0umsGZreHRX9/wlrHrkIZZDQ2Zt+11GXDg8gb7LfNO860+hbSt8
	 vfL6nu00y0ecSj05DSWatQ+FsBCqGEwApJa+uZEhwpxgOafauzVAp1As4qRJfzpaA3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VYe+QldW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C66606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VYe+QldW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162751F00A2B;
	Wed,  4 Nov 2026 09:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793783309;
	bh=+NYn9Sk4oUvq/RMmR/hLYOzDbKipm49pgybfm6AGhmA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VYe+QldWWMjvOsvqlc01rzx5B4pDG+f1Cm+nw8Pwbn8EK9cueIlJPWYrx+LxM3Gq/
	 gnnSF1Jl69zzE4NHq7IbZ4y3DIbwnSEtYVmg7P0Wip/ZRlqnVc3CEG4do9h6Fvw0UZ
	 Uz48wStqcn5WtkMTzyATnh9Kj300OWhh+lyS2EkrP3Js1kWclwEy5loXPoOAG5y/jn
	 WbmGxWwZ2gbuTBltl2OzRCY5uPgxjPaQfI4pZMNkckztmGtzcgtGijITFkzjmQWPsm
	 xujdp7OtQSL2W7n+xzvlbHYcEef6D7aBzwP5PhP+885r9+F+ajwGNhCFoHTfeytHWH
	 osB903NfBz1pA==
Message-ID: <52a78290-3e4a-4a87-9bb5-5b0e80cf0be7@kernel.org>
Date: Wed, 4 Nov 2026 10:08:23 +0100
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
Subject: Re: [BUG] mm/memory_hotplug: panic due to race between compaction and
 memory hot-unplug
To: Ketan Kishore <ketan.kishore@oss.qualcomm.com>,
 Wei Yang <richard.weiyang@gmail.com>
Cc: Yuan Liu <yuan1.liu@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>,
 Jason Zeng <jason.zeng@intel.com>, Vlastimil Babka <vbabka@kernel.org>
References: <20260903095543.3752338-1-yuan1.liu@intel.com>
 <1d625a60-9473-4f48-a384-7d756ccb7135@kernel.org>
 <20260910031609.qbn2qcxzbitau5xc@master>
 <12147238-575e-49ea-aa83-ea25c660ee38@kernel.org>
 <ae386ef8-324c-4704-bc0f-a1eca3280399@oss.qualcomm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <ae386ef8-324c-4704-bc0f-a1eca3280399@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/4/26 06:18, Ketan Kishore wrote:
> 
> 
> On 9/10/2026 1:10 PM, David Hildenbrand (Arm) wrote:
>> On 9/10/26 05:16, Wei Yang wrote:
>>>
>>> Does it mean, the combination of pfn_to_online_page() / PageBuddy(page) is not
>>> safe, when there is hot-remove, even for other users. Not only compaction.
>>
>> There is an inherent race between any
>>
>> pfn_to_online_page() user that then takes a look at the memmap (PageBuddy,
>> whatever).
>>
>> Usually, that's not really relevant, because for things to go terrible wrong
>> (instead of only being slightly suboptimal :) )
>>
>> You have to run both, memory offlining *and* memory removal.
>>
> 
> Hello
> 
> We faced similar issue internally on one of our target's guest VM run,
> where kcompactd de-referenced a vmemmap pointer for a PFN after the hot-unplug
> path had already freed that vmemmap,with no lock preventing the two from running
> simultaneously.
> Call trace:
>   suitable_migration_target+0x0/0x8c (P)
>   migrate_pages_batch+0x1b4/0xc74
>   migrate_pages+0x150/0x654
>   compact_zone+0x5bc/0xb30
>   compact_node+0xa0/0x18c
>   kcompactd+0x228/0x4d0
> 
> Would it be okay to introduce something like "try_get_online_mems" as shown
> below to try a readlock in compaction path for hot-unplug to wait
> for kcompactd to complete before freeing the vmemmap?


Likely not what we want :)

Gregory started working on some fixes:

https://lore.kernel.org/r/20261027042204.3741307-1-gourry@gourry.net

They need more discussions. They are a little bit low priority as we are
fighting bigger fires ...


-- 
Cheers,

David
