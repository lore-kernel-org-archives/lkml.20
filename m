Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A854F7992
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188410; cv=none; b=CZ4rFcoxajyX529ZaGDv+3kgF1xHrn1fM2JgEY1sDnLhoFwP8hJnqP3oA0TCDGiQBhu4PsraPW7Wb9zuqVYoxT4yo8mzaIKLbrgxb8WeSI5BwkiWLw68Kb5Xw9fc8T6MpeKR6YOhWHLbcJT+wwErbmvnKOd7DPmSMJMxHkff1rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188410; c=relaxed/simple;
	bh=3jvJd+GEBNht0nDRRE4iznUY8ZX7j8j8n4bxWEBNvcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGmvfIUiJhjbdqaeRo4s9YJvhMNs+oC0M8c0ggdSKVW65sWQEpkckRL6NtRdAfEHppEWCUJC73tGO4verakgxKuUElIaPSbJzPKd3DfaqiR6qQ1yDO9gsG3vAGMYVcLWQSyR9Oq0co42gE77YtGdlCMISaaN6bV49AqAH4BZjWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CsK3lQJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iA/6Z6u2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsK3lQJz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iA/6Z6u2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETbea4049766
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zw80Tv2AUkE
	oZUkCffPmU+BFxb4TWxnn8dB/Ukvaur0=; b=CsK3lQJzlxavD7umb0ByOSCa0SR
	ldDgrKy2rSMpFNNJdpqohaKCBe/j1FFspmlqDr9c4SDN3yz9FnCU48t3svhGjq/7
	QQhz7VGRZwlVGMeWjUKaLKB32ec/aWSBLfJcsTpEklMosjQwacHtQDTjoA7eEmDv
	OrBqWqvh/kai5MStXsfsyPKnJd/1cdrrOmYwsUgq6VKF6P5WQYQ7rPg5vc1/RCCv
	A52w20So4+kub6OZ/qQR0tPrRPQuSlIrAWb/BFvw6w4GDv8r73hzv46fdgviI+WG
	nfhB+rpY7Gn7WeuJnXo+KJ9Hp3ZQsPQMo9U52Ufz3q9eAKDmus0OQ/Jy53Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jghfyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so612737485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188406; x=1788793206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zw80Tv2AUkEoZUkCffPmU+BFxb4TWxnn8dB/Ukvaur0=;
        b=iA/6Z6u2lX28Ec6GNlneymw1hkMM2Sy9i+zkz5QLTILlbwWxrZXbmtlqmclsM6t5Ip
         AYF26pC7YI8llsLignD7AAujwh3mIv/Zo/pTyp+nJ/5f0sIZlH6GSgVHqwRoIa45K/jB
         3ObEushT8E8qUHrr+c559lZigLZQmnUlodvcLW0w0a8rUpTZv7QZwLPSwd1/bmpfwmKF
         5JpQdPUTou5Wo1Ra7cMEkMMx74Wds7xhLi1BPr97MyS+vQ2GgFwEyiyw/+W0S/0BI8aB
         Xd7F6gkE5jBPWyK5U8wp0MXxGF1SSodq6pFTsbj5Avcvqj8Tl/mqLCPGqbFONt3GwpLW
         255A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188406; x=1788793206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zw80Tv2AUkEoZUkCffPmU+BFxb4TWxnn8dB/Ukvaur0=;
        b=Ptl2bbNb++rA5shaLOd17LtOlKc/jSj966SjfyLeYwS4T5QXYLtXuxUrf7A9ZePRJe
         +tWHZ13vrao8PqrhIoICxiz8XMZrlQKObqYIa8gVJu1PPb0BJCpjYz70PXo70ska6lOT
         TIqefLe18SUFVP/+NvdiH7TZD/PhPGFisQW7Sx1C97UcWIwN3Glzi0ersGWfDMvv6AQC
         CDPBg3CFg22FKruBDhM56Cvq+NMVvVwBTASgm8sVB6OFEUukts6x+qP49viqjmVvbYTb
         y0rw8reI8rnndQbDlLLGunlmGh1QBwGlG/ZVykbLkSpmz3pEvdbIl3EpwDjCeyNn4plC
         GQ+Q==
X-Gm-Message-State: AFuF++ldPHMpxo+HDVBHj+703r9WMp0mr+3kpk5MHUOsNkVheHl6GqBr
	ajhANv0SAjoXw6BaE/O9JKpeFJ3qWlrj0o0KiJFYnbWn7IOEg9J++/XBLxPCfK8J5miz6MqnQbL
	fAexRCRMNucq3N1sFzlnFVtyPLZNyyYMM87eCkZY8oqLFpvuhI3PILNXqVcazxOzsgDQ=
X-Gm-Gg: AR+sD10h+EqvQxy2nBiwIFwgNJzpqAj6DEL2a1AifnuMlCa35j2iIcRkg/qkpgsdPRE
	WCwpFxG6wPRxBlQYdee19qWqkH4wfxdIJv8V7DS7IMr4Wfch/p5HyeutAXBF48kVigYB4XNtE8p
	PU1NQrrAEptI+Zlleu7BjlqVpmJwxlZsJKO8nu1JZUnHVJ+7aLikZVLyyA75hpw7JFYKnbnEDkQ
	+7gXW37u+lYm2kGlf8qIm0+TUkgBd/bCpe/buUq4bZ7xUSMU6qqnDJEqYgAZIK0YiU/bCfOH30N
	dJV7IcujNeuE873R9upFjTPifsylWp2UhruBg/M0Now6V8rFJxnVsSCBdxBk9Zv1r1mr/zuxb6F
	l9HAfnI7lAOIB8toeZCZKhx2zzi5knLJe+qc=
X-Received: by 2002:a05:620a:7002:b0:936:e18d:763d with SMTP id af79cd13be357-939137af523mr2744029285a.8.1788188406031;
        Mon, 31 Aug 2026 08:00:06 -0700 (PDT)
X-Received: by 2002:a05:620a:7002:b0:936:e18d:763d with SMTP id af79cd13be357-939137af523mr2744010585a.8.1788188405326;
        Mon, 31 Aug 2026 08:00:05 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dcaf61sm272743545e9.4.2026.08.31.08.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:04 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 12/17] irqchip/riscv-imsic: Support IOMMU MSI address lists
Date: Mon, 31 Aug 2026 16:59:38 +0200
Message-ID: <20260831145943.313726-13-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r8Hp6k9tDeJN0b1nalRrfBIVFyy49NLY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX8D2wzfVD73HJ
 JyfFcPJ4Z+tx4/EIpDg6ymRLxe2ntGjkccMWtlbqps5PSKM2v7vZgFBvPAR+XOhQi/S9mdpoQvX
 fzKZAPisCxtpvZMs0Mwrg6kNN1a9Nc8=
X-Proofpoint-ORIG-GUID: r8Hp6k9tDeJN0b1nalRrfBIVFyy49NLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX4ABlyOrQuvLU
 yZUBevi1qs1nSNHLcU3RYT4zuM1EhVgadz3SUndN5o0uW3B1Ivm0JzGPnrOVO8bATFXHQ3uC4i3
 iKMUYWawwejEf2WCKUWE7gd5iQIFFROjhE9G8dq8IWZfzMTotBmTIDxFu7gdquZOCPedf5Fh9cq
 XDPU+ar7NUj/em/DS206GeI/eC96+Iic28mzmRopinuMfkBLpH7M7PaigV2BrgZ/uBYxWoBqXRb
 2KtBHkD+Ia8h2ZAHTHPeJiLEoQWMLkn21Syj3CK9h77PsAWKy95GIWurd1kdioUVYKyBgWpN/he
 Ohw3iWubwmInMh/Z5iMpTKVL8kf4oH8WV66L17TwgeTKm1TMCrd1978JVHJNHtJCmNMjlzUNhvh
 Ed823Gcu0O0cqIDYP/SRQh93uLXMn1IepAtFGkMA2IQxKkmMbyVFMYfL1y7eA1hMcmJrVBAK0eG
 4iGbiloGmsWqSZjJtwQ==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a9596f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jAyyop91dzRkNHH0oPsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

RISC-V IOMMU host interrupt remapping maps every possible host IMSIC
target into one contiguous IOVA range. MSI message composition therefore
needs each target's position within that range.

When the S-mode IMSIC address list is available, prepare the complete
list while allocating an IRQ. This allows the IOMMU backend to map the
pages and cache the contiguous base IOVA in the MSI descriptor. Skip the
optional preparation when no list is available, allowing devices which
do not need IOMMU MSI translation to keep using physical MSI messages.

When the descriptor has an IOMMU MSI mapping, use the selected logical
CPU directly as the page index within the IOVA range. Use the same path
for initial composition and affinity updates. Messages remain physical
when no IOMMU MSI mapping is required.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/irqchip/Kconfig                    |  1 +
 drivers/irqchip/irq-riscv-imsic-platform.c | 25 +++++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 42f2278a702d..c7cda52b21eb 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -656,6 +656,7 @@ config RISCV_IMSIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
 	select GENERIC_MSI_IRQ
+	select IRQ_MSI_IOMMU
 	select IRQ_MSI_LIB
 
 config RISCV_RPMI_SYSMSI
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 643c8e459611..6e26a31f7503 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -10,6 +10,7 @@
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iommu.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
@@ -69,8 +70,10 @@ static void imsic_irq_ack(struct irq_data *d)
 	irq_move_irq(d);
 }
 
-static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_msg *msg)
+static void imsic_irq_compose_vector_msg(struct irq_data *d, struct imsic_vector *vec,
+					 struct msi_msg *msg)
 {
+	struct msi_desc *desc = irq_data_get_msi_desc(d);
 	phys_addr_t msi_addr;
 
 	if (WARN_ON(!vec))
@@ -79,6 +82,11 @@ static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_ms
 	if (WARN_ON(!imsic_cpu_page_phys(vec->cpu, 0, &msi_addr)))
 		return;
 
+	if (desc->iommu_msi_shift) {
+		msi_addr = (desc->iommu_msi_iova << desc->iommu_msi_shift) +
+			   vec->cpu * IMSIC_MMIO_PAGE_SZ;
+	}
+
 	msg->address_hi = upper_32_bits(msi_addr);
 	msg->address_lo = lower_32_bits(msi_addr);
 	msg->data = vec->local_id;
@@ -86,7 +94,7 @@ static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_ms
 
 static void imsic_irq_compose_msg(struct irq_data *d, struct msi_msg *msg)
 {
-	imsic_irq_compose_vector_msg(irq_data_get_irq_chip_data(d), msg);
+	imsic_irq_compose_vector_msg(d, irq_data_get_irq_chip_data(d), msg);
 }
 
 #ifdef CONFIG_SMP
@@ -94,7 +102,7 @@ static void imsic_msi_update_msg(struct irq_data *d, struct imsic_vector *vec)
 {
 	struct msi_msg msg = { };
 
-	imsic_irq_compose_vector_msg(vec, &msg);
+	imsic_irq_compose_vector_msg(d, vec, &msg);
 	irq_data_get_irq_chip(d)->irq_write_msi_msg(d, &msg);
 }
 
@@ -225,7 +233,9 @@ static struct irq_chip imsic_irq_base_chip = {
 static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				  unsigned int nr_irqs, void *args)
 {
+	msi_alloc_info_t *info = args;
 	struct imsic_vector *vec;
+	int ret;
 
 	/* Multi-MSI is not supported yet. */
 	if (nr_irqs > 1)
@@ -235,6 +245,15 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	if (!vec)
 		return -ENOSPC;
 
+	if (imsic->smode_msi_pa) {
+		ret = iommu_dma_prepare_msi_list(info->desc, imsic->smode_msi_pa,
+						 num_possible_cpus(), IMSIC_MMIO_PAGE_SZ);
+		if (ret) {
+			imsic_vector_free(vec);
+			return ret;
+		}
+	}
+
 	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
 			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
-- 
2.43.0

