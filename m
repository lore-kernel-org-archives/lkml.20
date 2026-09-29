Received: from mta1.migadu.com (out-206.mta1.migadu.com [95.215.58.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A732C37E5F3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790641640; cv=none; b=KApWrQBEWB0sVxbUQpgnjIXpDijXVnPxb2qMpVo89lFD4LkzVqRLzSj0qCUiQpbq0tkRQ/aNLGrSMEk+ukCE8uWlEIjanfZT/y8+/14J4LsR/KnKiBAK+K9azlcbzfdnPENjC6pyWFEbERnSftxrZqDGxnvanokyozy8IC3yZIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790641640; c=relaxed/simple;
	bh=bpMYWBp/sPJNiQHEYw1MOd5uAxCLyuUtVHzuC15+pHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLC0psIjGlPDgDWEvZe/BIjaNsxV7Pou+uobD3C0MlC5aZonpqwlw1lqwarN6guoYbfHLqcwysG/Ppjn7RO9eD6Y0WAQ50vFJjWWYp+UOsqLOacCXV6qsETZoYUuCEA/3oji4EaekG4vQq7/RZq0hfk64BncJ6N0XxTcRSG7eas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M4U/OkMI; arc=none smtp.client-ip=95.215.58.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M4U/OkMI"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bpMYWBp/sPJNiQHEYw1MOd5uAxCLyuUtVHzuC15+pHA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790641635; v=1; x=1791246435;
 b=M4U/OkMI2b8ylZ9gZAaoGSa5muprJ8ikog70F9ltHHBXhn1lBPHHEJ7gNE6p8zeqyvBu2qMY
 1yKuI5FCX9A1NPlDHOuCRVNgP95FGdwyPf8sb6WmMpHcCOlnQhihnbBX3hCbThtkCoEV9wTqObp
 9wJYL3/DP4qInZw4hpT2Vs68=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 27dc7108c083eaec;
	Tue, 29 Sep 2026 00:27:15 +0000
X-Mizu-Trace-ID: 27dc7108c083eaec
X-Migadu-Flow: FLOW_OUT
Message-ID: <a13c01e1-def0-4aa5-b54f-18e523082b29@linux.dev>
Date: Tue, 29 Sep 2026 08:25:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vmcoreinfo: export SECTION_HAS_MEM_MAP
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He
 <baoquan.he@linux.dev>, David Carlier <devnexen@gmail.com>,
 Tao Liu <ltao@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kexec@lists.infradead.org
References: <20260928-section_has_mem_map-v1-1-4129f6ba2838@kernel.org>
 <9c47dad9-2716-4ae0-b6e2-9e6b5c718859@linux.dev>
 <4a57b255-cb38-4e8e-908b-d32e55a1a326@kernel.org>
Content-Language: en-US, en-GB
From: Dave Young <ruirui.yang@linux.dev>
In-Reply-To: <4a57b255-cb38-4e8e-908b-d32e55a1a326@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/28/26 7:42 PM, David Hildenbrand (Arm) wrote:
> On 9/28/26 12:23, Dave Young wrote:
>> On 9/28/26 4:48 PM, David Hildenbrand (Arm) wrote:
>>> The crash tool currently hardcodes SECTION_HAS_MEM_MAP, and makedumpfile
>>> needs similar information (although still relying on
>>> SECTION_MARKED_PRESENT, it should switch to SECTION_HAS_MEM_MAP).
>>>
>>> Let's just export the value instead, so tools that work on vmcoreinfo
>>> will not have to guess.
>>>
>>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>>> ---
>>> Result of the discussion in reply to "[PATCH v2 00/13] mm/sparse: remove
>>> SECTION_MARKED_PRESENT and further cleanups" [1]
>>>
>>> This patch can go in independently. It would be preferable if both
>>> go into the same kernel release ;)
>>>
>>> [1] https://lore.kernel.org/r/20260921-b4-sparsemem_cleanups-v2-0-54d81d65e125@kernel.org 
>>> ---
>>>  kernel/vmcore_info.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
>>> index 5a417f8a922a..7833a36064a8 100644
>>> --- a/kernel/vmcore_info.c
>>> +++ b/kernel/vmcore_info.c
>>> @@ -182,6 +182,7 @@ static int __init crash_save_vmcoreinfo_init(void)
>>>  	VMCOREINFO_STRUCT_SIZE(mem_section);
>>>  	VMCOREINFO_OFFSET(mem_section, section_mem_map);
>>>  	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
>>> +	VMCOREINFO_NUMBER(SECTION_HAS_MEM_MAP);
>>>  	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
>>>  #endif
>>>  	VMCOREINFO_STRUCT_SIZE(page);
>>
>> Current crash code looks below:
>> #define SECTION_MARKED_PRESENT          (1UL<<0)
>> #define SECTION_HAS_MEM_MAP             (1UL<<1)
>> #define SECTION_IS_ONLINE               (1UL<<2)
>> #define SECTION_IS_EARLY                (1UL<<3)
>> #define SECTION_TAINT_ZONE_DEVICE       (1UL<<4)
>> #define SECTION_MAP_LAST_BIT            (1UL<<5)
>> #define SECTION_MAP_MASK                (~(SECTION_MAP_LAST_BIT-1))
>>
>>
>> And it does not match the kernel for below chunk with ifdef
>> #ifdef CONFIG_ZONE_DEVICE
>>         SECTION_TAINT_ZONE_DEVICE_BIT,
>> #endif
>> #ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
>>         SECTION_IS_VMEMMAP_PREINIT_BIT,
>> #endif
>>
>> The last bit could be wrong in crash.  So all numbers should be exported in vmcoreinfo.
>>
>> Thoughts?
> 
> You know the crash code best, so likely ... it's time one of the crash people
> takes over this patch?

Rethinking about it I'm hesitating to add many more to vmcoreinfo although it is reasonable,  about the #ifdef things, there are other places other than mm, crash can not depend on the /proc/config.gz which is not reliable in the old kernel memory, maybe it will be helpful to export another elf note for old kernel's kconfig.  So I'd like to support to use your patch for the time being as the first bit is always needed and leave the remaining concerns a follow up item.

Thanks
Dave
