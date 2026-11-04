Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789088;
	b=UJEL9OyUafz6ZiQzO8w5V6uWKdDWOkEdf8WbE52Z/BD2B5gSD0+1Vk14/bziE/e9w7lh
	 Z058fJ9n8uH2UlscqUNT6K5GL7vv8gJDYFMDeRWdquc90VHYfAK0J/fOxXBkPg6wyFGwP
	 9kX++8c6ybpCixXq4qLTEuJqx7t/0Xfg9bVzYu31qZKurDWfNL40gW/CJ8KqmQavDvwPn
	 2PMYVyrYo1K8BOWeHg1MuqO+uQzslf8rTfXK7MGckpfSTyvYXuq7yZ9n4KtPnu9iWVXi8
	 50eKg60GTKkoI3Hbk1ioBAY4ZqjuHX5FOwCvfcSo2eXk4qPvwGa2r8YOibifn3a8ZuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789088;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=QCti1+cjG3WmeJe83h4JqyxWGyupjY6tSFq+NOeohc4=;
	b=XaZMK08KfL95ku5O0pJJjH5xC8/b7VB+s1VgLIEyLwPTLZjYI1gVR7xW7QmrGq41n7Ti
	 oXKylihvhms/5KLQIx24uUyz5n4zFCB4RcI4WXd3Ni3KXYbC+QGvcdO+746uLo/9GrFSE
	 QuC/dPuVs1Nv1CuWVscv5niFIN1O+9OOq0Q20mVd7YsS2PGBqPDF5ZZReALMl6dvp03fe
	 8z5d5hR8EHsZ8t9xtYwI9bicw7S1w5K0rkEz39BZp/p8ktr3czXzq0HtmF2SY5VNkd3U4
	 hHj0th3rMVsDBsXbHQWMoovAaasWK0YzkwXXftGpOsncbL3yHv1GIPRnY3XeeIBNjcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="aVwRKbt/";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5012E606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5012E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aVwRKbt/
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261104104439euoutp02988df452d91671957753e5079ac07fe3~k0andw9A72352723527euoutp02x
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:44:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261104104439euoutp02988df452d91671957753e5079ac07fe3~k0andw9A72352723527euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793789079;
	bh=QCti1+cjG3WmeJe83h4JqyxWGyupjY6tSFq+NOeohc4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=aVwRKbt/eCuT/LLi+iS2q2MvTjPe8+YgOc5ZiYaPi5lajxwrALZ6sLsgnNobEEc++
	 45fJxHdrSWbpDIfoAOppkPHqPK9OX5RhrPSo2To2U72qfabgmLUhzzuJukiuSxo4ah
	 p2v6a4XYQc+oJlIi0Am/8en6Qm+8DVdu3JVbZjN4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261104104438eucas1p1d6a04d93c57861bfd221971b6df5ce0b~k0anNqHe-0214602146eucas1p1Q;
	Wed,  4 Nov 2026 10:44:38 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261104104437eusmtip1b1ace1fd24a647c7c83a0ed6c768be5b~k0amZBb451927419274eusmtip1F;
	Wed,  4 Nov 2026 10:44:37 +0000 (GMT)
Message-ID: <29cfb3a7-81c2-4c52-913b-cf72e19ff0d8@samsung.com>
Date: Wed, 4 Nov 2026 11:44:37 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, Rob Herring
	<robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Oreoluwa
	Babatunde <oreoluwa.babatunde@oss.qualcomm.com>, Wandun
	<chenwandun1@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv <linux-riscv@lists.infradead.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMuHMdV2ET0Y_=m3LHmL12VNhqK7tBKod0kph6GdZ7Q8XXhP8A@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261104104438eucas1p1d6a04d93c57861bfd221971b6df5ce0b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6
X-EPHeader: CA
X-CMS-RootMailID: 20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6
References: <CGME20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6@eucas1p2.samsung.com>
	<20261015082315.56876-1-m.szyprowski@samsung.com>
	<20261015082315.56876-3-m.szyprowski@samsung.com>
	<CAMuHMdXcM9yvwLBSi-aYRinG3omhu5aoeNVYynfFQsnDDWR-Hw@mail.gmail.com>
	<b71ac175-fba5-4f61-bbdb-0b98dec9ccee@samsung.com>
	<CAMuHMdV2ET0Y_=m3LHmL12VNhqK7tBKod0kph6GdZ7Q8XXhP8A@mail.gmail.com>

On 04.11.2026 09:19, Geert Uytterhoeven wrote:
> On Tue, 3 Nov 2026 at 20:25, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 03.11.2026 19:04, Geert Uytterhoeven wrote:
>>> On Thu, 15 Oct 2026 at 10:29, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>> Get rid of the static, limited-size reserved_mem array and replace it
>>>> with array allocated by memblock_alloc_raw() and accessed directly or
>>>> through a temporary early_memremap() mapping (depending on the
>>>> architecture support). Such mapping is needed for some architectures
>>>> (like ARM64), where linear map is not yet available during early boot
>>>> scan. The array is allocated from the bottom of RAM to avoid placing it
>>>> in highmem area, because some architectures (e.g. Xtensa, C-SKY, MIPS32)
>>>> set the memblock limit to the end of lowmem only after the early scan.
>>>> The early mapping is not used on PPC64, where the scan is done before
>>>> early_ioremap_setup(), but the memory allocated by memblock is already
>>>> accessible at that point.
>>>>
>>>> Having a single, writeable array with all reserved regions removes the
>>>> need to perform two step initialization introduced by commit
>>>> 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
>>>> regions are processed"), so all regions can be processed during the
>>>> early scan again.
>>>>
>>>> The reserved_mem array is allocated only after all static (defined by
>>>> the 'reg' property) regions are marked as reserved or no-map, so it
>>>> cannot be placed in any of them. Errors of the early reservations are
>>>> not recorded per region, only the fact that some of them failed is
>>>> stored and a message asking to fix the device-tree is printed. The
>>>> region specific init functions for the static regions are then called
>>>> in a separate pass, once the array is available. Then all dynamically
>>>> allocated reserved regions are processed.
>>>>
>>>> Suggested-by: Mike Rapoport <rppt@kernel.org>
>>>> Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Thanks for your patch, which is now commit aa05faf815836c47 ("of:
>>> reserved_mem: allocate and map the reserved_mem array early")
>>> in dt-rh/for-next.
>>>
>>> This causes an early crash on BeagleV Starlight Beta:
>>>
>>>  [...]
>>>  earlycon: uart0 MMIO32:0x0000000012440000 (options '115200n8')
>>>  printk: legacy bootconsole [uart0] enabled
>>>  printk: debug: skip boot console de-registration.
>>>  efi: UEFI not found.
>>> -OF: reserved mem: 0x00000000fb000000..0x00000000fcffffff (32768 KiB)
>>> map non-reusable framebuffer@fb000000
>>> -OF: reserved mem: 0x00000000f9000000..0x00000000f9ffffff (16384 KiB)
>>> map non-reusable framebuffer@f9000000
>>> -OF: reserved mem: 0x00000000d0000000..0x00000000f7ffffff (655360 KiB)
>>> map non-reusable framebuffer@d0000000
>>> -OF: reserved mem: 0x00000000c9000000..0x00000000ccffffff (65536 KiB)
>>> map non-reusable framebuffer@c9000000
>>> -OF: reserved mem: 0x00000000fa000000..0x00000000faffffff (16384 KiB)
>>> nomap non-reusable dma-reserved@fa000000
>>> -Reserved memory: created DMA memory pool at 0x000000107a000000, size 16384 KiB
>>> -OF: reserved mem: initialized node linux,dma@107a000000, compatible
>>> id shared-dma-pool
>>> -OF: reserved mem: 0x000000107a000000..0x000000107affffff (16384 KiB)
>>> nomap non-reusable linux,dma@107a000000
>>> -SBI HSM extension detected
>>> -[...]
>>> +Oops - store (or AMO) access fault [#1]
>>> +Modules linked in:
>>> +CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted
>>> 7.4.0-rc1-starlight-00002-gaa05faf81583 #411 PREEMPT
>>> +Hardware name: BeagleV Starlight Beta (DT)
>>> +epc : __memset+0x68/0xfe
>>> + ra : fdt_scan_reserved_mem+0x3a4/0x80a
>>> +epc : ffffffff8087fd88 ra : ffffffff80a313c8 sp : ffffffff81403c20
>>> + gp : ffffffff814dc6c0 tp : ffffffff8140cf80 t0 : ffffffc4fea38ff0
>>> + t1 : 0000000080200000 t2 : ffffffc4fec03008 s0 : ffffffff81403d10
>>> + s1 : ffffffffffffffff a0 : ffffffc4fea39000 a1 : 0000000000000000
>>> + a2 : 00000000000000f0 a3 : ffffffc4fea390f0 a4 : 0000000000000008
>>> + a5 : ffffffff8087fd88 a6 : 00000000000000f0 a7 : 0000000000001000
>>> + s2 : ffffffc4fec00000 s3 : 00000000000000f0 s4 : 0000000000000000
>>> + s5 : 0000000000002de0 s6 : 0000000000000006 s7 : fffffffffefefefe
>>> + s8 : ffffffc4fec02fd4 s9 : ffffffff8148e318 s10: fffffffffefefeff
>>> + s11: ffffffc4fea39000 t3 : ffffffff8150df00 t4 : ffffffff8150df00
>>> + t5 : ffffffff8150df00 t6 : ffffffff8150df78 ssp : 0000000000000000
>>> +status: 0000000200000100 badaddr: ffffffc4fea39000 cause: 0000000000000007
>>> +[<ffffffff8087fd88>] __memset+0x68/0xfe
>>> +[<ffffffff80a2f63a>] early_init_fdt_scan_reserved_mem+0xa4/0x110
>>> +[<ffffffff80a06c8e>] paging_init+0x17c/0x46a
>>> +[<ffffffff80a046dc>] setup_arch+0xdc/0x584
>>> +[<ffffffff80a009b8>] start_kernel+0x98/0x940
>>> +Code: 0000 8793 00e7 8305 97ba 8782 b023 00b2 b423 00b2 (b823) 00b2
>>> +---[ end trace 0000000000000000 ]---
>>> +Kernel panic - not syncing: Fatal exception in interrupt
>>> +---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
>>>
>>> Reverting the commit fixes the issue.
>> Does moving early_init_fdt_scan_reserved_mem() to the end of setup_bootmem()
>> in arch/riscv/mm/init.c change anything?
> Unfortunately that doesn't make a difference.

Well, that's still a potential issue, so I will send a separate fix for that.


>> Could You provide a full boot log from the working kernel and /proc/iomem dump?
> Sent by personal email.
> The relevant part of /proc/iomem is:
>
>     80000000-cfffffff : System RAM
>       80200000-80201fff : Reserved
>       80202000-81730bf7 : Kernel image
>         80202000-80aa7e73 : Kernel code
>         81000000-813fffff : Kernel rodata
>         81600000-816dd9ff : Kernel data
>         816de000-81730bf7 : Kernel bss
>       81730bf8-817fffff : Reserved
>       88000000-88007fff : Reserved
>       9c000000-c7ffffff : Reserved
>       c9000000-ccffffff : Reserved
>     d0000000-f7ffffff : Reserved
>     f8000000-f8ffffff : System RAM
>     f9000000-fcffffff : Reserved
>     fd000000-27fffffff : System RAM
>       2772e1000-2773a0fff : Reserved
>       2773a1000-277fa1fff : Reserved
>       277fa2000-277fcbfff : Reserved
>       277fce000-277fcefff : Reserved
>       277fcf000-27ffcffff : Reserved
>       27ffd0000-27fff6fff : Reserved
>       27fff7000-27fffffff : Reserved


This turned out to be a bootloader issue on this board. The protected opensbi
memory region was placed before kernel and not properly described in dt.
Kernel treated it as a normal memory resulting in the above crash. Confirmed
by Geert in private discussion.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

