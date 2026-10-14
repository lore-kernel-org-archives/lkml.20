Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD942559CBD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993414; cv=none; b=GbzyVD9iZCGxbv7wM2fwPlEJlTcVXLaPSBAajEj7S35AEDt8K6qGj6brTsYdsSY6GeMvXmvJWJ/fLscfujSWCS95ElUf0Gg6w/eBvgsZE8NkdVQkuk8zeqh9qHQ2uZz1Ziv4EkaImHqJitXXNvi5yJxMqDRGozlAAn55Rc8E98k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993414; c=relaxed/simple;
	bh=ujqnUj4cWtWyTSxvWF0EjJMCZGVfh5PZmJza2U8mjec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IqN4sVdVkzxKWcv6fvqyOrkAvhgb0B2/cikx1hINItoZo+Buotxwr7QT+Qi6VwKvKzs29Sp9uAYsaB5GC7LzlYNgohE1KeW8eydvsQJsxKkir0fwmo2E5m5QcKcJrfXVb+Arg/u27zaARSkbr5IhiqPOl2cdMFpRI0p/SD9Rvxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoXttyWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iy18ZUVe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoXttyWH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iy18ZUVe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFMi301682646
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqyevVfanyVO5O+kjFLGJPSnmFFgm19MW0np9Dgcd8I=; b=MoXttyWHVsvJH1X4
	+Ncj8kU22Y1EFcnmwqmojpVY0E5sVxdsSS2gzcndcGUP1eaNh1/73UNTVMl8uzo1
	3o9KAV6DQgFEmXyx6cSG1qQPmK0ga1//YQDZGV6np71k3YbYWGhA8yDzHE+IIYFX
	H+IWPyqajr8NtoVTzr4hxQn1xeETYaX/KcJ0OQHCIBwGAR+AioOsOx8+bkRKFXfA
	h8VIfHyex1OcO/4dyW8rwaTZJweqZDhKyGdvLFSxKuoWcxcYMDCRWGWbdpqKkO+X
	4m7HerA7oaKf/ab5ujmFdaRyI2Kh1J0z9Vc/YzOQ/4/woskGqhvFkqIItxzfoOtP
	RgQAxQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb0048y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8484f12cso50793895ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993409; x=1792598209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqyevVfanyVO5O+kjFLGJPSnmFFgm19MW0np9Dgcd8I=;
        b=Iy18ZUVee5TdDjNDfppKf29g/QV5zx3MjMk5wCdorQ9rpn7LLM41hD3A5pzaztVaSR
         ZQx7qeviqgcRk7/cKOS9/373/V2qYmLJPwMO9xSvKwcmsxLtHSHIMi6c1haWOg5bjAVd
         zDLAJGxgxUgiV+X/bqA9lqpzYwdmz7AzZTqwsJoYcXyRN6BpY6UrfbNfdlfIDO+7iYTx
         ZD6CIeYTHpQo6AEV9tKAJfaJbS2HKB//QJlPAZ8n3UL9slCaYKdLiwVM5/dQQvGbqM5l
         AkJWeGjbrv6u9u4oLOaSSsyURU8TRFlKG0xxaL4mctoRfZB6v54q0exVQwvgIfZWpoS3
         k0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993409; x=1792598209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqyevVfanyVO5O+kjFLGJPSnmFFgm19MW0np9Dgcd8I=;
        b=deGgQI4SsT7V1edbxYeZRwL06iRzf/u2gMGhNREb7vsrBgg3GeApeEhHjh7MUBPuPj
         l+FMfbmzKCzqBKTkUUw1UmnmdIldRHxBnKRPtNFrBIVtsMkODNgrSO0lXDgpt2Zfzm87
         zNa1ZfYuwE1U3s0dTXtE+e47mIJSRbI0I0VruCRUlEcKJeNeYqySsV3eamqPcwWuigpt
         /8s01oTQ4KpLGqQd9RyZuFq+WCB8TXxYLnXfnwNBOGKnj6HFDAKuLdnvN5La5ezfimDo
         6S1o+7EA8SiqMwDR3uNzWt7vqsMecQOhbyLxXYYxBm36FJowWoRmksQdYNfqeM3Y7OpU
         G68A==
X-Forwarded-Encrypted: i=1; AKwUvBzJm59X1K0SeAYt4PGNI7JWguOF55z+C3dv0GdE9kg0Czul0AbLUllG43LlD+cP1ra3rnb1t/H/R1KFhlY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7u5AN3OFBx5O0yIg7G3PUWgO5eIZD8bYaKInTHdATHYPgJBSv
	ITiByi682qEfwAoi1+be1Fzf+SjtBaW2gZmrygUHhMu8MoggjaHqi4mxO5sufl3VyXYrH9+eZYT
	dmT2g4dNbxb4aIuz49G215rJIw5DUjZXZ9RukgsDh7VlEg5ZW8Ps0Q4+KP7MXfY/U3ck=
X-Gm-Gg: AYBFou37TZQsGm4cHSKlZmPhqs2+ib7hX8H+x0RJkH9mgryvXzkLUMYTDUtubR7YtcL
	0cxB3Yo+7U+aOla/Jt7/sKNsqpSClRrkXFOhM2myBkxj9QjIEaxVsyjdvlzG6Iwaf5V7gZKui09
	c/HeX4XLbwsBDq1yRnAlNNtgqO0EzunjVsJXiK0B8nar2BbtM+OOme/o89yANHOY9HiXr4EF+Dv
	kpuzUcA2oaUlihGPAgfZ+AWfEkSyiRRYh3uClrRvqFxkEPhb57Aojg4KNSNF2faKuX+HeEWkMXZ
	8RYCgdSJY0+s0LcTAhWwjLan3Jo9V5ObkNkNRBtQluvB5DHYg3ZffM5qMQcCdbLEytB1BmIxgJX
	nQ34BRaFmQXBowub6kLnn1l4o8HOYl9VyBA==
X-Received: by 2002:a17:903:1247:b0:2e8:c331:fc30 with SMTP id d9443c01a7336-2e8c33202e1mr77159125ad.69.1791993409279;
        Wed, 14 Oct 2026 08:56:49 -0700 (PDT)
X-Received: by 2002:a17:903:1247:b0:2e8:c331:fc30 with SMTP id d9443c01a7336-2e8c33202e1mr77158925ad.69.1791993408736;
        Wed, 14 Oct 2026 08:56:48 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:48 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:26:18 +0530
Subject: [PATCH 3/4] edac: qcom: add LCP/SRP DDR DRAM ECC support for
 Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-master-v1-3-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
In-Reply-To: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6acfa642 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Ij1zGpOROYN2N0QOU-8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX17/5QNERRR7C
 Z1AGpKiYHgzwlRXDKKDezxeXpMFOd8ZITgWmc4E9mNZL9fYW0n+HaduPoQ/+aKVba5XuJClwQHV
 cFcjxMYWMbExzw/tevCV5C5jcE3TCAU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX8Wa/UTCqUYkH
 4vrTrFQuTkqFUwGTLS9o3vIYJjOTccQjD34po70Lk/JlYJD1DGPVNhBx1wbSMdR0fkh/wX5piA4
 zEaRKMI4SQoi+b2GG/DKsuXBW47kb5w21lnPzNfy5qGnzPPnkj8zp0fMNDDO8G7bg4OtVxdiSyW
 22fEEpfYXad6ctzzrR/hFAxG+nN8hJVN4kxtr+m/TS4pv4chSu+F3uk7oeY9WWsrXbsKyT/Kvrz
 QDzGWTEezRpYyEJdDGN3y1sqJCIvXAoO9fluaQnBExjWblVoIX6z4BeB8qLc2mvMpQD8FSdOYZ8
 S7hEZmFCzRzkUIKhKbF+bonaxv+1A8s8NmkUP1Y5cM2apyk+3shxy9UEAdGNew5/9eUNLXVYfqN
 1yb80W5XQJmYiegAZg3EErnCLY7MeVt8nLlATTnCeopEv7sIeLikwEJhLLtPe4+x3cIJpgmbwXm
 JQVZmfcj6VXcFBmkOPA==
X-Proofpoint-ORIG-GUID: Hh50vmAk1R6-TdVjp7Ltg-N-kGLzG_Oc
X-Proofpoint-GUID: Hh50vmAk1R6-TdVjp7Ltg-N-kGLzG_Oc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140063

Add qcom_llcc_lcp_setup() to enable LCP/SRP interrupt routing when
firmware has not pre-configured it, and llcc_lcp_ecc_irq_handler() to
report per-bank correctable and uncorrectable DDR DRAM ECC errors.

LCP/SRP setup is skipped when ecc_irq_configured is set (e.g. Shikra,
where DSF firmware handles IRQ routing). A missing lcp_irq is
non-fatal; TRP/DRP ECC reporting continues unaffected.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
 drivers/edac/qcom_edac.c | 147 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
index f3da9385ca0d..b4f7b2493650 100644
--- a/drivers/edac/qcom_edac.c
+++ b/drivers/edac/qcom_edac.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/edac.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -44,8 +45,16 @@
 #define SB_DB_TRP_INTERRUPT_ENABLE      0x3
 #define TRP0_INTERRUPT_ENABLE           0x1
 #define DRP0_INTERRUPT_ENABLE           BIT(6)
+#define SRP_INTERRUPT_ENABLE            BIT(7)
 #define SB_DB_DRP_INTERRUPT_ENABLE      0x3
 
+/* LCP/SRP DDR DRAM ECC */
+#define LCP_SB_ECC_ERROR                BIT(0)
+#define LCP_DB_ECC_ERROR                BIT(1)
+#define LCP_SRP_SB_DB_INTERRUPT_ENABLE  0x3
+#define LCP_DB_ERR_COUNT_MASK           GENMASK(4, 0)
+#define LCP_SB_ERR_COUNT_MASK           GENMASK(23, 16)
+
 #define ECC_POLL_MSEC			5000
 
 enum {
@@ -124,6 +133,29 @@ static int qcom_llcc_core_setup(struct llcc_drv_data *drv, struct regmap *llcc_b
 	return ret;
 }
 
+/*
+ * Enable LCP/SRP DDR DRAM ECC interrupt generation and route events to
+ * ddrss_apps_interrupt[1] via cmn_interrupt_1_enable.  Only called when
+ * !ecc_irq_configured; on platforms like Shikra where firmware pre-configures
+ * both TRP/DRP and LCP/SRP routing, the driver skips this and only requests
+ * the IRQ handler.
+ */
+static int qcom_llcc_lcp_setup(struct llcc_drv_data *drv,
+			       struct regmap *llcc_bcast_regmap)
+{
+	int ret;
+
+	ret = regmap_set_bits(llcc_bcast_regmap,
+			      drv->edac_reg_offset->cmn_interrupt_1_enable,
+			      SRP_INTERRUPT_ENABLE);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(llcc_bcast_regmap,
+			       drv->edac_reg_offset->lcp_srp_interrupt_enable,
+			       LCP_SRP_SB_DB_INTERRUPT_ENABLE);
+}
+
 /* Clear the error interrupt and counter registers */
 static int
 qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
@@ -334,6 +366,92 @@ static void llcc_ecc_check(struct edac_device_ctl_info *edev_ctl)
 	llcc_ecc_irq_handler(0, edev_ctl);
 }
 
+/*
+ * Handler for the optional LCP/SRP DDR DRAM ECC interrupt
+ * (ddrss_apps_interrupt[1]).  The LCP/SRP registers live in each LLCC
+ * instance's address space, so iterate over all banks and read status
+ * per-instance.  Broadcast-write the clear after the full loop, mirroring
+ * the TRP/DRP handler pattern.
+ */
+static irqreturn_t llcc_lcp_ecc_irq_handler(int irq, void *edev_ctl)
+{
+	struct edac_device_ctl_info *edac_dev_ctl = edev_ctl;
+	struct llcc_drv_data *drv = edac_dev_ctl->dev->platform_data;
+	const struct llcc_edac_reg_offset *reg = drv->edac_reg_offset;
+	irqreturn_t irq_rc = IRQ_NONE;
+	u32 intr_status, err_status, clr_reg;
+	int i, ret;
+
+	/* Iterate over banks: LCP/SRP status registers are per-LLCC instance */
+	for (i = 0; i < drv->num_banks; i++) {
+		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_interrupt_status,
+				  &intr_status);
+		if (ret)
+			continue;
+
+		intr_status &= LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR;
+		if (!intr_status)
+			continue;
+
+		irq_rc = IRQ_HANDLED;
+
+		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_ecc_error_status1,
+				  &err_status);
+		if (ret) {
+			edac_printk(KERN_ERR, EDAC_LLCC,
+				    "LCP/SRP error status read failed for bank%u: %d\n",
+				    i, ret);
+			continue;
+		}
+
+		if (intr_status & LCP_DB_ECC_ERROR) {
+			u32 db_cnt = FIELD_GET(LCP_DB_ERR_COUNT_MASK, err_status);
+
+			edac_printk(KERN_CRIT, EDAC_LLCC,
+				    "LCP/SRP DDR DRAM Double-bit ECC error in bank%u: count=%u status=0x%08x\n",
+				    i, db_cnt, err_status);
+			edac_device_handle_ue(edac_dev_ctl, 0, i,
+					      "LCP/SRP DDR DRAM uncorrectable error");
+		}
+
+		if (intr_status & LCP_SB_ECC_ERROR) {
+			u32 sb_cnt = FIELD_GET(LCP_SB_ERR_COUNT_MASK, err_status);
+
+			edac_printk(KERN_WARNING, EDAC_LLCC,
+				    "LCP/SRP DDR DRAM Single-bit ECC error in bank%u: count=%u status=0x%08x\n",
+				    i, sb_cnt, err_status);
+			edac_device_handle_ce(edac_dev_ctl, 0, i,
+					      "LCP/SRP DDR DRAM correctable error");
+		}
+	}
+
+	if (irq_rc != IRQ_HANDLED)
+		return irq_rc;
+
+	clr_reg = reg->lcp_srp_interrupt_clear ?
+			reg->lcp_srp_interrupt_clear :
+			reg->lcp_srp_interrupt_status;
+
+	if (clr_reg) {
+		ret = regmap_write(drv->bcast_regmap, clr_reg,
+				   LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR);
+		if (ret)
+			edac_printk(KERN_ERR, EDAC_LLCC,
+				    "LCP/SRP interrupt clear failed: %d\n", ret);
+	}
+
+	if (reg->lcp_srp_ecc_error_cntr_clear) {
+		ret = regmap_write(drv->bcast_regmap,
+				   reg->lcp_srp_ecc_error_cntr_clear,
+				   DRP_TRP_CNT_CLEAR);
+		if (ret)
+			edac_printk(KERN_ERR, EDAC_LLCC,
+				    "LCP/SRP counter clear failed: %d\n", ret);
+	}
+
+	return irq_rc;
+}
+
 static int qcom_llcc_edac_probe(struct platform_device *pdev)
 {
 	struct llcc_drv_data *llcc_driv_data = pdev->dev.platform_data;
@@ -372,6 +490,8 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
 			edac_op_state = EDAC_OPSTATE_INT;
 			goto irq_done;
 		}
+		dev_warn(dev, "failed to request LLCC ECC irq %d: %d, falling back to polling\n",
+			 ecc_irq, rc);
 	}
 
 	/* Fall back to polling mode otherwise */
@@ -386,6 +506,33 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	/*
+	 * Set up LCP/SRP DDR DRAM ECC after the EDAC device is published.
+	 * Skip hardware routing setup if firmware already configured IRQ
+	 * propagation (irq_configured); only request the IRQ handler.
+	 * Guard on a non-zero lcp_srp_interrupt_enable offset to confirm
+	 * this LLCC variant actually has an LCP/SRP block.
+	 */
+	if (llcc_driv_data->lcp_irq > 0 &&
+	    llcc_driv_data->edac_reg_offset->lcp_srp_interrupt_enable) {
+		if (!llcc_driv_data->ecc_irq_configured) {
+			rc = qcom_llcc_lcp_setup(llcc_driv_data,
+						 llcc_driv_data->bcast_regmap);
+			if (rc) {
+				dev_warn(dev, "LCP/SRP interrupt setup failed: %d\n", rc);
+				goto lcp_done;
+			}
+		}
+		rc = devm_request_irq(dev, llcc_driv_data->lcp_irq,
+				      llcc_lcp_ecc_irq_handler,
+				      0, "llcc_lcp_ecc", edev_ctl);
+		if (rc)
+			dev_warn(dev,
+				 "failed to request LCP ECC irq %d: %d, DDR DRAM ECC reporting disabled\n",
+				 llcc_driv_data->lcp_irq, rc);
+	}
+lcp_done:
+	rc = 0;
 	platform_set_drvdata(pdev, edev_ctl);
 
 	return rc;

-- 
2.34.1

