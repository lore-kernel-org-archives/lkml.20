Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474483;
	b=k8pWaPm1vUVJ1OEu0l/6RunWlYAxLW5/sTr392+eonF2XZKe78e25vgl6nsADr1VFhzA
	 9aC9mWaVZcolmX/Anwe2zmSrrK6HWPGBhH7AKLuVDAEiBoqpTaRDe1vb2ct7+XQlRkB/g
	 wgyfpKOwD4zBTYxPQZzRo8cjJRFwWWkvQSxW8bWwoZ9y/b6SRXw8F/aIFq3GCyoDsk1Dd
	 NBGYzZh0SS7gva7634EsaMOi6xrm/WpyBl3ipS704Ozc/7JaTqtm4muTy+VFgTQ/8OlFG
	 kVTiqypxDTjMXAdMXiVzC8hiWEqdOZVQSRMJaKnb5r0TpDH8oB0M6INCa5MfZB21IyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=flDdnbgpLbuu0srS7vDLug/Gj+E6AwZDNNV7bkNw8vE=;
	b=D4QYVRs+o41VI/zj6cvo/uhwVjE6BlsRrl6DESAQt6FA+n7uAbvMNNl+eHj4dqmjFJ1E
	 N6VS2aLp9ztiFA5cHtPMPmwnjUgyWzPtkDdM+1giaGeZ0fCSkyElbZdqULPq/f76CPAdz
	 ntrIhsmDaliKt4E15qjCdtcIVMCVnX7XChqb6KeF5OLOZKvX3dRBSHenqRBohof9zJI1w
	 gqsdmEUyPvC8CzdOzCpljyWaP9obhKRH9eFgAIzfUE/TqnrKStcr97mLF3yepHfGmdy6r
	 M/qv6TORF4DyDwmzntUp4SS3j0pRghn+a6gC/RfNYWipxNZ9nQcqjyMAGhk88cpIpcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qHnCnxjM;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C68606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C68606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qHnCnxjM
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f2f2edb19so234424385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474481; x=1793079281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=flDdnbgpLbuu0srS7vDLug/Gj+E6AwZDNNV7bkNw8vE=;
        b=qHnCnxjMgmWPCmjzvHMEqIoz/N0j1p/RBkcBzvyCgrZsFQpOVON/6t+YtRxqHWpvqU
         /6oh/rtP2LtNQj6JnShAjBjKNtvmvkVSF97dedEqG6+KYqdD6mU8J479pL3jyGJz3Dac
         AyPBlZrMJnr/Q8fBPGeMxxVJz3pjWDEpsHvqStyohAwFBUNrPEoqrOrTyKZdXqSjk6Xw
         9UHheShLXojrlol1FAfRsgqadklEgIploWYzo7Wk4okmDXX0ayt2oakKvrfagYx0ZZxJ
         OQoLM/APjeP0QCoDOvtGuCoysCDk3Kl8ON3A29XTfUczA24i9lZOnCLKCPMOLJ7Of9B9
         WVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474481; x=1793079281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flDdnbgpLbuu0srS7vDLug/Gj+E6AwZDNNV7bkNw8vE=;
        b=YB3H0EAo4MsFftilpA5qWpXSX77LunXcY2N17BGQoFR84SLSmNgHGrpEeyntExSged
         NsyUhZDqLpMEXCCM2jbQb/SZZoqBifODoY/4LgY0o3aMAjX2nz3oW+j6n1ZguGj2hh1Y
         jj2b1SG/eb4IWgllxrkqsbTNw+7IjxVs8O2aZQjr1NO2D0paorwtEccPCsx8XNnCBOt3
         83l1zWs9csU4GN8nEqV8OEmofuFjCUz9MPp2RaHdjbdjKeiTooKEGqhepeWi1wV7xkdS
         QfusmA50jY76RdpJpXSpA5lMt7VvaP0syy4C13/2FFYsDwBLUrFIrplmQ602DmC5vm1E
         s8KA==
X-Forwarded-Encrypted: i=1; AKwUvBycUrFUWqKx0IjLeMjlQipceQJeO+VtRciWy8dXUQfSOY9Ax0r1Yocm8kfrxdy79LYxl1/jiviPJzjZDEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5qYjUrcX7mDhJFZ9eoN6vdnaCJl135sxB/SXajdVbPhowSRz9
	7gHuBWMxtuf7KvvR1upbI3BphuGk6fxMrfFJazXSMKRyNQVeMnH3RwMB3N1cRQ==
X-Gm-Gg: AYBFou0C76bMhK1zXnParcQkegSpdZgc0+03bZYvafpp88BLrBf/qKzmVmiHLa8kdGb
	n+DU8Y0YbC31fKij8i45DJoltu8VgQFbbyFhh22TVsoB+Xx05BAqrT5O9QGyLM+OcOSZZ/HN1Un
	HOYxDyFcpl3YOxp7kgn1rVjccpsgP9xz3uh9WFxr8c67g6TycA06e9UA9n5tulLQEii3GOA2uFa
	AROr55hitRGb2yXYAnOHul4fMXpI+zJWhTaHl3+WcfH9UbawoZNhpk9DLixpNfYpkjOD81uDYBZ
	QXbJFBfh1UIktKfqJ9ZqW8FFleD5L0xw+jcacbPo5Fza/a5rcPb3PdfocgHQfDOj9MbpvTeayfu
	xoW2NgnBpm+9w11mlyY6q0jiglAReWPqk1GlxuewMBRRkou19dHPC//9y0M0VnxUglDzN1K9Gp1
	EBO05h5UQd7gGpQtqyyIT9mCuXyi3YhsgKDYAO+zS+ta0C7ycxZRUPo2P3EJSf+glkDVajCcB16
	Fgi6fazfFns38YftpmZBg==
X-Received: by 2002:a05:620a:2416:20b0:93f:34c9:925f with SMTP id af79cd13be357-93f34c995bfmr845551685a.17.1792474481518;
        Mon, 19 Oct 2026 22:34:41 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b082168sm139455685a.22.2026.10.19.22.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:34:40 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Zong Li <zong.li@sifive.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1 0/2] iommu/riscv: Keep page table pages when IOTLB invalidation fails
Date: Tue, 20 Oct 2026 01:34:22 -0400
Message-ID: <20261020053435.1179054-4-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

riscv_iommu_iotlb_sync() frees the page table pages on gather->freelist
without knowing whether the invalidation that should have removed the
cached references to them was queued and completed. Patch 1 makes the
command helpers report a failure and leaks the freelist in that case.
Patch 2 fixes riscv_iommu_queue_wait() reporting success when the
command queue stopped on an error before the IOFENCE.C ran, so that
patch 1 also catches that case.

Neither failure is expected on working hardware, but when one happens,
freeing the pages lets the IOMMU walk memory that has a new owner.

The pages that the dma-iommu flush queue frees after flush_iotlb_all()
and the data pages released by iommu_unmap() callers are not covered,
as the IOMMU core does not let those callbacks report a failure.

The issues were found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. Compile-tested
only (ARCH=riscv defconfig with RISCV_IOMMU=y, W=1, each patch).

Yuho Choi (2):
  iommu/riscv: Keep page table pages when IOTLB invalidation fails
  iommu/riscv: Do not report a stalled command queue as completed

 drivers/iommu/riscv/iommu.c | 74 ++++++++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 21 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

