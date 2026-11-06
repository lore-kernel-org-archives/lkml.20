Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.254.168.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943743;
	b=HWCDGM/OLuiy+LMbdaZ9P4rymM5+lFXPtwpsfBe1s1mfRdvQ1LjrSGtX0liuV3XnQEO8
	 Op/oyNRMYcY5E4g/H30/wPtTkHCooHPulVMDj1ey9eyxC7jhR6I3jvCL0Qnp9UdttLWbV
	 wcsGwLpTDu984O1lg/Ii1b6+cIQ60wjdAEzkKIKnnpsBQ+cNTIMrCM1fDThZU4Fzu+7gM
	 hKcMiTveS6T/4JV7mlFruXLCM3nYzBNO/B3anSCFWjmueUdm12FrfefcoZ00l0cU96AcY
	 BFzBT0WqcEaMxMXZPi/Hv86GOA4rX9sy1bygVKL+KKqFnbVAopCIhKhsf+8M/I5jpVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943743;
	h=DMARC-Filter:Received:Received:Received:X-Authinfo:
	 X-Hiworks-Remote-IP:X-Hiworks-User:X-MailFrom-INFO:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sCjK+eSjFwVT1Le/uIyIA/BxA96L8az923s+JnTYtYk=;
	b=rmzELR49yvj3uOPOW8yDgCSpBwIpwRqmZH4JKd6FPJGi3t1b2A+To9aD197fS59NnaHY
	 qHxSSDUlrm1f2FeN+EGxjVQP4LTotIRM3/Ht7lVXtF1y58V8w1ssx+1no6VcqZ+zGC8xN
	 nKmQhi9qwPI6jXRyFAWQDIXJbE3CTDLLJ5l12IozJLMWNAZmLFTKg4ZWHw8l3VuEFcALQ
	 1Kmds94WYxsXV2oiIyyWUKzetQgt0AUqQCc5QxNnV+VhqccyqEH07TE9q1Xep8rPgb5Zy
	 9yFRskFQgUy07Kb+ws7strLBebH4tO8rdMuiM1zROcPUTEvhjAOby+ZPLS4145modZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nirvanahyj.com;
	spf=pass smtp.mailfrom=nirvanahyj.com;
	arc=none smtp.remote-ip=121.254.168.205
Received: from smtp3.hiworks.co.kr (smtp3.hiworks.co.kr [121.254.168.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A69D606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A69D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nirvanahyj.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nirvanahyj.com
Received: from hi-smtp-node4 (unknown [172.18.0.2])
	by smtp3.hiworks.co.kr (Postfix) with ESMTPS id 4jLSjz0MzFzWGrLj
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:42:15 +0900 (KST)
Received: from hi-smtp-node1 (unknown [192.168.71.167])
	by hi-smtp-node4 (Postfix) with ESMTP id 4jLSjz094fzQJWlg
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:42:15 +0900 (KST)
Received: from hi-total-node5 (amphora-3294b420-308a-4b9e-8a1d-bf25580dae1f.openstack.gabia.io)
 	by hi-smtp-node1 with ESMTP id nvxulhvkrdnckvjr;
 	Fri, 06 Nov 2026 14:42:15 +0900 (KST)
X-Authinfo: HIWORKS SMTP authenticated <nirvanah@nirvanahyj.com|114.203.237.180|nirvanah@nirvanahyj.com|261106144214_8061351674>
X-Hiworks-Remote-IP: 114.203.237.180
X-Hiworks-User: (SASL_USER) nirvanah@nirvanahyj.com
X-MailFrom-INFO: <country_code:KR|rbl_level:0>
Received: from localhost.localdomain (unknown [114.203.237.180])
	(Authenticated sender: nirvanah@nirvanahyj.com)
	by hi-total-node5 (Postfix) with ESMTPSA id 4jLSjx6ghZzSqYcR;
	Fri,  6 Nov 2026 14:42:13 +0900 (KST)
From: Young-Jun Hong <nirvanah@nirvanahyj.com>
To: 
Cc: stable@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] iommu/io-pgtable-arm: use inner shareable for Mali LPAE on a non-coherent GPU
Date: Fri,  6 Nov 2026 14:41:48 +0900
Message-ID: <20261106054210.2893230-2-nirvanah@nirvanahyj.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
References: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
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

io-pgtable marks every ARM_MALI_LPAE PTE outer shareable (SH = 2). Outer
shareability is only meaningful when the GPU sits behind a coherent
interconnect, i.e. when the page-table walk is coherent (cfg.coherent_walk,
which panfrost sets from the dma-coherent DT property). The vendor kbase
driver on a non-coherent Exynos 5422 (COHERENCY_NONE) never uses outer
shareable: its PTEs are non-shareable or inner shareable.

On Exynos 5422 (Mali-T628 MP6, ARMv7 LPAE, not IO-coherent) the outer
shareable attribute hangs the whole SoC when a large GPU buffer is first
used under GPU bandwidth load and memory pressure: 0 of 22 runs survived
with SH = 2, 3 of 3 with inner shareable. Non-shareable also avoids the
hang but breaks global atomics between the two core groups, so use inner
shareable for a non-coherent Mali; coherent configurations are unchanged.
Sustained GPU copy bandwidth also rises from 6.3 to 7.7 GB/s.

Tested on Samsung ARTIK 10 (Exynos 5422) with panfrost and Mesa Rusticl:
hang reproducer clean, OpenCL accuracy suite 96/96, no GPU faults over
several days of use.

The analysis, the code and this changelog were produced with Claude
Code (Anthropic), a coding assistant.

Fixes: 7618e4790982 ("iommu/io-pgtable-arm: Improve attribute handling")
Cc: stable@vger.kernel.org
Signed-off-by: Young-Jun Hong <nirvanah@nirvanahyj.com>
---
 drivers/iommu/io-pgtable-arm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 476c0e25631a..0e7b2edd9ca1 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -565,6 +565,13 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
 	 */
 	if (prot & IOMMU_CACHE && data->iop.fmt != ARM_MALI_LPAE)
 		pte |= ARM_LPAE_PTE_SH_IS;
+	else if (data->iop.fmt == ARM_MALI_LPAE && !data->iop.cfg.coherent_walk)
+		/*
+		 * A non-coherent Mali must not mark its accesses outer
+		 * shareable; inner shareable keeps atomics consistent across
+		 * its core groups.
+		 */
+		pte |= ARM_LPAE_PTE_SH_IS;
 	else
 		pte |= ARM_LPAE_PTE_SH_OS;
 
-- 
2.47.3

