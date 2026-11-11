Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430725;
	b=gLKVsS4aznAQ7dvAtDyrw9MLZrV6TG+qnAy6gn5rZmA+quUtfqYYDXVJn+wSx283tDbM
	 aHAkiit8iGgqw+GylXeeR/CjcPPnESdmJ8wkHMkKKtgSthi+8oB+yhmDviOTPuVCiz7de
	 3ItlKlQRYHXA5G6SxSbJcyoa34sloqVI/UPshyKrberbHOl7Z0kymRU4mgYkOUawof4cn
	 j+Zwua36BSCOoYpV8Fx0YqDI+UllOq3M5IF67tsAdNBuswElq9J+HWxFWLKGsXD3+s4Y1
	 WOc/X9/bc6WzdRVcNYzIaFFvJLEVf7WjQIstigHjpvXXOxVWPTc//fe0Y5Q+c8wxpUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430725;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ds6gjgiS3vY0BGdY0DRhZwlXVM0IcXWHW91s2wNzqW8=;
	b=AVdtNZzZZ+KO9vxPNaWkxPAodTSm2MaLO5h3s5vKU4hMz1JfmfnupMSCmmO8cD8EBiCS
	 A8DgS5wT1y80wvqoxyC8Lcm/CcAjCCwB0t7OIG4Klq99IEeIZfryvYnFSbKUD03vuwMiv
	 J9APui7+BsaqAVwJINOzW052rCHTalodX+nul3PgpKWbww837ZnTEdZud+fI1/j4OYgE1
	 V6E3LUyQGlltXEsYQFWqogiKaBvctlUQkGYUt6TP6FYJjWCNcSvO8Fz+s7vq1fZl2N70v
	 +mrT7fN/IgunPaPN1M19U2gG9dV3zSeG2uLkEH+GE4GIKxc0MGAhfkbYTPX2yllGByQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E9fGcD86;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D221606A8AF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E9fGcD86
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9797E1F00A05;
	Wed, 11 Nov 2026 20:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794430724;
	bh=Ds6gjgiS3vY0BGdY0DRhZwlXVM0IcXWHW91s2wNzqW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E9fGcD86Lx9XaWIpof0R7WUxZBmGxJ67mAfGNyxR1VMoMYLYRYiqCdyL00LjShnRG
	 70cfe5mHbIJaOOM9q5iRijQ8mzdENzfPv3fQ3OVRiqnKTb/JdmquA+tEVlZk/9AJCr
	 VC27Rtvis8BoRNO634nMCsXM+sZ6+dg5WRXuYrO4dv66qPbaAFDSjHP+Ot9FMMXqYL
	 zMsn5dgo/uBFv1zS4YgMVA7Xe94gz/jZS4h6/GH1cdyfNi3dPNvOB79WAqdOeamWSy
	 BorNP6QWpar3MvsLNku0jhe8L7Cm/mwBlttLWHXD0svE7jyliIAmGRDt6G/Tc6/kWh
	 cAV5vKYxwjCsw==
Message-ID: <4df90a0f-0bba-4899-9232-e3e968b55138@kernel.org>
Date: Wed, 11 Nov 2026 21:58:33 +0100
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
To: "Garg, Shivank" <shivankg@amd.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "ljs@kernel.org" <ljs@kernel.org>
Cc: "Rao, Bharata Bhasker" <bharata@amd.com>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>,
 "vbabka@kernel.org" <vbabka@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "surenb@google.com" <surenb@google.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "Salunke, Hrushikesh" <Hrushikesh.Salunke@amd.com>,
 "liam@infradead.org" <liam@infradead.org>, "mhocko@suse.com"
 <mhocko@suse.com>, "bp@alien8.de" <bp@alien8.de>,
 "Nayak, K Prateek" <KPrateek.Nayak@amd.com>,
 "pfalcato@suse.de" <pfalcato@suse.de>, "x86@kernel.org" <x86@kernel.org>
References: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
 <20261111124006.GI2668564@noisy.programming.kicks-ass.net>
 <avRnJiDLdGcbSW5d@gremlin>
 <20261111132105.GJ2668564@noisy.programming.kicks-ass.net>
 <261ef956af0843f414b4def58b13dae003c933ac.camel@amd.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <261ef956af0843f414b4def58b13dae003c933ac.camel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 20:07, Garg, Shivank wrote:
> On Wed, 2026-11-11 at 14:21 +0100, Peter Zijlstra wrote:
>> On Wed, Nov 11, 2026 at 01:12:06PM +0000, Lorenzo Stoakes (ARM) wrote:
>>>
>>> I guess we all got used to the existing patterns and I for one only
>>> recently found out (doh) that this was legal in kernel style (because I saw
>>> it used in KVM)...
>>
>> Right; which is why I keep reminding people this is now 'legal' :-)
> 
> 
> Thank you, Peter.
> Good to know this and I'll keep in mind for next time.
> 
> btw the patch is already in mm/core.git. I don't have a strong
> opinion on this, but I'm happy to send a V4 if you'd prefer.

I can fix it up, but we can also just leave it like that. (I tend to prefer the
old way of doing it, but in the end I don't care :) )

-- 
Cheers,

David
