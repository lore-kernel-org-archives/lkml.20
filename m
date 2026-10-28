Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183966;
	b=obGxmwoKALrA/aY4ZdvnJWhDR7+6p7JF7clMUsB2sQIyLrNPQhOjtZtjIAHm75HDJicp
	 9L8HKNxCkKFEnBjV5PIY/HHiuL8QUP/I+oHXIpwoUv9Fr56tW0UnR0HOzwXc79FOFvO6V
	 H7FfrBX7hm7nUh+cYvGJAmVBRYAHHZj5D1FWCJIeMf92MlZ2u3mlfIwkdguluLkU7wwk6
	 zZPTsjnd9UJ+ZfbB4IMRI2e+MtPk9xAeJciFdXZIQpbiptcvifL01lHzlSg1TlmWOE/O9
	 +g8eEliJi/Mbwy+6plkTgXSxfBJzjVUU4apKFAG8mFolDRvscDNw6hI4j+S5kVNtiTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mn/WynfkmpgxKnmW+l/znlPZg7WKNwxNUfbqTYzEDX0=;
	b=VyAsT7RCEp6qagFmplrcUGXUaSirYQz9xycKeiMsD80OT+o024rkGj7Id9KxLKerbUGx
	 Uz2LKovSNDSmi+XgXIrpmimqRoBNXfpSkpN55TaswU1C8VTPE7ZjFxGWDIzxLABDML2J2
	 MMlRR5h9jxiBQNDLVsqtI5OrFXMAaFwUrYRWGtckD76pCZ1hknqny8VNFzDHBXn9RU6Lx
	 a1MAaBzDj6niUIdCs5iAGdEEOkmx5hHoxxMA7u+tu0v2D3exKU7Pc/eHcPWmnsA7y3PAo
	 3xyQbBGc2f948rWhHVqnEgaBzNKfZrA6bAYeWEAg2pWlrbvI8312jOBD3vkSORSxt2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pURotaX6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KW7ljU8a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48285606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48285606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pURotaX6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KW7ljU8a
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KAxj066164
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mn/WynfkmpgxKnmW+l/znlPZg7WKNwxNUfbqTYzEDX0=; b=pURotaX6g5sBG1XI
	13YTbVZmx1u2XJjwxLAY0MfcmHkidFeSARAm33Ku4NHA+8aJcn9WxErb0aA1O0qS
	1a9inQq3i//if22IjsAvilUkBSY3ANnmNZjbeUg9A+JE8eBhCxbsPNOYEaIxezBK
	gbybw0ak0ixhW3yhIwGqQO0fq0neaTHzpRN92D7HlZIp5fpct8wIj2L9VBsG+mDK
	T/A7nbkyVIVcEqO+xhZOFawkosEs8nBbtzeo2+yJIP4YghxekAkPzESaY1z0jd+V
	UffA2ag1+VrLT+DMvDFl2DmS7/G8w6WQAHdgGY/7WtnNBWJBcQHeAnSZoCm7838v
	zkjLTg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g3p9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1114949eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183965; x=1793788765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mn/WynfkmpgxKnmW+l/znlPZg7WKNwxNUfbqTYzEDX0=;
        b=KW7ljU8a++nVRYRNfqcNEwUXm//+eiZFQlDpViIyyD06FcZeDNyYjvAlCh7U9EWdA5
         49ipczpmcVziCcQeELhd64/sdS9/81U/KKAjos8z7ZqH7kxyMoHmNE/X840yPMVIRBsb
         pzpdJaDtKBd6TLVL8NMJ2xMSgpXlJ3STNa45LWTXWruO6NXaVgUUsJ+LBEzAtWiAatF7
         PmQKxHL/jwjrPNrCoFPQGL1kn3jxS4ldMgUdInVhF2ffEomGj6CWVuaYN8A8S8FsnOQQ
         Ze+yijOzb26N5PLYLDdI3hee6nSlyn1H2LIOna/wGxuriBZmpbmz1fmYggh1GF2P3lsC
         QMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183965; x=1793788765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mn/WynfkmpgxKnmW+l/znlPZg7WKNwxNUfbqTYzEDX0=;
        b=J4TMa55fV+JzGEDEQtI1h2LSevcXlT76A3htHR/axLobmnfxUfagZZNUt4ZkuE810S
         yYMhsfb7QQxShHiQXXZydTp41L/N++lgN51khRyz6z/A8L6vb5ghvEuDwjrMo+Z2mGoN
         JC7qLpp3HJcz3hZpt8P3pNIDMyNFyDVdWXcYIl/oX390KAfTGBjujv0dJejhQuZ0+xU1
         V/XM2KH6JH/7SlThPGrqyQAPleocfPhnygYtC+vWbJeIex3/ufR73wjTCWBaCtvhnkNy
         di/ecszseJIrOHE8NGC9p5sXjyvP6RIhSZ4bKH3CZSHnI965BbbH07Ng4sSclrxX3/Gn
         s/8g==
X-Forwarded-Encrypted: i=1; AKwUvBzHM5p8FsDHNzxzK+ZTK7zc3ycoYBmayaSt0RnRZBUa4gfJ8MvFEkff/A3IX8mYFc/VnkQGFWZ71+571MY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVJyOWjaiFdOb1RpRd0J6X4mzvoXhdEEjf6MqtqqKCpq3Mwze9
	pDolY2wnR6I4LJcXAdIFa2tyubSuks2gO3iTVKVsQ9LnEwaQz7Wbirg9kRii2L4LvRwWsMdXl4H
	V3hnMtj4mFFa0Sasu8T1sSrDVW/3FsZxI89q1c7oaifUKOpVYwQX3Ap7DYhj4sVahhLo=
X-Gm-Gg: AYBFou1DOKHhK63TxCePcfSUvqoLIMvz3Yr2BxLZj+Qf3z3Ohs2pOvTEMk0zHSoxQJD
	5JEg6PU1+9zKCcM2LUJj9TmhXiF40f1ZRcwmov2g+36nMNqntFTAMo9YOOyARnxSaC6rWqF4k/X
	7npsCzv/aDinJp/N7GaW7j7ODZ2gbQ8kAGOgaOPmBc5/MTz5nU+ArAsa9IM57uz1F4g1e1MGSBm
	sonQ0yHs1gfOS4PLaKCkX+kczl1lARweaWCN7BeFztnyOARM8fOZghxFe/QTuGP/IXNk3qfRvhM
	QvGHECyOPIxVfjIvZuUiToUSrQmPBuVOC6f82rdJFVYxNXVzazwlDpHazuLJNcJK11KSLKoN79d
	aZczPBALeu+XvDUo+S1a3OgpdOA4XYbnv8Gpkz40a114eWDFCtQ4UGfeRm/W15eORXAY6SttYmj
	U=
X-Received: by 2002:a05:701b:4659:b0:14a:5284:1bf5 with SMTP id a92af1059eb24-1a6cd967e61mr2188494c88.13.1793183964763;
        Wed, 28 Oct 2026 03:39:24 -0700 (PDT)
X-Received: by 2002:a05:701b:4659:b0:14a:5284:1bf5 with SMTP id a92af1059eb24-1a6cd967e61mr2188460c88.13.1793183963959;
        Wed, 28 Oct 2026 03:39:23 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:39:23 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:06 +0530
Subject: [PATCH v6 10/11] phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY
 init and configure sequences
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
Message-Id: <20261028-glymur-phy-v3-v6-10-1f1d2e565a66@oss.qualcomm.com>
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
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=6031;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=BZwN2CmqTMrl6IrHSNCmymZYj0vfjwA10Su0CEgkyT8=;
 b=XijVPy04sJ3VkRWoJGcRGgsg6PBP8+1MlxC57ktN6DudkUWB15y0KM+uxdaRt84P/YNOs8G4y
 2jG5yKyHX/kD5rQCNlG8ZCyoQu0r/1Fa7QrBGfY1fkP1ZjSQgZZCNx0
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX/+BEuUI1STM7
 XWzBoxIanGbiEvT2aG10FzVdVFclfoKJynRFRzsrWsu+sZ9lszZNEdTP1lOaJIO5E+MrHuMHg31
 zrp6pPjZ0pYHyUpl4S8BRqSDIbNJzVk+Pwz/7IDzf5W7+g+KYHEFvMqlCHtSuzJPgnjF1qVTTYv
 FFfUYzLylqtu65aG7CzXp/cNxCcGvle68nDuZAvtWczu3+cP9n/9p3kqs+/p239LRPJ43tOfKQg
 tZ1c8MeuAW52XerGp30sVT7T9YHGTG7t380pT1/YileAFG2wFrxIUlu6vAWlMyWbzj/oDIuIQod
 cBb341gzNVJsUBtef8aIRL5AA/+8c7/TO5cViXI1Hqv6y3gw189BLWL/KtxsuOdlS5TSDgJgzOU
 oQfkIpr5ClwOgkDHtePH3cC4n8ViIDlXbpsU/y909zbiNHzznjQpu5VZC1nkDina34zZ1ggcbZA
 qW8oiYqpsZQsuy/zqUg==
X-Proofpoint-GUID: L5ItXK9Gplmf0f-pKtxGLs5GZnqPahEy
X-Proofpoint-ORIG-GUID: L5ItXK9Gplmf0f-pKtxGLs5GZnqPahEy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfXyRzEHXRrUfX8
 TokEzxoKutV+tQzhi7RSf5g0wvwZvdWEBbGCR48KkUdeReaewXagxwUN/324Ns+VRh8mx6RfH9V
 e3dzJHkMdPv87Tnvo+0R157uJ97Tx7M=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae1d0dd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=ShocUR_Qg8epsXyAbykA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Update qmp_v8_dp_aux_init():
- Add CLK_FWD_CONFIG_1 initialization (0x3f) before power-down control
- Replace PSR_PWRDN with LANE_0_1_PWRDN and LANE_2_3_PWRDN in PD_CTL
  to correctly power down the data lanes
- Correct BIAS_EN_CLKBUFLR_EN value from 0x1c to 0x17

Update qmp_v4_configure_dp_tx():
- Correct default TX_EMP_POST1_LVL value from 0x20 to 0x2b

Update qmp_v8_configure_dp_phy():
- Correct 2-lane and 4-lane driver enable values to 0x30 (was 0x10/0x34)
- Add CLKBUF_ENABLE (0x87) programming for both TX lanes before driver
  enable writes
- Add TSYNC_OVRD sequence (0x03 -> 0x23 -> 0x22 -> 0x3e) and
  LALB_RESET_TSYNC_EN_CTRL (0x0a) programming for proper TSYNC handling
- Fix QPHY_DP_PHY_STATUS poll to check BIT(0) instead of BIT(1)
- Replace post-lock TX_DRV_LVL/TX_EMP writes with two COM_CMN_STATUS
  polls (BIT(0) and BIT(1)) to properly verify PLL lock completion

without this fixes following can occur:
- Link training failures or instability at higher rates (HBR2/HBR3)
- Incorrect LFPS signaling timing, potentially breaking USB3+DP combo
mode entry/exit

[   34.109482] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link training #2 on phy 1 failed. ret=-110
[   34.111460] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link training of LTTPR(s) failed. ret=-110
[   34.118118] [drm:msm_dp_display_atomic_enable [msm]] *ERROR* Failed link training (rc=-104)
[   34.118156] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX IRQ 0x01000000 when not busy

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 54 ++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 10b3efe48721..b34b892c2702 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3904,12 +3904,15 @@ static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
-	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+	writel(0x3f, qmp->dp_serdes + QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1);
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+			DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+			DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+			qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
 	/* Turn on BIAS current for PHY/PLL */
-	writel(0x1c, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
+	writel(0x17, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
 
 	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
 	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
@@ -3936,8 +3939,8 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 
-	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
 
 	qmp_combo_configure_dp_swing(qmp);
 }
@@ -4126,39 +4129,52 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
 	} else if (dp_opts->lanes == 2) {
 		bias0_en = reverse ? 0x3f : 0x15;
 		bias1_en = reverse ? 0x15 : 0x3f;
-		drvr0_en = 0x10;
-		drvr1_en = 0x10;
+		drvr0_en = reverse ? 0x30 : 0x10;
+		drvr1_en = reverse ? 0x10 : 0x30;
 	} else {
 		bias0_en = 0x3f;
 		bias1_en = 0x3f;
-		drvr0_en = 0x34;
-		drvr1_en = 0x34;
+		drvr0_en = 0x30;
+		drvr1_en = 0x30;
 	}
 
+	writel(0x8f, qmp->dp_tx + QSERDES_V8_LALB_CLKBUF_ENABLE);
+	writel(0x87, qmp->dp_tx2 + QSERDES_V8_LALB_CLKBUF_ENABLE);
 	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
 	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
 	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 
+	writel(0x03, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+	writel(0x23, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+	writel(0x22, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+
+	writel(0x0a, qmp->dp_tx + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
+	writel(0x0a, qmp->dp_tx2 + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
+
+	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+
 	writel(0x08, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	udelay(100);
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	udelay(500);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
+	ret = readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
-			((status & BIT(1)) > 0),
+			((status & BIT(0)) > 0),
 			500,
-			10000))
-		return -ETIMEDOUT;
+			10000);
+	if (ret)
+		return ret;
 
-	writel(0x00, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
-	writel(0x00, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 
-	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	ret = readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000);
 
-	return 0;
+	return ret;
 }
 
 static int qmp_combo_dp_configure(struct phy *phy, union phy_configure_opts *opts)

-- 
2.34.1

