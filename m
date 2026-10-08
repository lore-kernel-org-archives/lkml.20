Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D53D5241
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443690; cv=none; b=W95saoh4X6fJ5Tm/f5kJacvc6CQ9JqxxmL/4ntuxDRKuLYS+utWO1qxjCP96PY4zWTPl2djWWfWBcHLw5U4Lv+qEIrn3enk84vhhqtqq+UykckrEyPKo6z03zLP6NIHyjrwOeMTAxpVpNF16UrKYD/xlNS5hf+MCMzcihBueaz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443690; c=relaxed/simple;
	bh=8FsHjztUaoSo3gWFekIu2ZaHJQJmIn2rl1+OKWye77M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqAFlNn3F7jufpvEEC+JiRKn6DtvER8/jVjFDP0GxFUKspsNFmY4hNZACycCAPyN9hUNkCHp6twsuzlzoa+5Os51mk56AdmPynQu2QfjRzNz/VpbwT2Qq/1i/+C5TEwrgfphfjJsnMU2vhatFDSeBvp+dNswo+sG7cRlC1QRPdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2RaRyeY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qg26+BMr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2RaRyeY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qg26+BMr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BTF11157578
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 07:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ox7ms/k2nBX1vC4FcVK1US6xc9rXeV24NrQd4Ohbulw=; b=Y2RaRyeYrapAFsve
	qam6W6KnbVyE16X007ccn6kSh/E1T+IsX2Pwq0Ny+Pd/XeZGEESksD2lgcDmq9ny
	kZ4ZOgC3tZGUqjJQ9Q4TZJigQ/8Y+0U0MCk9+TutLgn4Vw4Yk3KEQ/XOGm6EX3vk
	Wr0Gz7qkjWas9xPjoVTP/xDO4MpfNqpUf3ua6fjXaHgdbyHbAx45VDo7U0+RpQPs
	qVLTAceIRIseQJD/A47ZG8Ff9KtE3Nob12DpwEY39QXMcqNnfNGgVdIwZCysOPFu
	HmKQDePPuxxAUwhLOWHQhICOL0RZVgbJUHIXtg0h3chuE3sIZ8Nq7nWovPBuuKpu
	lKEMNg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51nb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:14:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef0362d95so9487362eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443683; x=1792048483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ox7ms/k2nBX1vC4FcVK1US6xc9rXeV24NrQd4Ohbulw=;
        b=Qg26+BMrSl17jGW9hBegDs4RjelK7kLwxd4ZvNs+IunCvV5dG49B7Q/skVuzqIizZd
         ToVDmOOP316oJvmZFebX9MKr5pHib4CTmrogo4LVf51GbTNNCj4eX8LSMnElINcJUC0R
         7JAOJD1mB/Z+ae/BNTK6tBVe4yXEZT9ceCxMneeRqs3bvomOy1zblYT4z/1rYoczk75r
         6Jrk+6u1OAYDqaryyGp1UG+KXSr2TKuQr9hyqu64CmrgIMjgzJhfXcGqlGPuzPIe/DxU
         42aaaObi68D4EJPmK4Chw1M8c3kDuX6t4aweP5hnNLOYcWDWQnS6+WbvguuL71VLomJn
         zOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443683; x=1792048483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ox7ms/k2nBX1vC4FcVK1US6xc9rXeV24NrQd4Ohbulw=;
        b=jqn/FRHEI/Wxyo7u6jLfDScIve0kNaWGdYOXINMznt87t4I4ansRD07M0myZ03AHt4
         Ntgxo0traMwm5uXCrEaiFKxNTqrq8hg8FLvp60fgkMGvpG3TFpBFcUOyZu91F3wZjxx0
         jnMfxQITWcJSx9jX+SXzTOim9wEibNpyBSAof+fsXeJ6Yj1FT26deLrDZbhJrYSZbS/k
         tiZmFLXfuNydnvY4Ulpbwpv3UQ/TtM8+f1hOishtnpvxDAOT6YV9d/uVpnf96Otqy+1p
         YesR1QUcNclmhKsUrG62Jf4dPNYEU3YxBCsLq8/U+yEjv4sNzdgU87C5YJRXNNF+K3ln
         1B4A==
X-Forwarded-Encrypted: i=1; AKwUvBzhv3+2Ty0DWpJUa00tTbq5aX7FfYocXRQQez9MkhwqBus+rl5K2UM8skNtNemG7RzY98UHfBy98+Y0Ww4=@vger.kernel.org
X-Gm-Message-State: AFuF++nsGWZQMKko8F6dorBtSAmApayLXg5BCz/hAFLXcwvUCtd2+zVX
	sKXBDG7kfT/F8X+xCcZcx/6IaNmYe1hDzs3sJPfRcZEgw0C1rqazwRybaxqjpgGK0T0rOt1bdu1
	F4l5bORxUXtlm/Bot9BGRmtGBhdVknQtQD9ymFXzBTePUHUe6Fq9RSxXk5rFR2vsyzgg=
X-Gm-Gg: AYBFou1GjnZorD7pkf166cU2YuA3jidJv5BShAP0S/OgvEza+HeaZzwoEsQR75f+ppf
	ygmYnSEvIhgGJHOKj64CuK6ymrF5rjlXR0l7PsrytOQHHx+SaOpgdDQlWWaA7wXnLr9/wgMVFUd
	TtU6NgE3pwOZ6cFeaTp36R5zrt4BMYty8s9h9Fgip1iCn1xtMMZP/5X0B4okbbKOVQZxC+Jd1DM
	4jL8tV7ZmfUXy3QguuLh5HoL/5qTdN9hQtl5WoxHQtU8f1YlnYjyY+QHL4RMn9kMp9T00Dh+AlF
	nkSgZsdgH9duVB+LBMYclHZCryIe6DjhpYkY1sKLQqUIJRS4WaD2X9cKSqTfIbI9GnWcrQkl5Ct
	LwIgMaIKzlvJmYeJzMI4JLS5nfB9cuO/OFVewCAJJbXq+Nkx/G2VduSNp6E8SAmFJ61CnukvlhO
	R5Pk/ameg1yw==
X-Received: by 2002:a05:7300:d213:b0:351:73ad:bb2b with SMTP id 5a478bee46e88-35173adbcacmr2493558eec.20.1791443683185;
        Thu, 08 Oct 2026 00:14:43 -0700 (PDT)
X-Received: by 2002:a05:7300:d213:b0:351:73ad:bb2b with SMTP id 5a478bee46e88-35173adbcacmr2493524eec.20.1791443682556;
        Thu, 08 Oct 2026 00:14:42 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:42 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:37 -0700
Subject: [PATCH v19 07/12] media: qcom: camss: csid: Add support for CSID
 1080
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-7-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: TXLfCHRMcrira3jqjqY9D3iP_JVdaAle
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac742e4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hAI97D9Htgy7VLTQvtAA:9
 a=4Q4zU7iZy6iiv8wZ:21 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfXwOuh2HPEctEo
 Xu5VVzQk3VHmvBG4qbLNPpHZE3A1gpGuLwtggnUVRnKkAQ6M2j9dxTAozlUP5ciids6XoWuvEi2
 ImaO9EtuVgC+u1cE/ZSOCEzL6GnNfV0=
X-Proofpoint-GUID: TXLfCHRMcrira3jqjqY9D3iP_JVdaAle
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX+Gcg/cADtkiY
 XjxmF+KwzRf1Umqf9wmutI5L5ehQXSMyTy47Crn2c29FunSt0r5cz3V63pceiN9/wEHCCubZiGU
 RqC9hEX4CyXt5UmA6oAAEfGmNKigJ+DZeF/C/MZOmBNkBwbpnigzWArG1JN4DRdoSMQZdEREhm9
 gimFRZ1c9kfZNTuz3iI0Af5lpRBic169tEI+nkbA9UGPy0ZaNFhKJvfBVw5XR5XOQ3QXZf6O31F
 LYzrS/Jg0/yeC0JSPCk0nvT982vGS8cARmxMW7xQfpz89+MVBi73zNF7O+dbShWtrxyhhEaF7xk
 Hm1M4NflTpHMDaeNHn7yZMdYpS9KvNAGZbgcaYUzDq6F8ywy6YuGsl4acl0GsZy1vLO/qsWAKSl
 8EjK2dHOc5NadImhCFcVdoYhSVQVUh1vl5TtHAQEYj9lajVpID9TVHmTcGEt237JBqiRx3Yzph/
 k+bzajTAhrsQqJapzJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

Add support for the CSID 1080 hardware found on Kaanapali SoC.

Introduce CSID 1080 hardware resource descriptions and implement the
hardware-specific register programming, reset sequence, and BUF_DONE
interrupt handling.

CSID 1080 splits RUP and AUP updates into separate registers and uses a
SET register to commit the updates. Update the CSID interface to support
both this scheme and the legacy combined reg_update mechanism.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 384 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
 drivers/media/platform/qcom/camss/camss.c          |  75 ++++
 4 files changed, 468 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 27898b3cc7d3..218ba3a95939 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -8,6 +8,7 @@ qcom-camss-objs += \
 		camss-csid-4-7.o \
 		camss-csid-340.o \
 		camss-csid-680.o \
+		camss-csid-1080.o \
 		camss-csid-gen2.o \
 		camss-csid-gen3.o \
 		camss-csiphy.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
new file mode 100644
index 000000000000..46e443e05195
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-csid-1080.c
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include "camss.h"
+#include "camss-csid.h"
+#include "camss-csid-gen3.h"
+
+/* Reset and Command Registers */
+#define CSID_RST_CFG				0x108
+#define		RST_MODE				BIT(0)
+#define		RST_LOCATION				BIT(4)
+
+/* Reset and Command Registers */
+#define CSID_RST_CMD				0x10C
+#define		SELECT_HW_RST				BIT(0)
+#define		SELECT_IRQ_RST				BIT(2)
+#define CSID_IRQ_CMD				0x110
+#define		IRQ_CMD_CLEAR				BIT(0)
+
+/* Register Update Commands, RUP/AUP */
+#define CSID_RUP_CMD				0x114
+#define CSID_AUP_CMD				0x118
+#define		CSID_RUP_AUP_RDI(rdi)			(BIT(8) << (rdi))
+#define CSID_RUP_AUP_CMD			0x11C
+#define		RUP_SET					BIT(0)
+#define		MUP					BIT(4)
+
+/* Top level interrupt registers */
+#define CSID_TOP_IRQ_STATUS			0x180
+#define CSID_TOP_IRQ_MASK			0x184
+#define CSID_TOP_IRQ_CLEAR			0x188
+#define		INFO_RST_DONE				BIT(0)
+#define		CSI2_RX_IRQ_STATUS			BIT(2)
+#define		BUF_DONE_IRQ_STATUS			BIT(3)
+
+/* Buffer done interrupt registers */
+#define CSID_BUF_DONE_IRQ_STATUS		0x1A0
+#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET		16
+#define CSID_BUF_DONE_IRQ_MASK			0x1A4
+#define CSID_BUF_DONE_IRQ_CLEAR			0x1A8
+#define CSID_BUF_DONE_IRQ_SET			0x1AC
+
+/* CSI2 RX interrupt registers */
+#define CSID_CSI2_RX_IRQ_STATUS			0x1B0
+#define CSID_CSI2_RX_IRQ_MASK			0x1B4
+#define CSID_CSI2_RX_IRQ_CLEAR			0x1B8
+#define CSID_CSI2_RX_IRQ_SET			0x1BC
+
+/* CSI2 RX Configuration */
+#define CSID_CSI2_RX_CFG0			0x880
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
+#define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
+#define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
+#define CSID_CSI2_RX_CFG1			0x884
+#define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
+#define		CSI2_RX_CFG1_VC_MODE			BIT(2)
+
+#define MSM_CSID_MAX_SRC_STREAMS_1080		(csid_is_lite(csid) ? 4 : 5)
+
+/* RDI Configuration */
+#define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) ?\
+					(0x3080 + 0x200 * (rdi)) :\
+					(0x5480 + 0x200 * (rdi)))
+#define		RDI_CFG0_RETIME_BS			BIT(5)
+#define		RDI_CFG0_TIMESTAMP_EN			BIT(6)
+#define		RDI_CFG0_TIMESTAMP_STB_SEL		BIT(8)
+#define		RDI_CFG0_DECODE_FORMAT			12
+#define		RDI_CFG0_DT				16
+#define		RDI_CFG0_VC				22
+#define		RDI_CFG0_EN				BIT(31)
+
+/* RDI Control and Configuration */
+#define CSID_RDI_CTRL(rdi)	(csid_is_lite(csid) ?\
+					(0x3088 + 0x200 * (rdi)) :\
+					(0x5488 + 0x200 * (rdi)))
+#define		RDI_CTRL_START_CMD			BIT(0)
+
+#define CSID_RDI_CFG1(rdi)	(csid_is_lite(csid) ?\
+					(0x3094 + 0x200 * (rdi)) :\
+					(0x5494 + 0x200 * (rdi)))
+#define		RDI_CFG1_DROP_H_EN			BIT(5)
+#define		RDI_CFG1_DROP_V_EN			BIT(6)
+#define		RDI_CFG1_CROP_H_EN			BIT(7)
+#define		RDI_CFG1_CROP_V_EN			BIT(8)
+#define		RDI_CFG1_PACKING_FORMAT_MIPI		BIT(15)
+
+/* RDI Pixel Store Configuration */
+#define CSID_RDI_PIX_STORE_CFG0(rdi)	(0x5498 + 0x200 * (rdi))
+#define		RDI_PIX_STORE_CFG0_EN			BIT(0)
+#define		RDI_PIX_STORE_CFG0_MIN_HBI		1
+
+/* RDI IRQ Status in wrapper */
+#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0x224 + (0x10 * (rdi)))
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)	(0x228 + (0x10 * (rdi)))
+#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0x22C + (0x10 * (rdi)))
+#define		INFO_RUP_DONE				BIT(23)
+
+static void __csid_aup_rup_trigger(struct csid_device *csid)
+{
+	/* trigger SET in combined register */
+	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
+}
+
+static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
+{
+	/* Hardware clears the registers upon consuming the settings */
+	csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
+	csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
+}
+
+static void __csid_aup_update(struct csid_device *csid, int port_id)
+{
+	csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
+	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
+
+	__csid_aup_rup_trigger(csid);
+}
+
+static void __csid_reg_update(struct csid_device *csid, int port_id)
+{
+	csid->rup_update |= CSID_RUP_AUP_RDI(port_id);
+	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
+
+	__csid_aup_rup_trigger(csid);
+}
+
+static void __csid_configure_rx(struct csid_device *csid,
+				struct csid_phy_config *phy)
+{
+	u8 lane_cnt = phy->lane_cnt;
+	int val;
+
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
+	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+	writel(val, csid->base + CSID_CSI2_RX_CFG0);
+
+	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
+	writel(val, csid->base + CSID_CSI2_RX_CFG1);
+}
+
+static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
+{
+	int val;
+
+	if (vc > 3) {
+		val = readl(csid->base + CSID_CSI2_RX_CFG1);
+		val |= CSI2_RX_CFG1_VC_MODE;
+		writel(val, csid->base + CSID_CSI2_RX_CFG1);
+	}
+}
+
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	int val = 0;
+
+	if (enable)
+		val = RDI_CTRL_START_CMD;
+
+	writel(val, csid->base + CSID_RDI_CTRL(rdi));
+}
+
+static void __csid_configure_rdi_pix_store(struct csid_device *csid, u8 rdi)
+{
+	u32 val;
+
+	/*
+	 * Configure pixel store to allow absorption of hblanking or idle time.
+	 * This helps with horizontal crop and prevents line buffer conflicts.
+	 * Reset state is 0x8 which has MIN_HBI=4, we keep the default MIN_HBI
+	 * and just enable the pixel store functionality.
+	 */
+	val = (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN;
+	writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
+}
+
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+{
+	u8 lane_cnt = csid->phy.lane_cnt;
+	u32 val;
+
+	/* Source pads matching RDI channels on hardware.
+	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
+	 */
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	val = RDI_CFG0_TIMESTAMP_EN;
+	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
+	val |= RDI_CFG0_RETIME_BS;
+
+	/* note: for non-RDI path, this should be format->decode_format */
+	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val |= vc << RDI_CFG0_VC;
+	val |= format->data_type << RDI_CFG0_DT;
+	writel(val, csid->base + CSID_RDI_CFG0(port));
+
+	val = RDI_CFG1_PACKING_FORMAT_MIPI;
+	writel(val, csid->base + CSID_RDI_CFG1(port));
+
+	/* Configure pixel store using dedicated register in 1080 */
+	if (!csid_is_lite(csid))
+		__csid_configure_rdi_pix_store(csid, port);
+
+	val = 0;
+	writel(val, csid->base + CSID_RDI_CTRL(port));
+
+	val = readl(csid->base + CSID_RDI_CFG0(port));
+
+	if (enable)
+		val |= RDI_CFG0_EN;
+
+	writel(val, csid->base + CSID_RDI_CFG0(port));
+}
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	u8 i, k;
+
+	__csid_configure_rx(csid, &csid->phy);
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			__csid_configure_rdi_stream(csid, enable, i, 0);
+			__csid_configure_rx_vc(csid, 0);
+
+			for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
+				__csid_aup_update(csid, i);
+
+			__csid_reg_update(csid, i);
+
+			__csid_ctrl_rdi(csid, enable, i);
+		}
+	}
+}
+
+static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
+{
+	return 0;
+}
+
+static void csid_subdev_reg_update(struct csid_device *csid, int port_id,
+				   bool clear)
+{
+	if (clear)
+		__csid_aup_rup_clear(csid, port_id);
+	else
+		__csid_aup_update(csid, port_id);
+}
+
+/**
+ * csid_isr - CSID module interrupt service routine
+ * @irq: Interrupt line
+ * @dev: CSID device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t csid_isr(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 val, buf_done_val;
+	u8 reset_done;
+	int i;
+
+	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
+	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
+
+	reset_done = val & INFO_RST_DONE;
+
+	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
+	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
+			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+
+			if (val & INFO_RUP_DONE)
+				csid_subdev_reg_update(csid, i, true);
+
+			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
+				camss_buf_done(csid->camss, csid->id, i);
+		}
+	}
+
+	val = IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
+
+	if (reset_done)
+		complete(&csid->reset_complete);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * csid_reset - Trigger reset on CSID module and wait to complete
+ * @csid: CSID device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_reset(struct csid_device *csid)
+{
+	unsigned long time;
+	u32 val;
+	int i;
+
+	reinit_completion(&csid->reset_complete);
+
+	val = INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
+	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
+	writel(val, csid->base + CSID_TOP_IRQ_MASK);
+
+	val = 0;
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			/*
+			 * Only need to clear buf done IRQ status here,
+			 * RUP done IRQ status will be cleared once isr
+			 * strobe generated by CSID_RST_CMD
+			 */
+			val |= BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
+		}
+	}
+	writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+	writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+
+	/* Clear all IRQ status with CLEAR bits set */
+	val = IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
+
+	val = RST_LOCATION | RST_MODE;
+	writel(val, csid->base + CSID_RST_CFG);
+
+	val = SELECT_HW_RST | SELECT_IRQ_RST;
+	writel(val, csid->base + CSID_RST_CMD);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID reset timeout\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void csid_subdev_init(struct csid_device *csid)
+{
+	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
+}
+
+const struct csid_hw_ops csid_ops_1080 = {
+	.configure_stream = csid_configure_stream,
+	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+	.reg_update = csid_subdev_reg_update,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac..3c2d15a61836 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -154,7 +154,13 @@ struct csid_device {
 	void __iomem *base;
 	u32 irq;
 	char irq_name[30];
-	u32 reg_update;
+	union {
+		u32 reg_update;
+		struct {
+			u32 rup_update;
+			u32 aup_update;
+		};
+	};
 	struct camss_clock *clock;
 	int nclocks;
 	struct regulator_bulk_data *supplies;
@@ -216,6 +222,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
 extern const struct csid_hw_ops csid_ops_340;
 extern const struct csid_hw_ops csid_ops_680;
+extern const struct csid_hw_ops csid_ops_1080;
 extern const struct csid_hw_ops csid_ops_gen2;
 extern const struct csid_hw_ops csid_ops_gen3;
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index eeceb79c1e86..261e6c837dd4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -83,6 +83,79 @@ static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
 	},
 };
 
+static const struct camss_subdev_resources csid_res_kaanapali[] = {
+	/* CSID0 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE0 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_1080,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5639,9 +5712,11 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
+	.csid_res = csid_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

