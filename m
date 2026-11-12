Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468699;
	b=YYuRn2SUxHGKxNxH7GER62c+BJOn+V5ISXKj+bh8tc+Q86HwCoa7EA/OLRuQNkFh7vN6
	 uAvkHXr0yJ5a5Ifis+ox36BOeoL76XDDp53tnrjULtr3IKqePx5+fxPtlHAwS6zdMkb0q
	 gHYGGxMNhro9qRBFfueLRp8tYnxmoMDNdyb1+BRcEo1+t60Qm+fLcY5IjIUtrpobFwII2
	 DuJri6DkmSdY1H2WJB8wxnMvi0wGugXFP0ZXYFo8SuLe73W7RmxGJCDUEZnSo+1Wnxxjz
	 rvTVAKq/K7gaHuEFh1Omhfp/OHAa8OaHTnGMVyCI0bZ4qF2iVov43FH8ym2apfWW0jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468699;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=YkSv46yCHtIqoXvtaUlGuoA5bkCcyG3dKOTi+O8s+8o=;
	b=nhfTqvq9jWYmh3wlEvc1BpwGs+ekjl89p+mOzix3t53H5aPFAwWbO246eF8xDc7SdWx8
	 FiD5JVSwsf10/TaVu8uApBWZIrDqVQ4NePnPjt2BxzwYe028i4RWz/KdPdBTKUJ55ass2
	 CnUZUuPvPopBP5G59TG7rkKE/8SCc12jlZPDrkNy5gIrROAQUHfMhN4PUw8clOmG2BVCb
	 LnQF+euJDXTd0COuiuvEEzn4X9LmROV5Osnq/iRPfwipXMUrfAfQbm5OpJSni/xyWUXYV
	 3N4+bAAxqFcVdFn1uPI0j7VuTeHcRANOJ3Iyr9xpeoKGty2yxzVREYxWvBHpDxpqItA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NA+Y8Lq+;
	arc=none smtp.remote-ip=91.218.175.22
Received: from mta0.migadu.com (out-22.mta0.migadu.com [91.218.175.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59EF606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C59EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NA+Y8Lq+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=c6rVmPURZ3DT+JjErkgtV1mxI38IznosT0ADdpGxR3o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794468695; v=1; x=1795073495;
 b=NA+Y8Lq+cDGqZtzw4xGR7Z+rYhlYc5kEZj9Wf2Hmn89XoCjPbSUTy0bPCgWjC3gyr6BdN93c
 dC2ocsMaJpeagEvb78VirV/+2BWUhRbdDe7rev1Y9Mb5hCh5YGA1p4FraGwo6qC7NQCIepltXUr
 MfBgol3hXaLgGn6MND2cWhuQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 13c0695ddd446293;
	Thu, 12 Nov 2026 07:31:35 +0000
X-Mizu-Trace-ID: 13c0695ddd446293
X-Migadu-Flow: FLOW_OUT
Message-ID: <7df44933-e92e-4f1c-9b26-22a1a298ca16@linux.dev>
Date: Thu, 12 Nov 2026 15:32:58 +0800
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
Subject: Re: [PATCH v4 2/9] mm/kmsan: skip vunmap_range_noflush when KMSAN is
 disabled
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
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261110112546.261415-1-hao.ge@linux.dev>
 <20261110112546.261415-3-hao.ge@linux.dev>
 <CAJuCfpHneeqRFOXyzCPPPa66xfn7Oa1n5m2N67o_pVwJfNgeXg@mail.gmail.com>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <CAJuCfpHneeqRFOXyzCPPPa66xfn7Oa1n5m2N67o_pVwJfNgeXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Suren

On 2026/11/12 06:10, Suren Baghdasaryan wrote:
> On Tue, Nov 10, 2026 at 11:24 AM Hao Ge <hao.ge@linux.dev> wrote:
>>
>> kmsan_vmap_pages_range_noflush() returns 0 when kmsan_enabled is
>> false.  The unmap side does not, so it still walks the shadow and
>> origin page tables even though KMSAN never installed any metadata
>> there.
> 
> Note that KMSAN_WARN_ON() can reset kmsan_enabled flag, so the fact
> that it's false does not mean that metadata was never installed. I
> think a proper bailout should depend on CONFIG_KMSAN, not on
> kmsan_enabled.

Sorry, I did not realize this logic.

I will go through the code again and will probably drop
this patch in the next version.

Thanks
Best Regards
Hao

> 
>>
>> Add the matching early return.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Reviewed-by: Dev Jain <dev.jain@arm.com>
>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>> ---
>>  mm/kmsan/hooks.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
>> index a706666db097..107f66841274 100644
>> --- a/mm/kmsan/hooks.c
>> +++ b/mm/kmsan/hooks.c
>> @@ -138,6 +138,9 @@ static unsigned long vmalloc_origin(unsigned long addr)
>>
>>  void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
>>  {
>> +       if (!kmsan_enabled)
>> +               return;
>> +
>>         __vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end));
>>         __vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end));
>>         flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
>> --
>> 2.25.1
>>
