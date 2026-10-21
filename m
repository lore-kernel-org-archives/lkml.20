Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575126;
	b=Zh5Uuy1ISxDjM3id3sQVuUT1hBUBN9jwD/wfLLUIXjTD1c65q7eXhRuCiVAUjyhMTox1
	 xblBOOS1dUx17SIQlM49l0E3NN5y3Hk3YSQyTqxlSlBZ6/GE/xob+b7y6cukh6jjFpVNn
	 wyBI2ZUufnWVOFEMNjKGWWgyPaO+5v6vY3MAJdI01RHwpB/fhEmIC+qvuuoqFTszXpMI0
	 P5bToDtdk9QRjJpM0V7WacYyLiE/wUmKXfcnccxfet31ydq6wz4giCpa1AaQyuQ46WZ2z
	 8wgxkhidijAFgbS96/jCgWBJ32Xw954x97Ao8PdHoxj1ssOU1m2Y6gBCT1EtUua4itA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575126;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QBfPB6VG09nH9ZMSi9s+AuhJxAnfHm47tgfC2i8+kBg=;
	b=rSVdQM2AdF4QWkq4b+beXAOmyIX7IY1p+V3shpdDk+gOwgBh2q52CrhF4nVKoLYu79Z1
	 YnWsdt96Bp2QWgVasvSJc7olG5iEvcfDIeH200SWNK4Ram23QwULznd6s4acd8MqCDvA4
	 DEjBinXdjIQ+bQxrA5Nu7ZBtlVxadIKdyFVq+DMi+unr7YjOQJ07wWALjhCcXFulInDVi
	 L4u114Ho0ce9Ugx9cBwSTpww/wcDbVLF6Uzz7gh/qpJtftoe59+W1kCRsFZ/jetYEG1H/
	 sFdhdR1nchkXxarYlyJUL4K2OwAYTDYIM/Xuf9sa3YgU9Gce2RNIyeHQGggaAnxC45A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZDEJiGi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298D7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZDEJiGi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A074F1F000C9;
	Wed, 21 Oct 2026 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575125;
	bh=QBfPB6VG09nH9ZMSi9s+AuhJxAnfHm47tgfC2i8+kBg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gZDEJiGiy/W+SSFO1BQYcsSqY/klq/62RfPYVvYA3ujxlE9ctXqvA3k3EfVQJtt4S
	 j7sR5PEFVFNZp03AcUBVdxM1C2ro27eT+aQJw6gzbwEsuPMi7RK5LE8UMNsQLvQH8/
	 M1hX+mbFoojuJ8LqbivmexA+v4X0Qv2Qlw10uLnNkApo62qWQGbqI/YJaJDmuKEk2h
	 sgXEIHyQNXbXgKn/NrrwK0C50CsaSDL+59fX1HuEBUz5/DrFJ3bekgWgdVsCLnV6jP
	 dQT6JQ1tRp4Ue/v6Wc+CBW8M0KiPPlLGw0jhJkviAl/Hm94E/Qny4V3aHcK7KRslGC
	 hbC2NKJX7RmIA==
Message-ID: <e6ba0e36-c0b6-4cd0-b2fb-fc288468bce4@kernel.org>
Date: Wed, 21 Oct 2026 11:31:59 +0200
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
Subject: Re: [RFC PATCH v2 0/4] mm: compaction: mTHP-friendly memory
 compaction
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, surenb@google.com,
 mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org,
 ziy@nvidia.com, ljs@kernel.org, liam@infradead.org, rppt@kernel.org,
 qi.zheng@linux.dev, shakeel.butt@linux.dev, kasong@tencent.com,
 baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
 weixugc@google.com, zhaonanzhe@xiaomi.com, lipengfei28@xiaomi.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <11264869-00ad-44ea-b39c-a78347af0ee1@kernel.org>
 <20261021060059.2253219-1-zhangbo56@xiaomi.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261021060059.2253219-1-zhangbo56@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/26 08:00, Bo Zhang wrote:
> On 10/20/26 16:52, Vlastimil Babka (SUSE) wrote:
>> Isn't using  struct compact_control clean enough? There's already many
>> fields like
>>     bool direct_compaction;         /* False from kcompactd or /proc/... */
>>     bool proactive_compaction;      /* kcompactd proactive compaction */
>>
>> Who says is_via_compact_memory() cannot be refactored into something using
>> these kinds of fields and not 'order' being -1, which could be then used as
>> the target order.
> 
> Thanks, that's a much cleaner direction than reading huge_anon_orders_always
> and would also address the race I raised in the second open question.
> 
> I tried to work out what it takes, and ran into one thing I'd like your
> opinion on before committing to an approach.

I'm not going to answer your LLM's questions for you.

