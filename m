Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504716;
	b=Qnrz84oDlTZYE+DJy44lW/dU7EARtnYqMDAAOXGP7tXZNaeVdKGuRxZPg6ILuIOTs6RQ
	 9aRp5tyy+ODJ4uDXgpXBFtO+lPoBy54ejzXtoEU24Xw7agmdwaGgl8lkx63zQV0XzC0fW
	 tdT6av5MNLDQ759KRORkYzA1gAn8ZDrpSEXyJNVeroX3NmtHkPgCAKUJ4y0Tua99yBe4D
	 C3B1ep3knpk4VAqAF0dvtsCnH4uadj+1qAHq53cuLdZNXwPX4iTA8TuFv2H2dSMylsH48
	 H7MtO75XLalK+uw5UxHgQD53HavlfAjsPnjkPTtWXMGk7rH6Anx9wa+1NkeEJnv9nmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504716;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8KbcahdPnsareS4RJrUZQnfYvFwQkIaOnUakAWhA8PE=;
	b=ove0wyKLYJX4pkvJFx4GaTJPPcnS71NYPS5PY/yK0iHOYTMvjIycFmWEyFmpJbaRSTHF
	 DIrDq0IpBXkUs/hs+bOIqUPZdJoKUUubKmpp0L8BWnW4ycAZoojMxnNHxrtc0+70YStqB
	 GZZadb3nKO8M76sFG3x7cvrqW8Y7jtH5sWKR4CAJHBKHneG7Gie89IJJP2AQKvnwQD92w
	 9Wr6Js6LkJG7zWqLwsb//SbSV78jLdnE4BsZFOfgVD4jjGsnBafvSjDApArRIrCfeeW/J
	 M5WzD+CykFfEDQIRJ7RTYc7hqTGrdNqZM4m4JJ1F6O4hUJKVUP/XYeKP/mYgv01FBaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXVQUnfR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBF606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXVQUnfR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0778B1F000C7;
	Tue, 20 Oct 2026 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792504715;
	bh=8KbcahdPnsareS4RJrUZQnfYvFwQkIaOnUakAWhA8PE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WXVQUnfRcR7QdAGNfG4lqnfdEi+SDlj6/QuImGNa7kvBBiZ5esx0GfFWj9JMuMO7P
	 DTRH4vXPH4TLoQIAc1qpeEMQHmyrs2QY8I6pDSRLKRvd8gL1VyDAtPdhAXxqoYwTuc
	 IQvgObBgcPtisgB/q9If8emoHa33ifGcpMd9ZjuLIFUGguYQpR7kRwjf/0DQJhZ1xn
	 WCJ5JBWs6uHoF2AaZOjC5RkW2R8X08O0fgNHofo/HYX3qqJLLGWfY+PgpRnlss/uSx
	 UFoh2CaNO8JnRAp2w9JMW3Hh1TemKaAg75UwTJcLK6bj/8LG8dBL7A/8zOFw9jN/vR
	 ySa87WI8zNYgQ==
Message-ID: <9da90d76-031f-4211-b9de-439cbf7bc63d@kernel.org>
Date: Tue, 20 Oct 2026 15:58:30 +0200
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
Subject: Re: [PATCH 1/2] mm/compaction: skip folios containing hwpoisoned
 pages
To: Kaitao Cheng <kaitao.cheng@linux.dev>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>,
 Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: akpm@linux-foundation.org, vbabka@kernel.org, linmiaohe@huawei.com,
 nao.horiguchi@gmail.com, ziy@nvidia.com, wangkefeng.wang@huawei.com,
 tujinjiang@huawei.com, mgorman@techsingularity.net, chengkaitao@kylinos.cn,
 muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com>
 <20260928105805.1215770-2-xiangzao@linux.alibaba.com>
 <99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org>
 <20260929034123.2705745-1-xiangzao@linux.alibaba.com>
 <877bjowf9i.fsf@DESKTOP-5N7EMDA>
 <fbd5ae06-b6da-48f6-9c46-188fb6ba9684@linux.dev>
 <bc1b3255-99f7-49c8-bb52-bada6df80f72@kernel.org>
 <23d3756c-1a87-402d-80b4-c838dfc29f4d@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <23d3756c-1a87-402d-80b4-c838dfc29f4d@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/20/26 15:31, Kaitao Cheng wrote:
> 
> 
> 在 2026/10/20 21:07, David Hildenbrand (Arm) 写道:
>> On 10/20/26 13:27, Kaitao Cheng wrote:
>>>
>>>
>>> 在 2026/10/11 21:14, Huang, Ying 写道:
>>>
>>> On architectures with hardware error correction and exception recovery
>>> support, accessing faulty memory automatically triggers an exception,
>>> which itself guarantees atomicity.
>>>
>>> On architectures without such support, even if we implement this logic
>>> in copy_mc_user_highpage() and copy_mc_highpage(), checking the hwpoison
>>> flag and copying the data remain two separate operations. They cannot
>>> be performed atomically, so there is still a race window between them,
>>> however small.
>>
>> Yes. And you need proper architecture support to fix it?
> 
> It does require architecture support, but that doesn't seem practical, haha.

Well, but that's required when an arch wants to rule out all races.

> 
>>> Moving the hwpoison check after the copy might address this issue.
>>> Is there anything wrong with my understanding?
>>
>> Will architectures that are not prepared for copy_mc_user_highpage() not simply
>> crash if they trigger an MCE during an access?
>>
> 
> Do we need to check both before and after the copy? This feels a bit
> redundant, and I'm not sure whether such a small race window warrants
> an additional check.
> 

I don't see how checking after the copy makes any sense? :)

You already crashed if there was a problem, why check? Or what am I missing?

-- 
Cheers,

David
