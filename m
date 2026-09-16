Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460C3E835E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538675; cv=none; b=bT+UtLVDWKyWMO0RP3co3uSAccPEUC8tghGSvhDZTcVUhOCuWrrnnhi6NiDwFJKetHShQwUofBl5s25642fSN0mDbVBxUKp0/O0zGa11N+bJukqcrxZW6NQm974MdOQsGyHMDYZ1LcUE3M5phpHYwiuJ8G2I6czBJOpfguSY2D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538675; c=relaxed/simple;
	bh=oM8i478j1OWwIT/sT0R2uSb9t/Wu6UrKojtfSKPkClw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmZHuyaG04vLm+q+s/SqTRK99gXBnuzSpgANxZgpbfryq9ZsjF/hjDLdqKyVMffbXNTchUf16OZ/0m0i3xBUygx8ZffNyVujuW7bO5uqAsl5rdKN3izBThi6cpU6eM6UMItn+zYw5TGlcTFsroP2idMOeCAXGEiPd0gXeNL1m7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IVayCzhL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPDNG94d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IVayCzhL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPDNG94d"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FNZDea1408510
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XY3M+7fTuLzqhreoJ5hF4hQOsJbMa/cuVlDQ6WwZkes=; b=IVayCzhLMExSvfNh
	pM/pSfl/wEDi5qmwQiqJnkZx8JkmdwNUNxPxhKHufnW4YMGfYK4rjQVJUUkAzZp0
	NRZPT/5gFs+EcNzFH5bfEMAxhga+4/2VdJHDGs0CpfHil+xKtS1h5qqgzb4+0R8B
	YSd+AygujZ9P3Jiy4mUfo9PNkba/608cIiLY/K929c1lgQRXp6QezHwZYlpzvioC
	zkgqOuPGqflL69xGzeC0Ki+umq5RMEwl8uD74cnG9l21E9zyEUe3EJ71UDGpDU0j
	ccDlE5nYaGa24S5D2w2uxPsbRKc1sr/FKdjSjlol8pSKa6Xy7/lKZ4o/Vi2zkuI9
	jVEbSg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftuh70w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so9331534a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538669; x=1790143469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XY3M+7fTuLzqhreoJ5hF4hQOsJbMa/cuVlDQ6WwZkes=;
        b=bPDNG94dRdeO8YQYFG+ef4g3FUN76RrVj9L5sOQQoaFZm/df7i90uxIAxiWlydxYT8
         pv51e1DFblihGSTDzboak3h+V8xsSxu3Rz7G+Z3djsKC1vu5XfYT+84WbLzQEWdD+HQr
         DCvmp4srPIWDVbMN7IECFIlU+QP76GeklQoUKk3ZtVm5R+tVaBBCm0nIfxTgTl40Txct
         opQBzBRBmnhAcOTWfHiHxnQif/GKRnyLj9+blJHxWp/g2YJx4xd/Xt77X7PiBgox0Bvd
         HV2IvfUxQXP2H+2jNUdPraaZAHF37Qzm9MUc1p4Z/z5rRDR1QT+OcehyLHmapCkwA/Zz
         cJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538669; x=1790143469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XY3M+7fTuLzqhreoJ5hF4hQOsJbMa/cuVlDQ6WwZkes=;
        b=e8XmPzunw/G7tgXRBrhux8lchrgdbW1mY+qG/RoqA+JD1pUifSv+yib4o4kSpio1JO
         EOATL1Z6cYotcGV2wLjIj8SbXHLEFocJhOaexkwGHfta0F8Toty0m+RK19yXCS3Alvq1
         8x4stip9akNx41H3eH4cXxGHdrCLZmyGztFt9eDIbDEjmUUhbnxbwa6pTOFCJXLfXtLn
         JGnYKWEXn11isxOASG17Rn9mReXdKhm+ZlYDd/K/YP42m1xwk6z3vkCc1H5rVPbQ/s6N
         JO3Ebe/+DHyhX/YqsYmXY9b+aarUjsnZiqHpD8Zbf5plP86u01vM4O0dSQfLW5MgHmeO
         mLSQ==
X-Forwarded-Encrypted: i=1; AKwUvByOOrBsoOZIfCNWukhhub0O3JePBn97BNWScSfJYDGFS26tptieHjwUMlD7s7+deNjYH50ojXBXmCVfd/o=@vger.kernel.org
X-Gm-Message-State: AFuF++kC24Dj1mjk1zQfmOHrSB74m09cpM5DS0/wSmQCUQETRHoZLVUx
	AXAjDQdiSjqP1CuNjozXZwxlHdoc71xrI1cyPa+mKlknGrELqC4Sd5PpZD9hH2cGGgbovspnsmQ
	UoxL4PpINftoA/ngZhpVG6/3lVxcFgYB4Q+UNPGxhPBya+KGcSE0oKXau1QED/THeOic=
X-Gm-Gg: AYBFou27yYyH3JHLWVkELoNzv+4KiP10Oz+o/m739m6xSLh6NA3yDfGGfcZ53D+bmLU
	VSMyFIbTnos6u5aSkHVW/Otkr2Ti+5oNKmg4f97amRVoRqTXIXY1KCi0hQXFd3V2dTdSPXQqOax
	mkeTcilSA+J+VD3U+L8Vsgtqkz358uzGYzTkA4V8BnlZWzGoVAJgyo1MAOm6YHrYM/CXOxjD5yU
	HLyvsCkrECvJxQnrYbzmnh6ygSwM2hxp2f9dIFsAoghftJEYWqjGV6v90yBXWRMF/+2Y9j5BxVL
	Z+HxhNhWX/Kcc+ZV239+/UMmMltT3gfjm/KKloCvtoqlpd8bE+rl57X+xaqq58U4wzaDQH2i6Lo
	d7p+YXEB7+v/LK0Nyjk7lYfauH8lujKCl3XbmkE08dTfETc4=
X-Received: by 2002:a17:90b:5386:b0:39b:3510:49e7 with SMTP id 98e67ed59e1d1-39e1df52290mr3822852a91.0.1789538669411;
        Tue, 15 Sep 2026 23:04:29 -0700 (PDT)
X-Received: by 2002:a17:90b:5386:b0:39b:3510:49e7 with SMTP id 98e67ed59e1d1-39e1df52290mr3822765a91.0.1789538668901;
        Tue, 15 Sep 2026 23:04:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm4740083eec.2.2026.09.15.23.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:28 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 23:04:23 -0700
Subject: [PATCH 3/4] phy: qcom-qmp-pcie-multiphy: Split phy_ops into
 init/exit/reset/power_on
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-align_pcie_init_sequence_0916-v1-3-0b2195836f30@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789538665; l=4963;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=oM8i478j1OWwIT/sT0R2uSb9t/Wu6UrKojtfSKPkClw=;
 b=K3Ucl9GhBeVKrJwKb/jxQIrJgF99z4xyiY7o08rGAc4Yz7eKFqtMkOhiYOb9hmirl2JCM/Igf
 NZD1Q1ASxp7DTFmXsNE58iajIR88EvSfT7IuYe9ZEEng1DiGOTJsb3U
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX7WKQd5HxnP9P
 v9Xy+wAdTCOuMA2PbpILv9TQ2oeeZJw5A2YuJQe0lDCqSeAgM52tHhFqh3cYL9DI+KJV1aa19sI
 gMnwvOkXmVXXNctiw7hQN5QRy4QjwQvHgab41fcUP6TCvSRZ8T8EQU7yKs+coUSUwYb7mOnbATA
 cyS5an2TfhUCOp02eVHlD8hvLHRi8lcyblVjA0piazCxSOIcW6/kt0KVm9C9fdfdt4vm1N1Hwqu
 O+0upgwBc0gwmrQ0bJ+TbwvOnirZMi8d1Y11VEnG3xBlsFk/buTi4jS+zt819pD66J8xWDBaxps
 nrPOKCUzl4rL5kAqU8VWx5rJafNozoMg7LcZxtdpjySHxyHnV3V5aO+hSzqM1YTiTaSlg+kv0cj
 Sp88JLP6styC/lqOfgpgkBz9qzhB5QfGRWBkIu5FA+vJRtotTwKRcDmmmjPE0VSMP1owEGNxkIP
 JWxTS2xBcEbOy6/y3QQ==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa316e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yU77vfN-gRUBXX0kDPsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX6537iMnQ0HdS
 2AHK8qrFw5El+p9Y7u/OH+4j5OkKHAlZUind2an5RSw5FZCqNitvbVZjRJ+DDHDq0XCrZwS/VqY
 9R89Rbg8Rx5TTNFReUA2ZVmy4+qgr64=
X-Proofpoint-GUID: ESzmBcrm35u6PtkFUlxLn_I9gSzDXen9
X-Proofpoint-ORIG-GUID: ESzmBcrm35u6PtkFUlxLn_I9gSzDXen9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160076

Per HPG, the controller now calls phy_init() from
qcom_pcie_host_init() and phy_reset() from inside its own core reset
assert/deassert. Making that actually happen here needs phy_ops::init
and phy_ops::reset implemented, and phy_ops::power_on adjusted to
match. Split the combined phy_ops::power_on/power_off into
phy_ops::init/exit/reset/power_on to do that.

phy_ops::init enables power domains, regulators, and all PHY clocks
(pipe clock first). phy_ops::reset does the no-CSR reset assert/
delay/deassert/delay. phy_ops::power_on is left with just the PCS
status poll. phy_ops::exit mirrors phy_ops::init in reverse;
phy_ops::power_off is dropped since nothing remains for it to do.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 94 +++++++++--------------
 1 file changed, 35 insertions(+), 59 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
index e93cba4369fb..aa7130efca45 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
@@ -280,20 +280,18 @@ static int qmp_pcie_init(struct phy *phy)
 		goto err_pd_power_off;
 	}
 
-	ret = reset_control_bulk_assert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
-	if (ret) {
-		dev_err(qmp->dev, "no-csr reset assert failed: %d\n", ret);
+	ret = clk_bulk_prepare_enable(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
+	if (ret)
 		goto err_disable_regulators;
-	}
-
-	usleep_range(200, 300);
 
 	ret = clk_bulk_prepare_enable(qmp->cfg->num_clks, qmp->clks);
 	if (ret)
-		goto err_disable_regulators;
+		goto err_disable_pipe_clks;
 
 	return 0;
 
+err_disable_pipe_clks:
+	clk_bulk_disable_unprepare(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 err_pd_power_off:
@@ -310,31 +308,47 @@ static int qmp_pcie_exit(struct phy *phy)
 	reset_control_bulk_assert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
 
 	clk_bulk_disable_unprepare(qmp->cfg->num_clks, qmp->clks);
+	clk_bulk_disable_unprepare(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 	qmp_pcie_pd_power_off(qmp);
 
 	return 0;
 }
 
-static int qmp_pcie_power_on(struct phy *phy)
+static int qmp_pcie_reset(struct phy *phy)
 {
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	const struct qmp_pcie_offsets *offs = cfg->offsets;
-	void __iomem *status;
-	unsigned int val;
-	int i, ret;
+	int ret;
 
-	ret = clk_bulk_prepare_enable(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
-	if (ret)
+	ret = reset_control_bulk_assert(cfg->num_nocsr_resets, qmp->nocsr_resets);
+	if (ret) {
+		dev_err(qmp->dev, "no-csr reset assert failed: %d\n", ret);
 		return ret;
+	}
 
-	ret = reset_control_bulk_deassert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
+	udelay(5);
+
+	ret = reset_control_bulk_deassert(cfg->num_nocsr_resets, qmp->nocsr_resets);
 	if (ret) {
 		dev_err(qmp->dev, "no-csr reset deassert failed: %d\n", ret);
-		goto err_disable_pipe_clk;
+		return ret;
 	}
 
+	udelay(5);
+
+	return 0;
+}
+
+static int qmp_pcie_power_on(struct phy *phy)
+{
+	struct qmp_pcie *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_pcie_offsets *offs = cfg->offsets;
+	void __iomem *status;
+	unsigned int val;
+	int i, ret;
+
 	for (i = 0; i < cfg->num_regs; i++) {
 		status = qmp->base[i] + offs->pcs + cfg->regs[QPHY_PCS_STATUS];
 		ret = readl_poll_timeout(status, val, !(val & cfg->phy_status), 200,
@@ -342,56 +356,18 @@ static int qmp_pcie_power_on(struct phy *phy)
 		if (ret) {
 			dev_err(qmp->dev, "PHY power on timed-out (%s): %d\n",
 				cfg->reg_names[i], ret);
-			goto err_disable_pipe_clk;
+			return ret;
 		}
 	}
 
 	return 0;
-
-err_disable_pipe_clk:
-	clk_bulk_disable_unprepare(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
-
-	return ret;
-}
-
-static int qmp_pcie_power_off(struct phy *phy)
-{
-	struct qmp_pcie *qmp = phy_get_drvdata(phy);
-
-	clk_bulk_disable_unprepare(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
-
-	return 0;
-}
-
-static int qmp_pcie_enable(struct phy *phy)
-{
-	int ret;
-
-	ret = qmp_pcie_init(phy);
-	if (ret)
-		return ret;
-
-	ret = qmp_pcie_power_on(phy);
-	if (ret)
-		qmp_pcie_exit(phy);
-
-	return ret;
-}
-
-static int qmp_pcie_disable(struct phy *phy)
-{
-	int ret;
-
-	ret = qmp_pcie_power_off(phy);
-	if (ret)
-		return ret;
-
-	return qmp_pcie_exit(phy);
 }
 
 static const struct phy_ops qmp_pcie_phy_ops = {
-	.power_on	= qmp_pcie_enable,
-	.power_off	= qmp_pcie_disable,
+	.init		= qmp_pcie_init,
+	.exit		= qmp_pcie_exit,
+	.power_on	= qmp_pcie_power_on,
+	.reset		= qmp_pcie_reset,
 	.owner		= THIS_MODULE,
 };
 

-- 
2.34.1

