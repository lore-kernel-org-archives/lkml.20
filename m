Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE0D329C40
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605940; cv=none; b=CvCVn161zvf70ybPcbM9ToCTBxfN6AkRJ5XGmzLdxywDaW3AIKk6Grvr9DEqbEMNV6tqgXJ/lzmlwpsu0NCHgfLqG+MLVcC0WWd9U/9tINhpFm74wZyrISeFFcPE5hDmMfz8r4s88PUak8fFE7UreK0r8AYq+X/OWVfRDR06YD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605940; c=relaxed/simple;
	bh=xlWBoHZlI3FsV92yhipKHcVeWh8Apy+gkEcFiflzWF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbNcRXVmFIfu0NjxBToAa+EEBM4cj321wumx0UN5dwoaIldrUK6hotFFFLuwdNCFDR9L1fCgC3GZJdjRX1Sj7+Rp4ts58JxD0dqkdsqSmJl2MX3GrF3FLv58tfnX2TbmbxadeULO70MN7e/5obazEcXfi1xZzmjZuMpj2bbV/tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcNy+T6z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFxhQ50M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcNy+T6z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFxhQ50M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAVQ71042606
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fXARlnUet2M
	hiIY+g7vNvo27h1dCmw8pyLb+qL38EuQ=; b=OcNy+T6zPRquLP+sx+2pJIVxXAu
	iloExvb24ljR/wERPOc2mqHIz8LSh5TFaOYiAlCBRGWVoAaReKzYUuLKPqEPsSW4
	ZyZZydUCHV/sThrv65cyzoDz//rcoNJINKKxojBoV5TFr+dm/tRHMSPzHKG0cQ8C
	G04wUuB1B3LrYnQGfBxSPJu3G0/uvud5AvS6Q4NLb1sSnnAAjTo5papmWFi7DdT+
	NYxsHuasNvhtRzvWK6hXol4U6jvifKztKU7pLBjO+B0UdDnLCY8q2FKEglAE3gWL
	qjJWYZbmZ7U1pvXCjii1oCyJRcMlmvA+iln5gnyj2UMljM0Nvw+nHqfn3rQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5msr6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b36b0a8ab0so201601137.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605930; x=1791210730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXARlnUet2MhiIY+g7vNvo27h1dCmw8pyLb+qL38EuQ=;
        b=QFxhQ50MB28uBMtigVcdFrXSJ2SuJLRyVFChirHPcEeG1KRqDHPnZpiBPm3FziD323
         vhtSB2Na3KGiKhWXLqy4zMsSBXhS9cPSzmFbHijSEpp7+Ja10dCtnNxHcWSMjoBkSlgd
         IXvq/Q/NklG4Rs98VoAI/tLh7jyaGiOEZJAVTQs44hRMlBQH4pcCvN2lyYU/McWImble
         DaqK1KZfqebyRFOXggiejhR+cFUaq+vMOY52bJ8Nkww7QIi1EXA6AqoRy1msvuPUDW0e
         /uAy9tHZRKVqoVg0PGlaexqp2JOJfldveaPh/97QXnWlBANMPvcb/3i8mwuIcuLDSbi1
         m38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605930; x=1791210730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXARlnUet2MhiIY+g7vNvo27h1dCmw8pyLb+qL38EuQ=;
        b=oYAd8yIxWvR/bnbQ9Xn3ONzsW7AYkOHI76eebHI+9hMOyH1Lhv78EJC25vosnw5g1S
         9Db+uk+GBx7S45r45dWYd/sfLQowIyUrbTufPziUNoFGlWr5wRyP31orS4X52BHR6IYe
         Rgboh++Mgh7C7MGs0ewEPQcAm7lAAvtdZJKKJipNBzGamqbiHpX6esC1UQcgK6DHGcGS
         h9kjHbAGIMJvaPinD5D1z/GqMWsv3MHvWyJSXkR1+i2rf/6yXDpdr+AnkfIDzcAkDdGK
         HtXoyMDE9f8VqKWuugnWxsWOsjpBsdXaBif/4pjO1iOi/QHZYM8P3S4VwczXHTy40ZWo
         7fxw==
X-Forwarded-Encrypted: i=1; AKwUvBw4m43+n1UPwAfOz3i3q06ZYqDNvGkZxgQrBltcFejlnp/LVZj1WWzBQDPJwqso9ne74UDs3me+k8BbYFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjvQEAPQngdneCiYMYIoAtqup3HPjBA1gFv9RQXJeFpoGXKcY4
	hpGIy7s+CSFbKYiCjLYwc8L+NY6gfPeGwQ69rmrUjWxGgKsW3znXMa9IMGUk9fK0pmXdXBhKR8g
	NNVu+3lDGNGsGKf92erEvYCNDdp+IMvuWDlk9KW49b8Plohgc1MEaFA8mHraS/dTPPZOSazkHZ5
	U=
X-Gm-Gg: AYBFou02LuQnaJVnsGavdPfxPeEPBdR24JVTjTAWj7ctFnI/fljlJ0xnZsGXkweuX7/
	vRyRdqVc38MfoltWbfwvRqu/oReQPqyMUAoEnZRbQ0HqCP5vqj4Yr2D/aaf3LKIEJDkPoz8HMdB
	vnOrGdXQbVWqhczVpsht5GKAao5WTqzDfmd9/0u/hwpWBjLHTqcIV3UFF20LRKHtigB9+5G61kD
	J/KaeoDuCb1doEA/79MqxWnT5k3A+D3UK8twY3uklQ9PL/h1Q+QLyqtvMLdOPFQEn08n4DUeKAm
	qZ/QKZe/89v2soCplS5+pWObX8+p/Ewjc+maslaWR0nG1XnMLzLgMHUSCxR08T5tG01sGPKQ5qt
	e3IwoRJwvykWR5Sa6vHfD03rZ5/TQl/WGHb+DdQ==
X-Received: by 2002:a05:6102:3750:b0:79f:eeb7:d643 with SMTP id ada2fe7eead31-7b1c50409d9mr2497059137.10.1790605930256;
        Mon, 28 Sep 2026 07:32:10 -0700 (PDT)
X-Received: by 2002:a05:6102:3750:b0:79f:eeb7:d643 with SMTP id ada2fe7eead31-7b1c50409d9mr2497042137.10.1790605929656;
        Mon, 28 Sep 2026 07:32:09 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd110c3esm296984266b.63.2026.09.28.07.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:08 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 07/14] iommu/riscv: Prepare MSI table updates for interrupt remapping
Date: Mon, 28 Sep 2026 16:31:06 +0200
Message-ID: <20260928143113.49838-8-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 6cH5RELuIxBSKMzUfWQrbdWxMqLtTTx0
X-Proofpoint-GUID: 6cH5RELuIxBSKMzUfWQrbdWxMqLtTTx0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX/ZhoQWeuB9fl
 9yjkOLbnDE3sSHow7Iw+Wf8dzOQGVf/zrj8wwRyZgzQTZUib+CBGWa/hKxnOaiyUAV93SkxpnWQ
 jxAnRVzR13j8/Eo4jlVq6Lu4HWujtDSacsYl0bwJfpVMJdcmtLAbHCN1lvaAaOHaXVejeh7bJvr
 N0FPRJXe64LhIk2XxBhp9aFlVx2R3K8oKhCWsMhcitAVbRwM3yyIUrW+MBuZyRlPQzJtxRZ0+eO
 ngmErYJ9X01Qui5LWsyYZD7cO6hTwsZ/bFw5KOcBWr3guDr5XUSxI6QQfaE/77kb2S4IiBKYzc0
 2OS5qZ9BtcxdKzUZ4WbLCGFZja5BXxaxbguTEQ+99vPNMZ3mYCi+LJnKFB/lrIPVM1iO0BmJHEX
 iaNKzzAwoageovrTdTqNnC6UVdwl8ptnXb9ajcp41FL9dzFfU6zDFt34ihfoouoYbSljIyyq8ob
 Dd1QXIW9oBn/fh3xSiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX2G4jqZuWhQv+
 dkOJ2eRegdsq7r2XDA7NJemkcP3FA5ywMhwST/fhS8WX910Czp+DMzy7oie27BruUK7k997V/mZ
 O7i+d32EqOnJDeAS56d4NoETikIZYX0=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba7a6b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=tpFWYQdyHN71iLxetsoA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280057

Guest interrupt-file mappings require interrupt-remapping code to
install or remove the MSI page-table pointer and address extraction
fields in every device context attached to a domain. Devices joining an
active MSI domain also need their device contexts initialized, so check
for an active MSI domain at attach time.

Add helpers to publish those fields to bonded devices and to invalidate
one or all MSI PTE translations. These helpers will be used by the IRQ
bypass implementation.

The per-device nr_forwarded_irqs counter is insufficient to detect
active MSI tables for the domain, so we introduce another counter which
is domain-wide. Like info->nr_forwarded_irqs, later patches which
introduce interrupt remapping support will manage the newly introduced
nr_forwarded_irqs counter.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 65 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  5 +++
 2 files changed, 70 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 86d5795a12dd..db4539fbcb95 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1189,6 +1189,28 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 	rcu_read_unlock();
 }
 
+void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsigned long addr)
+{
+	struct iommu_iotlb_gather gather = {
+		.start = addr,
+		.end = addr + SZ_4K - 1,
+		.pt.leaf_levels_bitmap = 1,
+	};
+	struct riscv_iommu_domain *domain;
+
+	domain = container_of(msi_table, struct riscv_iommu_domain, msi_table);
+	riscv_iommu_iotlb_inval(domain, &gather);
+}
+
+void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table)
+{
+	struct iommu_iotlb_gather gather = { 0 };
+	struct riscv_iommu_domain *domain;
+
+	domain = container_of(msi_table, struct riscv_iommu_domain, msi_table);
+	riscv_iommu_iotlb_inval(domain, &gather);
+}
+
 #define RISCV_IOMMU_FSC_BARE 0
 /*
  * This function sends IOTINVAL commands as required by the RISC-V
@@ -1311,6 +1333,11 @@ static void riscv_iommu_iodir_update(struct device *dev, struct riscv_iommu_dc *
 		WRITE_ONCE(dc->fsc, new_dc->fsc);
 		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
 		WRITE_ONCE(dc->iohgatp, new_dc->iohgatp);
+		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT) {
+			WRITE_ONCE(dc->msiptp, new_dc->msiptp);
+			WRITE_ONCE(dc->msi_addr_mask, new_dc->msi_addr_mask);
+			WRITE_ONCE(dc->msi_addr_pattern, new_dc->msi_addr_pattern);
+		}
 		/* Update device context, write TC.V as the last step. */
 		dma_wmb();
 		WRITE_ONCE(dc->tc, tc);
@@ -1329,6 +1356,40 @@ static void riscv_iommu_iodir_update(struct device *dev, struct riscv_iommu_dc *
 	riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
 }
 
+static void riscv_iommu_msi_table_set_dc(struct riscv_iommu_msi_table *msi_table,
+					 struct riscv_iommu_dc *dc, bool activate)
+{
+	if (activate) {
+		dc->msiptp = virt_to_pfn(msi_table->root) |
+			     FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
+					RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
+		dc->msi_addr_mask = msi_table->msi_addr_mask;
+		dc->msi_addr_pattern = msi_table->msi_addr_pattern;
+	} else {
+		dc->msiptp = 0;
+		dc->msi_addr_mask = 0;
+		dc->msi_addr_pattern = 0;
+	}
+}
+
+void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate)
+{
+	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_bond *bond;
+
+	/* The MSI table lock excludes bond updates for this domain. */
+	lockdep_assert_held(&msi_table->lock);
+
+	domain = container_of(msi_table, struct riscv_iommu_domain, msi_table);
+
+	list_for_each_entry(bond, &domain->bonds, list) {
+		struct riscv_iommu_info *info = dev_iommu_priv_get(bond->dev);
+
+		riscv_iommu_msi_table_set_dc(msi_table, &info->dc, activate);
+		riscv_iommu_iodir_update(bond->dev, &info->dc);
+	}
+}
+
 /*
  * IOVA page translation tree management.
  */
@@ -1514,6 +1575,10 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		kfree(bond);
 		return -EBUSY;
 	}
+
+	if (domain->msi_table.nr_forwarded_irqs)
+		riscv_iommu_msi_table_set_dc(&domain->msi_table, &dc, true);
+
 	info->dc = dc;
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(dev, &info->dc);
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 2876703a6698..deb57b6a6c4b 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -71,6 +71,7 @@ struct riscv_iommu_device {
 struct riscv_iommu_msi_table {
 	/* Protects attachment, interrupt forwarding state, and MSI PTE updates. */
 	raw_spinlock_t lock;
+	unsigned int nr_forwarded_irqs;
 	unsigned int nr_ptes;
 	struct riscv_iommu_msipte *root;
 	u64 msi_addr_mask;
@@ -81,6 +82,10 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
+void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsigned long addr);
+void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table);
+void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate);
+
 #define riscv_iommu_readl(iommu, addr) \
 	readl_relaxed((iommu)->reg + (addr))
 
-- 
2.43.0

