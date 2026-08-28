Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495D836196F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900872; cv=none; b=TVfuJblvduSeKZfEsK3Qv8ZrkE6xbM12HT3CWvOsztUtT8/Q79Q7l2siSKhIMWhqFPbsT42SAhtKi4c6gdVvUywGM3Vpt+zKPfCST6p8plMPfpdWuUPFDeJcKiIQMMANNr+Unm1UVZOJbYsOIQlcVosfr3UobVV1+q3dsmXg0YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900872; c=relaxed/simple;
	bh=JfTyLPMvv3/RCFowH8dDuEVfOTZFfPC/h2ynAKfCOfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8OII7HFf0NPYb73wuGHo6YATCvHJIcQZ2YD4nE9TRQWEOgITVKRpP5zoRVZCy+TqCDduGcU+rgPd6pwLkiizgv+2Fjt4ENmdBMTSO7pYjqPDZ+rij85oj2aSC8kDUnPo6kG8htoaGyet14Wpur/QR6eTJFqF1E/QoZerkypclE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=ckV4Jvw2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ckV4Jvw2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so942225a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787900870; x=1788505670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZRXFOZFial7txsdAx7JQk2q/tHsDJDeYpiV+eFKuNdk=;
        b=ckV4Jvw2hP8UfEjSpG1LiJZeBol+GKBeeX0rjAGhiRZjDIkYDEdUCk5VVGa/DeXFfE
         TbKsYg7UlUZ9t7/2dhYDIbGi/AlKZUJhoJY6RlnsfoJ71wN42yQuho3czVqoBNxwtan9
         MH0AKizSteiC5nqvCVgvkuMJB9822T5euVcCRQBDJm7bm59hBxJZMIWCGbIszwLNrDFp
         QN73DynxtbLXeA84TJ88zC5mF/nv8ZlXZFNH1mJy7YR4rbJTDtG8DrujW4XA2f/RpukR
         VC2wNPJyoa6e1qneU5Ngp7H2ld7NF7WDFrU1XvmMikGbZbEmlTzIo9vXR7ADH7bz1FBM
         klDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900870; x=1788505670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRXFOZFial7txsdAx7JQk2q/tHsDJDeYpiV+eFKuNdk=;
        b=gUaGi8+9hGxnrBlc3jdWku6yR7jYxf/V6iwojva46gmVPIEnyWfR256T1rRtsp+uq/
         kRjBIvb65UKTZDmqiGjA6OJ4TEfMI/zluRcT08SkChPO01CgdMMKVSAeRJ/uSHYRSj9G
         XfiDukE1vB48mOo2ufcYx9i1bLZ6goINKsfk+Az2qLIOu3WGgsowTtycZxeKiKG3Xzr9
         cI7/6b6xHtXx8valrojVevj/655ugS9c4Jb04yT7Sff5BVh3s24FyZVxem8O4yLel6/z
         GOBD6ynf8yN4cqbNaKM6KVXwO+wCWvwbBPN/7+wY6U3bSnJPHhy3BeXLlcDmYLuJUDqV
         +49A==
X-Forwarded-Encrypted: i=1; AHgh+RpU4B5FTLLlc4pwYmwHB2T3GWJpzbRz6r0gMJyNjbGP+1/VIJ11hkkF3K8QSggYCBasvIrHSlSLo3wgaFk=@vger.kernel.org
X-Gm-Message-State: AFuF++mn83K9ijsF4SneHQwOrQe1Wf7JPXvhMTBA6Ow9o0JmNjvYh7eA
	rkpjE0CPkwS7OP60/228DSdhozSQVFjJb/6V3uufCmVipoLSveyzEFC644gaufojmpw=
X-Gm-Gg: AR+sD10lYgm21QcjI1Qy+j6JVDBtidhLl28Lc7p3Pdn5KOGK4NLsBV6UVve6B+luUec
	qCrZOWkl76tUfxKxZAD0glbZ4kXSj6WLGiyArmvrgAk/UMb2lUtgZqTevAt1u60dL78+eurMgD2
	noVI5WKq9CX5wUq50qYARWKURoFVkKhqfPldePmN26FTYN+gNRFDQtpxzzt8dxypxRaoj1d9+u8
	A86qnRz8Zx8ywUCS3GnVXwElRhksgQQmJ8m9kaerKXclboFNjD6gAQlrhkl7Knfys5Fyx1MId2l
	YBeASOFIX6LT2L4I28BhvWNKpn4jSifAFIsO/zztX5LBBk3aK2bQh3Op20YpPizI+mtdkMbrgYc
	XfGK+GUpwrjhAOjiqsC48sAcJBWGAMqTKJH0maGY5TsmyvzeVrB/XRK495+RrqAxuW3rW77Xt8I
	CLtBFWDsd4zX4G3yTsKUGRmoAwWNCyQAJK6cKcYKA4S+OXJG9nXprRU9eJY2loTl+Lw1orUwF2
X-Received: by 2002:a17:90b:3ec3:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-396d0e37613mr9125343a91.1.1787900870554;
        Fri, 28 Aug 2026 00:07:50 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1b38esm3156610c88.3.2026.08.28.00.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:07:49 -0700 (PDT)
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
Subject: [PATCH v7 0/2] RISC-V IOMMU HPM support
Date: Fri, 28 Aug 2026 00:07:45 -0700
Message-ID: <20260828070747.4009519-1-zong.li@sifive.com>
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
  iommu/riscv: create a auxiliary device for HPM
  drivers/perf: riscv-iommu: protect shared state with a raw spinlock

 drivers/iommu/riscv/Kconfig    |  1 +
 drivers/iommu/riscv/iommu.c    | 37 +++++++++++++++++++
 drivers/perf/riscv_iommu_pmu.c | 66 ++++++++++++++++++++++++++++++----
 3 files changed, 98 insertions(+), 6 deletions(-)

-- 
2.43.7

