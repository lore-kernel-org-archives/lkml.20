Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798944;
	b=d/pTRiMPAgmv0GO6rUWYRe7wUtE9sheTt8qmsaKIiTHPPUmu9p1QABU4HuGuHBIV6bgx
	 7AE3tCmtvShMEEb0aKSsmdKjqs5B5qu/VCzcPiXKRJ1c+l9l6pUXU/ytL4874j91ooadL
	 d9c/qf/GdSJhoDsNlmi25c73dPGNmF8bK8WVQ2WZUTg/llOFNckQlU2DWWN9YvbPn2V+v
	 Pqdb8CgdspiMcTN4lKYJ2uszgumHTEP5JqEgUV+lxkJGSeDbbCkheDz6xBUSm3rtjj2Ng
	 FZbrrfHvUH+Q0aSz8jr6wICbhWPoDAiwBIN69Rm7wQb1QANQDOZy7V+xY+D88bSQbxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798944;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=61hA4pI6lWNHs1Ny06AZoS+2gE8bk9pfoV7wwfpwYLY=;
	b=AiqlLFw6vfHqmvADWhs6CWFn6Lg2XvPBwSoJzc1HokoRLAX1iDz7qaCr2GxeG2w9RVdD
	 Qi92mBp16nNqGGFMQZRaNe8j2YT3JCDC4G2/Gc3nKnjITRg1LwbOE9Tak++LWHlhPzBZZ
	 qAbv8q7xE2H/qMdXMH9pP44OOeYEgFSkfNb0codbDdK4gzZ0qSgAnJN5b42Prkxwym7r1
	 Zq2Y2xE4B71M4y76KjGnbLJuVHRoozc/KmoWWiDlckOg4y2O/1iKVw/8Fpnsvwcu3DPK0
	 WwlSCwvEKpo0MiL7YhIw77jmgw1iqxhzfr1Y8VkC9KDy3hBNoLitiFw9Of24OqfxS3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=b6y5pjZT;
	arc=none smtp.remote-ip=91.218.175.29
Received: from mta0.migadu.com (out-29.mta0.migadu.com [91.218.175.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560CD606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=b6y5pjZT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RUdXcvQAkasOinh1aHVDzx5Sbf8dYEfIHFE+pPtSAf8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794798941; v=1; x=1795403741;
 b=b6y5pjZThx7DYDxGEYNfUyp+U3/xosaEMZmj2dCioSZXgrycZsMsMAUAuW/xB7bHrCC6ul7F
 9ajzKA3pNWSWmGKecb6G6We6VuI02BRbHXYzbgsLhXKuTqXrA9aqLfU8wfztFqNfoahP2KCso1W
 Xp6Tjkb4pnM2yywUCJeoV9ao=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4346fe518fa13606;
	Mon, 16 Nov 2026 03:15:41 +0000
X-Mizu-Trace-ID: 4346fe518fa13606
X-Migadu-Flow: FLOW_OUT
Message-ID: <5d234178-7799-4603-82bf-40a70101f78a@linux.dev>
Date: Mon, 16 Nov 2026 11:15:24 +0800
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
Subject: Re: [PATCH v4 4/9] mm/vmalloc: BUG_ON() on an unaligned range in
 vmap_pages_range_noflush_walk()
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Dev Jain <dev.jain@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261110112546.261415-1-hao.ge@linux.dev>
 <20261110112546.261415-5-hao.ge@linux.dev> <avWtB-nWZUwLdQdP@milan>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <avWtB-nWZUwLdQdP@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ulad

On 2026/11/12 20:11, Uladzislau Rezki wrote:
> On Tue, Nov 10, 2026 at 07:25:41PM +0800, Hao Ge wrote:
>> The pte loop of vmap_pages_pte_range() maps whole pages and stops
>> only when addr lands exactly on end.  An unaligned end lets addr
>> jump over it and the loop keeps mapping into whatever follows the
>> range.  An unaligned start maps the page below the range with its
>> first pte.  That corruption is impossible to debug afterwards, so
>> bug out on addr and end at the entry of
>> vmap_pages_range_noflush_walk().
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>> ---
>>  mm/vmalloc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 27f2674a5556..86fbb1d2b27a 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -698,6 +698,8 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
>>  	pgtbl_mod_mask mask = 0;
>>  
>>  	BUG_ON(addr >= end);
>> +	BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));
>> +
>>
> But why do we add this? We used to live without it and as far i see
> we have not gotten any report about any unaligned addresses un-maping.
> 
> The vmap allocator grantees that va->va_start/end have to be page
> aligned.

You are right that no in-tree caller passes an unaligned range today.
This came about after looking at
commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not PAGE_SIZE aligned").
That commit only guards the ioremap family. vmap_pte_range() is reached
through vmap_page_range() only, so what it protects is ioremap_page_range(),
pci_remap_iospace() and friends, which map physically contiguous ranges.

vmap_pages_range_noflush_walk() has the same loop and serves the other half of the picture,
the virtually contiguous mappings, where the physical pages behind the range do not have to
be contiguous, and since functions like vmap_pages_range() take addr and end from the caller as
they are, the page alignment is the caller's contract in the first place, so this is the same idea
as a739e6b557af and the check just makes that contract visible.

That said, dropping this patch is also fine with me. Nobody can actually trigger it today, as I said at
the beginning, so I will drop it from the next version.

Thanks
Best Regards
Hao

> 
> --
> Uladzislau Rezki
