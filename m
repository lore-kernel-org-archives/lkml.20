Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469762;
	b=OUsqvKZgod58ypfGynmMERdBA6VUC3y3Nki6pWsgDPZfCtUGLgcGnlE2EhHOFxR6PS9b
	 dVeXrtbINHqNJccnQmY5JmC7gSvBwPUHbCMVMIfKCoUkrOjczzDHhDwftKv1m2wHQ93vG
	 da8Etk0/KtkMFVtslzgHu9oAcm5Lk56LkPsII80XjhKJmR3fokZv8kXJQ7esJ0Il6QkR1
	 OwS63seFlZfHB4tEz+5ap7QslDAhk+KGY6tZvhCEVs80bgaTJQVCogj8eRMc8dtEeke2N
	 9cO3EyxRWLUJwVCgPsddTc3Sog+IKJ1EqbUjOQ5LCnYJNQbuF1EC5d4w02ZWtjEzwYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469762;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8u/Jrpuu2JVC6hI1ixrRZTm2BiUfBKSvznSfyHT+Io0=;
	b=ey5NbiTrexIoR4i7Vm5ekARqZ/pMSn7XPxw8H50/VMzyXDBCa/6pL17nEEVfbEkQDc/6
	 RvokyKWJWT6ijm/TRPzvN7jmqz6AFemBa7PuQqiJQoW0QS5PCqiuiqi0Gqbv6jj6tC+6b
	 gdqpPxMhbETk8nyJmA+iVRmieQFU91qzZNJfuM6pAtm8PeMfJyEoxxrpiMcYmbdQtB6yB
	 cmE7JD0tKpdg98sSJGclBGV0HikwkCWS9OugOKvFTrjt8oYmZQESdKYJawUPWh84pRxZO
	 FkSYT4vCbghY6PvV84D0Dvz+9lVXH+Ks8SK8fVbYxwxoxc4o0MJVDQk22mgctWD36ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PPAe8EdV;
	arc=none smtp.remote-ip=95.215.58.3
Received: from mta1.migadu.com (out-3.mta1.migadu.com [95.215.58.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4A2606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B4A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PPAe8EdV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6ulO7dBVIsFkGmxrkgfFgMkcM8Ux5PUXeXdSsWBAiK4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794469758; v=1; x=1795074558;
 b=PPAe8EdVUr72L9MGbfhyRw9G4D4unnmsjA498ARd/6RbCMsWGRLoLvlXtjuP9IkcW7hDaooB
 0hdlu8PV6u07HSSZHdNp1JDqC6JDZ4ixJAa0hNFvE2LGrLMKnhtbWnZBPg5m1lyD5mBzOibkhUj
 OprpzXrLWQWLBxp/O1vDUgxQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fbff19d345a9f3e7;
	Thu, 12 Nov 2026 07:49:18 +0000
X-Mizu-Trace-ID: fbff19d345a9f3e7
X-Migadu-Flow: FLOW_OUT
Message-ID: <aa6caf61-a4a1-4c51-aae7-ebb767f3430c@linux.dev>
Date: Thu, 12 Nov 2026 15:50:41 +0800
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
Subject: Re: [PATCH v4 1/9] mm/kmsan: undo the shadow mapping when the origin
 mapping fails
To: Suren Baghdasaryan <surenb@google.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
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
 kasan-dev@googlegroups.com, linux-mm@kvack.org, stable@vger.kernel.org
References: <20261110112546.261415-1-hao.ge@linux.dev>
 <20261110112546.261415-2-hao.ge@linux.dev>
 <CAJuCfpHjSZhPPpRudAdrDPzz8dGK=Mx62CYCNoO4MC9OhnGd=A@mail.gmail.com>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <CAJuCfpHjSZhPPpRudAdrDPzz8dGK=Mx62CYCNoO4MC9OhnGd=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Suren

On 2026/11/12 05:03, Suren Baghdasaryan wrote:
> On Tue, Nov 10, 2026 at 11:24 AM Hao Ge <hao.ge@linux.dev> wrote:
>>
>> kmsan_vmap_pages_range_noflush() first maps the shadow pages and then
>> the origin pages. If the second mapping fails, the first one is left
>> mapped, and the callers do not roll it back. The next vmap of the
>> same metadata range hits the stale PTEs again and fails with a
>> WARN_ON() and -EBUSY in vmap_pages_pte_range().
>>
>> Undo the shadow mapping on that error path, the same way
>> kmsan_ioremap_page_range() cleans up after a partial failure.
>> __vunmap_range_noflush() only clears the PTEs; nothing has touched
>> the shadow mapping, so no TLB flush is needed.
>>
>> Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_pages_range_noflush()")
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
>> Reviewed-by: Dev Jain <dev.jain@arm.com>
>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>> ---
>>  mm/kmsan/shadow.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
>> index 0c88d89bf0d6..2166086d3dc3 100644
>> --- a/mm/kmsan/shadow.c
>> +++ b/mm/kmsan/shadow.c
>> @@ -258,6 +258,10 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
>>                                             o_pages, page_shift);
>>         kmsan_leave_runtime();
>>         if (mapped) {
>> +               /* Undo the shadow mapping set up above. */
>> +               kmsan_enter_runtime();
>> +               __vunmap_range_noflush(shadow_start, shadow_end);
> 
> Sorry, there is a problem here. You introduce "can_resched" check to
> avoid calling cond_resched() later in the series (in patch #7), but at
> this point __vunmap_range_noflush() can be called with GFP flags which
> do not allow blocking. Before recent Ulad's change called "kmsan:
> remove hard-coded GFP_KERNEL flags" this function was called only with
> GPF_KERNEL but now that's not the case. I think you can move
> introduction of can_resched flag into this patch.

Agree. I just went back and looked at Ulad's b186a94227b7 ("kmsan:
remove hard-coded GFP_KERNEL flags").

So will do next version. But perhaps it is better to make it a separate
prep patch in the same series? Because besides this call site, the other
places that call __vunmap_range_noflush() need to be changed as well.

Thanks
Best Regards
Hao

> 
>> +               kmsan_leave_runtime();
>>                 err = mapped;
>>                 goto ret;
>>         }
>> --
>> 2.25.1
>>
