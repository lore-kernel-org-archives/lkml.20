Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA26B3C872A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698160; cv=none; b=VRmnpFxO0U28x6iQJH15fy79CAXvlkfnY96isRA51k0T4/TP1jqnFs7ldOkDNXtnIQD3LnY5l2QozZhquQoXuBinzbSFJIxOkl6bzishYhzoVKy39gzqbT3vkel8WWKlh5kxY1l2o7SIJ275kqZrJsPfcHvGeV9jAuJosEJNfqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698160; c=relaxed/simple;
	bh=sCuj3zJ+yoCbFCtwDou0mY270Ide3dfSpevYVYDByF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stizdhyYmpo58oQmE1KXsJj2FEVcmjb0Aj/0U4sg1YRIauSOWQk20xOucwW3vm8aYftRI9ZcidOXsLcbGKrZLP4pSGRwsftCna2bwP/UOXc+qlThmVwnVC5GaXyaC52i259Tuv0rmkna9SUSFAcY0e4PFvYf/25rR5/blF8NNsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDU2RJbU; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDU2RJbU"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a3so235178b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789698148; x=1790302948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cvk169Syep4khxZ06F0hThbd1fhib5jsWyzda7Xu2/8=;
        b=HDU2RJbUtQQ5YKG6oMG8BHrT0oMx3UkPpCp0pBYGO4QtAKqWdh+fkxZZ/aSwl4pgvS
         UM5ZNA0YPmWTvm4BEgmj8QOyBRlFcOVqH5s5aEwx3j6u5fUYhA8KmE5m2T01kSNnkFuV
         OKInKp8bLMk+1ttnHzE24rv18ktA4cUhX6LtXRa8U942Zy8OwM+vP0a12oNpjZW180Ib
         WacNK26iIUiC+OFKKv513LLjKINeARW83A0Z+C2KBp3cM9hHzc2siUOe92pjPmqqXKlk
         XDfYO++6kW1nyjF2KT8nVZCV/vKLzq0R5YT/77i2Lu9ONh49I2d6vR/MyTSvqZX4mJmy
         hLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698148; x=1790302948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cvk169Syep4khxZ06F0hThbd1fhib5jsWyzda7Xu2/8=;
        b=eIpRHqwlwz7mn5nC7a9fwJHDq7PXoVUOhhStcxA3ug3hp2l6LXhKedNdrGPnSEzLl8
         vO9qNfqyh1FXWHrIl/b6Sbhf8XG2cDBoCUgSKRjO8QLqquiF57ALSL5KmRSlXlphJGZS
         6CcZqFyERJyHiVZ2Qfmn8pcAyryfegbQpzZ2OP0wXlNI9eee4GkGfHhUBmjxZ204dDPz
         XGOGfQiQkKTTFI5w3FQqPMU9YWLqUiVorbApU9EGuA56MMTXg+9R4cyNDG3IkPMtLQB2
         qDf10M4jj8xjateb2/ZX6S1AS9AYDR8ZZDM+UgFtpJHbsmLdSgJtvcN/r5CM4jcRlsrb
         YBtA==
X-Forwarded-Encrypted: i=1; AKwUvBxs7vMs0PSBNqJhCUzOnSQ9/m7/rGvkDjzneV1SXT1PSrBDc9BEe+9HhAVC7JQradkVqZD7yijlc+7+U0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mNC7HuISQQLbde3i7qVNKY6iV7K+OglOYs5arih6INsuZ2BtRC
	oiFBXiKU7duaaeOTF/hw4z4fRUvEj4scRfWA/nvbUPQyzzrQzHJF+M7y
X-Gm-Gg: AYBFou1N2MMF6iTY7TD+GPYllbHkpL0Oil2t53b4OxB5X8TkzwJ1BB9jFbcpJjkyoFt
	LMStxQwR8pUytDxwtlfB7ZtTk/PxmeihBUDy81a04NJzBAvB50Ueez+DSqN/h6nF+WIedajTt43
	ZT95BjeNeKSNnoKSBWcwVd3leVPkdWVeeST267jNPnmv+ro7nUvQjxuRt0XPb94m0yDz2XB1/YQ
	byvpDpfUMLho22fzuznS52XeFNgTH3DY7hR6SZv5iUCbLhJgRdqJfmqgK2Vski8MNY0XoH30XwZ
	IKlR4nLElkyp4N9ioAbamRP7n/hagz+eSOOJcqmtnK6AMGqrMWhy+QZ+Bm9Drc1lHdvRmszc572
	gnleLkmVRgNKRd2XObQZcuo/0lSfpcxqRXBtoNhLFHR1zikTQztzIIqqc2dgUPOimBA9q03WZB4
	s1/1GXS33BLrYdpHRvlZ6M2RUQ1sKHmDKOg9xvnMU8mcxUzJPY2X87/tqVglgXojoJKd6hoZF+w
	YhjP5esi55k7c3Ft/nxdYjn/pxVMzDN3XbTeJOB59Alhp5/K7W16IyiEvJAGDCqRxprPQ==
X-Received: by 2002:a05:6a00:4291:b0:874:706d:8576 with SMTP id d2e1a72fcca58-874de4ff4b3mr1799036b3a.30.1789698148120;
        Thu, 17 Sep 2026 19:22:28 -0700 (PDT)
Received: from localhost.localdomain ([240e:46d:2100:4fc2:8444:7c4b:1e6e:4e9a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dceddd1csm63692b3a.28.2026.09.17.19.22.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 19:22:27 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: hannes@cmpxchg.org
Cc: Liam.Howlett@oracle.com,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	riel@surriel.com,
	vbabka@suse.cz,
	ziy@nvidia.com
Subject: Re: [RFC 2/2] mm: page_alloc: per-cpu pageblock buddy allocator
Date: Fri, 18 Sep 2026 10:22:22 +0800
Message-ID: <20260918022222.22955-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260403194526.477775-3-hannes@cmpxchg.org>
References: <20260403194526.477775-3-hannes@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri,  3 Apr 2026 at 15:40 PM Johannes Weiner <hannes@cmpxchg.org> wrote:

[...]

> @@ -2941,15 +3242,45 @@ static void __free_frozen_pages(struct page *page, unsigned int order,
[...]
> +	pcp = per_cpu_ptr(zone->per_cpu_pageset, cache_cpu);
> +	if (unlikely(fpi_flags & FPI_TRYLOCK) || !in_task()) {
> +		if (!spin_trylock_irqsave(&pcp->lock, UP_flags)) {
> +			free_one_page(zone, page, pfn, order, fpi_flags);
>  			return;
> -		pcp_spin_unlock(pcp, UP_flags);
> +		}
>  	} else {
> +		spin_lock_irqsave(&pcp->lock, UP_flags);
> +	}

[...]

> @@ -3025,17 +3369,35 @@ void free_unref_folios(struct folio_batch *folios)
[...]
> +			if (!in_task()) {
> +				if (unlikely(!spin_trylock_irqsave(
> +						&pcp->lock, UP_flags))) {
> +					pcp = NULL;
> +					free_one_page(zone, &folio->page, pfn,
> +						      order, FPI_NONE);
> +					continue;
> +				}
> +			} else {
> +				spin_lock_irqsave(&pcp->lock, UP_flags);
> +			}

Hello Johannes,

Thank you for the great work on this series -- I hope it is still being
actively worked on.

We are suffering from heavy zone->lock contention on our production
servers as well, so I backported this series to our internal 6.18.y
kernel. However, since deploying it to a few dozen production servers
running workloads with heavy memory and I/O pressure, we have been
hitting hard lockups at a rate of roughly one every day or two. The
hard lockups look as follows:

[149519.005207] watchdog: CPU22: Watchdog detected hard LOCKUP on cpu 22
[149519.005211] Modules linked in: af_packet_diag netlink_diag squashfs loop zram xt_owner xt_DSCP cls_bpf sch_ingress xt_CT nft_compat bpf_preload mptcp_diag raw_diag unix_diag binfmt_misc udp_diag tcp_diag inet_diag nf_tables xt_conntrack nf_nat nf_conntrack_netlink nfnetlink nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 af_packet bonding overlay ipmi_ssif amd_atl intel_rapl_msr intel_rapl_common amd64_edac kvm_amd dax_hmem cxl_acpi cxl_port mlx5_ib cxl_pmem kvm acpi_ipmi ib_uverbs irqbypass vfat ipmi_si cxl_core i2c_piix4 ipmi_devintf fat rapl einj acpi_cpufreq ib_core pcspkr i2c_smbus xfs ipmi_msghandler k10temp i2c_designware_platform i2c_designware_core input_leds sch_fq_codel drm fuse backlight ext4 crc16 mbcache jbd2 polyval_clmulni ghash_clmulni_intel mlx5_core mlxfw tls nvme psample ptp nvme_core ccp pps_core sd_mod sg ahci libahci libata aesni_intel
[149519.005260] CPU: 22 UID: 10305 PID: 3050692 Comm: java Kdump: loaded Not tainted 6.18.44-3 #3.infra PREEMPT(voluntary) 
[149519.005263] Hardware name: ZTE R5350 G5/MB53A05A, BIOS 24.25.02.02 04/30/2025
[149519.005264] RIP: 0010:queued_spin_lock_slowpath+0x299/0x2d0
[149519.005270] Code: 83 e0 03 83 e9 01 48 c1 e0 04 48 63 c9 48 05 80 48 61 9f 48 03 04 cd c0 5c 6b 9e 48 89 10 8b 42 08 85 c0 75 09 f3 90 8b 42 08 <85> c0 74 f7 48 8b 0a 48 85 c9 0f 84 6a ff ff ff 0f 0d 09 e9 62 ff
[149519.005271] RSP: 0018:ff7d3f62682ef678 EFLAGS: 00000046
[149519.005272] RAX: 0000000000000000 RBX: ff483cf409daf880 RCX: 00000000000000bc
[149519.005273] RDX: ff483cf409daf880 RSI: 0000000002f40100 RDI: ff483cf40ad75540
[149519.005273] RBP: ff7d3f62682ef698 R08: 0000000000000055 R09: 0000000000000000
[149519.005274] R10: ffb3caab519aee00 R11: 0000000000000001 R12: ff483cf40ad75540
[149519.005274] R13: 00000000005c0000 R14: 00000000005c0000 R15: 000000000000000e
[149519.005275] FS:  0000000000000000(0000) GS:ff483cf46a79b000(0000) knlGS:0000000000000000
[149519.005276] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[149519.005276] CR2: 00007fd14532b000 CR3: 000000061d798798 CR4: 0000000000771ef0
[149519.005277] PKRU: 55555554
[149519.005277] Call Trace:
[149519.005278]  <TASK>
[149519.005282]  _raw_spin_lock_irqsave+0x51/0x60
[149519.005284]  free_unref_folios+0x60c/0xaa0
[149519.005289]  folios_put_refs+0x182/0x210
[149519.005292]  free_pages_and_swap_cache+0xc7/0x170
[149519.005294]  ? __entry_text_start+0xf/0x30
[149519.005297]  __tlb_batch_free_encoded_pages+0x47/0xb0
[149519.005300]  tlb_flush_mmu+0x4f/0x140
[149519.005301]  zap_pte_range+0x300/0x490
[149519.005303]  zap_pmd_range.isra.0+0xc4/0x220
[149519.005305]  unmap_page_range+0x270/0x3d0
[149519.005306]  unmap_single_vma.constprop.0+0x7d/0xc0
[149519.005309]  unmap_vmas+0x92/0x160
[149519.005311]  exit_mmap+0xf2/0x400
[149519.005313]  ? mutex_lock+0x13/0x50
[149519.005315]  __mmput+0x52/0x120
[149519.005318]  mmput+0x30/0x40
[149519.005320]  exit_mm+0xe7/0x150
[149519.005321]  do_exit+0x1c7/0x490
[149519.005322]  do_group_exit+0x34/0x90
[149519.005324]  get_signal+0x919/0x960
[149519.005326]  arch_do_signal_or_restart+0x29/0x100
[149519.005327]  ? __x64_sys_futex+0x77/0x1e0
[149519.005330]  exit_to_user_mode_loop+0xa0/0x120
[149519.005333]  do_syscall_64+0x1ea/0xe10
[149519.005335]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[149519.005336] RIP: 0033:0x7f9ed929c39a
[149519.005342] Code: Unable to access opcode bytes at 0x7f9ed929c370.
[149519.005343] RSP: 002b:00007f9e8d2fe300 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
[149519.005343] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX: 00007f9ed929c39a
[149519.005344] RDX: 0000000000000000 RSI: 0000000000000189 RDI: 00007f9ed6074b3c
[149519.005344] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000ffffffff
[149519.005345] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
[149519.005345] R13: 00007f9ed6074b3c R14: 0000000000000001 R15: 0000000000000000
[149519.005347]  </TASK>
[149519.005348] Kernel panic - not syncing: Hard LOCKUP
[149519.005349] CPU: 22 UID: 10305 PID: 3050692 Comm: java Kdump: loaded Not tainted 6.18.44-3 #3.infra PREEMPT(voluntary) 
[149519.005350] Hardware name: ZTE R5350 G5/MB53A05A, BIOS 24.25.02.02 04/30/2025
[149519.005350] Call Trace:
[149519.005351]  <NMI>
[149519.005351]  dump_stack_lvl+0x26/0xb0
[149519.005353]  dump_stack+0x10/0x20
[149519.005354]  vpanic+0x34d/0x3a0
[149519.005355]  panic+0x57/0x60
[149519.005357]  nmi_panic+0x2b/0x60
[149519.005358]  watchdog_hardlockup_check+0x1b4/0x200
[149519.005360]  watchdog_overflow_callback+0x7c/0x90
[149519.005362]  __perf_event_overflow+0x11c/0x3b0
[149519.005365]  perf_event_overflow+0x19/0x20
[149519.005366]  amd_pmu_v2_handle_irq+0x1f5/0x3e0
[149519.005369]  ? flush_tlb_one_kernel+0xe/0x30
[149519.005371]  ? set_pte_vaddr_p4d+0x4f/0x60
[149519.005373]  ? set_pte_vaddr+0x7b/0xb0
[149519.005373]  ? native_set_fixmap+0x59/0x90
[149519.005375]  ? ghes_copy_tofrom_phys+0x75/0x120
[149519.005378]  ? __ghes_peek_estatus.isra.0+0x4e/0xc0
[149519.005380]  ? ghes_in_nmi_queue_one_entry.constprop.0+0x3c/0x2a0
[149519.005382]  perf_event_nmi_handler+0x2d/0x50
[149519.005384]  nmi_handle.part.0+0x5a/0x160
[149519.005386]  default_do_nmi+0x11c/0x160
[149519.005387]  exc_nmi+0x10b/0x1a0
[149519.005388]  end_repeat_nmi+0xf/0x53
[149519.005389] RIP: 0010:queued_spin_lock_slowpath+0x299/0x2d0
[149519.005391] Code: 83 e0 03 83 e9 01 48 c1 e0 04 48 63 c9 48 05 80 48 61 9f 48 03 04 cd c0 5c 6b 9e 48 89 10 8b 42 08 85 c0 75 09 f3 90 8b 42 08 <85> c0 74 f7 48 8b 0a 48 85 c9 0f 84 6a ff ff ff 0f 0d 09 e9 62 ff
[149519.005391] RSP: 0018:ff7d3f62682ef678 EFLAGS: 00000046
[149519.005392] RAX: 0000000000000000 RBX: ff483cf409daf880 RCX: 00000000000000bc
[149519.005392] RDX: ff483cf409daf880 RSI: 0000000002f40100 RDI: ff483cf40ad75540
[149519.005393] RBP: ff7d3f62682ef698 R08: 0000000000000055 R09: 0000000000000000
[149519.005393] R10: ffb3caab519aee00 R11: 0000000000000001 R12: ff483cf40ad75540
[149519.005394] R13: 00000000005c0000 R14: 00000000005c0000 R15: 000000000000000e
[149519.005395]  ? queued_spin_lock_slowpath+0x299/0x2d0
[149519.005396]  ? queued_spin_lock_slowpath+0x299/0x2d0
[149519.005398]  </NMI>
[149519.005398]  <TASK>
[149519.005398]  _raw_spin_lock_irqsave+0x51/0x60
[149519.005400]  free_unref_folios+0x60c/0xaa0
[149519.005402]  folios_put_refs+0x182/0x210
[149519.005404]  free_pages_and_swap_cache+0xc7/0x170
[149519.005405]  ? __entry_text_start+0xf/0x30
[149519.005407]  __tlb_batch_free_encoded_pages+0x47/0xb0
[149519.005409]  tlb_flush_mmu+0x4f/0x140
[149519.005410]  zap_pte_range+0x300/0x490
[149519.005412]  zap_pmd_range.isra.0+0xc4/0x220
[149519.005413]  unmap_page_range+0x270/0x3d0
[149519.005414]  unmap_single_vma.constprop.0+0x7d/0xc0
[149519.005415]  unmap_vmas+0x92/0x160
[149519.005417]  exit_mmap+0xf2/0x400
[149519.005419]  ? mutex_lock+0x13/0x50
[149519.005421]  __mmput+0x52/0x120
[149519.005422]  mmput+0x30/0x40
[149519.005424]  exit_mm+0xe7/0x150
[149519.005425]  do_exit+0x1c7/0x490
[149519.005426]  do_group_exit+0x34/0x90
[149519.005427]  get_signal+0x919/0x960
[149519.005428]  arch_do_signal_or_restart+0x29/0x100
[149519.005429]  ? __x64_sys_futex+0x77/0x1e0
[149519.005430]  exit_to_user_mode_loop+0xa0/0x120
[149519.005432]  do_syscall_64+0x1ea/0xe10
[149519.005433]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[149519.005434] RIP: 0033:0x7f9ed929c39a
[149519.005435] Code: Unable to access opcode bytes at 0x7f9ed929c370.
[149519.005435] RSP: 002b:00007f9e8d2fe300 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
[149519.005436] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX: 00007f9ed929c39a
[149519.005436] RDX: 0000000000000000 RSI: 0000000000000189 RDI: 00007f9ed6074b3c
[149519.005436] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000ffffffff
[149519.005437] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
[149519.005437] R13: 00007f9ed6074b3c R14: 0000000000000001 R15: 0000000000000000
[149519.005438]  </TASK>

This hard lockup can be fixed by the following changes on top of your
series:

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 9b52478c911a..74d80dcff6c4 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3266,13 +3266,9 @@ static void __free_frozen_pages(struct page *page, unsigned int order,
                cache_cpu = raw_smp_processor_id();

        pcp = per_cpu_ptr(zone->per_cpu_pageset, cache_cpu);
-       if (unlikely(fpi_flags & FPI_TRYLOCK) || !in_task()) {
-               if (!spin_trylock_irqsave(&pcp->lock, UP_flags)) {
-                       free_one_page(zone, page, pfn, order, fpi_flags);
-                       return;
-               }
-       } else {
-               spin_lock_irqsave(&pcp->lock, UP_flags);
+       if (!spin_trylock_irqsave(&pcp->lock, UP_flags)) {
+               free_one_page(zone, page, pfn, order, fpi_flags);
+               return;
        }

        if (unlikely(pcp->flags & PCPF_CPU_DEAD)) {
@@ -3378,16 +3374,12 @@ void free_unref_folios(struct folio_batch *folios)
                         * contention on a per-CPU lock beats the
                         * unbatched zone->lock fallback.
                         */
-                       if (!in_task()) {
-                               if (unlikely(!spin_trylock_irqsave(
-                                               &pcp->lock, UP_flags))) {
-                                       pcp = NULL;
-                                       free_one_page(zone, &folio->page, pfn,
-                                                       order, FPI_NONE);
-                                       continue;
-                               }
-                       } else {
-                               spin_lock_irqsave(&pcp->lock, UP_flags);
+                       if (unlikely(!spin_trylock_irqsave(
+                                       &pcp->lock, UP_flags))) {
+                               pcp = NULL;
+                               free_one_page(zone, &folio->page, pfn,
+                                               order, FPI_NONE);
+                               continue;
                        }
                        if (unlikely(pcp->flags & PCPF_CPU_DEAD)) {
                                spin_unlock_irqrestore(&pcp->lock, UP_flags);

With these changes applied, the affected servers have been running
lockup-free for more than two weeks so far.

If you have any updates on this series, we would be happy to
test them on our production servers and report back.


Thanks
