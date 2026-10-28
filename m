Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183956;
	b=zRGWGplQfeLhJJsO6W5d3nxaKBnnCfyxgbv4P5heRi4Ym8ialS8ptV3RtsB0H0J92Gv1
	 4+WwHy5r0E3pU7CpwtUR8Bmk41ojPUVOtRX+M8xInUMTt+ok25vEfFYkGYo3idySQFx+5
	 9tUTMd1BVuKP35pU5g6gWb9bGzSi2pbx8P0Qs8v37exrEHj0kPjZt2qKBVYslV8SrYWbs
	 SNzdopWGVr/tmwcczh+khRJ3XwYyzwjIFOoSSB5TdHF53f54jyMjIDv3TmEKiLDRPZ+4P
	 Y+lnkIqIHqpIipxgtakvJ94aVPow8s8fSa3sU+PBbdgmE3bbVMt9OPpsMxZ7ov0pg4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aD5t7JOukG95iTHOP3pJ3yfvTJMi39Agt8nuM/lwlqU=;
	b=MCogtlI2gfaJLknLK4j7OuuEfmigFezamMhTVm0L1SQeZ9BiyEPkPSDXtdFfdx4rHk1i
	 /skevLrFztRBx6eRDiIPGbRu3trqteTEHq9Ktxnp33spANv+fmUdZXyxMgLEI9KysJneS
	 6oXpN0u5zf3IxXwiZtPJq5Dm9eZ0XraeQnDjRViJgv1r1X3Rjfz/J+2wZzzo5l0B6S45h
	 cJhtdqa0yaxSL/OaVEYPLqefESPKt4EAqF2Xi7Wkf/DRyoHc7avcUeCLMtlUTCnlAyvpN
	 zkL23JZGJWBTOkLjyA2EEj3HRmC04UVqRCXHI2NRgSjI5p+tPh0gQjOlOzIEx0DFZHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ss0pvhSg;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="P5dGDw/e";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50CE606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50CE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ss0pvhSg;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P5dGDw/e
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K3J71167675
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aD5t7JOukG95iTHOP3pJ3yfvTJMi39Agt8nuM/lwlqU=; b=Ss0pvhSgecEXLu1v
	Cs0hyMGOf/utTX+HF5iH2Jip0Qt1zH9F+cOgLbxlpykKqD/CHFF4jKDneGU/QD6v
	P8A0A+Vkun5uSLl28p9qgTidjLZA3Tc92lpZ2MQ/0HpqXmfJ267OlZOytxgEBisL
	gczbCrAXoq5WgU0NuPAb0FnfptHn+SDSd9LbX21df/TBFzVCQfti6hALdNfRjhbJ
	pdy3A+BLueTRtbF81zJ1eZJLYv5z0Yamwr3FqmDvoDfJfdDvFQMDUfi7NR0/2Vhs
	81RQ7sRhbH4iPB4HRqwTY9tQHb/1mdY4ztJ5LQnkZhxUZPyjJrJ7u9Bnn5vGCrpt
	+/qTFw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7hs9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:39:14 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-193b5eb133eso1040764c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183954; x=1793788754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aD5t7JOukG95iTHOP3pJ3yfvTJMi39Agt8nuM/lwlqU=;
        b=P5dGDw/eKVB6uz3dCAMb6igAnj4tdtQBCBpCwEt6YI6GggJ4gC8dIuS4s9v61QnfD6
         yBTMpcJv0337HuLnS5Cfs/W15lrjojZy2gjz4i2BjeBqX0yFrFM+/1taXfQ18iPIL0CR
         0HVi6Dr429ef7xc8RmmAIWSJz8CmL4fuhuOVVyBvS+2ttNvl/FXa6l8yrlzswvjQVT3h
         NRoo8D8nf0QYmb145O2CWiUcrE9gaMwpnqrCHjoHTfAazOT4jbO8QuG+eWdXRYgy9kMA
         NBOVqWH6R+bTTlNLV3NDQn9RTpkeJcLiq24OZsoP1DWCOFiy+RM6XtpnSU+AAe/lRugI
         j1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183954; x=1793788754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aD5t7JOukG95iTHOP3pJ3yfvTJMi39Agt8nuM/lwlqU=;
        b=FG6jD5syZNcKftWHcbo8ddnwF7sXlGsDK/pRp3umHEwCTfQcDxGzeRlESRwFNwqimX
         vVYy3HhUset3K//8QZPAwSCpLyMwfQQDlrpHbo/eMkNxF0FzIjhMGy40heU2P3/g2Svq
         VEA9R4vESdgmpDcQ6Lo6nMOgd7BRa5j1DrGYHFc+44t5Xl490koVb6oWR1MKZ5xecYiI
         G5Z1g+9tI6bbD0GlcybbTnJ7G7ITiCq+VomxzyUMeTZedBi1eZseeNjmmj2P8qShT5Oo
         x7Xvz8eh8vWCTznEu9ZKP3xKLF3L8vD/5lqlVvPGNiCcwyowQAliruoAm93VanSmxI7l
         WuiA==
X-Forwarded-Encrypted: i=1; AKwUvBxzdsx20dMqsTcdrcx49FlcpWBFqeo13coLY/A1TgDYGqCO1w/4ucvZX9kufmwPaU+R8rqxIt08IuQbDHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfpx6CKDCXZk1XRco1fgJeSm32JHAOfE2p//XlNTqxChDqijfI
	d0HmcbLf3nL8R4vXVHI5J3dfUdQMbBQiRssCcMLIzY3MCCmCwgjAOOH7ry0YACGRnJJmqD00Oef
	GikGMu18Kk4Qj6K92m5PhLuvKSScOBaBdZayl+ywij7KpjeQeCdMlU8oNUVOAFaEvlbM=
X-Gm-Gg: AYBFou3LJe4Q14v+RA5wAAIm/Pm52kb6+EWuXjOoJ8x5S8kTtNLCHNcF2uCxExuOVVC
	eenXsOQFzE03f10SzIUG1mGbKIW+Pq0DEUNLTf5lNwNI1SOUSMgxYCMo0SD06MeRtIozTl0htaI
	pJwS7/mbXYtD5kVmk2JWUkYedTQqw+QAiUf96J0C66E9ywJVwCIkVozw3cCLN1QNxNtiv/A4TH9
	AX7reHG86FjuM2zJk/w9m/5peeGwKBJi7OiYhDVe7JOtH7JphfCFCmVmzSBWBLsflLqHBtYwD/A
	ySYsJCc8812y0ToUffM/xUXsFHtp0Z1PGrhrx84Ag5wa7qnfCkDz/6NtGV/UtfDPnB/B0SOKqn/
	t03MX0RluemAUp1Pr3F4INE26JqhHBSeniyOS1JM9ysB2Dnv18yBCzi/MFUECNL6xRER6Wl7OlJ
	E=
X-Received: by 2002:a05:701b:281b:b0:153:3c50:ab85 with SMTP id a92af1059eb24-1a6ced8ff93mr2501440c88.12.1793183953755;
        Wed, 28 Oct 2026 03:39:13 -0700 (PDT)
X-Received: by 2002:a05:701b:281b:b0:153:3c50:ab85 with SMTP id a92af1059eb24-1a6ced8ff93mr2501389c88.12.1793183953086;
        Wed, 28 Oct 2026 03:39:13 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:39:12 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:04 +0530
Subject: [PATCH v6 08/11] phy: qualcomm: qmp-combo: Remove VCO_DIV
 programming from qmp_v8_configure_dp_clocks()
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
Message-Id: <20261028-glymur-phy-v3-v6-8-1f1d2e565a66@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=1790;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Q/gqQqFFXIemqSvwDZ0I5cKPziAiAQ8r3AkT9pgNa3Y=;
 b=AzC7qd7YSqM74rPddg0ipPk778IkLrfnxikkG9XEw+/L0uEJ4ZAKerTdE37hMHnsHUO81GcDo
 0UEodpB0TolCzcd87VUjKukrx3dsYTo6OC/41WpDx8T/vwOTfD23PNv
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX3mLETyCbgHlq
 uzqT+AB+cdDNsyOz79CcK+rKBT78eMhbomNkXaZNYY7YDXs9CU96N4DVUXjM5k5pPztlLlJLNrE
 y7Mw3/A9/1t/uqygUyrPjJSHkALDBlI=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1d0d2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=VniZYPIeq2n4UU9-3AgA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-GUID: wYZwGIX6X548x2-336b7P5kHGnOp6lO-
X-Proofpoint-ORIG-GUID: wYZwGIX6X548x2-336b7P5kHGnOp6lO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX/4AU4BsJj1VI
 cF+FPEFspcbPRzTzqH4Nn6xkIjJu7yn7PV4MKRrXfk+CELhgq/TBwLKe3e8zc7TgOx85aTbSLjV
 /VcpKA1yYuDrQVIMoi1EHsOtEEwqrPRQR4rIJxfeJUqRMaOtC2NH4EvbUDrmYy5n6vaoSsLlWV8
 uKdt88u/7+WptLEpyUKDLXVgxl1IYTVwNKxQep49+wP+iQt+DGx0n84YzhLe3yWZMEDWxs/vJls
 VXMJsfTHjhTpmeEau7D4lnDb+p9EItvxdmKSkvMntkFmtB21B1+HF5nf89tMMwKFnUTOHIcFyHv
 JuXzNfJLZQq2FQwFyr8o0L3rEYbqe+h9KBGmzDqjavF2D0PzWK/aMDiT1rSvcsAruzhlbZbbkIa
 Uc7+WDd6aFX+h3KELe+fI2Fz/ykSdC7FawztZytB8kqAP0uRJVVdSkIADEpAxDVHC5wQ2gFHLWC
 7CtigUGDGO+rUGVneOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

QPHY_DP_PHY_VCO_DIV register does not participate in the
divider of vco_divided_clk, it can be left as it is- No impact

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index ff7f0293638d..51d7102aefc3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3945,32 +3945,26 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	u32 phy_vco_div;
 	unsigned long pixel_freq;
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
 	switch (dp_opts->link_rate) {
 	case 1620:
-		phy_vco_div = 0x4;
 		pixel_freq = 1620000000UL / 2;
 		break;
 	case 2700:
-		phy_vco_div = 0x2;
 		pixel_freq = 2700000000UL / 2;
 		break;
 	case 5400:
-		phy_vco_div = 0x4;
 		pixel_freq = 5400000000UL / 4;
 		break;
 	case 8100:
-		phy_vco_div = 0x3;
 		pixel_freq = 8100000000UL / 6;
 		break;
 	default:
 		/* Other link rates aren't supported */
 		return -EINVAL;
 	}
-	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
 
 	/* disable core reset tsync */
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);

-- 
2.34.1

