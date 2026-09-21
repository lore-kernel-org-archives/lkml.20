Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0B444D01C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978559; cv=none; b=OOesWzCkx2zvRYvkSQZAmEKq9/PhCTKp5M0XJTf0zTdf0syerPIYVzTDEgCrZadEfcc291Y8u7bvlJk4O7ciqJ37S94os89f8kvP417hGZYfwXBpe8gkwkelvUwJsnqMamKEIx5s28TVEMS8EVAYpEXq9FnoKnfL2FXR+dheYP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978559; c=relaxed/simple;
	bh=xBIf3Pr0YmX+pDdZctFWoUSgPyNr7jHiFRAl3YR/qso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BVddnQhdeZAXz9dSkD9jDTVcqjmeOuwTKE+C10KgvgCzQfEPOk5D70+iUtB6r28ZhOjcz6q/NmF2zfk0YJeQY1Q2bpl0K/2bvTWlw+WzSua6/VmP+esOBvvi8rT/3whXvWIWX5II8/aQKmkq83rYgIVVWbNUJeIg/k2ea9DOq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=FWroJM3O; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FWroJM3O"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2dd68a16955so34611375ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789978557; x=1790583357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=txdK8zZNvr3IeIOXJRWIc2g69quLivVkGnF05uJ2f70=;
        b=FWroJM3ODb1+QfDaaO4G700Ps+cBNVPE5yT9G5SVvhg2QQAVs/yjsZxlkVPCC0ThyO
         0GKLhoDn9ndjjmnfL1KvVpunwc7ttosHv7GK956yfwSRll/B3hzlFHcixL+yVqR3LQCB
         k5c0clBjTxv4hlpYlDtNcH6Tr3Lf9Thxlc5PORBMsvkvtifjAsIWSwHkv61S8OY6Jkdu
         A8Ap9AzVAU2qH7rk3RlgH+oxopvNiw4zYldj4cIL0+I2533xlXblSjrBTPiapwsaUpHg
         Kfk0CnAn7yGm57blsWXGEx5WGOVGxz9nXbuEGqysVJtk0l2zYNWP+Nu1HVjmIFYgRKKm
         Ezxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978557; x=1790583357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txdK8zZNvr3IeIOXJRWIc2g69quLivVkGnF05uJ2f70=;
        b=YcFC5Xjxwk9BvWgfckgaBK9ymoUA9WRlkoXHcTG9aJdNS+XSHnNFIFRB4QsuzSW+O3
         0RxH9hJCKme8nufqsDkeIp/VPp3htiSx4dWQp1l9bH74gRxboheEFbHmgamPgwovvujw
         RtR9hbxXkxFJ0C7OtuT7VO3/YAAx46PbiNXkYAhc2mm3ufPJEgekNQKUj0D2G/rgoizo
         gRpheglSREiO3SEyaY/9I0WwXs6or57Sl3SvQSwgnES52TqJFya4ieIa+YT1aDfORt7c
         SdEJoiP9uQiT5F12qN8QpTMQVXVy24A5B6e8ptRcIHnuMggtbhAK5CfLPbeEfXFOR5al
         2/tg==
X-Forwarded-Encrypted: i=1; AKwUvByWhTZMzN7YdvB4To9KKodgtX5mBfS0w3y9ebjDg8MhXms3Zx0q66hUWB4jKWELcJJc5qPAUPySORLsquw=@vger.kernel.org
X-Gm-Message-State: AFuF++liiL2cFs+pHUTyKS2r8jG+dFh/Jw6cylyL7cNdsuI/hp0VCtA2
	PYKSSMYC9T/TXFQcrCwn2kPE8E29VKuat8dMHbcQd001FBbnXNXER6BhjMn6VKnc2cg=
X-Gm-Gg: AYBFou3fK0pHmJ73d4XUXmgAO87k3ir70dtgZB93XAatv3u/Ibe/KQ8+Rm4e9MfB4sE
	yYKatv8YzAInPbhplEKuC8+X2Uhp01MDNotYKg6Vy/IIRXGwPsR/HhTXs901pcsIpkDkSRpqjyd
	P2FgUxwmmocr8LaNRT3i09S6G/b3PmnNGNfiYvvaZ2joIWkVL6S4YdmtQ1FSqplNZ4DhM+y9IPY
	fHHCXnPuJLkuwlLvTHO8LbIDs+Q+ty15nVAASerAetgsK5sLcVvM269ebTvC7rEJTf4lAsfogSG
	9DXZ54HG46T9DxlX/IRjLglWlamMd0sE/9c1HY//w5RLfCL+UTy0hp1cj/Thcg3I7bZLjj+z35v
	0JhPhdqEUoLqjjx1+1nANoCM76A/aGZ4C94zwT4ZZ8+mfGkZ8OLP76U1JTHutOjuo7OEf9r6zEQ
	sL6jTXdU1uGxWqamSaSCmTloaIUiNBVoeONcO6ustGGknCXc1tp+TeZTvaGOCY1cdUqFGXsQCb7
	G+tW3uU0h0=
X-Received: by 2002:a17:902:cf09:b0:2db:3734:cfa4 with SMTP id d9443c01a7336-2dd9c6b9151mr156850515ad.5.1789978557003;
        Mon, 21 Sep 2026 01:15:57 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f16f9csm17151344eec.2.2026.09.21.01.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:15:56 -0700 (PDT)
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
	nutty.liu@hotmail.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v13 0/2] RISC-V IOMMU HPM support
Date: Mon, 21 Sep 2026 01:15:41 -0700
Message-ID: <20260921081544.1797510-1-zong.li@sifive.com>
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

Changed in v12:
- Rebased onto v7.3-rc4
- Add raw_spin_trylock_irqsave for ->read() flow

Changed in v11:
- Rebased onto v7.3-rc3
- Add riscv_iommu_hpm_disaable to destroy aux dev before MSI is freed
- Fix CPU hotplug race risks reported by sashiko-bot as follows
- Re-validate pre_count after reading hw counter
- Move hwc-state into atomic critical section (pmu->lock)

Changed in v10:
- Optimize hi-lo-hi by do while for hypervisor case
- Add raw spinlock for cpu hotplug race and IRQCHIP_MOVE_DEFERRED
- Remove irq work mechanism for IRQCHIP_MOVE_DEFERRED

Changed in v9:
- Clear PMIP in irq handler on wrong CPU for re-triggering IRQ
- Add a lock in offline_cpu to avoid cpu hotplug race condition

Changed in v8:
- Rebased onto v7.3-rc2
- Add irq work mechanism for IRQCHIP_MOVE_DEFERRED case
- Filter multiple cycle event case

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

 drivers/iommu/riscv/Kconfig      |    1 +
 drivers/iommu/riscv/iommu-bits.h |   61 --
 drivers/iommu/riscv/iommu.c      |   48 ++
 drivers/iommu/riscv/iommu.h      |    4 +
 drivers/perf/Kconfig             |   12 +
 drivers/perf/Makefile            |    1 +
 drivers/perf/riscv_iommu_pmu.c   | 1007 ++++++++++++++++++++++++++++++
 7 files changed, 1073 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7

