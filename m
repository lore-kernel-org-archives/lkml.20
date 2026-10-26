Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018156;
	b=3NDa127Tcn3yiC6fAig/7vA6Gp6vXWaZs9p4QvK+tPvQcD+BKKafh2hBTMV9qxNrJc1z
	 xv7/N4XJJvaZYCgSC2aiWk22HWefHpwmYJzNKS6PlEMRwLvmwCPuWVwbQMDh0O3ueQWKQ
	 O9iQ9m7Tsgh+eRyECDZcnllkv5K0rz4bjWHr+aaJJmS3PvHmjDWVwGrnHHqZ86JS2Fa98
	 8dirAKg7xLmjy7UCEVdhIkUpIStpY+TmN2Q205CLpzwn1+1qaZgC5mJ44z+fBHYDzkv9e
	 nx08YzzmxgxC4h/K2Us/PvNdSC4bVLEuTZPCwbhD1VQr4FSBIVhFnSDIBXCS8/OUQNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018156;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=M7EefUh3aqRq+/kXeTZJUHXPcDw8CBwlgMa4LUajmOY=;
	b=5Pbj/X/4A4l8atiROR15QOHCMKtp9ayFJvEtT9ER5jl4Ny01jBR/egDWecKaLwa0m209
	 IKZ+l0zLXgOMhC6LQ4087W8BjWRbCtwgJTtKEGLMoxm2+rxfGO8g+fKIEcaGLvHt9Drqt
	 3r1UKiSmHodUiJFMpDniWIpWcBq00BuUwMZwfHJ0nfV/8fEuqVU5CZh5t62jT6VRssaIu
	 k2/1OknGW7vcUmDS0/f7s2LWwP3Zwt0AHfcE+aabrlVvha2gTpszNHqyGj+/5S0UDgKr1
	 42C2h702HGAO0V4DYKuxbI1k4KYoq10bvmNE2FyOmUqVQgkQs5/uznGsm6V29jrRLQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QDYnBlVj;
	arc=none smtp.remote-ip=95.215.58.244
Received: from mta1.migadu.com (out-244.mta1.migadu.com [95.215.58.244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0842E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0842E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QDYnBlVj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P4HvR1T1qWQJ8zvWY6aCuA2NNhAyIJqSmu7qznxYcdI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793018154; v=1; x=1793622954;
 b=QDYnBlVjApUfVb32w5CMpG6fcutS3RlXBpwWR9XiQXVZUC+e7uI7/TcWUVsYf+tY3g0+6vM/
 ypyeq8TSPTvWOkU4fkRnEiyoq9E0lNqt8nlfltcBIHKN61C4wkdWp0sjHeXj5rTvqds0iAJd2ID
 4nUIefE0ECKycUHjLyRD1cyY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7e1874fcba217f36;
	Mon, 26 Oct 2026 12:35:53 +0000
X-Mizu-Trace-ID: 7e1874fcba217f36
X-Migadu-Flow: FLOW_OUT
Message-ID: <67e0c2ce-c763-4705-a965-1ca84898e438@linux.dev>
Date: Mon, 26 Oct 2026 20:35:39 +0800
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
Subject: Re: [PATCH v3 1/1] khugepaged: fix readahead lock inversion in
 collapse_file()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, ziy@nvidia.com, liam@infradead.org,
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, usama.arif@linux.dev, kas@kernel.org, jack@suse.cz,
 djwong@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 hch@lst.de, syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com,
 ngocthang2710.1999@gmail.com, willy@infradead.org, rppt@kernel.org,
 ljs@kernel.org, Pedro Falcato <pfalcato@suse.de>
References: <20261016065920.4153-1-lance.yang@linux.dev>
 <27e5aadc-2d68-428f-a958-308e4a75c058@linux.alibaba.com>
 <atICp2NL8j2z7UFM@pedro-suse.tail5790ac.ts.net>
 <atIiR1NWNssDvgt6@pedro-suse.tail5790ac.ts.net>
 <6a005d89-df5b-4524-a4b9-c637cb15f1ee@linux.alibaba.com>
 <cd6637db-7b30-4cbc-b07f-c2a2b32480fa@linux.dev>
 <b1b3d8d7-7201-4b75-a0f0-af383d854279@linux.alibaba.com>
 <3be96a1c-7cfb-4cd0-a4fb-16209494d041@kernel.org>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <3be96a1c-7cfb-4cd0-a4fb-16209494d041@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/10/26 19:26, David Hildenbrand (Arm) wrote:
> On 10/18/26 04:47, Baolin Wang wrote:
>>
>>
>> On 10/17/26 3:41 PM, Lance Yang wrote:
>>>
>>>
>>> On 2026/10/17 13:43, Baolin Wang wrote:
>>>>
>>>>
>>>>
>>>> OK.
>>>>
>>>>
>>>> Sounds good.
>>>>
>>>>
>>>> But why not add RA logic in collapse_pmd(), as we do for
>>>> SCAN_PAGE_DIRTY_OR_WRITEBACK? There's already retry logic there, and this
>>>> would also simplify the long collapse_file().
>>>
>>> That would be cleaner, yeah. Some older stable trees don't have that
>>> outer retry loop, though ... I'd prefer to get the fix backported first,
>>> then move the RA/retry logic out in a follow-up, wdyt?
>>
>> IIRC, the approach to bug fixes is to fix bugs properly and cleanly for
>> upstream, without being constrained by backporting requirements.
>>
>> Anyway, I don't have a strong opinion on this. Let's also see what David prefers.
> 
> Let's get this fixed in a acceptable way in a reasonable timeframe; it's been
> broken for too long. ... and follow up with bigger cleanups later.
> 
> @Lance is this version good to review for that purpose or are you planning a resend?

Right, as for the bigger cleanup, that can come later. Will resend the 
current version as-is :)

