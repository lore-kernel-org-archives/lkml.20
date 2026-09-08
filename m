Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FC7538D8B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876107; cv=none; b=aIixZQoK3RONn4Id+2K83k85K55ZUksSvb9rOutLHmlukhpuSM1jJeKFwPd+eh7MoqveHKnGsx0iYbtarDeewwwC3vzMz+z/c+10t2A3I47tR40XAW8OJ/PNQBIr6jXkpZspa03BZMejP1C/ytdHUuHjBeab/JtWp0FhaHn8nJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876107; c=relaxed/simple;
	bh=1nQlxNuv9FWfHHpLDlYWBGcAOByWvcoisNR7i/FMMcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPAVQyQ6S10KnUfzqkL4ivKJtxGiWi0oNu7g1lkx6jQIbSdvphAJ5FOYN3b9yU7fpmwOjQL2x57XBU4nOdEl5DdFQRg1gFvr2px4LXmiwKaXuUCbv+ItLB1zngsslcunwMzAfZfzs5ig/HIlDjyrGWCxgt9BZ306b9NoRhI8gp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5imqjuQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSWVogRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5imqjuQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSWVogRP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkpCJ3573847
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H42SKqHNlNq89TFekdazoZ9IGwyHLUH/DIVDOqo9gZ4=; b=C5imqjuQfqJmhuSx
	ErPZmAb7wv27A/G9JrpjNfcK75iChNOH7FcZhO6abzfk1+PESnUjMfNLShGlbA5C
	uJ68WtMYwwgQ3OQpCCnh5cTALl6L7mrfG2tMbL476wk/klRrNZNe/TCsc81svyOo
	sWj8jx45pgjSpSDcuKwyIsfQXrUxBc2fyHoGEf0HHYtnZGgR7vIg23B6ESUpQ4fs
	Rvq822bqZNClS13sh8sDLBSyRdycUkClWgr50pmMs3LboumbGFRqjMKPVK5md8iy
	d1m2aNRhy9njGjLxsOrAt5zCtkprk229FiCu/T3AHL63TAs05LO5HRnxNE5i3HfX
	3OPnSQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp4921r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:01:28 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1abf73d1fso2444883eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876087; x=1789480887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H42SKqHNlNq89TFekdazoZ9IGwyHLUH/DIVDOqo9gZ4=;
        b=HSWVogRPiWKkkRf3rjleQIQnUTA3W0IhCLF3zZdrTyTnBwxOY6vhLH40QaUzr+rkAg
         aYWAXm/Eqh0PGi7VJtPclioG28q5GaQw2SZ9UE+wCfY0Vjp/jVVJnnYoxk2HVP3IGkWE
         05e5blYVQURuZEFTOUFh6+wuqoN/JKw8T9G0VjD8ioYKe/LirBPcgpf6iQi3DpviYxhj
         xR2K0qXi6POUbRMFQkNvCKAOztSHNxF4+YeJqlCkr7C7Kg4S35mKrg8o9EOB3aMmzZ3J
         jUB0whjtvjdWPCAgRPHqVPtG+tM7ujUQDqHtwk4XH0KiUL/TH7V2aXNs+Rq+5IyB5z/7
         pm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876087; x=1789480887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H42SKqHNlNq89TFekdazoZ9IGwyHLUH/DIVDOqo9gZ4=;
        b=dVKxoND5TKUx1lYoE1vmb2hwZxdYz9S1f9iUEHDVIxLIPCQ65zzQio87NoGHfk34Pf
         y0ki/jGc46EnsBrQOt0wSI328/+BfDaTGKaCCw1cJV3SiN1BL7hGzQLC4GKVI4fYtbpd
         TB8KXMc++LKLEICjyYGiGX8dEo7R1e9XDYk1VZUWsOnTdsEuEh6+xbXc5qfWOYNOgt1N
         Ik0HgsbdItFhn9+xaBGrTY7eM+F8vQRkOyv+tjJk9KNVYBFKM5cR9mDCGUjGa9b7ewSF
         RG2vFQoqoE0J/ij7uTqBvK591NUg9rLHLuoY6eS0a8Pw3OJxhPoNQO8QP/XWP3yu+SZU
         aUBw==
X-Forwarded-Encrypted: i=1; AKwUvBwbqt+0fz74hmKvle7ZWKcc3UJAp5SBLbytlQbZoNQuGPlu5Yym9WTTYT0EVhHtwhbRUmkQ+G4eRCl4iIk=@vger.kernel.org
X-Gm-Message-State: AFuF++kSMoVjbp23Wvg0VK/a57rMWJjVNQijBTomy4VBVyVXNVOVTSjl
	54ZKp7BkaJEHOplirz5fDiD12QfJO6X1wTedXv/RSUVeQ3Qr8C0wgx4Hg4zTqLJHJXBOVpXfRKr
	IaM4vAA1zqIJW0NzWfDETByQkyB0knMGvBicYbV6G9Tstd8coQCRO63583soKeLiBhXE=
X-Gm-Gg: AYBFou1GAhC15Cw1/Bim+2VzlP71585/zQqSTBYEnEmxz7Divs0P2JTf4djihUnDj+h
	h2seGXopibT9IQBs+gDPREhQzQdm85YeInscImqPcE3ecePX6MO/ijFqeUTtJtFTEMao1Dfl81M
	T2LMwKg3RmhE9MM7eE+aO1p+qlCTNeWQOvfdhLwrZ2WlDftp5KUdH4+hzCMAVvBnn+xKVszz5+5
	fzzAmHK8W9QS0VykARqrQ9O9LX/6gtE9TGJjGZBb6JDco8DPyiBmykUj3JJghv/kAfasXrFH4CN
	fTbtIhpnb0gC/ZJ+GVDeJUgMAvTZAlI5QVsovY4oK+StTgCa1cuSkeWsjsJxKpmIayEad6vclD7
	efFLKh1B3IHicguDcxjNlPl32ZIk=
X-Received: by 2002:a05:6820:609:b0:6b1:67e1:fc8e with SMTP id 006d021491bc7-6b6fd9c7a86mr17799950eaf.25.1788876086449;
        Tue, 08 Sep 2026 07:01:26 -0700 (PDT)
X-Received: by 2002:a05:6820:609:b0:6b1:67e1:fc8e with SMTP id 006d021491bc7-6b6fd9c7a86mr17799655eaf.25.1788876084167;
        Tue, 08 Sep 2026 07:01:24 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:23 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:30:55 +0530
Subject: [PATCH v4 2/9] phy: qualcomm: qmp-combo: Update DP PHY common init
 tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-2-ff22e5150538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=4909;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=jUl/a7td3eVZzHxout1Wc+KQ0lo411exv5ozSQDxRNs=;
 b=ft7oh6O5glwpwUq2UqAHPUs3L7SqLW+OIIjEzm18+vdgLJzzM5A1M8yZbkcJEXx++KtPCJ33P
 SbqU5yvMdPLBtGqZfEYtU+69/LC4n/9W1qEDTpmWePzdv9gWcj2C8sp
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa01538 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hi1czDCzuCcYxUEklLsA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: 83N_Wk0bwkMTAA_92tUYHoPXeWkFy6ew
X-Proofpoint-GUID: 83N_Wk0bwkMTAA_92tUYHoPXeWkFy6ew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfXxC+EARJqclNS
 BAZ8BNxGVBNHd9J+yyxQtu1r3mSeW+IWf19tHH5xjVrRrN/HjYDXCU0sQYUHGdZi550lS333h7K
 p/Ajr2bI4x7+gpZWVehjU8HQnOJ8LPk/P5h2/imKa6Ev38gTME6cAA5p61E+Ed09fctzfjlfmOI
 PXP0wXG0/Z6Zrm43lXlDLSvck0HAVRcRXpJpWW89yIMfDws45Di2AwX/x/pa8I4R/4/sM0Ncc34
 HhGNvxQBKCbpe/3NwnBbMjAyK/lUvbpa6i0OYntdaawFNngbG+w6VtwnHh8iw8krFKecrqwUFnC
 wJU0reQJMgmgwsWnZGIL5FJzX3hSDg0yewsnWIak3h2J6w5wXGTfhP0cJk+IWd08kyU5pSrziB7
 /6efdAYSKwBZpSs2v/cn6HZXzWWtyxmnLf7sFB0Z2gVNxSzolCXWB4E2rEz0Wh628tSTCw3VXcx
 RAWAUtcORiPhTjc3q4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX9gIYdUw8GJqy
 wR663jrBHXflTRRPMzCHjlm0SSMRIf7XQJ3TyL16tp7ILRlizZuIJo28Oy+WQ7xL/sGi6EOPAY5
 pmMe5eHTTcsCfq/i3MRPmpgfKGbjSAs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080151

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Update common DP PHY serdes and TX initialization tables with
corrected PLL control values (MODE0 instead of MODE1), updated
SSC step size, reset control, and various TX lane configuration
parameters including emphasis levels and driver enable settings.

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 4d31637f1dce..b2ffc20e8f6a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1494,10 +1494,10 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE1, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x0a),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
@@ -1512,12 +1512,13 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_RESETSM_CNTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP_EN, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x56),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x16),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x15),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD1, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_1, 0x40),
@@ -1553,26 +1554,26 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_tx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl qmp_v8_n3p_dp_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x1a),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VMODE_CTRL1, 0x40),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT1, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT2, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCS_INTERFACE_SELECT1, 0x50),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_1, 0x0d),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x87),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_LVL_UPDATE_CTRL, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRAN_DRVR_EMP_EN, 0x5f),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_EMP_POST1_LVL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_EMP_POST1_LVL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_EMP_POST1_LVL, 0x2b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_EMP_POST1_LVL, 0x2b),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_PRE1_EMPH, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_PRE1_EMPH, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_DRV_LVL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_DRV_LVL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_HIGHZ_DRVR_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_HIGHZ_DRVR_EN, 0x3f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_2, 0x50),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_3, 0x51),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x0c),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_CAL_CTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_CAL_CTRL, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_POST_CAL_OFFSET, 0x10),

-- 
2.34.1

