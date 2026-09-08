Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38387330D43
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788833032; cv=none; b=IPcub7SCszRRw/KA8CppJfl25pEE5ZLr9GRtrSaajbaUx9hLWl7oqjYAxRBxlsGRztiYfikO0SgNfLO53YaGE3MT5xYGpDvzCQU6riNcMeDpB20D7/jAn7tYuMXnXxbWGDX1ZeACSJKUQdhNj2ge1hj4I04R/k4KhJsuv34OA54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788833032; c=relaxed/simple;
	bh=hkNBN9MPkujzZCQBNuREYqDEx5xQUO+uRRcICqKbhAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZWVcDcH5KROIdOS5z8infEp2H/EXDrVCei6L8HA31JXg16/+tJCOwOGhYj72MMqj7Uq9L/iJd/pmf44QxV8evJYGZB058fD8ZfhWx3B1b/RUiF/CNORKBpDiJ+rHPy55enErPeRX32VjYqaT8+8Q+uGt2/tIV30I02MIau8Ch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LvT9k5kN; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LvT9k5kN"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so4782956a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788833030; x=1789437830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3sMw9iwve27Y2nH1ScSWttLx8rW++NN1zuHxfgNDdI=;
        b=LvT9k5kNjrIiEfzO2AxJW3KxHnG9fTjNU413d86e2PJ53hx4fvpdm+dWdyx3jxTm/U
         HkfmYGGMJ3H0IHyz2G4EpqfuYuHshLHvgj8VGxnPj5K1gPFsk0ywiVz99RLL2HTutdvE
         AiFJBn/2mb1tXB9RpPEsXvm+Zgiv+Gag1eppFJ5ShhVOnHrbl2FBQZKaAty0Kt/NZCM1
         M7KBOkqg9semRrdCoZ6dDG46uyISAN/zqvFvB8eDUSozjpFURoU6CND0IB7H6dA+d6C7
         25lMS/xo/Sci661cQPl0ofOqGUEyd2esuB0oy9UR81thEezqpMVm4JL1/zENsOzcRLxx
         D4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788833030; x=1789437830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3sMw9iwve27Y2nH1ScSWttLx8rW++NN1zuHxfgNDdI=;
        b=H4ZqGfRtH1t4bvp2lDUQr8rZ/i9P/t2DHrvOo0bPRnWxCcQNs86H6GaGH4tTLBkZP7
         DvHFAFLQidPr1jDx3Q50gytylOhV+dvo7+ITzBdBaamlojjIOYNiM6rqpsghY9sHyL1m
         OSdgz/QXt94DvGvQCGuKEhx3Vlx+m0miANY8A5LKbboSxzey0Bc42XWgfQOjBw5fpkB2
         TPpuIaFNjnLSVG0bMTiGf+oYF0zhRU8OP4UhsnGUc/y9xB/FfMdLCfBzEi/bcZkrYFk9
         dVOeSk28WAbHIN75tGMlXTZlQVjXiXHYE7oFBXnqfoy3nJXEXHoYA12/YVSQ9S1eyV+W
         ho3g==
X-Forwarded-Encrypted: i=1; AKwUvBx2GyYV1nZtCVJxG/Kb6eR01PK1RV7ptMNIpEa9GWjOZNLH6WJ4AKFKVb1ECFUWIunbOv8WE/QYc06wea4=@vger.kernel.org
X-Gm-Message-State: AFuF++lv1YlXiV1eiZEa7+xxXWa7AsaufS/7nyv1EiTcVAKuhMQTKW8Y
	Jlmvh8JKfk5+HCltM8FxV9kLCrPswIKPBzTedx2cE1TCn3u8onWTi69vIWk/Ec+7wuM=
X-Gm-Gg: AYBFou2E7DLH3yXUjvnRNIaVtfwRdwkXv8NVRGaMsCaQCvdZlw2wsjDdFGEPWBIc+u5
	129llfJhBg27KiILo1LHMxh/WE1VlKOcYxBfypNp3yBZlXuErMoMOxyxBMqfkzx7Obc/5KtIxu3
	N7u2OI8FOL2QEmRj2/YD0kKr/LDPp9BSyJGSIZ+FX5OLAu2n3kQTbAELXTBKdltdfYoM0do3qHI
	N2x+IZgYAZcgGHUzJCDjWm2nPk4fFaxNXl3FQTwAncBnz2PbmcwFfUG8qONM6qqnn5uKnDtQzE3
	OXxJt60abtddYAPa6iWPuQ/UT17stAWYjIO6/A/2pY2r+m4/1e8nmZIZtWywL1xZlNzsqhO3AaE
	RlScknjemE+qHmegTRa/bQ38HH4nYqYtUeLpFK6f8Wb6xNylIXlOkWoU3gwWaSaP7s/JWgm7YBW
	0NPFa9Yh8r8w56diBZIMTxR43A5C4iyyheUCDabFwMJzH23aDsYZLP+i+/jVFBIohJtlk+dTQYQ
	Ey9W6wZRqA=
X-Received: by 2002:a17:90b:3944:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39b261b19d9mr43841330a91.14.1788833030494;
        Mon, 07 Sep 2026 19:03:50 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm893671c88.7.2026.09.07.19.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:03:49 -0700 (PDT)
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
Subject: [PATCH v9 0/2] RISC-V IOMMU HPM support
Date: Mon,  7 Sep 2026 19:03:43 -0700
Message-ID: <20260908020347.1836653-1-zong.li@sifive.com>
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
 drivers/iommu/riscv/iommu.c      |   37 ++
 drivers/perf/Kconfig             |   12 +
 drivers/perf/Makefile            |    1 +
 drivers/perf/riscv_iommu_pmu.c   | 1020 ++++++++++++++++++++++++++++++
 6 files changed, 1071 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7

