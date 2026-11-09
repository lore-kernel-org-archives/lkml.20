Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215096;
	b=E1xxS/eqSwDihNUwEHI/UTApVNMDN3zuSUkIum98gcEh11aSyWJqSMxwDS9bxK01q0cI
	 Ga3OhNlqekPUB1a8cMcObkK0J+AW+C0rF1oIAOhgu1AWhujGViILhi2faAQI4PVQvccwx
	 sksg51oZZ4yLU4GAGrc1GvaTo358bn9Dv31CvMjp8j4EF6O2QaU5nEbLVqxhyDR8LCsLc
	 P3YY4Vd0fkBsvrh8JcBCHphHhmGpOdaYZ83VhN5gnkissgkdtViCIyxLzDhqNLvcU8pFK
	 a0Hy+6w1+5omUIjiHi5ZOj1CKgWoYRjyCPZi4IDTMO2D5NH4P5jZ91RcxlZJfxbnLsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S2OdxKrYsg8o0XxGHeaf2oT/9qajxW5QJ437FyTV3l0=;
	b=RqfH3qO/beGBZ1fhVNNV2SbS0UdDHgHYfwPLJzQJ+TQxQUALH3H6ik/hYJJBIuK47rNW
	 RoUn6NnmMqgJhR2WYodbQg+iKmU+zJfbWUyN/AaPJnGnJwGrzzvqyQiqsYRrcSG3hryrI
	 FliPxC78mYwOGvb73TLyItFYYcsrrb/HT76pAEKkCfdnk5BbA5/XxvHYUpNbmz8QZd4vc
	 kpfEqslbmYkTtiPgUS/fd2IPJqJI7siLgtjmz7WB1JY2nUEbvatyVaz74sLmPbHy+OaiD
	 nOG2/+DxNGCLSmghWKA4diDzq8l5FeRW2pKfOW95i5xlU2BrJ243ubsPZe8qYqOeo2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFz8muvN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RX7kZ0wx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA9D606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA9D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFz8muvN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RX7kZ0wx
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AEXT481292
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S2OdxKrYsg8o0XxGHeaf2oT/9qajxW5QJ43
	7FyTV3l0=; b=cFz8muvNA/B6DpyEuDlwZ47J20kBLH8Bm/XPdfvUHVtZeYSGa4O
	To5Qx6grDITIuiG3uwQHx8LCroio2gqSCYf9lIiGYxZAwag2qxCq+n20PZW+Ef+F
	Q3mxwp/NZdFuXAX8MaDqX8lamME/eMBZcI70Z4VUfv2+rEEOK0CbSa+d59++k2KA
	rSLQnPsst1K0bbJRm0+l1uvxgq41g3qTSz3uzF2BUK5487IUJ2mGyzpFplnE+cax
	ESbDMIBRS5LFrsj12Yv74WZTBnOsrgxROsEUnw7IL5TlbrauUhdhaiELSk9z1k8i
	DpDMUtUrJtlQRzfyf4v9sjPMcp+z9sY41Lw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsdp8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:04:54 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1452820c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794215094; x=1794819894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S2OdxKrYsg8o0XxGHeaf2oT/9qajxW5QJ437FyTV3l0=;
        b=RX7kZ0wxmAijlUhIAkx0bnmNSlbDCbeczP6fTvcg0lWmAgVizhQPwpJQeVC8PbAJyb
         l3Ah6eLu6afg3u2k9y++ZuIa0gud8DhgfamClIiegHvPMZB/zg3hyUMH0g0wQHtyy35u
         TKUJ1IhsdMXQz+ivv6rtW/inKk1kOylzGebjYFXCUXQnnzdlPuElZgZhJd2O1Qo6AMw4
         pNI6So7IN6hBFwZogEyG7QYjFDnEWol1Hbn2JZrjFdzhVz/LjNq+70r+lGaKnhQLoHgH
         0vyMOpbdPriU7elw/U+0uA1jbTJ7vUZ60aDWDwbCBhD9FAp/2p10J9J1xmTucVvQmLyf
         htNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215094; x=1794819894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2OdxKrYsg8o0XxGHeaf2oT/9qajxW5QJ437FyTV3l0=;
        b=JyltIDzl6gnLq5tNS4iOieMc7JpMneh1KsT7t3HVgPZ4nSBy6pof5C5CDbuTYdGCwA
         faRTB9gRGdw+w9QvR9KfqheishkgbUcdj5K64bD0TUpG8+vgwiycFhLZ64JnP84N5HvB
         PXmiNpieOW8ko0ZHRLYpQNtG/zp+q/OX6Ed/9ILpd1+Cu+O3Ne+graJdo6hTDN/W64wa
         8KeWP7LIbaErbAJ9w+gOHZ8rSrbWo85gjGe1Ij/jd+l2bKJoUQS+Eo5DFgc8R282LUyN
         p2X7Siw77uZW4fBFEKsl8acnl3EY13WkWnx+2CLCgxVHjiO76kQZwLE89A7nsrDvFvWZ
         afqA==
X-Forwarded-Encrypted: i=1; AL+hErFgXcqfxn/P57TEnJsgfFrZenokcySPvHfgVl98Jtn18c6C6NY4Xrip0rui1e4IWjMdX5W0m6Wra+wKdL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SpZDMJwUkghwoY0z9jfbQpEmNlJBwdYDk8sXu2yb73sXehSsl
	kmUoyg01zocxwNrjY6NPsYec6GXxJd14wDMqPsSi3qMi7wQrCkB+1CMZIhcjP67gXe5paMmtT9U
	UnQQ6usRPWkODYhcR92wlJHeUKGwc+5NpfuYdbOrTRYKpx3A+L7U/pew2jgks5wk8D0U=
X-Gm-Gg: AYBFou1eOLqD/mtSNFnncVuhYbkxKKfCZHvkJ9nUx+cENLcJPL68ZQ5odYkrtPCmEtZ
	nMGG0gfPUQNTSE/oTLFqKZso4l11eZ225laUnysqVWt8xjsQR8H+MtKJ/ndI8kdEyJYeoSUFRJF
	FMwzFYJDY5iw++ID0tGTqHy3Ammigx7m37fIspXMxb16gwv20GC7oT+qYPdc5nCtfXgC5li7coq
	/0UKQ02aNeqtw6VML3d2NC230obZXS+XE+wFNEYdxPSwz7IuPsZUrPBFqpWocAOmH93qmPl+r8K
	VOlNgecH8INU6k7Uy985y7Jz4XACHruFNVnSsPkzil9vUK/+C9dyx5GleHFvj7l0V0Owy9nBn6w
	gIzGpgzYVDOVibbM8Px95LXN0xpdot+uoNRbeIQwoKsy2vRtutWQ+sApU19ZdAze5sBDZS0q4jB
	Y8X9+wr3FwyIqY0lCv5LJcao4bePF1B9vZujcS
X-Received: by 2002:a05:701b:455a:20b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b39ff1912fmr5413135c88.37.1794215094101;
        Mon, 09 Nov 2026 01:04:54 -0800 (PST)
X-Received: by 2002:a05:701b:455a:20b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b39ff1912fmr5413089c88.37.1794215093364;
        Mon, 09 Nov 2026 01:04:53 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm14459279c88.4.2026.11.09.01.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:04:53 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org, mani@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abelvesa@kernel.org,
        yongxing.mou@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] phy: qcom: edp: Fix missing lane drive level programming on Glymur
Date: Mon,  9 Nov 2026 01:04:49 -0800
Message-Id: <20261109090449.410840-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 74izvebv11Zmi_sndvFi8WM4oN7S-xhr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfX+t4Yk6RJW7+P
 Y6kfnewcYctB0PhAm+qiTqLM6unIbJ7u1oUKGAVDB5LU2DcMUqhOIMATA+uand5zduoFjFjKrdQ
 xPPXQzn1ve02Zx8TeCPMw/fMUF/fBDc=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af18cb6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=k0f5IhIVsTSicQYmG90A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfX2EcNOZokkRT2
 HwGVZQDUFeXVuD9zJijyku3/FNcYXwgmY4lu3Ys8nFpd6rVxVykWhgfQH278JuLFiy5RCbbSoXW
 ScQU+T18pRU/4wNotidePxmKi14LI4d7pYnCU+QqGifX85qujHYR7UeCkvxEQRXv2DF+72zPz1k
 O/tsIWosseYrA3/vKkWY6mKvdrQu/zWAvK2b3SQESenxBc0Wm9Boqh+Ovlb4re55hXdVR/ca4cu
 ruVuKxvPPPuXDdWHOFWyuq4qlYPZpZSyO9NzWK+5wH3iXcgEu3WjACTJjLegXBVgbUZtmgIXiFl
 Tj1ef2uuCHQ5Cnzla1cd8rEcbojNuNeFfTueV2LlHb/IiYLydl46KuRuox7swTjrTAPX8w/7ynJ
 7O9Ot3PYUZOFYU2O7O0AuQc+OjkAVRHCEQ7oDp7u2UoOnnw0TDprppNX4zwgDpAeou0U9dfN1xc
 2IaSV0B3jj1Gi/0F/Fg==
X-Proofpoint-GUID: 74izvebv11Zmi_sndvFi8WM4oN7S-xhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090036

Besides the per-TX TX_DRV_LVL, the Glymur eDP PHY has LN0_DRV_LVL and
LN1_DRV_LVL registers in its PCS block. The driver never programs them,
so they stay at their reset value of 0.

This goes unnoticed at HBR and below, but at HBR2 link training
completes and the sink then reports a high symbol error count on three
of the four lanes, leaving the panel blank.

Initialize both registers as documented in the programming guide and
update them together with TX_DRV_LVL whenever the voltage swing changes.

Tested on the Microsoft Surface Laptop 8th Edition 13.8" with 4-lane
HBR2.

Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
Assisted-by: LLM
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
This depends on the Glymur eDP PHY programming sequence series:
https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com/
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index c5d1fa0ae6cb..ca17fd3b3c57 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -48,6 +48,8 @@
 #define DP_PHY_LFPS_CYC                         0x00d8
 #define DP_PHY_AUXLESS_SETUP_CYC                0x00dc
 #define DP_PHY_AUXLESS_SILENCE_CYC              0x00e0
+#define DP_PHY_LN0_DRV_LVL                      0x00e4
+#define DP_PHY_LN1_DRV_LVL                      0x00e8
 #define DP_PHY_LDO_CFG                          0x00f0
 
 #define DP_PHY_STATUS                           0x00e0
@@ -112,6 +114,7 @@ struct phy_ver_ops {
 
 struct qcom_edp_phy_cfg {
 	bool is_edp;
+	bool has_ln_drv_lvl;
 	const u8 *aux_cfg;
 	const u8 *vco_div_cfg;
 	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
@@ -464,6 +467,11 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	writel(swing, edp->tx1 + TXn_TX_DRV_LVL);
 	writel(emph, edp->tx1 + TXn_TX_EMP_POST1_LVL);
 
+	if (edp->cfg->has_ln_drv_lvl) {
+		writel(swing, edp->edp + DP_PHY_LN0_DRV_LVL);
+		writel(swing, edp->edp + DP_PHY_LN1_DRV_LVL);
+	}
+
 	return 0;
 }
 
@@ -620,6 +628,8 @@ static int qcom_edp_configure_pcs_v8(const struct qcom_edp *edp)
 
 	writel(edp->is_edp ? 0x03 : 0x00, edp->edp + DP_PHY_LDO_CFG);
 	writel(0x0f, edp->edp + DP_PHY_CFG_1);
+	writel(0x12, edp->edp + DP_PHY_LN0_DRV_LVL);
+	writel(0x12, edp->edp + DP_PHY_LN1_DRV_LVL);
 	writel(0x00, edp->edp + DP_PHY_AUXLESS_CFG1);
 	writel(auxless_setup_cyc, edp->edp + DP_PHY_AUXLESS_SETUP_CYC);
 	writel(auxless_silence_cyc, edp->edp + DP_PHY_AUXLESS_SILENCE_CYC);
@@ -1377,6 +1387,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 };
 
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
+	.has_ln_drv_lvl = true,
 	.aux_cfg = edp_phy_aux_cfg_v8,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
-- 
2.34.1

