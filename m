Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183951;
	b=tYn1cL9rEDkyh1jpmwTkMW1prUNzYO3QC3dVAwNZ9j2spWFRMLKVswxdbccD4tlYyTTg
	 E8z/O09ozv6SXA+qwrgQ5L8+yvj+aNRne3fU3oax86XxpPY6I7YLCVJk3LrbgnfyJzC/M
	 P4ZFTlvZut9UnNCsVgNQbMwl7I9xPXQE5Ri6JeYT8HMVwmn3OqV5vdyy8Xij76EnXsZFK
	 2wS4B0sWbataC0bDWjVBwapOuvEcUQplQ8YUQTCkCBw6++AB7c2rsmJFX3FdbI0r8E0Cn
	 kacNgK89M4El/D0hI8jzsDp0hioOZdLSFJO9Asv7ulFZD/FK5v6SYdml2WtZoHOtlaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sNXojJC4nCZB+gTOca4T46HaCi9pUQrIo0UYlRNSMU8=;
	b=UEVfnl5xhBQe3DmKyCMBWCtsCdoxdziSZVv7LBgeuVMI8hhJInjrbMjlYD/XWW2D1slx
	 WPt438Qsw3PxXFgSVc6lVjc7jBmK0OCzc4twxWoSFYQB4bzH2QNFjCjFJEhjFV7qN5E5o
	 S90uBE2T/lJlPXOGTz2C/lI4LKZPvzCr4KrnOKIVnk4sU2mFDLeJX9/UX8MBrKjhRrJqk
	 AdkXSy2sF4ZuiIlW+eEUJ4rVmT9Ww1aWw4z/vk5gJ5QEAa6/I8BwCP0+GH273UPeXWh5a
	 ukIDe+pFmzuCdHiPmhBV47sNnpOMSVNFXWXSOqMrDnYRowgfWyUHrTPWMPNa1/6X7uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AIcrj/Nk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LQXgDaql;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33AD606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B33AD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AIcrj/Nk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LQXgDaql
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SAZqtQ872044
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNXojJC4nCZB+gTOca4T46HaCi9pUQrIo0UYlRNSMU8=; b=AIcrj/NkWrOrdQUV
	BA7r+1MuzVf/Sk+n/s+gustt57fpFUTIBDWwKDz6h46dcq+RlQYsxECl1fmvSdwp
	osZMHYQLle0i/iilxcPmWZtm2lmRoxz1MxN9A2pemrCCql90MGaqDLDUA5jWipiK
	2krC1r16Qwi1J3v1e5PxlQpdYGJiUZO3+QFLtBkWnasjYUgbFjzU42ey6Ax/7TUu
	HYUoJ9e3ugIecVkThglSY0/czZCwYemUzlBNf7XsOHySXmwQ27WEP/5zl1mj6xft
	3gBR+h19Vqhh4VsJz06BQv1+QvSc+lvBKaHHKnzZBfZRZUwdfSjxZXm6LXzelIOk
	MU0vPw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehg0by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:09 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so1064864c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183949; x=1793788749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNXojJC4nCZB+gTOca4T46HaCi9pUQrIo0UYlRNSMU8=;
        b=LQXgDaqlyAPexcKnhR+m0A1CuOduThSO835WfSdbNA1ZfCtoN2aSsz4F8VVCAspY6m
         CWgotCC2RgjsXd+MHllk20lOQzPON1+7IIIyRFnW2TQmn6hjvIO9gHGZF222mHYbvvIT
         NEM+EG9tgyDOW70BigRoY7ap+gEeHk+nr8apit4YGbHEQAMNYa95nk/LmjIYbENgpp/+
         HIVsrg+o+57kEGbpG+Uygtzt7oaYGsfuE2I+3IVvJbgMHb9kmsrcKl0sP2a/hBbk3OLS
         87XctD52jlInFDlyooofIsM5fYxTEG/vCL0fl93vzX1mD+YbrZJ8fce5oF37DGRvRXQk
         ZH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183949; x=1793788749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNXojJC4nCZB+gTOca4T46HaCi9pUQrIo0UYlRNSMU8=;
        b=qpx4V+BG8MpKRZo8MtuWbUAs+1fVW5MKPsti3nZsYJGfZHFAj4RE0vSyrMwBEbReDK
         pmO0e+T/cVmCf/CdPMONbGIaloUStfN4zdlcc3RkiNbwLyUtoOPgbRdV3kvvRrpFn5V3
         Vvweyhmm6YB0jRWJWyEGkFa2vGXvBF7n00riEv/AfXhvEqFCM4UODZaZ3CNDp6EBYVOR
         42A3hlou0qWHGK83LQ6IpnGtb98grR2mojEzF21nEn2vxFluU2w9EPFQGctJvwBTBsFD
         P0c5IYcN0Fvt/YA/dwtburuynCclfpBrbWohnM6OQC1xapQisE4CvKbAFZatgaHCJPXp
         3/aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTOyGovaV360tGubIAWY8Gv0So0618OIatYj9dWGsrgSzwpkPIQzn4riwwVTp7IDn0bpdLQVsB55NDv7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuXcdzIcP++BJ8K+KwNMUmo1mdNezvSnLhbbEbvVY8GgREIOl2
	BdtX4QueFK6Q1tc4eldqzxAb/i9o+L/g02wdss67CyPqS1WF0j/GAKBtOhw+f0nxv8uOQM258oO
	wDW3b/2Q9bc4ooZbJGWT6EMTVAcZdzNSjL5adZ/uc7Zlesj2RITauAsIFnJGsmkLMLQg=
X-Gm-Gg: AYBFou3IWL6UV8q3tJtriJvouJnSlaILSypdkAH9njEmY2gzi63J3SlprrFwySmhPUG
	vtpwHeGR9L3UMepKzDt8EeppfJcVm97ggEwBQ8CaI12lgXnnQGkk8XrogqYnTDeECjTcF4RJAOG
	/D3fCfhlBgU9OXp1J5nvZAOWKAZwtziW/MINFJEuQ6NCouCVKumTKuBts2930z3lBxEl8V3K07B
	RqtDJhwWsb+b9eEfPjdMhzyMCVGKouIkfuuGUqE67A0TFxfF8A0A5hXvSbjNwaGHS0d6BWFEH0S
	LMOsW4yOXG3kCR2tiMbafDJy7NHVrpsWyN9+k6S8YSf79ofR96OWLgKH+it9ZVgLdvdpq6zqpgj
	SVniGECrGTmJ3GJ7hnvRViiZFkz5tGytGOEZ2LyH/96X+VxdOutyICWlIi+d1hAPYEjAkr9kdap
	k=
X-Received: by 2002:a05:7022:7e8a:b0:19a:ace1:793b with SMTP id a92af1059eb24-1a6cf72b429mr3330504c88.18.1793183948361;
        Wed, 28 Oct 2026 03:39:08 -0700 (PDT)
X-Received: by 2002:a05:7022:7e8a:b0:19a:ace1:793b with SMTP id a92af1059eb24-1a6cf72b429mr3330445c88.18.1793183947594;
        Wed, 28 Oct 2026 03:39:07 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:39:07 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:03 +0530
Subject: [PATCH v6 07/11] phy: qualcomm: qmp-combo: Extract common DP PHY
 init sequence
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-glymur-phy-v3-v6-7-1f1d2e565a66@oss.qualcomm.com>
References: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
In-Reply-To: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=5180;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=wblh5fmtDpMniP2BS7MTdLS6SNV5M07FHzguiRFePYY=;
 b=IwVHhzHbm8Iqe2o8yj9TaclAQbujYMA4ird6TqW9OseIXu8kNIiJYKr+mZhxPNjVJvMhA1+iC
 CzBRHQI6GusCSjd3oJ5ALPqBkdRe9BYpHbFE2nLqZ30Iv7prePJulLP
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX+tQTzs7qgg7w
 W0/pdj8WCZUm5wE5FhnGqnZ9llQRXBC41MVorp7xUiSUmFVSNviCEZPd1fIJ0/bjDJCCugNF0Af
 PuOcgKq+V1Hu+Mx3sN9k3X2NKBrDOkPCDKZzSTVnPIZZClCw3s6oJrg++9RLNxt31c2hM0MfgbX
 AHyv8Aa9YKfd4Xw3SpXMeEur51eCDXMj//0ny8qaDfE3G2aVuu+f9sPzAEe83V1Z+O1ukls7IBF
 DDK6CF7CZLk/A6LhE4sGR/2lVgAjlDI8kgUOvHtm7hjcvtRUQqanigNJTnKHPgkn8xl5EVMr46M
 S3FX6I1fztmUHGXl/A8qCYkNSx4Di3dEdLURmqe68TZ6xgZYRWZSVlbqRZUhbm0whWdGs5v6V/E
 4uT4JGa//fTAQrhKTL+UQfO7g+t0bagTTgolJjkOWHENDu+j98m88Td2MtYpAgn05utYlxSKt6j
 KW8sexEUtht1iSzBZBg==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1d0cd cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=WQ39YxX6NF7xrdOXP0YA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-ORIG-GUID: n4Q9PbMQ1QuE6wzd-B8RSrgp_HALWite
X-Proofpoint-GUID: n4Q9PbMQ1QuE6wzd-B8RSrgp_HALWite
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX32ZQNpZTT+sD
 hI/6C2Rhm7dsNrliY1KffakznfTO1dLS251KRy4Vblm5xDAsu0JSzLkjKo2xEBmkghXd2/smdHE
 gqTC00YADYNp+wXKXwV9nOS88TGyCOk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Extract the common DP PHY initialization sequence shared between
qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy() into a new
qmp_combo_configure_dp_phy_common() function.

The common sequence covers:
- Validation that dp_aux_cfg2 is configured for the platform
- Writing dp_phy_cfg1 and dp_aux_cfg2 hardware-specific register values
- Calling configure_dp_mode() for TypeC lane orientation
- Programming AUX_CFG1, TX lane control registers
- Invoking configure_dp_clocks() callback
- PHY_CFG reset/enable sequence
- Polling COM_C_READY_STATUS and COM_CMN_STATUS for PLL lock

Refactor qmp_v456_configure_dp_phy() to call the common function,
removing the duplicated initialization code. Update
qmp_v8_configure_dp_phy() to call qmp_combo_configure_dp_phy_common()
directly instead of going through qmp_v456_configure_dp_phy().

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 98 ++++++++++++++++++-------------
 1 file changed, 58 insertions(+), 40 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 2ca67c70b17a..ff7f0293638d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3844,6 +3844,62 @@ static void qmp_v4_dp_aux_init(struct qmp_combo *qmp)
 	       qmp->dp_dp_phy + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
 }
 
+static int qmp_combo_configure_dp_phy_common(struct qmp_combo *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	u32 status;
+	int ret;
+
+	if (!cfg->dp_aux_cfg2) {
+		dev_err(qmp->dev, "DP AUX CFG2 value not configured\n");
+		return -EINVAL;
+	}
+
+	writel(cfg->dp_phy_cfg1, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
+
+	qmp_combo_configure_dp_mode(qmp);
+
+	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
+	writel(cfg->dp_aux_cfg2, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
+
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
+
+	ret = qmp->cfg->configure_dp_clocks(qmp);
+	if (ret)
+		return ret;
+
+	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+
+	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
+
+	ret = readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000);
+	if (ret)
+		return ret;
+
+	ret = readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000);
+	if (ret)
+		return ret;
+
+	ret = readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000);
+	return ret;
+}
+
 static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -3944,48 +4000,10 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 	u32 status;
 	int ret;
 
-	writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
-
-	qmp_combo_configure_dp_mode(qmp);
-
-	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
-	writel(0xa4, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
-
-	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
-	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
-
-	ret = qmp->cfg->configure_dp_clocks(qmp);
+	ret = qmp_combo_configure_dp_phy_common(qmp);
 	if (ret)
 		return ret;
 
-	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-
-	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
-
-	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
-			status,
-			((status & BIT(0)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
-	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
-			status,
-			((status & BIT(0)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
-	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
-			status,
-			((status & BIT(1)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
 	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
@@ -4014,7 +4032,7 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 	u32 status;
 	int ret;
 
-	ret = qmp_v456_configure_dp_phy(qmp);
+	ret = qmp_combo_configure_dp_phy_common(qmp);
 	if (ret < 0)
 		return ret;
 

-- 
2.34.1

