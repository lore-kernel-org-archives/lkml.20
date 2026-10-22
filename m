Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.88
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672747;
	b=PgZIqVxeqvtd/FeeKkDfqjAhVqHWbxgUYSJdjwcLIu0XmpDm6oueJL6EZvhh6zbX7gXd
	 7Lss62JwNrRHKkqVLWakgp2DPS6agl8MnXA/gqJoiZp9DW0lZJ3vqe9CgSdXBPJEAiU9Y
	 mRfaccPME37voS2asBuJg9ZjVyx3/fJLFyYr1EKYkYIWNLyvvFBrA7kgbMeSzy3X1NaD9
	 kPFcFnduHC/Y26+QpUkh9Ao0uiA9iGBY9ekBdIMpAHO9oqCOXNzpfDqwUGhmrIG7UnULg
	 5k136hZb6WcV2CdEekL/Sc6xjb3PV2xkltEiEVzYxznGQaVshQQQYYwpfl9E809DDbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672747;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pEn/o5vicVIiycYibVKL0UsnyzA/YANniegdeifG/s4=;
	b=U7WeZxt+l3CjcxjX2EVHW4Ttl2CnqJv3aadEh1qL1VYRpby5XW1H40hz/fX6iWfxUkUQ
	 DgdcMIBkrWkk8zbjWRXtfmjAEWB3C/6VDHO3cQPs/3TfyNh387pQG6saXJqZoLF8qBaFF
	 NXQeguyxuY3suVJpdFRpAnSeQVsNQ+39OZLoE81d4q1s3UEYyB3IKl7y+Xv778woi6eIV
	 jDlgWLWesodNRcXhV22HLjMx1VeWh56UjxwBuW1rGSUSVgrvLIdxdU0vhhHaW92JudPau
	 Xl9f/HvY0GETSlfqijjOAqAcWE1MldoBeOS0PQko79Mz0UFW638RVJklG52kmy2Qz0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nOjz2OQr;
	arc=none smtp.remote-ip=95.215.58.88
Received: from mta1.migadu.com (out-88.mta1.migadu.com [95.215.58.88])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F7D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F7D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nOjz2OQr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eP1LGnMko9h7Km3zC9LDbu+hXl6U04EeI1vwWmy1Fx8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792672742; v=1; x=1793277542;
 b=nOjz2OQrNk73XSno40Pf6U+nyDPsxvXMg4Tzqu4XgyDh2uEuEgCHK2p2C2bA9C8LDoRDxZK6
 Etz7Wfkpzjiw9Pi2gsbiPjcPJVKoaPWH2xan2mkgzK7BDj7DeCG8IOWrMvCHBKlm2jbGMarSqDn
 Up3bysopPUfk3R73vnQkcyXA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 33f383ea385dc4c6;
	Thu, 22 Oct 2026 12:39:02 +0000
X-Mizu-Trace-ID: 33f383ea385dc4c6
X-Migadu-Flow: FLOW_OUT
Message-ID: <58cfeba3-a3c0-426e-ba97-8f82da5b1e8d@linux.dev>
Date: Thu, 22 Oct 2026 20:38:53 +0800
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
 <49966df8-c092-40de-a05a-ff6d69382dd4@linux.dev>
 <e4c3ce3a-c19b-418a-a92e-40e077f1ea63@kernel.org>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <e4c3ce3a-c19b-418a-a92e-40e077f1ea63@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/21 16:27, David Hildenbrand (Arm) 写道:
> On 10/21/26 04:49, Kaitao Cheng wrote:
>>
>>
>> 在 2026/10/20 21:58, David Hildenbrand (Arm) 写道:
>>> On 10/20/26 15:31, Kaitao Cheng wrote:
>>>>
>>>>
>>>> 在 2026/10/20 21:07, David Hildenbrand (Arm) 写道:
>>>>
>>>> It does require architecture support, but that doesn't seem practical, haha.
>>>
>>> Well, but that's required when an arch wants to rule out all races.
>>>
>>>>> Will architectures that are not prepared for copy_mc_user_highpage() not simply
>>>>> crash if they trigger an MCE during an access?

After thinking about it, if the memcpy here is guaranteed to cause a crash,
wouldn't the system inevitably crash at some point anyway, even if we check
folio_contain_hwpoisoned_page() beforehand and return early, since this kind
of memory error is unrecoverable?

If the system won't crash, it seems fine to defer the check as well.

>>>>
>>>> Do we need to check both before and after the copy? This feels a bit
>>>> redundant, and I'm not sure whether such a small race window warrants
>>>> an additional check.
>>>>
>>>
>>> I don't see how checking after the copy makes any sense? :)
>>>
>>> You already crashed if there was a problem, why check? Or what am I missing?
>> In cases such as transient errors, software poison injection, repeated
>> bit flips in memory, or bit flips in the ECC check bits themselves, a
>> page may be faulty while memcpy() still completes normally. If the copied
>> data is correct, only the PG_hwpoison flag is lost during migration. But
>> if the copied data is corrupted and the kernel or a process subsequently
>> treats it as valid, I think the consequences could be more serious than
>> an immediate crash. However, I cannot estimate how likely this is to happen.
> That's the point, me neither. I'm happy to perform checks before access, or
> after, in the default copy implementation, but I want to have properly
> documented how this makes sense and which races exist.
> 
Here are a few subtle corner cases I came up with. They may be extremely
unlikely to occur. 

case A:
CPU 1                                           CPU 2

if (folio_contain_hwpoisoned_page())            The check passes because
        return -EHWPOISON;                      PG_hwpoisoned is not set.

                                                A transient bus error occurs,
                                                or the flag is injected by software.

                                                PG_hwpoisoned is set.

                                                The bus temporarily returns to normal.

memcpy(new, old);                               The copy succeeds and copies
                                                the correct data.

                                                PG_hwpoisoned is not propagated
                                                to the new page, so the flag is lost.


case B:
CPU 1                                           CPU 2

if (folio_contain_hwpoisoned_page())
        return -EHWPOISON;

                                                A memory bit flips, causing
                                                an ECC error.

                                                PG_hwpoisoned is set.

                                                Other bits in the same byte then flip,
                                                or the ECC check bits themselves flip.

                                                ECC check passes.

memcpy(new, old);                               The copy succeeds but copies
                                                corrupted data.

                                                PG_hwpoisoned is lost.

                                                The kernel or user treats
                                                the corrupted data as valid.


-- 
Thanks
Kaitao Cheng

