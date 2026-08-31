Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F8D4F55BF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188404; cv=none; b=p1BYTfZ+PlwNtdSrG5AGwbAzHxlIVmLnB8VAvbi3QMvJW+bvp55HIpmnW5j7EThHeMsYMjAckg6g2zFJ7ZAzKzvf0GAc05xzY0vG6IeaecyBDnBWvvo0gegcjkgH03NE7IBHH1hpacsTOPfgcc9KF64JAhY6VU7nOxjoPsr+m9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188404; c=relaxed/simple;
	bh=wvNLjAUKFK2bSs/ebUNhj1W8nRV1wVZBPvq7blsvyJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwD6nzMFwxfiwqGka4ERCuahWiYtDsyXHyoejt4gzlKxPbgD6tPdUD/ckqMnG/VylQC1xwqUp7cCB0bbsx3N5PrK8XkJQL4bTfEz+KCkH/eMqyEUWX6a5LFdPeMaYO0sC3hvf+sDRBJzadOqvRwlSMvFkfPfK7QnodlNx4icNfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbFOEZ/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWiZN52/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbFOEZ/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZWiZN52/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETR1s3969232
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eiVni6GVMGT
	zz+EBs6k7T0jGsM2I7x+UuWedP57pHFA=; b=BbFOEZ/2MDMNRfK6RTgunAjE/Rf
	hU2CzD9dfAdJSkYUI2bek5twFcar/2eb3WWJgoYbwF9SQ3wauSG6U0lB/JCPsVhm
	foMLCoEiHj3Aus5LE0BWOWdHRfpvv3DFv7p9h2eogW9rsA3Gy8mkJwfc0fP1EB2a
	H4v5XOBYtoZdpriDVfY0VT/yBIMYGM8aDDIrAuWH/ngc2aSZ9xHYW1IJNAgPHPEO
	hpuEzU09vbccpG1noXSbAWgvxOCa9ksDnoeew7vgYTBI6fFDDaxnSowDRSp09x2l
	5wAOQq6beOhBSfclRCuz4HS+VgA6ag0gIRTLzZAqz9EkR/lxdD23qEPDXng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h91gwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9382f9430deso564166685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188401; x=1788793201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiVni6GVMGTzz+EBs6k7T0jGsM2I7x+UuWedP57pHFA=;
        b=ZWiZN52/89RvnEZGC+E5QP0aI/hcLebw+2PJR7DjMbc7QGRq9r7+oFIHnhbI+AZH4l
         QES5bC0LJZcGwgw4Rk5n1aWTpfpIyhEch3F4bDclLdjXIohdwnkYk4K3zH6TzOe43kXo
         txSxCoCQZaSFbdD8Tc0GXLJTBgyBVai6EHHS3oJppwy4tvQuR4yXXwzJTRoyrECDn798
         96tyFFSl1qnwFuleVBaNOgsyKwA+p0C1dr5ht/h5N0qSu8VPhs63Ad67XxP9trhEwBIU
         2hDa4sHho+jmgsqiPpNhvSwtOYrhLS+9wan3qLEpGqbWg29Rr5l+uP4qX8m/Zg/HGSY2
         dgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188401; x=1788793201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eiVni6GVMGTzz+EBs6k7T0jGsM2I7x+UuWedP57pHFA=;
        b=hIU6rF4T34xmfE6DDBZPsM5Yrw6J5zYgycgmWvJu0M18VEz25BU4nyt24VfqKphcpw
         WbZ1Ae6nsgGyvKp1F3+Gs0GEQG9bRonMsE+VQ9aLwor1ZqWCrBES6Erk4xWJdKjFGAUk
         0HE51CX5tM2CA0QvSniOFxVsTa/ZwBjpQWfQ/ZodUlrx5Hv0dECel8jI7Vk1G/6qHkvx
         NhYVBZLQak7QVlYOGl1cArYDX//DUjZNAfHNuMhZqI8makcUC3KuXcTP07B2X/lcjlYY
         t/h5WeeiWt7fmoJMcfuHzvDYJoFCsigeqgfE5QBiCTRiqk2RMK7dqxxTok5Vu+sKpxHU
         SCpQ==
X-Gm-Message-State: AFuF++mJh3zzPqrzlutUx3skUX+t7/6AT7Llgu6g+ys33WoJMJbM5REs
	pDXJFo9N0aL/KMa5Rjd7mZOffkn6TF0SGPw6RyxsluBEuyw9v2HQzCm8VBgTrQGWb09jgK8vHnB
	UOxpikIwK8lc92x63VPl8pwSKTOFWOGxZJqLWd/1aaZmRdAcdDk5JQspIYBrVrJ6NToE=
X-Gm-Gg: AR+sD10J5j3xKER2fIXUtatEXX32HG3USUKTZjshvjNYpBi0rSELTPreRijvGanmg5+
	uZ6J5vmtDspUe85/yAiyzaD1BGVYicPlcQX6pRJeFgqIOKYGh2leNcpaaTI8IAZasjfvccodGGV
	LNV9yk/T+ZScCeUtXwOd1+fzjapmE3Xv0JkRXIw6uUcqmb2/hllMS/lcnBcNDAIHyLLUgMp/sKP
	9w1E6Tc1jn6FhfrKSmgo55oBSFX3Nd4xnKaD7OzZf+LU3FZqFBQOKog+mccO0oFOwsfsl3yzFns
	Q1XoyyV0gkIO05//1sL5Powdr3/MxCucmiZ8dBEbcijeUxws/XV3RWi689BVtuD8FGH7c1QLLZV
	9EkvDO4PkLUagaKp/7s/FtAfNIx7/DxF3oTU=
X-Received: by 2002:a05:620a:7103:b0:939:4890:98e1 with SMTP id af79cd13be357-9394890af20mr188724885a.42.1788188400585;
        Mon, 31 Aug 2026 08:00:00 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:4890:98e1 with SMTP id af79cd13be357-9394890af20mr188718485a.42.1788188400062;
        Mon, 31 Aug 2026 08:00:00 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843dcc00a6sm5323903f8f.33.2026.08.31.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:59 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 09/17] iommu/riscv: Report cache coherency capability
Date: Mon, 31 Aug 2026 16:59:35 +0200
Message-ID: <20260831145943.313726-10-andrew.jones@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a9596f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Ikd4Dj_1AAAA:8 a=ITBYzW_wA1tX7bdzKc4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DTaDWr7hCDa0sawzT4nOpsl98LDLusO8
X-Proofpoint-GUID: DTaDWr7hCDa0sawzT4nOpsl98LDLusO8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXxldQodQRXSvG
 Ke3brgBPPzf24z9FjrCEiuQyN8Hg55GSxNWTreenCoyCQ59WI4sv0QzuWjHBynDMnSve88h8YrX
 FWFXmG2JJLKyTv7yD4y1nn3lubEDRrg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXyWd3qMxUyP/I
 SRZbk8FUenE+UNZL9WHQWj1lNYo7TfIgJmYE3ZAg8jGhFGmncsQZZTxGjl8VAIkPOBUwQYrFwVw
 Tr6f+6Xl8IFU3/B0KOnvZGed2j+NvFyYF9pHwNiGjIqph1TzYEPjHPAy5ey/AJedljNNoBU3lxP
 /kvHSjpjsvtG0Pr6RsgZ3UeHaOz0njga9H2tidNbPugZbpuZRuXWiqc7L8dHj+u7XEyt69TEQLH
 mCHMbixfIr33Q3TDV3VgWgCi8xrMZuY/QudbZDRaoybRkrYLY5Hh27aq6XL2Eno4hkZCgN9jE+7
 8Z494lNbDVMWkiJ9Az8gA1MIteLxy/OstAB3Zq3vMzucI9SYqzu0lDB9rgRsTCg9vt56IFunc9C
 y7ewA74emRVspHO+MI00X2cg3IS6q4khGgYvmwpDkZA5xCkruuCzrlYKLEYphRlKzc5jJfEW5hb
 e95GCETtr5gMpZgxIjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

VFIO and iommufd require IOMMU_CAP_CACHE_COHERENCY because they use
IOMMU_CACHE mappings and have no userspace cache-maintenance path.

RISC-V page tables preserve physical memory attributes for IOMMU_CACHE
mappings. Svpbmt marks mappings without IOMMU_CACHE as non-cacheable,
but preserving physical attributes cannot make a noncoherent device
path coherent.

Report the capability only for devices marked DMA coherent. This limits
userspace assignment to paths that can honor cacheable mappings.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/riscv/iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab10..e5818ce44515 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -16,6 +16,7 @@
 #include <linux/acpi_rimt.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
+#include <linux/dma-map-ops.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
@@ -1422,6 +1423,16 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 	return generic_device_group(dev);
 }
 
+static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		return dev_is_dma_coherent(dev);
+	default:
+		return false;
+	}
+}
+
 static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -1483,6 +1494,7 @@ static void riscv_iommu_release_device(struct device *dev)
 
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
+	.capable = riscv_iommu_capable,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
-- 
2.43.0

