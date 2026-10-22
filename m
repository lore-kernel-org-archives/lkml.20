Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792642840;
	b=HTz8QE1QtIL280QJ/ZFC+ANe0ofL+kbC66WQErj4p0rjT3qQaHJucokS2l7tcgE6ArHo
	 sA4qEcRlUbqpRbiZrgsXc1bd37F4LlRnT1ejNZAv8BEjB3huccwLHHVCtUXM0ymq9AKYm
	 9BasqIuk6wVcSTbf9QZef0WRXYVPvq1wGyDvnjNYzT2o9Xlcyyde2oaOlUHQ0eFnaYLQQ
	 emW/3CdephC5QDOQINVWf+qCRLZRa9+oviB6OC3GnlcAeWXkJ4fu8oICI9nSP7fA3iVYu
	 YJUdTexTv5VOhKBxRp15pwtj0yutxCaltsZq58dyI05n2w7Qqgk4GS5y1LcyUXLgYJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792642840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=IYGqe8uHdvMKTGNalGzso/Hav7cwh06URO2tg9hCsgA=;
	b=NF4FHBV4CT3yqaZkFpSA8dwv0xkzZSjdGMfIgaEOu0to1hZHwayoh3XjfKjGANTdTfo9
	 qhg9UmyfU4em51qMZXssltPhdjMXJPIBnsZD1CsORxWCt7DIPavAi7dDPpMC3fMnR/p5R
	 loSt+KPv0Fvanwi0e9gDiomAtaf7hdYhpDiD2Jg0vj4j9RjSEM53Mpk6VUA/FM0gt89EI
	 q2AoE1ssJSgZgT5wJ7mAzWt1Cdn71p2L158Aidlhs9dPFtGEdCWgjkzsTVwSVcYv2VIaU
	 cxDBAql75ykB6bcFml4NW+TWM/XIR77grdxmwyN0QHJTYeN5nzVsTUbeA2gV8bySiWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EKm3EM+6;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74648606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74648606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EKm3EM+6
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35b2c599f43so3172041eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792642839; x=1793247639; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IYGqe8uHdvMKTGNalGzso/Hav7cwh06URO2tg9hCsgA=;
        b=EKm3EM+6auetdY/kjeEEjNANFJh0VAqa37m9SgxUmEVA/Z/nM0sskQ32739FoiM13L
         ubOlxIckCxXZN6YAGUobJ7BkDZJ0MkN7Y+odVP5HlSWT5YxIComCKEbW8QrA/NlO1E5u
         PZPIQs/3mcKkDgOYcUw/fEjcegXoLAV/j5lScc0Ggv/seHYB9cdvifl7E8tb8b3ojcva
         PISqgBZxAsU3ySrboUuKyADL4lqplo708r26YhSxHUsssxvpJWpJnLV5u3Pk2C0UqKZi
         vpIxKOYwlbkAkVMlGi6bZltbYeOoFxosElQhbLvB6hZ778ROFc+131N3lzjDYwGo53dE
         qHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792642839; x=1793247639;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYGqe8uHdvMKTGNalGzso/Hav7cwh06URO2tg9hCsgA=;
        b=ra7xSPqdxxSpk1gOZMtp7ijooUiTkI6UwrJWV42qc7fSbEmuyqPTwss3GL4FcEK8Xm
         2jP/pgv8QCcnys4eX2GtznS6k27iuuVTJ7EG0+CAGrt6EXaExeNjYIsGahvmjypL02fl
         5cntGeW9mPDqYFrsUu48ISO6f7Dvq+r62MCHDomO/kwYZYa232Y10kdd6fPRIcqVNhOP
         pRMhd+qfJ0O43DkrkE659uT2LCP1Rou8btoB9lyGhcdS3UDzAnaDOBrpmJ/HJ7bRN/uJ
         dx7qQnwV4QLY7Q4XGPUOBzAEHMjg2I/HV95apsM5VZf3MS7LvrfwI/X/rzhZEysNKimS
         5/7g==
X-Forwarded-Encrypted: i=1; AKwUvBwGADOjAnF6aSe6FLSEgZHqDRjjagi5vDkcHlh6ZXL5kEblFU1tijgVbPRwj9P4l6T1lpqM2jKy68MgGkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC3xFLALQFRMoJonkzQxKU+TvboAfru2NyCLvRXrUt8WOGvj39
	TxKvcNEBEGf97TLO9clk2XrnCTxvZ6SrhSZgYdw3oBlDf2SjZSj2Ibb1
X-Gm-Gg: AYBFou23ZpKvuQEQCVrBo5gd+t8/G3BRiEbLgQO0AqTYxbyGmf7BFUe8OHEZtH9Hrh1
	ORdiv+/CsZVR7se9eWfe1gghDQdqtVAU4SMLDMaQOLqBIxOGbKsq49gOQ++M2bJZ7vFd43OsJPE
	Okqo8Psg6lxBIZebMcaHbbjF6Dfm2FqPCIDMg+JOyfgY6yGCjIuSIlx6W4jxbxhbHOy5NtN+ar/
	xk0eQrEQS8/d3xACi8d+HA33dgIPUFsdbST5THEIqjH+f7Pc6HcT5t59kTDAXb91IE2wIoJ9JTZ
	2ozLevrUzmvMiG4mRz+X/NcQmOBNKTgazj7+R0yaY9fsg2D8CA6Seb/xVtVZrAeSQEJcgbN6Tvc
	Osm+9Urkg5CJSvc61/rGP6hnnKQ8toIrSWU0LqP54DoKMjA+U6NsSDaj4xhOCov1pgTEZEXXM+B
	JIRODrFXqqbFHuoE6wE8X14sBlSki+nxS3ECRJCD9aWUYXy2IRSCXuzZWrLQabsDv5Gst52D98w
	DpQfACV7sF+rUgnOUR0jCO+2mYAWAmUfPkMmDMuDRh/+FiMuBKweA==
X-Received: by 2002:a05:7022:628a:b0:144:c12b:dfc6 with SMTP id a92af1059eb24-190a80ee9a2mr7469795c88.44.1792642838435;
        Wed, 21 Oct 2026 21:20:38 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm11690981c88.17.2026.10.21.21.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:20:37 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Muchun Song <songmuchun@bytedance.com>, Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joao Martins <joao.m.martins@oracle.com>, Muchun Song <muchun.song@linux.dev>, stable@vger.kernel.org, nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH] dax/pmem: fix unaligned compound devmap initialization
In-Reply-To: <20261016054914.2601510-1-songmuchun@bytedance.com>
Date: Thu, 22 Oct 2026 09:07:21 +0530
Message-ID: <jyna5rta.ritesh.list@gmail.com>
References: <20261016054914.2601510-1-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


+ linuxppc-dev (for awareness, since I also faced the same issue on
Power too, although this one is not related to PPC alone)

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
> Fix this by advancing the pgmap start to the aligned Device DAX data
> range for non-altmap compound mappings. Leave base-page namespaces
> unchanged, and leave the altmap path unchanged because
> memmap_init_zone_device() already skips the altmap reservation itself.
>
> Fixes: 14606001efb4 ("device-dax: compound devmap support")
> Cc: <stable@vger.kernel.org>
> Reported-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thanks Muchun for fixing this. With this patch I am no more seeing the
following crash (tested on both Power and x86 kvm)

Feel free to add for this patch. 
Tested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


[    4.675578] page dumped because: VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn))
[    4.675613] ------------[ cut here ]------------
[    4.675615] kernel BUG at mm/page_alloc.c:373!
[    4.675626] Oops: invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC PTI
[    4.678213] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.3.0-rc5-xfstests-01065-g45f4c1453cbe #33 PREEMPT(full)
[    4.678213] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
[    4.678213] RIP: 0010:__set_pfnblock_flags_mask.constprop.0+0xef/0x110
<...>
[    4.678213] Call Trace:
[    4.678213]  <TASK>
[    4.678213]  pageblock_migratetype_init_range.constprop.0+0x50/0x90
[    4.678213]  memmap_init_zone_device+0x2fb/0x380
[    4.678213]  pagemap_range+0x272/0x590
[    4.678213]  memremap_pages+0x125/0x210
[    4.678213]  ? lockdep_hardirqs_on+0x7d/0x100
[    4.678213]  devm_memremap_pages+0x21/0x70
[    4.678213]  dev_dax_probe+0x1db/0x300
[    4.678213]  dax_bus_probe+0x6f/0xa0
[    4.678213]  call_driver_probe+0x24/0xf0
[    4.678213]  really_probe+0xb6/0x310
[    4.678213]  ? __pfx___device_attach_driver+0x10/0x10
[    4.678213]  __driver_probe_device+0x87/0x190
[    4.678213]  ? __pfx___device_attach_driver+0x10/0x10
[    4.678213]  driver_probe_device+0x1f/0x90
[    4.678213]  __device_attach_driver+0x89/0x130
[    4.678213]  bus_for_each_drv+0x86/0xe0
[    4.678213]  __device_attach+0xb6/0x1d0
[    4.678213]  device_initial_probe+0x40/0x60
[    4.678213]  bus_probe_device+0x3d/0xa0
[    4.678213]  device_add+0x4f0/0x6c0
[    4.678213]  __devm_create_dev_dax+0x18b/0x3f0
[    4.678213]  devm_create_dev_dax+0x21/0x40
[    4.678213]  __dax_pmem_probe+0x1c3/0x200
[    4.678213]  dax_pmem_probe+0xe/0x20
[    4.678213]  nvdimm_bus_probe+0x89/0x250
[    4.678213]  call_driver_probe+0x24/0xf0
[    4.678213]  really_probe+0xb6/0x310
[    4.678213]  ? __pfx___driver_attach+0x10/0x10
[    4.678213]  __driver_probe_device+0x87/0x190
[    4.678213]  ? __pfx___driver_attach+0x10/0x10
[    4.678213]  driver_probe_device+0x1f/0x90
[    4.678213]  __driver_attach+0xd7/0x200
[    4.678213]  bus_for_each_dev+0x79/0xc0
[    4.678213]  bus_add_driver+0x127/0x250
[    4.678213]  driver_register+0x59/0x100
[    4.678213]  ? __pfx_dax_pmem_init+0x10/0x10
[    4.678213]  do_one_initcall+0x59/0x3a0
[    4.678213]  do_initcalls+0xdd/0x1b0
[    4.678213]  kernel_init_freeable+0x16f/0x2b0
[    4.678213]  ? __pfx_kernel_init+0x10/0x10
[    4.678213]  kernel_init+0x1f/0x1d0
[    4.678213]  ret_from_fork+0x244/0x280
[    4.678213]  ? __pfx_kernel_init+0x10/0x10
[    4.678213]  ret_from_fork_asm+0x1a/0x30
[    4.678213]  </TASK>


> Closes: https://lore.kernel.org/r/wlrkqqvg.ritesh.list@gmail.com
> Assisted-by: LLM
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  drivers/dax/pmem.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/dax/pmem.c b/drivers/dax/pmem.c
> index bee93066a849..d3a9b85107b0 100644
> --- a/drivers/dax/pmem.c
> +++ b/drivers/dax/pmem.c
> @@ -51,6 +51,13 @@ static struct dev_dax *__dax_pmem_probe(struct device *dev)
>  	/* adjust the dax_region range to the start of data */
>  	range = pgmap.range;
>  	range.start += offset;
> +	/*
> +	 * When the memmap is stored in RAM, exclude metadata and alignment
> +	 * padding from compound page initialization.  Otherwise, the pgmap
> +	 * may start before the naturally aligned Device DAX data range.
> +	 */
> +	if (!pgmap_altmap(&pgmap) && le32_to_cpu(pfn_sb->align) > PAGE_SIZE)

BTW, this check "le32_to_cpu(pfn_sb->align) > PAGE_SIZE" - Is that needed here?

I am trying to understand this better - so that I can add more such
testcases internally. For the test I mentioned earlier [1] - even w/o
that align check, the test passes.

[1]: https://lore.kernel.org/r/wlrkqqvg.ritesh.list@gmail.com

-ritesh

> +		pgmap.range.start = range.start;
>  	dax_region = alloc_dax_region(dev, region_id, &range,
>  			nd_region->target_node, le32_to_cpu(pfn_sb->align),
>  			IORESOURCE_DAX_STATIC);
>
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
> -- 
> 2.54.0
