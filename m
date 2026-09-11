Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09A03B38B9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108261; cv=none; b=cr+xB1kHEZmKMqHJ6ibD0fBwZx+h2K2YpR+WoI/weilEleMrnB5+av2+KS3R9awhsodTtiO2yVkHIUokQoO7EjVYxWrHdaP+rh+LbbV9yOzwqQJQ1p0ZvLKSLWAav/sEvSbBYVJVyfcfE2vDdscXnDO/q/h0dTEjESdl0vqdI24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108261; c=relaxed/simple;
	bh=RQnl9JsCyLlas2wqU9XhaI0GPuGEC5V7ikoHzldSR9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lbC/GmPSJabdu6P6VnAWjFRPi3iI52PJakrZBkagugIdECFzqKQWqWPkfCCH8hRwzouwW+ZSIb89CAuOa3/0ZAFbzlGB4T8tY71YJWNwDN0sJB/njHcaFXK/KvR+CHIJlKJzucnpzprrP8KeUtGjyPUGMCnhASypys2GYQERQVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=MUOv3HWo; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MUOv3HWo"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3964e480f76so789567a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789108246; x=1789713046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6fEOf/IOiBj0LrijFeZ/8VfHCADIoPG1CxdjXEq88Q=;
        b=MUOv3HWoM9Jnz9QSWJXzcOyVWu70rkCdxUpQ3tYnobnCL4Rw/+9KtBoR6WouJxu/GT
         kZT8h9w+V6ARoD1KpyM8/1lhMMLO1t9p8rHkZ8cBXUoWPF6QVmgT4uAzKpdpa/PtgOpJ
         X8NYTNkHFHjBhKFMa4wHtxxMNqWVpxndGZqMLgKdJQtF97PYV7f5Ha405VMqCP2Yc45M
         5A+RWWk/0u1CUEGvSVfMc2GB5TU+i7F0Wir8g8kjxt591JF4g/CYmRkW4QEKbVRSmhJY
         ARLnZTcVU7n6icfpEgZ/bbdaqNTdb5R/mcfJWHpA84Kuz6FadBvsEBnySOQnT5Pbwrob
         P+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108246; x=1789713046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6fEOf/IOiBj0LrijFeZ/8VfHCADIoPG1CxdjXEq88Q=;
        b=d5xBuweConDRaTBu/wlU9+Ph2tFywyvH+yRDMn5s2GhOrGpW9X+8xF+rcS4r/5SdC4
         H/1IuKKuKnyG/jqICaTw6+4YtnUPzKgormSpwHM+Pb9pxFEGYVStYUXfYfsa27T3aHme
         njFannlVligsUtZZG9CsOaVuA24bWRkur4n4dWHvUYTolnHeGAlGGHFj1+2MoBHH3ShJ
         CA/Nt0Sn4nBEtGOFdBHY9UU9EJHvuoYf6OsGQ+6ckWc1LHnsMU+7fkGMQRsb+AjzW7ry
         fHqx2gVIkWxMQKJDU5tjLADIKo0zJh15lHc+EZBu9XPg7XekPdz75mLuBLThR09X/gE2
         KbDA==
X-Forwarded-Encrypted: i=1; AKwUvBxilcefE32Dohuq7wYet74AYEX24F/ROC339Sn5g1w1kCOLlYOJYzwzL5WeT5rpV3lr0m07CYlJK5w1AmU=@vger.kernel.org
X-Gm-Message-State: AFuF++lii8UDMFfTbP1hKScDoZnmRInMt1DDZKt1ErgGSbslxW4YUSQk
	snkoYRL25MQQEJ1UaqG4VamtcY58QQpc5CnYzht//6SBTmmyJcEaAoE5/nOyvSwm33c=
X-Gm-Gg: AYBFou3JJZxjxk0qgIg+zW4xz+l5PhQ59VJ6G647Nu5o3vA8mHt63iboZX7oQz61Ewe
	vJPj9UxSRi7h+r9CrkM1vUksmVtPzcAwLuHgNLrbGIxBpBnn5Wn6m58JP6pLH5R6djePa5lDpvd
	Cr85gPjCWIsZNc3IOQCqc3l3lUcJvsU/jrrsVT9YEWVPEEtBxmPBxaeeHx89uCxUaL9ZiHNAf5Q
	TGpAeU1CVa9ZQcXzVo9VSb3Efwh8lUy6u+H9cKrcVYdJRS+XqL8SbsHev2/vAS71P40pdn7HqYO
	aKr+n5lhfhH6FdQcpgE9oDZ1l9vlPXiLAOPzG70dRCscdg/VytS4tq+mt8SnFxWJxvwv+aH91O8
	WoHzdeZ9aIn9OJEhgv6Tu01zgz29VdCbTruLzibxWexskzSdNqm2cmojiysNneNYoin99JYG2Ol
	AcBlmnOEKn4MKjWY1lpFNsU9bSxvZb3yt9XHsyik7BwEPEYuN8ksQx2PDZfOFtuE7PHgSAcXvRr
	QqIblT72OzCId/+NfHPBw==
X-Received: by 2002:a17:90b:1650:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39d9c34266dmr4534758a91.23.1789108245853;
        Thu, 10 Sep 2026 23:30:45 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm331152eec.8.2026.09.10.23.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:30:45 -0700 (PDT)
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
Subject: [PATCH v10 0/2] RISC-V IOMMU HPM support
Date: Thu, 10 Sep 2026 23:30:40 -0700
Message-ID: <20260911063043.916844-1-zong.li@sifive.com>
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
 drivers/iommu/riscv/iommu.c      |   37 ++
 drivers/perf/Kconfig             |   12 +
 drivers/perf/Makefile            |    1 +
 drivers/perf/riscv_iommu_pmu.c   | 1042 ++++++++++++++++++++++++++++++
 6 files changed, 1093 insertions(+), 61 deletions(-)
 create mode 100644 drivers/perf/riscv_iommu_pmu.c

-- 
2.43.7

