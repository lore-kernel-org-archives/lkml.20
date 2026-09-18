Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B558613959D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716035; cv=none; b=qwOsQNwqjZ6fnQ+3dtDt7MBYitpC2VlY8uXuWM0HnDJRc2jGUBrtjv+dM6tquDyAD3OLZ8stbHaX/QiwsFSIAEzLrFjKbmw1VM0pWDwlYOJPpioKoGC7NDoaqyFXjqFa4yhC1W6ltUUAvLIJQ70xvvg7fDOr//jP6tvBmRp1Kpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716035; c=relaxed/simple;
	bh=lmr05mhnnK+lOO1jE+gAQDYyz+gLXcxDKtIoIuO+PWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hr97MhCQwbd8cuc0lugtOLUl1fome2MqRoW+tsTnOi2i5wJtboVcjPR0kz2Z28+muXp3FB8aiEngNd0qjQzKZz9R374ACL1EEG2NvuWMyjnCjPXXQss0F3SLUJUin/tQ8e6C+VVWPdCvWTylZxyRkjp2ZjWqHW1lsVLDvyFu5qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=EIRkCkFW; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EIRkCkFW"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso311150a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789716033; x=1790320833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ey2Q/vsiZe0TmezjSQD1jn0tWr1spPz2HHVIhZhd4Uw=;
        b=EIRkCkFWxHuTBdjpBRP55A7hXwVz6/JpdFVSCZkeT6v3PmCoTGGn5Ek049kBoepndS
         UiTyZLC+2O6Nm5gXin5OL8fVXAmZTXzbhLGx3Kr3sVQwUzxD3M770urEvZx9ljT3oiK5
         Q7IREapYwcQDiEKcXPHDD1b6CRNXs77wqXHeuqjSOafdYISFUdV3zGfwVmEzXiE1e2M5
         LDdQJoxH8rcHM5+fXL/sRYOQenTe62kXXuNumemkwQnGctBzCI9bdq1nt/mgy8nKszcc
         2w7F76drn38TaCK6RUaen3YbL2r0WNwJ23PKIwk8JlrxRbTrY0iONbHXQWdD+X9A8tkm
         k6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716033; x=1790320833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey2Q/vsiZe0TmezjSQD1jn0tWr1spPz2HHVIhZhd4Uw=;
        b=PaNYcvbb9cFVyk4lEDthP99hK2CkWj8674GqoT25i8lrHrdeCtkCF2Ew5YrYimlej9
         cscVXyWu1G01n7TqlwPPSKMvwfkUqWxTHlb6yuZXQK4e17hWadiKt1hCED9HW+j5645F
         RW/Xi1l6hI9ViEvQAb36ThS4huMl7W7kifhbtd5kuLDSawRfE9ojPo5vWE1IyPPTPChT
         DHbFp0syzWKJcg2AtkhcRXDRWZBkkj8gcElhbJPAADv8nMAnaAY4IqHHMwyNm7/g689+
         AE6OjCpiPH/aWwySPXAJ3nbIVPICbFR6GgwoWWsWBBC04ez9hTgQkP/jRdqo+MUr9klk
         P1eg==
X-Forwarded-Encrypted: i=1; AKwUvByl09np+M60nXgo9X82RYYRVIAUyp2Px03chQLmsfvd4OTnx0eeZR4FRUaetAH/6jVaxD+EbZk7wVtmfhg=@vger.kernel.org
X-Gm-Message-State: AFuF++kXR7uortlm2SsNnzQwou6LlWNDEmQZWDbyHRv6s9jkGT6eVLjI
	xkX0vS18/U7H/qRfh48Aspel5bD3waXVLG2H9ftFoo8KLF5eWsix8TWq+dlemxYRRV4=
X-Gm-Gg: AYBFou18gakwcWxlEZLlShDgAKpiCEdXqujKxt0swoe+JKaIFkhxoGZegs6i0IKJBwt
	8Regp/XuVIBLOZ6W5OWEOQq3hdjhEnt7mZLLgRRvb4p6TkuwofnCWRhnoPBqMXRf2uVi9uycZJR
	O/jbSv25P30RP83YllnG3TY6i4bVFlNRP6cyeouZskGlnJeERgXwSCNvI+9+r9kSLmjDvQfDBEH
	/xNXxeeZXzJCmikALayei6ZkogvLCeSRA/5MRcM5bj+pXltXxSiIHZvj5vsou/SIQx5BIN7kvDs
	fW5x23qUT1MDJ0Aq7WyAHNeJr3tnOwMA6rDCxZHKuz9YlIWoBqpz0/n1SgQUKX+xt2O4wyOLALq
	JUO0rEzW7jtvxsWAzgw/xnKSx4J8bHJNkWpVihHjJmaszBPQoLH1hlp4bOd3xYn6jLzkB+vfZOe
	F0vDXI7FJZeMnu54n40f/z9ZuUbOvOAwTM0IL2zfe9lEWHSFmZY5mEoLp7FyB8h0//m0AyoOs45
	gPStmOzKxg=
X-Received: by 2002:a17:90b:398c:b0:39e:35e4:d31b with SMTP id 98e67ed59e1d1-39e54ce1651mr5897094a91.5.1789716032935;
        Fri, 18 Sep 2026 00:20:32 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce03c682sm4416046c88.10.2026.09.18.00.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:20:32 -0700 (PDT)
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
Subject: [PATCH v12 0/2] RISC-V IOMMU HPM support
Date: Fri, 18 Sep 2026 00:20:24 -0700
Message-ID: <20260918072027.639239-1-zong.li@sifive.com>
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

 drivers/iommu/riscv/Kconfig      |   1 +
 drivers/iommu/riscv/iommu-bits.h |  61 --
 drivers/iommu/riscv/iommu.c      |  48 ++
 drivers/iommu/riscv/iommu.h      |   4 +
 drivers/perf/Kconfig             |  12 +
 drivers/perf/Makefile            |   1 +
 drivers/perf/riscv_iommu_pmu.c   | 994 +++++++++++++++++++++++++++++++
 7 files changed, 1060 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7

