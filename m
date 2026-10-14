Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF142D063E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993407; cv=none; b=vEmp2B2pd9lU/QiFSi5Cp1L/9MnDjbAbwpUW1dLAe8aqbP+70ahMDnjaILQ7IsQE9cLy9tLf8WxFO8PUvRbO6b0nrnSTT3fvpaSmmjWX3gZcAUBrHVFlYkcaFwND3Se+1pgslPLSNZ9jrtQfrV+V9IgLQHwp+ZZeSBHsqu1MJsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993407; c=relaxed/simple;
	bh=VYwfBCpmYlkXwDev8JR/MlpeS73N/YNqoX8hj4J298g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OnU0TJQR3Q1Dk45pWinJuCb3oigjt+G09cQzJOdJKJZzy49CHZ6die5Kkw82NY9ObPidhPiADDdU7iv7ACrWvRbZhhaLKhXUFOBKqRugL3oW1srWFqubVwK+owZuXXBHIIIRAPoouQbbQJXXYo5imZuj2q2FF9zTfvYKMHXU/kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTC9Gs/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJDqejpt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTC9Gs/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJDqejpt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb2Tn1013129
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	prj1BFtBO55/mLyya2YqYpHnOcpcHVPbW7EawGZLrv8=; b=OTC9Gs/y2PQo0AYe
	mj6zg91l88enxCLPD1ndF8G2Gv4wk9QY4EA6rx6matmIqq8pAbpW9KrTZvT/X3aY
	2p57vtcfg8PAr7bgGia+h755JfkQTkWkZ0sIt/vo6QqF1PRFSFNUnYf5dtUkUnOB
	9Lu+w/OG4Pt+m64apjNH8cUiYtpuJL2b6X/3Ovh5UgBkAg8O0gEAirtPxxRMRjBZ
	AlU2RHk25Vi0eDLq9Nib6Pljcao1ACMv0LtamK+4rk1cSFqJOgpfXRlbP1HVbICI
	2cY46IfM/dF5x4Go7dulHinHYz1EV3kXe3gVl7yyhQvuHpmX+sKUBuNXIenyKYZn
	L/GGGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cs97r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a813204f87so511004a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993404; x=1792598204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=prj1BFtBO55/mLyya2YqYpHnOcpcHVPbW7EawGZLrv8=;
        b=VJDqejptWypSe+epNhVpU2ZJXZln4ztDoEogMhq9I/XApyg/A25OysXimAYvFfdBxF
         foadoKUpUupKTgDehvRLbynKIuxSQhfDNkAr2POaTd+JbwjvBwonInQHNOJnIP8JOsRx
         uesWBMd0cUMzRQlF7NjQctpZ8jEs99nXxlIV6QnE0BPoMQd/DGNv7T731JBeK/5rYqZl
         tTipSRGxCBo/9+ZswxKsO8B6SgPJD8gSbSsMgut1Xyjx9yb1u6BMyYi0AkfPQIPjY8gI
         4MLYrtyJZp5lypDBA4TAzMpuve+FhmEJFfym+dR/Vmy7tRmRL8zeZOJwvZuzmShuaD/E
         mxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993404; x=1792598204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prj1BFtBO55/mLyya2YqYpHnOcpcHVPbW7EawGZLrv8=;
        b=a3KKYDov/ou+JR+wp5en0df2uO/5sPmwUCn+fvDAhGHLQPtenJX3Op4UgBRPCELI7D
         5QSj7CZdtmOaICOUWF2MH+UzmtEj46HD0Jchblc+2n/+HHGSsBHnqUPv8oS+lTaX5ZVI
         uSW0axCcTRNuYIjRY6v4III9H+IVbJgvpFXEHx8pfvTsQ1WQzJ+5dS6GC/qmAysz3Lt7
         VueWMDPB1C81id+Z9jaU25mPMHjhVMRmcyfCnMeh+OBmnFD+5MwYPfPVaMXQB0US+TdU
         qU5mQeINdCqw49NYuq9NBlD/KutvmLV2qKZZ3kXQVEskhduk35F9cxg22Rj9PI2k7CLJ
         lp1g==
X-Forwarded-Encrypted: i=1; AKwUvBzRH1Ryw7nDWQglHx5aAeW3nJRotIu0zgaowe6tlkRujZjI7QlL+xEGHUHPIebYb7Q33GxJuFiqb1rY3XA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHBUqCuhpJw4JYagUS/N5faWJwS4NLWwAV8io9BR+VBboxMrXd
	uGHrZJTyo3RUMvGAhyBJolaL3GsQKLDnfpH4v/SS08slIvwiCGu140dLTeVSoe3T6I642uQ4C4E
	R1kMKAYE25MuE4SQBqHhHskdOoaVh4WsYt8PWeakza+XC7/UPEJPTONkWYYJPJbwuKmo=
X-Gm-Gg: AYBFou35W6npw2SHVDrSMm9fNfiGkC7zCgC/boIJ0jlPwGF/bIoLU22vApPfanj+LA8
	/3/Xd6C0CWSlpdT/yp1mXBnQFCkYbECqe6EhCAFsFJahbAYu8pt9+I1FMzKB32C20PJ8FY/qiQl
	TBHLVgq/bEz65yxQksV1UM5LEAJcl5IaLEkDEhG71Ae3W1YEMayCACoPA4nu8sD4u9jsW24ZdzS
	7VggfJLZTqAkv6eBhlLgHjxHG/aXIBr94zUCo5SxomW+yT99oa0PQKCXw1ZfOoTxXm8KfgvS4Rx
	kCok+JizERsXMkYF+R9lmlf7QjIj/GCpEh+Z9MzO+cfIOli9t6m6hXKH0U2lH/bkDpjRt07Fqh+
	Tzrj6WMMLNFgcS3psDrhBe2qDtM+2En0KHg==
X-Received: by 2002:a17:90b:3d82:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3ab3ac8b5f3mr13395896a91.54.1791993403652;
        Wed, 14 Oct 2026 08:56:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3d82:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3ab3ac8b5f3mr13395874a91.54.1791993403112;
        Wed, 14 Oct 2026 08:56:43 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:42 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:26:17 +0530
Subject: [PATCH 2/4] soc: qcom: llcc: add LCP/SRP DDR DRAM ECC register
 offsets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-master-v1-2-aba3cfcfbac9@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfXwGmXTwi83QF+
 zelXbH7izBBqq5gvJiw8vENOKOsc6CgWEYpFGkIBjT7gKGfUtjc0gc01isY5rBd95jT4BfkTCIa
 CNyhtr1V+pJjuB+1OLy/hO7FdemGbr0=
X-Proofpoint-GUID: iWuF-gXlGjvTfFpHb4N6BF1r6JzDDx5d
X-Proofpoint-ORIG-GUID: iWuF-gXlGjvTfFpHb4N6BF1r6JzDDx5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX5zXGn/33xBOu
 duxpeJHeUjXoFY3CYHFE0CRcAe7J6SHBbAw1hnxT6VKw1EQQtq7BQ/+iM60AZU9sjnTohztpPWL
 tQ+wGUl9xNpl0UT95BPTpreUOJC7qDhBBpxr0sYeWiwEdWvTk+RxZgDwTzsB7dvJfE026icSscS
 vFCVdpw5AkbOheWutZW2MClt2XAU4E8ruwCJPP+EMvN+F7S4TVay01ajcohv5L7aqJWmhPG7Yi1
 1og6Kd9qprL26WQQrON+feWH4ARYX8+isOFENSqCghGPJyVCjYRbhWtiBqMPyH6WB1GCf9RQFzX
 0KHklQjLE7sM4Gp1oDtutZXvOuZGCVySRYLxDrEMEnBuK/49+Gy4swtcuV+AepJADwtqEmS9v80
 nVorOF77rSe6lFdDubvwVenhT+PaOVukxcJjhKquF9it1s4eJAa+jS5+zhlgRDhxSwISLKvl+RP
 MT1F/UrnM1e5kyxIJww==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acfa63c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nG-eWwySHv3HCuN3v-sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140063

Add LCP/SRP ECC register offsets to struct llcc_edac_reg_offset and
create llcc_lcp_srp_edac_reg_offset for QCM2390, leaving the shared
llcc_v2_1_edac_reg_offset table unchanged. Switch shikra_cfg to the
new table so other platforms with the same block can reuse it.

Add lcp_irq to struct llcc_drv_data and retrieve the optional second
interrupt in qcom_llcc_probe(), propagating non-absence errors so the
driver defers correctly.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 45 ++++++++++++++++++++++++++++++++++++--
 include/linux/soc/qcom/llcc-qcom.h | 13 +++++++++++
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index d7a42a8040a1..39e0da14b36d 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -4509,6 +4509,41 @@ static const struct llcc_edac_reg_offset llcc_v2_1_edac_reg_offset = {
 	.drp_ecc_db_err_syn0 = 0x52120,
 };
 
+static const struct llcc_edac_reg_offset llcc_lcp_srp_edac_reg_offset = {
+	.trp_ecc_error_status0 = 0x20344,
+	.trp_ecc_error_status1 = 0x20348,
+	.trp_ecc_sb_err_syn0 = 0x2034c,
+	.trp_ecc_db_err_syn0 = 0x20370,
+	.trp_ecc_error_cntr_clear = 0x20440,
+	.trp_interrupt_0_status = 0x20480,
+	.trp_interrupt_0_clear = 0x20484,
+	.trp_interrupt_0_enable = 0x20488,
+
+	/* LLCC Common registers */
+	.cmn_status0 = 0x3400c,
+	.cmn_interrupt_0_enable = 0x3401c,
+	.cmn_interrupt_1_enable = 0x3402c,
+	.cmn_interrupt_2_enable = 0x3403c,
+
+	/* LLCC DRP registers */
+	.drp_ecc_error_cfg = 0x50000,
+	.drp_ecc_error_cntr_clear = 0x50004,
+	.drp_interrupt_status = 0x50020,
+	.drp_interrupt_clear = 0x50028,
+	.drp_interrupt_enable = 0x5002c,
+	.drp_ecc_error_status0 = 0x520f4,
+	.drp_ecc_error_status1 = 0x520f8,
+	.drp_ecc_sb_err_syn0 = 0x520fc,
+	.drp_ecc_db_err_syn0 = 0x52120,
+
+	/* LCP/SRP DDR DRAM ECC registers */
+	.lcp_srp_ecc_error_cntr_clear = 0x59004,
+	.lcp_srp_ecc_error_status1 = 0x59010,
+	.lcp_srp_interrupt_status = 0x59070,
+	.lcp_srp_interrupt_clear = 0x59074,
+	.lcp_srp_interrupt_enable = 0x59078,
+};
+
 static const struct llcc_edac_reg_offset llcc_v6_edac_reg_offset = {
 	.trp_ecc_error_status0 = 0x47448,
 	.trp_ecc_error_status1 = 0x47450,
@@ -4767,7 +4802,7 @@ static const struct qcom_llcc_config shikra_cfg[] = {
 		.sct_data	= shikra_data,
 		.size		= ARRAY_SIZE(shikra_data),
 		.reg_offset	= llcc_v2_1_reg_offset,
-		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+		.edac_reg_offset = &llcc_lcp_srp_edac_reg_offset,
 		.irq_configured = true,
 	},
 };
@@ -5798,7 +5833,13 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	if (drv_data->ecc_irq < 0 && drv_data->ecc_irq != -ENXIO)
 		return dev_err_probe(&pdev->dev, drv_data->ecc_irq,
 				     "failed to get IRQ resource\n");
-
+	if (cfg->edac_reg_offset && cfg->edac_reg_offset->lcp_srp_interrupt_enable) {
+		drv_data->lcp_irq = platform_get_irq_optional(pdev, 1);
+		if (drv_data->lcp_irq < 0 && drv_data->lcp_irq != -ENXIO) {
+			ret = drv_data->lcp_irq;
+			goto err;
+		}
+	}
 	drv_data->edac_reg_offset = cfg->edac_reg_offset;
 	drv_data->ecc_irq_configured = cfg->irq_configured;
 	drv_data->dev = dev;
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 713cb0221b14..020d0b4116d2 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -139,6 +139,7 @@ struct llcc_edac_reg_offset {
 	/* LLCC Common registers */
 	u32 cmn_status0;
 	u32 cmn_interrupt_0_enable;
+	u32 cmn_interrupt_1_enable;
 	u32 cmn_interrupt_2_enable;
 
 	/* LLCC DRP registers */
@@ -151,6 +152,16 @@ struct llcc_edac_reg_offset {
 	u32 drp_ecc_error_status1;
 	u32 drp_ecc_sb_err_syn0;
 	u32 drp_ecc_db_err_syn0;
+
+	/*
+	 * LCP/SRP DDR DRAM ECC registers (LLCC broadcast space).
+	 * Zero on platforms that do not support LCP/SRP ECC reporting.
+	 */
+	u32 lcp_srp_ecc_error_cntr_clear;
+	u32 lcp_srp_ecc_error_status1;
+	u32 lcp_srp_interrupt_status;
+	u32 lcp_srp_interrupt_clear;
+	u32 lcp_srp_interrupt_enable;
 };
 
 /**
@@ -165,6 +176,7 @@ struct llcc_edac_reg_offset {
  * @cfg_size: size of the config data table
  * @num_banks: Number of LLCC banks
  * @ecc_irq: interrupt for LLCC cache error detection and reporting
+ * @lcp_irq: interrupt for LCP/SRP DDR DRAM ECC error reporting or negative errno on failure
  * @ecc_irq_configured: 'True' if firmware has already configured the irq propagation
  * @version: Indicates the LLCC version
  * @desc: Array pointer of pre-allocated LLCC slice descriptors
@@ -180,6 +192,7 @@ struct llcc_drv_data {
 	u32 cfg_size;
 	u32 num_banks;
 	int ecc_irq;
+	int lcp_irq;
 	bool ecc_irq_configured;
 	u32 version;
 	struct llcc_slice_desc *desc;

-- 
2.34.1

