Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF063BD638
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448058; cv=none; b=Ami4xBzIFtIzqTXJ7PmA2nqwzW5tq2EuHm13kLtXjNQkvWR0lLbJuDi00MKE8cksBPF1xIQl8OSjwwXK5W/0KKgYVR0zZe2ssHvOVTVl1MBy2zkqJET7KEYNVhxdtmiACoB6eMdRv7t3EtRxC35gPUCWDDFHajjCZPEojzBoRjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448058; c=relaxed/simple;
	bh=Pz7ze0zTSzxTCIdBvDzfspmm7ASGI4Ym0bzkQZXU90U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUzu3WEorkBzR8bRwnzMS52jwhcIE5bZbZ+FHVPl6ZB1So+k9hYk5VrD/Wo483/xTBErEPFmlWvpuCvc2VLclT9VxcbRMdFKXTEo4JKVM1ChwdnTzP4R7+JQZw5CtNaRfylJFDQHhYvNojF+g3/v5VfoAv2yg7ApV9w18OuPI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7KuX8du; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVlEfRf6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7KuX8du";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVlEfRf6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987L2kW2067970
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ui8rOuDYxfWnkSSje2I9A/g+73JVctxI7MRa46JXNTw=; b=F7KuX8du4sTm7KMO
	qPL9HZTGAoOE6MxcmH89rfnuHA2E0OwtubAgdRbO5wC0h52eRiarqHbgIfK4K7EY
	Jp905ZQvg6gWDbqZme7ybV7cECet/ebruTa0UhxX6xjAORJF8WQNRlva7xfkeZ8j
	XoWaMudJXZhe+rNJExZe04rFF5dkSPQEbC1dqzKIxBn+UsRBmqQmWxGIlg1lRPVf
	yKaddXeutiUFK1SaRvHeiT4wPB0VJPr45GCzO7Pd3d2W1X1Z7pOJfDxhKJYamiyp
	1RkXlRVWWcyLScK76c+09san2ThdLRBmR4dCYtDrlU+QCt58StXRn/7A4T5w2KLZ
	ZxUu/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hwkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:27:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53513d2a70eso105130791cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791448055; x=1792052855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ui8rOuDYxfWnkSSje2I9A/g+73JVctxI7MRa46JXNTw=;
        b=MVlEfRf6BrRb9jOplmTggNQwDfukaWqMF/Bg3YARdJzfkTmszR+DEGdwxO1ray9xD2
         3F+5FfKBiM8PTGcOVbVAT809QFaYl9kwJNRqLiNQ1PbX5MRfGjP+gwqYJmhncvPJDS3O
         EAqSMFvumRVVQuFPujgKwobEuRM8KuymSgtF8T13rubpqyOXyN4XwFERl2CkopF3Xrii
         b1Sz/8yBvk92yv9rENndDptQoOIuPPkwcue97rz4zuWx3+2XFjuqBkIlU5RWPtPwN/K+
         OpLem4fVPZ+w1caV586NMNaZftlXypYGzUEIVaYFOsUn5ckclR7TLkbgXerEILdKux6/
         fo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448055; x=1792052855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ui8rOuDYxfWnkSSje2I9A/g+73JVctxI7MRa46JXNTw=;
        b=uJRiV/QPsOlM1RfjwytuxSgMrEakDczdoePXjqmuVTAi0zdNki0i5wlftELMxph7U1
         1BUe4sSFcBL/wCiwzBIdDLBexAp8sCjcdWe/Z5q2rLJ3CAo40sAwfZDMo6cQ7EqOYHuk
         CBRjcq/+65Gy1gMYi3rM1F8wPCYsrBoqGwYoPHK9+JMHJkX1hnxLYiSstazTm8juNSeq
         2xIL7Bh5h++hL4sZ3f2moQzoM5KsjjBn+sSmWGLtToAtwQ8POqujVhYDBSHLvsu1Z9w2
         yLJTa76pY4BHZc1BhuHYT8BR0Teuo7PzWh2IOhGBfJ4a94jQnyKgrmJEjJgAs13gcMw+
         MmWA==
X-Forwarded-Encrypted: i=1; AKwUvBxABnjUdU+0fJh2wuU6/5cajlB+65MZ2NYxYhroOCUrX1DmCARPEgQXVRjzto0YuyXqfXUL/mSr5tyKn2w=@vger.kernel.org
X-Gm-Message-State: AFuF++k/sPMyI4lp1+uyfCvfeH1MH4mhKYBMBoiCvt67lgnb0n/wKuFu
	JeryvVlF57ZyIYDMdeeGHs03Ckx4Nns9uYSZLykwZWn9JrrCBL0/PXqysCVcs2W4VYC2pKFr14s
	txI6gFpPIvpc3A5IuBItF1LA8xZQe8j3c7VhEbWWfbWRTA7MnYKgH9A/4Srsz/DZ/2m4=
X-Gm-Gg: AYBFou2f6b/+NqQUopsN32cEikFKLEz9ML6dtmH2Cp7q16eLtCl+BkrQmAfGIytG9mk
	l7GNlZ+yBKKsWlPhlrMWzCIOrk0iZApwYoLZ1KQwUt/6UxDiMkhYkf0FOz3+lNrIfjb+nIy0ewu
	aouM3kkAgso7Ws2jbtpfB+66xEJllJOtDmBcSUOAl/DtIYlSDIZPku9/wmJiKKu+yAcNBX3TuAh
	5/I6SmBEDDJF1dTpZscimiuZaA1isBshSekZKssGHJ2c+xRD81wNd65Kjhk4XWdLETZhyuxnPww
	og+PdBQnA/RYWz1xyhEbGWEFLcZKeIRDEi1GQ4NLQoK6mbucQbzOA3ZhU8XZ+TJj8/QEwhQjGZ6
	D1ibDA/Yh6kj2jLMyxMXYLW0ETd2k5H8Mr1AhRaZKG1JMq7ru4CgmARBtPqhJmbGGtTTp
X-Received: by 2002:a05:622a:559b:b0:535:70b3:aa35 with SMTP id d75a77b69052e-535757320a4mr87659021cf.71.1791448055024;
        Thu, 08 Oct 2026 01:27:35 -0700 (PDT)
X-Received: by 2002:a05:622a:559b:b0:535:70b3:aa35 with SMTP id d75a77b69052e-535757320a4mr87658391cf.71.1791448053746;
        Thu, 08 Oct 2026 01:27:33 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5357219c5f5sm38928981cf.25.2026.10.08.01.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:27:32 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:27:00 +0800
Subject: [PATCH v4 3/3] media: qcom: camss: Add support for X1P42100 CAMSS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-purwa_camss-v4-3-bcf11bf2c650@oss.qualcomm.com>
References: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
In-Reply-To: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791448024; l=8939;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=Pz7ze0zTSzxTCIdBvDzfspmm7ASGI4Ym0bzkQZXU90U=;
 b=e6p31i3d2/rAdOmcL0Rl1lYd7vecLqA2D64L3QoCciNcbz0YL/dulJy05Ohy5APGuXqvNEcIh
 tzG/cNJn1AUDrRbJdlbjnecQWmFmkceWmSVGVnfl8DIunN/qUS3gtyy
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac753f7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0PC1L9vb1dsTtBW2NE0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX9RKnGVuLzFPh
 5knsI8NX5uYFQ2LGJlklznI219nvVckDn4sPQw0FSn0GwN9YSpHk3GeI9ixKTOuji2AEdjBzkwM
 C3UkoxYazwvud5jAfiY5X2Vu7NT/DcA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX6yJ/Aic/zgzB
 Z1+8ov3L/wGBWn860gti+4hpG+QvRSvyfQY8AQCUBgbi8wwVOZWNj+ysge6Qu+qr+/jrju2zrQW
 vCbaUpe9b6686OKUhlgXUiOLO9wNUzwHDzP3UKu3F6G5f0+maITBKKxJvDpaY81i4UFJaZ2TDOp
 fKDYaMW8AahnmVUNb+0Xpn1xunZZaMmzotsId2H7JBy8t+e8u5eN3BIhLwTlDthIUQuRZDkhPii
 MIINlsAh6jRuTJI8ll8exPLBveYjIP7mZ6AZgzbHWJ2Tq5WYiRNo98qljLEiYuJLeniYUHOnk3z
 pBAzxN9C2V7d46/wXCJb/bKW8CKopeN5Wkpt1M1L+NiBFrjPfO7qSlRdkXGoCuJSPp5cuNOqQ7L
 jcbUrN1P8pHXXrdE9HQs9cAMu62Id3yWbADal2pKxjpbIjYHPCkkrKfUSBEu2mFABMDTbY80n61
 pRhA4dza2PflRDxy2Mw==
X-Proofpoint-ORIG-GUID: Gy6ppg4G_MHdw4vN5ZDxbgd7eyXcJwng
X-Proofpoint-GUID: Gy6ppg4G_MHdw4vN5ZDxbgd7eyXcJwng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080033

Add CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.

The X1P42100 CAMSS is a cut-down variant of the X1E80100 (Hamoa)
CAMSS. Compared to X1E80100 it has:
- 2 x CSIPHY (CSIPHY0 and CSIPHY4) instead of 4
- 1 x IFE instead of 2
- only the ahb and hf_mnoc interconnect paths

The CSID, CSID Lite, IFE Lite and TPG blocks are the same as on
X1E80100, so reuse the existing CSID/VFE 680 ops and the X1E80100
TPG and CSID wrapper resources.

The CSIPHYs are handled through the PHY API, so no CSIPHY
resources other than the lane format are needed.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 216 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 3 files changed, 218 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index b1d9fe0010e119059c539c20c238c3e050ff7036..81cb4377586994727006d0ec83e53ac57233f765 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1997,6 +1997,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a98fc6a20fdb8e0f9f8e61bc41058..7bc6b2e61438da9ce0c100fcaf8f669410a6839e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4452,6 +4452,205 @@ static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
 	.reg = "csid_wrapper",
 };
 
+static const struct camss_subdev_resources csiphy_res_x1p42100[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
+static const struct camss_subdev_resources csid_res_x1p42100[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_x1p42100[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "cpas_fast_ahb",
+			   "cpas_vfe0", "vfe0_fast_ahb", "vfe0" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 345600000, 432000000, 594000000, 675000000,
+				  727000000 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+};
+
+static const struct resources_icc icc_res_x1p42100[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -5809,6 +6008,22 @@ static const struct camss_resources x1e80100_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };
 
+static const struct camss_resources x1p42100_resources = {
+	.version = CAMSS_X1P42100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_x1p42100,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1p42100,
+	.vfe_res = vfe_res_x1p42100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1p42100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1p42100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_x1p42100),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1p42100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1p42100),
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
@@ -5828,6 +6043,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,x1p42100-camss", .data = &x1p42100_resources },
 	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0dc2ded8e4a603d6cfec4d8e6a62b..523050295209d84e7f72f54bce9a96ed9df442aa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -97,6 +97,7 @@ enum camss_version {
 	CAMSS_8650,
 	CAMSS_8775P,
 	CAMSS_X1E80100,
+	CAMSS_X1P42100,
 };
 
 enum icc_count {

-- 
2.34.1

