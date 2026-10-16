Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F4736C0C8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120950; cv=none; b=YVhGampvBik6nPpmMMh1iCIMgnvJZKuO9derI6EPRrA9YcbfJK09W81/W0FDTJcOxWPPt6cEDdYHUrV75ZWHKOEmmdmwnx2uRxn0+4t1pE1cDab2Gj2ihSnC3L/mlxHbr7glab4rCOj05TM2d8Cqdcw8tkkDDavKYrW91CKiF5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120950; c=relaxed/simple;
	bh=dQxNp9a0iGZ6rsdoAUkqpmBsYQzzBsf1iMzwAMQz/NI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JISt+ICaAteoXk1SynTSl/iL6sXUe0zRcPgKLSCujKACynAf4xyrQOLyaIsj+FPOrATDvLo6b1lVkrAPSmiVReymLvAyELj3p2VnxBglyHGs8EycuYpnU0LrLPWxXjm/3J6MtxNS3P0CSsIpJ7WINVEmoUPin3IUVfjd4s7qbBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhzZtxuw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALu77b3g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhzZtxuw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALu77b3g"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNiQCw3493014
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFSUrf52fZeZMeoppAayxkZehctWo1nANACcjlXP9pA=; b=IhzZtxuwPqElPCY7
	WhGPCOTJ/drqiHBzvNTTuMOvIdlPyY83jY4LOR0XE5KfeGx6bQ72ZlTeWHE01Wp8
	nBruy41A6zmfThknvOivMwuqgWqS9K1MmpiEqb76U58NV+jkO90fJW+vtXWTh9NF
	edaFRvz+7w2bTufdFIAF7VIaQw1bEZfxy9PZPjuKPMhKy3WjCBVyqi6u59ilRMdE
	Krugt3DoOcBSBMj9FOMSK73JIVvHoi4CZMbDaDYXBXpxJmWYHWWeZ6SMB7VOIsnI
	OvTu1+67KvV2KE+zZZrrKVQoMXs5zacjFGdBy/OkEmFJ/WgKll7IFNna83uWJB9v
	0BB9Ag==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wt8xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so12130042eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120946; x=1792725746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFSUrf52fZeZMeoppAayxkZehctWo1nANACcjlXP9pA=;
        b=ALu77b3gsoYe9X3pg/d5Z9Elq4c+R5VoOJMNYpk8N5smUIh2nI1WNW8j0F/pGZqkhG
         S/+QttW5MKGi0i5rL0P0QJp7/5oB2RiSXzeFJJgyxOUfhijtucr1idQ77bXJkyq/9Cp1
         LeN+pqHJxWiHpo7B+2l1l1wkszeYJ86DEm3lXP3q/Jr2U0zye3TGypflSC82fyl9U4+G
         ReiAX2Wj2/LP4wZ+wcGk3j4XVi19lJzVGsK2zCoevQEE2y1VMPgJwlDy1zF8RC/mQhMo
         uV6531nHybaNv5cGrW7q2bT6c1+gxsQA7DHxa6h71VU0vsQJj9T8PP52mxoJeEvjo6f1
         85pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120946; x=1792725746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFSUrf52fZeZMeoppAayxkZehctWo1nANACcjlXP9pA=;
        b=UW6r/xj2x7BpQLXh5tBgBQSvKAnqt+cidZUB9U1yrmW37kakPnEzl4eyfAIePl8mwK
         jdop6nklnEdJP7qTCYl4h7RkccHSdQJWKSlnwEIl6lHE9MfYNtt0upthlpeIhM+1rei8
         JLZIW5GDlq8Yz6rrYTZ7bcSCTXmNpLFnvXcQc5ii7hgfRPsKiUzgbvI8xbC0W1Ao1oCu
         QvFTCPdA6rMSFPIGZlZmKNlzBHHvpiUvZEKC+PQlKgx7qRq7FfrIS5LFjXLm2zEjy8BZ
         Asb+4ZjBL1DFki0daahvV385c6UXbapwzMwqzFl6L6aRQ2u0tqOUukyjyR2fxfzcaHWH
         zq5Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9kRLNnMP4dHI90rbOFlXpRJpY5FMn0LLldnfJrgHeTY2SfwIPSyU0yJe3y5UCWnws9kH/7uTquYFrKeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0DUxcB5KJx6fTpVgY7N5y6wTI4TWqnwy6JSZDq5TtfWS5oz+/
	57TVYziuot5d7rxE8rTa64+QU6r/E8a373rSWgul9Y3WaHjldyO2cF24DdMxzdx8PIuLz4tg6/D
	SmMfU9oukTkKl7uiBVuuxfrx1IdsTZwz0op/YUsxY2uL2khN/GpUINHuzHnj8TIoAEtY=
X-Gm-Gg: AYBFou0F4bSAi5CdSDrID/Y7+mUHargjddnX4rsPjjfK+9X7nOy93kTDrLu7pI7gKsH
	GpQpObeQ732zPEaXPjzLW/MGMeXH6HnYLMJg558cCSRpdABQrqndTHgni5IQORki2qCVomBvzL6
	2HGZ5dSOGTNJ+OjDurhqdFhQA1rQ6HQzopVy8/nuJjRJuZuNnaXyJaN78Io7ow7RiWeqJwcEXWm
	rMsAtjoJ7E4Uyg7/VyEw9vdZyw0k+LrXM3mCopKKQ1A4BuIG1fWh9DqWmjnKy/GtJ4/0foMGxl6
	/s2I9dLJEIAXvk94Hso5/QBu2FF7ETL9aycF547Bx3OO2tP0t1Np3u7wCnsZSqxiZG+kWMNDaN7
	pED9vrDM5LfrcP69W8CdIqbiChyp9pUZ9GbTLMm6KtUPwjANpSzf/kkLunXQdstypX0legCUm5F
	T5wWKDliYWC4BxEDv9wsbNKQ==
X-Received: by 2002:a05:693c:2806:b0:353:7f17:4358 with SMTP id 5a478bee46e88-3537f174c08mr25480183eec.24.1792120945920;
        Thu, 15 Oct 2026 20:22:25 -0700 (PDT)
X-Received: by 2002:a05:693c:2806:b0:353:7f17:4358 with SMTP id 5a478bee46e88-3537f174c08mr25480152eec.24.1792120945315;
        Thu, 15 Oct 2026 20:22:25 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:24 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:45 +0530
Subject: [PATCH ath-next v2 08/17] wifi: ath12k: Add hif operation support
 for QCN6432
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-8-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 1MHsOiRDcNDegidL7ClwJcEbUufhsQoN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX74v2beJAo+Dv
 33u22MzymwwRWuPCdYiRi09YpUcrtSTOvM5EAaaXjhGs+66SVxk8ZUsYQX7ICgv+SpUx3DasZDW
 fcpA2mnfXAw1A3TQGUqU977Ey4/GV+zu28vHoDh1jaPW53lAjLiUWLu9pTEjDZT6VxgqbDRbGIK
 Xx18ax9fOGe3YhPi2WSeGjP5K3kqaKjN81ajgF1a2k7flIfxG+fE1bS+x4bZWR8Fn3XN2ZPRMDf
 DEN3H+iXfv60DU5i4uSz0WPFu4jcUJrNvD06FZz2KRIGsAn96ZD3OwrHjgZGHcuVecWfNTJjQe2
 06zXNkZnARy/zDN8zRoxWGFkQ+NAFW6/plMxss3C10WsIRba36E7yJ5BN7E1Gd+cM/7AgkH3yvT
 O17Mn9SkxqZ7g3oEbZC1cSyRehN0+HfsrdHgpeIuaXFNhVwwXYQqyudUkAOnxwekPKbCM3gLmWd
 OAIh5kwl3WYjh+NfE9g==
X-Proofpoint-GUID: 1MHsOiRDcNDegidL7ClwJcEbUufhsQoN
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad19873 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KhQMAEluCXMSMqz3IAgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX3oWS7CSP3soB
 SVWdMFItrpN+vXidQUuijtRcuCIzf+ak4Tl5jijMlvvI7ZoNqbGazDIeiyxaNK4W3YDj9ReP0yv
 HCIQhlcaBbzmvQEdGVEB2Kqp45+28TA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160012

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hif operations (ath12k_hif_ops) for the QCN6432 Wi-Fi driver.

Reuse existing hif operations such as power_up and power_down from
IPQ5332, as they are identical on QCN6432. Similarly, reuse operations
like irq_enable, irq_disable, get_user_msi_vector, and
map_service_to_pipe from QCN9274, since their behavior matches on
QCN6432.

Implement QCN6432-specific operations such as start, stop,
cmem_read32, cmem_write32, read32, write32, get_msi_address, and
config_static_window in a new pcic.c file.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Co-developed-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Makefile    |   2 +-
 drivers/net/wireless/ath/ath12k/ahb.c       |  23 ++++
 drivers/net/wireless/ath/ath12k/ahb.h       |   9 ++
 drivers/net/wireless/ath/ath12k/core.c      |   3 +
 drivers/net/wireless/ath/ath12k/core.h      |   2 +
 drivers/net/wireless/ath/ath12k/hif.h       |  30 ++++++
 drivers/net/wireless/ath/ath12k/pcic.c      | 156 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pcic.h      |  22 ++++
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c |   7 ++
 9 files changed, 253 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 3b39b2c33307..861ec85eebed 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -22,7 +22,7 @@ ath12k-y += core.o \
 	    fw.o \
 	    p2p.o
 
-ath12k-$(CONFIG_ATH12K_AHB) += ahb.o
+ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
 
 obj-$(CONFIG_ATH12K) += wifi7/
 
diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 2c55aae06dd0..bcb49ff07aa8 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -16,6 +16,8 @@
 #include "ahb.h"
 #include "debug.h"
 #include "hif.h"
+#include "pci.h"
+#include "pcic.h"
 
 #define ATH12K_IRQ_CE0_OFFSET 4
 #define ATH12K_UPD_IRQ_WRD_LEN  18
@@ -790,6 +792,26 @@ const struct ath12k_hif_ops ath12k_ahb_hif_ops = {
 };
 EXPORT_SYMBOL(ath12k_ahb_hif_ops);
 
+const struct ath12k_hif_ops ath12k_ahb_hif_ops_qcn6432 = {
+	.start = ath12k_pcic_start,
+	.stop = ath12k_pcic_stop,
+	.cmem_read32 = ath12k_pcic_cmem_read32,
+	.cmem_write32 = ath12k_pcic_cmem_write32,
+	.power_down = ath12k_ahb_power_down,
+	.power_up = ath12k_ahb_power_up,
+	.read32 = ath12k_pcic_read32,
+	.write32 = ath12k_pcic_write32,
+	.irq_enable = ath12k_pci_ext_irq_enable,
+	.irq_disable = ath12k_pci_ext_irq_disable,
+	.get_msi_address = ath12k_pcic_get_msi_address,
+	.get_user_msi_vector = ath12k_pci_get_user_msi_assignment,
+	.map_service_to_pipe = ath12k_pci_map_service_to_pipe,
+	.ce_irq_enable = ath12k_pci_ce_irqs_enable,
+	.ce_irq_disable = ath12k_pci_ce_irq_disable_sync,
+	.config_static_window = ath12k_pcic_config_static_window,
+};
+EXPORT_SYMBOL(ath12k_ahb_hif_ops_qcn6432);
+
 static irqreturn_t ath12k_userpd_irq_handler(int irq, void *data)
 {
 	struct ath12k_base *ab = data;
@@ -1324,6 +1346,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 	ath12k_dbg(ab, ATH12K_DBG_AHB, "AHB device family id: %d\n", device_id);
 
 	ab_ahb->device_family_ops = &ath12k_ahb_family_drivers[device_id]->ops;
+	ab_ahb->reg_base = ath12k_ahb_family_drivers[device_id]->reg_base;
 
 	/* Call device specific probe. This is the callback that can
 	 * be used to override any ops in future
diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index ecc4054f8742..373dc3b92728 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -11,6 +11,11 @@
 #include <linux/platform_device.h>
 #include "core.h"
 
+struct ath12k_ahb_reg_base {
+	u32 umac_base;
+	u32 ce_reg_base;
+};
+
 #define ATH12K_AHB_RECOVERY_TIMEOUT (3 * HZ)
 
 #define ATH12K_AHB_SMP2P_SMEM_MSG		GENMASK(15, 0)
@@ -65,6 +70,7 @@ enum ath12k_ahb_userpd_irq {
 
 struct ath12k_base;
 extern const struct ath12k_hif_ops ath12k_ahb_hif_ops;
+extern const struct ath12k_hif_ops ath12k_ahb_hif_ops_qcn6432;
 
 struct ath12k_ahb_device_family_ops {
 	int (*probe)(struct platform_device *pdev);
@@ -103,12 +109,15 @@ struct ath12k_ahb {
 	bool scm_auth_enabled;
 	struct ath12k_ahb_rproc_info *rproc_info;
 	bool supports_multipd;
+	u32 static_window_reg;
+	const struct ath12k_ahb_reg_base *reg_base;
 };
 
 struct ath12k_ahb_driver {
 	const char *name;
 	const struct of_device_id *id_table;
 	struct ath12k_ahb_device_family_ops ops;
+	const struct ath12k_ahb_reg_base *reg_base;
 	struct platform_driver driver;
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 25987bc58556..d2ce01e0d7ac 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1350,6 +1350,9 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
 	int ret, i;
 
+	if (ab->hw_params->hybrid_bus_type)
+		ath12k_hif_config_static_window(ab);
+
 	ret = ath12k_core_start_firmware(ab, ab->fw_mode);
 	if (ret) {
 		ath12k_err(ab, "failed to start firmware: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index eaea601ab32d..293c7561b27a 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1161,6 +1161,8 @@ struct ath12k_base {
 	struct {
 		const struct ath12k_msi_config *config;
 		u32 ep_base_data;
+		u32 addr_lo;
+		u32 addr_hi;
 	} msi;
 
 	/* must be last */
diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index aecdb0c5f285..faeabd2c3d2a 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -12,6 +12,8 @@
 struct ath12k_hif_ops {
 	u32 (*read32)(struct ath12k_base *ab, u32 address);
 	void (*write32)(struct ath12k_base *ab, u32 address, u32 data);
+	int (*cmem_read32)(struct ath12k_base *ab, u32 address, u32 *value);
+	int (*cmem_write32)(struct ath12k_base *ab, u32 address, u32 data);
 	void (*irq_enable)(struct ath12k_base *ab);
 	void (*irq_disable)(struct ath12k_base *ab);
 	int (*start)(struct ath12k_base *ab);
@@ -31,6 +33,7 @@ struct ath12k_hif_ops {
 	void (*ce_irq_disable)(struct ath12k_base *ab);
 	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
 	void (*coredump_download)(struct ath12k_base *ab);
+	void (*config_static_window)(struct ath12k_base *ab);
 };
 
 static inline int ath12k_hif_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,
@@ -126,6 +129,24 @@ static inline u32 ath12k_hif_read32(struct ath12k_base *ab, u32 address)
 	return ab->hif.ops->read32(ab, address);
 }
 
+static inline int ath12k_hif_cmem_read32(struct ath12k_base *ab, u32 address,
+					 u32 *value)
+{
+	if (!ab->hif.ops->cmem_read32)
+		return -EOPNOTSUPP;
+
+	return ab->hif.ops->cmem_read32(ab, address, value);
+}
+
+static inline int ath12k_hif_cmem_write32(struct ath12k_base *ab, u32 address,
+					  u32 data)
+{
+	if (!ab->hif.ops->cmem_write32)
+		return -EOPNOTSUPP;
+
+	return ab->hif.ops->cmem_write32(ab, address, data);
+}
+
 static inline void ath12k_hif_write32(struct ath12k_base *ab, u32 address,
 				      u32 data)
 {
@@ -153,4 +174,13 @@ static inline void ath12k_hif_coredump_download(struct ath12k_base *ab)
 	if (ab->hif.ops->coredump_download)
 		ab->hif.ops->coredump_download(ab);
 }
+
+static inline void ath12k_hif_config_static_window(struct ath12k_base *ab)
+{
+	if (!ab->hif.ops->config_static_window)
+		return;
+
+	ab->hif.ops->config_static_window(ab);
+}
+
 #endif /* ATH12K_HIF_H */
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
new file mode 100644
index 000000000000..e3c8476af459
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/module.h>
+#include "ahb.h"
+#include "core.h"
+#include "debug.h"
+#include "hif.h"
+#include "hw.h"
+#include "pci.h"
+#include "pcic.h"
+
+void ath12k_pcic_config_static_window(struct ath12k_base *ab)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	u32 umac_window = u32_get_bits(ab_ahb->reg_base->umac_base, WINDOW_VALUE_MASK);
+	u32 ce_window = u32_get_bits(ab_ahb->reg_base->ce_reg_base, WINDOW_VALUE_MASK);
+	u32 window;
+
+	window = (umac_window << 12) | (ce_window << 6);
+	writel_relaxed(WINDOW_ENABLE_BIT | window, ab->mem + WINDOW_REG_ADDRESS);
+	ab_ahb->static_window_reg = readl_relaxed(ab->mem + WINDOW_REG_ADDRESS);
+}
+
+static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+
+	u32 window_bits, new_window, reg_value;
+	const int max_retries = 10;
+	int i;
+
+	window_bits = u32_get_bits(addr, WINDOW_VALUE_MASK);
+
+	/* Update window bits [5:0], preserving other bits */
+	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits, 0x3f);
+
+	if (new_window == ab_ahb->static_window_reg)
+		return 0;
+
+	reg_value = WINDOW_ENABLE_BIT | new_window;
+	writel_relaxed(reg_value, ab->mem + WINDOW_REG_ADDRESS);
+
+	/* Wait for the write to take effect */
+	for (i = 0; i < max_retries; i++) {
+		if (readl_relaxed(ab->mem + WINDOW_REG_ADDRESS) == reg_value) {
+			ab_ahb->static_window_reg = reg_value;
+			return 0;
+		}
+
+		usleep_range(1000, 2000);
+	}
+
+	ath12k_warn(ab, "failed to set static window for cmem init\n");
+	return -ETIMEDOUT;
+}
+
+int ath12k_pcic_cmem_read32(struct ath12k_base *ab, u32 addr, u32 *value)
+{
+	int ret;
+
+	if (!value)
+		return -EINVAL;
+
+	if (addr < WINDOW_START) {
+		*value = readl_relaxed(ab->mem + addr);
+		return 0;
+	}
+
+	ret = ath12k_pcic_select_static_window(ab, addr);
+	if (ret)
+		return ret;
+
+	*value = readl_relaxed(ab->mem + WINDOW_START + (addr & WINDOW_RANGE_MASK));
+	return 0;
+}
+
+int ath12k_pcic_cmem_write32(struct ath12k_base *ab, u32 addr, u32 value)
+{
+	int ret;
+
+	if (addr < WINDOW_START) {
+		writel_relaxed(value, ab->mem + addr);
+		return 0;
+	}
+
+	ret = ath12k_pcic_select_static_window(ab, addr);
+	if (ret)
+		return ret;
+
+	writel_relaxed(value, ab->mem + WINDOW_START + (addr & WINDOW_RANGE_MASK));
+	return 0;
+}
+
+static u32 ath12k_pcic_get_window_start(struct ath12k_base *ab, u32 offset)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	u32 window_start;
+
+	/* If offset lies within DP register range, use 3rd window */
+	if ((offset ^ ab_ahb->reg_base->umac_base) <= WINDOW_RANGE_MASK)
+		window_start = 3 * WINDOW_START;
+	/* If offset lies within CE register range, use 2nd window */
+	else if ((offset ^ ab_ahb->reg_base->ce_reg_base) <= WINDOW_RANGE_MASK)
+		window_start = 2 * WINDOW_START;
+	else
+		window_start = WINDOW_START;
+
+	return window_start;
+}
+
+void ath12k_pcic_get_msi_address(struct ath12k_base *ab, u32 *msi_addr_lo,
+				 u32 *msi_addr_hi)
+{
+	*msi_addr_lo = ab->msi.addr_lo;
+	*msi_addr_hi = ab->msi.addr_hi;
+}
+
+void ath12k_pcic_stop(struct ath12k_base *ab)
+{
+	ath12k_pci_ce_irq_disable_sync(ab);
+	timer_delete_sync(&ab->rx_replenish_retry);
+	ath12k_ce_cleanup_pipes(ab);
+}
+
+int ath12k_pcic_start(struct ath12k_base *ab)
+{
+	ath12k_pci_ce_irqs_enable(ab);
+	ath12k_ce_rx_post_buf(ab);
+	return 0;
+}
+
+u32 ath12k_pcic_read32(struct ath12k_base *ab, u32 offset)
+{
+	u32 window_start;
+
+	if (offset < WINDOW_START)
+		return readl_relaxed(ab->mem + offset);
+
+	window_start = ath12k_pcic_get_window_start(ab, offset);
+	return readl_relaxed(ab->mem + window_start + (offset & WINDOW_RANGE_MASK));
+}
+
+void ath12k_pcic_write32(struct ath12k_base *ab, u32 offset, u32 value)
+{
+	u32 window_start;
+
+	if (offset < WINDOW_START) {
+		writel_relaxed(value, ab->mem + offset);
+		return;
+	}
+
+	window_start = ath12k_pcic_get_window_start(ab, offset);
+	writel_relaxed(value, ab->mem + window_start + (offset & WINDOW_RANGE_MASK));
+}
diff --git a/drivers/net/wireless/ath/ath12k/pcic.h b/drivers/net/wireless/ath/ath12k/pcic.h
new file mode 100644
index 000000000000..f77091927039
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/pcic.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef _ATH12K_PCIC_H
+#define _ATH12K_PCIC_H
+
+#include <linux/types.h>
+
+struct ath12k_base;
+
+int ath12k_pcic_start(struct ath12k_base *ab);
+void ath12k_pcic_stop(struct ath12k_base *ab);
+void ath12k_pcic_write32(struct ath12k_base *ab, u32 offset, u32 value);
+u32 ath12k_pcic_read32(struct ath12k_base *ab, u32 offset);
+void ath12k_pcic_get_msi_address(struct ath12k_base *ab, u32 *msi_addr_lo,
+				 u32 *msi_addr_hi);
+int ath12k_pcic_cmem_write32(struct ath12k_base *ab, u32 addr,
+			     u32 value);
+int ath12k_pcic_cmem_read32(struct ath12k_base *ab, u32 addr, u32 *value);
+void ath12k_pcic_config_static_window(struct ath12k_base *ab);
+#endif /* _ATH12K_PCIC_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 70372db6abae..bff48b2fe124 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -14,6 +14,7 @@
 #include "hw.h"
 #include "dp.h"
 #include "core.h"
+#include "hal.h"
 
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 	[ATH12K_HW_IPQ5332_HW10] = {
@@ -72,9 +73,15 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct ath12k_ahb_reg_base ath12k_wifi7_ahb_reg_base = {
+	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
+	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+};
+
 static struct ath12k_ahb_driver ath12k_wifi7_ahb_driver = {
 	.name = "ath12k_wifi7_ahb",
 	.id_table = ath12k_wifi7_ahb_of_match,
+	.reg_base = &ath12k_wifi7_ahb_reg_base,
 	.ops.probe = ath12k_wifi7_ahb_probe,
 	.ops.arch_init = ath12k_wifi7_arch_init,
 	.ops.arch_deinit = ath12k_wifi7_arch_deinit,

-- 
2.34.1

