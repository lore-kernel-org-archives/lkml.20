Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E94E80A3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876100; cv=none; b=CkU7kYc119kyeqZdqtbK/MAzkwkiVhckSAQQb5Avoo/6/zntKyES5oKCllKeGbLcxJeiFn280RCGWWb2tk136hgs/Kdt8cNoJC865y5pMdsyW8Ku664uWOIkIZ8IFQdeSNMfDV7J+tBq208YojgObzkL355z7gCnuZY+yDN1ruU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876100; c=relaxed/simple;
	bh=WaKGCsUJt3uTgeCP0U3PYXnsu1NpCnTLxXsrahFqEBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELpPg4D1fXV4i8cyugzGSYndjx232bq9JeQC/1RqYFJtS6qlzt5AWU+ymTvZtEQ0mLO/Mev4YPi4W+7R+EUz6pEUJ/TUM6iXaGYlDLcjmLv9iLeyYI76ECqYkOl/4q7Q9t4nq8vwzOGR1BIUGMmkJdAx4ajiITmM4KhjEJxz4go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQYYxlA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZiLa7/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQYYxlA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZiLa7/Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ClCnm3364358
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G0PZhPYBSdYv03XNJ7TA4w+vPBHYNvgmKmM+Ke7q93c=; b=OQYYxlA+QswhWC64
	jEiCozI8CVArltvd7LGyUB5SQxshoPMVeLsU16LUEHYbc3kic9gyea35d9fw497G
	IrSs8UeRYTfDOApUykxqc7sqJViIKusGw7zlxLd83JMNcPbGWXVSOJ75xy/kYgOp
	O1h0Fn9NyxserVgdSX8YGJ9Msmr0p4UFjv5G0PHYVJo0pNuQT//16Jg9kWI6QjKa
	/veO62kmwZ1jmGDsea+cBzv4RBVXfrarCHtpsjJ8KOmlyeGl8ii7SDg/K1YE5jS3
	NF4T3EiogZQWt58e0ufi2p22PdnasNp8gTWa/NDfbZSuB/j+HToMLPmf8tAJbR+o
	ii4wgw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7hw1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:01:23 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f1da5e5b06so5558405a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876083; x=1789480883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0PZhPYBSdYv03XNJ7TA4w+vPBHYNvgmKmM+Ke7q93c=;
        b=fZiLa7/QMg5E3qbJ6nnXMNI2kaI0lXulL5orkpuYXCV7W8QUkAPKWUxqqsNRgwhDZx
         LpLHaWCc/ubXRnUHHlTXaADWdHBcPdvWY0Tzu1oDTnG4iiROJKd2wZ7H95QK4pXlyDXz
         PqEGJYVPUHMqWG3NO/phc0o+Xz5LTYi3Q18ocW/UEcekjcMTmX9aKDDb7yDVMQFM/zIv
         mc/Jj4NbBG9vDDGirggoGWUvLsjQJcgN1q256Kyvw+p9BNASL2cbNQhnkzsMwGoa1p5T
         9rqttbZmXRUctLhWbzPxFoJ2xkEEcGpN8kEOelN2XSCQHxurFxQ3Oy/3G19F6tcKCka0
         QJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876083; x=1789480883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0PZhPYBSdYv03XNJ7TA4w+vPBHYNvgmKmM+Ke7q93c=;
        b=J3b99ibh/SE1jDWjc0LLnRPThZrdG4spsjIDT3aUS2NfnZqlg2rTBq/mkq6JT+4Jpy
         rd1x9hawd+X/7zc6ssx5j6LFOn9R3R0EVkyyrob2o9EnUB2F4VfutddpR3YsqqTi3dtS
         ZP2+dC6Q7BBHSXxEWBM843omERU3/6AoaOQBvNTfXTYzD1C/O+CvDQBoCl0sA6zPaIxb
         VRzIx2UQYr+vHvYwfSV1KEbZDKu3HcceA7zUVvrRfYZD1j5OVJU9hG6WxTrl/e4CYvKa
         MVoTSHyJKRbm4TfEr+02umKKyfw2VA4m9uhKNldKsxb9TCnnmmnvsb7XUZk6aHIWzNW0
         QRDA==
X-Forwarded-Encrypted: i=1; AKwUvBxg1QGqmy3KGNPyr0lx8juXjg/Fi1S8OlMvGDfzKOGJyVmGjzfyMSl7SvP6V5jZIUN04aVtLZ8bPpTMQJw=@vger.kernel.org
X-Gm-Message-State: AFuF++n3xCzn8jtVudtubWTYlDnxWq+qZuD+j9TW6XfpgZ3bRoMBJbXv
	n44SnQm0W//mOa6H+UQZdwSSW9ozzvas+84N9D/lLaGiH3PoFX9pPBfkmOqVvnlkq9OwrU0CHpC
	ikX2O0KZh6IX1Fp6v8ZRXcOB54MKDxgwRwTnBw5yRTdLi8fkZ04FHA3zRrNQvCPkD8F+4Ja2XzN
	Q=
X-Gm-Gg: AYBFou0E7OikFXtEYv6brhyBkkEcOCQfiiFgseMTP6efm4CvUvsMG8tXTn7VBkhpAIA
	TnO10A1156Q/D4285ZvbinS4Hdwqnt8/F72py1R6Ib/L4JZ76CNRKy1t43jYIszTbrRstDCK2hz
	WbgErrsKpJzSHrCBl+kHg+lPwH/eRu9ArRXmc448H5QoZnvhiMWXG25rhjajtwuyX6PBdD2eKq4
	elMyLNkXxR4twLi0N0XZSRGY6nQRH2+a2otV5d06pRCxqURnGkRfxTIpolUX6AtLETXnoJXr4wg
	S1lYx6OiOQk0IT9UVo0gVacE4aFneURQd7iniDQGtI7IBTvJgTf3N4h3EyrlFCpNNrp9E4I4Z2K
	+Rtkknsiki9Q2C4DkRX14dtuDn5g=
X-Received: by 2002:a05:6820:c91:b0:6b1:535a:eb8 with SMTP id 006d021491bc7-6b6fa8e02aamr15676835eaf.2.1788876081165;
        Tue, 08 Sep 2026 07:01:21 -0700 (PDT)
X-Received: by 2002:a05:6820:c91:b0:6b1:535a:eb8 with SMTP id 006d021491bc7-6b6fa8e02aamr15676661eaf.2.1788876079847;
        Tue, 08 Sep 2026 07:01:19 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:19 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:30:54 +0530
Subject: [PATCH v4 1/9] phy: qualcomm: qmp-combo: Add DP COM v8 header and
 fix register layout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-1-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=1867;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=5KZuYwwIpuENfuIkXJlkVdcGxo+rr2inFXunMZRoIpk=;
 b=rb3Wf0GFEwzaY+juWsk5XTEMYXhYd2BthP70cxh2ZGFjXn62rWClRBT4GJ5hFPphuONUC6Q7K
 4vaXhA5qGQHCFd05D+0fasxMqX7rTrXtM9vMioW0L6xCZ5vIOnTgQYx
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6aa01533 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9hqLRW_DAkAp12WW2ZMA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX10fxT0CzTTOE
 pUzw8KcepcINIgTdQen9ew+vWBHViE9yZ1KtU/zpBKugTP9NE0Apgn9wlRXr4M5zpOT7Ka40KJu
 smkD1euuOp8Q8Bg69by+tLG4Kv2J5J4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX4qIkqw4+dGus
 qTQfnJYCM9akPzAsBu6z5HesOuIxY6B/36U+8cavWYi1bFmzr5tp27ST/wuYRWhzPY1uVHL9tqc
 ytzVo9Q/AsMNwAjgey7ppEymmx6Azul7jiyuqUNISY1IQ/dUyBMI+47qXUErlHEXNNDPgWeL1TD
 qLsPWWlfSLNvCz01w95F4S0ce+MQdx2Xe2z1UwkL7D8AH7fORmByy2fe+Hw49hiBXZWuAAX0I0X
 4RQvReuhPe2U8fSq1czvYA9PVz6a5emz5RKJZ/msq5AbTW7pyr3P13Yui9GrGdwRc8kpdy29Dkg
 RaYuF7rPs8sK6lovUxmzYbz6eEqqMtK0CdqTbXQFHQzEpwe7L0tWvyerKGp7M8Souhml8MukiWZ
 SxAhr9FpG2rjd5fkZsjAfIbdKuHDYbs31bECYSeVzfRAuF0fLYqGKEOCwAMOp+lEwiUrszaLc7+
 +Da9y/IN+B8/5zmjtLA==
X-Proofpoint-ORIG-GUID: a03yoc7RbndNQRW4qLPMen72I8nahieZ
X-Proofpoint-GUID: a03yoc7RbndNQRW4qLPMen72I8nahieZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080151

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add the new DP-specific QSERDES COM v8 header file and update the
register layout to use DP-specific status register offsets for
C_READY_STATUS and CMN_STATUS registers.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Fixes: 5b289913959b ("phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c39ced168d03..4d31637f1dce 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -51,6 +51,7 @@
 #include "phy-qcom-qmp-dp-phy-v5.h"
 #include "phy-qcom-qmp-dp-phy-v6.h"
 #include "phy-qcom-qmp-dp-phy-v8.h"
+#include "phy-qcom-qmp-qserdes-dp-com-v8.h"
 #include "phy-qcom-qmp-dp-phy-v10.h"
 
 #include "phy-qcom-qmp-usb43-pcs-v8.h"
@@ -318,8 +319,8 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_DP_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V8_COM_RESETSM_CNTRL,
-	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS,
-	[QPHY_COM_CMN_STATUS]			= QSERDES_V8_COM_CMN_STATUS,
+	[QPHY_COM_C_READY_STATUS]		= DP_QSERDES_V8_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]			= DP_QSERDES_V8_COM_CMN_STATUS,
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]			= QSERDES_V8_DP_PHY_STATUS,

-- 
2.34.1

