Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3A94E01E7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606370; cv=none; b=ILgKFwKg096p3NyDhTaFNGGwwBLu98CMcMPFzAm2zWVIMyeq/iMQxLoc90n1RHYdfV6b0TffHNmHaZsROv+WYY+wZvuYjLm0G3rmlGAk2Vx6C0ioJiSN0Bo+1bVwcUhikhM0GSdLCzl9XNpabS0bC9AkBVe/ScDxY3c2woKSQcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606370; c=relaxed/simple;
	bh=yjSyVpAuKGH9gMGCFpQtURI7YjmlqFUcCzwwT3vYzks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovWMPxZnkE+1edrjMd3wS2g1lyxzpzjyDqDltS2YcGUHb6k/BJTX/31Vhij2ZULoWn8nEa2yI8G8CVSh98t7npMOc9PRNhy3ag/NRI8cXH4e3pHrwtXVPZxogNr6zQm7CyRSCamUy8sIJcyxA2IcU1fCTBH+SlnINztj30V+m5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1khsbUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyGRRCOV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1khsbUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyGRRCOV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA54M1433682
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g7ykt7LSEJe
	/IvR1ZzOjMBU3wKZ7WY6AweTJQ2yjaag=; b=A1khsbUY53TyX+IouxKKcQgcDYK
	8RmG3YIwh2qQRPk8L9AOg75iU5OhtzUQo61HU6vp30hzLq8NwzUNx3kABtBGg8bB
	zFC3VvlPM/YcW73HckfLlY8b6h1eHSfB79tRRdkKLZYXGZvUlzpOCqLolVE/fOMz
	9SDa14kaU0pqJkAuyegYSvTOjpLEQO+VzjNVEX2T6oCjSEhv0VsItB82zWcvTth0
	KSM3IeTuI+7qhUIK0Vdgz4ClN4LxsH7fpUi4hsp+TVNP04VOUCVNboUePJxH0T4v
	MDK4OqUJJhF49TuMdt+sEFKGLQ5SyOyP5hOVkMx67Z2RNROj3R9QZAJNVzQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s20rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:39:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-532df0126f6so41810411cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606356; x=1791211156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7ykt7LSEJe/IvR1ZzOjMBU3wKZ7WY6AweTJQ2yjaag=;
        b=RyGRRCOVHBQ+E37Gtqyrq7D0hHHZtidSeo8xYWeWT+ScRBQMNaUQpxXwJAwix5nOZe
         FtL4i2PdYM8atiUWMKp8U4P2lLCqjHLN2mxoHm98cNuzTbtttAsoxAhdFDmFiCiszt/l
         H1VJ4BRohtkNfVZfz3x0TmttnYe/4ULys0RtiUMvz1/yY2hBlRzhvynLo4Ac1hsmelQy
         ILIebKO2MEJESl+lFP736M8D0FvPaxZYeVkEWzyuUlm5273WjWp7EpwRDN/tWXSTRfvm
         DD9pdg9gyi4yPB0seX90Z+rEoYFFqQXq4GJtCWjuiewvohQCShUALwL0QMVI+xAHqBoO
         ETMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606356; x=1791211156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g7ykt7LSEJe/IvR1ZzOjMBU3wKZ7WY6AweTJQ2yjaag=;
        b=ze+QcCieVoeWnbeufNEIZQV1+wWODLwb4LZqn6cGcPwg5/ZgLiTbc96PEsI1qFmgH3
         pNX7ojqnN7lyajhcMgPOahURP/mmZ1GJn0jmjMtwzJqwfNM6uV8nc+0jy4LHW2mH+IRn
         kmlmcl1axYhwklNODrv9mkbvsmmE4/4ouvR3qooqvbGp1oU1K8ImbVJi/9Y70PAW5h+t
         bKafzxsDnlb1aB/JwkJywqBJZGDVtRix2lQrUhZv+EJfA4wZ426kTaFpnPEhkeP9Dzxq
         9whs2q9evYNzMpSNeowU0bjUAxjIRQ+oe6K/edLPyHJO55veIzOtxpdvO19h8pgRMDQS
         c3xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvK0F/vQGYyKCOIk6QxkAq5s96sM3pPW6j1PZ1y1/lk3WICtf78cTVEh+CtQ7AAi2C7zjMWGNe12byyZI=@vger.kernel.org
X-Gm-Message-State: AFuF++mo7h14soPGwV1MkCSOHabXcH5C2GoOPz8yz9m2fJQtB7h0UH8s
	2W8i2sM67DOmwHcLsPwwIbXTk87ma2ndwkLEIaOnmIE6ebyYww+PiJQfUxwPkWffaTP0s8kUeM6
	ccSCa4TqMdV5rxxLuyS1pSP5SCmH5ovbt22Ikl1L4AhFfKJgpcTZiuFFo/IO3zVMFq4gvz62IqF
	c=
X-Gm-Gg: AYBFou26Vuc9259NQOFaUb/WTc3K1jNEu68nUDE5kZWtVOcQ1Wvt3akLfpMgyIHelN9
	SgSvn+yjuWu0RbANQOpfxOveQ+ExZ8HG9MBowc/f74O4HOMP/aRfIAio82N+iZBjdnpSysXtx2O
	K1z7kDhRtJJt21uTDo3PQdTZvWdX5pO6BqHSDUHrq3RENHDC5eumN8JscPIrona3He0G8fbbgAb
	pyC5HAsgPqMhNWjvIgey+ZCTmsa8civlMJwphJsy62IWuRE10TmtkmvHKL8SBq7Z5yj98Ff4Loo
	jxPO5PLPFFhOoZAJSBy/sb8sWC4/L7D7Y8V1qKxgZGCFJQGeLN216Yp7yfiy/6ipyN/EVGtNcwg
	gPdx3UCCYvn9ppYLQu1JW//JfU7FslXboDeSymg==
X-Received: by 2002:a05:620a:2901:b0:93c:720c:94e0 with SMTP id af79cd13be357-93c720c9800mr820553285a.30.1790606356209;
        Mon, 28 Sep 2026 07:39:16 -0700 (PDT)
X-Received: by 2002:a05:6102:32d0:b0:7b2:7aac:8ccf with SMTP id ada2fe7eead31-7b27aac8d4bmr3266533137.29.1790605937424;
        Mon, 28 Sep 2026 07:32:17 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dcf626b3esm211882366b.27.2026.09.28.07.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:16 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 11/14] iommu/riscv: Prepare info->domain for concurrent RCU access
Date: Mon, 28 Sep 2026 16:31:10 +0200
Message-ID: <20260928143113.49838-12-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXwV/2TjMvqV8E
 y8d/dn7wF2w7YT5zJFOkQh7AT1h8pz1dB2hiSF7cgV7DdnPWzr9zFFjRoFzDu0mWPDHLhHIxBeR
 zeVEo8bhCLeI1+zK7o0FJY+XObR61/qj8lyqPKwoyK3tDbvFxW8ozKuukFYHjf6BwYwZFIX7pcZ
 1V4fI3Ex+e6PlPloR3uMkgl0q2lT9IlN/KSuZzF2iTZ03lQoZIN+/BKJLwCwP0N6T0omTsWrim/
 lnhL+nJSs+ndMxPZGEMSf6ZpJ/fh6bHp1KBYVZoH4ij2gLFM6PUW10PmKoD7aoQ+lXe8SJ+uTQa
 gkYd1LEHRD76hmQ2M8KihB6Xgs3DY5BmmRqkdE2N2MTKy2zwBQmYNxkXr0tIoypwE8DkD1RhQ53
 PgG7/1bNql8v+vMN0Wds3lwtqojUn4t07jRM53NOW3HDSB9XZv7Rk5Z5vJk9m8TZK/v4xtsnMxT
 EVViWzVVu0sEEwEUAEQ==
X-Proofpoint-ORIG-GUID: ACMW46QXbmMEUYggryhVtv4M-ZrH6Yz6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXwWHP0x/D3Xsz
 fCEqmir2Kl2y2+nESTXzf4oEx+aP2gEQ524b+YH98+AK/U9SHarVdETQLEdRkVuvBPZB9ajdbFG
 MMETFNE/xMdaYMOVpPKP0+VF2T6ULI0=
X-Proofpoint-GUID: ACMW46QXbmMEUYggryhVtv4M-ZrH6Yz6
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba7c15 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YVOiLqTVN_ovv9J5ge0A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280058

Upcoming interrupt-remapping callbacks need to resolve a device's
currently attached domain from IRQ context, concurrent with domain
switches.

Protect info->domain with RCU and wait for readers before freeing paging
domains. Provide an RCU accessor for the domain-owned MSI table so
interrupt-remapping code does not need the private domain definition.

Use the stable old domain supplied by the attachment callback when
unlinking its bond instead of dereferencing the now RCU-protected
info->domain.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 34 +++++++++++++++++++++++++---------
 drivers/iommu/riscv/iommu.h |  5 ++++-
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 7a8b40d311ea..514470291fd9 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -869,6 +869,16 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 #define iommu_domain_to_riscv(iommu_domain) \
 	container_of(iommu_domain, struct riscv_iommu_domain, domain)
 
+struct riscv_iommu_msi_table *riscv_iommu_msi_table_rcu(struct riscv_iommu_info *info)
+{
+	struct riscv_iommu_domain *domain;
+
+	lockdep_assert_in_rcu_read_lock();
+	domain = rcu_dereference(info->domain);
+
+	return domain ? &domain->msi_table : NULL;
+}
+
 static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
 {
 	struct riscv_iommu_domain *domain;
@@ -968,18 +978,22 @@ static void riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
 	smp_mb();
 }
 
-static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
+static void riscv_iommu_bond_unlink(struct iommu_domain *iommu_domain,
 				    struct device *dev)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_device *iommu;
 	struct riscv_iommu_bond *bond, *found = NULL;
 	struct riscv_iommu_command cmd;
 	unsigned long flags;
 	int count = 0;
 
-	if (!domain)
+	if (!iommu_domain || !(iommu_domain->type & __IOMMU_DOMAIN_PAGING))
 		return;
 
+	domain = iommu_domain_to_riscv(iommu_domain);
+	iommu = dev_to_iommu(dev);
+
 	raw_spin_lock_irqsave(&domain->lock, flags);
 	list_for_each_entry(bond, &domain->bonds, list) {
 		if (found && count)
@@ -1415,6 +1429,8 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 
 	WARN_ON(!list_empty(&domain->bonds));
 
+	synchronize_rcu();
+
 	if (domain->pscid > 0)
 		ida_free(&riscv_iommu_pscids, domain->pscid);
 	if (domain->gscid > 0)
@@ -1577,8 +1593,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	info->dc = dc;
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(dev, &info->dc);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = domain;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, domain);
 	riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
 
 	return 0;
@@ -1732,8 +1748,8 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	info->dc = dc;
 	riscv_iommu_iodir_update(dev, &info->dc);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = NULL;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, NULL);
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
@@ -1760,8 +1776,8 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	info->dc = dc;
 	riscv_iommu_iodir_update(dev, &info->dc);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = NULL;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, NULL);
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 4c1c681ba2a2..ed973979d795 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -16,6 +16,7 @@
 #include <linux/types.h>
 #include <linux/iopoll.h>
 #include <linux/irqdomain.h>
+#include <linux/rcupdate.h>
 #include <linux/sizes.h>
 
 #include "iommu-bits.h"
@@ -85,7 +86,7 @@ struct riscv_iommu_msi_table {
 
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
 struct riscv_iommu_info {
-	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_domain __rcu *domain;
 	struct riscv_iommu_dc dc;
 	struct irq_domain *old_msi_parent;
 	unsigned int nr_forwarded_irqs;
@@ -100,6 +101,8 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
+/* Caller must hold rcu_read_lock() while using the returned pointer. */
+struct riscv_iommu_msi_table *riscv_iommu_msi_table_rcu(struct riscv_iommu_info *info);
 void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsigned long addr);
 void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table);
 void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate);
-- 
2.43.0

