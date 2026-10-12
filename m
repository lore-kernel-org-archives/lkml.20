Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A263341660
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812144; cv=none; b=GxREE2J5H/1zjPQxQDOp6+J+kXpZdyq1h+YjQ3C9w4haMyllUBgkWj1tp4obu7dNbrG/YdB39yvOouTrmdc90SdqDknhTpY3DNhUrjhsw8x8LLNQ4Tirrz91ts78F3AX8TkIFM0nuZ6MQLSzJ3tNmE1DJl9+RXl3uwrv00X6Edg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812144; c=relaxed/simple;
	bh=/k1Q0vBabF3qX01TSDBFoCxeTGMN1091B3NQ10pzfBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a/QiPj2lnNXfzdTzu9bLsVT9Xej24fHMk/gNy7Sc3t6tkyj9gluo7EG+1eU8MBohmKLtd79RV0nZ40/N2PRdCqzrJZcihzAzx1rJfb5KpHGxELOzaj3sZDPCf1tajDC51l7rM4K/bdzdxCkJ6ebwte3eVMOkToT1mi4eYorK92k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=m5W7hQmc; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="m5W7hQmc"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bu3pYQd4gCvH+Mnc9YvDRXQkMES72KC4IIDM8dPz4LU=;
	b=m5W7hQmctbKxQTbmPH53P7yrUqeGNwn0Dkw8JCxweuI3jSUOFjDly2p7F03qBQingbxZWNoab
	usAm6GS33EhecYzH3KGRH97SS3JeKx/jUCNOl1mUyNlTEo3mmli/0BYgqfHwYBk4FdomajTVPug
	rpB1J7FJ7BJrM+rRat5YyC4=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j3J7s0KrYznTVd;
	Mon, 12 Oct 2026 21:23:37 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EC074055B;
	Mon, 12 Oct 2026 21:35:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 21:35:29 +0800
Message-ID: <1bb58683-43c3-41b3-aed0-3b6507f7931c@huawei.com>
Date: Mon, 12 Oct 2026 21:35:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/23] arm64: Implement parallel CPU onlining with PSCI
 v0.2+
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ben
 Horgan <ben.horgan@arm.com>, =?UTF-8?Q?=C8=98tefania_Ion?=
	<stefion@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Pankaj Patil
	<pankaj.patil@oss.qualcomm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tarun
 Sahu <tarunsahu@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/9 18:07, Will Deacon 写道:
> Hi everyone,
> 
> This is version two of the patches I previously posted here:
> 
>   https://lore.kernel.org/all/20260907164024.17164-1-will@kernel.org/
> 
> There have been quite a few changes since last time, thanks to all the
> feedback from humans and robots alike. These include:
> 
>   * Added tags (but I didn't carry over Pankaj's T-b, since the series
>     has changed a fair bit).
> 
>   * Fix secondary entry assembly code to handle timeouts correctly.
> 
>   * Fix stashing of MPIDR so that we don't clobber STACK_END_MAGIC.
> 
>   * Fix NULL dereference if PSCI fails to initialise.
> 
>   * Enable RCU as soon as a secondary CPU is alive.
> 
>   * Drop pointless (unreachable) optimisation to
>     arch_cpuhp_sync_state_poll().
> 
>   * Include cpufeature patches from Fuad so that 'cpu_data' is populated
>     with register values taking into account any cmdline overrides. This
>     is necessary for correct handling of 'boot_cpu_data' later on, where
>     the previous version of this series stashed a stale copy of mpamidr.
> 
> As before, the first four patches are small changes to the generic code
> to make it a little more "Arm-shaped" but the rest of the series is
> largely confined to the arm64 architecture and PSCI driver code.
> 
> The series is based on -rc2, as it otherwise conflicts with Fuad's GMID
> fix that was recently merged upstream.

Hi Will,

I tested this series on v7.3 rc6.

On Qemu （ms）:

|     Platform     | baseline|   P=0   |   P=1  | Delta(%)|
| ---------------- | ------- | ------- | ------ | ------- |
| 128 vCPUs KVM    | 77.45   | 81.59   | 487.5  | -529.5% |
| 64-core ATF QEMU | 878.63  | 884.69  | 657.43 | 25.18%  |

The parallel boot time under KVM has become much slower, and it is
unclear whether there is a concurrency bottleneck inside KVM.

And the parallel boot time of ATF-based QEMU is reduced by about 25%.

On Kunpeng 192-core HIP12 server (ms):

| v7.3 rc6  |   P=0    |   P=1    | Delta(%)|
| -------   | -------  | -------  | ------  |
| 14573.17  | 14573.17 | 8581.10  | 41.21%  |

But, similar to the test results of the previous version, the secondary
cores boot in parallel, reducing the boot time by 41%.

Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> Cheers,
> 
> Will
> 
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Ștefania Ion <stefion@google.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Tarun Sahu <tarunsahu@google.com>
> Cc: Fuad Tabba <fuad.tabba@linux.dev>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Marc Zyngier <maz@kernel.org>
> 
> --->8
> 
> Fuad Tabba (4):
>   arm64: cpufeature: Check arm64_ftr_regs[] before the first store
>   arm64: cpufeature: Add read_cpuid_with_overrides()
>   arm64: cpufeature: Read MPAMIDR_EL1 in __cpuinfo_store_cpu()
>   arm64: cpufeature: Store every ID register with its overrides applied
> 
> Will Deacon (19):
>   cpu/hotplug: Clean up cmpxchg() logic in cpuhp_can_boot_ap()
>   cpu/hotplug: Avoid trying to bring up CPUs that are already online
>   cpu/hotplug: Avoid busy-polling on archs where cpu_relax() is a no-op
>   cpu/hotplug: Propagate bring-up status to
>     arch_cpuhp_cleanup_kick_cpu()
>   arm64: smp: Tidy up smp_prepare_cpus()
>   arm64: smp: Tidy up cpuinfo init and cpufeature updates
>   arm64: smp: Defer update of secondary CPU capabilities
>   arm64: smp: Don't bother printing the I-cache policy for each CPU
>   arm64: smp: Defer RCU registration during secondary CPU bringup
>   arm64: smp: Use generic HOTPLUG_CORE_SYNC_FULL machinery for CPU
>     onlining
>   arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP machinery for CPU
>     onlining
>   arm64: cpu_ops: Make 'cpu_operations' pointer global instead of
>     per-cpu
>   arm64: cpu_ops: Introduce get_secondary_cpu_ops()
>   firmware/psci: Cache PSCI v0.2+ version number to avoid redundant SMCs
>   firmware/psci: Extend ->cpu_on() callback to take an additional
>     argument
>   arm64: cpu_ops: Expose optional argument to target cpu in ->cpu_boot()
>   arm64: smp: Pass secondary CPU boot parameters via firmware if
>     possible
>   arm64: smp: Use generic HOTPLUG_PARALLEL machinery for CPU onlining
>   arm64: smp: Harden parallel CPU bringup against broken PSCI firmware
> 
>  arch/arm/kernel/psci_smp.c                |   4 +-
>  arch/arm64/Kconfig                        |   2 +-
>  arch/arm64/include/asm/cpu.h              |   7 +-
>  arch/arm64/include/asm/cpu_ops.h          |   7 +-
>  arch/arm64/include/asm/cpufeature.h       |  11 +
>  arch/arm64/include/asm/smp.h              |  40 ++-
>  arch/arm64/include/asm/topology.h         |   2 +
>  arch/arm64/kernel/acpi_parking_protocol.c |   3 +-
>  arch/arm64/kernel/asm-offsets.c           |   1 +
>  arch/arm64/kernel/cpu_ops.c               |  34 +-
>  arch/arm64/kernel/cpufeature.c            | 397 +++++++++++-----------
>  arch/arm64/kernel/cpuinfo.c               | 122 +++----
>  arch/arm64/kernel/head.S                  |  60 +++-
>  arch/arm64/kernel/psci.c                  |  14 +-
>  arch/arm64/kernel/smp.c                   | 183 +++++-----
>  arch/arm64/kernel/smp_spin_table.c        |   2 +-
>  arch/arm64/mm/mmu.c                       |   2 +-
>  arch/x86/kernel/smpboot.c                 |   4 +-
>  drivers/firmware/psci/psci.c              |  27 +-
>  include/linux/cpuhotplug.h                |   2 +-
>  include/linux/psci.h                      |   3 +-
>  include/linux/rcutree.h                   |   2 +-
>  kernel/cpu.c                              |  18 +-
>  23 files changed, 508 insertions(+), 439 deletions(-)
> 

-- 
Best regards,
Jinjie

