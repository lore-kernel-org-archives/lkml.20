Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550990;
	b=c08Tkju1dHSkriAkwu/U2Uc1/ScFetwBVj6X1SVisl6voDMaSrzZPltLweL36sVJLa7r
	 YVWHJKGVPykxRvVpUI5L9X/zyGTGxYBUgPJ1RWfBFbN7TtphE0FLfAGDLdgGtERDCTwy/
	 qJLa3zbq5eNPOQYUy7Mowgse1SeCx5xTLtnAU/QlOSNXHtcRdK2eH0RdrNViWIHn1WNTB
	 7rADBxOlLOn5G1hBufxu5jx61+HEqqcRDl2CUCLZd3E6AhDY+M5Gem9U7oWGEL3I/l0y4
	 UFLDapHqSp8rxc2SYnnKVv3cwUP/XZ1+yRtvAzTcH6b6uR3P3GGO1SWiQdycWij7/tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550990;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=d+NcK0DTs57+vVGbRZ1r7hBBNrTBEdI/I/AT/KU8aM0=;
	b=MDKhlrvN9xYyxywhXgJzoi0ClW1nQOfPz4aX8Vqe1SXm5gkK8cbyXFONBXN8QIB4ABy8
	 6oWeo2/pAK6S/+k780e8Ks5TdiOyHwFs7MfB30Rl8/xc5NqyZpk69WPji9vx9zMoGShpR
	 MS/REuIaFYisB/uGQCz7h4+NHYO3U8iDZlp5hutByjFBa+EdhJuhdOcrJBq79AB/+fpL4
	 c7Rk1YTVYkapUsIzTOS916zcR3pzTyxspjhNB5gadKW8ul2FWA7CPoJf1qZefBLawjHJu
	 9bRNQvjFAHbBlAgnV7tp5j7iMW68RcsOttRQozygOknWT2rpQRlBww02CywSKs5H+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e1JtPrG1;
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66DC606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C66DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e1JtPrG1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7HL9R8UsN2zMXkrkizxTIyjEphJ3Yy0GVd7C7cCL//A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792550986; v=1; x=1793155786;
 b=e1JtPrG1Uey/OUeY47nHEo/2dzWZ6ZzXdjNvcv6oMEFwkG2Znm1xuDzxYcG8kYperJUO9TP+
 drwsEbLXjITD46o5T3cObzDzwFVJ3NHqdVvQGWrBy4Rd1CfWKdn/d8LqD5djfe4NgrvRbJ0DWCr
 4UylqJpzgzyxxb2esdK7dJ1Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 5d093a78203f7ab2;
	Wed, 21 Oct 2026 02:49:46 +0000
X-Mizu-Trace-ID: 5d093a78203f7ab2
X-Migadu-Flow: FLOW_OUT
Message-ID: <49966df8-c092-40de-a05a-ff6d69382dd4@linux.dev>
Date: Wed, 21 Oct 2026 10:49:38 +0800
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
To: "David Hildenbrand (Arm)" <david@kernel.org>,
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
 <9da90d76-031f-4211-b9de-439cbf7bc63d@kernel.org>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <9da90d76-031f-4211-b9de-439cbf7bc63d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/20 21:58, David Hildenbrand (Arm) 写道:
> On 10/20/26 15:31, Kaitao Cheng wrote:
>>
>>
>> 在 2026/10/20 21:07, David Hildenbrand (Arm) 写道:
>>> On 10/20/26 13:27, Kaitao Cheng wrote:
>>>>
>>>>
>>>> 在 2026/10/11 21:14, Huang, Ying 写道:
>>>>
>>>> On architectures with hardware error correction and exception recovery
>>>> support, accessing faulty memory automatically triggers an exception,
>>>> which itself guarantees atomicity.
>>>>
>>>> On architectures without such support, even if we implement this logic
>>>> in copy_mc_user_highpage() and copy_mc_highpage(), checking the hwpoison
>>>> flag and copying the data remain two separate operations. They cannot
>>>> be performed atomically, so there is still a race window between them,
>>>> however small.
>>>
>>> Yes. And you need proper architecture support to fix it?
>>
>> It does require architecture support, but that doesn't seem practical, haha.
> 
> Well, but that's required when an arch wants to rule out all races.
> 
>>
>>>> Moving the hwpoison check after the copy might address this issue.
>>>> Is there anything wrong with my understanding?
>>>
>>> Will architectures that are not prepared for copy_mc_user_highpage() not simply
>>> crash if they trigger an MCE during an access?
>>>
>>
>> Do we need to check both before and after the copy? This feels a bit
>> redundant, and I'm not sure whether such a small race window warrants
>> an additional check.
>>
> 
> I don't see how checking after the copy makes any sense? :)
> 
> You already crashed if there was a problem, why check? Or what am I missing?
In cases such as transient errors, software poison injection, repeated
bit flips in memory, or bit flips in the ECC check bits themselves, a
page may be faulty while memcpy() still completes normally. If the copied
data is correct, only the PG_hwpoison flag is lost during migration. But
if the copied data is corrupted and the kernel or a process subsequently
treats it as valid, I think the consequences could be more serious than
an immediate crash. However, I cannot estimate how likely this is to happen.

-- 
Thanks
Kaitao Cheng

