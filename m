Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA744F30F3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812661; cv=none; b=myGq5P3tFX9XMbcz2q5us+i0nupvLiz/rNyBKYRBRNUisLQLnSVOqQiAbcjRybrEN6zknwtGY1I65TIkoI/DfhThsFUPZtI6b1A2P6LXJGtXSmQ0+RUZu6XDBRFBeYOCS9aCFeqEgBn1Z+POXkptf3uS2z0uL7qIPBxVyYtgWcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812661; c=relaxed/simple;
	bh=AH+qx0x4KP0Ub7IhYEI/kkBrCs/Qa/fQa0F1JhH3QPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dca8YoocT7FtLsIFqs6NNSEVzuRTl+GrvSIC6ecWjRwDe14gRW0KJgAA4C36PWGI2NSSJyr1iYnCyPThAi653QgFKnxLHoVSe4ozqsL7cN2/UZfZuqkNZfBveL3bN5Mnn9DRvI8mwNKrpImjWaKOcY8bHk73TvXCfyNYTofER88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7lD6MeY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MexD4V2L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7lD6MeY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MexD4V2L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7mZg3484612
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Az1erGSnETLR/YFXkBczCQXpiybLwgDvwwIrMae0ihw=; b=o7lD6MeY26M1WO8v
	9ZKqJ7uMQagH3gzeQUnBdtWxeQ5RfAP5np2R0w16jZkuPezpH+PTHTAp6hgECdR7
	7/8u3EzEwe+XVZxcPYjXTQ6V8acwYo7kNQWU+D4ZgB3ymzTwQW03MrT2hshiLFY+
	wuomhCCkDFfYTt1l/3uVhiB9ilBcjpWNp2t9eyy5jYXMT4W822v8UeXr0Q7eFii/
	90q90l9ISJ08bfpWrXyuv73IMxPOXr2eHwZu+ROOyi39d5gy7QgZdYNjOBVWm2ls
	3zh+hpSyWIp6TjRMvN8gWoJ4i72Fl7QFcjNMoTwSy/WJ1UbmEvDLgAd2mgicN9Mk
	0ekCDQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty2588-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:24:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso7225835ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812659; x=1789417459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Az1erGSnETLR/YFXkBczCQXpiybLwgDvwwIrMae0ihw=;
        b=MexD4V2LvqXnUk4MUfN0PS44nPiTLdFSEWNwIw7aChgZbpq1RPmaQmzLh4+QKvhH/G
         kFfCR1YSO0qHP+065gDqQz+oMQL/Wb2Elj9QneNSe34AWJJW+42LgpTri9fDyGQVBVxz
         GjW3rlXglh0Xdjh2OoqtqT8fjj0bitEYNSuWZmcrVtPAj4uuhHkboDFsQZrINm4ONhsP
         BiUk79gjrgY82w5RO7rJNdsG7mK4ZiVTNmtkpk0dAb3KeK+xge0xGBUvup9o73aUyjop
         pR5LATEDkR5JPF68C/3Gv4IgbIEhUJxx616KDVkw6bLPNLHnVSLEjdkd4CFnkz6E2Gm8
         Hm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812659; x=1789417459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Az1erGSnETLR/YFXkBczCQXpiybLwgDvwwIrMae0ihw=;
        b=eBkGQOCOODkKAv0RDrvvcH5/MLKDscMhqGr3W6w2CQx9rL8V1Lu0iK+bbnZEPW4K6e
         QNnrwpG3ZEbTHPKztrP3hpnPDAA8W3QFKy+ej+fumoKM1po6letJVANiNOmVFKUE7OFx
         l8fgw9aMY1wpW4E5c8mNgoLUJp4HvvqXdTze5ppobWwIdOW25IA6k+PPpDLtQlXQY1eo
         z3NVlWWr4EaO5RqrZ33eugYQ4qGUBj5Pl2+UqQhaY93s+N0JbxayHHd0AnYHFKC+DQWG
         6gt8rduq1KQ8a8/xGwIYolxvPW8sxCrHGJ4urdmwSDhJQTr2MtEdoIHAwyiN/7K22f0b
         P9sw==
X-Forwarded-Encrypted: i=1; AKwUvBwX+WA5ZsyO2hzrEikOk//c3Ea/CRYxaNpO+ICpRwpfvC+/paUV0r/uZJAGHu3/thZPTn0YnBhadyqpceE=@vger.kernel.org
X-Gm-Message-State: AFuF++m1ccm2xaQidnIF0bwPeb5FqhnNQAoItsKZYwaH4T/OxBZ/KwRL
	VDiWThwRB1StS1u4vmFimvyWtgtIMNzPM3v1As74hrnmzaKRWcMHLCaC3gL7KJcRQRKkF2nx8RP
	MceC57YXpQmS0X3g1Z3c+56KtnsQyeQZBCuf7v4/au/nhWyxHXslyjVEvWaafixooun8=
X-Gm-Gg: AYBFou2Y8t+//AS9fOa7esLE8rZJujaDO8hcMhuMsBGweEhuFwRaT/5ka2CB3IwlSMt
	5792kEyId3ylvHbQoQ22HzRzSvvqdg97C9SYzh1FbOVgaLpRzuMVVv6Cq8asHfZZ1ugMQRZx9os
	xom++IhAsMjiEO9DT//khMZVZZHV4hhLTiZWB3NziCoYssPoCLeRPDBRaSdtLdkuvGMMLDf5+8o
	EBFo7niwIiEeIhQVWnsiYO7LvDKoGgSdgPlnH5hV3x9R6tPlZRZair+TxQooENXSWH6mp3Hzk9R
	K/JdJGiZqYJtqkFTFSIE/ARK4pWQb4eHuDnZFF/kRCxeB+GH82j5vDy5wBFmdif2hKPaEKfwt5K
	HrUywAw++mJdE1yRnM+3KCi47e83GRg==
X-Received: by 2002:a17:903:40c6:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2db1286ae13mr343732885ad.17.1788812658776;
        Mon, 07 Sep 2026 13:24:18 -0700 (PDT)
X-Received: by 2002:a17:903:40c6:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2db1286ae13mr343732285ad.17.1788812658328;
        Mon, 07 Sep 2026 13:24:18 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:18 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:16 +0530
Subject: [PATCH net-next v2 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-4-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=1916;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=AH+qx0x4KP0Ub7IhYEI/kkBrCs/Qa/fQa0F1JhH3QPg=;
 b=U5M2VtaJtZnsRmWp4CktPyNR78lRXabNZ4gb/HF6l5Rtx7QqP9hm+vavujwv54agyXymDxysK
 jc5fEfZKW1GCvBMrlVtVw8Cn0R+P4nBWRzKjVpV/PEYH5ZGT4L5Xlkq
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9f1d73 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Vjzh3eGJV6Wj_RHhdNYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: peJbxk5KpDXsmm0bDABxONJFvxr-1n1B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXwb2VPNJqBhh9
 xR+rOpsWJ28hYS3wFGNntg8f461hs90DHp5i7UOjad1j0Xd+YaMuOFw5lgzqAX6LEyDYhWF8HB9
 5ngDCOPvj3P/BneNt3m034rZ08XHBP8=
X-Proofpoint-GUID: peJbxk5KpDXsmm0bDABxONJFvxr-1n1B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX+NS3X1edpbzJ
 brZaoM4vNNFJomQkYjvJyMeyZiKatIGTJzggKs2fjitvHWAHwdT0Pri9hmpSviHufNIzjqV8X2O
 gbc4c7hTTYOiChJqKEvDBLzLgc0doRP15DlEjflsv74RdUQyU0xtp2NMRpiMPdi/5QN2FGRekV3
 CXWeggJz1UDdiu0pwR7pztv21DUpcqeH74uBs14HC2LMT94/WRhdugELau0PWfVCLO7hJOm3yrh
 D3EXosPzeIqZSWOZhK2N1CC/Sx43WY5T9rDwH2lyL4vehLbgGUXsqyNpUQNZc+2iG6RkNCrx1UR
 BQAw1+e4COvw6RPcG0p8Iz+pShGOO1C4oCVt/+iCampehmTF2H8+WwHKKSQ8FsOz6By/0gdolk6
 uurbafkCgR5n4MLv7QadSDmQ7bvOBjb3rG7r6y/9lFvDQFH/AyPxon4G9t9rFV+wG2aEu/BSJ11
 oHbb9DbNeiKZ9IBidoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..44270c25d874f72e7f971757fec659d36468c315 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -479,8 +473,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1

