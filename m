Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877521;
	b=AOm20L9W0y9fUloo3Z6lRFhvVE+12cb/PpOMvsFPnBtPLch2xgD2gs6HNK4XROPVJxXy
	 OJC80d0B8d9eIPx40GdoNIxRucPUwhiiC7dWttdA0Lu7ecrNRv3tPzZLATJsR2O9GUw4j
	 rZcZnBzb2DQgjnMPBpn+vQO2qCGOlLqeo1nO36/KSD1lcNfxIQkj6qPzLbHr7hHViS+O8
	 IpKAGpnDkfgCSbLHSsXGLZGXPxeUPcA5nCJBcFdJPfLkGGOJoLqRjbZZnz5tYhEwQplqG
	 8crb57Z/vBEG2fjQJsAMSBAxo+DZljKMZ+rGYSh5PefKJNAImctrjOsnGpqSwszcpGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877521;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=e2GEyfbEk78tmhNg4jjyM+Rv2+cShKrYLmnldxMVg7o=;
	b=J1xQXk0PykCwhgmRS9ETt63UMALpQxbOT+fAY3njBTkzNY3tBqRI3N5S6byflgzg0G15
	 EYsQiqGaS9LHAPCKRQF1WdOUjkEDdJC7p2PjuQXpc2kUy98bJxFz5IUkNW5m7uXS2o7ng
	 KBwQa/biESXGDiCs2xPNSX9MTbLZjcmrF1VgdzRCtAaP5mnxNWK6zbVSrPIqsuX13lCyq
	 wWmMv3B2dqD+mrcp8HcP/3Uck/j2xHkcWkKOvqFm3dA5P46rsVlhEvIVqz6Wv+9lNnYC7
	 GatLJSpqg71LfUBqqG93sVWU9ci1DfRvvi9mKpuZ8UzSpW08VeTE5lfuC62Nu2DJz5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=KmDDNQFV;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02576606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02576606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=KmDDNQFV
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793877515; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=e2GEyfbEk78tmhNg4jjyM+Rv2+cShKrYLmnldxMVg7o=;
	b=KmDDNQFV9cDwJOdR+j98U289gbU8bp5kdM8CuWGIm0TisCAo1HdthZob6GCfuvrieWT6RrQ4858UZcmCKaOxo7wqic5KpQV77HYg8zShpFrYYKQEXEwKPOFo33fWPr/U+h7QZXtGs+wxPN6ONVAdFlewpLYekopkB0lq+emrhEU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R951e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XE8e9ip_1793877512;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XE8e9ip_1793877512 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 19:18:33 +0800
Message-ID: <39d0d3d6-bd8d-47da-b2f8-d07483a25a6a@linux.alibaba.com>
Date: Thu, 5 Nov 2026 19:18:32 +0800
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
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio
 sizes
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, ljs@kernel.org, riel@surriel.com,
 liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com,
 qi.zheng@linux.dev, pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <20261105045406.39871-1-lance.yang@linux.dev>
 <0ddaf336-7cb7-4e83-af2c-f60d23f7aafd@linux.dev>
 <f7bd740e-1328-473e-96f5-89658a08d514@linux.alibaba.com>
 <8ebb182b-8a01-4d32-8c76-7e4bd9e54ddb@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <8ebb182b-8a01-4d32-8c76-7e4bd9e54ddb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 6:06 PM, David Hildenbrand (Arm) wrote:
> On 11/5/26 10:00, Baolin Wang wrote:
>> CC Barry, who added the TTU_SYNC in shrink_folio_list().
>>
>> On 11/5/26 1:48 PM, Lance Yang wrote:
>>>
>>>
>>> On 2026/11/5 12:54, Lance Yang wrote:
>>>>
>>>>
>>>> Good catch!
>>>>
>>>>
>>>> Right. Whether the folio can be PMD-mapped doesn't tell us whether its
>>>> PTE table can be reclaimed, so those extra checks can skip synchronization
>>>> that the caller explicitly asked for ;)
>>>
>>> Ouch ... one thing I missed ... what about order-0 reclaim?
>>>
>>> shrink_folio_list() only sets TTU_SYNC for large folio, so can't we still
>>> hit the same race there?
>>
>> Thanks Lance. But this matches the purpose of the TTU_SYNC flag, which is used
>> to avoid racy checks with PVMW_SYNC. If no TTU_SYNC flag is set, it means the
>> caller can tolerate some racy checks.
>>
>> For this case, I think we should set TTU_SYNC unconditionally in
>> shrink_folio_list(). Barry, what do you think?
> 
> That makes sense. I hope this doesn't throw a big wrench into our reclaim
> performance numbers.
> 
> Can someone benchmark this?

Sure. I'll measure it if no one objects to this change.

> But maybe we should really follow-up with the folio-size based optimization in
> sync_with_folio_pmd_zap(), where we only need a memory barrier (and sufficient
> documentation why something that cannot be PMD-mapped can get away cheaper).

OK. I'll do this later.
