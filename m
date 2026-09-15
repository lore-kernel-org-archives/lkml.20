Received: from mta0.migadu.com (out-120.mta0.migadu.com [91.218.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB5D3CA487
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479809; cv=none; b=mOXYDW2eEUF+1s49jckB/VwPtPXWfex7rsGPE3PdvXR45diuxCXb89szEPD7g3aG+sPQn5w1303RQPtyxq1Kz740aOwm1Du4Tg8f+kcjwENM1pFvE2zx9wO2SGe1MaQUQy1JMQ37mAmiqcsmdj2fvYgTPJU35cnoUkEkh01Mx6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479809; c=relaxed/simple;
	bh=6HudDoiUDG0qD8sOY5Dvp2rvFR5U8GAkB5GWE5aD+1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9vW1QtrwLzCdgERKqcV9jb+yxZtPTzQMxe2guAl5pTXBPGjXL8AiZ0+fM3ybxcp1aJotbWXyxxFzTIcFP1TzrTNc/EV0Kn5RV3NDgcq5Vo4B6375UePTkgGLhdRpTkG7BmxPpk1kXpCHpXmy0C+lMX8MNdNTIW3a8YhQsrPkEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vGPc+Z92; arc=none smtp.client-ip=91.218.175.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vGPc+Z92"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6HudDoiUDG0qD8sOY5Dvp2rvFR5U8GAkB5GWE5aD+1M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789479804; v=1; x=1790084604;
 b=vGPc+Z92QfmYlv0I08b8/LRhcYnsPy6z35SiQ4jrED23UugUlek7Z4JMvHtx5DvOEE1Kg/Cy
 IJoObSEawkgGIYk/nI+8LeG2zT64D9bj0dBWndB2mRTbgH2058moz1XmfEASVVy/vOgfYWD/hub
 oxndnVdWm1uVTzlb1PcgT8/Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id abc51d4308209202;
	Tue, 15 Sep 2026 13:43:23 +0000
X-Mizu-Trace-ID: abc51d4308209202
X-Migadu-Flow: FLOW_OUT
Message-ID: <30bcc70c-be07-4237-9bb1-554aa5b5c5c2@linux.dev>
Date: Tue, 15 Sep 2026 21:43:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/huge_memory: fix pgtable withdrawal for huge zero
 PMDs
To: Andrew Morton <akpm@linux-foundation.org>,
 Kiryl Shutsemau <kas@kernel.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org,
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, usama.arif@linux.dev, ljs@kernel.org, surenb@google.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260912234635.db50397364858aa15f58f4d7@linux-foundation.org>
 <20260913072312.52111-1-lance.yang@linux.dev> <aqfRCPheDYTgTdAk@thinkstation>
 <f76beaf8-351a-4b22-b362-a945a5e1af6a@kernel.org>
 <20260914111940.f7e2c72eac4a2df97a646793@linux-foundation.org>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260914111940.f7e2c72eac4a2df97a646793@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/15 02:19, Andrew Morton wrote:
> On Mon, 14 Sep 2026 16:29:00 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> 
>> On 9/14/26 12:59, Kiryl Shutsemau wrote:
>>> On Sun, Sep 13, 2026 at 03:23:12PM +0800, Lance Yang wrote:
>>>>
>>>> On Sat, Sep 12, 2026 at 11:46:35PM -0700, Andrew Morton wrote:
>>>>>
>>>>>
>>>>> That's the sort of thing we'd prefer to avoid.
>>>>>
>>>>>
>>>>> How real is this?  Is there a reported-by:?  Do you have a reproducer?
>>>>
>>>> Yes, I reproduced it on x86 with a small test module. It sets
>>>> VM_MIXEDMAP | VM_HUGEPAGE and calls vmf_insert_pfn_pmd() with
>>>> huge_zero_pfn, without touching the page tables directly. A full-PMD
>>>> munmap() crashes before the split series[1] as well.
>>>
>>> Ah. So there's no real bug upstream, right?
>>
>> Matches my understanding.
> 
> Thanks.  I'll remove cc:stable, move this into mm-unstable as a
> next-merge-window thing.

Sounds good to me, thanks, Andrew!

Kiryl, David, would you prefer the validation for raw-PFN mappings
of the huge zero page as a separate follow-up, or should that
validation replace this patch? wdyt

Cheers, Lance
