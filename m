Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728B64DE72F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606265; cv=none; b=WDlv8wpbCuWuZtMwL8Ho8BkpSxDH1qYfj15fjgH0rRgJ/AQgx5kzwM5hTuY7YKjhkRj/SWy/KafIAE6INeVp5EltELwpC7gqO3ZqxPz901g8qH3TZBOFbzLXSwMn4suPqujQT/b8wC/26lNroPpDqovW8ONVPLwjegU/2d3X7zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606265; c=relaxed/simple;
	bh=1mRl07ST/iJhykaW3wF3eXHlnR3DTJeLAgQFLYXJDnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oo1XML33VEMHqIQzyVvCnWDc/Wm+3+v/4ON3omqSmhZ/G4C+OMzmYGJna8H5/0kjCigt0Ogxh0jU9t+qq244SMQXzNpnwpptlGB5CWpvhnUSDzsikjKS0z///9JhT66vsItiMG87pReXOq6wlfTDkAeZP7PYf3Yo9O+PkNeUBF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ninvScti; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObvlEDAh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ninvScti";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObvlEDAh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAIf8481794
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jvlI2T8w+64
	hQrpum98oA1DnDUfoowHi2+WuxN0638E=; b=ninvSctiq/nMCrPjojeVd+h7piV
	MkS2L0yVYz80LV5d/CefxgMB16lyAZhxotakiwoBSpDK+1NKDQLiDyBCcl6JhcL5
	0cVwUZ2Lgk7ZKuCNfd/Dp/nJAWjYmR7S2mmbcrUcZsprSqQM5fj+HuvbAOXn3x45
	ALQZ2QnrTVXvEtxkzgwL8rVJg/Y9I0Cbzb+LPsN6OrFjDBC8cbcVETgQa/t6y5wX
	wsF8RTOlSs7uYGLAvc3y8W4UF98GAfijitszPClypIQKEN0ib4RvALb9cZ0sxP1H
	/FygaS5wZHxSsf47sjUpIdUEtJEP/+158ZrYE6ERboIsnX1Nb8d6xOMa1wQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt11ve9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:37:32 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438fef603cso6024322c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606251; x=1791211051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvlI2T8w+64hQrpum98oA1DnDUfoowHi2+WuxN0638E=;
        b=ObvlEDAhixnsuc+Sv+Mq8kNWDpKtajj88krUGr2LlIJR0N7Y5Poq1vgNpzeWp+5QPT
         6ARGVlbk8oc+NoV+fdu/bGdT4+d17ZSB4GpcOx0wOd8acjuKcotZM+n3F4nQ2vcpzMNu
         LkxMslZoVvDwUZiv0x55/2DBBTO6SCVtdsWKcOz4NAkFwZoVfK1h6AIqbkKyslagq/0U
         Ec8ZHpONMAC7516UcJXM2BmZRhB+lLrn4xz1K2f/ddU0i/5RhGRz0eSITCE82AFFAicT
         x5X99c3A8+I8Nrb0qUo+dEcllptJl2fKKX/2q6weO1/PghbRxCC/t0o68TcdhTwj2Lg8
         8Z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606251; x=1791211051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvlI2T8w+64hQrpum98oA1DnDUfoowHi2+WuxN0638E=;
        b=jIG0evEd4YwLRC9ndCUm/ztCvN2J4FElcfQlbUzEGycW1w1tAI6sqwgwWGzFq9lDcB
         sEDIOAhcsXW8KP70heUji6XBYQrFboyfv53H4RJ4EKZx/A08LGyrt8LEAVfs84+kIUYU
         cqQp4m7yORSSWD4sFlewb4NON13Yu+I96P9VFu/L0rLL/XrnxqwdOGGdUVKj4JOxrD53
         KQYYD7x3ZCrx/Hhi1yKOuLDX/kJsT/af3oPhg5AbnTY2YqgWBXsQdY3860AyLipBE9i7
         zAYaiH2aQBgDZvoK2OlTGJbhDVmPbYftyPIDhcs815jsfIKOOI2GCKXZsFe5jzncLZQQ
         dS7A==
X-Forwarded-Encrypted: i=1; AKwUvBxsbeiUk6D8AA+a4p60/7zH1RaBiWB/bMnieUMOyUNeNfuwb0CuWYWkckudWmovU4nEYXh50pSeNVu4g1c=@vger.kernel.org
X-Gm-Message-State: AFuF++mQk8BHrjLrDyiXkBr4TvAaplRhAL4AopRYCZnptIgTVD7iKxcV
	+o6aA1ig8owJo1daYLTYh58PrXjtD5QL20t1QUlG3lVaisj8aM8796FaNQVs9dJUtIYEuC0Ujos
	5pqCs7CKfENENedHQ6nyjSNApgt+S2/V8HsHaB30G6Azm2W+B2mWF6NpI4O5XiMmLXR3wVM7Xtg
	U=
X-Gm-Gg: AYBFou18qN16hQlDx1wtukxwzCCzL0eUJZmivmRXUcvjTKdsnX9ohf07ntE0+RdZgTf
	93xFEb2BxbAMHWVrhi2csxRGCZK6QxMtWnuz9b9RRv4osdhR8xINeJvubaKyJzhLRmYJDgGWXyC
	8hWU+DngYIkD6ml5OU39Rs+hHkjGGzR+k+BXBijFXq5VxNjElFFFZvT4zCre6BiYk1vJbiR6clt
	AaBHRHFjyphmVmoZu3+jY56iXfPZ/bO1vaHfszIaFoSwMGhT8H+5Rin3n8+ZHugpgT+RngfEA7J
	+hy3Yq+IJeWRB13dfkEnLJut91xMRYEefueoWhQsinJXLFOPP5eXPy+Z0SM6yzaT0rn9qags5I3
	4HkQag/y6wzh/brhgge2fDSR9GUUq2In+UFpraw==
X-Received: by 2002:a05:701b:4205:20b0:144:c12b:4e35 with SMTP id a92af1059eb24-146d077b35bmr10326137c88.42.1790606249532;
        Mon, 28 Sep 2026 07:37:29 -0700 (PDT)
X-Received: by 2002:a05:6102:869c:10b0:7af:81dd:a9d3 with SMTP id ada2fe7eead31-7af81ddbe26mr2436839137.29.1790605898562;
        Mon, 28 Sep 2026 07:31:38 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae76ad030sm484086466b.36.2026.09.28.07.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:37 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 03/14] iommu/riscv: Serialize MSI table publication with domain attachment
Date: Mon, 28 Sep 2026 16:31:02 +0200
Message-ID: <20260928143113.49838-4-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXwred83mvyArO
 ihw4VyvdD0DIh6IwSXbVnAahRh6YKwiUGEn6g4AJMIX4SNXSe0EjK+nTdfS4KJyVmpPNgwPFsEL
 RH0lZ3T7ZNVAyPj/KuuEaP4g65MCsWSgMzpF7mjp8dUA6rUdhKryxfXGUf5jda5wzOoH3FpTNDS
 qxVTV36MZjcXrSUdJMHBVqVUcv/brXGDjJ9MYfcT/CJaS7GNioOvOqVEtyBgf58kAtuAcc32a0W
 msj6sudM39ITrkQXK+2T+2xwNi0Ppd2EFU3edw77CFG1fhacne/J+bwHWLLwC26plF3GoLP1gCy
 FMc8Ii8aoBM5TAtVYaOuiD6d2wzHvyDRGOGmStDJPR3iLKjW4Ki3PbAK4yZkaInHYJpx3e1Fri1
 Jv92luhyIFGtbEp+7VwTxqYnH/yLGV8nen3HofV82rhA146QTufNgO6V4qP4san2qqrxd76kwE8
 bRrdd+TgyS3ba4oMy5g==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba7bac cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=BJuWs42claz3fuW2R7YA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: -9xKWAuMVUS8I627Q_O1x2lL6mutq1b7
X-Proofpoint-GUID: -9xKWAuMVUS8I627Q_O1x2lL6mutq1b7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX9Nc/sda5MWhP
 iU8l6xKPOKlJqUB+IHdBZB3EIJNDBJCt4CvIQdM7b/kS6NERLy7dTKEMtY9DhCJ1UO8d4ihieLy
 MZcA5G3F9vQPodh8N/XVg8bdbH8qj2c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058

DMA mappings update entries behind the page-table root installed in each
attached device context. The existing bond and barrier protocol ensures
that attachment either observes a completed page-table update or is
included in its IOTLB invalidation.

MSI forwarding also changes whether the MSI page-table configuration is
installed in each device context. The first forwarded interrupt
publishes the configuration to all devices bonded to the domain, while
the last removes it. These domain-wide updates can run concurrently with
attachment because devices in different IOMMU groups have different
group mutexes.

Serialize attachment to domains with MSI tables against forwarding state
and device-context updates. During domain replacement, lock both old and
new MSI tables because either domain may process forwarding changes for
other attached devices while this device moves. This also prevents an
old-domain RCU walk from overwriting the newly installed device context.

Order the locks by address to prevent opposite-direction replacements
from deadlocking. Domains without MSI tables continue to use only the
bond lock for list updates.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 64 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  2 ++
 2 files changed, 66 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 09ec8c3e4a72..57f2884dec42 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -874,6 +874,60 @@ struct riscv_iommu_info {
 	struct riscv_iommu_domain *domain;
 };
 
+static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
+{
+	struct riscv_iommu_domain *domain;
+
+	if (!iommu_domain || !(iommu_domain->type & __IOMMU_DOMAIN_PAGING))
+		return NULL;
+
+	domain = iommu_domain_to_riscv(iommu_domain);
+	if (!domain->msi_table.nr_ptes)
+		return NULL;
+
+	return &domain->msi_table;
+}
+
+static unsigned long riscv_iommu_msi_tables_lock(struct iommu_domain *domain1,
+						 struct iommu_domain *domain2)
+{
+	struct riscv_iommu_msi_table *first = riscv_iommu_domain_msi_table(domain1);
+	struct riscv_iommu_msi_table *second = riscv_iommu_domain_msi_table(domain2);
+	unsigned long flags = 0;
+
+	/* Address order is stable when the domains reverse roles. */
+	if (!first || (second && first > second))
+		swap(first, second);
+
+	if (!first)
+		return flags;
+
+	raw_spin_lock_irqsave(&first->lock, flags);
+	if (second && second != first)
+		raw_spin_lock_nested(&second->lock, SINGLE_DEPTH_NESTING);
+
+	return flags;
+}
+
+static void riscv_iommu_msi_tables_unlock(struct iommu_domain *domain1,
+					  struct iommu_domain *domain2,
+					  unsigned long flags)
+{
+	struct riscv_iommu_msi_table *first = riscv_iommu_domain_msi_table(domain1);
+	struct riscv_iommu_msi_table *second = riscv_iommu_domain_msi_table(domain2);
+
+	/* Recreate the lock order and release the pair in reverse. */
+	if (!first || (second && first > second))
+		swap(first, second);
+
+	if (!first)
+		return;
+
+	if (second && second != first)
+		raw_spin_unlock(&second->lock);
+	raw_spin_unlock_irqrestore(&first->lock, flags);
+}
+
 /*
  * Linkage between an iommu_domain and attached devices.
  *
@@ -1388,6 +1442,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_bond *bond;
 	struct pt_iommu_riscv_64_hw_info pt_info;
 	struct riscv_iommu_dc dc = {0};
+	unsigned long flags;
 	int ret;
 
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
@@ -1421,10 +1476,12 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		return -ENOMEM;
 	bond->dev = dev;
 
+	flags = riscv_iommu_msi_tables_lock(old, iommu_domain);
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
+	riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
 
 	return 0;
 }
@@ -1474,6 +1531,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	raw_spin_lock_init(&domain->lock);
+	raw_spin_lock_init(&domain->msi_table.lock);
 	mutex_init(&domain->mutex);
 	iommu = dev_to_iommu(dev);
 	cfg.common.hw_max_oasz_lg2 = 56;
@@ -1569,13 +1627,16 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
+	unsigned long flags;
 
 	dc.fsc = RISCV_IOMMU_FSC_BARE;
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
+	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
+	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
 }
@@ -1594,13 +1655,16 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
+	unsigned long flags;
 
 	dc.fsc = RISCV_IOMMU_FSC_BARE;
 	dc.ta = RISCV_IOMMU_PC_TA_V;
 
+	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
+	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
 }
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 6bea9da71ff3..2876703a6698 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -69,6 +69,8 @@ struct riscv_iommu_device {
 };
 
 struct riscv_iommu_msi_table {
+	/* Protects attachment, interrupt forwarding state, and MSI PTE updates. */
+	raw_spinlock_t lock;
 	unsigned int nr_ptes;
 	struct riscv_iommu_msipte *root;
 	u64 msi_addr_mask;
-- 
2.43.0

