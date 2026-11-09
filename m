Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262956;
	b=plj+rZy2G1Oa4j+4eVOWv+rAV7J/AdHLSwr4xNpz5Oixv4b/uDceumq+fCEW2WfOHZX7
	 2zjFGH8v3cjCZZ1Ize9LwhXcYb3XoRoM7hzgkRpUHGu/X8e3ryJ3AGoTzkAWZniuNk77U
	 AC7hy/390QcWDDSI/Zp2icZcMRyIvjTaO8gSzYEeLkeu1qjoe4W7I7O0hQ6/gjc3/tFV5
	 +Rw8/Yz5K36c2CC8ESV5w67CYIiSbf7D3d5GZk1H1kYAY4dGTKKKkXn52aRqpoPbki0Cp
	 2NWljbn0KmQH6MvAYyaIcPl+wGtY1n7v+MbOi1S2KyvbU/RgYWt3DzX/5KRqlEU98tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=St7kPuwx8TTNbOiHL4PqED3PJrgepz3coZt/Tr0CXik=;
	b=Dnpe5n/ZLZPXxZ4cVgybLRfxykxQi+7om31q3aC+s0CuZMe/DzX+kW2CoCpzDFv0pO4c
	 9e4ZItGUC9tA1uEy6JJe15KuXA507QesjOzmoowuhaQtizZaavw/LdvzAUtMABUNlz7ih
	 dYJFrosqrIt/jwjwPO8wnJynQo+TtIKTpWC4bzERydQTh1OF6sLnFl9JSzCWkjETE0ZsN
	 7ekBNROf5R2y6cz8mUZVP8rZKxahQ69eSk2r4yUr+7OeBhp08Z9Cn+IEa0ubd08523u1T
	 8zmGU/KyWZYWeRWoZ/eDQr2AhH687rFbjhVfFrYLKzeEGQZnkmfsQeKKZTbEy7EP/6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ajtDnW5e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hR02iVjD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7396B60A261A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7396B60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ajtDnW5e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hR02iVjD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9L9u8s1392227
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 22:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=St7kPuwx8TTNbOiHL4PqED3PJrgepz3coZt
	/Tr0CXik=; b=ajtDnW5e4q8b0C5U7nUAfVEjLFRrUXtHsy+nsTE2A0LcKOVRcf6
	LKO3fwxicgD3OSVqPzZWYiQ8ceKqU5szlzyRmKlCQqutYkqFRsCL3UAco8Etfn14
	tLro5FQqMCzGbHeE5qEN5co4PrG3Srtk0C549MlU8nAVS3UDxLx2AGg1U0lFtyum
	hSMD813FFNE0GP2osx7hK59sZujkfWUI6KSNURdKc/8+35+k64TE/03uTNbEMQMc
	fgm1iwzjY4MputaLPqXHbEWieZGoVu8oXxCnbM+44uyNU3FrmSc79MRs4l3eh6LI
	5ZYLIk2fchik5+wD8rUtwGqMiEh2BJnsv/A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5tdsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:22:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso1986547eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794262954; x=1794867754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=St7kPuwx8TTNbOiHL4PqED3PJrgepz3coZt/Tr0CXik=;
        b=hR02iVjDYmJB/YQhsMyBxFEnC3yj/qtpD8X2pGc9xlfox2PwV0uPvYh5Tf8T0GuwKD
         P+Bc0r9iUXZFZzH9QWI3Is31gRxiznvHWStS1YhJmLt0jjACN/jl2t7O614b0FjYpyk3
         DXSRqXkAkHWqziQQ5K92gc57kq+W+bJyfCV436jzQkPi80Pu2bZdny9ynkHnjpA0iSJg
         NOk0Dp3y2m+fC4yF2wu6VIP0EG30hmHMEkRSWPOFwyPBHli8C29cb243rkgkjAfsRytN
         rVCMxWGfIMl7q8nFCagMxzvc5JhNlqXRPA1UVrc/YrIdkxAjAktrqTquK4ovEPeVG11v
         twxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794262954; x=1794867754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=St7kPuwx8TTNbOiHL4PqED3PJrgepz3coZt/Tr0CXik=;
        b=oTsQAZ2NAtCvFumeMXZs7liPXj/BJ0rhorjCftQgop9AbOfQjn1GZUQK9Iv/kraXcb
         akkyKB++1tPipcRHSf/45Z01q/+gB4uyJ+s2v/Styt38kn3VjLSw2pW32hF1kVz2CQe+
         dkXZEZC4apy2jWZIr+p+KXoe1MDsfZKY0hiJ+t9LjYRQ82gtroXehW2EUQm2Fj2OILJR
         n28XYY6TnkEJjQY0+zY8kLWRNLCKtzWWngxdrHmmvsJ+gN6QbHVIFYwJbT/9nk7Xu5+1
         Tjw1ihtyRmPHm9GPnSAxfmEmcW5wTRImCHKhQ/tYsOh7T2pkzbrQs07nWgU7ukrfobCQ
         nh2A==
X-Forwarded-Encrypted: i=1; AL+hErHWWohxKZDcDxhWgEO3IA2dr1SgKNRSa2llt6iW0doTsppKR5Z2PF7qwkBD4LXDo4mh501kdusCHBf5zWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sDK11GZ/0FVfuHjopV2+bWPaD7nZXRTh/a6jRaHMu3QroFB7W
	ebEBI1vCuky7KGl6gspyVxSVIeUI8ucwbhMu5ecO3Rugtkt405Pe/Ms3Ua+/dMiGigsR+plgMWg
	71JEDygbp98XG1o/fCbUvfZkANMLfp/DRnZjNaB6x2w++gWCKGvCNNJBVW/iHx98Roec=
X-Gm-Gg: AYBFou231PEj1OHybnAJND42JStvI6CtkJvzPFw+72mVxMJR7TGCHVjlOs3ob9XEi4e
	sPmW3TpfngB3uq5Y0YeCAaqL2WX4mNU8dT20ihaQXd4CH/rnvSYN97y9YMZOIbhT/1YKvssA2Zo
	UKf7nkQqXfciGfqzhQVLa5DS3rDV6tZgf8nTm4ED4vS0QEXkUhiVJZCFzZyLfgeyfGTh8+PqhEu
	0ChzxB4GmkwWRi90DgBaiFtvYShhxeBkeRYCyaLo56B3H5cUZh6kVyhufY53rPBBtcCyL0hu8l4
	GFlXV5T/DmQF8yNCl6qSJLiufrvA8YDEbmENmtPAWu+D9cz3WlE2BrCa6F4yJ1A4WkMqkzYxMWf
	qKuaOM22TiUmzASokXfvnBxEMO8HiWTop0kjSqmA6qnNTqt6C9mv+YW2PYrz44upVTV/9BHzaWP
	Kj4vePeW5yoiaL40qAPJ5ur/eDYMJb9enenDGXh4dknDRcut6/6L8kDEQuu0VhoVzR
X-Received: by 2002:a05:7301:781:b0:36f:4a4e:6218 with SMTP id 5a478bee46e88-3753ab03351mr439484eec.38.1794262953792;
        Mon, 09 Nov 2026 14:22:33 -0800 (PST)
X-Received: by 2002:a05:7301:781:b0:36f:4a4e:6218 with SMTP id 5a478bee46e88-3753ab03351mr439447eec.38.1794262953068;
        Mon, 09 Nov 2026 14:22:33 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm1252133eec.8.2026.11.09.14.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:22:32 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com
Cc: joro@8bytes.org, kees+treewide@kernel.org, gregkh@linuxfoundation.org,
        dakr@kernel.org, panchuang@vivo.com, prakash.gupta@oss.qualcomm.com,
        akaieurus@gmail.com, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/arm-smmu: Work around Qualcomm SMMU-500 TLBIVAL granule issue
Date: Tue, 10 Nov 2026 03:52:14 +0530
Message-Id: <20261109222214.3988154-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4OSBTYWx0ZWRfX+xG8EWd7Qixm
 ga82HwTDYF4XrV4R9oKAqD4eY6NzpR4c7+NcEpcCvJXEFRXVRbgXVVTy2FvDwYrEgbm7+Lb4u8r
 FtCgdxtvxl++5h0e/Cp7FC50T5ZnK8g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4OSBTYWx0ZWRfX7ahn8NDf6ptH
 wMcUmudezDG8MhTh/COXuUjES3Yo57ZHh/iCZIpFWSQQ8PQ4LcA2kP3/R+6eblYK74Q8jfTdp30
 AB4OvJi2LDgBbzErCyWnpOCjpOgBUcYVTTEKUkqi8eKCq2r87vhEiXY8qKtWbDrvuGfXK+cwMtN
 qMvGCm/uQz3ax0s3FOk7enpetGbEyUewZyAN4N0NqQuqvOiAnaWRjgDzXFtsu8H22mVUzvQOH9A
 2yIA/DAFkkfcJDOUbDEVkFw4ajLX9zo6NpO+XAn0EiCYly+Y0CO6CNf8KNAYBPrg4PP2RbplJkG
 gt35+6UQLZ+9BZtHHcH6yxuBLsMFstM5hGCLJa0ARGhgBbNBP77RN8iic7nn5FjLoPLFwoF94vP
 P8RFIcdsowp17+PMT4r9GBcjbYSojRx9KHQx3FM9QX6sFQxZtvwxIw09zqzXQ4OmiiI2REGL1/u
 SY4c+vWu8ikAo78FEIg==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af247aa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=cRIvcy3ebCmbRUWD2K0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: LAN_5T4AVXUR4KBXQq7d6Q9m6l487BeU
X-Proofpoint-GUID: LAN_5T4AVXUR4KBXQq7d6Q9m6l487BeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090089

From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>

Qualcomm SMMU-500 has an issue with TLBIVA/TLBIVAL where only the
base-page-size entry at the base IOVA is invalidated, leaving stale
TLB entries for the rest of the range.

This causes use-after-free: after dma_free_coherent() unmaps a large
buffer, the device can still access freed physical memory through stale
TLB entries. On FastRPC workloads this manifests as ADSP crashes when
the ELF loader writes to a freed PA that has been reallocated.

Force the TLB invalidation step granule to the minimum page size for
all Qualcomm SMMU-500 domains, ensuring each page in the range is
individually invalidated. The minimum page size from pgsize_bitmap is
used rather than hardcoded 4K to correctly handle 16K and 64K granule
configurations.

This increases the number of TLB invalidation operations for large
ranges, but correctness takes precedence.

Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 28 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      |  3 +++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 +
 3 files changed, 32 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..a51152b4e24b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -430,6 +430,24 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ }
 };
 
+static const char * const qcom_smmu_500_tlbival_errata[] = {
+	"qcom,eliza-smmu-500",
+	"qcom,glymur-smmu-500",
+	"qcom,hawi-smmu-500",
+	"qcom,ipq9650-smmu-500",
+	"qcom,kaanapali-smmu-500",
+	"qcom,maili-smmu-500",
+	"qcom,milos-smmu-500",
+	"qcom,nord-smmu-500",
+	"qcom,sdx75-smmu-500",
+	"qcom,shikra-smmu-500",
+	"qcom,sm8550-smmu-500",
+	"qcom,sm8650-smmu-500",
+	"qcom,sm8750-smmu-500",
+	"qcom,x1e80100-smmu-500",
+	NULL,
+};
+
 static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
@@ -440,6 +458,16 @@ static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 
 	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
 
+	/*
+	 * Qualcomm SMMU-500 has an issue with TLBIVA/TLBIVAL where only
+	 * the base-page-size entry at the base IOVA is invalidated. Force
+	 * the minimum page granule on affected SoCs to ensure the full range
+	 * is covered.
+	 */
+	if (of_device_compatible_match(smmu->dev->of_node,
+				       qcom_smmu_500_tlbival_errata))
+		smmu_domain->cfg.force_min_tlbival_granule = true;
+
 	client_match = qsmmu->data->client_match;
 
 	if (client_match)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8d50a4ad221d..92251536e9b0 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -286,6 +286,9 @@ static void arm_smmu_tlb_inv_range_s1(unsigned long iova, size_t size,
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	int idx = cfg->cbndx;
 
+	if (cfg->force_min_tlbival_granule)
+		granule = 1UL << __ffs(smmu_domain->domain.pgsize_bitmap);
+
 	if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
 		wmb();
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328..85d1f2d7ec50 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -359,6 +359,7 @@ struct arm_smmu_cfg {
 	enum arm_smmu_cbar_type		cbar;
 	enum arm_smmu_context_fmt	fmt;
 	bool				flush_walk_prefer_tlbiasid;
+	bool				force_min_tlbival_granule;
 };
 #define ARM_SMMU_INVALID_IRPTNDX	0xff
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.34.1

