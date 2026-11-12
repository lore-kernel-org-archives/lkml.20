Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501884;
	b=ObPM2AMWcJykcgZ4CjvpbqhIOUz0CMq30Yabpy4R8EgrWpNjZRwAW58QasmCb9D5Q31N
	 WhkGv1iENWR13o6qa5BeexG2xd02Ky2li17sLPZeLkXso3Z0UBT3NPdr5Ud+tBMlGLUf4
	 xDwx6ULnD1f1jblx4xa7QOB7eARN44uweibMvL29TUcT/pxiPwMkjH/gyNLBaZfncNuvk
	 EvoRJ6EsShe+VVun5pqRuV0ejLE3uL5gnEsu5Ojskzu6/cVyvDQxv5zJah737S8V9AZLz
	 td6uHuV+dG2jLjVMI+XuwWVuHH0jtyH0BqDmaFyGS1dqL5mOsRjP/V1kKLQL0an9p9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501884;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wH/2gBEdpxp8UBeVAcys5rd13wXemB1O143+nbBPh6o=;
	b=K/WuciFlMcVTPfwnx/57vOXLCqXyJIgsKsaPfpuEfzuz7Jd1phkTX3IObRa5Oi4fI6ZH
	 uyR2s3T5Hj8n/4eOrKI3jE4ej8jXPJ7O6F4p63DkO7sKiv8hDkTtiHKreCRiQjVjRE40v
	 UPOTou/XC2+0AE77lvqSo7yxd/oDSFd83QVH5rqCJjkog9Qo0bgv7UVnrNyL2kbf4N9QA
	 21E+DTM2TRk7qULtEIjL1Mg2xldkkypZ9MCeNPLIzjNLz/JigGMwN+IRjzUcXmnm6r7dx
	 Ox/iAMSW4ZA4S6quhIhZsfuBPduOhotqTzO2/XJNZ2rvSLv/R9Sly+WgXNc7yi7sGhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KQnClF0U;
	arc=none smtp.remote-ip=91.218.175.46
Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293E9606A88B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 293E9606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KQnClF0U
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yuRDaN/g6NhM222+4RRlCyCrWE0jFiozuoxcmO1nhMk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794501880; v=1; x=1795106680;
 b=KQnClF0U6aNVHl2emoF/U+SxdQmy4deR4rBHqtjlPsesMwQQC2VHjO553AYBMamYl5KYF2/k
 jipr8HO7Alqe4k8pm652MU+V+t5PfsvLPHiQNEcc6CshiEB7uzQ5Wxn8F3JnMxE8nZef/lADEME
 xyB8aMGk9Bocmd8bWsvfcndA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 50b709560c217e5f;
	Thu, 12 Nov 2026 16:44:40 +0000
X-Mizu-Trace-ID: 50b709560c217e5f
X-Migadu-Flow: FLOW_OUT
Message-ID: <7ffdabc6-27f3-440b-97e6-94c7f66c807a@linux.dev>
Date: Fri, 13 Nov 2026 00:44:28 +0800
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
Subject: Re: [RFC PATCH 00/39] sysctl: replace overloaded extra pointers with
 typed bounds and context
To: Joel Granados <joel.granados@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793204511.git.wen.yang@linux.dev>
 <20261029105837.2f8bee67@pumpkin>
 <0316f664-d98c-43be-92af-13c30436727a@linux.dev> <au85ISJ2qUsB7y-6@hobbes>
 <20261107170507.0d66cc2e@pumpkin> <avGVyB9erjZl8zIO@hobbes>
 <e3c7bf98-64f9-4c29-b300-f54b7a4813d0@linux.dev> <avRVHIx-6nA1mP2F@hobbes>
Content-Language: en-US
From: Wen Yang <wen.yang@linux.dev>
In-Reply-To: <avRVHIx-6nA1mP2F@hobbes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/11/26 19:55, Joel Granados wrote:
> On Wed, Nov 11, 2026 at 01:45:15AM +0800, Wen Yang wrote:
>>
>>
>> On 11/9/26 18:07, Joel Granados wrote:
>>> On Sat, Nov 07, 2026 at 05:05:07PM +0000, David Laight wrote:
>>>> On Sat, 7 Nov 2026 16:27:39 +0100
>>>> Joel Granados <joel.granados@kernel.org> wrote:
>>>>
>>>>> On Mon, Nov 02, 2026 at 11:40:40PM +0800, Wen Yang wrote:
>>>>>>
>>>>>>
>>>>>> On 10/29/26 18:58, David Laight wrote:
>>>>>>> On Thu, 29 Oct 2026 00:34:39 +0800
>>>>>>> wen.yang@linux.dev wrote:
>>>>>>>> From: Wen Yang <wen.yang@linux.dev>
>>>>>>>>
>>>>>>>> struct ctl_table describes an entry with data, maxlen and, until this
>>>>>>>> series, two untyped misc pointers in extra1 and extra2. Those two pointers
>>>>>>>> have accumulated at least seven unrelated jobs: a fixed bound, a bound read
>>>>>>>> through a pointer on every call, an object or namespace pointer, a small
>>>>>>>> integer cookie encoded into the pointer, a lock signal, NULL standing for
>>>>>>>> "no bound", and a value the core itself casts to unsigned int while
>>>>>>>> validating a u8 range. Nothing in the entry says which job applies, so
>>>>>>>> readers infer it from the handler, and the core gets it wrong where it
>>>>>>>> treats extra1 as an unsigned int.
>>>>> <--- snip --->
> <--- snip --->
>>    for (i = 0; i < head->ctl_table_size; i++) {
>>            entry = sysctl_entry_at(head, i);
>>            node = &head->node[i];
>>            ...
>>    }
>>
>> Insertion/deletion would take the node directly. Readdir would retain
>> its RB-tree node cursor, recovering each entry through that node's header:
>>
>>      entry = sysctl_entry_at(node->header, node - node->header->node);
>>
>> No entry - head->ctl_table, caller slot constants or per-slot wrappers.
>> RB-tree order remains unchanged. Old APIs and generated directory/link
>> tables use sizeof(struct ctl_table).
>>
>> The two mechanisms have existing precedents:
>>
>>    /* include/linux/bsearch.h: explicit element size */
>>    pivot = base + (num >> 1) * size;
>>    result = cmp(key, pivot);
>>
>>    /* include/linux/hwmon-sysfs.h: extended descriptor */
>>    struct sensor_device_attribute {
>>            struct device_attribute dev_attr;
>>            int index;
>>    };
>>
>>    /* drivers/hwmon/adcxx.c: ordinary device_attribute callback */
>>    const struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>>
>> hwmon registers &ad_input[i].dev_attr via device_create_file(); the core
>> passes that same base descriptor to the callback. These are precedents
>> for explicit-size traversal and embedded callback context separately,
>> not an existing strided sysctl registration API.
>>
>> I agree that my fixed-slot solution adds maintenance overhead. Would
>> it make sense to explore this in three small steps?
>>
>>    1. Entry-access helpers, unchanged packed layout.
>>    2. Header stride and compatible registration wrappers.
>>    3. nf_log conversion and code/memory comparison.
>>
>> I would appreciate your thoughts on whether this is worth pursuing.
> 
> Hey Wen
> 
> Without a series, it is hard to see how everything fits. Maybe you can
> send out an RFC with just the changes to the sysctl core and one or two
> examples of how it would be used in the more involved users.
> 
> The rest of the users can be "vibe coded" (so it compiles) and put into
> one big commit that we will ignore for the first RFC. Just so we get a
> clear idea of what you mean.
> 
> Tell me what you think
> 

Thanks.

That makes total sense. I will prepare a focused RFC series based on
the next-20261111 structured as follows:

Patch 1: sysctl: add numeric bounds and core stride infrastructure
(ctl_table_stride in header, sysctl_entry_at(), register_*_stride())

Patch 2: sysctl: cover numeric bounds and table containers in KUnit

Patch 3: netfilter: embed logger sysctl context using stride
(demonstrates the use of container_of(), and also eliminating some 
wrapper functions)

Patch 4: net/ipv4: embed device sysctl context using stride
(demonstrates the use of container_of(), and also eliminating some 
wrapper functions)

Patch 5: scripts/coccinelle: add script to detect and convert sysctl bounds
(provides automatic conversion and proves that no extra1/extra2 fields 
remain)


The ctl_table_stride and type are packed as u16 in struct 
ctl_table_header, yielding zero size increas.

I will send out this v2 RFC shortly for review.



--
Best wishes,
Wen

