Received: from mta0.migadu.com (out-80.mta0.migadu.com [91.218.175.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1C934D3B0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116655; cv=none; b=WjTGT0p/RGT0py4V6nb1cZfBTbsAmlrH8TKYFL0n81SFgGalLK7CTFEyTN9cteO2XOAgDvDDgcLvDFVaabu038p2sFfaHx+PpD1dzt3jrl1aev+ocUfnGjBCHG3L2/Zc/1JN+kWfm1uRZxLpPp3q0MdeVKcsgqMpE7JsajwaMcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116655; c=relaxed/simple;
	bh=De18uuNLtNRyygl8Fw06uyfstZGsdRdC2bQXbHUzJrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JB6lE0/BV45FVUpODGOPY9Rp8QBydgsa3vfLjX+MoxdKCxjdK0qRACoj55rHBJswRp9bZxgmYhMAYAGYKq3NfeqoCYwhLRykmni3AAr57qBn/T8xBAUO8/aKkO0RDp5MWqc0Ah7AktuZhk4jI98CECxWQVkfDHXU1FWWMAf1UFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=S8CockI/; arc=none smtp.client-ip=91.218.175.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="S8CockI/"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=De18uuNLtNRyygl8Fw06uyfstZGsdRdC2bQXbHUzJrQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792116650; v=1; x=1792721450;
 b=S8CockI/a+kHaAvNBTFLvWLJUPAqb5i5hsiaSbkuogaM77hjr/twkg28EMXNpCoAtrOVlQVM
 vad/wCj9u9MP01d3nQ56cbgPxC5hJsFQqutkeGRbalkoLVLdk7QXEYMwIvYiJIr9Q/dlj1hNksK
 68YGXg0g4yWn42JeQW7Y1cKw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d85f21d1232013b6;
	Fri, 16 Oct 2026 02:10:50 +0000
X-Mizu-Trace-ID: d85f21d1232013b6
X-Migadu-Flow: FLOW_OUT
Message-ID: <b2f925b6-93e6-4b44-bc18-c94a34b381eb@linux.dev>
Date: Fri, 16 Oct 2026 10:10:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/swap: fix swap_cache_get_folio() returning a folio
 that left the swap cache
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
References: <20261015060528.302634-1-jiayuan.chen@linux.dev>
 <20261015184014.715dcdd3a25e18fd4df49e95@linux-foundation.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261015184014.715dcdd3a25e18fd4df49e95@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 10/16/26 9:40 AM, Andrew Morton wrote:
> On Thu, 15 Oct 2026 14:05:27 +0800 Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
>
[...]
>
> So CPU 0 writes to a folio it doesn't own: it may clear PG_readahead and
> takes the folio lock of someone else's page, before
> folio_matches_swap_entry() finds out the folio is not ours.
>
> Recheck the slot after folio_try_get() and retry if it no longer holds
> this folio.
> Thanks.
>
> As always, when fixing a bug please fully describe the worst-case
> userspace-visible runtime effects of that bug.
>
> I asked $LLM for this and was told
>
> : When the race occurs, a swap fault can acquire a reference to a
> : physical page that has been freed and reused for an unrelated purpose,
> : potentially by another process.  The fault handler may then clear that
> : page's PG_readahead/PG_reclaim flag, wait on or acquire its folio lock,
> : and potentially attempt to remove it from an unrelated swap cache.
> :
> : These operations can interfere with unrelated workloads and may cause
> : unexpected stalls, impaired reclaim or writeback, and potentially
> : system hangs.  The subsequent swap-entry validation normally prevents


I don't see a way to a system hang: the folio lock waiter is woken when
the real owner unlocks, so the worst case is a stall. I suggest
dropping "and potentially system hangs".


Writeback itself is not affected, only the PG_reclaim hint on where to
put the folio after writeback. So "impaired reclaim or writeback" ->
"impaired reclaim".

So I'd suggest:

   : When the race occurs, a swap fault can acquire a reference to a
   : physical page that has been freed and reused for an unrelated purpose,
   : potentially by another process.  The fault handler may then clear that
   : page's PG_readahead/PG_reclaim flag, wait on or acquire its folio lock,
   : and potentially attempt to remove it from an unrelated swap cache.
   :
   : These operations can interfere with unrelated workloads and may cause
   : unexpected stalls and impaired reclaim.  The subsequent swap-entry
   : validation normally prevents the wrong folio from being mapped into
   : the faulting process, and neither data corruption nor a kernel crash
   : has been demonstrated.


> : the wrong folio from being mapped into the faulting process, and
> : neither data corruption nor a kernel crash has been demonstrated.
>
> Do you agree with this?  OK with me adding this to your changelog?
>
>> Fixes: 8578e0c00dcf ("mm, swap: use the swap table for the swap cache and switch API")
> Given the above, I suggest adding cc:stable.
>
> Do you and maintainers agree?


Agreed for me.

