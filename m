Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044947;
	b=I4xVMB8LWo2YcWo0pxL59pom7htRi2y7MG783hNGwZY5ODbuv6PILlXznaADXQ/2leJR
	 llvbaxsWQarSix6TsKKEhQRvJctD8sDvvl73oEFNDYQ9jMMPkOsUTM/QgX5KRfvQ3ORoG
	 xzYaJDIOMQ4RfFv9UbevWxw4j2F0mDdnTuUIL7KWvDlMWklhTMgJlMdDQBsQNztfYrUP+
	 Bal/8c03iEqvhw0SNnxr5krWAUxOdpDi8Sw7yPfUoZaMo7/6hioc3yM10wzfgbSThhANX
	 7Pkb3OqYQ/jWZVyRdWjg930fkDI/2SIHNka/F8YUL1T/jn6McKY1cvxsdHow1EFBNNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044947;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=N2COgMJdxeQAvx7S+Q6UBvbh8mW4nF5CYPzexiu1PKI=;
	b=lOvmq6OtNVUHkFnhHMiy8zYA7elVHA5yH8UXCemv0vzz5KT/m9GIVgk+FE6O03HK9kQe
	 AvtMHYPOOUoaIp/446LusAxcviEoK1N0EIYfAzTV8G9Y++M5Z/0qJ0IzmmPzuJ1SXjSD8
	 yHaG0+Bjv4VG0j6CZlQ/SP03skGh6r2p7PhLJZmt6ftQUIJTnPyILOE1GAd5hEMA1hlx4
	 ii6Vfcw8120u3wN7ypA76ZxYhEs62RfhRkQX+EdowPy3j8vVqWDm3Gb65z4Dr8eqWiOCJ
	 Dl7gZAA06/tfpJoFUgqWqvD3bHfPwcWcoj/vEBAISmXaNVw7eMSltfsjrERNN7B5nKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RwQPWwj2;
	arc=none smtp.remote-ip=91.218.175.131
Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7145606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7145606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RwQPWwj2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3c5zx73qa9zbzHK/OsBfgB2TbAsXfenQkA8z7M0+31Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793044944; v=1; x=1793649744;
 b=RwQPWwj2gNAPc2T9Da0Ydt7uByrbnkZxx893QmEYC78jdsFuEgrVG/Kz8kkqwubbEVmakYnX
 F7O/IQde9Y6WKxftAjM7IBrsfIwVzA6bUDD8otYjayJlk36aIPQBSVNtpDHgmx9MtuV/plrcJh2
 HZxw+2wIlJDc/bkdvmwBBr/4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ea248a7b7212ccb7;
	Mon, 26 Oct 2026 20:02:24 +0000
X-Mizu-Trace-ID: ea248a7b7212ccb7
X-Migadu-Flow: FLOW_OUT
Message-ID: <dee39669-b726-480e-8ca6-10f19512da68@linux.dev>
Date: Mon, 26 Oct 2026 14:02:19 -0600
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
Subject: Re: [PATCH v2 1/2] mm/huge_memory.c: skip zero-page remapping when
 underused THP shrinker is disabled
To: Barry Song <baohua@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Xu Xin <xu.xin@linux.dev>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
References: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
 <20261025-b4-ksm_fixv2-v2-1-8b61ad0491f1@linux.dev>
 <CAGsJ_4zUVpBJazRxc1CzN6u5XvpUaGnaf-_7JMz-rGK_ZTYMtw@mail.gmail.com>
 <e865f7f0-087c-4fe5-b729-6e6946cd20f6@linux.dev>
 <CAGsJ_4wp_jCtCeMx39nW0Z1Jm5pja7_V6XNwLB6p7zTan0c3VA@mail.gmail.com>
Content-Language: en-US
From: Nico Pache <nico.pache@linux.dev>
In-Reply-To: <CAGsJ_4wp_jCtCeMx39nW0Z1Jm5pja7_V6XNwLB6p7zTan0c3VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/25/26 10:52 PM, Barry Song wrote:
> On Mon, Oct 26, 2026 at 5:48 AM Nico Pache <nico.pache@linux.dev> wrote:
>>
>>
>>
>> On 10/25/26 2:28 PM, Barry Song wrote:
>>> On Mon, Oct 26, 2026 at 1:40 AM Nico Pache (Red Hat)
>>> <nico.pache@linux.dev> wrote:
>>>>
>>>> The zero-page remapping in __folio_split() was added to support the
>>>> underused THP shrinker. When the shrinker is disabled via
>>>> shrink_underused, gate TTU_USE_SHARED_ZEROPAGE on split_underused_thp
>>>> to avoid scanning subpages for zero content unnecessarily.
>>>>
>>>> Suggested-by: David Hildenbrand <david@kernel.org>
>>>> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
>>>> Signed-off-by: Nico Pache <nico.pache@linux.dev>
>>>
>>> is b1f202060afe a correct fixes tag? as
>>> commit b1f202060afe has no even "split_underused_thp" there.
>>
>> I believe so. IIUC these two series were merged together. While
>> 81d3ff3c6f7 introduces the toggle, b1f202060afe is where the behavior
>> started.
>>
>> I guess you could argue that the Fixes should include both?
>>
>> Not entirely sure!
> 
> Thanks for the clarification. I guess it's fine.
> 
> BTW, with the code below, we no longer add fully mapped
> folios to deferred_split_folio. So the scanning code only
> handles partially mapped folios to set up zero-page mappings
> for their subpages.
> 
> I'm still not quite sure whether this is really harmful, though.
> Am I missing something, or was there some discussion I missed?

The issue is not in the actual shrinker code or the deferred split list.

The issue is that any split leads to this zero-page remapping 
indiscriminate of the actual toggle. The same way this toggle is gating 
things going on the deferred split list, we should be gating the actual 
zero-page remapping too.

There were two pieces to the underutilized shrinker, first we check if a 
THP is underutilized, if so we split, and the split+remapping handles 
the freeing of that memory. However, functionally this also made ANY 
split do this zero page remapping, not just those coming from the shrinker.

-- Nico

> 
> void deferred_split_folio(struct folio *folio, bool partially_mapped)
> {
>          ...
>          /*
>           * Order 1 folios have no space for a deferred list, but we also
>           * won't waste much memory by not adding them to the deferred list.
>           */
>          if (folio_order(folio) <= 1)
>                  return;
> 
>          if (!partially_mapped && !split_underused_thp)
>                  return;
> }

