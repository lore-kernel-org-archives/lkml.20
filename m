Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E335D3C3F6F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042349; cv=none; b=NSZ5KKqobQPvVnFoqkh6235CS8iFir4Fp8fbFizrRMc5ExiVdbBISNXU2QVzff7nKbp7OnaAQGPG93+GUVn3K5A+z0y3MoCcPghkoJqjIDV7NZcbO9MKRBVaoDLKLzgGwz1bcVSQ+LGbNPnT6rTn8uWXOxB4fvWo4ODQ6GN9xJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042349; c=relaxed/simple;
	bh=LFgg9NvNbLg0JHItMJrXrnYTc2H0SFmt0xaGwrerxvo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ijo8N7oDSkxaVSGR9AyQpZtWsXtWavTcZWqzk0hNeg2szgQ6JSxAlIVOPTGN2e3DD3BGyfIBlA6VYN+TFCUp98NRJsJlSMOzPsFD4eBsx0gBNyXDcyNbz2gS6q6uUuxvIGyaxjnP0wmtIJ4caHk84LSEdq3D33mAEm0YmU6m17E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sHhJordf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sHhJordf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D321153B;
	Thu, 10 Sep 2026 05:12:22 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7647A3F7B4;
	Thu, 10 Sep 2026 05:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789042346; bh=LFgg9NvNbLg0JHItMJrXrnYTc2H0SFmt0xaGwrerxvo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=sHhJordf19MingqIsOLLBqUEPjFQkoeNghwwf0m49YNNGCU5Cj68L681KYb2uV5p6
	 t0nq02vgM486v9GheUTxY4bQMRaTuMX7cNPWSSQtH1Aya7HHmGyI7ZkWzusq/GtwCh
	 5LC1YO8K67r2RaN1iKKVBKBv6aat47ZazF/PcHGo=
Message-ID: <8936784e-9ccb-4c33-9b30-f99552e10f87@arm.com>
Date: Thu, 10 Sep 2026 13:12:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [patch 0/3] lib: add synthetic MM benchmarks
To: David Rientjes <rientjes@google.com>
References: <d6787a7f-3213-2b2c-2de5-af3b02daa21f@google.com>
 <cec6f48d-8857-49d6-a24d-b072482bf0c8@kernel.org>
 <c76621a4-cc8c-b6a7-732f-633d372477ff@google.com>
 <707b26ac-7f73-430a-a473-cd3409c4505c@kernel.org>
Content-Language: en-US
From: Usama Anjum <usama.anjum@arm.com>
In-Reply-To: <707b26ac-7f73-430a-a473-cd3409c4505c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/09/2026 10:38 am, David Hildenbrand (Arm) wrote:
> On 8/3/26 00:19, David Rientjes wrote:
>> On Fri, 31 Jul 2026, David Hildenbrand (Arm) wrote:
>>
>>> On 7/31/26 06:26, David Rientjes wrote:
>>>> A blast to the past :)
>>>>
>>>
>>> :)
>>>
>>>> We've been carrying these synthetic benchmarks in our kernel tree since 
>>>> 2009 because they've been helpful to identify regressions in hot paths, as 
>>>> well as quantifying any improvements that have been made for new changes.  
>>>> Hopefully they can be useful to others as well.
>>>>
>>>> The synthetic benchmarks are run by loading the module at runtime.  The 
>>>> modprobe will fail intentionally so that the module gets insta-unloaded.  
>>>> The test results are emitted to the kernel log.
>>>
>>>
>>> Ideally we'd have an easy way to actually use them in autoamtic tests.
>>>
>>> E.g., loading fails -> error, loading works -> no error (and unload)
>>>
>>>>
>>>> Proposed with permission from Christoph.
>>>> ---
>>>>  lib/Kconfig.debug    |  30 ++++
>>>>  lib/Makefile         |   3 +
>>>>  lib/test_pagealloc.c | 337 ++++++++++++++++++++++++++++++++++++++
>>>>  lib/test_slab.c      | 375 +++++++++++++++++++++++++++++++++++++++++++
>>>>  lib/test_vmstat.c    |  95 +++++++++++
>>>>  5 files changed, 840 insertions(+)
>>>>  create mode 100644 lib/test_pagealloc.c
>>>>  create mode 100644 lib/test_slab.c
>>>>  create mode 100644 lib/test_vmstat.c
>>>
>>> This looks similar to tools/testing/selftests/mm/test_vmalloc.sh and friends,
>>> that can actually be executed as part of our selftests and do a modprobe.
>>>
>>> Can we have similar scripts to execute them?
>>>
>>
>> Thanks for looking at these tests!
>>
>> Good call, I agree these could be loaded with a wrapper similar to 
>> test_vmalloc.sh.
>>
>> All three of these tests don't take module parameters (yet?) so right now 
>> this wrapper would just do the equivalent of check_test_requirements(), 
>> usage(), and run_test() where we'd pass in a single option for now, 
>> "performance".
>>
>>> But I also wonder if these test modules could be placed then in
>>> tools/testing/selftests/mm/ instead (or some subdirectory for test modules).
>>>
>>
>> I thought about the same and just followed what appears to be the standard 
>> convention (like test_vmalloc above) for lib/ for now.  If they should all 
>> be moved under tools/ somewhere, perhaps we handle that in a separate 
>> series?
> 
> Yes. lib/ is just absolutely the wrong place for that.
> 
> Maybe lib/tests/mm
> 
> But then, I wonder if they could just be somewhere in tests/ directly ...
> 
> Anyhow, it was also raised whether some of these could be written as kunit
> tests. It's been a long time since I worked on these, so just mentioning it.

I also think it would be best to try to add them as kunit. I'm not exactly sure if
kunit would accept such benchmark kind of code. Some research is required there.

Thanks,
Usama

