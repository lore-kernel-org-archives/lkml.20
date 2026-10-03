Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B23B19BA
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018163; cv=none; b=rvx/6Awp1md4Bx+ef41KsxTidF/168BP3nC6uIzkUdy7ux2yI3hxjBpjL/UkY1Mx0+G80rRfh2mkPya700Lxdr/Urz8aBGkC1LU/UU8e/CfhKXoah/Sd6yU3CYvzfLSeb5Ch9ATqod7q1LNgSQAbt4Jl4XoFzFXDr85jgspd4IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018163; c=relaxed/simple;
	bh=oKQBHHUfu95xHrm500jCHKBQrrdmNJX1Cnvn46Btibw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmmmwD/etAhdk552xL/skuSusnvmUi33+UUktByZSGy7naBjOOscjD7xSFdJ6UQ831UuI0p50EjOY5IVAl9bmAR3i4SJnJbyzPLd8HIUNtDJjPkTVMWGq9qydCEKRQtJ9msmMpNsEwhlat8CBsO8cF0mIffLsnZ9jFvolNXQAbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awRiZbPG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hj5U9afO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awRiZbPG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hj5U9afO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933Yp9F3416281
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 09:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yIPcK6LnB5fcCUY4Eynm+yZ5cpoKNOUDReSkaF3WFRE=; b=awRiZbPGsumCDjWX
	NRvxJ2dQCMWGVFBBhm1Isiv68O3VvPACb34qLyZO1nItsKocp/+7cNr+SQ89EW6G
	m9ZmV6nIAt8of7b+EZnmLt+znuloJI298dhPJtLbaMQPHdgft2Q+FQg6uFuYGh8g
	3SWQ3omA7Wt2ehLzFSJ5ZHC7gv+xY4XpK0Pwai82bHtDhMFWHeT28rrfmE/Wxiqq
	BmFOyi8fnNQoKqnOxmTm6hqIQvkOmA84K+Kth+ek+PbKHPaDYAvR5+m3AvQKDzhh
	lBBybrxNcvb4flBC7+m3PeqD8LeRt2EwpA0sAyH/87vTj8/lfCFfCa9d6OVvuDq1
	Ay/p1A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sx30gjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:02:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef0362d95so731470eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018157; x=1791622957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIPcK6LnB5fcCUY4Eynm+yZ5cpoKNOUDReSkaF3WFRE=;
        b=hj5U9afO1m329Dw2b0a00femiqSaRKzNxckYmZ5UXGNmqQz6sVQpNYBDanlXWEqCTr
         MYzJ3FoJkF4um7O01g0XJVj1AQeMhdLHGEqirVApo9UyNCQLJrHweJHEWLb7AemLlCYT
         R3lTUSIjxjh/9bzyjfAxWc7k5Q13Ckc6DsAAt/TanpKHPjeg4XYBk3vBCzmc0IziPeeA
         g+GW0wzJhz8AUL3FPHQlD1MYz3T6vkW6YohBLlLjQFRJ/lZ9Q4m3GsllVmJ6nhU0/fYp
         +4uJ5xxDMuayLWEOuy/fn9bo93FcOzoE7i1ntmpxhp8XG2fmOmcUFSgeMpXLxmmUmkJ1
         2GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018157; x=1791622957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIPcK6LnB5fcCUY4Eynm+yZ5cpoKNOUDReSkaF3WFRE=;
        b=kpp+kt1BwS7Md7oVRph0fLDG2M56UtL9VdwRbxshxdX/lbPzW94J1zBL30Kzsl++nS
         UaNtMBWhxSOlSD7XyMw/rit5Dj+RketY+Scm6V8CgtT5V6I2aaaoKtyQbWHHEmcTY7er
         Wv8E3z07pc3Z8Il5SeuoiKwm1LaYo+lsUwrQ7P4EbRkijM0rw6sU93PMEXMAJ2saXK0t
         5lkQBv4RoQaHCk4mwZnPHetwA3zhtp5exo5+MynYBJ4lGXQthG0/K5Nt3ZsLzsZykWpC
         L9ier/mu+Bw1CQLmE9hLlydv2owr8XMJygMGykeNE8ufqEnf3u3nd+tQoGJ78BJmCRly
         jxQw==
X-Forwarded-Encrypted: i=1; AKwUvBxUCmicXMCnobBh6DDYsyvetc6rsmcSPVrwS057PoCE1OLeW25mROeABAhWDYg6YJ2YR1+BIUknyVJGr9M=@vger.kernel.org
X-Gm-Message-State: AFuF++mIIOBVX3tvG52ucn6L41XUQP/gMvxlFUwUuFfZKo5K0Sw5M/kV
	XaL4ftqujK2wV5viG7SolnlPNSwHl06GzIZbin+2Lvhg7g7HYojo1pzFBux3CHPsEXLnB4Cy2ts
	zB939Vy0rKf57qK6R60FIwhCnPB0ndNrmqAz4DAqvd/xZXh4507BRtU9QPeWGgRwXd/Q=
X-Gm-Gg: AYBFou1YXWe+A2T9x7b4Hsg9s3G1XiXHs2qAmXtM5yGX3rKMJ8t00oMkc3LXkQrIf/x
	WvTq+ASVj7XIJKhdeVRye9/kwdTu0YmCwbyTxK41NRADaCuHSiieTVXxb3iYyQMArzwRUkcmS1a
	SXXYK2YK4VbG6vvmzUjX6s5xzHsMWYYM/XFpEjJdRimyXRC9OOpsOjqHC8Wsehqcj5MYFsjsBQS
	gdCNyPQ32PTHJLl9Gpos7Cc/VFbQ36skYuQ2TfvGmPYO4hB9Z0t7x1VMCSJDCMU0QqX6BB4hoS5
	5DNsfUvHoKWeX1BiwhsI9PzArKpdQnNzWmAZqhNut34I+BrE+brjYTt/MszOA7eJGEHw5ybwqrA
	5RjRcVCXY4CQOHGtzTR3wzd40Lsx6BMZq2h1gF8zGOeZNJkActDPqwcnVdJJ66LrkdXPDt1lyf/
	giTiDiENanoA==
X-Received: by 2002:a05:7301:1443:b0:351:1d75:dd34 with SMTP id 5a478bee46e88-3511d75dfe2mr52502eec.5.1791018157243;
        Sat, 03 Oct 2026 02:02:37 -0700 (PDT)
X-Received: by 2002:a05:7301:1443:b0:351:1d75:dd34 with SMTP id 5a478bee46e88-3511d75dfe2mr52469eec.5.1791018156725;
        Sat, 03 Oct 2026 02:02:36 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:36 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:19 -0700
Subject: [PATCH v18 08/11] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-8-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=JY0pPkKV c=1 sm=1 tr=0 ts=6ac0c4ad cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zvpRHedlNIWp6186mRgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ugQA-pMJJ2tHaKab-gIUchQkovZfodlK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfXzOB23ztXU/mB
 T41Tj5Ctyfl60nVlmAJnjtM/NnFHM2GEIs8Cl0Q43wHZxnAZ8NTTax1XNCYgnOnZKiivzEgjYcH
 eL5Gbw4ApXBZ4hfA/93HiRvoytdyCgA=
X-Proofpoint-GUID: ugQA-pMJJ2tHaKab-gIUchQkovZfodlK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX54ne1HWU7fl7
 7ax2YOE87eeXbXM9wjkc9BSgC4PtoBHM/XiymtzgoZRTEGOhJDjEF+jv2PvSDiY2juTyM0TAMuB
 kK35cdfQfPhVlgVCMdGNzdqq2YpCox+/mlPM+hOvyotqT6wBAyUhul93Nqyky0dPSGzSHpPpiSQ
 gGbIvL9dTPd5B+ivKnclUHB1PPQQH/+M3P5K4wltYioV5FepxGbZzXGmUl0GGSfddKKh0nbNThP
 PeF2TZ9mWpmg1GQjGn/VHkZN/T2BjsnyJiNxaMOG7MC6iTjsPQxC6X25BI6aQ1XeraOugkK10oS
 JJIisque5+5MCKV3JKlkZLkCtqR25HhnfgvyaN4YqC4Dv/89UWvckFfxI/aLN3WRlvr434Mv5Kk
 TxROoaCGqIBzek/3Bje1CB36wRUlE0qAhaG8b38SqEGrrV9BvOoiBURhmE6clhaZfADZ4iG9iSr
 /XlEVar6xNHFezb7JMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030035

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through a separate
TPG_CTRL_CMD register instead of TPG_CTRL, and routes its output into
the CSID 1080 RX via the CSI2 TPG mux.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 27 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
index 46e443e05195..851b3cd712f5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -63,6 +63,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -140,6 +142,7 @@ static void __csid_reg_update(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	u8 lane_cnt = phy->lane_cnt;
 	int val;
 
@@ -148,8 +151,16 @@ static void __csid_configure_rx(struct csid_device *csid,
 
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..770a9e5d5ba5 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,30 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version >= TPG_HW_VER_2_4_0) {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	} else {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	/*
+	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
+	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CMD.
+	 */
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ddd7d94989ed..8ba21934a85d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5869,11 +5869,13 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_kaanapali,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };

-- 
2.34.1

