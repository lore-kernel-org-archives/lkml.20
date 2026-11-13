Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563443;
	b=YVX1HCJx+vYr/DKfGf5dFxzt4pvQvSS1huRSEIRwkmHWAXr5dHujlhAmgmUWdgwcxRsU
	 FQuKS5Vvl7kAu+87jklk83ZjXvZTuZh9IDORB33V2/D2htop1vqII053ORUrVOVNj0d8A
	 XbOXgtx+YVtWWrFH5fEJw2T+jeHLaLXweMHzRSbwkm/JPTqAnwwYgDsdbVQpP8ng1wEdP
	 b8zulrOtfhYha93uhCYn3y4JUtPZaOnds3d/IcZO2zBoiLBF3/TNWi6OssKRh0pFlFGCK
	 UL4iwMRPp2u7T+M22N3a3DlCzsHwv3rpmJHeHchPCqw7VUYw4uMxgMRKvZR0opmOJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563443;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qjJLQNicWLL6vQv4ufCop78f1wmYUYGwLXgPCg0B6qI=;
	b=avr2lzC+qu5EyVMo0RhHSSTwyuVtkdv1oCdw3xyUXR/2d/qqn17dJUpPvz9Wi4Cch6N8
	 n0idk9kLecbGtuoSHxnThPYBfZqrngLzYdkDktXZk1J1rgT0KmffqqyZ8GHphPovnro5i
	 T9ZL0pYYxbjyaaywqK4U8tlztstpTXX+K0Fq6hU5IIy9ROT8opFbVuyvBGOEOwzJ+9EOM
	 AOLVCVT/6B7gpDreRP+vRk69MvUt+NGLQrWVwMm+NlNuEvpj7cGHO4PdujwQ5tMwNOBX3
	 UINSy68VmcPfwc6Wi9qd5b7IcuRIXPlMebI/3wQe/GQqmRM2cGFGcqf2H0T0enGLJ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=l8wMKfHF;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A180606A890
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A180606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=l8wMKfHF
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794563434; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=qjJLQNicWLL6vQv4ufCop78f1wmYUYGwLXgPCg0B6qI=;
	b=l8wMKfHF458HfRoNluvh9FIUF6GyLIRMZLgmR6e7eu1k6xxnu9Lojz+bGcNo0uy0Dtfd7BTeZ1z3vEhQnpSa3BKgoHtSs5Azjp6r3y/lM/B4OGt13RmGvhSbpJxNTmeBACTQc4eRVdTsECghUVSER5Hf/xjMfhxIHmH7i+GGgLU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R351e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEefznJ_1794563417;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0XEefznJ_1794563417 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 17:50:33 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: joro@8bytes.org,
	vasant.hegde@amd.com,
	suravee.suthikulpanit@amd.com,
	will@kernel.org,
	robin.murphy@arm.com
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] iommu/amd: Optimize IRT cache invalidation for nested VM workloads
Date: Fri, 13 Nov 2026 17:50:15 +0800
Message-ID: <20261113095017.1835921-1-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
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

This series optimizes the AMD IOMMU interrupt remapping table (IRT)
cache invalidation path for nested virtualization workloads.

When IOMMU AVIC is enabled, every nested VM entry/exit that switches
interrupt routes between guest and remapping modes calls into
iommu_flush_irt_and_complete().  A reported workload with 4334 device
entries shows median lookup latencies of 22-33 us per invocation due
to a linear search_dev_data() walk, even when IRT caching is disabled
and the lookup result is unused.

Patch 1 moves the device lookup after the irtcachedis_enabled early
return, eliminating the unnecessary walk when IRT caching is off.

Patch 2 caches the device data pointer (resolved at IRQ allocation
time) in struct amd_ir_data and threads it through all IRTE update
paths: guest-mode toggle, affinity change, IRQ enable/disable, and
IRTE free.  The amd_irte_ops interface is extended to carry the
pointer, eliminating all search_dev_data() calls at runtime.

Both patches preserve DMA-alias invalidation, command ordering,
locking, and completion-wait semantics when IRT caching is enabled.

Guanghui Feng (2):
  iommu/amd: Skip device lookup when IRT caching is disabled
  iommu/amd: Reuse device data for IRTE cache invalidation

 drivers/iommu/amd/amd_iommu_types.h | 10 ++--
 drivers/iommu/amd/iommu.c           | 73 ++++++++++++++++-------------
 2 files changed, 48 insertions(+), 35 deletions(-)

-- 
2.43.7

