Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246316;
	b=FQsPd4BCC7n76R5H50mInDfsGExpAmgpymCI79M8o4nHKCYbr9MnQadEm3YsZ1pHwlsu
	 2KZvWV1xHGgKrt6KHuz/ASLzWwVpmdhwbi7qyy4PJh0jjO0/Ekb5571DqxIBUJVWvd56h
	 XgyxW6hEQvUw6aw9vhr/IwUKmfu/WiVZKRgxgobqijvFIVxfsh48HF+B/iHlm/ZoYANI2
	 qt1mLFv7tseQZzK9Oo5GmGu1DB/0h9e4igtIhPp1MK732OHCQj1bslFBwF0/AxsEs6BG1
	 YAHj/2yzdqGSPzbXoIoHXAjWem+GA+uGzhlEfb51G4fPC5ZiGbUj4Gkv527NnDq6nzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=DH/fKpO0BoTPGL2h5tiHaOMY8UyYNemLu3Miwyi1WAU=;
	b=OOX1MHJX9focddW1hvonSDahrXUWDPWAwbI4ViVMapz/Mbxfk7Jh50CSYEFM9De/T/XR
	 z2aYA1BYJmsEXpXelggoT+Pu+5Ws1vqQSCw939uDL+Xyn6KGf7IvlX3kctk1GUhQOg23E
	 ChoQZfvG59cEi1nRPjRx7YlTOUB6Y7cI2w6zOkhRgr51TZL0SQrOkJdWF3nvXDIfpucMA
	 1U4gjXdqHqLhFji2H3VsTsc1ieq8zlsRBCIKKyPaiw50v8C9Sm1veND1uvF+BqIqk3gGt
	 u5gB3HfxlKf9zJH9UvQyWW7SaArx6zBrjphfwFNUfoIqa+6fAPwRetNYx5Pdn26HtVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQ9zyoZE;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4C6606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC4C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQ9zyoZE
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3105839eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793246315; x=1793851115; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DH/fKpO0BoTPGL2h5tiHaOMY8UyYNemLu3Miwyi1WAU=;
        b=MQ9zyoZElDdBBoNGlb8qkcub4a4xY7XIoJWVXyuuE6zyB9eCQDdese+H0s3wEMIGjr
         6slh079HvuzzGV57yAYAet26tzs9jNWvXmHkc8OAG/FmJUI1sthBQamvDHIo5k45N+Kt
         eGwnqFUJ5u8lSWmPu5wi8NNu08SzhdXCyMd9nCRw3SmchdelBUTy/mtcXjb/W/LhZuVB
         JVU8ZkU0bbnM2ArMrcmW9WtbrBRRciwfD+6/Frph9hJvIj34JKWotFxXZEPVM9646Ddy
         YIpIYt7LFxIP0LiJ8hQMsMwz9og1Y5Tz99R1WkdZjWeiKyDVNxi4U4uK4KMpewEtKXhE
         GN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793246315; x=1793851115;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DH/fKpO0BoTPGL2h5tiHaOMY8UyYNemLu3Miwyi1WAU=;
        b=2kx7Zg9QVpiRdsbA+8eCa45ZkiK+6qiGYecXN5bYvezHMrukk8fCXuIc0BrJK8a9jA
         qnIYVgCDn4CoJCJ3pnBFMlMH6if+LnAE2hvMAaygGe7tXD0ZUjdo9UEB2PtbdLeK4/IS
         sMm0KuHSxTDRIGPyLYO7RK/t8urqPCqEHGacSu/SYar1f924WF+gHHgWZKZJ8T5iYP2s
         TJH8zVvkDoeHAnEBHjUYEEwzhRZrEnI6Ag++sykaiHob/KEYHOcFN/PtizBsSR5iZrQI
         pahZGr1Y55vADLrihMFM6VqCrAZjFLHIUkGEDs2B9r8llBUMClUQ3aphdRADrI1Nxwdj
         /tAg==
X-Forwarded-Encrypted: i=1; AKwUvBy6LjqFfpKA5BMZXkfTUfDbHrywse1boD11ETGEyQU+/yJepk13q8dctWCmKiSZiaFVBQGbiquoGwBWg7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2/hu+gmXFIfKGa+DmPDRfYrJ0DiWtoEkfy4terv743ZefaQgx
	FrWWb8EHhITcOU2ji2Or3c2vSCOKuNmFfq7Bvzxs1M8WGg6rOqyO3cvd5Fy+gQ==
X-Gm-Gg: AYBFou2rMw/hA+doAT4iQlGnS+rdIeopsRmx/4HHzyXJvnK5hrTHRIaMRE6mwu/AriI
	gkWax+SvPoK5pZGCaerVf6bPqFopgAZ5oYtJwMr3E4Xw0g7CeD0NXjBRYjFwFfbzy5RZCdDOqYm
	f2Xf8GjI5vS5q9rOZo9Aq0HriKKu6nTTw4tPSg53p5iQQO5E9PRbUf9nIT3/2L6x1HCgGu5yxlc
	s8ykU5pV8hEgw2oU8tVRPa4Kvw82RskMnyIUZTBatBOoekABej4hz2hl3oCX8FNRBexsFE9NBDc
	1PABSi+2SoUR+veZHkRGxW/VH31vfoDrwLcWvdI4Fem3N4MGXZ5+8mms0SA90CTJXoyb3JBXb1r
	4ued2Rt2xDCRxag/Is/a3atWwAyHb7oHs/1hgwCN2/B+HQQinaIUrBbUV3FqBeb7+sz26OUXTOX
	9RliiJDV/kNCyWU5UJNL0RdkB+FyWrjoGChzGpKvUN6lEp0mU50hG3XM8KQYW8PZ4hdGChy7L+o
	P+WCZSAGLWHe7qfFo2TYQe8YJi2eSzPtwb1MlLHy7BciDjHsJFq5csmSyiIz9//NxVgx6UxazJz
	XIAXUAqIFULcFHSofP9lnR0FM3I=
X-Received: by 2002:a05:701b:260d:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1a6cd499523mr4859697c88.13.1793246314816;
        Wed, 28 Oct 2026 20:58:34 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75fdc1031sm11012363c88.19.2026.10.28.20.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:58:34 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, David Hildenbrand <david@kernel.org>, Pavithra <pavrampu@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/64s/radix: don't dedup vmemmap covered by an existing PMD leaf
In-Reply-To: <2C88EF3C-1E7D-4395-99C5-711FFB01469A@linux.dev>
Date: Thu, 29 Oct 2026 09:20:11 +0530
Message-ID: <ik2lw4gc.ritesh.list@gmail.com>
References: <97f85592bb78a273be8519e6897e7f9b9bd31469.1793070429.git.ritesh.list@gmail.com> <2C88EF3C-1E7D-4395-99C5-711FFB01469A@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Muchun Song <muchun.song@linux.dev> writes:

> Hi Ritesh,
>
>> On Oct 27, 2026, at 11:22, Ritesh Harjani (IBM) <ritesh.list@gmail.com> wrote:
>> 
>> radix__vmemmap_populate() is asked for one 16MB section, which is 16KB of
>> struct pages. With no altmap it rounds the request down to a PMD leaf.
>> That leaf describes 2GB of PFNs with 64KB pages (128MB with 4KB pages),
>> so it also covers sections that are not present yet. It cannot be freed
>> while any of those sections are still in use.
>> 
>> A devdax namespace that lands in the same window is marked for vmemmap dedup.
>> vmemmap_populate_compound_pages() treated the leaf as an existing huge mapping
>> and skipped it. The core then initializes only the head vmemmap page and assumes
>> the rest is the shared tail. Those remaining tail slots are real struct pages
>> still holding the page_init_poison() pattern and are not the shared tail pages.
>
> Right.
>
>> __init_single_page() warns on the zone mismatch and the following pageblock init
>> faults in __set_pfnblock_flags_mask().
>
> Yeah, the new adding warning is useful.
>
>> 
>> If the section's vmemmap is already a PMD leaf, clear its compound order
>
> I think it's enough to fix this issue.
>

Oh yes, right! since the page init is done later and the optimizable
order can be read from mem_section.

>> and reuse the leaf, so every struct page in the section is initialized.
>> The shared-tail layout needs base-page PTEs, so it cannot be built on top of
>> this leaf and dropping the leaf is not an option while the neighbouring range
>> is still using it. So, fail the compound populate if a leaf is still seen there.
>> 
>> <Call Trace>
>> ============
>> [    3.467060][    T1] WARNING: mm/mm_init.c:600 at __init_single_page+0xd0/0xf4, CPU#0: swapper/0/1
>> <...>
>> [    3.477419][    T1] NIP [c000000000576b30] __init_single_page+0xd0/0xf4
>> [    3.477827][    T1] LR [c0000000005778b0] __init_zone_device_page+0x30/0xb8
>> [    3.478444][    T1] Call Trace:
>> [    3.478764][    T1]  0x10000 (unreliable)
>> [    3.479874][    T1]  memmap_init_zone_device+0x164/0x430
>> [    3.480392][    T1]  memremap_pages+0x43c/0x93c
>> [    3.480836][    T1]  devm_memremap_pages+0x3c/0xa4
>> [    3.481328][    T1]  dev_dax_probe+0x264/0x3d0
>> [    3.481817][    T1]  dax_bus_probe+0x140/0x1c8
>> [    3.482237][    T1]  really_probe+0x108/0x580
>> [    3.482681][    T1]  __driver_probe_device+0xcc/0x284
>> [    3.483186][    T1]  driver_probe_device+0x5c/0x108
>> [    3.483656][    T1]  __device_attach_driver+0x10c/0x1e8
>> [    3.484134][    T1]  bus_for_each_drv+0xc0/0x13c
>> <...>
>> [    3.499972][    T1] BUG: Kernel NULL pointer dereference on read at 0x00001400
>> [    3.500417][    T1] Faulting instruction address: 0xc0000000005f4ecc
>> [    3.500417][    T1] Faulting instruction address: 0xc0000000005f4ecc
>> cpu 0x0: Vector: 300 (Data Access) at [c000000006756b50]
>>    pc: c0000000005f4ecc: __set_pfnblock_flags_mask.constprop.0+0x34/0x160
>>    lr: c000000000577f38: memmap_init_zone_device+0x358/0x430
>>    pid   = 1, comm = swapper/0
>> enter ? for help
>>  memmap_init_zone_device+0x358/0x430
>>  memmap_init_zone_device+0x220/0x430 (unreliable)
>>  memremap_pages+0x43c/0x93c
>>  devm_memremap_pages+0x3c/0xa4
>>  dev_dax_probe+0x264/0x3d0
>>  dax_bus_probe+0x140/0x1c8
>>  really_probe+0x108/0x580
>> <...>
>> 
>> Fixes: bd0862382adb ("mm/sparse-vmemmap: drop Device DAX-specific population path")
>
> Actually, the right Fixes is:
>
> Fixes: f2b79c0d7968 ("powerpc/book3s64/radix: add support for vmemmap optimization for radix")
>
> On older kernels, these errors are silent. They trigger a kernel panic when the user
> actually uses Device DAX, rather than during the initialization phase. 
>
> So, for older kernels, we should guide them to backport the patch.
>
>> Reported-by: Pavithra <pavrampu@linux.ibm.com>
>> Assisted-by: LLM
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>> Fixes tag here is added since the fix is dependent upon the change mentioned in
>> "Fixes" tag. The Fixes commit-id is from mm-new branch. Although this could be
>> an older pre-existing issue, but got exposed after this patch series.
>
> I knew this issue, so I have a local commit to fix it as well. I'd like to share
> it with you, because it looks a little simple, does it work for you?
>
> powerpc/mm: fix uninitialized ZONE_DEVICE struct pages with PMDs
>
> PowerPC radix vmemmap population can reuse an existing PMD mapping while
> populating a device DAX range whose section is marked as HVO-enabled. The
> reused mapping is an ordinary vmemmap mapping: the redundant tail struct
> pages are not remapped to the shared tail page.
>
> Leaving the section marked as HVO-enabled makes later ZONE_DEVICE
> initialization treat the range as optimized and initialize only the struct
> pages that would be backed by a real HVO mapping. The remaining tail struct
> pages can then be left uninitialized even though they are still used as
> metadata for the device DAX compound page.
>

Here, feel free to use the call trace from my commit msg to show what goes
wrong w/o this fix.

> The Fixes target predates the section-based vmemmap optimization
> infrastructure, so older kernels do not have section state that can be
> marked non-HVO. Backports to such kernels need to handle the PMD-reuse
> case in powerpc radix code directly, for example by initializing the tail
> struct pages that core ZONE_DEVICE initialization would otherwise skip.
>
> Mark the section as non-HVO when reusing an existing PMD mapping, so the
> section's HVO state matches the actual vmemmap layout and all required
> struct pages are initialized.
>
> Fixes: f2b79c0d7968 ("powerpc/book3s64/radix: add support for vmemmap optimization for radix")
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

yes, love this approach. Thanks for sharing the fix.

>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 72793ace1fb6..fc3a2d4b422d 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1200,7 +1200,16 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
>  			return -ENOMEM;
>
>  		if (pmd_leaf(READ_ONCE(*pmd))) {
> -			/* existing huge mapping. Skip the range */
> +			unsigned long addr_pfn = page_to_pfn((struct page *)addr);
> +			struct mem_section *ms = __pfn_to_section(addr_pfn);
> +
> +			/*
> +			 * Existing PMD mappings can cover the edges of a valid
> +			 * HVO populate range.  They are ordinary vmemmap mappings,
> +			 * so the current section must not be treated as HVO-backed
> +			 * when its struct pages are initialized later.
> +			 */
> +			section_set_order(ms, 0);

I think you meant "section_set_compound_order(ms, 0);"

yes, otherwise the patch looks good to me. Can you please post this
patch separately then? Feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

I have validated the fix with my custom reproducer and I see the issue
is fixed with this. Meanwhile, Pavithra (cc'd) is testing this and few
other patches of your series. Once her testing is finished, she can help
provide her Tested-by/feedback if any.

>  			next = pmd_addr_end(addr, end);
>  			continue;
>  		}

-ritesh
