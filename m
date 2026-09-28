Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34A14DEC03
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605907; cv=none; b=MkrM/OEHhXxLIrR5tlqSOQEq8OmQZUDcErf5+ec49pndQ+vx0wCEjAGteBiug8FVLlfTUP3ArFvVbmzOfY+IdYf9hA4+MgiIUk9/qIZneI0qGXqkuLUeQjhVofq+8hiDm0wEdTuGdm4D6XzqeLkLD8a/ctJQWMXvfwN9GLK0ZF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605907; c=relaxed/simple;
	bh=HMHDIkk9eqjhFkHSH2xSM+qF3/e16Lj391jOJsFu1M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrlc0OEX5yEziEWdCa9NpYKhs/ubD6ZFv3aeI1e4gK9FfJYkBhKyzyjMZpzDGDOu6VuEQWYo45o/8Zyy9StTLEveejmxiIJQh3siPMKYlXviJdEDpJxSYnJQ3XMWBn3yyJTvIRdRitChmFJu0aLRC+myXuFksorlZfYYjjYORf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeL9p4w2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx5ukDl/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeL9p4w2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hx5ukDl/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAVHZ1042576
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SgBxAUOx84U
	cn9DyKFIg2KlUymyjg92B5RIf9l+yQcg=; b=PeL9p4w26BhoNlRqOvQ3LSV7n/M
	IktOMye2ZvfZB0pICaZ3TBWrcQlguntFEJzgoIjtjths47tJk1xoUZly2IPaQszy
	pNIDDoUjuy9W6cB/mpFxHlby71PtXHVdx0VWz6WtEILSV8JQfkeE87kr7Ib7ZPIG
	TOC7sMO2YdQEslR/txVR634Jw5qrZWxsKyoGjrLuyh/QQjmvwNSaJ/WsFebp67mG
	IImMljNxomfy+bPYM3oRVTQ8paB3pwle9mjd3f8s58TbjX1938Z7pGGKc7eXz9Rg
	gV+3ERanv7za6SCrYk/1jUrCxiIAqpgci3qNcOuCurOWNf5dPF9aV7CCWrw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5msr44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:31:38 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98527cdac1eso298569241.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605898; x=1791210698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgBxAUOx84Ucn9DyKFIg2KlUymyjg92B5RIf9l+yQcg=;
        b=hx5ukDl/dlZfpncgbqjGL/w+uSoHbFGyxu5PLXxSz38iaamsQ3OdylwdvWFlzQtAwX
         vIWrWdHchsgudIHnarTXzkuD2Z6C1EjGOP2QlMNDT8nVIJIP+xaR6R4o1R2/7OGxroe9
         QkYJok9xHISH61t393/y8AbOwEwVJ8EgaBjW9s1+jDhME4kkiIFCdJqxm6/FfIjsOpIq
         xdMdArjXrORtAPtdP3YBpaVTeft/qO9EWsPx0d3B+QgqFNN8SH61WJiiX6NOx5hctnKS
         fs1kqslyLXgHFj0Vfe3FO7t6Yl5wnh6SZFWznn5UTMLCON87QGTkNAhgDnrXwl2LcFb2
         bfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605898; x=1791210698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgBxAUOx84Ucn9DyKFIg2KlUymyjg92B5RIf9l+yQcg=;
        b=Py4FGhYj8u98s+h6VtitpZ1jx1O5nAqhlGNzec8pgUlOx0NRXO4EphH0bd2RtvFt0H
         ejRQzol7Pg8wCdqzem5Nh2FQHEGyyL9uNnyvwr1ra+c1Jmt8iDvgpnHeJi7tWqT6+8Ni
         UyYstS2aDRg0oLI8VOSpJR8IH7nltF5y1VF/qmJIfZo8kyAs0NpIpk5U+ykRVdNaiZ4K
         JITZKfNc9OvP9lBJshnYzoTY6MkfAg3VmMfkMIshJBHrqfZmBRbtKybF0/8NU7yJOlr8
         oLU+ZyzBX/zpMLCH9l/6AXvmfCBvp9efdd0w5i6qRfvuEyWkygbfOfliRcaMDqkZBs8e
         CO5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwJJ0qGpUvHgzE6mSyTSnkCWK/vH9w8oNkl1xjJy3zdDeLd5t48sr1ZTTdPIdys91D/eGS6vZguS75/bU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE6A3h1dE4e9tayhr9nFOxxxVBHivUc4jLVffX0Z5QueSRBZVR
	G4+WN8el4Hq28hFF0wvf5Zgq5129nQB2dhcLHSlIrzWikQ4GeZNj1AGKWAJTJI0OI772AnAletl
	LgWu4/TVOhGZI+AA/x7Ydj0384qHBHn389BCZ0sv7A8KrkMsgHTuhEnT4cyjUCxi0+ik=
X-Gm-Gg: AYBFou2wtQuqGWc11dKfjaXfwkgTptoG+hvo+MN9bRLpb+DDY3mVMOuAitwSE3H3/ZT
	O4nq4V8c+wWct3h7lutHLh2bqgQmD0MApcSUyLFSqJex8tDoxSNXOmS3kCij0/O6WA1ikESCBeK
	xj7Yrsei5VPjNtPvEVWcmd9TkzNflnhslJenUoldGBJwvNbY8r+FnjhGZCibDZxboUEtwBj7FLb
	GdxTAju9yoCxnjEwPF5gOnGLC7vkV9v4cdseHsewP51IPoLodIG6aeor5HqK0P8o480KmytVXgb
	Mtb4xMrq89ZbwPpG86SVU5OOKac2Esp9tEB+80qrnhFqVxbCk/TKa6S/vWxsFUpk52nARJT2yat
	wq0aFiMDm0cSv3LpeUAXde+F3ZqnfM65Bxygs/w==
X-Received: by 2002:a05:6102:4b1a:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7af1e4f8b12mr3623525137.24.1790605897470;
        Mon, 28 Sep 2026 07:31:37 -0700 (PDT)
X-Received: by 2002:a05:6102:4b1a:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7af1e4f8b12mr3623511137.24.1790605896839;
        Mon, 28 Sep 2026 07:31:36 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc097csm4205378a12.12.2026.09.28.07.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:36 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 02/14] iommu/riscv: Prepare domain bonds for outer locking
Date: Mon, 28 Sep 2026 16:31:01 +0200
Message-ID: <20260928143113.49838-3-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: GltLzcyM3i6ZDejBJJaaE8VNtF9NmU2Q
X-Proofpoint-GUID: GltLzcyM3i6ZDejBJJaaE8VNtF9NmU2Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX/SjQ10Xua/UP
 qSCk8/iaoYC4THvabCT+JZPewFhTB67BSYhb6K1JAc/sLv0x+WON49/6Vib+0C+4DzJpS+WFD1f
 ILKAoFdj2wzCNn1kxoJahFC50FKNfL0DvS319GjgzOBQItQChkFy4SEoM4fgKoIlKnFlOfFqMRI
 R/6N5MWJ1N9Arxz7tGkkhnFIFMDP4YiJTwL3zhwrrBVpdKWKqvyZfiMhHxu3lKE1/Yrzwbr3kRC
 rteJcRMV56IPMDMzbDcwkL3go5MKvObvGTdAM/XGp9YkBNDTJlP4mHJQv7LuQp4Fx6Ta/bvfnSV
 fUbEHcTQ8jiCucYs2GbkeyRNmPgSHE+81kMmnXPHnJQMbhGw7PGKuDSRt6pIPNKypuDgq79knbr
 haLhD/ZcPtGTlb6AaqRGSbInA1pRWmQ80joRHoGx7hTfAl6fKqPIxnuMSkx6gXL/IcUF4ctRDez
 8loqW1fXTp7M9yaBMXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX2oskml8Q8UQy
 DHTVySYxx63u07XBLNYNNvZYnhVG6jW2l+V7/nrdmXopweIGNHeN4wQYzhT24Znq0hWwJOaKh0B
 3oZWvjLTfxbpTKfle7QPz9KRpYVeQsM=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba7a4a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=69OsnF3JIPtLgHPxktkA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280057

IRQ bypass will serialize attachment under a raw spinlock. Bond updates
retain their own lock, so make it raw for safe PREEMPT_RT nesting.

MSI forwarding will acquire the MSI table lock under the hardirq-safe
IRQ descriptor lock. Nesting the bond lock below the MSI table lock
therefore requires IRQ protection even for domains without an MSI
table, where attachment takes only the bond lock. Use irqsave/irqrestore
in both bond helpers to avoid a HARDIRQ-safe to HARDIRQ-unsafe lock
dependency.

Also split allocation from list insertion so a future outer lock can be
taken after the sleeping allocation.

No functional change intended.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 3bbb4d0d0a85..09ec8c3e4a72 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -858,7 +858,7 @@ struct riscv_iommu_domain {
 		struct pt_iommu_riscv_64 riscvpt;
 	};
 	struct list_head bonds;
-	spinlock_t lock;		/* protect bonds list updates. */
+	raw_spinlock_t lock;		/* protect bonds list updates. */
 	struct mutex mutex;		/* serialize domain state updates */
 	int pscid;
 	int gscid;
@@ -896,34 +896,27 @@ struct riscv_iommu_bond {
 	struct device *dev;
 };
 
-static int riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
-				 struct device *dev)
+static void riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
+				  struct riscv_iommu_bond *bond)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
-	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_device *iommu = dev_to_iommu(bond->dev);
 	struct list_head *bonds;
-
-	bond = kzalloc_obj(*bond);
-	if (!bond)
-		return -ENOMEM;
-	bond->dev = dev;
+	unsigned long flags;
 
 	/*
 	 * List of devices attached to the domain is arranged based on
 	 * managed IOMMU device.
 	 */
 
-	spin_lock(&domain->lock);
+	raw_spin_lock_irqsave(&domain->lock, flags);
 	list_for_each(bonds, &domain->bonds)
 		if (dev_to_iommu(list_entry(bonds, struct riscv_iommu_bond, list)->dev) == iommu)
 			break;
 	list_add_rcu(&bond->list, bonds);
-	spin_unlock(&domain->lock);
+	raw_spin_unlock_irqrestore(&domain->lock, flags);
 
 	/* Synchronize with riscv_iommu_iotlb_inval() sequence. See comment below. */
 	smp_mb();
-
-	return 0;
 }
 
 static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
@@ -932,12 +925,13 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_bond *bond, *found = NULL;
 	struct riscv_iommu_command cmd;
+	unsigned long flags;
 	int count = 0;
 
 	if (!domain)
 		return;
 
-	spin_lock(&domain->lock);
+	raw_spin_lock_irqsave(&domain->lock, flags);
 	list_for_each_entry(bond, &domain->bonds, list) {
 		if (found && count)
 			break;
@@ -948,7 +942,7 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 	}
 	if (found)
 		list_del_rcu(&found->list);
-	spin_unlock(&domain->lock);
+	raw_spin_unlock_irqrestore(&domain->lock, flags);
 	kfree_rcu(found, rcu);
 
 	/*
@@ -1391,6 +1385,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct riscv_iommu_bond *bond;
 	struct pt_iommu_riscv_64_hw_info pt_info;
 	struct riscv_iommu_dc dc = {0};
 	int ret;
@@ -1421,9 +1416,12 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
 	     RISCV_IOMMU_PC_TA_V;
 
-	if (riscv_iommu_bond_link(domain, dev))
+	bond = kzalloc_obj(*bond);
+	if (!bond)
 		return -ENOMEM;
+	bond->dev = dev;
 
+	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
@@ -1475,7 +1473,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD_RCU(&domain->bonds);
-	spin_lock_init(&domain->lock);
+	raw_spin_lock_init(&domain->lock);
 	mutex_init(&domain->mutex);
 	iommu = dev_to_iommu(dev);
 	cfg.common.hw_max_oasz_lg2 = 56;
-- 
2.43.0

