Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F198746D09A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196078; cv=none; b=NQjz/1iGye/UsEuLGSJcy/k2aZVW0D3au0lPM57H4ZYKVv+Arhu6QKWsXpYdLEs3tPzr7zKgLMP/sh5Ci2LYytvAXvXnI25fTHJT/xjVkE7yO5I4crDaW3HyFgEml+ogZOvwRhsG64hua8PSaMigLyfWsm000vqSw24Pi/dGikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196078; c=relaxed/simple;
	bh=C9Zvbv33nUSf8gI5EoxZZ1MUetN0ESAqqDRSnBMiEng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlJAs+X4ckTqm1MHcnZi7K4yMQtEgnR+bAEPqqLehIFGD8hoPo+U3ff4qLR+zofLJ9r96azzKlecUjAhVEhqCKKWbk+KS1y1gGMm+G82H008eRUAG5+edC59HMAcesTz11Og+S50MMQHt43FOeqP1Mn2LCG1qr+v8y64LMKGZPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKGrAF3Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKGrAF3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3291F000FF;
	Mon,  5 Oct 2026 10:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791196076;
	bh=YV0ahyh+qROmkFhWhWDlwwYmMNujGqoOPIW1A6VxBOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oKGrAF3Y6UveLrA2UOY5wx0zRSLKy04JzXsiOxj3ysMaZPU993WGae1/63tiWDXuP
	 StuarUNmsSOtX8r+bhrwT7f76+/Ej4S0PuDqW48GA2hdZiKejogy7nZLg4/rIAkM1V
	 1mde+oIHX9VOk5yzlXz8e7Rjqv8uD5VER42XZoR5D5bJ6r+RvcrM1ZS01NXWIE75Ox
	 x4xyDy5KgbHYLxmsY6c3XTK1IFNOCxux1W7wISTv+yyuwofen4r+m/Cl84l102VPW5
	 RxvtZNU8JJR/pQEXXTPzJAZ85feEKmEQokKl3zjvM+7ePNjY+AbnDav77u3sKEo8AL
	 UcRX5TS64TU5w==
Message-ID: <ae9989b0-3797-4246-a2d2-985d7053d222@kernel.org>
Date: Mon, 5 Oct 2026 12:27:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/gup: fix NULL pointer dereference in
 fixup_user_fault()
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org
Cc: neganhat@gmail.com, jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261004125601.c06953a6f0660df9859b0c2a@linux-foundation.org>
 <20261005021957.5254-1-lance.yang@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261005021957.5254-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/5/26 04:19, Lance Yang wrote:
> 
> On Sun, Oct 04, 2026 at 12:56:01PM -0700, Andrew Morton wrote:
>> On Sun,  4 Oct 2026 02:48:46 +0700 Nguyen Duy Nhat Anh <neganhat@gmail.com> wrote:
>>
>>> In fixup_user_fault(), the 'unlocked' parameter is checked for NULL
>>> early on, allowing callers to pass NULL if they do not track whether the
>>> mmap lock was dropped.
>>>
>>> However, if handle_mm_fault() returns VM_FAULT_COMPLETED, line 1597
>>> dereferences 'unlocked' directly (*unlocked = true) without checking
>>> if it is NULL. Callers like s390's pci_mmio.c pass NULL for 'unlocked',
>>> leading to a kernel NULL pointer dereference when VM_FAULT_COMPLETED
>>> occurs.
>>>
>>> Fix this by checking if 'unlocked' is non-NULL before assigning to it.
>>
>> This code is too subtle so you aren't the first to attempt to "fix" it.
>>
>> The key hint is in the kerneldoc:
>>
>> * @unlocked:	did we unlock the mmap_lock while retrying, maybe NULL if caller
>> *		does not allow retry. If NULL, the caller must guarantee
>> *		that fault_flags does not contain FAULT_FLAG_ALLOW_RETRY.
>>
>> Trace through the
>> FAULT_FLAG_ALLOW_RETRY/VM_FAULT_COMPLETED/VM_FAULT_RETRY logic
>> to confirm that the null deref is a cant-happen.
> 
> IIUC, that's indeed a can't-happen :)

https://lore.kernel.org/linux-mm/c44e5924-091f-43ed-8cff-34e87c3d9763@kernel.org/

People should stop trusting tool output and use their brain ;)

If you did mmap_read_lock() and wouldn't have a way to indicate that to the user
something would be seriously messed up.

-- 
Cheers,

David
