Received: from mta0.migadu.com (out-66.mta0.migadu.com [91.218.175.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C3427144B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140172; cv=none; b=GVEx4LtQwv5XhnNTeTZZKCrdz096Aae9jSupEPuIYZBaFKYhylg6bV83zoIwP2T8UPTJZTaK3diWunYnlEz8lj9AyIqy5Mem5Y4v0uwmFwlmssg54yRN1FI43jnfHIj68eN1e2g61tH3O4DKIi/uwmsBMDweKrVIe49w5vnOUJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140172; c=relaxed/simple;
	bh=RaqzrXtafggiA6Vtw0Bb+3qEZqwTeX7kkg/munQcgtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0Qzslbmtd04adP/aEuT/rbTAsI9hYc1BfN8v9UyjB+zla+0bNEsGfnAaSKAAeovV+t/tQzpJA76TFjHYbcre7Qa8LOUdJ/11QK0pjI8lswcTQ1mIPnFDj6RdIFt/I79Nk1T1Se2BF8ozTGnrhbFoAB66qDI0XFMimLpk37gPVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lUMViyjj; arc=none smtp.client-ip=91.218.175.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lUMViyjj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RaqzrXtafggiA6Vtw0Bb+3qEZqwTeX7kkg/munQcgtU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792140167; v=1; x=1792744967;
 b=lUMViyjj7OSmbIQE/3JD2Ytjnn5qFksmgBQQcbYVoQI0aYd9N3RULVBSTODggc6HbX3E2DtF
 PY6FFkkbyFPQFtbqpagkFz+wfTdQDYevrffqv9DeVLe3XRLAMI1AcYI7Z0LdIPb+ea77fuInLrL
 UHJh/nJLSur17C3F8+d110rw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 88eda0bda127cae6;
	Fri, 16 Oct 2026 08:42:46 +0000
X-Mizu-Trace-ID: 88eda0bda127cae6
X-Migadu-Flow: FLOW_OUT
Message-ID: <62d17959-d695-4fec-a87b-8eadaaf995a8@linux.dev>
Date: Fri, 16 Oct 2026 16:42:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
 <CAMgjq7D50X47JFsTnF2-jYGv7i-Nd3WhQLK-TJGy4XkhMQU4OQ@mail.gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <CAMgjq7D50X47JFsTnF2-jYGv7i-Nd3WhQLK-TJGy4XkhMQU4OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/16/26 11:05 AM, Kairui Song wrote:
> On Wed, Oct 14, 2026 at 5:10 PM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
>> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>>
>> On our production hosts we saw swap cache only pages keep growing for days:
>> on a box with a 500 GiB swap partition, 250 GiB of RAM and 250 GiB of
>> swap slots were held by folios that no process mapped any more, charged
>> to cgroups whose workloads had long exited. The only way to get them
>> back was swapoff, and with other services actively swapping on the
>> same host that is not an option.
> Hi, thanks for the report.
>
>> Such a slot has swap count 0 and an unmapped folio pinned in the swap
>> cache, left there after a process exited or did MADV_DONTNEED. No page
>> table holds its swap entry any more, so nothing comes back for the
>> slot; LRU reclaim drops it eventually, and the allocator only reclaims
>> such slots once swap is half full. The growth stopped exactly there:
>> at 50% of the device, where vm_swap_full() becomes true.
> Hmm, I think this indicates a much cleaner fix is available.
> vm_swap_full is inherited from the old allocator, we can instead just
> let the allocator reclaim the slot if the slot have a count of 0 and
> ignore vm_swap_full at that point.
>
> Will this work? (Just a minimal implementation for reference, will be
> even better if we can avoid the overhead).
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index c3288910b3e3..94670fe82f31 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -212,6 +212,9 @@ static int __try_to_reclaim_swap(struct
> swap_info_struct *si,
>          nr_pages = folio_nr_pages(folio);
>          ret = -nr_pages;
>
> +       if (folio_mapped(folio) && !vm_swap_full())
> +               goto out;
> +
>          /*
>           * We hold a folio lock here. We have to use trylock for
>           * avoiding deadlock. This is a special case and you should
> @@ -903,8 +906,6 @@ static bool cluster_scan_range(struct swap_info_struct *si,
>                  if (swp_tb_is_null(swp_tb))
>                          continue;
>                  if (swp_tb_is_folio(swp_tb) && !__swp_tb_get_count(swp_tb)) {
> -                       if (!vm_swap_full())
> -                               return false;
>                          *need_reclaim = true;
>                          continue;
>                  }
>
Hi Kairui,

I tried it on our box (224 CPUs, 931 GiB swap partition). It doesn't
help there: after 100 rounds of the reproducer the leftover is 291 GB
with it and 309 GB without, and both stop growing at the same place,
488 GB, half of the device:

# cat /proc/swaps
Filename                Type        Size        Used Priority
/dev/nvme1n1p1                          partition    976561148 
489006260    -1

# cat /proc/meminfo | grep Swap
SwapCached:     489006260 kB
SwapTotal:      976561148 kB
SwapFree:       487554888 kB

cluster_alloc_swap_entry() picks clusters from nonfull_clusters first,
then free_clusters; it looks at frag_clusters only when both are empty,
and at full_clusters only when vm_swap_full(). A cluster gets onto
nonfull_clusters in partial_free_cluster(), that is when
__swap_cluster_free_entries() frees a slot in it; after
alloc_swap_scan_cluster() has used it, relocate_cluster() moves it to
frag or full.

A leftover slot has count 0 and a folio, so __swap_cluster_free_entries()
never runs for it. Once the live slots of a cluster are gone, nothing
calls partial_free_cluster() on it again, it stays on frag or full, and
cluster_alloc_swap_entry() doesn't pick it until the device is half
full. That is what the swap table looked like after the run:

list      clusters   leftover slots
FULL        106415       54484480   (all 512 slots leftover)
FRAG         44822       18471614
NONFULL          1              0

Making cluster_alloc_swap_entry() revisit those clusters means changing
the list policy.



> Or, from the LRU's side, put swap readahead folios at the tail. I'm
> actually trying to do that and it's not very easily doable at the
> moment but will soon be easy to do.


That helps the RAM side under pressure but doesn't give the slots
back.


>> Options considered:
>>
>> 1. Fix it on the readahead side: after the read, check the swap count
>>     and free the slot. Covers the lock, not writeback, and the
>>     asynchronous read path unlocks in the bio completion where the slot
>>     cannot be freed. Two places to patch, neither clean.
> In fact, readahead checks the count before starts the read. It should
> prevent some of the problems but seems not enough.


Right, the count is still 1 at that point. The zap drops it to 0 while
the read is in flight, after the folio is already in the swap cache.


> And another idea, what if we just add dropbehind flag or rotate the
> folio, if folio_try_lock failed in __try_to_reclaim_swap?


dropbehind would work for readahead and writeback if the read
completion honoured it too; today only folio_end_writeback() does, for
zswap writeback folios, and swap_writeback_dropbehind_folio() expects
the folio off the LRU. It still misses other lock holders (migration,
split, ...). Rotating only helps under memory pressure.

