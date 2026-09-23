Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D80334688
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125762; cv=none; b=H4Ab3wnEzhfPJZT30rApYc9DFv121kSF+9FQvcmHSH9EbVVetSX5iQGmpAUFcSQvReufnECvhYroYiVvQiGNT7ljitFWfsQYNjTXAvBaFPsqIa0BiHTE+Dmgot44XFfWO1Gs1ZzL8jUe64gVcH9ikyDCaYLGyoNxD/6Ts8aQyk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125762; c=relaxed/simple;
	bh=LAj5wFs1I2UH5hJ13rqJNCQ7NMV5AqqbqBxmaYQgJ7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTyn2UBh76DzaGEsPwAQLivL40/BJ9GEM+rf+F+6o69xzR2v6141ad5w9R0RV1bc3DOp8N1enEedHNzBotq9aCyEE0B2IANRqqMdwigjM0BahzabHP6KCuhH1LZLt1eIS2rQJmxA4cdbhiKqEwHJaf5xO5TDJBFhgabBeTvOmcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+gUVo5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXQuIkIb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+gUVo5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXQuIkIb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N0EwXs2646171
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tz6NKk6ALui7Z2B2Ol5dUKWciABAFYV+RUGiS1O4Xo4=; b=F+gUVo5QvSVJHOHX
	ZC0XibfkbzqKvdPYhB9DweD9Cngp8njlE06E2oWZ++EdQv81quKDpY/gfrMyyVUO
	PfiPZtEFAcJC0UsiLvmKRKQN2k8j0RV7Le8repx8hDPfeJAMWiSCjGxlMNxPzOZY
	yfrRG0vwGz7bNfA7cTUam5ly5lKlITDfEpB91Ghsz2Z9yhlu6c5zEr1tNb7J5Zho
	a7Tdy9ULD49WR4et8Ty84e42ZLSZJtcrp/rB/W0NVRGC/xchv9J7GPEaeovS/9Cu
	74TP4aFlexjODhUZ0dfWzymv2wzLJx53XDKFQLhOuYh9ms1gSrV9EqPnxHOcGnUe
	1VqwjQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428r52x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:09:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-331b2ec616fso1497821eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125758; x=1790730558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tz6NKk6ALui7Z2B2Ol5dUKWciABAFYV+RUGiS1O4Xo4=;
        b=RXQuIkIb6+bdSZjebr0s0Ov+K0XquETDrxUseDyhWT1UJ8TG66TFmtXgvi5odfEOr7
         V7IiKdrDsKfAjlilRbpStK+uuNhTR0Vt2NOnFwSXLxraieTqb5pWffujUjgHCc3F22Gk
         woCrwgBTngh9QnAKFLJzkA4/xSwenIBBgZRg1WKlLkJ6ZUl/rxZZiCJAX/ZyZK/GqZyP
         PGrOxvYhZNtrGzNa132GO5kkNWYxBxImbDyAEjArLUzFxrsCMqR4zRNppHI56BtyzNUT
         Q+alPduK4GSJSlq1MEIf7nn5ICGft0niBAAeLZSitQqnHcoVXWpGLx1QW7zOTEpYL8EV
         /r4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125758; x=1790730558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tz6NKk6ALui7Z2B2Ol5dUKWciABAFYV+RUGiS1O4Xo4=;
        b=w6Bhs2JdKNXFiaEeLn+o375cSBi0iKBrqDpJf8bQLFfCIYRjXGfgMsB9V1ZOrxFWB0
         YbRwiLEUE1Dt0PLUVbEaa0/zWEZ57HKZebTjVFc4JOD6/iU/o2jBvNS/SWyVOJX8BlGl
         DvdJGK5qDl9b0P7Y9nq4f8ReIVHV7x4W2Xa9ytHoUFGjie9r98owHOXY7tVeKtfBED2w
         NQE9bKvFOFi/JukPlKp2O4GGY6w7ngiLTAT70JpryElkkIhLH6Ys2ZDyHdthCRE/AN9o
         VIXmkerdKGeTax4EI9Vfjtw8PxXdpfUG2Ivh/eQaVms+sTCbWjEfYxrIbUFNPUzwQ0lE
         aNqA==
X-Forwarded-Encrypted: i=1; AKwUvBwcA03unVGwR08+VuLxVVBgPISmYGjXmppNzsuEPvSmYTlbs+FGB580w/O4NMdBPCbr16DMeQ0Snrs4ZX4=@vger.kernel.org
X-Gm-Message-State: AFuF++n1TDJpOPqHogrpzdBMMQqda8J1b+pOKG1KiLBLplUX++0Uu20e
	6AzviMRfnLA6chyVTmuHTNZHa7DObFQGNiJU01Oz0BA4hTzCiZ0h3yCgVdWKe/Z2n+Yz4Qgzd5A
	4iCiz4+ZJUxTDe5z4yQ4bVfynvqXoFiP/0GBsoQnCs3tIcRgo6Y3B/+aT6DcriI+dSP0=
X-Gm-Gg: AYBFou1tnUqXR+LOtolDxy2OUvNt38GMNvJlOYn0XUdjzhTsowbbNFKxcZdVDhNoYyq
	Ztjv5Ru2IGHKRFoNa61LxlI41Tp9K2OgXNAS0QWM3YiTnUZ9iMU+gGEDYY1RiNEL7RYRztMVOmS
	Vnb5s+lh7Okn26mEZqI9MLVjxjtIVWXMGLy+aZWC9sLEfKHV+c6m7Ae6h3swSVvIL/sgY5rfUqp
	I5Hswu1J+cYTiTzq4jbQv5aey2iPNqHC7iPgzfl4wYzJPecWL4FwcbKioVQuffXpFSOq35JzcFN
	CAOfM/KG8DsYmzkAlWp3uL6gGpMARwszbch3s2n+DwtD3dMuP2Fxr8PMbvM/awrp/NHcopJ2KrX
	u89cUkvj3KUcAg0d+lVQCq7HfG7T6
X-Received: by 2002:a05:701b:4251:20b0:13b:3c3b:8dbb with SMTP id a92af1059eb24-144f92e1ee5mr1179680c88.23.1790125758295;
        Tue, 22 Sep 2026 18:09:18 -0700 (PDT)
X-Received: by 2002:a05:701b:4251:20b0:13b:3c3b:8dbb with SMTP id a92af1059eb24-144f92e1ee5mr1179627c88.23.1790125757807;
        Tue, 22 Sep 2026 18:09:17 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:09:17 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:34 +0530
Subject: [PATCH RFC net-next 8/9] net: stmmac: qcom-ethqos: support
 external PCS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-8-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=1930;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=LAj5wFs1I2UH5hJ13rqJNCQ7NMV5AqqbqBxmaYQgJ7Y=;
 b=S7vtbiqiefxlbFM0z0Jl/fHy99gKVoxAVcyz1bdUtdY3C1YPU2yxhMAQjFEusHLu3GKoZtzIy
 MqIesOTniX+Do4jykMzcZtwr1jEv2oipCUGo7KR+yeCQsri9K378CaB
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab326bf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yWFGLV7Fs-RTi3Yw6F4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ujcp6MMMuv_Dk_bLFQSKW_NMmYAAorK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX0nGPl2HAc9dS
 ZRsql9PX5noRil9oW/WQTiPwyzq80ywI8NHIhQ1HUXtZfH3DzKyDLfVLNHHGtXPMijhpxQ/C4AE
 A5RidlZvLsPsToKeTi+aMUXQgQ95wDDf/kG0tyftX0Jh5wkLjdeJE6mI18QH4e75BZIrsXT2G+b
 ZS03mdMn+oNKsatwrvtSvlBbRaqi5eQiw6XYe8tHKoD3dUR4TsqTlEZp+au6Vohi4mvyvdYH763
 DpwcaokDQ73q3uZ7Abx0MU9t5FugYsV84cenqA8Di/6JyaSCMT2FZKW+nDL8RYA8CkfbCk5FJWm
 2YQh95OL2rybrbbnk7yHTB69sUMQk1C91wpvGgFiw4Ug30jfi5z3tsKXfR/SVOgu78DEBecBuZX
 q8GLWfce4L+Yw+iIzA2Iz1QmMQubbR6ANo3k0EKfVtMSk8MEWsXZ38r0L1DcGrjciI15RtFdj2b
 YIzJu/eS/RB2l6pJ4Iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX0gLxcJJJjIOP
 kr2qD2VXD5oBHzxpRQaDwV+q3VEEPnSsBV42l0aTA/kgDuUSR5HtqBm/04l7A1Xhq+0Oymhz0hC
 SyWWNRGW6unwLXhfwdKcSD+9TO1X8mk=
X-Proofpoint-GUID: ujcp6MMMuv_Dk_bLFQSKW_NMmYAAorK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230004

Select the XPCS instance initialized by stmmac when firmware provides
a pcs-handle. Reject interfaces that are not supported by the selected
PCS.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..a99a78880c0fb7858e90b6212b37ebfc7fccaf84 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,8 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/property.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -681,6 +683,21 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static struct phylink_pcs *
+qcom_ethqos_select_pcs(struct stmmac_priv *priv, phy_interface_t interface)
+{
+	struct phylink_pcs *pcs;
+
+	if (!priv->hw->xpcs)
+		return ERR_PTR(-ENODEV);
+
+	pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
+	if (!test_bit(interface, pcs->supported_interfaces))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	return pcs;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -794,6 +811,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
 
+	if (fwnode_property_present(dev_fwnode(dev), "pcs-handle"))
+		plat_dat->select_pcs = qcom_ethqos_select_pcs;
+
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 

-- 
2.34.1

