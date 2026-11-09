Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189831;
	b=krXVCRBpQR21o1PqKEfo7V+eYZaSQWGeHZI+kW7aFDllgyG4JBwC1pAqBJBZjDRQqj39
	 Jkw8ErMIurWk/IV3nYmerumz4a8HaMJ3cxtOitTolMGja9Ox9lcBPaC2bZ/XTE4nI6YSD
	 0l4alyyuNUVf533JuxhKbGXH6kADgjc/jZKxGzdeiQgC+WRGw8mBMbCA0t+pGyJbl4zFs
	 g75XjwcHd48yAKveEUK5Ojnd2SRCPeStCrR1gc0lx+elPiPnaTLPNbfnCShPMrUi0KhQE
	 mftlZlx3SPQaKIKGHKQfXDNE2XMwtYio9MSFXbVnkFrEkIoq3EXq+2j1t1cfcvGwGTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=e5KGXFtLIP4zXwl3CaHAlUnWSxZc9jYkQR01vVD5bYM=;
	b=pql/mzmJo+KMnnFot6yLfW6CHPXhISc2eZYruPdSjwwznts+dIfVmSrCXXJ05ijAYWge
	 6M8rVLMeSvym2Oy3rrbQOiFlhS4/nx6GGU2XwRErgWgxF3CgQdBu35sAYCpiMNmeectnA
	 j/Y3CqA397fN817oEeo5mdi+9JqG/yRktHwZuZ6jmyAQIgDiLGl1T8LHZ71x+qphDgiem
	 TwLVJ2/+5UAU9h80aC79WMFmaVDNaqwG+9d2vnjDfj7kJ+aiGxWR1QgiTsYOPMrt/esGb
	 89kSl03Ljf86bYu7OpU3Mvibbv6661lDoLuQELcAdH2mQcU7ZADCjj5z715Z8QEIS/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TMrfmWGk;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8223606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8223606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TMrfmWGk
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36ff9c9da34so667746eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794189830; x=1794794630; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e5KGXFtLIP4zXwl3CaHAlUnWSxZc9jYkQR01vVD5bYM=;
        b=TMrfmWGkR6eDsJ2i5SsXYzq1x64Km1Ljy3sWdAuGLJZ3SquSd5coZLSRdcd1LeOj0G
         JOEneQWZ7yqKC8xcH4PZVPLXRDu7ZiUjy1YWpbGEPdmcGv8KQC8lL7Bs2N5eyT04QH0v
         mOhUu/arO6AMxIwVZJ1gCQzlo3Np8wTdHqRmGSDEqgM03VWZXjO5vgBxuUCAyZ+nbul0
         aDWXg7KTD8VcHAydiwz/uEMYXw7Gb4vs9kFaA9XIRx9ytAFXqVR40F2k0ZW4tStlrdE6
         TEFVvbOgRUnBr23mSYgJ0qFsFhB+5HCRRNW3gwgvqEuF7D88aorPAHVMjrQHqMqxY0Ah
         Khig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189830; x=1794794630;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e5KGXFtLIP4zXwl3CaHAlUnWSxZc9jYkQR01vVD5bYM=;
        b=lRBh0v8LRBZlf9HWlgF6MkqZAidaTyqcwP3zGhzWk/IUz5ry3S0ZL9l31+DfpJkBjR
         y64cvE+cBi5yJisshG/ueUQYAWZlp5C2WE2tDVIUfUvAn63JGYe9hcCJTzRZT/g5dTzo
         Y52glpXYU7IObxTgTbRgRWFLK5sxmiitWLEuLVDUunMUwzqFmBkDYjhM2V51b1807wfQ
         2jkhS8vDL7Tlj03Fs7OXvjULF40+7R+ralhVwE6k01uQoVR9fq03EDuPg0h55XVoyPJZ
         WcYTkJFSvxOiHY6wqcWvcttzRjeCso3HZnBpLeIHyh8OS/C2HxubLelvxZizAmYb88d8
         q2+Q==
X-Forwarded-Encrypted: i=1; AL+hErGOigmlwGI+QUPLEK1iiTTyymkzI3X1NjlLgvzwonMn6RQP16BjF6JLVh4FBnwON1LdZFXKt/BYXbYMFGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zjNIstFTgJPeYI+2lwuhsEppHZq5c3krHSP7dJsEXOdlN/N1J
	XZyUCkDTRiYpfw0Z1DcW6uV5mqdTEIJ/5Zz8u9kZtB5ZnIR/XLgQIQ7T
X-Gm-Gg: AYBFou21rZcjSxoH2t04B3Rc/0cNgmTCx6NNutEfZRrE8fbw29cONb6y6oAXBO+IYhi
	rISFs2CZgdTRQFQTBrsysA2JVCo0D+bTTWn6W0guOLTpRJ6oCdM15G23xLyFsjbnBlN5JB7THqS
	tXdLE+i9OG/EhejJoCVk8iXum3vGPdMj8dkoaPZkdR4nzrn1l1rQFkvqMq8OXWIDH8VbTqSScJi
	NYRl6IvtcK3oJCH8Ra4U0X/YZCtkn37FTqJLS1EufFYQy9oFTtPI0MFKAgchIcG26UQuvaQzX3X
	lonecNgRZM6STj3FXCRCEo9tWtjU1TzC+3RvW2jTwxCMxUY7muSzvubcttYwk/7f70vzbXyGgyb
	wQPCY3VueyX3W/hOczq1a4QDMeGvbznlcopJsXxzNQhR8Hz0mHIeLwSlGPkZ2xeLNA/oRdoLNdL
	RgfDJuC/ZVh9XoDx7pFv2a0bfWMhjztDjDExKlGzOjkdeZc5S7oyfVySrdxtjBN1nQsU0Nny8gb
	fwKRb7wvODOK7tSY3SUKYjHgysYhfWlOqEItpaMVOU9sbXYvQ0GIpaQAPo3y4QypI/KAz/84BUc
	B+d8Vcss6pDju16BHpYUBO3ReyshdgcROGjwzLwuRSTPzLus
X-Received: by 2002:a05:7300:680e:b0:36b:d3dd:2e85 with SMTP id 5a478bee46e88-372575c63fcmr5237251eec.36.1794189829714;
        Sun, 08 Nov 2026 18:03:49 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726039c635sm8670520eec.0.2026.11.08.18.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:03:48 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Muchun Song <songmuchun@bytedance.com>, Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joao Martins <joao.m.martins@oracle.com>, Pavithra Prakash <pavrampu@linux.ibm.com>, Muchun Song <muchun.song@linux.dev>, stable@vger.kernel.org, nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] dax/pmem: fix unaligned compound devmap initialization
In-Reply-To: <20261107030126.90894-1-songmuchun@bytedance.com>
Date: Mon, 09 Nov 2026 07:27:12 +0530
Message-ID: <cxseojgn.ritesh.list@gmail.com>
References: <20261107030126.90894-1-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Muchun Song <songmuchun@bytedance.com> writes:

> Static pmem Device DAX namespaces reserve space for namespace metadata
> before the user-visible data range, and may also include padding needed
> to satisfy the Device DAX alignment. __dax_pmem_probe() adjusts the
> dax_region range to start at the data range, but the dev_pagemap range
> still starts at the beginning of the namespace.
>
> That is not valid for compound devmap mappings whose memmap is stored in
> system RAM. Compound page initialization requires the start PFN to be
> naturally aligned to the compound page size, because the head and tail
> struct pages are initialized according to that geometry. If the pgmap
> starts before the aligned data range, memmap_init_zone_device() can build
> compound page metadata from an unaligned PFN.
>
> The resulting struct page layout is inconsistent with the Device DAX
> mapping. A later mmap fault can then resolve the user-visible PFN through
> invalid compound page metadata and hit a kernel panic while inserting the
> DAX folio.
>
> Fix this by rounding the pgmap start up to the Device DAX alignment for
> non-altmap mappings. This gives compound mappings the required naturally
> aligned start while retaining full-section vmemmap savings when the
> original start is already aligned. The altmap path remains unchanged
> because memmap_init_zone_device() skips the altmap reservation itself.
>
> Fixes: 14606001efb4 ("device-dax: compound devmap support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reported-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Closes: https://lore.kernel.org/r/wlrkqqvg.ritesh.list@gmail.com

Tested v2 also on my Power dev test setup. With this patch the reported
problem is fixed. I am no more hitting the following warning and crash:

[    3.071811][    T1] WARNING: mm/mm_init.c:1175 at memmap_init_zone_device+0x144/0x470, CPU#0: swapper/0/1
[    3.082276][    T1] NIP [c000000000596604] memmap_init_zone_device+0x144/0x470
[    3.082763][    T1] LR [c0000000006d72b8] memremap_pages+0x3b0/0x974
[    3.083345][    T1] Call Trace:
[    3.083629][    T1] [c000000006d86e00] [c000000006d86e40] 0xc000000006d86e40 (unreliable)
[    3.084975][    T1] [c000000006d86f10] [c0000000006d72b8] memremap_pages+0x3b0/0x974
[    3.085449][    T1] [c000000006d86fe0] [c0000000006d78b8] devm_memremap_pages+0x3c/0xa4
[    3.085891][    T1] [c000000006d87020] [c00000000125c084] dev_dax_probe+0x264/0x3d0
[    3.086339][    T1] [c000000006d870c0] [c000000001259a28] dax_bus_probe+0x140/0x1c8
[    3.086778][    T1] [c000000006d87110] [c0000000011ce640] really_probe+0x108/0x580
[    3.087218][    T1] [c000000006d871a0] [c0000000011ceb84] __driver_probe_device+0xcc/0x284
[    3.087668][    T1] [c000000006d87230] [c0000000011ceea0] driver_probe_device+0x5c/0x10c
[    3.088123][    T1] [c000000006d87270] [c0000000011cf05c] __device_attach_driver+0x10c/0x1e8
[    3.088582][    T1] [c000000006d872f0] [c0000000011cab70] bus_for_each_drv+0xc0/0x13c
[    3.089035][    T1] [c000000006d87350] [c0000000011cf65c] __device_attach+0xdc/0x2b0
[    3.089467][    T1] [c000000006d873f0] [c0000000011cfaac] device_initial_probe+0x80/0x98
[    3.089910][    T1] [c000000006d87420] [c0000000011cac44] __bus_probe_device+0x58/0xf4
[    3.090358][    T1] [c000000006d87470] [c0000000011c8030] device_add+0x850/0xa78
[    3.090778][    T1] [c000000006d87530] [c00000000125b040] __devm_create_dev_dax+0x1c0/0x638
[    3.091236][    T1] [c000000006d875d0] [c00000000125b6c8] devm_create_dev_dax+0x44/0x7c
[    3.091676][    T1] [c000000006d87600] [c00000000125dbe8] __dax_pmem_probe+0x238/0x27c
[    3.092120][    T1] [c000000006d87770] [c00000000125dc4c] dax_pmem_probe+0x20/0x44
[    3.092542][    T1] [c000000006d87790] [c000000001237a14] nvdimm_bus_probe+0xcc/0x370
[    3.093097][    T1] [c000000006d87830] [c0000000011ce640] really_probe+0x108/0x580
[    3.093610][    T1] [c000000006d878c0] [c0000000011ceb84] __driver_probe_device+0xcc/0x284
<...>
[    3.099405][    T1] ---- interrupt: 0 at 0x0
[    3.099837][    T1] Code: 7c0802a6 fa8100b0 faa100b8 fb8100f0 7d574030 7d4a4030 f8010120 fbe10108 3917ffff 7d294038 3109ffff 7d284910 <0b090000> 3d2201c5 7bb53664 7ed607b4
[    3.101209][    T1] ---[ end trace 0000000000000000 ]---
[    3.104702][    T1] BUG: Unable to handle kernel data access on write at 0xc00c000000210000
[    3.105209][    T1] Faulting instruction address: 0xc000000000596394
cpu 0x0: Vector: 300 (Data Access) at [c000000006d86aa0]
    lr: c0000000005962c4: memmap_init_compound+0xac/0x2a8
    sp: c000000006d86d40
   msr: 8000000002009033
   dar: c00c000000210000
 dsisr: a000000
  current = 0xc000000006d33e00
  paca    = 0xc000000005010000   irqmask: 0x03   irq_happened: 0x01
    pid   = 1, comm = swapper/0
Linux version 7.3.0-17056-gc0944ee4a2c4 (powerpc64le-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #111 SMP PREEMPT Mon Nov  9 07:25:29 IST 2026
enter ? for help
[c000000006d86e00] c0000000005968f8 memmap_init_zone_device+0x438/0x470
[c000000006d86f10] c0000000006d72b8 memremap_pages+0x3b0/0x974
[c000000006d86fe0] c0000000006d78b8 devm_memremap_pages+0x3c/0xa4
[c000000006d87020] c00000000125c084 dev_dax_probe+0x264/0x3d0
[c000000006d870c0] c000000001259a28 dax_bus_probe+0x140/0x1c8
[c000000006d87110] c0000000011ce640 really_probe+0x108/0x580
[c000000006d871a0] c0000000011ceb84 __driver_probe_device+0xcc/0x284
[c000000006d87230] c0000000011ceea0 driver_probe_device+0x5c/0x10c
[c000000006d87270] c0000000011cf05c __device_attach_driver+0x10c/0x1e8
[c000000006d872f0] c0000000011cab70 bus_for_each_drv+0xc0/0x13c
[c000000006d87350] c0000000011cf65c __device_attach+0xdc/0x2b0
[c000000006d873f0] c0000000011cfaac device_initial_probe+0x80/0x98
[c000000006d87420] c0000000011cac44 __bus_probe_device+0x58/0xf4
[c000000006d87470] c0000000011c8030 device_add+0x850/0xa78
[c000000006d87530] c00000000125b040 __devm_create_dev_dax+0x1c0/0x638
[c000000006d875d0] c00000000125b6c8 devm_create_dev_dax+0x44/0x7c
[c000000006d87600] c00000000125dbe8 __dax_pmem_probe+0x238/0x27c
[c000000006d87770] c00000000125dc4c dax_pmem_probe+0x20/0x44
[c000000006d87790] c000000001237a14 nvdimm_bus_probe+0xcc/0x370
[c000000006d87830] c0000000011ce640 really_probe+0x108/0x580
<...>

Feel free to add:

Tested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

