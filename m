Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183961;
	b=RIGHP/TGmD3kRl7/HapOC6CzkoImeG1z8y2bODpRuGyDjllgiLhiOq6QvwTOQv0oWfv/
	 soJM+ljm5oiWfFkC5qE5OKRksGUJtRF70FuZeLJyy4/mR0BQVXPpdvexOoxZ1krYtj6os
	 c01GOVqDjGVzw9JjBg+gNXhfcFNgkNA6ecPugsewaZufakKG8uBhgC+4Bm+1gcKdqmmhc
	 dTcM82sLJPa66abYsm8IWn0thnmUVkr6RWdXW/wWJulPBhDzpCxZt7G4bqd5hZ41X5kD/
	 TqD5treAnmPMGBDbk+pWtPuXf4RkBiZKE6/dK9/CQKZAl+qTshPYGIvroUR/PaQmsHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cOggzBuXe5PWUbLSzi+bwdNe7VzMo5TdvnBdqMxg6RA=;
	b=Imd6twOxlvaS4baawYRqSY1Ifatjadutj0xihQQr4tbjJLT2K+KbGrO9ppuNwFPc86OY
	 w6jk8KczFIQLBmFOTuwsptw5NBOYCK5GyagkcNUCQVDpDnRr12PftYDCIyIOIj8dXtzAM
	 qw6FHM3+Lr2aiPKl09FPIgcpwwpOKaJX9LdeTwOcmdQtmfsUzqafTLFZ6ce8OfEJN1BZP
	 18ULET88LEI/d43fxlIWjbSTv/y6CzW0XC4UtsvqjJ3sEnxKMPF3N+fmEXJBRxR0E5qHv
	 l4CJPqO0AdcFbXKbFuUFiYeBwazxIbRdzZ1f6kt//hnZCykRv6/nvF1m8RTTIKZy+rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ex41vhHj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZB0faxeP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E14606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E14606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ex41vhHj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZB0faxeP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K1HC3892606
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cOggzBuXe5PWUbLSzi+bwdNe7VzMo5TdvnBdqMxg6RA=; b=Ex41vhHjCXZfXRf3
	M5h5ID5ktYSlPWFWs43rtvcAEPFiAcZDLTQa3MhrKPvDDfxT6f15bqD93gFqQcpn
	jPjh84iD9iJQ9r3PmqdWhleVrOro9AjVZmov59xGcmsrvJbPiIKC9z/rIZRaZv8Q
	YcQFQRYAhLEinnY7YcBCRRXkPhHZ/sv2+aZpAdKn/yr2uejDQAplgtROaEIiTEnx
	DXUWAxGRTNu/L37zlZI3KC7Y7TgApZB5rUj3I/FoXlmtuKkVKSR2Z1bSsKL0AVYl
	K8UUt9VnaZpuE/CGTgjLfCg/6UR88gL9BsakyhxwF69zjJWsVX1arqLoqSuGGJ3W
	UtkLYg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f9206x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so1308559eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183959; x=1793788759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOggzBuXe5PWUbLSzi+bwdNe7VzMo5TdvnBdqMxg6RA=;
        b=ZB0faxePdQDhxAuKylBL55Lr8TW1m1ZF8FetBFcx/pahznBG44AEgneOp/2E/gF9nh
         Tsftkr+CoD1lNn52zDYNk4ii1UcKLR7GOs3wRdm7DJCG097oX8oJfMa1Ij7+ss7Tyw6r
         boarXNvKEB+1WVt0RbuupycPeXsbUf9dMkHD4LvAj4BWRxYLqxlF5rPWlr4A1Gj3v99m
         RSEkWXOP6BIwM/uaVa3qbeTJZU28WgD7wiqW/dRa1uM1N7esaq483lGHOPsVrndZKdP4
         ljPrWQ58ZS9rK7VnZOijO0Zg4EAjM80XLwnlTG6w0gBcvcWXj3ATQMz1eS2F0oWNK+NA
         XXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183959; x=1793788759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOggzBuXe5PWUbLSzi+bwdNe7VzMo5TdvnBdqMxg6RA=;
        b=OUDcjI8pRupQwNfzYX9ffMOPdXRoGFEcaABnE/g8SYbwAEE7LuvwkDW9yVTJtC1tpO
         EZAJPSp334AyDFcIezAFKanGoZkl4dsl3kHxwHHxECpyeS5CMkPyaYKJGATM603iwIqd
         p2dgMebzT9OslyjJkK9KMzzwwJ03Imli6coJL/QjLnU2u2s1olHv6ZHxljf9nNmCv/MA
         L2VUYv7b9U8S+yIpwKFOvrPv7wgRfynYwNreLdo2AId/mEjlRPt8VuyqCYOn4DLtmefj
         wuxTruAh3FnVREnAbGn12NVKcjDkeO4yKaol5vkCTDxZeale56bcJ4XDswkwkVoTJ3p2
         fr9g==
X-Forwarded-Encrypted: i=1; AKwUvBwB8YsA6HhJdb74OP0+H8oBlVdFzjcggE7ggurreK/S1zWiJAgunv6xBF/Xv9r7XZpVXlwQEPiu96Hgdno=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/gzDzO4jXruErYURYJFa/HcxGecSDss/6zV3NWMhdB4HlXROp
	268IRv+P4MYIpMI9MkO9h5/1pCV+wtEp3zdWH7pvPm8pOlucCQtoxmnHAP/KLny3gruAXGu2AAv
	y1+Q/o1mPka6DL+6HFqd6C4tRr7mFczx6MtEXJ5a5cKjjSD+PQubW9Fn8MRBOmhkMCFc=
X-Gm-Gg: AYBFou3TSVnpIfEs5LHHPf+HqlM+N0ZzwXY29gc3l9kokg63ccrRvVT4yHotiHHlSma
	piT6sni1a3bkrs2I/ZFxRJK/45NTKZ6EmCBNbbcTLbrT2y6/C/PYq7Lo0rbmboC4QH9o93p15zf
	eqTrnC1lNE6of8hEaE4FMXBMvaQMsXltYXF/vzpMHp8jBhITtgoUI/TZKCyHYfAtk9EDbPmnfW8
	8NjEAgX676ozPdfsA66csoKJifLMu7NlibwFV4sYYCcaf/UBNswHaE9n/TADRI8QHeGIZCwvJ34
	N5yTXtW9CcAcikmt2uz7sPPmGz9X8Bapqzgyvf1GIpcwp8660oMCgDWPZ0H3VYH7TxoQbPC3UOj
	XtnfweLSPMEPyvC8xzg8+bJmZi+DFGeA4MiBQ9a4YpsVXj7E0ea2qEWqMl7nJOuJxFvUD+1YcyE
	s=
X-Received: by 2002:a05:7022:6989:b0:183:7d42:cfb5 with SMTP id a92af1059eb24-1a6cfa0c476mr3695694c88.19.1793183959075;
        Wed, 28 Oct 2026 03:39:19 -0700 (PDT)
X-Received: by 2002:a05:7022:6989:b0:183:7d42:cfb5 with SMTP id a92af1059eb24-1a6cfa0c476mr3695659c88.19.1793183958485;
        Wed, 28 Oct 2026 03:39:18 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:39:18 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:05 +0530
Subject: [PATCH v6 09/11] phy: qualcomm: qmp-combo: Add per-link-rate
 auxless/LFPS and drive level for Glymur
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
Message-Id: <20261028-glymur-phy-v3-v6-9-1f1d2e565a66@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=4357;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=3qT30A/YMPDhZ+MpLmMclyxDiHTDhR4lXcagSkGGyhc=;
 b=N32otEYMycrrVUbiLKxd65HewJ1OTs55AMU4yQ0Dd2DDTU7AYkDw3VI/Kpri0vyyi4Fhe3i1P
 StPcxntzNSQB2r7dOGUVrW7IgGz3olvVov/KWYKQHF3Y2PhxSwfGRHF
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1d0d7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=tE633ojKFf1lYKHj1RUA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX1UDjhvkyfNmi
 LPai8FoPuudhxQYZj2d2HZ4WxRcpQPPSgGzFVtYL565j3BJGvt0vNQFl3uPQTGUk7G/7KVFsAlF
 dOLJXcHx/AQn82DIArDa1oLAXbKo+bw=
X-Proofpoint-GUID: tl80tvq3lsJtDzSNmSZYS7zDp3fdUKOb
X-Proofpoint-ORIG-GUID: tl80tvq3lsJtDzSNmSZYS7zDp3fdUKOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX/jnf3Lyvbivk
 oJFLwH1+zX/WF1Hv5kjT3LgOQn9TYJtBorzuMwS8doeoJ4d+gt0HliX3Z0pLPbt4wCjYaExgrvA
 YmL4S5sDtPuVqTuMHLnHv5ksfpjxcBmHkoBgy06FH2bL5Glc5tgSACpWGYSsIdQI3zo3VK2H4Zr
 LoVhmjOwEge37WKd8ZvlzxzaDuxXHOOchddJLKI3w57xTyzaIbsBH9cZjB45Xgq3zjyRub8DeJ8
 TNQ8LyHPBESBastj0GtsFFLz+nUVRNXG9DO5StnjNioT8vS6ZVx0rUzTXdM6UI1dKiMoH4PArXN
 f4kY88Irrou9Z7prprjFZd3s5MngQ5ehcZc23arKHmL2NSrdM/akI7om+SF1XQJvdirwKd21PGw
 YTdVQ9HtMne9mOvAptrM4Yo4pn0gG8E/uGiJJ/aB+DbaDq7X7bhL8iitUxvW5P5QAg2TOHsmHDf
 VIFY4JfQQqsfXxOmXrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add per-link-rate auxless setup/silence cycle and LFPS period values
instead of using fixed constants:
  RBR (1.62 Gbps): setup=0x03, silence=0x06, lfps_period=0x00
  HBR (2.70 Gbps): setup=0x04, silence=0x08, lfps_period=0x11
  HBR2 (5.40 Gbps): setup=0x09, silence=0x11, lfps_period=0x33
  HBR3 (8.10 Gbps): setup=0x0f, silence=0x1a, lfps_period=0x55

Add per-lane drive level lookup from the ln_drv_lvl tables based on
the maximum voltage swing and pre-emphasis levels across all active
lanes, replacing the hardcoded 0x1f value.

without this change following error can occur:
- Link training failures or instability at higher rates (HBR2/HBR3)
- Incorrect LFPS signaling timing, potentially breaking USB3+DP
combo mode entry/exit

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 39 +++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 51d7102aefc3..10b3efe48721 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3945,21 +3945,47 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	unsigned long pixel_freq;
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	unsigned long pixel_freq;
+	u32 auxless_setup, auxless_silence, lfps_period;
+	unsigned int v_level = 0, p_level = 0;
+	u8 ln_drv_lvl;
+	int i;
+
+	for (i = 0; i < dp_opts->lanes; i++) {
+		v_level = max(v_level, dp_opts->voltage[i]);
+		p_level = max(p_level, dp_opts->pre[i]);
+	}
+
+	if (dp_opts->link_rate <= 2700)
+		ln_drv_lvl = (*cfg->ln_drv_lvl_hbr_rbr)[v_level][p_level];
+	else
+		ln_drv_lvl = (*cfg->ln_drv_lvl_hbr3_hbr2)[v_level][p_level];
 
 	switch (dp_opts->link_rate) {
 	case 1620:
 		pixel_freq = 1620000000UL / 2;
+		auxless_setup = 0x03;
+		auxless_silence = 0x06;
+		lfps_period = 0x00;
 		break;
 	case 2700:
 		pixel_freq = 2700000000UL / 2;
+		auxless_setup = 0x04;
+		auxless_silence = 0x08;
+		lfps_period = 0x11;
 		break;
 	case 5400:
 		pixel_freq = 5400000000UL / 4;
+		auxless_setup = 0x09;
+		auxless_silence = 0x11;
+		lfps_period = 0x33;
 		break;
 	case 8100:
 		pixel_freq = 8100000000UL / 6;
+		auxless_setup = 0x0f;
+		auxless_silence = 0x1a;
+		lfps_period = 0x55;
 		break;
 	default:
 		/* Other link rates aren't supported */
@@ -3969,18 +3995,17 @@ static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
 	/* disable core reset tsync */
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	writel(0x04, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
-	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
+	writel(auxless_setup, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
+	writel(auxless_silence, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
 	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_CYC);
-	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
+	writel(lfps_period, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
 
 	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x01, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_CFG1);
-	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
-	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
-	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
+	writel(ln_drv_lvl, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
+	writel(ln_drv_lvl, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
 
 	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
 	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);

-- 
2.34.1

