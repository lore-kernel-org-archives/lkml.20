Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FB235CBCB
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789178789; cv=none; b=AXCp7Yv0ZlMXFkM7Y0Gk0qzdHrofusjhstLml5YQDNDoRguNVatjePogGbLFbBXpr//r1XX9pRQBf1sj0G94h+aJOj1hsY4SxkIfeinM0gmR7Ct8kC0Yw4YuzVRhSTlcHpnOMONO65AQASU+aEq5xHNifIq2jeJb5kdRviFexzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789178789; c=relaxed/simple;
	bh=spVOa9f/F/7Wv09hnrKBTUsoNuao2ZOIwYgjaS7I4kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAATl0lG6sop25EuvW2iC/fdTMSTwW4yHarHCl8rHQwTTWJs/yn6MvhN4Y4V/uktdmZUqQeZNB6XLaAhLg/U991hSt4WBVzb1gAGtMGYqCdCugVFnpCVYUzIl6ubZzAZMbwTx2eUy5aVnt5V3Vm8OF52D3uBV6oc3co/zDEdX2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz4Nzn47; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz4Nzn47"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c262204cc80so225160266b.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789178786; x=1789783586; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XjLvs9IRvdKtutQQVUqHinOZTztdopsuXZK8dx8qcRk=;
        b=gz4Nzn47I4uMkq9nWOLZraIpP5NUd1H2qZ91k465qA1MpbmzGdxF1EBLPOEzxLsA7j
         +/sbdjoI3xahfydHAJ7jHgdVu8GBU7UCC6QB4x23Z6PwO+/VtHYZ5KobqbyP+vvBNA12
         JrB77K83wCu7WiSIhxj+ComRqSVddlP3IpvFvnTYJxCQMP1TPlgaafKelR3yMGxBD0W8
         CI8CS3SwnNoDZY63nehXGYSqU8AS7p1C26beSSudZNvv8gulhEwW6NJjjtk5RtTCF5xk
         KrbFK6XfmxVH6vasEd/RXLuiXmSel5+qZ0s24FhPbfU9qA1mXw7QDU69jC5upYiXPrHw
         Ps7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789178786; x=1789783586;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XjLvs9IRvdKtutQQVUqHinOZTztdopsuXZK8dx8qcRk=;
        b=G/nHd5luY7LJdxQfMBJH0+qo3GWh93GW1tqSnbwuOLgr0h64+aDkYudoHtWIDaTKL5
         Lh38Og3xC+MlW5TylefnpRGWOfZB5zL2L3DlIxqwBK2VL7p+sHMnrtaQVlbltHZ2LJnn
         sVpRExw/9T01cbyJvFttkt0kGz+aPDFZFCWXTdv01/d1tY3tDtJLz9MC0ArzV8IYoG0+
         cugI0fFz+HkzUGibs6nRJAd793UJ9WAiU8lOK9ln0b9snhYA/AdDkXUTbq4rf82jIOHO
         uZ2ndEtbsXnPyMeg0/SGI2FafAXfWBejid845NL3mVpuEwemZM2rOmHX2Sbqi/uGuY3O
         R0vw==
X-Forwarded-Encrypted: i=1; AKwUvBzp8rdH9SZdGtGQvruNQ2DaM4mUU4dtqquwbO115MSt3+e+xfGhKsofXiyZrR/inXj17vVqCvdAHJqGrgU=@vger.kernel.org
X-Gm-Message-State: AFuF++n9YTlKVW3SS+0dtvqERo+FqXthlS7UJXRbLYEY2WtWrbhcdKpj
	Mv80HLffcamxoAz+F3bNzL9KdwghqUGrjzndWz4aFII4ulAvHtOQ0u+H
X-Gm-Gg: AYBFou3dLlr40P5LJAeCMpcVe9yicF4QEAyWJmkjvHYOW16j25YcOCA1mbSmZV9JzFt
	Dwg53HSHBBmm6VJU4ZY/mIPXXHXNYtI3LIGME20VRdcpuY63grwWc/GLjNWhmeFKVk+Ws82oSAX
	9CMfIkqs+29TQfQFG/NllITE6OXdJWyU8ZVUfrlxvxllWk6aQbWtXk3vF8ZW/8lrYaA2A1RmVQC
	/PjOSYyxBbkwGASPMft8X8tqm5c1BijOF8CKxwaRH8YXBoPvzEDAIGi+D3uADlCsuQAf+gzAOhD
	KAdaYcCdTzs3LDslHeKuGa9JdWwRQbShQbubu0GDIww2V2PJOkKeMnnLtpwwyU5WcUYocnfeWn9
	VIzcHXn9sqPi0oOUeMu6R+ZTqo/Zldq40bqxozu6EYQRI+hpMAzsRe6xgOpDUxwS+SB/l6PMK1R
	ICnaLjc4caWfleZrDxPLeHR0QND3BQ9vkWSvJpGRNuDEzTpbe/wcRlLSby47CuAusnSbUyzycdc
	LEQnU1d
X-Received: by 2002:a17:907:3f17:b0:c29:4970:abec with SMTP id a640c23a62f3a-c29665d8281mr318676066b.19.1789178786176;
        Fri, 11 Sep 2026 19:06:26 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660b29a7sm146651466b.43.2026.09.11.19.06.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2026 19:06:24 -0700 (PDT)
Date: Sat, 12 Sep 2026 02:06:24 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, Yuan Liu <yuan1.liu@intel.com>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>, Jason Zeng <jason.zeng@intel.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [BUG] mm/memory_hotplug: panic due to race between compaction
 and memory hot-unplug
Message-ID: <20260912020624.tyu6gwj3tssxfjp3@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260903095543.3752338-1-yuan1.liu@intel.com>
 <1d625a60-9473-4f48-a384-7d756ccb7135@kernel.org>
 <20260910031609.qbn2qcxzbitau5xc@master>
 <12147238-575e-49ea-aa83-ea25c660ee38@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12147238-575e-49ea-aa83-ea25c660ee38@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Sep 10, 2026 at 09:40:32AM +0200, David Hildenbrand (Arm) wrote:
>On 9/10/26 05:16, Wei Yang wrote:
>> On Mon, Sep 07, 2026 at 04:27:50PM +0200, David Hildenbrand (Arm) wrote:
>>> On 9/3/26 11:55, Yuan Liu wrote:
>>>> Hi all,
>>>
>>> Hi!
>>>
>>>>
>>>> While stress testing memory hotplug on a VM guest running an
>>>> unmodified vanilla mainline kernel (7.3.0-rc1, as reported by
>>>> uname -r), we hit a kernel panic in the guest when memory
>>>> hot-unplug runs concurrently with memory compaction.
>>>>
>>>> The kernel was built from mainline at commit:
>>>>
>>>>     cee9395acd80 ("Linux 7.3-rc1")
>>>>
>>>> To be more specific, after a large virtio-mem hot-unplug, the guest
>>>> kernel takes a fatal page fault in suitable_migration_target(), called
>>>> from isolate_freepages() during compaction.
>>>
>>> Sounds like a real problem we should tackle.
>>>
>>>>
>>>> We are not sure whether this race is reachable under realistic
>>>> workloads or only under this synthetic stress test. Sharing it here
>>>> in case it is useful, and in case this is already a known issue.
>>>> Thanks.
>>>>
>>>>
>>>> Call trace (top to bottom)
>>>> ==========================
>>>> - RIP: suitable_migration_target+0x5/0x70
>>>>    isolate_freepages() <- compaction_alloc() <-
>>>>    migrate_pages() <- compact_zone() <- compact_node() <-
>>>>    sysctl_compaction_handler().
>>>>
>>>>
>>>> Why the race happens
>>>> ====================
>>>> CPU0 (compaction free-scanner)          CPU1 (virtio-mem hot-unplug)
>>>> ----                                    ----
>>>> page = pageblock_pfn_to_page()
>>>>    /* checks pass, section ONLINE */
>>>>    /* returns valid struct page* */
>>>>
>>>>                                          offline_pages()
>>>>                                            /* section -> offline */
>>>>                                          __remove_pages()
>>>>                                            vmemmap_free()
>>>>                                            /* struct page UNMAPPED */
>>>>
>>>> suitable_migration_target(page)
>>>>    PageBuddy(page)
>>>>      read page->page_type
>>>>      *** not-present fault -> panic ***
>>>>
>> 
>> Does it mean, the combination of pfn_to_online_page() / PageBuddy(page) is not
>> safe, when there is hot-remove, even for other users. Not only compaction.
>
>There is an inherent race between any
>
>pfn_to_online_page() user that then takes a look at the memmap (PageBuddy,
>whatever).
>
>Usually, that's not really relevant, because for things to go terrible wrong
>(instead of only being slightly suboptimal :) )
>
>You have to run both, memory offlining *and* memory removal.
>
>For things like
>
>page = pfn_to_online_page()
>if (PageBuddy(page))
>
>That's unlikely to hit (no reports), and we could likely easily fix it with the
>help of RCU.
>
>It gets more problematic when we do things like
>
>page = pfn_to_online_page()
>... do all other kind of stuff
>if (PageBuddy(page))
>
>(what we have here)
>

Thanks for the explanation. I still have one confusion.

What we have here is:

isolate_freepages(cc)
    page = pageblock_pfn_to_page()
        if (zone->contiguous)
	    return pfn_to_page(pfn)
        return __pageblock_pfn_to_page()
            start_page = pfn_to_online_page()                       (1)
            ... check page_zone(start_page) and page_zone_id()
            return start_page
    suitable_migration_target(cc, page)
        if (PageBuddy(page))                                        (2)

It looks the extra stuff between (1) and (2) is trivial and they still rely on
page struct. 

Do you think it could be caused by the data synchronization between CPUs?

Two possible points:

  a) zone->contiguous
  b) section_mem_map's SECTION_IS_ONLINE bit

At either point, if we get the old data, we would think page is still valid
and access it.

>Using RCU is usually not easily possible. Mostly only comapction does something
>like that.
>
>-- 
>Cheers,
>
>David

-- 
Wei Yang
Help you, Help me
