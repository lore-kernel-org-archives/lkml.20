Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758CE43553A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513706; cv=none; b=YrUm2SUc+74H1DdSWXaC6uexbeopDRRBqKBJt5IkYtvna7I0t7vz4mXRx6TXwKlwyXxQa3HXyrNMdu0W9up2HiCvo1NcOZCRpYnNsUEIav2fnGZYfBosZ4X8naXsXealw1Ucr0y8Awdpq0UqhdzEmwAH/v01MzHyblJSZl28Z2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513706; c=relaxed/simple;
	bh=66UZqVClFVVA1O7tD4q6NQPzk7bNbkSIzh/ikTXNEQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YY0O9gnUGd0s6mIXc/A8wbzEdpfGf/3kgTngANrzpb202pH8ct9E0gLfBF419yujRpRMUdYZ/rmRwGwN3j4XyVEAdazwKbZY1UIaV9gSp1d5m0dOrz20cflsNAb0wHgTnHoTyOeH2uCppiMsJg5nU5/Qa0JtZA6+vGAPkfi/GJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=QZYrtULI; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QZYrtULI"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so556168a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788513701; x=1789118501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q9+T08Ol1yj/MMF/M6cDqb87S/P26Yho6EBQQNhwINA=;
        b=QZYrtULIwiGJ7Sn75GzcBZJr6Bcfn510HmNHWUDxf7q79Jym6PccIMWUsio9IwzzGy
         VlJB3bmK2vaniGieLpBoq/Jbb+hlspnaf7gjxjdbuBANbLtxv6xA/GMF08/VZ2KOSc8m
         edErPP4tSnHEr+pcF9i627KUduiHdDNbCabm22adsOd0usCR8LL1ptOmgNBckBGn2Ehq
         RDDC0Rz8fPfbgVyq7G9ykzamK07idr57zlakM96MCS2DQ2RmoQ3SxVHAi7kzczp4f+ev
         C4laosqXiaBKtELL79x0gZ4RDsk3y8jPghEzwIKfw8r5cJLeU1CY/6f6mkXVBT9usH5F
         WvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513701; x=1789118501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9+T08Ol1yj/MMF/M6cDqb87S/P26Yho6EBQQNhwINA=;
        b=fzhNqHWGksXe1yk8uQa9/Z6Ufp1mw72tvTG911hOPYi1RuiWJ4jKoIhmtpMQ+DO9Y5
         NXjajh4riHJav2lVXAtcQiWtFWeC9tNP/JGXd3zn5g10JrfXF2KUPvw9XsU9yoW8J7UH
         YIEWIhvl4l7Prp/ZqndqLxkiu+HGqFo3JReTYCBP0MdzNe9hxbhW84rSh/Y+kSbTb2Yz
         b7JipmwgW31DuCB0kCNrV23vOBG0/yAR74Im2jbfKyrzLQXvaYmKOMwkjMrtDmD9ERQB
         HQl/aDo8Alpk53dgFiKLHbHB3DwRdXRs19LeVE7lkVLlbukPOVbXPAYBCDRPD0pdGe7m
         tIeA==
X-Forwarded-Encrypted: i=1; AKwUvBzaDtAkJ0QteAt9mCYVdBcKsnlTc+K83o4mW407bNSuFzCR+pqvpUsaJW9ZhjdrxgTbWEApMtDr299TuRU=@vger.kernel.org
X-Gm-Message-State: AFuF++nvYqKkygD8Ffekc7TUMvaFbUHylSuJroWrPUs6RtTSWx9veHds
	0RnyVsKAQDRZTDZkUOI6wMowDaHiYdjfrdvDl625fqeLeSHMaEgNcEQXr6Mb3QLBJ9o=
X-Gm-Gg: AYBFou1QpMnrKSFmZDVtV07f50nohpN0TmR5MFnIYFgV2xFtsGSGcLv+BT2yTs2HbnG
	rGxcWonykVs1GShNRV/+ml1RQ+CKYIvKIxCb6l9JwlwEpWvjswL+/Ax3dg+h+Nq7rZqzXZSTF5E
	2wfL2K3jTgaGCZpd54nhsGwfmkN5Xsy4RggIi58K14iXIEduKyPSD+Y1ycIoXnb1kZyv7ammmYR
	cwUNEjcHJkSfiIrKWAfK+bWtkvUdbpbMt9UQNCAdBm8DFM95rxfmN8RW2Qazt8kb53Qaw6hlEku
	D4awozykKoij5huWCX5g29ZM43OTGVYZrYGBfRRN7k/gAhPJBycXLMVyYhCqxAu5sGkg6GKz2h9
	CYk9dasfnA+CzoLep+bfNyWDcRuEttlP0qDv3GV78pWoK1RulfaN5Fzy4d5cMJN6pciX0pMIc9/
	p4lAIu1mmrBj3OLptmjTGrRQDPFcTS+EBygLor92Lfccuvhf7NTJh8M9gr3F740/EtT8oFzVQ/m
	XbZpasV96o=
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr7536728a91.17.1788513700711;
        Fri, 04 Sep 2026 02:21:40 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432438497csm5275575c88.8.2026.09.04.02.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:21:39 -0700 (PDT)
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
Subject: [PATCH v8 0/2] RISC-V IOMMU HPM support
Date: Fri,  4 Sep 2026 02:21:31 -0700
Message-ID: <20260904092136.113321-1-zong.li@sifive.com>
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

Changed in v7:
- Rebased onto the v7.3-rc1
- Remove raw spinlock
- Check CPU matching at the beginning of irq handler
- Add PERF_HES_STOPPED check before overflow handling

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

Zong Li (2):
  drivers/perf: riscv-iommu: add risc-v iommu pmu driver
  iommu/riscv: create a auxiliary device for HPM

 drivers/iommu/riscv/Kconfig      |   1 +
 drivers/iommu/riscv/iommu-bits.h |  61 --
 drivers/iommu/riscv/iommu.c      |  37 ++
 drivers/perf/Kconfig             |  12 +
 drivers/perf/Makefile            |   1 +
 drivers/perf/riscv_iommu_pmu.c   | 941 +++++++++++++++++++++++++++++++
 6 files changed, 992 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7

