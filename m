Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900635;
	b=Sh4wlEXsxiHYO2Aa8l6a/1Do1IWzxlrIEVQyvDdlYwN6E4yz2eR8017KwA3MSt7gHlqX
	 FjmoxDPvVziZ0CpBqhsnCuJUu80O8QP5tA4Kc0DqJpCW2CwD0Uo1s8yy+ePAEfHnnIdbb
	 V7pNWDXJ1Iqf9WuFnUeDPwE6XGenSQfohAiZhR+zcHsCkuC1+EiqLwlE5+qlIvE4VL5f9
	 sKlBbdp8gUdwSqQDjv8cvVq6NfNkM9yHG9Vu/K7MGhoeLeF1zPRlSLxX+SqmVlUvQ2ATb
	 Gqv9jNXfUO3r/CZJN90ENToxL9Ytic+v5Xvz6gxlYqFYEXxPuq0N3H7kKjc2r01wzow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900635;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fcKtE5mi/DkT/9oquvk96D/YRPpfegFucC/9AF3cJEs=;
	b=meCgiuffIWAbMiLD2wW3MXRl8JWO7sawnz5lPE0qlvQYc+uJKjBsCi8ozoSiwDuCIIVk
	 d22LEPk4qGiT+RngvQ4s+MzTgWZnNXZCDgTUzuk+P2lgc78tuDJaZ4nmASwAyR7NyUnoZ
	 qMgMmxQyWn1Mm1hHK39F/BjtRVhVToYSB4IdIUSF5e0KbIp0v27taHFMgEI3qK9Gbj2iN
	 3geAJqVz+ZMRWfi+0uOkAaXc7kjYR4Gz9YrV2D3zlqkZOmDtC8Ya62vix3N2ereh3fQBx
	 1uX3JXKJdxiDTNPX5cjZjHKbEZQVOBhbmlwr5tZAMdZVppKM7UJuinCLiowPTp8R/cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="PJ44/Zek";
	arc=none smtp.remote-ip=95.215.58.4
Received: from mta1.migadu.com (out-4.mta1.migadu.com [95.215.58.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCB9606A33D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CCB9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PJ44/Zek
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EserxKsK5joxX4GOV87r5mAx7jTanLSX8A4BZQ+O3fg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793900632; v=1; x=1794505432;
 b=PJ44/ZekeoaOlTkJj7uAcqWxM/vK37VNydM225/YUFcTKSkRr609br60rOn/smBTV7zOZfJl
 8SVH3b/z0rlFCrGN32uF+qdh+RYbphGxA4HjgUov9sn6nvMI3nq+xB+7EITdJH8o/S+GELesW0g
 tiHsQwrlzWpAyN3ceTDPE7Gk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dd7cf416248d2106;
	Thu, 05 Nov 2026 17:43:52 +0000
X-Mizu-Trace-ID: dd7cf416248d2106
X-Migadu-Flow: FLOW_OUT
Message-ID: <4cb71e7d-8cf9-4584-8c97-e30bfaa4211c@linux.dev>
Date: Thu, 5 Nov 2026 09:43:41 -0800
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
Subject: Re: [PATCH 2/4] wait: Make ___wait_is_interruptible() return 0 or 1
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
References: <20261104160722.1637541-1-vineet.gupta@linux.dev>
 <20261104160722.1637541-3-vineet.gupta@linux.dev>
 <20261105090342.GS2668804@noisy.programming.kicks-ass.net>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20261105090342.GS2668804@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 1:03 AM, Peter Zijlstra wrote:
> On Wed, Nov 04, 2026 at 08:07:19AM -0800, Vineet Gupta wrote:
>> GCC 17 adds -Wconstant-logical-operand to -Wall. It warns when an operand
>> of && or || folds to a constant other than 0 or 1. With a constant state
>> such as TASK_KILLABLE, ___wait_is_interruptible() breaks the build with
>> CONFIG_WERROR=y:
>>
>>    include/linux/wait.h:285:39: error: use of logical '||' with constant operand '256' [-Werror=constant-logical-operand]
>>
>> clang has the same warning, but it does not check an operator that comes
>> from a macro expansion.
>>
>> Compare the masked state against 0. All callers test the result as a
>> truth value, so the behaviour does not change.
>>
>> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
>> ---
>>   include/linux/wait.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/wait.h b/include/linux/wait.h
>> index c2af98b0074d..ebabdfb5b30c 100644
>> --- a/include/linux/wait.h
>> +++ b/include/linux/wait.h
>> @@ -283,7 +283,7 @@ static inline void wake_up_pollfree(struct wait_queue_head *wq_head)
>>   
>>   #define ___wait_is_interruptible(state)						\
>>   	(!__builtin_constant_p(state) ||					\
>> -	 (state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)))
>> +	 (state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)) != 0)
>>   
>>   extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
> What is the actual purpose of this warning? This doesn't seem to serve
> any value. Any non-zero value is a true, why is this a problem?

I think the intent of the toggle was to catch && vs. & mixups in source 
(and it only catches that in 1 direction). Clearly that is not 
applicable here and it seems it has never caught this in the kernel anyway.

> GCC doing this, don't mean we can't turn if off again.

I will send a v2 which turns the GCC version off.

Thx,
-Vineet
