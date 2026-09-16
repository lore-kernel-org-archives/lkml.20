Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA2C3E7179
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538673; cv=none; b=K5U9+ML+ZESgTJn0OWGgMqM+6ujYzL/SUQlcRmTfEwgSxRvLBg3OHZq+AToNiHEUoLQeKwToWOjPpNZgAB73NVhBTEe8Jk+qRUcKtUq4ZZtbgzG0opgDn8hpMFSgVVC1Rbsly/nvhkL15LVgiDWZzhcJRB7P8Bh0TvBHvDG+n/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538673; c=relaxed/simple;
	bh=h3fngNlkhZEZKpBHI/IT3xTrpcNvbLpoMF3Il2nEqag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIbV1juuYNzD9YN8i3tVojV3R+oeiT7SUGQmHAxQ8MtCeM9yeZSFLimEhRvCUMpFPNGyP3iWxwXf4QY5w5TXlRWsdtrw12DaOCt+zx8yB6f+S8tdnLESxzwROVdw6l0uo5oYBKnHC1/kz0Wodn5sYXh2m7v/w9NSUIMwPfPbal8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrPI/RNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=juH2/QT/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrPI/RNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="juH2/QT/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G5fsHq840552
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n0r6Emu7FRLhYCASNs/iFipri1GH8rilRHLo7RAxtZ8=; b=DrPI/RNFoz8blFdr
	n+qVvkqsS1VYEh86yIzRsJZN7puOVoylwY4abKOPUmLPKa9CU6MbVFp5ahT7yHZ0
	lhQoGgixHkqImskYdGE/boQbKB55ptXnX/YOlAjl+LIaY+HvdVBm35M7Q1Lel3OS
	GQweCfxlvt1JXobZKX21VO8bYceanAx4VuJVkwqtYiA3mtk5LqoMOfU6HRkSeO00
	rhR659cNQ4hZHaFvjfnt0j1e3BcRApaECoGDlY9C/YS/9M9jaPZYW6SnhI5Unx9O
	MCduoo3xrgpWs60zN7Hhfa2F3/ByPaSAm/neVHrXnn1KAmmKf2kBo4UShrWxrehq
	GBRR3A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdyw9n9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9057fab9eso83179675ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538669; x=1790143469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0r6Emu7FRLhYCASNs/iFipri1GH8rilRHLo7RAxtZ8=;
        b=juH2/QT/1Lj5wzXXF7CrbUYk7haW8sOV91Q/0gdx/TDrJE3CAzQEAdH09+kjSa8KWe
         AZCmZgHIYAPQtjJ9CrtvmWKYZASjhInCHPkV3PdI1BOW6wkrD/ws/0hUeyLv6jwa0CDu
         he1Hhi22osC+LUsiEHyHig8x9clV4W0DS1aaf84jAWSHN+iD6K4uyME7MrfbMn1li8ii
         h/ChG4mOchlDcOXjp0l3TrdWF3wpW9Lh6vhgFfdayS2MwTiW9WB/0+W2FCwLl3wmWqRE
         HJNsUUXim8cDGXCCSx1pDt7hahvdJbrbEeNSDV/o7EkwFlM6QB0ddwIiYU+trKMcY3ub
         /eQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538669; x=1790143469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n0r6Emu7FRLhYCASNs/iFipri1GH8rilRHLo7RAxtZ8=;
        b=Rv0Pa+W2JF6ilkm5TEvpSPw73sk9O9X4KW1739XbEggQE/66M2+H4YVZVZFpEfqvfu
         JdLfPAq967m4r/NngQ5Oqn+zIgGS+3lvYyGTkS4BgMZzvUGkSDFnsNwJYMpg1u+kx2en
         HlLUQ33k5sDuVTHQ56HnyJIiMjRuubjnjXco7wm9dj6wh+aW5mmQpRLTBTByJhxIAaaB
         7a+d1kWx2kp1eoQIhXKsTOa96ymNoGlzcKarw4ULwUfIln/QiA+QA2/wcXDEpH3QpRPD
         Gfv4WXPixfZjv1NuvhxBvOj0BqvIyFKdT52TZ7tzRYhidH66e/Yf6IV+Coz4itsYvr8P
         MovQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZ3ztf4Qj6h/gybMBns85xTxmFQFofqzoPwpw8Yg1yiQO5wH5NzeEUsVWw2knML5ntLdKLg67nE15+btU=@vger.kernel.org
X-Gm-Message-State: AFuF++kbZDo48vxyLVSRymyUeX7NKHdPD2P6i8f3WmXm8yfqcsfoi65o
	bbr1LoR9rD70zOB+D+duCpWrFeSDYqbomJUEbAid2Qv1J67BzSmbEN/WrqNtSHKWNtWAOOtKAzv
	QCnmEUcYBTcG7/wEBjH/PK8F9TRTZN41hagKwcQplOgO4/Ve1vHcirn/nafL6LZdp1RI=
X-Gm-Gg: AYBFou2o2NnV1glYJCc/3oK5sEYsefY3g67mRj5gZ57xCd0VyL2pgtQVabD+Q9MJwR3
	E4siihas0cb1Onud9U3t2zt5XNNg3lMJ6SLiuf9btbwMzjnPs/TzLsPWYaizGU4pW/fY04cc3ed
	0RrRK5XJBuTUx199ltOGvNqmnJp7xrKm0ZtcG9e7bvivVChEqeJfULqXbVeuBs6aVpmachxu1Xk
	PfNsBmGw/i9O7JPTu5HJ3b93qFBNAnD8hHRqzcOgog8ummD9eQpFIkp6tp47jv3G4FAQ2zhTW2D
	hxmceFuu6a3zhXCb3S8Bq5i8hWfL2cCPowTwmfwEMZ/n6m+lQj7oTP1dqSJm6fUuetJIOqRpxPL
	87367jhX9+IzC7kzkyq8WkU+iSEDAdRxOKh4N1sWHvn7z1v4=
X-Received: by 2002:a17:903:2452:b0:2da:f7ad:cfea with SMTP id d9443c01a7336-2dd8df0a71emr27125075ad.8.1789538668402;
        Tue, 15 Sep 2026 23:04:28 -0700 (PDT)
X-Received: by 2002:a17:903:2452:b0:2da:f7ad:cfea with SMTP id d9443c01a7336-2dd8df0a71emr27124325ad.8.1789538667935;
        Tue, 15 Sep 2026 23:04:27 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm4740083eec.2.2026.09.15.23.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:27 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 23:04:22 -0700
Subject: [PATCH 2/4] PCI: qcom-ep: Move PHY init and drive PHY reset to
 align with HPG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-align_pcie_init_sequence_0916-v1-2-0b2195836f30@oss.qualcomm.com>
References: <20260915-align_pcie_init_sequence_0916-v1-0-0b2195836f30@oss.qualcomm.com>
In-Reply-To: <20260915-align_pcie_init_sequence_0916-v1-0-0b2195836f30@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789538665; l=3449;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=h3fngNlkhZEZKpBHI/IT3xTrpcNvbLpoMF3Il2nEqag=;
 b=eTZfXLMDSIpr2rD0kW+QmRWdp9HNs5rYFTSCCvbAdhqFxpkC15bmD+pT/64Xq3BBABZm7nE6r
 kif1GcsJYCKBDLi+hJrEpTvhL5VVFDqdA8qCq0ZLA5sRh1Fa7EGYA62
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: Px_a6gCIHuHsTR3dbLxGBreubWBg-kOa
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa316d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PV8ZVrNDrE42_2bsUUYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX+7xAESnFx2nP
 TAQldDS4XSck+MS7FKnT9+ZBq20pr+voZKjdjlie4QD4DarhqQQjVN8zzC2o8ZcXrh05OcmCv4F
 3f35+QbGHV7iYRNbjZs0GuubUflfYUXyC40ojua6AbXlLGb/PuKbko9LtKvvBfDg4ZrKqxbErnc
 0t+5H/WVUeXho21CFm2qSNTnotjPCZJaSrwTBKYGgf5N2fzIg3OXayM3dMQtjhIiRX2p4R99B3U
 LGoTxaoTZPR3Hgp2AqWZsj8ajBZk7A8hHBDf9XvYQibk1cwYqqDtywJIozQj+lN6ncSG/BkFJny
 2hzffC2IGpFRdr65Mw/tJA9om1g97Lnx3CdJ9CR6gtrxz7I+/TFohKgJwIf0B97pbmCWq2jYiu9
 tvv9n+wy1b72Xi5tRG8g4fr7lKKCd2yT6oBXYKNFs7SO778HLZdUtfEOzVusb2IOxzz0Ws+HUax
 kCp2O2C4RlqSBQ9bYcg==
X-Proofpoint-ORIG-GUID: Px_a6gCIHuHsTR3dbLxGBreubWBg-kOa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX9zi7UsZKl4fe
 SThm4Z/rDHCeRQtZwrdPcrEQqkBpeNmHGrBMDPO8Rq8HwcA/zh7Ruef+TvmRiGdBE9u9nvH+wUm
 4IdnGzZxq6vh/Y5Zz7iUWMQNRp32CcQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160076

HPG requires the GDSC to be powered up and all PHY/controller clocks
enabled before the controller's core reset and the PHY's reset are toggled
together as one atomic group, with PARF_DEVICE_TYPE set right after that
reset group, same as the RC-mode change.

Move phy_init() ahead of the controller's own clock enable, and fold
phy_reset() into the core reset assert/deassert. phy_power_on() keeps
running afterwards. Also move the PARF_DEVICE_TYPE write out of
qcom_pcie_perst_deassert() to right after the reset group, in
qcom_pcie_enable_resources().

phy_reset() and phy_init are currently a no-op against the PHY this driver
uses, so the init sequence doesn't change yet; it actually changes once
the PHY driver later implements .reset.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 8364696a1b98..cd7725d277c5 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -228,7 +228,7 @@ struct qcom_pcie_ep {
 	int perst_irq;
 };
 
-static int qcom_pcie_ep_core_reset(struct qcom_pcie_ep *pcie_ep)
+static int qcom_pcie_ep_phy_core_reset(struct qcom_pcie_ep *pcie_ep)
 {
 	struct dw_pcie *pci = &pcie_ep->pci;
 	struct device *dev = pci->dev;
@@ -242,6 +242,12 @@ static int qcom_pcie_ep_core_reset(struct qcom_pcie_ep *pcie_ep)
 
 	usleep_range(CORE_RESET_TIME_US_MIN, CORE_RESET_TIME_US_MAX);
 
+	ret = phy_reset(pcie_ep->phy);
+	if (ret) {
+		dev_err(dev, "Cannot reset phy\n");
+		return ret;
+	}
+
 	ret = reset_control_deassert(pcie_ep->core_reset);
 	if (ret) {
 		dev_err(dev, "Cannot de-assert core reset\n");
@@ -332,25 +338,25 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 	struct dw_pcie *pci = &pcie_ep->pci;
 	int ret;
 
-	ret = clk_bulk_prepare_enable(pcie_ep->num_clks, pcie_ep->clks);
+	ret = phy_init(pcie_ep->phy);
 	if (ret)
 		return ret;
 
-	ret = qcom_pcie_ep_core_reset(pcie_ep);
+	ret = clk_bulk_prepare_enable(pcie_ep->num_clks, pcie_ep->clks);
 	if (ret)
-		goto err_disable_clk;
+		goto err_phy_exit;
 
-	ret = phy_init(pcie_ep->phy);
+	ret = qcom_pcie_ep_phy_core_reset(pcie_ep);
 	if (ret)
 		goto err_disable_clk;
 
 	ret = phy_set_mode_ext(pcie_ep->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_EP);
 	if (ret)
-		goto err_phy_exit;
+		goto err_disable_clk;
 
 	ret = phy_power_on(pcie_ep->phy);
 	if (ret)
-		goto err_phy_exit;
+		goto err_disable_clk;
 
 	/*
 	 * Some Qualcomm platforms require interconnect bandwidth constraints
@@ -370,10 +376,10 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 
 err_phy_off:
 	phy_power_off(pcie_ep->phy);
-err_phy_exit:
-	phy_exit(pcie_ep->phy);
 err_disable_clk:
 	clk_bulk_disable_unprepare(pcie_ep->num_clks, pcie_ep->clks);
+err_phy_exit:
+	phy_exit(pcie_ep->phy);
 
 	return ret;
 }
@@ -390,8 +396,8 @@ static void qcom_pcie_disable_resources(struct qcom_pcie_ep *pcie_ep)
 
 	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 	phy_power_off(pcie_ep->phy);
-	phy_exit(pcie_ep->phy);
 	clk_bulk_disable_unprepare(pcie_ep->num_clks, pcie_ep->clks);
+	phy_exit(pcie_ep->phy);
 }
 
 static int qcom_pcie_perst_deassert(struct dw_pcie *pci)

-- 
2.34.1

