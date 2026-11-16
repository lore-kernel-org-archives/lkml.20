Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825486;
	b=UuLNl0fZkoBHiqN4n0E/gWu9sLrvIpEml8rQYrCVVG34ZvoAn7pNQIVf3PPrSAfJ+YIB
	 wm3VxMCR0UtO+x0qD/h9Q6JwGesFI5Ncr8vmUMprIFw4ylTYBjUpvlIovRxuHn3ZIjHAe
	 TqMBGzT2PrIWdvHEpOGo4ubVfiWvJt3ZHBa2Wt0CtiwBbGWsYsBNxqJrnxD1VNyXzshIq
	 l2/VA6SxjjMqFXVDHgtfShFWgtfvwANz/MKUPa/rl7ZHbimgSm8QMoW7EMvf+P/f13jmZ
	 7BOzb8Yh27gJjzH2vQ/P4/vGj4hQuWpNu55dKhHwJRFDHDpCMGv8aaPg0K5ndFJUQXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825486;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Y3cXUCELq15P2CTKae/QhO/9W7btvBg5d30bXL8PhNo=;
	b=ky2t6t9eK+w82woSfl4nbEeemFcPvNldtGmAscUoHjL17864ru/IZgxJHFwa/Lk5vpXY
	 KpN2CiR3kq1DxHM+3qZzei5TLlKDcTv89Yx3tfcRK0d8LjfaUkiZA7GfUias6I33IeVd6
	 GxGCbfX7aym5TY5+O6tfgyIOzwl8gOvAbXZUqOMmJmkXjqFCUwGlIwiO7VjH8TsgtRuAn
	 QxIF5UF/XgXLwAq/g3WjK54ZUxg+5b9s4EPzgq8ZpM0fJbA9ukvNl/tWn66ryMk6PzAIV
	 ZN20xY3LlwQXSyHkwa4yq/rTjIZZcshwOJtTTasfFwVXgjkyJuNcu2HjrazGdObFADA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N+HlchmX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FC1606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4FC1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N+HlchmX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AFD41476;
	Mon, 16 Nov 2026 02:38:02 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A5483F632;
	Mon, 16 Nov 2026 02:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794825485; bh=9Ge9cT4Atk9nVv3V3kgsxcn8Q1tixZ6sqlMWxn8Yeww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N+HlchmX/WMspbnBZX6i/dj9EA8VkiPFPsT5uAbBys0HKikGnZwXk7aZab6yKb5kM
	 64gp6umbkKw5vb5mXHq/kro9HkF9OekpaSoGDPN/gZKjsmOEDmWtUMyVd8r5hTBZxw
	 0+dmK4RruOgEFsB28HBPRvltQgwmJUCKUIjK5ecM=
Message-ID: <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
Date: Mon, 16 Nov 2026 10:38:00 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and
 show NMI counts
To: Ashok Raj <ashok.raj@oss.qualcomm.com>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Liaochang <liaochang1@huawei.com>,
 Marc Zyngier <maz@kernel.org>, Radu Rendec <radu@rendec.net>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ashok,

On 11/14/26 23:49, Ashok Raj wrote:
> request_nmi() currently models NMIs as per-CPU sources. This does not
> represent a globally routed NMI source with an affinity-capable irqchip,
> which needs to be rerouted when its target CPU is offlined.
> 
> This RFC adds IRQF_NMI_MIGRATABLE as a request_nmi() registration mode
> for such a source. It remains excluded from normal IRQ balancing, but the
> generic startup and CPU-hotplug paths may select an online target. The
> second patch fixes the related /proc/interrupts display: NMI-safe flow
> handling updates the per-CPU counters rather than irq_desc::tot_count.
> 
> Patch 1: Add the migratable-NMI registration mode, validate that it is
> used only through request_nmi() with an affinity-capable non-per-CPU
> irqchip, and add IRQ KUnit coverage for registration and CPU-offline
> migration.
> 
> Patch 2: Emit the per-CPU counters for all NMI descriptors, matching
> kstat_irqs_desc().
> 
> Testing:
>   - ARM64 changed-object builds with WERROR=1
>   - ARM64 !SMP changed-object build
>   - ARM64 IRQ KUnit run under QEMU with two CPUs, including registration
>     validation and CPU-offline migration
>   - local downstream GHES delivery and migration validation for the intended
>     consumer topology (not part of this series)
> 
> Base and dependencies:
> 
> This RFC was developed and tested on v7.4-rc2 plus the FEAT_NMI v2 series
> [1]. It depends on that series' GIC NMI support and is therefore not directly
> applicable to mainline or linux-next as posted. This RFC is for design
> feedback; it will need rebasing onto the upstream form of those prerequisites
> before submission.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20261112132042.129062-1-vladimir.murzin@arm.com/
> 

I'm not an expert in this area, but based on what I've learned so far,
NMI being per-CPU like makes life much easier ;)

IIUC, one of the main problems with a shared NMI (as opposed to a
per-CPU) is handling shared state. Consider:

CPU0                       CPU1                       CPU2

---------------------------------------------------------------------------

<NMI>
handling started
                           set NMI affinity to CPU2
                                                      <NMI>
                                                      handling started
mutate shared state
                                                      mutate shared state
handling finished
                                                      handling finished

IOW, the same NMI handler could execute concurrently on two CPUs,
potentially corrupting shared state. Once again more than happy to
be corrected if I missed something :)

Cheers
Vladimir

> A separate GHES Type-4 series is the intended first consumer and is not
> included here.
> 
> Feedback is particularly welcome on the IRQF_NMI_MIGRATABLE API and its
> placement in the generic IRQ API, as well as the NMI accounting presentation
> in /proc/interrupts.
> 
> Ashok Raj (2):
>   genirq: Add migratable NMI registration mode
>   genirq/proc: Show NMI interrupt counts in /proc/interrupts
> 
>  include/linux/interrupt.h |   2 +
>  kernel/irq/irq_test.c     | 141 +++++++++++++++++++++++++++++++++++++-
>  kernel/irq/manage.c       |  33 +++++++--
>  kernel/irq/proc.c         |   7 +-
>  4 files changed, 172 insertions(+), 11 deletions(-)
> 
> 
> --
> 2.43.0
> 

