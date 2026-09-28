Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C564D9F90
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606257; cv=none; b=kcBx4dn25yI5akbaAnheph7KdnLBgrHNvvxxyngljnqqsj+ISNapSrPFEcSZmEWNeVRfY2nmxcSJlgbqLViJUh1tTCNTBFUj8ecOqqPsNPkXlZEQhCHaD4FZBmrbRMuU7+hgvDI7I8iu5mADHdxLHbkQhUWXFE2SvG1o1qoZ4rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606257; c=relaxed/simple;
	bh=6+0DWiSp+YJ+CXzkCnouIZkDFMyzgmzRkD4nj0FZ+mA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MM7m2FM9FPiuyXtTlYZeWR9eY+0RtKdAEAkBehd7E/I3Ta1PJJ+iqnDolOCMP3HaAkjW1yS3/0CaavftJGTGTV3ac+nZ+k2dbP7Gn8NnoxDL9Ld9gaHJWdH95qqNzOtSUjthc+rWuxwyDSxDLjQjawg0gb9lpdl22wRosn+OfKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WoWqgFa0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiRUpWA4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WoWqgFa0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MiRUpWA4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAHur1682977
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GRnT15XNTnT
	hRrBqENhdYd5BF9k1QXVVKb1KnU2gCEA=; b=WoWqgFa0/f0SN3SxSiWmUYkaO6R
	1oUPDoF+umGUVOzH8Iad152juDLgd09JrFVAoyVqzgKDeuVTc0SofRQLlaq/r2jj
	AZOuJuxqL/LJm6+Ql53rM8Tu1gQ8PVh9S50+ip25xjUGERpRkidq5Lnb+44pGtsj
	zW/v/K9crCbqVwiv6MqJ/1B24qVLQG2E2BSxZmdrMkh7dafVV5239BDB9qj0v9FU
	cnlBFAPlrIcg08lMKPnlQBDW4yxuxvljDet6l/Mr6PXArm2yZ0H3vuaEoffiD1tD
	/P6GAPhY417P4dxn//WksCEIQAQW/58B99QxTOwGltQ5alIzz882n1cq2wQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfks5xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:37:23 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ea4c979030so1714694b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606243; x=1791211043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRnT15XNTnThRrBqENhdYd5BF9k1QXVVKb1KnU2gCEA=;
        b=MiRUpWA4tD4z8imAq1XoQSaQXnGlh9TeDtK+AooAzNKX4zR7uii4rFCQbYUZHTh03e
         lECdebDUH9o2CpjBKFa3LBQ2xlBmapqZQU5S2m+taM7w1nDIPwBoUtd+CZqrfUo6UbE0
         it0TNOUMjlEIMlWLAY4KUVOdh+pu5o4IHa/jtkitEfk4meM6dkELmdX6dwF5XAeZikve
         X9Lnb+dN06+3zaUss3XjumvFxcbvmKTFjqj05iDgf9rdImCEu/7njH5VBl5HcOp/XAbO
         +CH5O7ZfbBCIvyXIMtDSqhiXtUuIyoEprziiC0goyrYGlw7WWVZnY9x1wPA3BA/EMQWA
         tE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606243; x=1791211043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRnT15XNTnThRrBqENhdYd5BF9k1QXVVKb1KnU2gCEA=;
        b=2btwmtC6upQYAmcae2yO49CJfsEnKKy8mBorniHz9y1OUwWtPZnE9pNfgE2E46VcDb
         cVuPR3TxjYddr441yZnOODizh+8U1osrCLWRr9uY3LMGfpPkp8jHFki1JRZP8f4okgbz
         BLo2x4MbyRo9YNR8sB+2CFQg6Mev1Ap03pGukskc7ecxv/DbRYtBxPFq3FGTPFb/cgJH
         1R2N0QitoV1WEOV7c/NyK8QnOK6GQGH2T0tE25+zIdAgROZBjNMJ5QI6olUDMyNFKbcB
         fEp9+ej2xbEy6qKKHdjFlKXE7ERf2uoaPdqqkOyrJiI6MUF5cBy7KEpoCB5FjXRCNqtX
         Vruw==
X-Forwarded-Encrypted: i=1; AKwUvBybiKw19oKQrMBvTfmuQuzqCJasu8MENIaRTcbRNjFOole1wuKRhG64ZFqD8HE1ZGuKjPE6ZOgxOAAKr5g=@vger.kernel.org
X-Gm-Message-State: AFuF++nbjKX1V/sH4sPs29Rz6RPcQb3hebRyRABvwYWSnXzzjFhzlP4j
	uB1IGEhtc3Q9pe6IBK8kAaxgur4GCVO4dfRPvxjdIaDXM9JivGRQRj4tXm61kHFJykTbUJOtFIm
	NT5D2pHIAfVkL94axQixye9jduzhrdcVn0mjT5D31GiyPulT8vmf8NZ8n7pSqdUXBQm6eAV2Xrc
	c=
X-Gm-Gg: AYBFou1pSez8hytzVnB23Gbojel05uWkBYjaCdzanEZvsoxhwA8SoF8F9l21bzI8RjF
	ihH1UpAvu453UKUq0qcTisMgAhxQUqPiP+LGX4vv6BvNcvk6Co+1nGYkRDOaeUOTrNM+2+rsfNS
	Cgw4ow9mffcK3LBzCJ6WeSD4JI86cwnsOInlr8FV+rahbFywxK6LDInlmsh8z2HcohmyZWY6M4g
	7C41Fj1yfndeuUKsz5cZTipaFBMTFybc97W4H1bX1+f56jnDn3LZGSWsJYsvultyl7aTXJj4XrS
	kd5aWl7/PIfet+LRj5nR8KRPM6rdbwBoShyjdZZatbtsjNdm9Qw9NHJ/Gefxd+chBqNSqpY2u0L
	lR8pDHk04QZEw0hzwFTlhLnt0tWBLcGNibXoPWw==
X-Received: by 2002:a05:6808:1495:b0:4cb:f21c:a7a0 with SMTP id 5614622812f47-4d72ac548c1mr15736210b6e.40.1790606242598;
        Mon, 28 Sep 2026 07:37:22 -0700 (PDT)
X-Received: by 2002:a05:6102:c12:b0:7a1:f7d2:e823 with SMTP id ada2fe7eead31-7af1ecf6d75mr5364910137.28.1790605939177;
        Mon, 28 Sep 2026 07:32:19 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc0cddsm4296359a12.14.2026.09.28.07.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:18 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 12/14] iommu/riscv: Prepare interrupt remapping for IRQ bypass
Date: Mon, 28 Sep 2026 16:31:11 +0200
Message-ID: <20260928143113.49838-13-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXy9yuA/Ss9fEH
 tQV0vrgJJtAPjJ802MqnyDphhw0/3HeT01BdBUXgmCikfFtJsrz4M8zYjmAD4JMh6hJsJeTgJhB
 cL/l7mV1taiXuB+07L5aXIarU7TsJ2rAnQk0sbRqVY5/URO9VoLuSoL7F2dwaw0lDWNPuTuY8pG
 FO+FtWZmxJ103AqwiOl1kjPTqyLtH5o6KY2BH599htqBvDaH6AsrA34o5wZvFZUGGVxQD+41dYJ
 z29To+JznyJ2AzRt4hflMmT0K526XV18lC1ZG406/iB4ZQqC+g8gC273gOPNL8plGbv7uJZ0Grw
 j1kisNlHFJbzlIGiCf3gGeltguQ5Kq1zaL5LnZBO4+5eGVM6STpaCqtzQuXPPHmRQ1Ogqxi9lom
 A2Spmp6e6D9q7hwlEYjZiOf4cMQF2aLhj11H11y68UeY4gavDKOCNJkRbr/PQGCWHP/N7jZaIE/
 YNsPd5mz3MqgP7eZUdw==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba7ba3 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=E4clnSanGcVZL-NzkHIA:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: oj_Rb4TwQXzMfgQr_uoXmnfh7O_ALxXY
X-Proofpoint-ORIG-GUID: oj_Rb4TwQXzMfgQr_uoXmnfh7O_ALxXY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXy1MIPHX07K02
 Zbhd+UO1vXX5HKkKh9m1dYEz7FVCeIyLrdzNEjihbsWwkYv2lOLUF5LcAojKXamaw8l84II8bdF
 Bj4n1u2NZDWgXN0tx9nRTBTSvOFR8tI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058

IRQ bypass changes the meaning of an interrupt from host delivery to
delivery through the guest's MSI table. The transition therefore has to
follow the device's current IOMMU domain and must not race with a domain
replacement.

Wire the interrupt-remapping irqdomain into irq_set_vcpu_affinity() and
serialize the callback with MSI-table publication and attachment. Since
one table is shared by every device in the domain, also require all
forwarded interrupts to agree on its owner and address layout.

Leave the hardware operations as stubs so the locking and state-machine
requirements are established before MSI PTE programming is added.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 140 ++++++++++++++++++++++++++++++++-
 drivers/iommu/riscv/iommu.h    |   1 +
 2 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index c5603cb9f258..22da76987c7c 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -11,12 +11,150 @@
 
 #include "iommu.h"
 
+static int riscv_iommu_ir_irq_set_affinity(struct irq_data *data,
+					   const struct cpumask *mask, bool force)
+{
+	if (irqd_is_forwarded_to_vcpu(data))
+		return -EINVAL;
+
+	return irq_chip_set_affinity_parent(data, mask, force);
+}
+
+static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
+				   struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	return -EOPNOTSUPP;
+}
+
+static int riscv_iommu_ir_deactivate(struct riscv_iommu_msi_table *msi_table)
+{
+	return -EOPNOTSUPP;
+}
+
+static int riscv_iommu_ir_update_target(struct riscv_iommu_msi_table *msi_table,
+					struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	return -EOPNOTSUPP;
+}
+
+static int riscv_iommu_ir_irq_set_vcpu_affinity_locked(struct irq_data *data,
+						       struct riscv_iommu_info *info,
+						       struct riscv_iommu_ir_vcpu_info *vcpu_info,
+						       struct riscv_iommu_msi_table *msi_table)
+{
+	int ret;
+
+	if (!vcpu_info) {
+		if (WARN_ON_ONCE(!msi_table->nr_forwarded_irqs || !info->nr_forwarded_irqs))
+			return -EINVAL;
+
+		if (msi_table->nr_forwarded_irqs == 1) {
+			ret = riscv_iommu_ir_deactivate(msi_table);
+			if (ret)
+				return ret;
+		}
+
+		msi_table->nr_forwarded_irqs--;
+		info->nr_forwarded_irqs--;
+		irqd_clr_forwarded_to_vcpu(data);
+
+		if (!msi_table->nr_forwarded_irqs) {
+			msi_table->owner = NULL;
+			msi_table->msi_addr_mask = 0;
+			msi_table->msi_addr_pattern = 0;
+		}
+
+		return 0;
+	}
+
+	if (!msi_table->nr_forwarded_irqs) {
+		if (vcpu_info->cmd == RISCV_IOMMU_IR_UPDATE_TARGET ||
+		    irqd_is_forwarded_to_vcpu(data))
+			return -EINVAL;
+
+		ret = riscv_iommu_ir_activate(msi_table, vcpu_info);
+		if (ret)
+			return ret;
+
+		msi_table->nr_forwarded_irqs++;
+		info->nr_forwarded_irqs++;
+		irqd_set_forwarded_to_vcpu(data);
+
+		return 0;
+	}
+
+	if (msi_table->owner != vcpu_info->owner ||
+	    msi_table->msi_addr_mask != vcpu_info->msi_addr_mask ||
+	    msi_table->msi_addr_pattern != vcpu_info->msi_addr_pattern)
+		return -EOPNOTSUPP;
+
+	if (vcpu_info->cmd == RISCV_IOMMU_IR_FORWARD) {
+		if (!irqd_is_forwarded_to_vcpu(data)) {
+			msi_table->nr_forwarded_irqs++;
+			info->nr_forwarded_irqs++;
+			irqd_set_forwarded_to_vcpu(data);
+		}
+		return 0;
+	}
+
+	return riscv_iommu_ir_update_target(msi_table, vcpu_info);
+}
+
+static int riscv_iommu_ir_irq_set_vcpu_affinity(struct irq_data *data, void *arg)
+{
+	struct riscv_iommu_ir_vcpu_info *vcpu_info = arg;
+	struct riscv_iommu_msi_table *msi_table;
+	struct riscv_iommu_info *info;
+	struct msi_desc *desc;
+	struct device *dev;
+	int ret;
+
+	if (!vcpu_info && !irqd_is_forwarded_to_vcpu(data))
+		return 0;
+
+	if (vcpu_info && vcpu_info->cmd != RISCV_IOMMU_IR_FORWARD &&
+	    (vcpu_info->cmd != RISCV_IOMMU_IR_UPDATE_TARGET || !irqd_is_forwarded_to_vcpu(data)))
+		return -EINVAL;
+
+	desc = irq_data_get_msi_desc(data);
+	if (WARN_ON_ONCE(!desc))
+		return -EINVAL;
+
+	dev = msi_desc_to_dev(desc);
+	info = dev_iommu_priv_get(dev);
+	if (WARN_ON_ONCE(!info))
+		return -EINVAL;
+
+	scoped_guard(rcu) {
+		/*
+		 * RCU keeps the table alive, but the device may switch domains before
+		 * the table is locked. Recheck the association under the lock.
+		 */
+		for (;;) {
+			msi_table = riscv_iommu_msi_table_rcu(info);
+			if (!msi_table || !msi_table->root)
+				return -EOPNOTSUPP;
+
+			raw_spin_lock(&msi_table->lock);
+			if (msi_table == riscv_iommu_msi_table_rcu(info))
+				break;
+			raw_spin_unlock(&msi_table->lock);
+		}
+	}
+
+	ret = riscv_iommu_ir_irq_set_vcpu_affinity_locked(data, info, vcpu_info, msi_table);
+	raw_spin_unlock(&msi_table->lock);
+
+	return ret;
+}
+
 static struct irq_chip riscv_iommu_ir_irq_chip = {
 	.name			= "IOMMU-IR",
 	.irq_ack		= irq_chip_ack_parent,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
-	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.irq_set_affinity	= riscv_iommu_ir_irq_set_affinity,
+	.irq_set_vcpu_affinity	= riscv_iommu_ir_irq_set_vcpu_affinity,
 };
 
 static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index ed973979d795..a42f0b6a88d4 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -82,6 +82,7 @@ struct riscv_iommu_msi_table {
 	struct riscv_iommu_msipte *root;
 	u64 msi_addr_mask;
 	u64 msi_addr_pattern;
+	const void *owner;
 };
 
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
-- 
2.43.0

