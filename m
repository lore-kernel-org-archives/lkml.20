Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905215;
	b=gQ75l7E+GpLOvou18eHzrgHoDCRPMCFXXsyb+YEJ2FLMeQtePLNkg62uzo9stXd03HSj
	 MajCn5Y/RZ3F0LONRI4zMks1UoEo7FbQSON5DlorFx4rw6oeUjlSZMY7cU8Ac8kqoDn8A
	 vBoqRcQYG0mOlKpKgisyo3WLgOtxCB+UAPMqGurJooKV+BSclIXzzyK9omsr5CR02PTdS
	 SwSMwfmclCdWhrgnnX2TK6XQQtjeVsV1UhDeZcVgIV+UAArY9s3e/qFBSI+hbuBZaGJVU
	 VuBcx+49n3WgxXfwR8O9fUAR7hbUK8bbaST31gTKUM3CAabviUGckVYqQyBwSn9WWag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
	b=rfHVZaPa31ydgdwunIkZuA3gwdtp9JPXKJLJllqwgW+/iVI/MgiE1CxS40/rYTBoanaz
	 j22/lXJ0/xBF0yXNUbkAF7xMeW9O3iBamu3Y3ts11vrkQbJioN72/csFpE690CQCgoT67
	 yFdzQqYYi+wX/fCIWVohBe4Q5PhQVvButi5sB5uWiTArE4hEaNF8tBKzkeCsL73qF7m7V
	 VwCZTzKDC/tABvWsvUP87sjuhI0zcsYmoSwGabJw/kFUsWJmznvBJe0cyIeulxZr8B8y8
	 XiEwhGpocdiH+n5AaXv+cEOKGLqpAPXYrC/K+Ja0moSbVwu36O/OyOALHuD3Jt9OoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrY26mzQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgRakVzp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E858606A891
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E858606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrY26mzQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgRakVzp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8XZo93624144
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=; b=NrY26mzQEiC4p5OS
	QrlLTzR7eu+G0a6BDStDdlA6yyJWltOfruzJ5X9OsWQi/RdQaUxQ3GSY93axuTN9
	xOHelC4J0oZ5xhUiool4Uude2cu6gT0HWJ9um6drPk0y+4gHAHKyBl92cXAsr6sO
	gaHSnuvgB0ha8P9MyjqsuCX/zCJPmbDVIRnvkvqbhmH4SIiW16ASEcXlWq+u28+A
	9ojJOzNMro5o3ojWSuUhM/z37achDooJVyJ6N8tYBjf6r2ajKg0MgsEvusWwXbth
	SdMyEAJ274Ix5Uwzt3oxBjg2nt6+JF/TkYeVkF5756I6dzi5Sx1mpkHD+m+l6i1Z
	s2w25g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rejpc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so4605561a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905214; x=1795510014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
        b=KgRakVzpMfwbA8NSA2GXLqOZAAA0Pi3a3e2prrO6SFcrLj2vxT7fS+gNq1jm5Mb9pS
         nr7+x9jikZ1hAdNsa8zKemRbt0/gqOv3cYSOJHu8x2c8k8zUIqyR/nk/5ZHFIqCPvwqo
         tijL1bNcc4tEzTdKFi+XWJF6MQOnuEZJ275yIA15WD12vVhw8O13dqzLdEwpEHNbJhpX
         cYq0aKGWGxIwMumXHf07dZzwAlX3gAjf5dIHquvy48LhJFmCRpRpboP4erua2uGJM7lO
         T2COuGiBT3JyVF5MrvEqBsU+ooXWhfKJ7fiBBwNa5pL3PEUJDCaREXgtTLfQCk763JNa
         2PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905214; x=1795510014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Fnvn+FZCly9y+j6UpQpnuA7sBLt2ovEm4+H7RVla8=;
        b=jzZOrD6m/lEiroHEiK4aqoC2AF9h2UXnq5B/069HaOSw+h2eisj/MhTPmF2N7e8erK
         dSK7IJCxM8T5GZ46iy15wUsN5/vzb/jNLioaTUhnQkFp4Hu9g+2gPKKjNBRn2Fp7Qe/f
         heGMwm3bH91I1XT+1v39QxNgOggGdzi5Z1t057cIWE+Ea5JJJVfygHhpKz28+nTLJsJ8
         P4KsRNyWK9T8TOTQBRVh0XS6KAdd4GpnPSgrMF0jR0kDWhfLWC7yqOxRMFKZqthr25x0
         7NhwEQ9iVlM49GNWevnKMNrClRodEDdlE91rdUl+C0Chgn0WzsR8ScFRKsmC+8InSgYJ
         SIKg==
X-Forwarded-Encrypted: i=1; AL+hErFIPK0GPHM9qWnFUD3zIrvm4kANYrRlVDkQoKiHMKJFuF8gyShf3gkTUzfNYcGVrL1kVekeoe3aFqENQdQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ibp/f4Pq68kcd/pAX93vlDrjUTJUUnKbghXMGwUrQPpsozxRx
	X2u+HEepGI62RR1YmnLCwUFmhJaDenpVQxBYGKhQwiacGc6Vs6FY4IkQs5qYewQ9Vbx1AenjRvB
	Mv82zUihAxT4BFriRxutIe2C0L4Bxt1h2pye/DjvWtkx7aMO1hdQdHU+xjZzDHHmBvyA=
X-Gm-Gg: AYBFou2gWiO+34acCzYD0g0ec1qo89mCbw3rugk4U6sxa0uOHouVGmyMSucTtJhCZXb
	RhaDk7l19ohUAtGiwT9uhHOoGrZCUawFYNOngr8beXKyGvWtBv8vHQsqwRA+XHzMoI+UwjD7FUb
	R7UyZ6Y854onKM2yG3bt2TZoWOuqi6fJIAyWZAy0ITxg+eNCVLP0cnUJPyl2buCdEcuw6+qfdHV
	1rDm2osbLS21HPndw/C0ybq1tYHxpWStGyqRrJuKHzuWRzxqYoQw7rZDgB8HyZr+7b+Z4LYNfLB
	gq9t4ooQ2v2PQDJUAtAeK8KXiEwTmFp1XB0S4StsH/OZQ9uLxYxL2K5TIA271Dwcgf6kKWG6Pw1
	bfkXrEHgkwCL4CXk7JgweV345itnKsHxZzZmme5lJifhediorcY4k1+f8vaExS+KJTIvkCifIDN
	YgDg==
X-Received: by 2002:a05:6a21:9204:b0:3fa:64d4:c0a with SMTP id adf61e73a8af0-3fa64d40e8bmr7092180637.56.1794905213696;
        Tue, 17 Nov 2026 00:46:53 -0800 (PST)
X-Received: by 2002:a05:6a21:9204:b0:3fa:64d4:c0a with SMTP id adf61e73a8af0-3fa64d40e8bmr7092149637.56.1794905213189;
        Tue, 17 Nov 2026 00:46:53 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:52 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:27 +0530
Subject: [PATCH net-next v4 07/10] net: stmmac: qcom-ethqos: share common
 GMAC4 address table
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
Message-Id: <20261117-shikra_ethernet-v4-7-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4888;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=n+OVBcpYDnfu1RAZNpTORwUsJk5/4Iz/XkRVvIn0LX8=;
 b=U0W33hjrN/xoSEpZUs1mBMAieyrO6ADIruqEMBfhJQAtg9FHals35UP7LllUCRBIJs2QGASlA
 BADkHSDqHYcDqu/Vh0Cgae7f6aUXUnWpw6HwAu6F4RhjdjIjqI8XA8h
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX6O7DPeghVlrv
 +z2mYxZeGhe4pXllI+luUhV3Ei341IATRWIRqRNl+i9We+qt5stBL55s/7lU7CPj+1faMx4P9HN
 GvmLnLxq9D8TzRDU18eZ/djlUhiL4cU=
X-Proofpoint-ORIG-GUID: i09cGQvAUA4ymGCAp5ZLVNTXSK5idiTs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX1Jkh3B7SpWts
 2PJ1gOu+whDPiGk2C5W9pTJlHL0EcAD80A2QTeDfg0p2gIywCf83ZUc3uAuCnpn51iQEis0n+ZZ
 8SVqKYtXo511njGFixvxChxl23gGtpH5k1233NyzXo71sz7gZJGGVMrv26OoV3p/54I54y5luW1
 FaNWyli1k0P2u0T8Naix8UlWmQOtzUrYUnv5C983m6a5rcYx/vp3iUL6zgQyEqAV4atVWavc3eC
 0kluOWnxHi6wEWFSswdRErI78oYQryiEr9DVDvKFCAy/b1yjOM5r0xmmB539sM4zqq5LsMnH5VQ
 Tb5IjygXjsUgmPxvJVMSxhlPNuoM09SD6SzGDRved4Kr2xkGu7zasit6Wmn55vfMCryF3RXsCzW
 1pM3WEnoQR3qqy2KoqYew4Mg5mtQUiXEo8xGHHTlG9sGnPOLLaBlCk2rYoPC7cakh9boBuHumIb
 MkQWvJVWtLCyb//rS9w==
X-Proofpoint-GUID: i09cGQvAUA4ymGCAp5ZLVNTXSK5idiTs
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc147e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=koHM5ydvv4bFC7S24qUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

Several ETHQOS versions use identical GMAC4 DMA and MTL address offsets.
Store the descriptor once and let per-compatible data reference it.

Use its presence, rather than has_emac_ge_3, when passing it to stmmac
core. This keeps address-table ownership independent of the feature
flag.

No functional change intended.

Suggested-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 74 +++++++---------------
 1 file changed, 23 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 192788e00dfa..bc443793539b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,7 +100,7 @@ struct ethqos_emac_driver_data {
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
 	const char *link_clk_name;
-	struct dwmac4_addrs dwmac4_addrs;
+	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
 	/* Fixed PTP reference clock rate, used on SCMI platforms where
 	 * firmware does not implement the clock protocol allowing linux to
@@ -262,6 +262,23 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct dwmac4_addrs ethqos_dwmac4_addrs = {
+	.dma_chan = 0x00008100,
+	.dma_chan_offset = 0x1000,
+	.mtl_chan = 0x00008000,
+	.mtl_chan_offset = 0x1000,
+	.mtl_ets_ctrl = 0x00008010,
+	.mtl_ets_ctrl_offset = 0x1000,
+	.mtl_txq_weight = 0x00008018,
+	.mtl_txq_weight_offset = 0x1000,
+	.mtl_send_slp_cred = 0x0000801c,
+	.mtl_send_slp_cred_offset = 0x1000,
+	.mtl_high_cred = 0x00008020,
+	.mtl_high_cred_offset = 0x1000,
+	.mtl_low_cred = 0x00008024,
+	.mtl_low_cred_offset = 0x1000,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -276,22 +293,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_hlos_setup,
 };
 
@@ -312,22 +314,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_hlos_setup,
 };
 
@@ -336,22 +323,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.ptp_clk_rate = 230400000,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 	.setup = ethqos_scmi_setup,
 };
 
@@ -999,8 +971,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (data->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+	if (data->dwmac4_addrs)
+		plat_dat->dwmac4_addrs = data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;

-- 
2.34.1

