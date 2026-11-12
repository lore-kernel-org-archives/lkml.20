Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456553;
	b=UNl8tuIS00AwWtqCEntWO6Csr6XyjIc/t1yRUAJWNwn/442+rkKVkslMSw+CDjrr9nhj
	 onDEFqtSfflPAdBE6AY6rk/d+NzVrUTkefKa1m8ESNZ8E+TNpruU0VH1aJZbIunSm8k/q
	 6dtW9dMH53Is926LlIYYEUE25O9E/XHGRmMJpavbUqjN+XTCajp3PmqBXh7iDPWIINjDL
	 cvUhZwUW5mGD4cArMoJ+jTucE9u+UTqGgbXSX5EUAwke9HRkQde3Z7WkupjfRVsK6YBCG
	 O2fHMEH6W8kWoqFABWoxElOLKtwCmZZ1BrihvnQ8LlaL6jdzhQzIvVBqTRLcncUK/YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456553;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VS8RosQ7Mux59cIuf5XHj4vRHRXjMhFY96bD3y9PkDE=;
	b=TbcEiF+WUN599cg0SjtPgqH7JOIb79xcq2hel7UokkSZbF4If1LLnHd/B40CpePJdc/N
	 ywp6vqGrstdnzWAbgj/Xf3ApYOPw4gIAgZ7a51S7EylcqjIbP1zyNg7h/RBtMZSpd1f5W
	 QBxfQe7Qo7zK/kO8/du2XWP6Vo1hFfFg+a94sQSsUDbeaLumQOfZvseJs/ulqGlsUZE20
	 5lwbdTRlVI/4xSQLDTQVZpnCkONEB3Dmhg+ikiDR92U81Ld8fk/c+uKJB1Sz5rv/ws5+0
	 S2NcHetgBflS0J3HC6TILsaJSdtcfslw+akJVxIua1EiXG67x80rAZSbkn86wVYRvbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="tBcJwdp/";
	arc=none smtp.remote-ip=91.218.175.192
Received: from mta0.migadu.com (out-192.mta0.migadu.com [91.218.175.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B67606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B67606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tBcJwdp/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=s6A3fpSYhAtucJpRw/v86R3GejerzlqSOIV0sEbV3eM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794456549; v=1; x=1795061349;
 b=tBcJwdp/chj7cICbIOZJtNi/g22vMDLnWegKjCqfTwmbDrn+5bJa3kq7V6sNjIPD4P4xxgmV
 c7vo4vRWsScGHIy04Wd0HmwX3Ehbv6NhRu8nIogN2jFOapD800jRMxTgCmY0QLbNQjZ2fI6SflH
 7r0NyLcD4NmpaNF1K9Ff33hk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 90e30105e541158b;
	Thu, 12 Nov 2026 04:09:09 +0000
X-Mizu-Trace-ID: 90e30105e541158b
X-Migadu-Flow: FLOW_OUT
Message-ID: <d4ccbdc4-bb85-4301-a6e3-e5e1e2f0d299@linux.dev>
Date: Thu, 12 Nov 2026 12:09:05 +0800
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
Cc: hongfu.li@linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/mm: mlock2-tests: fix fclose(NULL) in
 is_vmflag_set()
To: "Liam R. Howlett" <liam@infradead.org>
References: <20261104-for-mlock2-v1-1-57e6dd74c2bd@kylinos.cn>
 <t4vjvdkdvmqcagvhw7z3p2x67p3iopcjqllrapwrzd7qyothb4@un6bq6otzb7w>
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <t4vjvdkdvmqcagvhw7z3p2x67p3iopcjqllrapwrzd7qyothb4@un6bq6otzb7w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 11/12/26 03:49, Liam R. Howlett 写道:
> On 26/11/04 04:49PM, Hongfu Li wrote:
>> From: Hongfu Li <lihongfu@kylinos.cn>
>>
>> is_vmflag_set() jumps to the shared 'out' label when
>> seek_to_smaps_entry() fails. smaps is NULL on that path, and the
>> code at the 'out' label calls fclose(smaps) unconditionally.
>> fclose(NULL) is undefined behaviour, so the test crashes before
>> it can report a test result.
>>
>> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> The sending address should match the sign off.

Sure, I'll send a follow-up from the same address.

>> ---
>>   tools/testing/selftests/mm/mlock2-tests.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/mm/mlock2-tests.c b/tools/testing/selftests/mm/mlock2-tests.c
>> index 144b550813a6..85e6cd24515a 100644
>> --- a/tools/testing/selftests/mm/mlock2-tests.c
>> +++ b/tools/testing/selftests/mm/mlock2-tests.c
>> @@ -66,7 +66,7 @@ static bool is_vmflag_set(unsigned long addr, const char *vmflag)
>>   	smaps = seek_to_smaps_entry(addr);
>>   	if (!smaps) {
>>   		ksft_print_msg("Unable to parse /proc/self/smaps\n");
>> -		goto out;
>> +		return false;
>>   	}
> This looks better.
>
> The next function is also messy with the goto usage/ordering of
> unrolling and should probably be changed in the same way.

Thanks for the review.

Agreed, get_value_for_name() has the same pattern. I'll handle it in
the same way in v2.

>>   
>>   	while (getline(&line, &size, smaps) > 0) {
>>
>> ---
>> base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
>> change-id: 20261104-for-mlock2-a67f86dad498
>>
>> Best regards,
>> --
>> Hongfu Li <lihongfu@kylinos.cn>
>>
-- 
Best regards,
Hongfu

