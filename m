Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050435;
	b=3psdgzK4Bybr8BHpYGhdYc1EQK7c6RdqQqK1cFCL5ZSQyPGeokMaiytMzOPrnHCOschu
	 rTpo1Ymm+0vQ7OKMXWxvd5g8HNsEBMBMOBmy1VPvrcxpyCH3+1mzb9KtNxMZwqe3P6EYo
	 1vEFpYKTZZ+xleiW/S9u+1BFxKewRPVc2BYpAryESLsSx5C0oVASaDWBkyESRD2CMkIUq
	 bjIx95ENVCwEJRMBDanksUQ8O2B2nuzv5Gj6h/pGGxWNKKh4ZDpUZSGqUYe63AWa4pm27
	 yNQmtgK1sEUZoGIAo8KkcgndAKRUsdc3MY2SCKFiO7hvU/DG86yYKkEjkw1mOl/csdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050435;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Dz35/3AuvDO18S1ap1WD5Da+psq9zQUaDV9gOjeP834=;
	b=y5wm5Xi8jZFV9srpUZwmftOWNOO6c+ZGYtbttROUYzsqWNnzjwhxEIx+eo56u6mMGhOc
	 XLCC9qGFYmnxLyzGcKRXjcvnaem+4Os21K1RjOrr0o+GtEXhG7twu6qNcZTW/NiF+qsFR
	 dhHJRjMwMsyjWg14UwTJvXnCB8QO7ap+bagyNlsk1oN38lx2OYJXV3GMyX1rbNcO5iCxE
	 paZRTMerzDGJxvWQYBYJn55f/HVPL60K0g6aHwRQWYZdyIq26c5vBHEwQDld0KlSeoqIh
	 kmgXO0oV+vwBwbKcwmQfqkS/y8mrAgPPyBHkmUWGDxOhMDgBLDDLie5IoVGy79/WMRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EUMUGfJy;
	arc=none smtp.remote-ip=95.215.58.108
Received: from mta1.migadu.com (out-108.mta1.migadu.com [95.215.58.108])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA3F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA3F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EUMUGfJy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RhJVRUhhLZt+aePS7fCAUtL8lWa14lc3+sdZ/JP8HZw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793050432; v=1; x=1793655232;
 b=EUMUGfJytvdpOG0PIQz5BaNE7I4aLO63MuJHXueRJd0aP53cD0ZnyLnfI6Ub5CnQkHFC7l9d
 PorKV4TDXTyACJYzU8y8mJSewGi+3z2tZH9zLSrhpXzEu8nLLRnYr5gsDLvcfB3IlUG81/SjY/+
 DFO12jUjzYF+7FUrfYGV2cm8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 34d1e3635c42cd72;
	Mon, 26 Oct 2026 21:33:52 +0000
X-Mizu-Trace-ID: 34d1e3635c42cd72
X-Migadu-Flow: FLOW_OUT
Message-ID: <a4dfbe84-aaf4-4711-8eac-6455470d1e7d@linux.dev>
Date: Mon, 26 Oct 2026 15:33:46 -0600
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
 <dee39669-b726-480e-8ca6-10f19512da68@linux.dev>
 <CAGsJ_4w4ozXM+=T0qGBAhC323F49Y4LxrrKKt3GFCs+en_TVCg@mail.gmail.com>
Content-Language: en-US
From: Nico Pache <nico.pache@linux.dev>
In-Reply-To: <CAGsJ_4w4ozXM+=T0qGBAhC323F49Y4LxrrKKt3GFCs+en_TVCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/26/26 2:58 PM, Barry Song wrote:
> On Tue, Oct 27, 2026 at 4:02 AM Nico Pache <nico.pache@linux.dev> wrote:
>>
>>
>>
>> On 10/25/26 10:52 PM, Barry Song wrote:
>>> On Mon, Oct 26, 2026 at 5:48 AM Nico Pache <nico.pache@linux.dev> wrote:
>>>>
>>>>
>>>>
>>>> On 10/25/26 2:28 PM, Barry Song wrote:
>>>>> On Mon, Oct 26, 2026 at 1:40 AM Nico Pache (Red Hat)
>>>>> <nico.pache@linux.dev> wrote:
>>>>>>
>>>>>> The zero-page remapping in __folio_split() was added to support the
>>>>>> underused THP shrinker. When the shrinker is disabled via
>>>>>> shrink_underused, gate TTU_USE_SHARED_ZEROPAGE on split_underused_thp
>>>>>> to avoid scanning subpages for zero content unnecessarily.
>>>>>>
>>>>>> Suggested-by: David Hildenbrand <david@kernel.org>
>>>>>> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
>>>>>> Signed-off-by: Nico Pache <nico.pache@linux.dev>
>>>>>
>>>>> is b1f202060afe a correct fixes tag? as
>>>>> commit b1f202060afe has no even "split_underused_thp" there.
>>>>
>>>> I believe so. IIUC these two series were merged together. While
>>>> 81d3ff3c6f7 introduces the toggle, b1f202060afe is where the behavior
>>>> started.
>>>>
>>>> I guess you could argue that the Fixes should include both?
>>>>
>>>> Not entirely sure!
>>>
>>> Thanks for the clarification. I guess it's fine.
>>>
>>> BTW, with the code below, we no longer add fully mapped
>>> folios to deferred_split_folio. So the scanning code only
>>> handles partially mapped folios to set up zero-page mappings
>>> for their subpages.
>>>
>>> I'm still not quite sure whether this is really harmful, though.
>>> Am I missing something, or was there some discussion I missed?
>>
>> The issue is not in the actual shrinker code or the deferred split list.
>>
>> The issue is that any split leads to this zero-page remapping
>> indiscriminate of the actual toggle. The same way this toggle is gating
>> things going on the deferred split list, we should be gating the actual
>> zero-page remapping too.
> 
> I'm not quite sure this is true. The toggle prevents fully mapped
> folios from being added to the deferred split list, so their
> subpages won't have a chance to be remapped to zero.

Correct, but the deferred split list is not the only caller of 
folio_split(); all other callers get unconditional zero page remapping.

Additionally theres a difference between being fully mapped (and zero), 
and being partially unmapped. the zero-page remapping checks the content 
of the page. We could add folios to the deferred split list that are 
fully mapped but contain mostly zeros. With shrinker_underused turned 
off we no longer do any underutilized scans on reclaim, but other 
splitters (KSM, vmscan, migration, etc) will still scan the content of 
the memory and do the remapping whether this is on or off.
  >
> For the remaining folios that are not fully mapped, or those
> that were added to deferred_split_list while the toggle was
> on and remain there after it is switched off, allowing
> remapping to zeropfn doesn't seem to violate the toggle's
> intention of preventing fully mapped folios from being added
> to deferred_split_list.
> 
> Anyway, I don't have a strong opinion on this.

I think theres a misunderstanding here, but hopefully the above clears 
it up :) if not just lmk!

Cheers,
-- Nico


> 
> Thanks!
> Barry

