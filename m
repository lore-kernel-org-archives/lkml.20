Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16873769EC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812068; cv=none; b=LY5M+66vfxStf8xwKhfRt+IOIaQ7rML07euHS9h7II5aPrhXQIty8ecAyD9WzVyDor/p8TPlhPTreeiNJ+QYJ1AeuVs3adOy8GhVyNpJkyT4TciaS9OQaJnNOETbMJbEFMPN4qlHNA1wf8uyRmJRsTq40EcKQ3V6fTPEV/2qNtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812068; c=relaxed/simple;
	bh=51isISCUxuzvmQ0f+k4lBc7lvYpGEQkGNTZsup7U6LU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/nbTVM+LOBfKCMWcfyRuk3pOowZrPY9kEpaTPY/LFq6sZ/LXpV30r3i+jnaNgeKHtCoqoiWySLpfPbC/ctmDklSqfP3PGfdJnGGmfFbnuMYIUgnXl/qCS9bMW0q0r4If8/v/D05dnD/ep/wYpt44NG7sMrtk1Z/UKmec0kGWa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9AgZ7hV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEJ8loO+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9AgZ7hV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEJ8loO+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC03SA801999
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWuxUBcrInqnBnXrIjvNWBh+kSHK0gado8CZLpJNc6o=; b=b9AgZ7hVkss9ozdw
	1dWWNsBJBCUFaQgtPt6SpfZGaHdDI0pJq7MEgHYBTA7/XV6DD+snyQtPpwwV0piQ
	wwl/jd8CJAvovvkRbDnbwtmxbPhsu4QCxkbqU3A/+1uO7wTO7lUcqosu8+vBhh06
	aul+Qg/fe4lnM6h7q1cizMJsLhrngVnUt5eKK4Zhf/C6dyhdNKMo1Xj7vXUDUeAZ
	xW2guuXU/AwN+1nEr4WOfj6NS8QYqtNXCu6uCbSb5MsQIv1TcXjXMrMiAM5iPQtz
	GiLescQqKGvX8cRF+g9WmrSlMRrLz6zBoXeKclzn5L1UyFLpGqILrasg1r8VMQIS
	4JQRZQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcrwf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3515266f6eeso3630446eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812066; x=1792416866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWuxUBcrInqnBnXrIjvNWBh+kSHK0gado8CZLpJNc6o=;
        b=jEJ8loO+po50cxbfZ56+W4P4QDltVHqdiWatWhYjAKToadVvwWdqt+Vn5iXARwJM0J
         v0XrK7hV5LxudliguyzcLLxUFzKA+079f4Ioiu9h8iEJogvpjYD904u6sx+OoX3RNrWE
         KY2/sVjbIhDMDOumTzHNo2geIkjuUeCaNa59O1hfOxRUSnMY2jvuVXEY0AGEcRZOWHrL
         FZm5XhrSlfPzOs53a+Dqgs2aGiMZC0uhsLLCYK9B4HJP+w62I3Lozz0zz4lHvA9/o/5x
         UoCKlezbtw9+48/W8LnALfr6szdkTiY1qwHTJFX1zHRDnduMbbVgcIQbUHBFpj7bJZBC
         OECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812066; x=1792416866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWuxUBcrInqnBnXrIjvNWBh+kSHK0gado8CZLpJNc6o=;
        b=pCUN8Ktgox6C7i/zzeUBvsIlFEFG1afFv/siDEOvG6RHjymetvXw159+POFPGko4nU
         HwKB78+3F7a97axQca6nELeZnvunckZ70uc1WI9P+QV7vuRVqxo4XspDvADZZZ16zvvG
         osjeZlf1WIrM2Z1rhwB3jp32V28cl6uAZEjePuW8TOcJw/gP0htvyky75Y3eHEzfONMT
         yFWiEOuSDr8reaONs8bLaATTzqm525OG5PbWsOCFw7Vjg/07tWCjt+q+BQsxSJBtefdn
         GsWujNrpsZ+ZBYTNPN7MG9aZwZ9/4bBuG/MfN5fIs0+F3JqCj8EHeZbilP6FLiSjhTc1
         UA0A==
X-Forwarded-Encrypted: i=1; AKwUvBwsgOvdaiXj85FclqXGdHAnnJztaHuEJkhIkGXqIdEk3mt0Vt7iiJNisQ8MyFYcRIashw5i7fOKG7OG2Ak=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEfTu2AdfDpW6o5M3fWGsDvKT5NymcPXQW1L+OHoNDVN8fW4IS
	5TS6EQHYJ3A7KVXNKgQ6Bg5RVJ7ESggpC5wtubeLq0zA1+lQulR5MYmrIYCZ6cwL3qyPy0oBenn
	iJnkvq8ZiE0xp07DEOsxu4XQjkbaP0W6kUSo0uJFPAoaY35wNQS46PTJYJFUTYLBUpGQ=
X-Gm-Gg: AYBFou2v0wHQYSMv6X2rmpQnbS7Bv/lO5Mvsnu6AZytniRjVtOYZCqNyLh8/CUCK8hE
	hG+VSq6ZryPn4k9wqvY12/rd9cBk6ROkgCkxXofKNM3hB/wHiIwK47G9ZL54tvOXqEjddQzpDHF
	9L43mw4LFKO1pR+4yO3lY/9eb48VT3j6d/HoAiG9oINiRvV/AW65X7mO1Ui19DRCjanuf1IEqwf
	KhCTL+Q8WuYBx1V/yxM+TFSvCmvNBaLxziFlEJNyMhU4DR+w3kL8jAjjhvQFqzQ+7NSUhA404xK
	PzWC9etey147gYfDPVb0+wuBJTkIZgXblzI4fiMbKHnSpWD9xk0YsDmRKHvOpkPTLTIOpBQhLrr
	cxM1Yjvo0Qi70SFr3Xz8bObebZRo=
X-Received: by 2002:a05:7301:4707:b0:359:c5c1:1561 with SMTP id 5a478bee46e88-359c5c124afmr6226000eec.13.1791812065780;
        Mon, 12 Oct 2026 06:34:25 -0700 (PDT)
X-Received: by 2002:a05:7301:4707:b0:359:c5c1:1561 with SMTP id 5a478bee46e88-359c5c124afmr6225974eec.13.1791812065235;
        Mon, 12 Oct 2026 06:34:25 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:34:24 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:22 +0530
Subject: [PATCH v2 12/13] phy: qcom: edp: Add Nord PHY configuration data
 tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-12-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=2153;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=mc70GfhABlJEcIgszTS9OYEd+47rUg6PffkmKCnmkaA=;
 b=Rtaxo/Nh7eGn0ieiVqBP2KN9g33OKo536bTfySr6a9ADjYIHd80Dbex/t241gIRSnoVRjQRgj
 /oYuBiVbkZcC1tnPnA/IuOsx6QfOu0PrlLstteaT6LPSojTMVB9dae0
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: SbxEkbLJ5nIcjzcupQUY_XgNTnq_pThU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXxQPWfyj8mMKV
 k+OVpjHdhGXqOmjVDp8uFq0UWl4FizuxPdYxzi/060ho+wWs9zhlBRofvwjY8eE4dxTpGuFzAmG
 L7Y6P0ua9MSWExIlFX+wA8muLU79wMk=
X-Proofpoint-ORIG-GUID: SbxEkbLJ5nIcjzcupQUY_XgNTnq_pThU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX37u1kxRsdFB0
 QHhkzBXGfrmiWwS0Q+oauy1LAsdUwOyB9dlJGVdl2aBqaURBvpl+r3yxFgDBVdt6dXEIjcPIksc
 4fIvclyT6kf+b/KH3CVuz2CxFf8UsLn60ajAHD1we3yNO/N/O1IAkAuBqkdywkBnfW0saNDbwYp
 PvhcD4zy+gDDPvxtYJifwMvOP/BQOC4HMRvGKB28VLILxDi/812TwNK3TD2zvj0xEXUbvAMnjrx
 NRL6aKgYYREVLrxfXtgu/Z56tZCbkFDmeJhSKIMlA3vvQLGMAEzVilsF+fLhfdfanFFw54ZoVom
 MrPnR0YQNel/SIjfsnqHV0xIFcxnqW6p2tvPNfzTNXfySQpCA677qI5wVTAPkHoOIpJo0DfioOf
 Rr7G9jWCL1d6An9Q24cYH+bTQ/ybEXjEkcqYL0B7FqXKNs1yDWoFivdu1JOGDWr06JNMLp570kU
 eBFLUFb3P6EnrNEzVyw==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acce1e2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=44JGFhAfC3nl-4BMLwQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add Nord-specific AUX channel, VCO divider, LDO and TX resistor
calibration data: edp_phy_aux_cfg_nord[], edp_phy_vco_div_cfg_nord[],
qcom_edp_ldo_config_nord() and tx_res_cfg_nord[], sourced from HPG
Tables 2-1-a, 2-1-b and 2-1-d.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 3e857d105668..cb5f6e0ae607 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1741,6 +1741,39 @@ static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
 	return 0;
 }
 
+static const u8 edp_phy_aux_cfg_nord[DP_AUX_CFG_SIZE] = {
+	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x04,
+};
+
+static const u8 edp_phy_vco_div_cfg_nord[4] = {
+	0x00, 0x00, 0x02, 0x01,
+};
+
+static int qcom_edp_ldo_config_nord(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+
+	writel(0xd0, edp->tx0 + TXn_LDO_CONFIG);
+	writel(dp_opts->lanes > 2 ? 0xd0 : 0x00, edp->tx1 + TXn_LDO_CONFIG);
+	writel(0x03, edp->edp + DP_PHY_LDO_CFG_NORD);
+
+	return 0;
+}
+
+static const struct qcom_edp_tx_res_entry tx_res_cfg_nord[] = {
+	{ 0, TXn_RES_CODE_LANE_OFFSET_TX0, 0x06 },
+	{ 0, TXn_RES_CODE_LANE_OFFSET_TX1, 0x06 },
+	{ 1, TXn_RES_CODE_LANE_OFFSET_TX0, 0x06 },
+	{ 1, TXn_RES_CODE_LANE_OFFSET_TX1, 0x06 },
+	{ 0, TXn_TX_EMP_POST1_LVL,         0x06 },
+	{ 1, TXn_TX_EMP_POST1_LVL,         0x06 },
+	{ 0, TXn_TX_BAND_NORD,             0x05 },
+	{ 1, TXn_TX_BAND_NORD,             0x05 },
+	{ 2, DP_PHY_TX_LN0_DRV_LVL_NORD,  0x12 },
+	{ 2, DP_PHY_TX_LN1_DRV_LVL_NORD,  0x12 },
+	QCOM_EDP_TX_RES_ENTRY_END,
+};
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

