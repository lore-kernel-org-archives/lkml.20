Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420F638F651
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010175; cv=none; b=KxrrD0SDYTW053jhVrh2PYzYwF0+CWOnrfVdscb4m8A0E5VcIRYZsFqtmJaetPUrFrOL2SNu9pzKUTCMDKcXmOZEirH6JPsMQoRZzzrXAxTmKZtERsE1cJ0YLq9WAeZVww0c8XbdP0iwCgXSi3uJ64+K3GSGt5aJ+5jwx0hSTUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010175; c=relaxed/simple;
	bh=D5sMfP/g4a8owh8Yj/JlMZu99s1At47ByDkMHtxVGR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tv3XBPlybcftYHf+lKPxI54BBwIf7yHDySexI38qBQObfRNCO8bKF6AFfeztVcthGJrIZw0yEbMCFfh2D3ntlo071v6tKxqryDJwmuqguBtFkbV/4ujr+Zfx3WaNWqfcaWdMX4wubRwsxLrrD7za3XeVi2ubxT18/qrsaEC4qew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYDx8fsR; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYDx8fsR"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso1486514a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010172; x=1789614972; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xYSjnZ7o6t7LHnF5MCbffFkXr8Iwz82fqgMZavKGTtw=;
        b=sYDx8fsRH3EHBOvOLgEfDgGyU2yuauLp1hywhs2FMWEWTRbaQZ1WvMzV+fd82JUhPR
         1SlK1Ppgzv5X5Jr7nP84A+Emuxix/18LMGPnEF6mRiiaIiZLLl2vut0IfwljQ6B9w4X4
         E53VyzfzVyQ0O8MzDMcLVpnmUHWMn3Gu9OX3LuFFK5L2SyAs9PUnw4w1hDGiTM3PovKF
         YgAgnl3Qz/qeZUnK18sPA7KN2e7XeYsMWgKCiTx43DZ6j/BXzezZqhg0EBGLsVGnWAEE
         euWQijHDFe8f3LYUvxAAptbuF8ryhgI6hB+ZlIacLj/DTvdvGkPg/1VN7+Hi3kk31Mqj
         G/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010172; x=1789614972;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xYSjnZ7o6t7LHnF5MCbffFkXr8Iwz82fqgMZavKGTtw=;
        b=TrfvUaD+qa6d/TQsXgH+un4Ymf0fntADfysiHnfqglNxdDGXxYZvZz4wjWZU/XmnTr
         BOmUc1+CKKjvWj+ZXPuqGfBgw4j3dzMXjQpZaaaZrny5wAbS0W2nIUgvNb2uGiMJ4MDL
         aPF4x9ftajKDO+TAizuDpf5VZStFoBHPQNUnGUXYQZ0g/Xq3tmvGVn9wFtIVEoBegtty
         fPFSIVC3QcEIEGQRTqtDbn0H/gsh2w9cAa1l27VETUMmnmp4TobCFRrRC963WIls2OeY
         wJxvid9/RM7y7Xp8/ckw41oQGlkmyAi85RXFY4+OGf4NaLJj4sRh/PAxYkEXjZ3syC5V
         5RVA==
X-Forwarded-Encrypted: i=1; AKwUvBwrZMkwY5wwt5MWTKxzp+VYE0YsLboWQ7dmyJBCjK0tJ4/rZFW791QZgdmVJiyDsHru0ntlR1D9rjfZuW0=@vger.kernel.org
X-Gm-Message-State: AFuF++mGDMNDSMlKJj5CfeRHkzsa/LcDySEob1R11bQ3TklHVvN1W7Ck
	1KJG/kWAdMyN691gBDKQpsMVQ4Ldt6UAJx0InKQ7/NgklLn2GJ051fY5
X-Gm-Gg: AYBFou2r7auUw0g2kJXIzOI7P/IKi1FWrzUT+cH1n5r7vZuaGW0TIoywz2aYj9YNUWh
	Vyq+mYSXmJ/ma8tF5P4pmz4V0NF6TaxE8bzjl4ihOalThj9Z4kFqoNBUuX2I0x8C8zc/9i6VIxn
	Cb2IMGqnkUiMq0epJgAXTWnzhCFNHmb+wSULAF2KziXNGZNcBx3I4zfW58KyX2Fs7m0xwFs7UZH
	E+Vs3dYevwOOzr8SZnx0aL0oxdDLHPil4OPZBgBsFDhQ7Rd/znXQmDa7Uu8AZvcR3pZjkQo+7/w
	qTv0ZrYVZoYzVTgZHu0C7OqtCb3KTC8QDPpjwGpoiVnbKSM0SjwyfDpbq1f8VsiozKvJ+uuQYEe
	GtbLpOIQV80Ew3JCVyvIwxBprjr8utn4L5Df262cDzpkQ/avbtWC/CXlfUoNwDk3ZGeODQfx09f
	EmEDEVfwRKeWRNEHwxOu5Qu6Pmqp0AdA8UF74Xhdd0PtpGw+uy5SyW4SMHkqIy7JuKM4/gVs8=
X-Received: by 2002:a05:6402:4496:b0:6a6:c4b:c92f with SMTP id 4fb4d7f45d1cf-6a99caa4ab3mr1949381a12.9.1789010172185;
        Wed, 09 Sep 2026 20:16:12 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9939349dcsm1765945a12.1.2026.09.09.20.16.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2026 20:16:10 -0700 (PDT)
Date: Thu, 10 Sep 2026 03:16:09 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yuan Liu <yuan1.liu@intel.com>, Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>,
	Jason Zeng <jason.zeng@intel.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [BUG] mm/memory_hotplug: panic due to race between compaction
 and memory hot-unplug
Message-ID: <20260910031609.qbn2qcxzbitau5xc@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260903095543.3752338-1-yuan1.liu@intel.com>
 <1d625a60-9473-4f48-a384-7d756ccb7135@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d625a60-9473-4f48-a384-7d756ccb7135@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Sep 07, 2026 at 04:27:50PM +0200, David Hildenbrand (Arm) wrote:
>On 9/3/26 11:55, Yuan Liu wrote:
>> Hi all,
>
>Hi!
>
>> 
>> While stress testing memory hotplug on a VM guest running an
>> unmodified vanilla mainline kernel (7.3.0-rc1, as reported by
>> uname -r), we hit a kernel panic in the guest when memory
>> hot-unplug runs concurrently with memory compaction.
>> 
>> The kernel was built from mainline at commit:
>> 
>>     cee9395acd80 ("Linux 7.3-rc1")
>> 
>> To be more specific, after a large virtio-mem hot-unplug, the guest
>> kernel takes a fatal page fault in suitable_migration_target(), called
>> from isolate_freepages() during compaction.
>
>Sounds like a real problem we should tackle.
>
>> 
>> We are not sure whether this race is reachable under realistic
>> workloads or only under this synthetic stress test. Sharing it here
>> in case it is useful, and in case this is already a known issue.
>> Thanks.
>> 
>> 
>> Call trace (top to bottom)
>> ==========================
>> - RIP: suitable_migration_target+0x5/0x70
>>    isolate_freepages() <- compaction_alloc() <-
>>    migrate_pages() <- compact_zone() <- compact_node() <-
>>    sysctl_compaction_handler().
>> 
>> 
>> Why the race happens
>> ====================
>> CPU0 (compaction free-scanner)          CPU1 (virtio-mem hot-unplug)
>> ----                                    ----
>> page = pageblock_pfn_to_page()
>>    /* checks pass, section ONLINE */
>>    /* returns valid struct page* */
>> 
>>                                          offline_pages()
>>                                            /* section -> offline */
>>                                          __remove_pages()
>>                                            vmemmap_free()
>>                                            /* struct page UNMAPPED */
>> 
>> suitable_migration_target(page)
>>    PageBuddy(page)
>>      read page->page_type
>>      *** not-present fault -> panic ***
>> 

Does it mean, the combination of pfn_to_online_page() / PageBuddy(page) is not
safe, when there is hot-remove, even for other users. Not only compaction.

>
>If it can be hit with virtio-mem, it can be hit with any other memory hotunplug
>code path (e.g., dimm, dax).
>
>It is known that pfn_to_online_page() is racy. We usually expect the race window
>to be extremely small. But for compaction the race window is much larger.
>
>We do have get_online_mems()/put_online_mems(), big its the big hammer.
>
>We once discussed using RCU to protect pfn_to_online_page(), but I suspect for
>comapction that's not actually helpful (again, large race window).
>
>We'd have to use the memory notifier or a dedicated callback to let memory
>offlining sync with compaction.
>
>That's where it gets tricky :)
>
>
>It would be sufficient to let MEM_OFFLINE wait until any previous compaction
>users would be done with the range. In that case, the sections would be offline,
>but the memmap and zone range would not have been adjusted yet.
>
>-- 
>Cheers,
>
>David

-- 
Wei Yang
Help you, Help me
