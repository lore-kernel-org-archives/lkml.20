Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696892;
	b=cyX96Cacvqe5nL6BqJkEqQQzmIDL2cAe7a490tORrkpQn/g7irXMbsAcWhvDf6kEkcVX
	 tyTRWuOcXGR0lxBXVmhzcp5GL+q+gvg6OyPPfTTtGGR18AM+uIFH5rKBbxUcz2qYCdo2a
	 nkNGlUlZZHfLykLeQsnlYNnLOnVRMZDb1poHeDeWLg2t8+4S1EQEhXdQsjH61lQ3cgyAU
	 uRGJc/96gmKCj3PTEgj9F5btNd8leDhvc9+/f3eeB2Eb/8KYncVwOKoa56tKtRtuxg1mG
	 /dK4h8baD2sOwN/XVzl5hC1IFAdYbSjcErs9fv91/L57h87xNqK5x+TT6N2H9HolRPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696892;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=79YBG1MTJksEt9E+ZEM8hvdUfU6uD2rjqfjHiSJeDqg=;
	b=15wh+s2p3FZ5qLBFKzXPV58W4YFWe12LwIo2eLWWznplJth2oFS7NuWa8qLyZ8VEGk5B
	 G+i51CAlsaSfgFeET8I1HlhkzRMUugp15YCcKrFShf2n1A7WfgJ0B7EtFvWzteW8Wovio
	 PnLnaw+/PHHNAbqKBok4jdbrX/Pk1MJU8uiC/fVOI5TZ5N3ppiOyrLLx2C1rBzKGf7pir
	 8qwhtE9Lsujlq8DFkN+4h8/oPKSTFLnw6pyeiLlhxP6qiNJMYz2TtR8yCYmelwMmz6AGq
	 QwKd8PYD0QeQ/vp3/k0SeUD4mELLYig/IGhccia46h4ukhOHWXnGcQudI0z+2lmHQhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PgonC+xg;
	arc=none smtp.remote-ip=115.124.30.101
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB303606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB303606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PgonC+xg
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793696888; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=79YBG1MTJksEt9E+ZEM8hvdUfU6uD2rjqfjHiSJeDqg=;
	b=PgonC+xgwvz9dGLU2be/n5WdEb6+F6A17VdqHGG3wjuuOCjig83I7AP2KSRWPuwTvJRTKnowzzVFi/3Ibrb82nh70Tgk01Y8bHbPSF8FzyQ695C2BY+7wAoBjYyE6+32JqTXp4W9WVMYWUGhdPQnApaDL/29uTJrPwd62/gDFhU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XE2M7Xq_1793696887;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0XE2M7Xq_1793696887 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 17:08:07 +0800
Date: Tue, 3 Nov 2026 17:08:06 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Usama Anjum <usama.anjum@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, Mark Rutland <mark.rutland@arm.com>, 
	Huang Ying <ying.huang@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <dzxbsk2na4lax2d4wrahwfvshim5gfeacyocas6pzrbtgndzhy@dxizajcog2hb>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <b6f0d10a-d098-43cc-b923-0245af5f51f0@arm.com>
 <auR9iDfUxqz3ExP8@willie-the-truck>
 <auSLH65dv2nEctXd@arm.com>
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
In-Reply-To: <auSLH65dv2nEctXd@arm.com>

On Fri, Oct 30, 2026 at 12:18:39PM +0800, Catalin Marinas wrote:
> On Fri, Oct 30, 2026 at 11:20:40AM +0000, Will Deacon wrote:
> > On Wed, Oct 28, 2026 at 02:47:19PM +0000, Usama Anjum wrote:
> > > On 23/05/2026 2:47 pm, Linu Cherian wrote:
> > > > From: Ryan Roberts <ryan.roberts@arm.com>
> > > >
> > > > There are 3 variants of tlb flush that invalidate user mappings:
> > > > flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
> > > > would previously unconditionally broadcast their tlbis to all cpus in
> > > > the inner shareable domain.
> > > >
> > > > But this is a waste of effort if we can prove that the mm for which we
> > > > are flushing the mappings has only ever been active on the local cpu. In
> > > > that case, it is safe to avoid the broadcast and simply invalidate the
> > > > current cpu.
> > > >
> > > > So let's track in mm_context_t::active_cpu either the mm has never been
> > > > active on any cpu, has been active on more than 1 cpu, or has been
> > > > active on precisely 1 cpu - and in that case, which one. We update this
> > > > when switching context, being careful to ensure that it gets updated
> > > > *before* installing the mm's pgtables. On the reader side, we ensure we
> > > > read *after* the previous write(s) to the pgtable(s) that necessitated
> > > > the tlb flush have completed. This guarrantees that if a cpu that is
> > > > doing a tlb flush sees it's own id in active_cpu, then the old pgtable
> > > > entry cannot have been seen by any other cpu and we can flush only the
> > > > local cpu.
> > > >
> > > > Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> > > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > > Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> > > > [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
> > > > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > > > ---
> > > > Changelog from RFC v1:
> > > > - Adapted for v7.1 flush tlb API changes
> > > >   No changes in core logic
> > > > - Collected Rb and Tb tags
> > > > - lat_mmap benchmark showed dsb(ishst) performs better than dsb(ish),
> > > >   hence retained dsb(ishst) in flush_tlb_user_pre
> > > >
> > > >
> > > > Testing with 7.1-rc4 :
> > > > +-----------------------+---------------------------------------------------+-------------+
> > > > | Benchmark             | Result Class                                      |  Improvement|
> > > > +=======================+===================================================+=============+
> > > > | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> > > > +-----------------------+---------------------------------------------------+-------------+
> > > > | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> > > > | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> > > > +-----------------------+---------------------------------------------------+-------------+
> > >
> > > I tested this patch using a synthetic Firecracker benchmark on a 192-CPU
> > > arm64 host, with Linux v7.3 on both the host and guests. Each worker
> > > repeatedly creates a fresh 1-vCPU microVM, boots Ubuntu, verifies an echo
> > > response over the serial console, and shuts the guest down, waiting for
> > > Firecracker to exit before starting the next VM. Each guest has 256 MiB of
> > > RAM, with two VM slots per workload CPU.
> > >
> > > With 4 KiB guests, the unpatched workload stops scaling between 64 and 96
> > > CPUs: throughput falls from approximately 68 to 65 completed lifecycles/s
> > > despite the additional CPUs.
> > >
> > > Applying the patch to the guest substantially improves throughput at higher
> > > concurrency. At 128 workload CPUs, I measured:
> > >
> > >   Guest pages  Unpatched  Guest patched only  Host patched only
> > >   -----------  ---------  ------------------  -----------------
> > >   4 KiB        73.83/s    108.55/s (+47.0%)    74.09/s (+0.4%)
> > >   64 KiB       86.46/s    105.04/s (+21.5%)    90.15/s (+4.3%)
> > >
> > > The host uses 4 KiB pages throughout. The host-only difference with 4 KiB
> > > guests is small enough that I would regard it as essentially unchanged.
> >
> > Sorry, but I haven't understood the setup here. If each guest ("microVM")
> > only has 1 vCPU, then why does this patch have any effect in the "guest
> > patched only" case?
>
> I wonder whether it's the repeat TLBI workaround just doing more DVM
> traffic. Turned off when no broadcast is needed.
>
> > Additionally, the non-broadcast TLB invalidation will
> > be upgraded to broadcast by the hypervisor.
>
> I have a hack that makes things even faster (opportunistic
> HCR_EL2.FB=0). I may post it once I understand the implications
> properly.

Hi Catalin,

I tested HCR_EL.{FB,BSU_IS} = 0 w/ this patch on guest
kernel before, here is my result:

The in VM micro benchmark is mprotect() on one 4K private
page, change READ <-> WRITE in total 1000000 times.

The testing runs on system w/ 2 physical NUMAs, each NUMA
has 62 physical cpus.

The VM has 2 virtual NUMAs, 1:1 map to the physical NUMA
above, the vcpu 1:1 pin on pcpu, total 120 vcpus in VM
(yes not 124, it's 120), QEMU's other threads are pinned
to 2 free cpus in each NUMA.

The benchmark runs on 120 vcpu at the same time, the
average cost time is used as performance indicator.

W/o this patch on guest kernel:
+------------------------+------------------------+
| HCR_EL.FB and BSU_IS=0 | HCR_EL.FB and BSU_IS=1 |
+------------------------+------------------------+
| average: 26.227070s    | average: 26.182552s    |
+------------------------+------------------------+

W/ this patch on guest kernel:
+------------------------+-----------------------+
| HCR_EL.FB and BSU_IS=0 | HCR_EL.FB and BSU_IS=1|
+------------------------+-----------------------+
|  average 0.478060s     | average 25.836823s    |
+------------------------+-----------------------+

IIUC the improvement should come from the inside guest
non-broadcast TLBi by this patch + hardware doesn't
"upgrade" such non-broadcast TLBi and barrier to broadcast
scope in such across NUMA scenario, the later is controlled
by FB and BSU_IS for guest.

>
> --
> Catalin
