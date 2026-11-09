Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226548;
	b=U8j8uzAbP/CJr8+VFmnGSmM5mcmlp+QA12C9t9oiLyicM15O8cQYencKjwPXfr7k2Ruy
	 6YMyWyKg2QPf5YE1svhLnbmer50YPi6toE8ICZ8HefElBxsG7C45dFwx7VYC5n+e9feFB
	 eks2e3RfrogNGVAyfWLB29l0TGESUjN6e9QVFUvbRaIrd24xNHf/lhZYcMT/KV1uXXywQ
	 WzZG29S9bNsglEEEqLIUFDYeqk7OaYmOuMZkE/F0zZn9UtXdfRPkeobY368DImFre6COI
	 o+ZyYZT4BtsWs+fIoRNZUi+5N8cB88pvFeqfhRTQrZwCDoQyxBdjPoqtE9r5StQyRhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226548;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=EIhCSwebmDFcQc0LqZVR/7j2ncT1asAZ058Iwo/cnck=;
	b=ihyaP8G5OaGXe2NrtNt3WoukpWYC/5rPjdpU/Ruw8EISj32Q5H5AAlKxINJY+Tgtpqcb
	 aeTdrCpHL56R90o4PnFOvzZ+eP0ehw3fxDazcOoY5U8OR9yBnM+PeEtPHEe58YuPtlheP
	 OhHWnL0NxbeqDDkc7zzVW31K4UBKruAOLb7SOI1QvYN1DO8/3vDHwx5YcqSyVg9P0J0VI
	 ZW8lqatbUqFhxOtbcuSWoueRuDZXMYVQl6O7ZgNOCLCax3o3sxddT5y5qIMHl2dkwuJMw
	 7S3XIOtQGrxdqq3dYPbBHvEeMngHt8e00yk+rf3XFx5SUA+ePCjG9rVqpYITNUEQ/SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDx8aCcn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090D3606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDx8aCcn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5EF1F0089F;
	Mon,  9 Nov 2026 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794226547;
	bh=EIhCSwebmDFcQc0LqZVR/7j2ncT1asAZ058Iwo/cnck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FDx8aCcnP7gO/3MZ60mWa5FLcJdXxpLlf+ls+Ut66aE2mMZLswYpyfeP8pGvudqQV
	 YBeGFMET/TshJW9EVjuZktAHfO+SI2cMHLK6OfjqdERbJoCIo6dW+2w7aH2AAiPMUJ
	 mJZu+CQDePB1Elwxsx4BRcXI7r3ozgyPqBr6CTsJRZ5+NvF1NQ/RbW9Q5ZVdNz+K05
	 YIoDwOAz7CiHduy/oN+MwU/DBTEKUlYcsFYSOGynHd9Bx38Zq5bYIryS77cZSKzupw
	 +AM1UEQIpwGS8etGtiXGJ4Lz+nxpNnvcld6Xf3hReMbdlHL61ZsH+Wao2Mi9IH1Tzt
	 hhRorpD6u/sQA==
Message-ID: <22e06030-92b8-43f7-96e2-ac3b168bf6fd@kernel.org>
Date: Mon, 9 Nov 2026 13:15:39 +0100
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
Subject: Re: [PATCH v2] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
To: "Garg, Shivank" <shivankg@amd.com>, "pfalcato@suse.de" <pfalcato@suse.de>
Cc: "Rao, Bharata Bhasker" <bharata@amd.com>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>,
 "vbabka@kernel.org" <vbabka@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "surenb@google.com" <surenb@google.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "Salunke, Hrushikesh" <Hrushikesh.Salunke@amd.com>,
 "liam@infradead.org" <liam@infradead.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mhocko@suse.com" <mhocko@suse.com>, "bp@alien8.de" <bp@alien8.de>,
 "ljs@kernel.org" <ljs@kernel.org>, "Nayak, K Prateek"
 <KPrateek.Nayak@amd.com>, "x86@kernel.org" <x86@kernel.org>
References: <20261109-clear-pages-batch-v2-1-2e62c4f84f94@amd.com>
 <avGbPpm3-Yrapry8@pedro-suse.tail5790ac.ts.net>
 <490893fe6ead90740ccd1fc1011004d03e49a27f.camel@amd.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <490893fe6ead90740ccd1fc1011004d03e49a27f.camel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 11:28, Garg, Shivank wrote:
> On Mon, 2026-11-09 at 10:12 +0000, Pedro Falcato wrote:
>>>
>>> No functional change intended.
>>>
>>> Suggested-by: David Hildenbrand <david@kernel.org>
>>> Signed-off-by: Shivank Garg <shivankg@amd.com>
>>
>> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
>>
>> with a question below.
>>
>>> ---
>>> This came up in review of the copy_mc_highpages() series [1]. Pedro
>>> pointed out that most architecture run with full or lazy preempt, so mm
>>> does not need to check the preemption model at runtime or batch the copy
>>>
> 
> 
>>> -
>>> -     might_sleep();
>>> +     if (IS_ENABLED(CONFIG_PREEMPTION)) {
>>> +             clear_user_highpages(page, addr, nr_pages);
>>> +             return;
>>> +     }
>>>
>>> -     for (i = 0; i < nr_pages; i += count) {
>>> +     for (i = 0; i < nr_pages; i++) {
>>>               cond_resched();
>>> -
>>> -             count = min(unit, nr_pages - i);
>>> -             clear_user_highpages(page + i, addr + i * PAGE_SIZE, count);
>>> +             clear_user_highpages(page + i, addr + i * PAGE_SIZE, 1);
>>
>> I think we can use clear_user_highpage() here. I don't know if that's
>> necessarily desirable, but it would make this a little simpler.
>>
> 
> Sure, this makes sense. Will do this in next version.

Makes sense. So I'll wait for the v3 :)

-- 
Cheers,

David
