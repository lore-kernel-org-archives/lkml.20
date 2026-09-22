Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C2019D8BC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044095; cv=none; b=AlcsDZt+bMd3ceOTc7A/qrRnUt04IhGoDdvUUZdl+q3lRhhZdpcMSdxJ+ufzMSwnRk0FL/NUrepvdPex6FEWTUXYyLXVRqxJIGkS88JPHr/N7RK8VR4d81PL/5izyUnNR5bfl/nRxDZ/LrFV6r2gV5Dizk7jvN1UX00TCruhnnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044095; c=relaxed/simple;
	bh=ytgQhz7NrAR4Am/dTlyhi0qMbh9GRSAXFiUYDWv18/Y=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=fmu9/x7+qptD4Z94E8l3NYUGqzQP/D6v3ehoY7KVnSNUvJeMbZGxD1vFCaeC9FN7J7OQBNVwCwPzkMtVaeyA0gBSYi8he/mfSBPlpFYlbUvbeVV7N/VyLF3syld4MbEUCiKv7PJU6ispVbXVPygf+3YcjLAJZQ/RdAjWGWIwgFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=id2tYbxI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="id2tYbxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790044087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dC1HGCVeeXJiJ+z6p6zQL7OjunNDThCeLu334KPWnrg=;
	b=id2tYbxIxr88ODqZ9zhi0QlX2rwAkYha+Cd2n7VBMKRk43QxTjceNxNJQiCEPZJAp/0y7J
	In66y3BPxSHqZsZ859o8Zz6I2IcupmRrtXr5e6tsYzDckUGcseSmMAaCGRikU+q+WW+q+z
	iUMnHFQCNEqMs9wNwI5ZBJ9YuLkpkWw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-KXH8DRjYOuOawHXPJ7D-3Q-1; Mon, 21 Sep 2026 22:28:06 -0400
X-MC-Unique: KXH8DRjYOuOawHXPJ7D-3Q-1
X-Mimecast-MFC-AGG-ID: KXH8DRjYOuOawHXPJ7D-3Q_1790044086
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f925ba4eso541543385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044086; x=1790648886;
        h=content-transfer-encoding:content-type:subject:cc:to:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dC1HGCVeeXJiJ+z6p6zQL7OjunNDThCeLu334KPWnrg=;
        b=s6BPyejwzhepLs/DnwBXTjra8P7ydivze7Jj+FOYzrLKWsOkeYb9bUyNVnMAYDGegq
         EwmSNfxQ3oEoWFkyt1nTylUQBG/jB7k5a14mOWgRPGioPGfmtB0OpC2YO374hM1e1acW
         PkXSCzOYa2GhF4HDQvwIka67iOKkbrHI7L63rEmtdrCFb49wkcoEjhHXsDT186hGga4H
         fz+rrCOYRBdpE4zSwljUkleEGLux3pm9ULJPj0p3bv8b3Fz8IP8rE9TqA+eTc2FMlYNS
         8qI7nI1Xr9lKq7cS3ImFq7doJKwKYUmlYaTFfptlTE0JXj56grGcldn/x5HPlWL8+SZf
         6LcA==
X-Gm-Message-State: AFuF++l1H21E+6LIzOPu8ZYpTYWeTPWvyKZEDsn8qsBF691k/HOSjOaz
	rBsiLXHuC/jjNYSFPrIMY25lka/y6gZzj4pNkpjKrtr4co+8CSjpIxbr/QMELunNULFAIx3oEqu
	PoQqwLUxqRNlLo4je2fKrq0PDd4ruydCF/AUe0YlNdtJOa+vna16jbk7mdgLbWgHddPG0urjlpd
	gt+6QDnfXjIuT9JqqGnJ95Ri5WAHk232vERLXZ9IhImg3Md5QMdi4=
X-Gm-Gg: AYBFou1RBgTwYzeuGMcAA/ARxoStGRVTKjrnDlg1RQy10hUc8b8fl1WNx4w56YAiLFr
	bznCIfFgN8ThL3/XuJAAygsIMldKyvVqTRWeVwxmhMo28OVB8zMvRyVwcaquYiZsOTM/Ngcn+k1
	PKwYjJu6NaxKHQ1mSjIGHKd1UUa2CIz1vn8VksfbGbkxZ0PKfzTZ4Zur84D0dMKVEPZEDYnyDF+
	n8b6Wi/TxGeUFH1y2YuxMR9e67RTziobihdSwyK+kClWie9xYURcc/5HvsAD7ENRycvkNZkhAw+
	/7n3qIFt1JBUAPCFia0d7cGbw6gv39HtiL6QaysYznaGsUWzc0eSHUiMUzBWsE9JsWFngx82ktX
	DOPc=
X-Received: by 2002:a05:620a:a414:20b0:93b:d7a1:ba0e with SMTP id af79cd13be357-93c166802c5mr232574085a.57.1790044085605;
        Mon, 21 Sep 2026 19:28:05 -0700 (PDT)
X-Received: by 2002:a05:620a:a414:20b0:93b:d7a1:ba0e with SMTP id af79cd13be357-93c166802c5mr232572085a.57.1790044085050;
        Mon, 21 Sep 2026 19:28:05 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d17afc0sm21716985a.18.2026.09.21.19.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 19:28:04 -0700 (PDT)
Message-ID: <8b77688e-3219-4133-af0f-395e342acb25@redhat.com>
Date: Mon, 21 Sep 2026 22:28:03 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-usb@vger.kernel.org
Cc: akpm@linux-foundation.org, mathias.nyman@intel.com
Subject: [USB] WARNING: mm/page_alloc.c:5345 at
 __alloc_frozen_pages_noprof+0x39a/0x3d0, CPU#41: swapper/0/1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

When booting the latest Andrew Morton's mm-new tree[1] commit 498ee28e5ec4
("mm/swap, PM: hibernate: atomically replace hibernation pin") on a KVM guest,
I'm getting the following MM warning being triggered:

"""
[    1.667197] [      T1] WARNING: mm/page_alloc.c:5345 at __alloc_frozen_pages_noprof+0x39a/0x3d0, CPU#41: swapper/0/1
[    1.691217] [      T1] CPU: 41 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           7.3.0-rc1+ #12 PREEMPT(full)
[    1.692073] [      T1] Tainted: [W]=WARN
[    1.692378] [      T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS edk2-20260812-8.fc44 08/12/2026
[    1.693158] [      T1] RIP: 0010:__alloc_frozen_pages_noprof+0x39a/0x3d0
[    1.693685] [      T1] Code: e2 04 e8 49 85 ff ff 45 31 c9 e9 14 fe ff ff 0f 0b e9 e7 fe ff ff 80 3d 6d 3a f2 05 00 0f 85 2b fe ff ff c6 05 60 3a f2 05 01 <0f> 0b e9 1d fe ff ff 48 89 5c 24 40 48 89 6c 24 48 4c 89 64 24 50
[    1.695238] [      T1] RSP: 0000:ff46f50b801538d8 EFLAGS: 00010246
[    1.695723] [      T1] RAX: 0000000000000000 RBX: 0000000000000cc0 RCX: 0000000000000000
[    1.696356] [      T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000cc0
[    1.696981] [      T1] RBP: 0000000000000034 R08: 0000000000000000 R09: 0000000000000cc0
[    1.697605] [      T1] R10: 0000000000000034 R11: 0000000000000100 R12: 0000000000000034
[    1.698231] [      T1] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    1.698872] [      T1] FS:  0000000000000000(0000) GS:ff2b932745209000(0000) knlGS:0000000000000000
[    1.699592] [      T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.700119] [      T1] CR2: 0000000000000000 CR3: 00000006ede4a001 CR4: 0000000000773ef0
[    1.700745] [      T1] PKRU: 55555554
[    1.701023] [      T1] Call Trace:
[    1.701283] [      T1]  <TASK>
[    1.701512] [      T1]  alloc_pages_node_noprof+0x4c/0xc0
[    1.701919] [      T1]  __dma_direct_alloc_pages.isra.0+0x164/0x1f0
[    1.702402] [      T1]  dma_direct_alloc+0x19f/0x2b0
[    1.702767] [      T1]  dma_alloc_attrs+0x8d/0x200
[    1.703133] [      T1]  xhci_alloc_interrupter+0xc9/0x190
[    1.703543] [      T1]  xhci_mem_init+0x283/0x340
[    1.703902] [      T1]  ? __pfx_xhci_pci_quirks+0x10/0x10
[    1.704317] [      T1]  xhci_gen_setup+0x35e/0x4f0
[    1.704684] [      T1]  xhci_pci_setup+0x52/0x1c0
[    1.705038] [      T1]  usb_add_hcd.cold+0x241/0x5d8
[    1.705413] [      T1]  usb_hcd_pci_probe+0x188/0x480
[    1.705803] [      T1]  xhci_pci_common_probe+0x6b/0x2f0
[    1.706218] [      T1]  local_pci_probe+0x4a/0x90
[    1.706582] [      T1]  ? cpu_hotplug_disable+0x15/0x30
[    1.706986] [      T1]  pci_call_probe+0x55/0x150
[    1.707357] [      T1]  pci_device_probe+0xae/0x150
[    1.707734] [      T1]  ? kernfs_create_link+0x61/0xb0
[    1.708139] [      T1]  ? sysfs_do_create_link_sd+0x81/0xf0
[    1.708562] [      T1]  call_driver_probe+0x23/0x100
[    1.708949] [      T1]  ? driver_sysfs_add+0x55/0xc0
[    1.709334] [      T1]  really_probe+0xd7/0x2d0
[    1.709681] [      T1]  ? _raw_spin_unlock_irq+0xe/0x30
[    1.710098] [      T1]  __driver_probe_device+0x9c/0x1b0
[    1.710503] [      T1]  driver_probe_device+0x1f/0x80
[    1.710892] [      T1]  ? __pfx___driver_attach+0x10/0x10
[    1.711323] [      T1]  __driver_attach+0x10a/0x210
[    1.711706] [      T1]  ? __pfx___driver_attach+0x10/0x10
[    1.712125] [      T1]  bus_for_each_dev+0x86/0xf0
[    1.712488] [      T1]  bus_add_driver+0x13e/0x230
[    1.712858] [      T1]  ? __pfx_xhci_pci_init+0x10/0x10
[    1.713273] [      T1]  ? __pfx_xhci_pci_init+0x10/0x10
[    1.713681] [      T1]  driver_register+0x75/0xe0
[    1.714049] [      T1]  do_one_initcall+0x7a/0x1c0
[    1.714429] [      T1]  do_initcalls+0xe1/0x100
[    1.714780] [      T1]  kernel_init_freeable+0x152/0x1c0
[    1.715199] [      T1]  ? __pfx_kernel_init+0x10/0x10
[    1.715592] [      T1]  kernel_init+0x1f/0x140
[    1.715928] [      T1]  ret_from_fork+0x19e/0x270
[    1.716296] [      T1]  ? __pfx_kernel_init+0x10/0x10
[    1.716680] [      T1]  ? __pfx_kernel_init+0x10/0x10
[    1.717071] [      T1]  ret_from_fork_asm+0x1a/0x30
[    1.717438] [      T1]  </TASK>
[    1.717663] [      T1] ---[ end trace 0000000000000000 ]---
"""

This does not happen with latest Linus tree 40288c9206c1 ("Merge tag
'drm-fixes-2026-09-19' of https://gitlab.freedesktop.org/drm/kernel").

What I could determine is:

- In xhci_alloc_interrupter() max_segs=0, which leds to seg=0

- This eventually leads to passing size=0 to get_order() in
   __dma_direct_alloc_pages() (call sequenece below). Passing size=0 to
   get_order() is undefined and returns order=52 on my guest, whch leads
   to the warning since 52 > MAX_PAGE_ORDER

     xhci_alloc_erst()
       dma_alloc_coherent()
         dma_alloc_attrs()
           dma_direct_alloc()
             __dma_direct_alloc_pages()
             get_order()
             alloc_pages_node()

[1] git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm origin/mm-new

