Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAC94DF4D7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606228; cv=none; b=gpzNZEYE0JxELfyAkghEaqZQzFK1lAzjahqGkkmUkrDpq6BJeOTqZRzIZOrUFpkvQYp3KoHaYsWfMljN20R+I3ffpoFp+qVdqHKtaMtKVP9P+SS1iXo2rNEmzbkHMuH6PDDfIddyjPqHSc7/aaGuB4DNFq74DTdkIt58b0ZC+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606228; c=relaxed/simple;
	bh=cjRzePwWQclJUJKIhRKrEwy8caVabOEtV4kllClzkAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aiE+n4zhOOQv+15+S9T0DxUfmTeVWAi7BYMXsFDeYtocOFcUijgZBwVTAdRX8L9K7fNlyjSIww2fsVLvAxtR+m1sE5W2yVfFxjPd0B0Hbm83YPnmTgPtwjfJTeP8VZy5Z63qIIUR2tuqJZ/A/t3ABKcrpER9KGGVly8gSkugqaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhsmkViQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a12tycq7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhsmkViQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a12tycq7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA9Wm2404283
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qxLv+wRWUPQ
	akyE8xOuZTAbdosP4MYCeK2FTsiU2BFI=; b=PhsmkViQJCQemOPtl3iSwfqxLSx
	H1fsXQFhaw0QaJgQtyvDTJgSLVVQuvDwsotMKk2pwtHckkciUEGML0xfKcPf98Wp
	vin8jKqi1SaP3eleGdOEg7yBW5QbMfx7RF+6LAzz/jgrPP/GPEPtVaDOS9ztH4Tv
	Oc0Jh4N4HkqvGf+tQV6HRr8Fr2WrrUVzV+N3FFwOGYpg25m09BYu/iyOM49vJfdX
	VepGC9OC6VN1I5a7UxNpNlab3ygBmiSIrbtw/zbYKGyKNusJj+NdOWILbS+hVQmF
	t3OrWlUdMCKh/SwOazWzwIoNyuHMOHjZJvuMPy3K9+N+QE8cTGWzVdm4HLw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t1yph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:36:50 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b4f8ea38f7so1392714137.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606209; x=1791211009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxLv+wRWUPQakyE8xOuZTAbdosP4MYCeK2FTsiU2BFI=;
        b=a12tycq7CBn9a0bWfg55u6pohTtMQYRJOmPdwau1cUlxd+DLpe9C9bugVFEtf/sMqA
         P+lhBBDqExEdEh5sGIP0kPMINVq951Fx7opBM1/G/CKedQLgPh4qdQGx8iYcpdpq/96b
         i+3MZxaWkRI8950Cd710JRqtkZoPFQns/rw+L8Zoxl+ayq6XgkSUb9Bvd3dqlVX0du+E
         EbNqr7Ch07x+Y7GAn4h2snIHU/Fwnh2vnWkTzWEsgJlPf2SEG0wAahkWHM/u1gaMJowR
         /aR0uc6VoDANzZ/QnuxXEIijF3DwYppQB+Jmp2HLnMIPz3B7JMd3kGYn/YprQZy6rf5C
         sc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606209; x=1791211009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qxLv+wRWUPQakyE8xOuZTAbdosP4MYCeK2FTsiU2BFI=;
        b=l4TxReNni/Yr1VdSoDaTNoI41SYSC/X8zhmtHuUOR/TMWMUicPWGckPZ3AFyPk2gUE
         Qc+/3NErE6xF2BQE+34BFqo/VkC+/HGY2Sr38RlSYmie+2RwWfQxpjMIQDvEMWTV8xUB
         3XMIPual7FHw9VC8yf6kzHqluR/hhqb30LjmzvrMsffTBCTeSFQlsG70FXenxp6IZRm9
         Ft/7RM2ujK7mUENwHkyCuGJbGwVScQvN47dB8EA5gKtolTdHqZTFn9TPRPRkfjZbJKW0
         ouirpCWO7CWCqgL70LGRc7jdh6JtJYf5AFX1CUVS2S+DJ/++qFA0ZIblQuv17hFfss1G
         gqyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH/BMsie+3CgPH5jyDLbZizsmmVtA1XXvx959ddpyMX6v0kleUbN5zHm2D5VgSQMnjzJq73JerhESQmCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmeeVdnmRiw1LFZjOEwtt0hJUlSdvjeFkqM8yeGutH4mzcUyIO
	5KkuRqSQ3nmQFT6Vfhs1tdGxSUCRc3BZXl6Bxbn5k4IN82legatO3eQt7Uw9y1W1n/okcGcwtDU
	W5yTL/8fPqVYfzp36ebfXMzAXgRHQ0zGD+R4pCJ3zWMa3KNTK54PdD3w6hmpuPVYmqwIBP1SX+q
	E=
X-Gm-Gg: AYBFou227uvwqNVHK710KIJzZQwxvnqWTQHpHpGk5MTsDAm+llerPF4CnmdgAY9vvsW
	WyKqJH0KUQF4UR67W7zxfVxoQKhX0s+pa1E+33frEitHvkyEGEun3UDaL3wSTO1zKj+tg9lZmDO
	ox07NTiBqNcx5uG2NRRjOBVm4r34PymzbkjS9sEGaSp1eRiBm0VFxsRVOJRaeOefBqckxxly3zp
	Y0EKOVOO4xB+43A80tvPMCYsZ96lkaNyzJWsLQP/uqTydauPPayWp8vsKa/d6ZH2d5gocMAye4I
	KZIRo81SnWTkdAXASeIG/yxZUC/AizwVZ6nyvK76LDJ5xt7AmLm8YpExV+l/QCsaVUyEP/XSi8I
	sC7+I1Euna/UQDusk5w6XKZZNWoZmy/HsNAwcdQ==
X-Received: by 2002:a05:6102:3f0d:b0:7b3:4199:2de2 with SMTP id ada2fe7eead31-7b34199441bmr2407604137.35.1790606209341;
        Mon, 28 Sep 2026 07:36:49 -0700 (PDT)
X-Received: by 2002:a05:6102:32d0:b0:7b2:7aac:8ccf with SMTP id ada2fe7eead31-7b27aac8d4bmr3265770137.29.1790605900321;
        Mon, 28 Sep 2026 07:31:40 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaecf2f62esm4040194a12.27.2026.09.28.07.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:39 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 04/14] iommu/riscv: Reject live S2 replacement with forwarded IRQs
Date: Mon, 28 Sep 2026 16:31:03 +0200
Message-ID: <20260928143113.49838-5-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX7epSdXuKNM94
 0+kn62PwrjCdwJQb2JXkTWhS+pM9eTyBrGvUU3jhgo5MhFGk9th2PigA94VXKfOiPZpvJx+K3mv
 2DtcppsL84EIgalQ9J+iICScmdMVpKmhsfOeylPDVwm7BQUMggYe+wvIma0SyH18ipkI3JdgZmm
 tYwGHHYjN7BaoUNxWsaAP+MPqKDreDUDa6CW4AS8Z02zaNhrEtSoPS6HWPL3VUAD2909kbLNndP
 z2SxJaicyYoHG3PdRxG8CriDgLy/+s6N1d1wtMYtCeKQSZMM4TbUpn7V1cvKKerqK0k9GUEWF/t
 VBFyCZl+eyQ7amts8xQEn9CabKRRFRlA1Q1ZNwYXYV0E+T13vTsifAWmoApu65ZEo9pNUgm8wB4
 FPfJ77v0Et45r6cOT6zuui4kRY12aoe/wZDDzxy4a7WklwKUeDnU+G3cQkbN+vCN323SqDbnMy3
 BTi9qjPR+pmX9uM0Sag==
X-Proofpoint-ORIG-GUID: yvrQZ1BvOBaLN2vt1bgzRi6IU7RbGhRA
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba7b82 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=t97w11WlQ40Dee02AfYA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: yvrQZ1BvOBaLN2vt1bgzRi6IU7RbGhRA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX3s7rNSgNe8Kx
 +iSbegJYeK0tzASZ1OBnjtyIKikACG6MNwfQrocOy5zKW4UQygnyop8FEapjCVKDR7v7yeFsfHY
 rkoTxBGDoGPzFy12yc6OszYkEzqvmBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058

MSI forwarding state is tied to the S2 domain MSI table. Replacing a
device's S2 domain while one of its IRQs is forwarded would leave the
IRQ state referring to the detached table.

Reject direct S2-to-S2 replacement when the moving device has forwarded
IRQs. Introduce a per-device nr_forwarded_irqs counter, rather than
domain-wide accounting, so other devices in the same IOMMU group can
still move and can be rolled back if a later device fails.

Later patches which introduce interrupt remapping support will manage
the newly introduced nr_forwarded_irqs counter.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 57f2884dec42..d48667112cd9 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -872,6 +872,7 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
 struct riscv_iommu_info {
 	struct riscv_iommu_domain *domain;
+	unsigned int nr_forwarded_irqs;
 };
 
 static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
@@ -1432,6 +1433,36 @@ static int riscv_iommu_msi_table_alloc(struct riscv_iommu_domain *domain,
 	return 0;
 }
 
+static bool riscv_iommu_can_attach_paging_domain(struct iommu_domain *iommu_domain,
+						 struct device *dev,
+						 struct iommu_domain *old)
+{
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	bool new_is_s2 = domain->gscid;
+	struct riscv_iommu_msi_table *new_msi_table, *old_msi_table;
+
+	if (iommu_domain == old)
+		return true;
+
+	new_msi_table = riscv_iommu_domain_msi_table(iommu_domain);
+	old_msi_table = riscv_iommu_domain_msi_table(old);
+
+	if (new_msi_table)
+		lockdep_assert_held(&new_msi_table->lock);
+	if (old_msi_table)
+		lockdep_assert_held(&old_msi_table->lock);
+
+	/*
+	 * Per-device accounting allows other devices in the same IOMMU group
+	 * to move or roll back while this device has forwarded interrupts.
+	 */
+	if (new_is_s2 && old_msi_table && info->nr_forwarded_irqs)
+		return false;
+
+	return true;
+}
+
 static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 					    struct device *dev,
 					    struct iommu_domain *old)
@@ -1477,6 +1508,11 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	bond->dev = dev;
 
 	flags = riscv_iommu_msi_tables_lock(old, iommu_domain);
+	if (!riscv_iommu_can_attach_paging_domain(iommu_domain, dev, old)) {
+		riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
+		kfree(bond);
+		return -EBUSY;
+	}
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
-- 
2.43.0

