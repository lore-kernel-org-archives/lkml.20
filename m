Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE7237F8AF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907504; cv=none; b=p1cvlBItI3Em0Ztu+ZmoN8TDpeJiz4L5YXlu5C7k1+Kv+OOLnichxwOvag6+GFjTl1wPVz5kbVls1rJHF447I++voK38fhW+7fIXguNuE03P1gky2zLkzlJxOu98KnycWyQ8+8/rMZ0Eqkjo82DVwgy+tvSPRVJovFTz4C90++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907504; c=relaxed/simple;
	bh=D3PYuoInXcgr8O1aiqaoPYc+LIiTw0vqmtr2SaRo/II=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EIpC6L8yG9V+14t9jB2i5uhbeAi1KjN/jARhDApzXceybmPB4/CPqLmAWgNb8rUpsmZrTytOYyL6yPsntPa1GnrMeRqJtWr8YK88JvL7fVzbqxP426muNnrABSPOOOgHdBi6/LpUGGAiDcoYHPE4ar1/ORMZnY6kWkHT7V7dM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=iwjHwIpe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iwjHwIpe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d6f55a7089so6462815ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787907502; x=1788512302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WDVfXLhAuXc31tRDpwaJFHu44kz3FUXcbnM3HPDaEo=;
        b=iwjHwIpeODy1AES1GdHRWktZt5j58TxlyQyFdxPJYgWNHuGoflS4GdvyqLpaeeL0xY
         kYJWSFNDzt/o8chulno/0DBXUCLAcVWMMg6S5jqHCJojWKaUHV43Pde0jaWdC8hb6Pbe
         MBHp5bcuLFNi5WA/RIXeVTqxgqRVs3pVViPQpf6C/mWFp7eybnFKP2gsSMOTvLpDZblu
         H+qfrZDAbH5KRnhaCsYR/PA81VSZShctswd5D3bM33FmqwQXwLpsWxtdOFUYFqBwtVX/
         2zs+/eJyFMPC0Kw3NcHH5d3t9y8W8ORlVdrfU21zNXlMmcq7JAzlU9EIF/ann/QBQgDF
         nV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907502; x=1788512302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WDVfXLhAuXc31tRDpwaJFHu44kz3FUXcbnM3HPDaEo=;
        b=Qhuh0Ah639gZmjShwVdtMYpd4Iu6p0P8+z532g4bdgXsPxbw7E41EWJUvbDSmJ0nGr
         0thw/DhpHcSttFr6sx/5lRalYsXzNF65ezp4RqCnxDJ2u0gDhMSQkT1GU/DJ41X3/E10
         9LR3aVg5C4W2yDC/O1pygbZM/qy0I79raOwh/pEo6q4JVxQ/g8OddtlPQpYBm+fNye2+
         m6jR9R62dtq4y0C6eWu/I1O5ucR77ZsUxeV29fjQP23tQMdiRWBj/0UZsBxBoAvN2J8X
         PvyEIDt2cgSCatG6F4Kj0BSkkeAGkn3gmNg4wem0jBygRerOJ/nqSyfupLFeLCIf+kwA
         WbcA==
X-Forwarded-Encrypted: i=1; AHgh+Rr54PVZD6szc/ncqfoMEeNYzgRi9vXb7UrQY0uRKhmo+C9PHL6RwC4pOnGVksNYSwQ+qc9+m1a6hIwbq9U=@vger.kernel.org
X-Gm-Message-State: AFuF++lsDFva9xHBk+F6iFEp4dqCIjFFdPN18GMdqzmar2MxXqYUI9he
	sPoVdD5+D8i2OvSjYbkYD4xRge8AwpfbdFHGFIrnkDk9X0IC5dP4eZOO5dHZHiseb4c=
X-Gm-Gg: AR+sD11S6K5aDVYfyAjhccZaL/3AMynxlBm6/N8ATT7fseTXz2af4zkfIidztLvbJZZ
	iSuq2wdhVzIWwoXs7bEbh9HzoZJGl2vTefiFrGn//zdru7S6CwHhqZiZSVaBJaO1Tc9UigJ715C
	Oma0ibTJk4RndINggaDuDTqW5W3CXJQs9GEjwjPA9Ni4OoQ8nYtoGaJVaSO/QsltqAMNBKWU6Pg
	p0/HhDfNa0/SgkKHSmW1BbTag8FcgLPEBdX2CZXZAFx+ZoonoWWAP48RQkr2NPueqLB01HKssx2
	hIAshyocAz2GCvWX3rNFkBpsHM9RHr8I6ATyyBED5o3NANTt6+zMozaTlPlhsH/raym44vHxq12
	3wOtvyFIrfeKp7sGe12S70qwXE+uDx5iOOnLv6AbEZZU7QeFjisvsvg9ILB06nwetEMSL/9M51A
	yhDGa2AqabqwpWNBkEWWm5J+RrHAjrNv7ltNddhUwG1H2XbD219kMhA5fUJ6WpV/bkZ1Vrd9bM
X-Received: by 2002:a17:903:fad:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d74dcc2d3cmr107576915ad.8.1787907502171;
        Fri, 28 Aug 2026 01:58:22 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9ecaa9sm3838814eec.26.2026.08.28.01.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:58:21 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	mark.rutland@arm.com,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	david.laight.linux@gmail.com,
	zhangzhanpeng.jasper@bytedance.com,
	yang.yicong@picoheart.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH RESEND v7 0/3] RISC-V IOMMU HPM support
Date: Fri, 28 Aug 2026 01:58:14 -0700
Message-ID: <20260828085819.4076449-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements support for the RISC-V IOMMU hardware performance
monitor.

The RISC-V IOMMU PMU driver is implemented as an auxiliary device driver
created by the parent RISC-V IOMMU driver. Therefore, the child driver
can obtain resources and information from the parent device, such as
the MMIO base address and IRQ number.

The thrid commit adds raw spinlock for race condition when PCI MSI/MSI-X
on IMSIC. As the commit message mentioned:
Events are bound to one CPU and the interrupt is affine to it, so the
perf callbacks running with interrupts disabled would be enough to
exclude the handler. But PCI MSI/MSI-X on IMSIC breaks that:
The irqchip sets IRQCHIP_MOVE_DEFERRED, so irq_set_affinity() reports
success while only recording the request, and the move is applied in
interrupt context upon the next device interrupt. Until then the
interrupt is still routed to the CPU IMSIC picked initially, so the
first overflow interrupt can run concurrently with the perf callbacks
on the CPU the events are bound to.

I noticed that xgene_pmu and arm-cci have similar implementation, so add
it in riscv_iommu_pmu should be accepted.

Resend v7 due to missing the first commit.

Changed in v6:
- Rebased onto the latest v7.3-rc
- Use sysfs_emit instead of cpumap_print_to_pagebuf
- Set up on_cpu and irq affinity by cpuhp callbacks
- Change type of on_cpu from unsigned int to int
- Reject filter operands of cycle event in event_init
- Check return value of counter number and  masks in probe
- Add raw spinlock for race condition (third commit)

Changed in v5:
- Pick up suggestions from sashiko-bot as follows
- Fix event group validation for sw event
- Bind IRQ to aux PMU dev instead of parent IOMMU dev
- Clear OF bit when event is NULL
- Improve hi-lo-hi patten
- Add back IRQF_SHARED flag due to mismatch
- Manage cpuhp and pmu register by devre

Changed in v4:
- Rebased onto v7.3-rc
- Use is_sampling_event() instead of accessing vairable directly
- Rename the matching name from "iommu.pmu" to "riscv-iommu.pmu"
- Change the naming of PMU device for avoid ":" in PCIe case
- Add suppress_bind_attrs attribute
- Remove IRQF_SHARED flag
- Set irq affinity to local CPU of IOMMU
- Allocate ID by IDA for auxiliary device
- Pick up suggestions from sashiko-bot

Changed in v3:
- Rebased onto v7.2-rc3
- Use hi_lo_writeq/readq to access register
- Pick comments from sashiko-bot as follows
- Set IRQ CPU affinity
- Remove IRQF_ONESHOT flag when request irq
- Adjust cycle event check by checking event_id field only
- Fix bug for group events verificaiton
- Fix KASAN issue about casting 32-bit variable to unsigned long pointer
- Clear IPSR pending bit before starting counter
- Clear OF bit in event selector register in irq handler
- Release irq by devm instead of explicit free_irq

Changed in v2:
- Rebased onto v7.2-rc1
- Use hi-lo-hi mechanism to read counter.
  Suggested by Guo Ren and David Laight

Changed in v1:
- Rebased onto v6.19-rc8
- Pick all suggestions and feedbacks from v1 series
- Add cpu hotplug implementation to avoid race enablement
- Move PMU-related definition from header to c file
- Change PMU driver to auxiliary device driver

Changed in RFC:
- Rebase onto v6.13-rc7
- Clear interrupt pending before handling interrupt
- Fix the counter value issue caused by OF bit in the cycle counter.
- Invoke riscv_iommu_hpm_disable() instead of riscv_iommu_pmu_uninit()
  in riscv_iommu_remove()

Zong Li (3):
  drivers/perf: riscv-iommu: add risc-v iommu pmu driver
  iommu/riscv: create a auxiliary device for HPM
  drivers/perf: riscv-iommu: protect shared state with a raw spinlock

 drivers/iommu/riscv/Kconfig      |   1 +
 drivers/iommu/riscv/iommu-bits.h |  61 --
 drivers/iommu/riscv/iommu.c      |  37 ++
 drivers/perf/Kconfig             |  12 +
 drivers/perf/Makefile            |   1 +
 drivers/perf/riscv_iommu_pmu.c   | 948 +++++++++++++++++++++++++++++++
 6 files changed, 999 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7

