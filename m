Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842563;
	b=kyJwrUoWWyFlXfeqOMcerbfgqgwbRy10NQJ4Y2dX0bxaGNfSqUY7XLdSRXLcrYzQJsyq
	 2JmZpYbyyTNWOWyyypJRVyKb4HdXX2Tj0TMSKK58//sAhnYo966DBdAC69YmAXksi511c
	 C2q+ioa2R85vb7gG5Gmh93wJox5RebBP2pc6dXnS8AF5fWO1Jmri9Wo3JLJ/1C127rtcW
	 aeWsppDXdek7B/wpRk5FhEibu6KXXtPPGly8dX9+LKUm9ZwSJdkTVKILG/MAO2kwVbQ4i
	 aAskWD0FbPpJ/PYrtW3Ai16LEYs0VTgBfMc0xBwSH0oalWM9b272QjLeA+xQNOZRKgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842563;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yvL5SHXmrg63CGMwFwd7MflptpXh7T0L5Ppdni6T5Hs=;
	b=Ty7zdPBQGz6Fs+d/5Zs+pSJPqOKVMI8dUP20rGQb+quGOKR/LpW4UrbfSzVgesHvxdZ5
	 J5s0eJM8t1xDS9EO40V/cfJhiaZumi2Qy9v4ve9Git8JzEGchIWv95NBCVj/pAd5/FFMx
	 9+Oyp+Ho/YVs/N2p+5DZ/FUkXNK4EVCBjgEg/eo7b7OcdvqGgr3tqcAtJmNsiU0paW8yp
	 V06Cn8foiXdivvtbcQ2okmNUVertecXp1Zxx9pdcqtM0oGGFpZMoMs+HLK+J56vMlyKpO
	 JN5BJz4c8OAfZI3wPBsZRrfZQtCHJ7EhyxiKMdWZIoxQxinxbnqrTQvutE1TNhlK/PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYyzbxKI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EDB606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYyzbxKI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E1E1F000C8;
	Mon, 16 Nov 2026 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842563;
	bh=yvL5SHXmrg63CGMwFwd7MflptpXh7T0L5Ppdni6T5Hs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oYyzbxKIjiLyy4xu6j8iLO3QcFgpFtGg7tIyXXHDuUjwxkz6bAsGjYafrAFyWPCCR
	 dsI5ltZC49py69/0zqEKhcHHqx3GZ/e7oJ4G5K1q/fOoqxlgrL8M3/FSBfOK0qTbNd
	 egD2moVHNjT+WC0Qh+ah9sU5gPE2RD3quhulvLdAJMu4DGYijptsfaTOLlyIASmznJ
	 e7Em3Np02Y2pSwGWfrwavf3YzNeGFicfgk8PS0+cAHJDr5MZvMUU23o+5i12OfgMXe
	 RTeGC5GMEil24HevPLPl51c602zPvaIrhUlx/cEZt1PgwqD7Sh9dw+8vLXvA/k9uIU
	 NUYNdJhbAW73w==
Message-ID: <8e923578-781a-4932-9bee-7dbaa26dddac@kernel.org>
Date: Mon, 16 Nov 2026 16:22:34 +0100
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
Subject: Re: [PATCH v3] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
To: Ankur Arora <ankur.a.arora@oracle.com>, Shivank Garg <shivankg@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Zijlstra <peterz@infradead.org>,
 Borislav Petkov <bp@alien8.de>, Bharata B Rao <bharata@amd.com>,
 Hrushikesh Salunke <hsalunke@amd.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
 <87jymd2w20.fsf@oracle.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <87jymd2w20.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 06:18, Ankur Arora wrote:
> 
> Shivank Garg <shivankg@amd.com> writes:
> 
>> This Message Is From an External Sender
>> This message came from outside your organization.
>> Report Suspicious
>>
>> clear_contig_highpages() clears the whole range at once under
>> preemptible models. Otherwise it clears PROCESS_PAGES_NON_PREEMPT_BATCH
>> pages at a time, with a cond_resched() in between. The batch is 32MB if
>> the architecture defines clear_pages(), and one page otherwise.
>>
>> Since commit 7dadeaa6e851 ("sched: Further restrict the preemption
>> modes"), architectures that support lazy preemption only offer the
>> full, lazy and RT preemption models, also with PREEMPT_DYNAMIC. x86 is
>> one of them, and it is the only architecture that defines
>> clear_pages(). So the 32MB batch is never used: whenever
>> clear_contig_highpages() runs under a cooperative model, the batch is
>> one page.
>>
>> Make that explicit. Clear the whole range when CONFIG_PREEMPTION is
>> set, and one page at a time with cond_resched() in between otherwise.
>> Drop PROCESS_PAGES_NON_PREEMPT_BATCH, which has no other users.
>>
>> PREEMPT_DYNAMIC kernels also have CONFIG_PREEMPTION set, and
>> cond_resched() does nothing on any of these kernels. So a build-time
>> CONFIG_PREEMPTION check is enough, and preempt_model_preemptible() is
>> not needed.
>>
>> No functional change intended.
>>
>> Suggested-by: David Hildenbrand <david@kernel.org>
>> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
>> Signed-off-by: Shivank Garg <shivankg@amd.com>
> 
> Am a bit late to this.
> 
> Reviewed-by: Ankur Arora <ankur.a.arora@oracle.com>

No worries, added it :)

-- 
Cheers,

David
