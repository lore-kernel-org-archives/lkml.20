Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9138B455630
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812667; cv=none; b=bgBiqN9KZWblghB2z6PhxlJoQipQJRcDExSnB0LuQPYO4wqXyl1YNLgfSvzituoQzw1mKBPOcoLuRV+qmy95VrMIBIyevFQdudy3T3VAkQ1hHx6wcGHKXU1gDtnHXI7gBmTSQS8ZzwbU1CDWK0Mwunql7/pyf4Ry9EaSh/6h1rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812667; c=relaxed/simple;
	bh=u6nMCYLRnxIInvBZMpdqR+U1ioovOqHCrQzmWVyEInY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gN6VrI8iy77DKM7KF5KW7yJORDsA28rANnEMJxIANCyVdgZf7nlCxK1o9ewzs6naV46MKnLLitpBLgWfE86+lYDplKn4yEVoxARfKr0xMEkvf0Fv4wD4OhRHWw6pnwGLGG6wOzb8cluENeBPSJ6ju4YlXJaKO6DZxPAOj2I1Nyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+5S651U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+5S651U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73241F000FF;
	Sat, 19 Sep 2026 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789812666;
	bh=T6rLf9agDMyARwXvYrMSOSIy5jRBMFJCc5XZwhlIScw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=l+5S651UOr8S1vO1bGledRyKS7GVLLbQpEy8lMv6ldvYtkMWP5Ze0XUgkcqYdSyCR
	 0ya401ohT1jtFdfAvPQjqs7+2oF71svgvlRCBIXRlHNTFcNSfPMtp98fR4uWffdHTY
	 xDGGk5PyVUHwY2QOzMfqrj/DTJJR9mfmwTS0V1lB+DGEBUgureD9MmCdThXorMwTfC
	 uRcldTNp9FbPeG+pG/oy+L/gJsuoFJ49auy+m4Kw0hz/VMTxpWTb9holgN+K3bjCDD
	 fsG3oPLdi4iKvouNiOD4PvbeM1BPduGrcO9rIQgox6vSRBG30hqnXx2XiUqPSk3xVj
	 ElPtZvU5oLD1Q==
Message-ID: <0c0c19d0-997a-4c8d-a103-2b3d153f4e32@kernel.org>
Date: Sat, 19 Sep 2026 12:10:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm/memory: reuse the whole exclusive large folio
 on a write fault
To: Yuan-Hao Hsu <aa9736195201@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, liam@infradead.org,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260918064238.868-1-aa9736195201@gmail.com>
 <20260919073134.639-1-aa9736195201@gmail.com>
 <20260919073134.639-3-aa9736195201@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260919073134.639-3-aa9736195201@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/19/26 09:31, Yuan-Hao Hsu wrote:
> With blocks of 16 PTEs a PTE-mapped 2M THP still takes 32 reuse faults
> and a 1M folio 16.  Lift the bound to the page table: the walk then
> covers the PTEs that map the folio in this page table, at most
> PTRS_PER_PTE of them, and one fault does the work for the folio.
> 
> Its cost, measured as the time of the store that takes it, against
> 420 ns for a reuse fault today (x86-64, i7-12700KF, medians, ns):
> 
>                           reuse fault   fault that     COW fault that
>                           (patched)     allocated it   copies 4K
>       1M mTHP            5,400- 5,700   63,000-68,000          1,500
>       2M THP, PTE-mapped  10,000-10,500         126,000          1,500
> 
> That is 14-20 ns per PTE, about 2 ns of it the scan.  Builds that
> differ only by NOPs in front of the function take either 10,100 or
> 7,500 ns for the 2M folio, with a period of 32 bytes: the loop of
> modify_prot_commit_ptes() changes speed with its address.
> 
> What it buys, 256 MiB after fork() and the child's exit, medians of 15
> runs, two boots of each kernel:
> 
>                                    16 PTEs         whole folio
>   one byte per page, seq
>       1M mTHP                     5.7 /  5.8 ms    4.1 /  4.0 ms
>       2M THP, PTE-mapped          5.7 /  5.8 ms    3.9 /  3.9 ms
>   one byte per page, random order
>       2M THP, PTE-mapped          7.4 /  7.5 ms    4.9 /  5.1 ms
>   memset()
>       2M THP, PTE-mapped         40.2 / 39.4 ms   38.1 / 37.2 ms
>   8 threads, random order
>       2M THP, PTE-mapped          0.9 /  1.0 ms    0.7 /  0.7 ms
>   one store per 64K, 2M folios    3.3 /  3.3 ms    1.5 /  1.6 ms
>   one store per 2M, 2M folios     0.1 /  0.1 ms    1.4 /  1.4 ms
> 

Are you measuring the worst-case latency of a single write fault or only the
average over all writes?

-- 
Cheers,

David
