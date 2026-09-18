Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD9C434E21
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725497; cv=none; b=m9YNodw5p0kMWEvRp8Te6OiSODseCPVwM9/4rzjXvwiHsDik80EZciiqkL4l7c3m+MGTlphbDLLpHNUmXFrQLAoDQEDTTk3hFVeKfAGjIDfF4Vs/rgIrCCmWuEepXbpONyrVIpcVRhx/DFIJds7o4zEa2PZXARxcIQBAOA8EXO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725497; c=relaxed/simple;
	bh=ders7iAESZ8866+2mV9G60bzz+7+iAGfS0z3TsmC590=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6Y0nSKDItSRFzorDMqOzgJDiEN/uT+pnBBmgzz+SuBtozXxa3B74aIFrilVoNFTZeZ5XQpqwOqsT/VcJ69jUooO2UmfE8X7bm4AWL0pCuqoJPwuurPlWB/siAOHUkTVadWKH4QxX1vGNhQ4AJENbI3vm9vHpFSyHr+3E+n4viA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdUkMUfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HdZu56kb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdUkMUfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HdZu56kb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dPUs250737
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GnPAR6N5gn0W24ncV4H6uFc8PxtNqj0D9RFZF8Nw5FE=; b=JdUkMUfNDS0X7mJ7
	m26h28qi6+e5jhhc/lnD1lcGyHSY9Fi4+Ukqr7oCIsfAOfqpFuBo/aVdWo9Q13ZX
	vcN1l2QSty4Dgvmw9qTCpDEHustZcJHALDK6WCKMngCn38b7/hutcx+eEh4pPhob
	swO/B1YFC8PLzSP0ifrN35RnYg6SZ3ad7eFu1J3qELSQ+jvedIv4YoM39IqDoIOf
	Eocey6PgeVeudqJ7MycIBsoAuFst4mLMRwRUMq1cjAIU5x5BXXcmp8ujlH07uIEV
	6pXgR3JUWHnFN8Xp8n15/8AzhBUA90n71a51h1zcyK4z/576txJ3E7Qebi3IKkz5
	+jpzGQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs23909f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:58:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d0e306c7d0so1193675ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725493; x=1790330293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnPAR6N5gn0W24ncV4H6uFc8PxtNqj0D9RFZF8Nw5FE=;
        b=HdZu56kbGB9rsi1QX8c4iOpl65BnarpwB7oAC6ks4aHgO4hii1KJ5lV+eGkrIabBX1
         kIx5FTPs1ZCPGDqYnIa8sNUUkSLhqYBQ9O9OY2qwsDXVEo9NOgo05J8AwgD8GWKhGZha
         Vts4KohH5VAh+94F5WYVyf7c0HTzxxnXg99TJs9tSktp553h28cS22WM60C6SWDC+wBo
         mkzNoqlp+5kwMwwGa5R5Z4k0IFyWUgrK9hX7OhrYE8oycvPur3Dn/1pWzwpjLN3ueHWT
         SU8Sryjoo5p2S9Q9+I/pDzXMFTREsDXtWZS8gah6cSrdYhnriexattxr25UPbm1QE+m7
         JHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725493; x=1790330293;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnPAR6N5gn0W24ncV4H6uFc8PxtNqj0D9RFZF8Nw5FE=;
        b=ymO0fPdHkXDfzTkAyj/w/9foCwhBBut4tDf7OoFN0/5fQ0IRctsj3uG6ZBJYviGtAV
         J8B0tni3VwBUBWGYwuLRrtpi+HjgnhQ558vkLsYZRsID6apEYsEad1NuulJicvW51T7r
         0rodp1tfjiXIVkbGvcMyuukCNEyIINmFK8XhVuKwhFDMSU4aEiYtT4Y2kL3YAe3vSAkD
         183dwjg2MK27M7e9GxA3bsZSgJopAYldvql/wHFJ/zjuev+D54pXpP+bmfv3ITY7eAq8
         2ZZIdxSeihIFWHzatpNammPs+KblcMs7F55adpu4m7Qwi1jBcrYF+yhURKDgPA/Hq6dl
         podw==
X-Forwarded-Encrypted: i=1; AKwUvByw77hDS+pwrHLD8FpLoQXK+pW+b+4qqRwUnwNvA5EE3kknpmD10VKpiGNX2D12pfRTXBi0t5k5iQupC8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ko15Tf1eH9bSCYUnB0IBmg8zBa5EHnuRYdPfyhTNVDsk4Hd/t1
	/JglTL/m3wsCMIUCqom/qiy7Irw2ZcWcZfOM8bkSNP83CwU6eqrmrRa3hiyLN9uSEgAGjtC1Jna
	qvlBr6TlTRB/y+mO4ueHEln7m0UrvuwI48l37awEAzXRRtNnXbFnUquhUh4+cfIXht7Q=
X-Gm-Gg: AYBFou0aArg97tpFBIlF0gCH6nSocPp3wYUueUL+vKNpVL9ivxOIXElzY2Dm3DKRFX3
	+inWmP6yNDqeuhlc7p57lR3vYWE0GIdEMcfm6/SJfa6d3NN+5IEf26gNEog2JSFB/nNhPd8RPRf
	8HSJKVgPJWKRNndb65pYqD90yPuYqMiQ2yKxnw+wPB0j45lQbQvIM0OsZkBAUBuFjN9U4Nkh/mA
	/M/Yj50PQKo2MUjsE8XYJ6TvSoE2g1jzdVCh72NSKXkIugrakfknus3u9NAf+DXfg9BntQPDciC
	dXpwztXSU6YJRoBj/GQIFBHLeX9ch1RtR63qM9Z+L3Q7xuUgZlsI1Wf1nX7wrf42+Er5zsdgbnB
	ebs5bQqIy4s1PFpLtPI42esty8pBKCFo=
X-Received: by 2002:a17:90b:2ccb:b0:39e:2f57:67c8 with SMTP id 98e67ed59e1d1-39e599d6c1dmr3038889a91.4.1789725492473;
        Fri, 18 Sep 2026 02:58:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:39e:2f57:67c8 with SMTP id 98e67ed59e1d1-39e599d6c1dmr3038848a91.4.1789725491912;
        Fri, 18 Sep 2026 02:58:11 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce02b063sm2892970c88.9.2026.09.18.02.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:58:11 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        umang.chheda@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v3 2/5] arm64: ras: Add Device Tree frontend
Date: Fri, 18 Sep 2026 15:27:43 +0530
Message-Id: <20260918095746.3347893-3-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
References: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfX44QlFRRzo0iD
 VCDPnnkGpWOz/6vpgjIXcvaI5Mw9xQd0/q3SwkudHSHUBb62tCK9qAgy/6tkQkWue0PqJqHULn2
 Hj/2HYRyiBFlZbTvJWWtL05dHfUQmvs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfX1+gUxQQnQvoq
 jE2fJC/Y0fLPwwLIQkiC0Q7OZl5r8k+gT8HchdKg+9cpf5pG3U0ml6XudSxcNssXKEGoojgP2l1
 9YX2KA4CcmPEdTgKGiFZS3HFcHu7y+ibkwX91fcXdjr4e2j/mgqfQvv58lzd7npvJPR/CysiHUk
 /xsajOQhfGSOwIvVr4k13gWyQA2tErhhhO5CCksiKaV82XvG2xTzHe7nwtqGPJw5dl17gUIQk/U
 I1gSPeYeuYTEO/EGHNJwbDkQPfTaKfPcNTFV01l+4zFM7SHfXd3d2sgl7c/l0SHffyxVAhzUqFa
 x7rH74lZqMsW+wwwdUj3Zkxz4ejNktq7ez5WfEkWJomScGSgOeXIRkb9W9Rv5r/vw61EgGVXREU
 Rm+m9hHy9TsiaWUQ1gq+lXlTh47in08DRw2QhogQOVNwHzjjYmLzRQS02CP/CtItuzF5i4Ic2Zz
 Dk76jyAovvC3mvXrFPg==
X-Proofpoint-ORIG-GUID: EyJ8anGExupmPwDkBO3jPG1n6C-zR5O6
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad0b35 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aBVxLUBa_37c2xUlyAEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: EyJ8anGExupmPwDkBO3jPG1n6C-zR5O6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180137

Add a Device Tree frontend for the ARM64 RAS driver, allowing it
to be used on platforms without ACPI firmware.

The error sources defined in DT are registered as arm64_ras platform
devices at boot. The frontend produces the same software fwnode properties
as the ACPI path, so the core driver probes DT and ACPI nodes identically
without any firmware-specific knowledge.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/arm64/Kconfig  |  25 ++-
 drivers/ras/arm64/Makefile |   2 +
 drivers/ras/arm64/ras-of.c | 383 +++++++++++++++++++++++++++++++++++++
 3 files changed, 405 insertions(+), 5 deletions(-)
 create mode 100644 drivers/ras/arm64/ras-of.c

diff --git a/drivers/ras/arm64/Kconfig b/drivers/ras/arm64/Kconfig
index dcdeaa216d67..8bdb219bc90f 100644
--- a/drivers/ras/arm64/Kconfig
+++ b/drivers/ras/arm64/Kconfig
@@ -1,16 +1,31 @@
 # SPDX-License-Identifier: GPL-2.0
 #
-# ARM Error Source Table Support
+# ARM RAS driver
 #
 # Copyright (c) 2025, Alibaba Group.
 #

+config ARM64_RAS_DT
+	bool "ARM64 RAS Device Tree support"
+	depends on ARM64_RAS_EXTN && OF
+	help
+	  Enable Device Tree support for the ARM64 RAS driver.
+
+	  When selected, RAS error sources described in the Device Tree
+	  (arm,ras-processor, arm,ras-smmu, arm,ras-gic etc) are registered
+	  as platform devices at boot, allowing the driver to be used on
+	  platforms without ACPI firmware.
+
 config ARM64_RAS_DRIVER
 	tristate "ARM64 RAS Driver"
-	depends on ARM64 && ACPI_AEST && RAS
+	depends on ARM64 && (ACPI_AEST || ARM64_RAS_DT) && RAS
 	help
-	  This is the RAS driver for the arm64 architecture. It depends on
-	  the Arm Error Source Table (AEST) to provide basic register and
-	  interrupt information.
+	  This is the RAS driver for the arm64 architecture. It uses the
+	  ARMv8 RAS extension register interface to discover, configure,
+	  and handle hardware errors from processor caches, SMMUs, and GICs.
+
+	  On ACPI systems the error source topology is provided by the AEST
+	  ACPI table (requires ACPI_AEST).  On Device Tree systems it is
+	  provided by "arm,ras-*" nodes in the DT root (requires ARM64_RAS_DT).

 	  If set, the kernel will report and process hardware errors.
diff --git a/drivers/ras/arm64/Makefile b/drivers/ras/arm64/Makefile
index 6897798f7314..aee2f9de37f6 100644
--- a/drivers/ras/arm64/Makefile
+++ b/drivers/ras/arm64/Makefile
@@ -7,3 +7,5 @@ arm64_ras-y		+= ras-sysfs.o
 arm64_ras-y		+= ras-inject.o
 arm64_ras-y		+= ras-cmn.o
 arm64_ras-y		+= ras-storm.o
+
+obj-$(CONFIG_ARM64_RAS_DT)	+= ras-of.o
diff --git a/drivers/ras/arm64/ras-of.c b/drivers/ras/arm64/ras-of.c
new file mode 100644
index 000000000000..d876031f2474
--- /dev/null
+++ b/drivers/ras/arm64/ras-of.c
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/acpi.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+#include <linux/acpi_aest.h>
+
+#undef pr_fmt
+#define pr_fmt(fmt) "DT RAS: " fmt
+
+/* Maximum number of software fwnode properties per RAS node */
+#define RAS_OF_MAX_PROPS	20
+
+static const unsigned long ras_of_type_processor __initconst =
+	ACPI_AEST_PROCESSOR_ERROR_NODE;
+static const unsigned long ras_of_type_smmu __initconst =
+	ACPI_AEST_SMMU_ERROR_NODE;
+static const unsigned long ras_of_type_gic __initconst =
+	ACPI_AEST_GIC_ERROR_NODE;
+
+static const struct of_device_id ras_of_match[] __initconst = {
+	{ .compatible = "arm,ras-processor", .data = &ras_of_type_processor },
+	{ .compatible = "arm,ras-smmu",      .data = &ras_of_type_smmu      },
+	{ .compatible = "arm,ras-gic",       .data = &ras_of_type_gic       },
+	{ }
+};
+
+static const char * const __initconst ras_of_irq_res_names[] = {
+	[ACPI_AEST_NODE_FAULT_HANDLING] = AEST_FHI_NAME,
+	[ACPI_AEST_NODE_ERROR_RECOVERY] = AEST_ERI_NAME,
+};
+
+static const char * const __initconst ras_of_dt_irq_names[] = {
+	"fhi", "eri"
+};
+
+static int __init ras_of_build_node_data(struct device_node *np,
+					 u8 node_type, int index,
+					 int fhi_virq,
+					 u8 **data_out, u32 *size_out)
+{
+	*data_out = NULL;
+	*size_out = 0;
+
+	switch (node_type) {
+	case ACPI_AEST_PROCESSOR_ERROR_NODE: {
+		/*
+		 * Allocate the processor header plus the cache sub-structure.
+		 * resource_type is inferred from the presence of the 'cache'
+		 * phandle: if present the resource is a cache, otherwise it
+		 * is treated as a generic processor resource.
+		 * flags (SHARED/GLOBAL) are inferred from the interrupt type:
+		 * a PPI is per-PE (global); an SPI is shared across a cluster.
+		 */
+		size_t total = sizeof(struct acpi_aest_processor) +
+			       sizeof(struct acpi_aest_processor_cache);
+		struct acpi_aest_processor_cache *c;
+		struct acpi_aest_processor *proc;
+		struct device_node *cache_np;
+		u8 pflags;
+
+		proc = kzalloc(total, GFP_KERNEL);
+		if (!proc)
+			return -ENOMEM;
+
+		cache_np = of_parse_phandle(np, "arm,cache-ref", 0);
+		if (cache_np) {
+			proc->resource_type = ACPI_AEST_CACHE_RESOURCE;
+			c = (struct acpi_aest_processor_cache *)(proc + 1);
+			/*
+			 * alloc_ras_node_name() reads c->cache_reference as
+			 * the name disambiguator for shared/global nodes.
+			 */
+			c->cache_reference = cache_np->phandle;
+			of_node_put(cache_np);
+		} else {
+			proc->resource_type = ACPI_AEST_GENERIC_RESOURCE;
+		}
+
+		/*
+		 * Infer scope from the FHI interrupt type: a PPI is
+		 * per-PE (set GLOBAL); an SPI is cluster-shared (set SHARED).
+		 * alloc_ras_node_name() uses flags to choose the name format.
+		 */
+		pflags = irq_is_percpu(fhi_virq) ?
+			 ACPI_AEST_PROC_FLAG_GLOBAL :
+			 ACPI_AEST_PROC_FLAG_SHARED;
+		proc->flags        = pflags;
+		proc->processor_id = (u32)index;
+
+		*data_out = (u8 *)proc;
+		*size_out = (u32)total;
+		break;
+	}
+	case ACPI_AEST_SMMU_ERROR_NODE: {
+		struct acpi_aest_smmu *smmu;
+		struct device_node *smmu_np;
+
+		smmu = kzalloc_obj(*smmu, GFP_KERNEL);
+		if (!smmu)
+			return -ENOMEM;
+
+		smmu_np = of_parse_phandle(np, "arm,smmu-ref", 0);
+		if (smmu_np) {
+			smmu->iort_node_reference = smmu_np->phandle;
+			of_node_put(smmu_np);
+		}
+
+		*data_out = (u8 *)smmu;
+		*size_out = sizeof(*smmu);
+		break;
+	}
+	case ACPI_AEST_GIC_ERROR_NODE: {
+		struct acpi_aest_gic *gic;
+		struct device_node *gic_np;
+
+		gic = kzalloc_obj(*gic, GFP_KERNEL);
+		if (!gic)
+			return -ENOMEM;
+
+		gic_np = of_parse_phandle(np, "arm,gic-ref", 0);
+		if (gic_np) {
+			gic->instance_id = gic_np->phandle;
+			of_node_put(gic_np);
+		}
+		*data_out = (u8 *)gic;
+		*size_out = sizeof(*gic);
+		break;
+	}
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * Determine the register access type from the DT node:
+ *   no reg  -> system-register access (ERRSELR_EL1 + ERX*_EL1)
+ *   1 range -> memory-mapped access
+ *   2+ ranges -> single-record memory-mapped access
+ */
+static u8 __init ras_of_interface_type(struct device_node *np)
+{
+	int addr_cells, size_cells, reg_len;
+
+	if (!of_property_present(np, "reg"))
+		return ACPI_AEST_NODE_SYSTEM_REGISTER;
+
+	addr_cells = of_n_addr_cells(np);
+	size_cells = of_n_size_cells(np);
+	if (addr_cells <= 0 || size_cells <= 0)
+		return ACPI_AEST_NODE_SYSTEM_REGISTER;
+
+	reg_len = of_property_count_elems_of_size(np, "reg", sizeof(u32));
+	if (reg_len <= 0)
+		return ACPI_AEST_NODE_SYSTEM_REGISTER;
+
+	if (reg_len <= addr_cells + size_cells)
+		return ACPI_AEST_NODE_MEMORY_MAPPED;
+
+	return ACPI_AEST_NODE_SINGLE_RECORD_MEMORY_MAPPED;
+}
+
+static resource_size_t __init ras_of_mem_size(u32 gfmt)
+{
+	switch (gfmt) {
+	case ACPI_AEST_NODE_GROUP_FORMAT_16K:
+		return SZ_16K;
+	case ACPI_AEST_NODE_GROUP_FORMAT_64K:
+		return SZ_64K;
+	default:
+		return SZ_4K;
+	}
+}
+
+static u32 __init ras_of_virq_to_gsiv(int virq)
+{
+	struct irq_data *irqd = irq_get_irq_data(virq);
+
+	return irqd ? (u32)irqd->hwirq : 0;
+}
+
+static int __init ras_of_attach_fwnode(struct device_node *np,
+				       struct platform_device *pdev,
+				       u8 node_type, u8 itype, u32 gfmt,
+				       int index, int fhi_virq,
+				       u32 fhi_gsiv, u32 eri_gsiv)
+{
+	u64 rec_impl[14] = { };
+	u64 stat_rep[14] = { };
+	u64 addr_mode[14] = { };
+	u64 err_group_base = 0, fault_inject_base = 0, irq_cfg_base = 0;
+	struct property_entry props[RAS_OF_MAX_PROPS] = { };
+	struct resource res;
+	u8 *node_data = NULL;
+	u32 node_data_size = 0;
+	u32 nrec = 1;
+	int group_len, p = 0, i, ret;
+
+	of_property_read_u32(np, "arm,num-records", &nrec);
+
+	switch (gfmt) {
+	case ACPI_AEST_NODE_GROUP_FORMAT_16K:
+		group_len = 4;
+		break;
+	case ACPI_AEST_NODE_GROUP_FORMAT_64K:
+		group_len = 14;
+		break;
+	default:
+		group_len = 1;
+		break;
+	}
+
+	of_property_read_u64_array(np, "arm,record-impl",      rec_impl,  group_len);
+	of_property_read_u64_array(np, "arm,status-reporting", stat_rep,  group_len);
+	of_property_read_u64_array(np, "arm,addressing-mode",  addr_mode, group_len);
+
+	/*
+	 * DT binding: bit=1 means record IS implemented.
+	 * ras-core.c uses for_each_clear_bit() on record_implemented, so
+	 * bit=0 means implemented internally.  Invert before storing.
+	 */
+	for (i = 0; i < group_len; i++)
+		rec_impl[i] = ~rec_impl[i];
+
+	/* Named MMIO windows — only present on memory-mapped nodes */
+	if (itype != ACPI_AEST_NODE_SYSTEM_REGISTER) {
+		int idx;
+
+		idx = of_property_match_string(np, "reg-names", "err-group");
+		if (idx >= 0 && !of_address_to_resource(np, idx, &res))
+			err_group_base = res.start;
+
+		idx = of_property_match_string(np, "reg-names", "fault-inject");
+		if (idx >= 0 && !of_address_to_resource(np, idx, &res))
+			fault_inject_base = res.start;
+
+		idx = of_property_match_string(np, "reg-names", "irq-config");
+		if (idx >= 0 && !of_address_to_resource(np, idx, &res))
+			irq_cfg_base = res.start;
+	}
+
+	ret = ras_of_build_node_data(np, node_type, index, fhi_virq,
+				     &node_data, &node_data_size);
+	if (ret)
+		return ret;
+
+	props[p++] = PROPERTY_ENTRY_U8("arm,node-type",      node_type);
+	props[p++] = PROPERTY_ENTRY_U8("arm,interface-type", itype);
+	props[p++] = PROPERTY_ENTRY_U8("arm,group-format",   (u8)gfmt);
+	props[p++] = PROPERTY_ENTRY_U32("arm,error-records-count", nrec);
+	props[p++] = PROPERTY_ENTRY_U32("arm,error-records-index", 0);
+	props[p++] = PROPERTY_ENTRY_U32("arm,interface-flags",     0);
+	props[p++] = PROPERTY_ENTRY_U64_ARRAY_LEN("arm,record-implemented",
+						  rec_impl,  group_len);
+	props[p++] = PROPERTY_ENTRY_U64_ARRAY_LEN("arm,status-reporting",
+						  stat_rep,  group_len);
+	props[p++] = PROPERTY_ENTRY_U64_ARRAY_LEN("arm,addressing-mode",
+						  addr_mode, group_len);
+	props[p++] = PROPERTY_ENTRY_U64("arm,error-group-base",      err_group_base);
+	props[p++] = PROPERTY_ENTRY_U64("arm,fault-inject-base",     fault_inject_base);
+	props[p++] = PROPERTY_ENTRY_U64("arm,interrupt-config-base", irq_cfg_base);
+	props[p++] = PROPERTY_ENTRY_U32("arm,fhi-gsiv", fhi_gsiv);
+	props[p++] = PROPERTY_ENTRY_U32("arm,eri-gsiv", eri_gsiv);
+
+	if (node_data && node_data_size)
+		props[p++] = PROPERTY_ENTRY_U8_ARRAY_LEN("arm,node-specific-data",
+							 node_data, node_data_size);
+
+	ret = device_create_managed_software_node(&pdev->dev, props, NULL);
+
+	kfree(node_data);
+	return ret;
+}
+
+static int __init ras_of_init_one_node(struct device_node *np, u8 node_type,
+				       int index)
+{
+	struct resource res[AEST_MAX_INTERRUPT_PER_NODE + 1] = { };
+	struct platform_device *pdev;
+	u32 gfmt = ACPI_AEST_NODE_GROUP_FORMAT_4K;
+	u32 gsiv[AEST_MAX_INTERRUPT_PER_NODE] = { };
+	int virq[AEST_MAX_INTERRUPT_PER_NODE] = { };
+	int nres = 0, ret, i;
+	u8 itype;
+
+	itype = ras_of_interface_type(np);
+	of_property_read_u32(np, "arm,group-format", &gfmt);
+
+	pdev = platform_device_alloc("arm64_ras", PLATFORM_DEVID_AUTO);
+	if (!pdev)
+		return -ENOMEM;
+
+	if (itype != ACPI_AEST_NODE_SYSTEM_REGISTER) {
+		struct resource mmio_res;
+
+		ret = of_address_to_resource(np, 0, &mmio_res);
+		if (ret) {
+			pr_err("node %pOF: missing 'reg' for MMIO interface\n", np);
+			goto err_put;
+		}
+		res[nres].name  = AEST_NODE_NAME;
+		res[nres].start = mmio_res.start;
+		res[nres].end   = mmio_res.start + ras_of_mem_size(gfmt) - 1;
+		res[nres].flags = IORESOURCE_MEM;
+		nres++;
+	}
+
+	for (i = 0; i < AEST_MAX_INTERRUPT_PER_NODE; i++) {
+		int irq_num = of_irq_get_byname(np, ras_of_dt_irq_names[i]);
+
+		if (irq_num <= 0)
+			continue;
+
+		gsiv[i] = ras_of_virq_to_gsiv(irq_num);
+		virq[i] = irq_num;
+
+		res[nres].name  = ras_of_irq_res_names[i];
+		res[nres].start = irq_num;
+		res[nres].end   = irq_num;
+		res[nres].flags = IORESOURCE_IRQ;
+		nres++;
+	}
+
+	ret = platform_device_add_resources(pdev, res, nres);
+	if (ret)
+		goto err_put;
+
+	ret = ras_of_attach_fwnode(np, pdev, node_type, itype, gfmt, index,
+				   virq[ACPI_AEST_NODE_FAULT_HANDLING],
+				   gsiv[ACPI_AEST_NODE_FAULT_HANDLING],
+				   gsiv[ACPI_AEST_NODE_ERROR_RECOVERY]);
+	if (ret)
+		goto err_put;
+
+	ret = platform_device_add(pdev);
+	if (ret)
+		goto err_put;
+
+	pr_debug("registered RAS node %pOF as arm64_ras.%d\n", np, pdev->id);
+	return 0;
+
+err_put:
+	platform_device_put(pdev);
+	return ret;
+}
+
+static int __init ras_of_init(void)
+{
+	const struct of_device_id *match;
+	struct device_node *np;
+	int index = 0, ret;
+
+	if (!acpi_disabled)
+		return 0;
+
+	for_each_matching_node_and_match(np, ras_of_match, &match) {
+		u8 node_type = *(const unsigned long *)match->data;
+
+		ret = ras_of_init_one_node(np, node_type, index++);
+		if (ret) {
+			pr_err("failed to register RAS node %pOF: %d\n",
+			       np, ret);
+			of_node_put(np);
+			return ret;
+		}
+	}
+
+	if (index)
+		pr_info("registered %d RAS error source(s) from DT\n", index);
+
+	return 0;
+}
+subsys_initcall_sync(ras_of_init);
--
2.34.1

