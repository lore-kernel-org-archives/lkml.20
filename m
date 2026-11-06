Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968868;
	b=1L4IyDR9ucW8iYurbMX+taV40C/8uCT1QMfiCg/kwXhLJm40e9YGsC1fWRunfqbE4BVC
	 2vNXb0lsvpWDGKg5OovmF2dEuPqkonqi2IDICldfiEuzLZrJkWJu0zaJ20fXsu0MPsTi5
	 uM9NjfbKHXWRoj0JYvZrOlkhxN3YQyw8zGmI8I/0PcITNr53WZ20eKqBChDE88xghPPO9
	 /4H7vAOzwBNn5BI19X0u8xULLMOtXnG5LzfUDFfLJqEPtf5LeDcyRf8rdmGtM1iRP9rNw
	 S/Rhq0y61WrUgHpKwbQDf+DccweQDkexb34u6PHWXHkl+9YNWzQVVlJj5wMli0VwAWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968868;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZMBLae3lRuQDJK5QznjTjPOTuJ0ZooX11mmURXzsTDM=;
	b=D7RUxhN6VVG4YgZQaFfCRoPT0rPvQBoMIxkL/uGTpFzlfK79ZqvYHPVHBF9fzJmy7VzV
	 M/+Z7Sr2O3VTopcQqcS152eRdIJirIIUSJUtbeS/4R8OFBtFMAGIhcyzr1zhWInGNcZ94
	 PBhx5XMK2ZkWg8pIsjpfMAzBnFXb+WDoRyjP6pF4GyUXxwOYqjgrkOAqzStMu9ta2jtbm
	 GLA2RTg9Vw59XbummTp7MF3BL1JKRTAiRlmd706+HLPPgONWVCLar6acWNDce452IOrOz
	 OLjC5FaoDFR/n26NelK9wrNB1H7R++36FH/l6cKVUwLufpGlp9cBlnuQ2xdIC/zlFjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KwGf57n+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F09606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KwGf57n+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63EBC1F0089F;
	Fri,  6 Nov 2026 12:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793968868;
	bh=ZMBLae3lRuQDJK5QznjTjPOTuJ0ZooX11mmURXzsTDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KwGf57n+IdbnSA897QNUk9FhDl35OB3Kr0WdR+I9Mzbe3v4qTt3YJfgqGDgLiJMAB
	 r29pxm8iMC+2ftYzjas6w3kIuA2X1WdZpFBl70KY3k70BgHZ13kOef7qLy8hYMydlR
	 +weneF/AeXum482c1y/aCaC6XHpvbVW6w8rvBg7S+nj2m5ll/YDK3JzIuA9TE0/01u
	 GtO3yAGLNy14yqF6Ne1U6ZPS5tJvZKuWF0JOfvRxTyWWq5meJPDEUW5Vq6EUi5TW0I
	 9+yFtGraxcTbfWi+qnYgORUzIEkhSOCdw7uOUN3fsZ5yEfqmWJnCYyQVXGQLhnz6wu
	 GDBJK7TqukpvQ==
Message-ID: <455e9728-33c5-44c0-84ef-d6b764c6d9db@kernel.org>
Date: Fri, 6 Nov 2026 13:40:58 +0100
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
Subject: Re: [PATCH] mm/ksm: avoid unsafe anon rmap dereference in KSM merge
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Rik van Riel <riel@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261102-ksm-anon-rmap-fix-v1-1-68962acfb59b@kernel.org>
 <179387163181.11797.15205182972949028650.b4-ty@b4>
 <75926835-508f-48d3-a5d9-176cea61546d@bytedance.com>
 <au2mm0Y9PdumuzgE@gremlin>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <au2mm0Y9PdumuzgE@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/26 11:06, Lorenzo Stoakes (ARM) wrote:
> On Fri, Nov 06, 2026 at 10:43:45AM +0800, Zhao Gongyi wrote:
>> I tested Lorenzo's posted patch on Linux 7.3.0-syz-13001714+
>> with CONFIG_KSM=y, CONFIG_KASAN=y and CONFIG_SLUB_RCU_DEBUG=y.
>>
>> An earlier unpatched run of the fixed-pool KSM/mremap reproducer hit a
>> KASAN slab-use-after-free in page_address_in_vma() after about 342 seconds.
>> With the patch applied, the workload ran for 12 minutes (1027 KSM full
>> scans) without KASAN, BUG or panic. The fork/COW smoke test passed.
>>
>> ksm_functional_tests reported 8 passes, 1 failure and 1 skip. The
>> "ptrace write failed" failure is a known test-environment issue; dmesg
>> showed no kernel error.
>>
>> Tested-by: Zhao Gongyi <zhaogongyi@bytedance.com>
> 
> Thanks!

Indeed, appreciated!

-- 
Cheers,

David
