Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387876;
	b=k27/Ox4TWU8oW4gL4wFZyrqFaxMhq6jtjCM5BsKJRWOObIc00MVvFoOg0uADst5AVT7t
	 fiWrH3dZSnRwQrL/a0CA0dDzY+5QxF40sf13GgTI+S73p41rrZVshs7CzCnmwxd89bPX4
	 Cirpwfz7MQjo9pkc2qoJVB1Eh0gJGHxU0XLuId9Deqd1FizO2hNGZ6wTkNl7txWbIuilS
	 1FpejGJQ1XyNgP9bqwyjiU3DlqIord5fYaCsOSXeElnUrugcKhQEndTN4hk2mRE533Vpq
	 I4bt16EqgMjOWQvEGVvUzahwo4kCaMs0Jxza1lGhMWVASL1wglg4TxjGURrP93fg1rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387876;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZBkGXYJ5uxFZJke1jLpVYYWUGbr8za+HvWOrId41WTA=;
	b=R0Sr6paqG7BmpZd1DOFFV9X65X0LxLEYOrm1AFbWIpbNuwO5VnB0jqQxyXf+nK91IfIX
	 Y1T/+dSGmzK7/UsG8IWLTS2Ww0c/EeUdp+uoFt96ogimTv83i3Zgdi8nNM+/ol9KFE72+
	 2hw2zS06eM0Ep1TPTVqPNhigqeHiAbFFX+KlhvXLrmU8s/giQJK6PqJQBXxKGjidKWwT3
	 psdH846+OHWwNWR5ZqVntbIREhus+krhnnyCr1/dhNLExks11ky4C3U4QV4MIeBJtLhuo
	 jVJHctmuHGpVBYxxcmm3RA7ZcTltoqgf4YcpRbGcBoPPMjKaQ9onwj7H0dLLbi3VAsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6KBGWfh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005A3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6KBGWfh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1CF1F00A07;
	Wed, 11 Nov 2026 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794387875;
	bh=ZBkGXYJ5uxFZJke1jLpVYYWUGbr8za+HvWOrId41WTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N6KBGWfhAsqq49Ypu3lDBMxqXXdjm4CV7xGFJeWEVztIkjhmav6bMWNwwr3p3lQSa
	 x6Bt7hV48QMhggC0ZAGqMKLOB4OCI/KlMJVqGU278cRUJvwV9kVouMMLrR4ICoJ+DK
	 gV0IbjZLNeHmhQheRwBSLfMNe5MtbXFHMx+/OxMQI7MdTgkZjC/Gu+39ZYGh9czEyg
	 uc02Iac5slV9rct3aidTyvZtTzdpcAW/1QJ3B5vfZiKn96FQdHfZfno2/XO7kUkjZU
	 Hn/tEtbKTCsTxZ/4Tv+Bqn/zV37zfydtdirH3DdVE3uj8TGxgvMZHS63IkiE7+r3pK
	 Seqgk6wBx/0iQ==
Message-ID: <444d9b9e-df1f-4981-b200-969d64d0ca41@kernel.org>
Date: Wed, 11 Nov 2026 10:04:28 +0100
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
Subject: Re: [PATCH 2/4] ksm: skip rmap_item allocation for non-zero pages
 under only_merge_zero_pages
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: ljs@kernel.org, akpm@linux-foundation.org, chengming.zhou@linux.dev,
 link@vivo.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 tujinjiang@huawei.com, xiao.wang@vivo.com
References: <avMKhCLDv-ybpmIZ@gremlin>
 <20261111083632.57199-1-xu.xin@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261111083632.57199-1-xu.xin@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 09:36, Xu Xin (vivo) wrote:
>> On Tue, Nov 10, 2026 at 07:22:06PM +0800, Xu Xin (vivo) wrote:
>>>
>>> Indeed, the description was generated by LLM, but I thought that was clear enough
>>> to present what this patch do and why. Aparrently, you don't like that style, I'll
>>> rewrite that by handd.
>>
>> In general we never want LLM-generated commit messages/comments.
>>
>> I do however obviously appreciate and empathise with using it to assist
>> non-native speakers. So that's fine, but ideally you would write it up yourself
>> and then have the LLM do simply a polishing layer, keeping the length as small
>> as possible, which should give us the best of both worlds. Thanks :)
>>
>>>
>>> The goal is only to avoid rmap_item allocation for pages that can never merge
>>> under only_merge_zero_pages. The implementation is simple.
>>>
>>> I'll send a v3 with those changes.
>>
>> Well let's wait on David's POV on this series for this cycle before a respin
>> first thanks!
> 
> Thanks Lorenzo, makes sense.
> 
> Hi David,

Hi all,

> 
> What are your thoughts on targeting this series for this cycle? I understand
> you have a lot on your plate having just taken over mm/core.git and are
> focusing on bugfixes right now, so I'm fine with deferring this to the next
> cycle even though the implementation itself is fairly straightforward.

Patch #1 is rather trivial to review () although I will have comments.

Patch #2 needs more thought.

I don't mind something that is easy+quick to review, but if it takes way more
time, it will have to wait, unfortunately.

So the cleaner you make your code, and the easier it will be for us to review,
the easier it is to make it go upstream.

Schloppy LLM text achieves the opposite :)

-- 
Cheers,

David
