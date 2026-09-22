Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3423C4779A9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080774; cv=none; b=QdeNjpcBXGmOcYc08IxTq66ZYSWDAeGtHpMfwmWftUBESOHWjdtWiVA0SpI8h+QIFD0z5A6740bhA5rLfiZCLhGl4XZeDt8LORF0BzOYiOL+HyePJgLE+0NY6AJEpWGYP2ROwU0OfhXGDuT0wd9pNiu9eMeyjd2m1T3psfZZXOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080774; c=relaxed/simple;
	bh=uVRWMm+rocRisGEScvol7U2RN1IebvUu9uPE2VFgG9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbSuU4/ZPp07Bp4ZsdXl8Yw07+XSt6IXbEgPeoYuOfgMuqpJmthB9Bo6SFTGt6iHq+PZggtaeqv2Pex3cL10scEDnC/ke3GvRGge8J4V1+XsiHioS8Hc37Zq1WYLfZAt9A/pKvVpSb0kh5VksuZdduQyErIbjanyfjtIJVv14Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Le0aQFOb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Le0aQFOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790080772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7rZHGjrhc0+tlCgX+JeQpKinKuN2xlIHFPD7PX5sonQ=;
	b=Le0aQFObMydCmqkfbZ21MV/bXfhA5vXf327F42vQS3w71FNxTVGdLiR7CB90KEgI58G8MP
	VORr2Wep04kkFh2+vN/6IhiuzDC9B6CGGX8K79DJmKCRaqwdOPSEay+vNyyBqebXQrpi/v
	AyAxXLs9fLI7W7SJN2nOUCkvk479Sic=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522--c2YFg3bNfmTDIF58wrKoQ-1; Tue, 22 Sep 2026 08:39:29 -0400
X-MC-Unique: -c2YFg3bNfmTDIF58wrKoQ-1
X-Mimecast-MFC-AGG-ID: -c2YFg3bNfmTDIF58wrKoQ_1790080769
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so810419085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080769; x=1790685569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rZHGjrhc0+tlCgX+JeQpKinKuN2xlIHFPD7PX5sonQ=;
        b=l+t1bMvaJBQ1cLQTjWmyNkB7YHeLh/IqMhtMUfrcN7Ts/yAt8vgpjSEQK4cscG09hI
         JEAJstv6plJ7K6oVVh21XSpL39kub2zfsauj4QcO1cVCj61e1FexURIjQ+hT6zzVLEvD
         DSDvKuxpK7ci5w13KjNMu/lDR594NrrypcO875NVZ28PyTlh4ASi2Qh+jrXCtArP0VJb
         oQD6FWrvVUmKjqj+NhooztkzIf6apjtS5gPEKWplbWux0+MHjrQz9D2RD3dHNkrywJof
         Fwu0OJKhal/1J1/HepoeyIOPUlk8P6v4gQ7mXV6vhJcw3P6zTZ3G0pG/ZZbYkMj3wjwl
         D/vQ==
X-Forwarded-Encrypted: i=1; AKwUvByP73eWlN/gcXZXzyH5hxmcmQTA4f6ao2JlDolFJcgDRY38xFy+QdRS5/kO223pvpC6LmO6WDRjMOm5Tco=@vger.kernel.org
X-Gm-Message-State: AFuF++mMm7C7g+IEbvl3aN8CdWTdJrLbAt4cnotktjZBSIuPvCQ6d6D/
	5FygwrJd2hLZXIC8xaQI8t3PUSGMJj9BFPnoVP2ZxfJ6en4JXmCmAT2vDlnvExLoqSHuI8HC/A6
	o1AbY058FA9YVHDWXj7A0SPEQdsQlychJ/sogNHaU77zT+KUxTpcRv0C7Jw2XKZ3Qfg==
X-Gm-Gg: AYBFou1dwoO5kzs4j5kO3uTOqKNAAE0s7+EKrRtXjA8fRsDoYJ4LlW2pU+rjzWSX81W
	fMCuc9BCFoRC8jKnyCXe0StVU7lT+dCoMsj+p25JRHjUTTfLY+6IN8lmVyFij2tQ0x0qpbmT0y6
	LX5CE2/94KovBtEVX9cXw2SBi8DXxqVt0kj9aHi/gELXH8iUiOjNQU3zu7KdNeY21PGucxKGSST
	HHtXiNb1szGv+W4iDdrL597LDnC56NNlzJ+kC+I4u4yDiVMm+CadVevNPQn2EukL/5kFmgaK+ue
	jmhm7al1IP4qhgwccy7bxhF/pBilU/RO0TcSokS0UUh19TWffAQ1fgg4oIgDts0VV4LKgsUgSNF
	7I3Y=
X-Received: by 2002:a05:620a:45a5:b0:93b:b4e0:1c89 with SMTP id af79cd13be357-93c15eed479mr514960685a.40.1790080768691;
        Tue, 22 Sep 2026 05:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:45a5:b0:93b:b4e0:1c89 with SMTP id af79cd13be357-93c15eed479mr514957085a.40.1790080768165;
        Tue, 22 Sep 2026 05:39:28 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d249f9bsm133721685a.44.2026.09.22.05.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:39:27 -0700 (PDT)
Message-ID: <0a7789b4-f77f-4522-bcf0-3e7b532f2340@redhat.com>
Date: Tue, 22 Sep 2026 08:39:27 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [USB] WARNING: mm/page_alloc.c:5345 at
 __alloc_frozen_pages_noprof+0x39a/0x3d0, CPU#41: swapper/0/1
To: Hao Ge <hao.ge@linux.dev>
Cc: akpm@linux-foundation.org, mathias.nyman@intel.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-mm@kvack.org
References: <8b77688e-3219-4133-af0f-395e342acb25@redhat.com>
 <f151fb61-6e9d-4f42-8a3e-89cf5f4fcaea@linux.dev>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <f151fb61-6e9d-4f42-8a3e-89cf5f4fcaea@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/21/26 11:13 PM, Hao Ge wrote:
> Hi Luiz
> 
> On 2026/9/22 10:28, Luiz Capitulino wrote:
>> Hello,
>>
>> When booting the latest Andrew Morton's mm-new tree[1] commit 498ee28e5ec4
>> ("mm/swap, PM: hibernate: atomically replace hibernation pin") on a KVM guest,
>> I'm getting the following MM warning being triggered:
>>
>> """
>> [    1.667197] [      T1] WARNING: mm/page_alloc.c:5345 at __alloc_frozen_pages_noprof+0x39a/0x3d0, CPU#41: swapper/0/1
>> [    1.691217] [      T1] CPU: 41 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           7.3.0-rc1+ #12 PREEMPT(full)
>> [    1.692073] [      T1] Tainted: [W]=WARN
>> [    1.692378] [      T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS edk2-20260812-8.fc44 08/12/2026
>> [    1.693158] [      T1] RIP: 0010:__alloc_frozen_pages_noprof+0x39a/0x3d0
>> [    1.693685] [      T1] Code: e2 04 e8 49 85 ff ff 45 31 c9 e9 14 fe ff ff 0f 0b e9 e7 fe ff ff 80 3d 6d 3a f2 05 00 0f 85 2b fe ff ff c6 05 60 3a f2 05 01 <0f> 0b e9 1d fe ff ff 48 89 5c 24 40 48 89 6c 24 48 4c 89 64 24 50
>> [    1.695238] [      T1] RSP: 0000:ff46f50b801538d8 EFLAGS: 00010246
>> [    1.695723] [      T1] RAX: 0000000000000000 RBX: 0000000000000cc0 RCX: 0000000000000000
>> [    1.696356] [      T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000cc0
>> [    1.696981] [      T1] RBP: 0000000000000034 R08: 0000000000000000 R09: 0000000000000cc0
>> [    1.697605] [      T1] R10: 0000000000000034 R11: 0000000000000100 R12: 0000000000000034
>> [    1.698231] [      T1] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>> [    1.698872] [      T1] FS:  0000000000000000(0000) GS:ff2b932745209000(0000) knlGS:0000000000000000
>> [    1.699592] [      T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    1.700119] [      T1] CR2: 0000000000000000 CR3: 00000006ede4a001 CR4: 0000000000773ef0
>> [    1.700745] [      T1] PKRU: 55555554
>> [    1.701023] [      T1] Call Trace:
>> [    1.701283] [      T1]  <TASK>
>> [    1.701512] [      T1]  alloc_pages_node_noprof+0x4c/0xc0
>> [    1.701919] [      T1]  __dma_direct_alloc_pages.isra.0+0x164/0x1f0
>> [    1.702402] [      T1]  dma_direct_alloc+0x19f/0x2b0
>> [    1.702767] [      T1]  dma_alloc_attrs+0x8d/0x200
>> [    1.703133] [      T1]  xhci_alloc_interrupter+0xc9/0x190
>> [    1.703543] [      T1]  xhci_mem_init+0x283/0x340
>> [    1.703902] [      T1]  ? __pfx_xhci_pci_quirks+0x10/0x10
>> [    1.704317] [      T1]  xhci_gen_setup+0x35e/0x4f0
>> [    1.704684] [      T1]  xhci_pci_setup+0x52/0x1c0
>> [    1.705038] [      T1]  usb_add_hcd.cold+0x241/0x5d8
>> [    1.705413] [      T1]  usb_hcd_pci_probe+0x188/0x480
>> [    1.705803] [      T1]  xhci_pci_common_probe+0x6b/0x2f0
>> [    1.706218] [      T1]  local_pci_probe+0x4a/0x90
>> [    1.706582] [      T1]  ? cpu_hotplug_disable+0x15/0x30
>> [    1.706986] [      T1]  pci_call_probe+0x55/0x150
>> [    1.707357] [      T1]  pci_device_probe+0xae/0x150
>> [    1.707734] [      T1]  ? kernfs_create_link+0x61/0xb0
>> [    1.708139] [      T1]  ? sysfs_do_create_link_sd+0x81/0xf0
>> [    1.708562] [      T1]  call_driver_probe+0x23/0x100
>> [    1.708949] [      T1]  ? driver_sysfs_add+0x55/0xc0
>> [    1.709334] [      T1]  really_probe+0xd7/0x2d0
>> [    1.709681] [      T1]  ? _raw_spin_unlock_irq+0xe/0x30
>> [    1.710098] [      T1]  __driver_probe_device+0x9c/0x1b0
>> [    1.710503] [      T1]  driver_probe_device+0x1f/0x80
>> [    1.710892] [      T1]  ? __pfx___driver_attach+0x10/0x10
>> [    1.711323] [      T1]  __driver_attach+0x10a/0x210
>> [    1.711706] [      T1]  ? __pfx___driver_attach+0x10/0x10
>> [    1.712125] [      T1]  bus_for_each_dev+0x86/0xf0
>> [    1.712488] [      T1]  bus_add_driver+0x13e/0x230
>> [    1.712858] [      T1]  ? __pfx_xhci_pci_init+0x10/0x10
>> [    1.713273] [      T1]  ? __pfx_xhci_pci_init+0x10/0x10
>> [    1.713681] [      T1]  driver_register+0x75/0xe0
>> [    1.714049] [      T1]  do_one_initcall+0x7a/0x1c0
>> [    1.714429] [      T1]  do_initcalls+0xe1/0x100
>> [    1.714780] [      T1]  kernel_init_freeable+0x152/0x1c0
>> [    1.715199] [      T1]  ? __pfx_kernel_init+0x10/0x10
>> [    1.715592] [      T1]  kernel_init+0x1f/0x140
>> [    1.715928] [      T1]  ret_from_fork+0x19e/0x270
>> [    1.716296] [      T1]  ? __pfx_kernel_init+0x10/0x10
>> [    1.716680] [      T1]  ? __pfx_kernel_init+0x10/0x10
>> [    1.717071] [      T1]  ret_from_fork_asm+0x1a/0x30
>> [    1.717438] [      T1]  </TASK>
>> [    1.717663] [      T1] ---[ end trace 0000000000000000 ]---
>> """
>>
>> This does not happen with latest Linus tree 40288c9206c1 ("Merge tag
>> 'drm-fixes-2026-09-19' of https://gitlab.freedesktop.org/drm/kernel").
>>
>> What I could determine is:
>>
>> - In xhci_alloc_interrupter() max_segs=0, which leds to seg=0
>>
>> - This eventually leads to passing size=0 to get_order() in
>>    __dma_direct_alloc_pages() (call sequenece below). Passing size=0 to
>>    get_order() is undefined and returns order=52 on my guest, whch leads
>>    to the warning since 52 > MAX_PAGE_ORDER
>>
>>      xhci_alloc_erst()
>>        dma_alloc_coherent()
>>          dma_alloc_attrs()
>>            dma_direct_alloc()
>>              __dma_direct_alloc_pages()
>>              get_order()
>>              alloc_pages_node()
>>
>> [1] git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm origin/mm-new
>>
> 
> Thanks for the report. From my understanding, it is already
> fixed in mainline by 045b5bef916d ("usb: xhci: Fix HCS_ERST_MAX conversion").

You're right, cherry picking this into mm-new fixed the issue for me.
Andrew hasn't rebased on top of v7.3-rc2 yet. Thanks for the quick
reply.

