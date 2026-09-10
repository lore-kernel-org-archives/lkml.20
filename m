Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C123E44F6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033237; cv=none; b=K5vAD/s+YkCgMUWBnzMEphjZR+0iSCCpHeFmoZ+H5NtdJqbNZ9rVE5Ea8uOq71Hs0qSfTaK8lvlQfwH45+C8YGJDGeluJ8vTr6m+kH/G3797vxx4Hp/dM2IfLDtyzalKwJa5Cm0xHQRg6qEDDKDs+TB0NJUElm+1JoquMcgOA9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033237; c=relaxed/simple;
	bh=Qgltb6DsdtdO7OL0+/yWkFAXCcmzlLFPfzHtRSN2Fu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OsbyoJrNIfPfE+qhkZxozzIC7dyZUBDTlESNX11d2R0x3246Qd+Te5BD6945o8Sk2TDqumh4vny+GRlB/olNDKNgsqzclwQizTRcyvNdw2y0HUsFpuc0HROs9tFrrOSKfyPzwr9MilaKi61KpNjj/K+6cQYwz4lt86Zr7mNamU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDgMmp3b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDgMmp3b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9F41F000FF;
	Thu, 10 Sep 2026 09:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789033234;
	bh=LOwczmd6xJ2j1KBWAU06PaQI0R1ONjM3JPnqUxNd2+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DDgMmp3bPTCKqKWHXJGkt6fiCN0NUJy6HkHGTlhL13P6vcB7QZWAOj/UOeJvm1ct3
	 1EQebYe4v54l9LpByU5ciXP61GO+kVlEYaJXEGZWbOz8oieribmiPe8541HNszyUaH
	 5QPJjJklIxmTHE9lZ7yLaUan4VmtzRsXkY6DlApG2NAzbW0xvmADr8tPY1ojbuGhTe
	 3LolNcZZrUW7ob2hYnnPg8eYwy6M4ZHPnDQVhpiMhBP2zSA/9SBnt1NDYSc8PedKka
	 K5gl+jiYYta9J4IHHE3bDHXdznLrEFiK2Yv1QuMwc1yyooW2/4Kfftt0XOPpvyzC73
	 P0ICSNLO9RVqA==
Message-ID: <42703e8b-cec3-496b-9c76-4dfc35ad469f@kernel.org>
Date: Thu, 10 Sep 2026 11:40:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch v2] lib: test_vmstat: add synthetic benchmark for vm stats
To: David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>
References: <d6787a7f-3213-2b2c-2de5-af3b02daa21f@google.com>
 <e8dd28ab-ea7f-2ccf-c89e-a12f2d8b9988@google.com>
 <94068447-f9c5-ba84-73be-bf492277b9b3@google.com>
 <a06d4920-a63d-d653-1ca2-41b7500f1134@google.com>
 <6136773e-b134-070e-36fe-2951aa25b5fe@google.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <6136773e-b134-070e-36fe-2951aa25b5fe@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/26 01:52, David Rientjes wrote:
> On Fri, 7 Aug 2026, David Rientjes wrote:
> 
>> On Sun, 2 Aug 2026, David Rientjes wrote:
>>
>>> From: Christoph Lameter <cl@gentwo.org>
>>>
>>> Add a synthetic benchmark that can be used to measure performance of VM
>>> statistics.  This is used to analyze any improvements or regressions in
>>> functions that are frequently used in hot code paths.
>>>
>>> The test is run by inserting the module: modprobe test_vmstat
>>> The module insertion will always fail so that it is automatically
>>> unloaded; the results are in the kernel log.
>>>
>>> Signed-off-by: Christoph Lameter <cl@gentwo.org>
>>> Signed-off-by: David Rientjes <rientjes@google.com>
>>> ---
>>>  v2:
>>>   - added bash wrapper to ksft per David
>>>   - integrated into ksft
>>>   - added MAINTAINERS entry per David
>>>   - fixed alloc_page() error code per Usama
>>>
>>>  Adding single test for now to solicit feedback before updating the other
>>>  two.
>>>
>>
>> Any feedback for this one?  If this one looks good then I can also apply 
>> the same treatment for test_pagealloc and test_slab.
>>
> 
> Andrew, David, any thoughts on whether this one is acceptable for merge?  
> If this looks structually correct and is staged for inclusion, then I'll 
> do the same treatment to the other two proposed tests as well.

Please send new revisions next time not as reply to previous revisions, makes it
easier to miss them ;)

I still dislike placing them in lib/ but as discussed, we can handle that
separately (CCing Sarthak).

As replied to v1, is there any chance we could convert some of that to kunit?

-- 
Cheers,

David
