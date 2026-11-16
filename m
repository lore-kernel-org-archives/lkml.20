Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822981;
	b=W1r24dXrsalPfvqFBIIzUEf2TGMTFh+2OHQeHFxsYRA0muBlIQqHqnqISnCCfh3TphFb
	 AFKbfs/jfKXO5zAb8LyWfn5yDXD8zZD+CGod2AlJeF7xP3nme0e2GdsTaAr1SiG+LBHYA
	 sSr4mTVRS1BiTcvkeAfyW3oBMwEjC85Jky4V5vO/CUfX0gzqHp/S9YpadcLYj8GcfVXh6
	 w5Hd9AYBwq0E32yZLAsWWh2hWyobHpekf0+WBx+hDF9LnFmhZ8mQYqAMOQ4XM9jdhcnw9
	 b2v9vmoJxvceMRoOM7LQ69Z+culGfqiKA0EbG6bDydstBdEIEa9W7R83MCmITRuYBJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822981;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MqdAcH4oKyesXv1izqe5hdNMMmmgQcanyiwt9xpO4U4=;
	b=r5j6Sl1dcNLYqW5AgzEBpNUfNKu25FSf7U2bzAqz68DKCRnHIVIAvRj6CkOJnw3afWye
	 lGltQijaq21cA8w4Ykr0jSI+j3V5fxYNR7ye5RhKUbbRJM8sxByKrTtrc4QxsIMzsegj0
	 5XhJtiP9gLUp9QiAtzeafjOOlS8mKjJx/1EjipIJIkoe8o3IaGMU6itLrpaOnjxXGdzn/
	 RnIIQv2maxYPXmXh5Uu2/AbAtVDCsHeFDno/S86t/bjmUp19G2SGLlSa6L2Gnp/NnAvMO
	 kcxP1I7T9EHbAZtrS0uhn8Tk1ISlsNdi5w6ggzu4eOzaJAROM2wRrPzldR6Jge53s4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VMcgX3sk;
	arc=none smtp.remote-ip=95.215.58.194
Received: from mta1.migadu.com (out-194.mta1.migadu.com [95.215.58.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A45E606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A45E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VMcgX3sk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M0CvuaLLaydPBAiU2oNh1/mEqv5JMT5h/+wAL8OCCDU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794822977; v=1; x=1795427777;
 b=VMcgX3skQUkqeeIM1Iqj2i4p38satOtJKQi93/nSX3giKJodAyohnRhn9GM5pP2uUfuA4Iz7
 d71JHKej9kIvRNB550AugjDgtdMrTAgsboZ9PF2PeRbfIJHrqWSlUIPAQaKU14+fS/tVj1ti8m2
 W8nhB6vYiygTOwRkyJIHHBHM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4b628c018587c7bc;
	Mon, 16 Nov 2026 09:56:17 +0000
X-Mizu-Trace-ID: 4b628c018587c7bc
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 17:57:29 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Chen Yu <yu.c.chen@intel.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, tglx@kernel.org,
	bp@alien8.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	hpa@zytor.com, fenghuay@nvidia.com, babu.moger@amd.com,
	hongyu.ning@intel.com, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 00/12] Introduce MMIO-based CMT access for Enhanced
 RDT
Message-ID: <avrTiSvpFSqLqCh-@three-body>
References: <cover.1793864720.git.yu.c.chen@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793864720.git.yu.c.chen@intel.com>

On Thu, Nov 05, 2026 at 06:07:59PM +0800, Chen Yu wrote:
> Date: Thu,  5 Nov 2026 18:07:59 +0800
> From: Chen Yu <yu.c.chen@intel.com>
> To: tony.luck@intel.com, reinette.chatre@intel.com
> Cc: tglx@kernel.org, bp@alien8.de, mingo@redhat.com,
>  dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
>  babu.moger@amd.com, hongyu.ning@intel.com, chen.yu@linux.dev,
>  x86@kernel.org, linux-kernel@vger.kernel.org
> Subject: [PATCH v10 00/12] Introduce MMIO-based CMT access for Enhanced RDT
> X-Mailer: git-send-email 2.25.1
> 
> v9: https://lore.kernel.org/lkml/cover.1791933001.git.yu.c.chen@intel.com/
> v8: https://lore.kernel.org/lkml/cover.1789705667.git.yu.c.chen@intel.com/
> v7: https://lore.kernel.org/lkml/cover.1787976868.git.yu.c.chen@intel.com/
> v6: https://lore.kernel.org/lkml/cover.1784968626.git.yu.c.chen@intel.com/
> v5: https://lore.kernel.org/lkml/cover.1782866200.git.yu.c.chen@intel.com/
> v4: https://lore.kernel.org/lkml/cover.1781332698.git.yu.c.chen@intel.com/
> v3: https://lore.kernel.org/lkml/cover.1780710620.git.yu.c.chen@intel.com/
> v2: https://lore.kernel.org/lkml/cover.1780587063.git.yu.c.chen@intel.com/
> v1: https://lore.kernel.org/lkml/cover.1779872016.git.yu.c.chen@intel.com/
> 
> Intel Enhanced Resource Director Technology (ERDT) extends the existing
> RDT framework with two major capabilities:
> 
>   1. MMIO-based access to monitoring and allocation registers, replacing
>      the legacy MSR-based interface.
>   2. Region-aware RDT for fine-grained control over different tiers of
>      memory (e.g., CXL.mem, DDR).
> 
> This is described in the Intel RDT Architecture Specification:
> https://cdrdv2-public.intel.com/789566/356688-intel-rdt-arch-spec.pdf
> 
> This patch set focuses on the first part: enabling MMIO-based access for
> Cache Monitoring Technology (CMT), while CAT/MBM/MBA are still using MSR.
> The platform advertises the MMIO register layout through the ACPI ERDT
> (Enhanced Resource Director Technology) table, which contains sub-tables
> describing per-domain register regions for monitoring and allocation.
> 
> With ERDT, L3 cache occupancy counters are read via MMIO rather than
> MSR, allowing the reads to be performed from any CPU without requiring
> cross-CPU IPIs. This series parses the relevant ACPI sub-tables (RMDD,
> CACD, CMRC), prepares the resctrl monitor infrastructure for MMIO-based
> reads, and adds initial support for reading L3 occupancy via the CMRC
> interface. ERDT is not compatible with Sub-NUMA Cluster (SNC) mode and
> stays disabled when SNC is enabled.
> 
> Thanks Tony, Reinette, Thomas, Dave, Boris, Peter, Hongyu for your time to
> look at this patch set.
> 
> Internal sashiko has not reported any issues on the v10. The change history
> in the section "Changes since v9" in each patch is generated by AI.
>

Response to the sashiko 2 review feedback at
https://sashiko.dev/#/patchset/cover.1793864720.git.yu.c.chen%40intel.com
(false positive IMO)

Review1:
"In resctrl_arch_pre_mount(), all online CPUs are then added to
RDT_RESOURCE_PERF_PKG without checking erdt_try_bind_domain():
arch/x86/kernel/cpu/resctrl/core.c:resctrl_arch_pre_mount() {
	...
	cpus_read_lock();
	mutex_lock(&domain_list_lock);
	r->mon_capable = true;
	rdt_mon_capable = true;
	for_each_online_cpu(cpu)
		domain_add_cpu_mon(cpu, r);
	mutex_unlock(&domain_list_lock);
	cpus_read_unlock();
}
Will this cause an online CPU that failed erdt_try_bind_domain() at boot to
still be added to the RDT_RESOURCE_PERF_PKG monitoring domain on first mount,
while a CPU onlined (or offlined and re-onlined) after mount is excluded from
RDT_RESOURCE_PERF_PKG by resctrl_arch_online_cpu()?
Should resctrl_arch_pre_mount() also check erdt_try_bind_domain(cpu) before
calling domain_add_cpu_mon(cpu, r)?"

Response:
PERF_PKG(AET) does not care about ERDT information, so whether to add the "broken" CPU into
AET's domain does not impact the result - the AET monitor event's any_cpu is true, so
any CPU can read the monitor data without having to be read from the CPU in that domain.
We can keep as it is for now.

Review2:
Should cmrc_init() in arch/x86/kernel/cpu/resctrl/erdt.c also reject a zero
cmrc->up_scale (for example, !cmrc->up_scale || cmrc->up_scale > UINT_MAX)?

Response:
The correctness of cmrc->up_scale cannot be guaranteed, because we cannot distinguish between
a 0 value up_scale and any value between 0 and UINT_MAX, they have the same effect, and we have
to trust the BIOS/firmware on this up_scale. We can add the above check but are not sure if it is usable.

thanks,
Chenyu
