Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189053;
	b=MUABnt2P1k5YHM/L2Yu6ii09dfEnV/6rUXuOMznLNySVOo6g0sF3V9pGX0pmwZ8Gymr0
	 QGgoJDGgZJxpBbq8enPNI9+jTce4/Xm/AHStgkQ8X/quMQd9zWhXLwvqmuRBVCNkc2fBN
	 fUtplKj4XQzb9TvTCsvNHyTkT1MS9YUJo97be6M98HhVhAaljz02tM/qVfr3wWjZtR+Du
	 eG+0nihBT6aR9u+yIuD1HyMLFKrSCz2JZD8bRCqU20+KgtCzMGnJ5URNz8a4B50VJr6t2
	 lawyvTzLrEPqiMaWV/zJRYuEAXKJOnYYiFQ7AF6HmV6nzTc132OhZi8BF6heqGZRZhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189053;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H7Bnt0oaHObCRAYHP9jDNv4qbPY14ASkahF3dtA4y2s=;
	b=0LcGtYesCaafL20ol/QQ6ebAB7S2WEw4pEA2fxAToo1vslx5Z2fGi97ZGHk+cCv5Trps
	 my86L0mFQYXYzKMQfh6D1jWY3Ybwyw2Iyy8kEtlFDWbO0WszTl/+OFUteZJrx9els61iu
	 vA+ppNU5YZWpVGW2XROBWXRibX3Mfhwxec2P7auLRbxC4OLosoXoWJPCPs/M+03bY5XNs
	 0F3m7FnNtjuXdtkmKIlhJY8o6fHQhHfRl0H3aCyaGudIFmLthJjudTW1IBgyHqw4LFKqb
	 EWaa5wpqNQmxP8NHPgKybxWILQHovnjYpohv1TAVJyzQgV7VxRRV80itxwnECqJUeKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PFk7jMUM;
	arc=none smtp.remote-ip=91.218.175.250
Received: from mta0.migadu.com (out-250.mta0.migadu.com [91.218.175.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1ED606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E1ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PFk7jMUM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V8t2DsGsOlEEZeIAghkdXZSawCAIBraQf2pr/ZV9ZYE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794189050; v=1; x=1794793850;
 b=PFk7jMUMChfz9psSEwtr0OYbxIi9BbBbddxigtvq7g7LihnCOYef+y/9EwqQoQz3EbSKH+QB
 hive4t5oKHrdSFuFeVI4elLql9AeINrfw/RYJd6sb8nad3FMw8Nh6pt6tEydxxQYma+r6z9b4cU
 2Nj2WjvZcoOjMDREb8OmFKD0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ab26c670e0a08f52;
	Mon, 09 Nov 2026 01:50:49 +0000
X-Mizu-Trace-ID: ab26c670e0a08f52
X-Migadu-Flow: FLOW_OUT
Message-ID: <04d2e2ba-e6d3-486e-bf38-7d6b1902eeb1@linux.dev>
Date: Mon, 9 Nov 2026 09:50:39 +0800
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
Subject: Re: [PATCH] selftests/mm: pkeys: wait for the child in become_child()
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 hongfu.li@linux.dev
References: <20261106164639.2959195-1-clopez@suse.de>
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <20261106164639.2959195-1-clopez@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 11/7/26 00:46, Carlos López 写道:
> become_child() forks during test_pkey_alloc_exhaust() and has the parent
> exit, so that the remaining tests run in the child. However, the test
> runner only waits for the original process, so it sees the test finish
> early with a success status while the remaining tests keep running in
> the background. Failures after the first fork are thus not reported in
> the exit status, and the remaining tests overlap with the next selftest.
>
> Fix this by waiting for the child in the parent and exiting with its
> status. A previous fix avoided waiting, arguing that the parents would
> keep holding their resources [1]. Particularly, the parent keeps the
> hugetlb reservation of its test memory, so the child runs out of hugetlb
> pages after a few iterations. Avoid this by freeing the test memory
> before waiting.
>
> Link: https://lore.kernel.org/all/20240419115027.3848958-1-usama.anjum@collabora.com [1]
> Fixes: e1812933b17b ("x86/selftests/pkeys: Fork() to check for state being preserved")
> Signed-off-by: Carlos López <clopez@suse.de>

Hi Carlos,

This is a great catch, thank you for working on the fix.

I reproduced it locally: without the patch, a failure after become_child()
is not reflected in the result and the runner still prints
"ok 1 protection_keys_64"; with your patch the same failure is reported as
"not ok 1 protection_keys_64 # exit=1". So the fix works as described.

Tested-by: Hongfu Li <lihongfu@kylinos.cn>
Reviewed-by: Hongfu Li <lihongfu@kylinos.cn>

> ---
>   tools/testing/selftests/mm/protection_keys.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
> index b7882ab97683..5dece144ab95 100644
> --- a/tools/testing/selftests/mm/protection_keys.c
> +++ b/tools/testing/selftests/mm/protection_keys.c
> @@ -1009,9 +1009,10 @@ static void test_pkey_syscalls_bad_args(int *ptr, u16 pkey)
>   	pkey_assert(err);
>   }
>   
> -static void become_child(void)
> +static void become_child(int *ptr)
>   {
>   	pid_t forkret;
> +	int status;
>   
>   	forkret = fork();
>   	pkey_assert(forkret >= 0);
> @@ -1021,7 +1022,16 @@ static void become_child(void)
>   		/* in the child */
>   		return;
>   	}
> -	_exit(0);
> +
> +	/*
> +	 * Wait for the child to finish the tests and pass on its result.
> +	 * Free the test memory first, as it may reserve pages from the
> +	 * small hugetlb pool that the child needs.
> +	 */
> +	free_pkey_malloc(ptr);
> +	if (waitpid(forkret, &status, 0) != forkret || !WIFEXITED(status))
> +		_exit(KSFT_FAIL);
> +	_exit(WEXITSTATUS(status));
>   }
>   
>   /* Assumes that all pkeys other than 'pkey' are unallocated */
> @@ -1060,7 +1070,7 @@ static void test_pkey_alloc_exhaust(int *ptr, u16 pkey)
>   		 * preserved across fork().
>   		 */
>   		if (i == NR_PKEYS*2)
> -			become_child();
> +			become_child(ptr);
>   	}
>   
>   	dprintf3("%s()::%d\n", __func__, __LINE__);
>
> base-commit: 843c58022865a7b0f9743416c2b48bc2632da23c

-- 
Best regards,
Hongfu

