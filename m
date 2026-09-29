Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2114052C2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661653; cv=none; b=gu2UZigXGQAWWY6crbY5FNdHAV8Mjhgi88fj9xQQRpLS0ovE7H+Dbi0bMxM5qpCvHXa1SU7f8p0bBUSQ+eyUX4CbQ4h7zfUX0FOowso5E22JZ1ckb0ixirCRjZM/3cb1wRr1X2FQnFhKRqyY7vjpVlQelf8hAiD2JmnVCwO7xvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661653; c=relaxed/simple;
	bh=k7+wjSAGjpR22f7rKksM9nAh3MeACrWaJ5KFpnnayHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWGlBXiNdwqFTJMSf4IsXkzvOjRNZPcisXArHS/JgCn53w8xarcYGOocEW3piALf2sYsLmkyiTZdPlVzf3VW2zEcGu7go63HY2dHfSK5NIckQM1ivEa6WxErTdjmkssp2cfRmd2yjx93ws5PFI3kw2UG+wQG93+vk5IIbSgSFQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uxk0dx/3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJ/y8ARq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uxk0dx/3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJ/y8ARq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T475Pa3390852
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=; b=Uxk0dx/3RKpivDjQ
	LfQ/jjnmplCoxQ8ikD8gZD/URWqCmvOuRVJOTMEwn2XsP6EY5v+YPl/vCDwYVy26
	bNtfTzYPwgeVa06CyX6+WvAkPWd6pbD/kGvwT8h4MPUt5uA+/nNRq1atzVnmRW7e
	3O+DkKYkcX7wnMuJAvFYsAyk2OXUkUz1yG5oaz6exLJVPQIv/Ax613xEQ+Ntg792
	iJNX3/TNZSDDokzNFfOKzK7jKsHs62IcmLBargHePrDccAfVAeee0lHGRRWtrCAv
	tVGNMYJnZBosugoNk4gwnvJaz+2j6F3Yt95aPAqNbv1+Eih+VaFSJWvALDEOO08X
	kRv/ww==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkh6k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e3f521346so4165752a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661649; x=1791266449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=XJ/y8ARqAWdWg19brfd2DXnMteLsXKmeHk5xhCBhLVOo1UapwYj+cEtPfPWZX9Kpad
         1V0yoz/CJKKoqwSrLtMUNi5DAOytKM3dAyRLZAgGEsu5lmPCGmzoni8wKOFzggJAXQOe
         jsoCopFEaX+bkf5WZ4bP7gEPqFGulrSf+2Z4gXVzkgfbrbYcleOtd7bW/wLwHsZqxK5y
         iizI0Dy/85EsyZ8xre7/Mr2olBXuMUhEDq63OAxRrW5ToDK6C2N+DljFt1dUTJSlT06B
         B2XUWHXOY8/3DEYsoE7aCcPhn0BNd1eOXuVlwnAjXyHD/lte3UAS6QxCuPbLjMVEZ566
         Fm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661649; x=1791266449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=wCQ8d9kUbVMNZSDBBHhmPMus8yTP8fpVomm6m/2FsLtLnxPMtGKOkRBxQ56xJNoT4z
         OirpLgZEAjXW0i8b9bYy0pR2f9TCMJ9aFYwbjWQUDhiStmDkTQ95yeQp/0GFNis4OcpB
         RkW2Pj6nVwd3/tbEJeq+v1jSo71RX5YP0tcNqdJfpwucHNHdfro+CyePa4EfVVWqZokc
         YUFlaVr4JXmCtfPRZIEt7B3NBPp9tI/Kl8PD6Gs+mbzgMnglkGBYiLD8bvxF1xT00YIh
         3u5NrewR9kIpeHgl8nbwZSbfT3UHZfzRZFwEtHUT5elW0S2IUu8RzO7ZnmgdaYsdwBU7
         hXbw==
X-Forwarded-Encrypted: i=1; AKwUvBy5XxpOInZxvOS1P6X0r3Jo16/TTgbgSqp3nL99yu1qGHzEzXHTncmUjb5PRQvbs+kbnAgA9lyrKnMdHgg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmevQkzHAspPDF3/MT9p6kG/F9zLKX9rULWCw6Bo5YOdsXCK4H
	0GG7XMTRYvo9rHclwpFeu+J76l/o8ZZk9Jxwq8EUyJQwLHl8Ep0SFa+mU0aywZMXrmNP7xfHFvA
	dC1iz6tfmaVBXryqEhHvHhl5ywQBshecjoULygkVxj5jw+BO9GS7bBzdVcnQwifc/JFI=
X-Gm-Gg: AYBFou0oTCe3wYxSN7D1zBrv/d0bBx+holsJ8V4PfHk4SiNGpMwxnHN34CgWl+cMx/N
	7PxTzBzqn42dT6EaYQghA3q8HDXpPjljX7fIDwVrp6W+5iNG24G+DbaLz4F6Bag4eon4aO37SoB
	s/fNwaqfv0Z4maDk31ZStPoBCEzqPBZDpX0agjcNVCOgL4mrf62/LznKru0KCVfdqdAYzRD/RIv
	c0UJMW7041dQazon5+XTH7eQw2wGTRmf/dk91XbX7f48iPELG4xSmdzHAZNTbwnYS43xZ9o9BRb
	2+ss3onWNOUGyPZ0PbQ4wV9ZRDm//Q0j0g8ZUKzD4FBn07KJzUAO7qLcu7gIWu87uJBYjMG32So
	A8+1NdqHP/tLJeZ4ASrUNTBMRz3sB2aRS/yXGwP6gk9CN7kltJYcrh8QPS7yTpgRnAj44BkOyDT
	oXxQ0u9wOoQ2GmgQ8N7vNW
X-Received: by 2002:a17:90b:4c81:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3a46e84ea15mr3549964a91.5.1790661648840;
        Mon, 28 Sep 2026 23:00:48 -0700 (PDT)
X-Received: by 2002:a17:90b:4c81:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3a46e84ea15mr3549938a91.5.1790661648271;
        Mon, 28 Sep 2026 23:00:48 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:47 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:30 -0700
Subject: [PATCH v17 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-4-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfXypUNq1vLRnDw
 TADO4j30Tsj0X+8u+cnKUQCVHyXQ3HWnDiYSFgAq7PKMRDwceR1NjKbSq2xMa00UlcWWyibofTy
 4ulGq7osNZB2Ex0RqFgbC9wa6jUIkM4M9r+kTUMhCYs1/TA6WJqHudr9C853GmcVdHQDFrh4yZ1
 Dc+Bj8fOqBlUTIbs0a402fUQOMySu7VUDHQXt/4vriDKd3lt97W8ZvdhJqcgEEsKyRwIaEaM+YI
 tILggdAWJPmfDOQ/ROFqShJDfApRDzrVjE1osYzO2oyKKO297elBj9cn6Pk+pMYV2o+ObChtTNW
 oZTpvpdDzBmcjkiV4BAcpeoN2pwNOvW/kIyHsjE+/DMLqVPXFwfIZnw3fAjfu8gu25rLTG4+ERp
 j9AXeRxo1LzePm1IXBZEJKjRFrhjivrvQ+6/ONdi6Krqr1VRlUF3EuZyyO9E9tD/dbrb/JGUMyc
 RVcHyqUopwpRxNAMwqA==
X-Proofpoint-GUID: EVrOUKZ-NWWYyGLd0s03PIbwsi5gu-a8
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb5412 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: EVrOUKZ-NWWYyGLd0s03PIbwsi5gu-a8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfXw7ML9aUwOFB9
 cl8GpNDwXUAN3571Jzr1U4cxCGxOjj1QZBLBvjbG3D7djv9awcUGPIc/aLj5IGnsS/W4pZP/ebZ
 7eLSJN3D+DIISLrhjykdbPZv6MOw3OU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290023

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1

