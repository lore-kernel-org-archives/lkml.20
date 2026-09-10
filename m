Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC58135E936
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026047; cv=none; b=bic8AAwGD9KNtfHuN67NusyLJAftP6C8FiSE0XQ7ZQKqs06GG2BeLZeOnvubZSrnN/ajc0UphPCKZSFHggEOFMMgaJGGi0TT70ct7/8oTM6u1/XkmjERM8abee/96Rqojkvu6tCWUuyZZx/97z501GUaPqk/Dt9flGD7SZtnpzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026047; c=relaxed/simple;
	bh=u/w/W9pzN1EEBIsq7mUQ+ijV2/LPVyweohtt/TaTAHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3Y2gQTU8ZbddF7En1s4d8AfbeVYHpOReBZzOgUCyTvpfJA+qXrE+f0iqskLD25wdKGhBbuK2LT3UtpEhwhDBiI5qr3ApO0uGZpIwAmo3Mc9u8PqwdRB1ZmzFmE9AvhgyU+L8fQ3wxh0IHKhAkHBIVKH0FaCnIY3cFcRoOmnrLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6sYONx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6sYONx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A51F1F000FF;
	Thu, 10 Sep 2026 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789026037;
	bh=h9qej2utTGzUWAKjXHcQyamlOBo8eBDFXoNnSS57B6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Q6sYONx4fuvB8ohfg8+Zb5w5d7/gn9W/4vtRWrOKMvagj3wgM/nawgz5XKxuLOl47
	 iZGjyhkFWYKjVZJ6lFjMW7296DNDcY8wHNOW3KoNLsfh6WMMN75TVbNdbjkntXgwTI
	 mI8voiXMgefZKqwUzq3V4eeT/AgWaSGmS3dJSHVL4T82DdHDyVYG2vk9VvGom5KZCC
	 nccaGG6IUSF3Go9qGmzcAibafzNrCrZpJlMlgH4rtsupW9b2fDHIniFxmQwjsgCOfk
	 6+z4lGZATU9iz90xg1cE/fKSCXNBAzIv8XVtBwdt5Rucbea4gKJxVaEqpMyUQI0upu
	 +okyng6QED0ZQ==
Message-ID: <12147238-575e-49ea-aa83-ea25c660ee38@kernel.org>
Date: Thu, 10 Sep 2026 09:40:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] mm/memory_hotplug: panic due to race between compaction and
 memory hot-unplug
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Yuan Liu <yuan1.liu@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>,
 Jason Zeng <jason.zeng@intel.com>, Vlastimil Babka <vbabka@kernel.org>
References: <20260903095543.3752338-1-yuan1.liu@intel.com>
 <1d625a60-9473-4f48-a384-7d756ccb7135@kernel.org>
 <20260910031609.qbn2qcxzbitau5xc@master>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260910031609.qbn2qcxzbitau5xc@master>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 05:16, Wei Yang wrote:
> On Mon, Sep 07, 2026 at 04:27:50PM +0200, David Hildenbrand (Arm) wrote:
>> On 9/3/26 11:55, Yuan Liu wrote:
>>> Hi all,
>>
>> Hi!
>>
>>>
>>> While stress testing memory hotplug on a VM guest running an
>>> unmodified vanilla mainline kernel (7.3.0-rc1, as reported by
>>> uname -r), we hit a kernel panic in the guest when memory
>>> hot-unplug runs concurrently with memory compaction.
>>>
>>> The kernel was built from mainline at commit:
>>>
>>>     cee9395acd80 ("Linux 7.3-rc1")
>>>
>>> To be more specific, after a large virtio-mem hot-unplug, the guest
>>> kernel takes a fatal page fault in suitable_migration_target(), called
>>> from isolate_freepages() during compaction.
>>
>> Sounds like a real problem we should tackle.
>>
>>>
>>> We are not sure whether this race is reachable under realistic
>>> workloads or only under this synthetic stress test. Sharing it here
>>> in case it is useful, and in case this is already a known issue.
>>> Thanks.
>>>
>>>
>>> Call trace (top to bottom)
>>> ==========================
>>> - RIP: suitable_migration_target+0x5/0x70
>>>    isolate_freepages() <- compaction_alloc() <-
>>>    migrate_pages() <- compact_zone() <- compact_node() <-
>>>    sysctl_compaction_handler().
>>>
>>>
>>> Why the race happens
>>> ====================
>>> CPU0 (compaction free-scanner)          CPU1 (virtio-mem hot-unplug)
>>> ----                                    ----
>>> page = pageblock_pfn_to_page()
>>>    /* checks pass, section ONLINE */
>>>    /* returns valid struct page* */
>>>
>>>                                          offline_pages()
>>>                                            /* section -> offline */
>>>                                          __remove_pages()
>>>                                            vmemmap_free()
>>>                                            /* struct page UNMAPPED */
>>>
>>> suitable_migration_target(page)
>>>    PageBuddy(page)
>>>      read page->page_type
>>>      *** not-present fault -> panic ***
>>>
> 
> Does it mean, the combination of pfn_to_online_page() / PageBuddy(page) is not
> safe, when there is hot-remove, even for other users. Not only compaction.

There is an inherent race between any

pfn_to_online_page() user that then takes a look at the memmap (PageBuddy,
whatever).

Usually, that's not really relevant, because for things to go terrible wrong
(instead of only being slightly suboptimal :) )

You have to run both, memory offlining *and* memory removal.

For things like

page = pfn_to_online_page()
if (PageBuddy(page))

That's unlikely to hit (no reports), and we could likely easily fix it with the
help of RCU.

It gets more problematic when we do things like

page = pfn_to_online_page()
... do all other kind of stuff
if (PageBuddy(page))

(what we have here)

Using RCU is usually not easily possible. Mostly only comapction does something
like that.

-- 
Cheers,

David
