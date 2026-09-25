Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B4E49EC63
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349450; cv=none; b=GimDeMJl/NmE1soCahve8H/G75NOzBVV/HXafz2Q9XhDPy/WAXOv0djgaR/0EYPRTNqVokYwvIH5t7+zb0MyltcogxpM39O3yzXGO20WwBxLGRMRPZwJGy5mH5jznXoiYKCrSLhQNf3Q8G0f6VOLchkHMuEQw+idIWKHsvPWTw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349450; c=relaxed/simple;
	bh=i3LJkXJkMPMG/BZ2K11gluxnu+R1mXh9KW7oECd5B8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlw69oedfvHilQgwAj1SQiuz1OI7DBziaOyBCOftNH62btNEF4h6MtvA8MkZsS1YmY7INeVPJIW/nfZU1sb+hw1uSIsEi5R1dmzvsIsX6urUHq8gWAdfiZqnGkp9A7V9BOnCgjHE3C0oJ0KccIABcgtRkdVaqiiGMU+fhpYa/a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RsFJCofP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LpZBeFzB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RsFJCofP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpZBeFzB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBVFDX427143
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uT2Prej1vk3
	zX/S7OPlnxWtUB4o0ge4FHSI3+fpimn0=; b=RsFJCofP6D7YELjwGy6lL6vLqOr
	6OBWBvtxish1i0NL63QEjXLIGylTuxJ+dc3gKsZlgENKFQI5AMtQ9ecDBRTcSmsn
	U+txaH85MicWmrbbZwElQWD7qD+u7SQC3YrOrpcEdNSLKgCpohDnl8gzRFv9ddHa
	1ZuT8PIj/3T15h8jIbqJofjo2CLmJV5rDUO7jyriGf6xsc0WRNoWKUfsz/yQiBLJ
	ds2DZYtPgrc4kGO8Bbe1sgqZYf+orTGB+KqKr3MD3Q5r4pLRQNHJJZOp6OmGfyTb
	+ZdyYyanVOctpilJLKOyP5gUwYEL6abQD4neXLC9NM4grS0HcsIRkXTW82g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e8sg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78d25a8ff32so232943137.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349444; x=1790954244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uT2Prej1vk3zX/S7OPlnxWtUB4o0ge4FHSI3+fpimn0=;
        b=LpZBeFzBObQrcZiWSxftSWA1rG7rUhIqWotQ9DgzX1qJxngvrcFBSqIaEvHQ728ZVy
         rdWvheeohA0cUqraR0Xt0+B2AjtAvNNdiiJbMVKJ2eS7Ezw92HutrAXVcud8p6CyabFH
         /5SYwHLGR0dSyzBVhrp/QcWNkDQKzaTzMCfULi9RTOZmexRuw8kBGawRSSn5ZV5m6UCy
         yV2hNWgtaiGXkgRAI/rgb1QnZFLdFD4lqbWw1yS7FlrZCu+KWR6l7K5i1FvwZHLu+fx9
         dMJlb4z7jEPr3NguFiG5tqY4kopvou9RTD6Pv51CymRq4N6ev05vztxh0Q01Cz8qwhdV
         KBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349444; x=1790954244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uT2Prej1vk3zX/S7OPlnxWtUB4o0ge4FHSI3+fpimn0=;
        b=Z4INihF7CapwqcsG4eRf5tq3g2XeaAqxgILIEu9s+Uqe11LVM85Uc7498C0TGpqP/U
         gt7mr8b1zhM/U2wcdjrl7IQ+ltkYup9T6m4g7Mmo7uKXkp480r6EvNuGAfNHSjbhKgs0
         Ne55l2jhdg0gEIVujXhbXc527d3686kD/Pq7I6+0+reFrYwRUhDBDvt2TwOKqDpt3lF3
         HD7k4Ylhv+rFklh462amVRu4F6znye6AYkfwaP27mf2YIjonvxoHquroyPMlIudX7tEC
         iZ0yJtI5RPv/koRgC9k86qej9YHiaDVRLrbC4nMmVpkzigbxDP4CkyMy7LcJRpfVWprp
         DOBg==
X-Gm-Message-State: AFuF++m5DRCt1iO3+4YSlHOofwKwsNxtDA1KVOPl1otutyAt1d1xe8vc
	a2GbTClQAJW7em3ZVfQiCDpy8r3VBF2Lcq+s+8dFdsdKu3VAZXFVy8sb4CsWP6gmgzNkjIAgRKl
	v3JHRLKD76gxTKtrkBYObV7nwLchGPrQOsjGVAshH8a0HPDy9Bs38Lzg73eRKJHAI0is=
X-Gm-Gg: AYBFou3yNZSGwt4c+PwmjyAFuBTFqRTIsfYiZzyvIYKfArr17QgPv3cGwWR8btVXm9Q
	vHkWLZLjtFAQwXNKRH9E739hqIQZJudCpS5q8E2scdti7eu/hD+zVdldqV7DrjI1SHpKpRuBVI9
	CnCjbfP0dkq8Tr1pEBIn861PJfQ/FdeP+pB+0QCeif5jULPy0KmauGEKNo6gqoNX7nl/ASxRXUd
	PrA8Gmivjat1kOZcSQKlvoeBpYUqnvwzLlPOSIB3gMb1HYYqdShUSAW3HsjpYXVSDbPYQdMacIM
	Yx69P6J4O4H2zVO3tQGEMc30Q+GlShI2zwvbQTLVAkNGa3ba49Sb/3mqGMZG6COHo+gvo+GZhDy
	kVEXoHfNFy4882+uwOw98FCLiltJuPKW1hD8KZg==
X-Received: by 2002:a05:6102:4b14:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7af1cba3036mr2420138137.11.1790349444070;
        Fri, 25 Sep 2026 08:17:24 -0700 (PDT)
X-Received: by 2002:a05:6102:4b14:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7af1cba3036mr2420112137.11.1790349443361;
        Fri, 25 Sep 2026 08:17:23 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm63738805e9.13.2026.09.25.08.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:22 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 11/16] irqchip/riscv-imsic: Support IOMMU MSI address lists
Date: Fri, 25 Sep 2026 17:16:54 +0200
Message-ID: <20260925151659.419512-12-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX+6ACe+GWxn8r
 zEzBq692ikdVUf81IUEc/cafwAi5KaVgstTKIwKe1fCwM6g5cbEAfuxVrDxf7NQeqrr+7GB9mG0
 6dFXzW9mEXTopEp3SPpdmCq1VJMSZ+Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXx5ojA9o9ioC4
 1POwXAzdgf4vY2jHclSsoeDkEhgGGKsMZf1HmpUcbdskYIfu2kQmaGqINc1HXnTc4dEuws/UdOW
 +QsumLJUBuUoItnxevSVTAxvEkPoAYmXzPlADFzgq9D97ocl5tgJVHU9JoXUUT0zQwIz1gnUcy3
 1YbhF+m/smW1oPpxIAGjTj9ibWxDBQ6OiXJrR+4MdsAUlX+VzDBXChlNlkAiq450ldOG16YjHdb
 xYxJGgs4vbh7CjcUkauM8Ist9iUrjzpi3vKrVvLgzJ0c8tVWus/hHg1ffXOVtuJ8JBIJwomDZwr
 Ax/QgUtWsQ+k7B+jEIGAddOvgCIdJ98ZspPpAmRUD7fL6iP6c2VACtNyTJMNpQJrnevWkl5YgbU
 bb4KughM3B2zrCgKrRgpZ1s1urC76PadPD12k5x8bG6/VXYrH83P1CwafNt/FNiuNDkp4irJd2b
 2pNNU1ewY98y2uHQvOQ==
X-Proofpoint-GUID: dWxG-54IiOaU23PnLIq0Bh6J-_3R4ue4
X-Proofpoint-ORIG-GUID: dWxG-54IiOaU23PnLIq0Bh6J-_3R4ue4
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab69085 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=jAyyop91dzRkNHH0oPsA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

RISC-V IOMMU host interrupt remapping maps every possible host IMSIC
target into one contiguous IOVA range. MSI message composition therefore
needs each target's position within that range.

Prepare the complete IMSIC address list while allocating an IRQ. The
list is guaranteed to exist after IMSIC state initialization. The IOMMU
backend maps the pages and caches the contiguous base IOVA in the MSI
descriptor when translation is needed.

When the descriptor has an IOMMU MSI mapping, use the selected logical
CPU directly as the page index within the IOVA range. Use the same path
for initial composition and affinity updates. A zero iommu_msi_shift
means no MSI address translation is required, so keep physical messages.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/irqchip/Kconfig                    |  1 +
 drivers/irqchip/irq-riscv-imsic-platform.c | 24 +++++++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..a038e1121be3 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -651,6 +651,7 @@ config RISCV_IMSIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
 	select GENERIC_MSI_IRQ
+	select IRQ_MSI_IOMMU
 	select IRQ_MSI_LIB
 
 config RISCV_RPMI_SYSMSI
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 643c8e459611..ddb2bb570cdc 100644
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
@@ -79,6 +82,12 @@ static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_ms
 	if (WARN_ON(!imsic_cpu_page_phys(vec->cpu, 0, &msi_addr)))
 		return;
 
+	/* A zero shift means no IOMMU MSI mapping is needed. */
+	if (desc->iommu_msi_shift) {
+		msi_addr = (desc->iommu_msi_iova << desc->iommu_msi_shift) +
+			   vec->cpu * IMSIC_MMIO_PAGE_SZ;
+	}
+
 	msg->address_hi = upper_32_bits(msi_addr);
 	msg->address_lo = lower_32_bits(msi_addr);
 	msg->data = vec->local_id;
@@ -86,7 +95,7 @@ static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_ms
 
 static void imsic_irq_compose_msg(struct irq_data *d, struct msi_msg *msg)
 {
-	imsic_irq_compose_vector_msg(irq_data_get_irq_chip_data(d), msg);
+	imsic_irq_compose_vector_msg(d, irq_data_get_irq_chip_data(d), msg);
 }
 
 #ifdef CONFIG_SMP
@@ -94,7 +103,7 @@ static void imsic_msi_update_msg(struct irq_data *d, struct imsic_vector *vec)
 {
 	struct msi_msg msg = { };
 
-	imsic_irq_compose_vector_msg(vec, &msg);
+	imsic_irq_compose_vector_msg(d, vec, &msg);
 	irq_data_get_irq_chip(d)->irq_write_msi_msg(d, &msg);
 }
 
@@ -225,7 +234,9 @@ static struct irq_chip imsic_irq_base_chip = {
 static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				  unsigned int nr_irqs, void *args)
 {
+	msi_alloc_info_t *info = args;
 	struct imsic_vector *vec;
+	int ret;
 
 	/* Multi-MSI is not supported yet. */
 	if (nr_irqs > 1)
@@ -235,6 +246,13 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	if (!vec)
 		return -ENOSPC;
 
+	ret = iommu_dma_prepare_msi_list(info->desc, imsic->msi_pa_list,
+					 num_possible_cpus(), IMSIC_MMIO_PAGE_SZ);
+	if (ret) {
+		imsic_vector_free(vec);
+		return ret;
+	}
+
 	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
 			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
-- 
2.43.0

