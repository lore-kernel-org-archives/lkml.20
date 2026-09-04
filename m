Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9FC521226
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547875; cv=none; b=qELshU21ksEPfWJwkTCaOcVemRc9ohsFVac3R2JKdQAwNCpAp6DqEHUSQHW8k1R9VMc1GWWQ+n8jxIZRWLZbaNTVYOrk6OMRQjuk5LSW6Qc098J2+hdaNqQ+EK4+nsuXRT3d92CAy7JINmU+gOwJ+ECE9UTfmXhA6nDhT8wL72k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547875; c=relaxed/simple;
	bh=AGd8PVFjejRaBqOqc+Hed7Vw8Z/bsMaaQEaAP++NI+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3n7cwHbzsLjUieZT1iF12NVYw1TzhtRtmC32gLunfQpiPum3bHIsU9m1TJQ4nbaAWj3EJW+cVjP+gc7nAzqiIE9AKwzldaK04DjYDnx9EujAuvopM1Z5HZdNP761PaU8mAVpW196mQS4nV9U6sKqT3bH0YsOOc8uH3P4I7Lz+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuO3GkF2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IfBDkY1L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuO3GkF2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IfBDkY1L"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHoQu014301
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 18:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMSGUWNgzAszcw7Mtld+PV5sp7Qc3oZxRDMjw/JIqg0=; b=YuO3GkF2XdbhUMj0
	RoyNK5pn1JYOAR2wuhJKh9JYihbGxzohBa0BPg3DclutJrJ8uinaS/8XtmdAlRne
	GytVELSeT7SIdXVqBz0lT1sGAXne+3vkALVzRAxdy4pYZ/ahurkOtn6mTAKH3cHL
	rwPavutyQdr6UfhrQ1lBAQ5nDJfwekWEIcXOS6qHxSU00U+PGoWUi4ndBq/9Mhky
	wkWyBfPyTQCEks8aFfzWnKHkQobWk1Jxybjei4ebnuGCu9m7fF72ViGKTEoutKXe
	i5V7r6og5LsXDT8BXxfm7b2t92VIEV1ugB5aMDIwcf603bgqvJijV81PNa0j5fxx
	GzyvMw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00yh6xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:51:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2387396a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547872; x=1789152672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMSGUWNgzAszcw7Mtld+PV5sp7Qc3oZxRDMjw/JIqg0=;
        b=IfBDkY1Lj4+6xbr5U7d0u0cBB9cOjXlhsJufI8fqJ5ZKwrl5qMLyHgG8xfuiDlp5RA
         BN/ZSLYGfF7oJGofLD8OOWnXPUx+MThikUC8LRcOXo39R1m4DBOfj7DD75GTB8BHPG+J
         VjCYGbOd8eyZsgp3Ni9L8/LHwFW7FQJblWlst5lnp9/WgTc8hTfOSzgqKqjASAZR2vqU
         2OgnFd0FLCybeciufH0D7AdHu0fwlH1Y7VWAO+TO4LUSDLtmkHWod7nFKcvHy2xA1Xnp
         vHVV9tnAVmRbgorKw/bjH1fHwwhUELaQyNTIPuGcsRKEYt/GHjrtL2pgH06UgUIJV+Yq
         oEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547872; x=1789152672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMSGUWNgzAszcw7Mtld+PV5sp7Qc3oZxRDMjw/JIqg0=;
        b=RpF/cfbkT9I7tV5mxpabp8OlTgUsLUoJpz1iM1TenJCZJyVIW1qqLwz6dnj2Q8Y/FW
         h8Ap9ixmq6woICmqp44R5yNJ1HTIk0VOSFL+y3OuywB5DV8rEE+ZTnKRW0ygMjhK6dct
         6Cdf+UhJxkGqlbwB30FjIT+mn8EpWqWLJ90ok+hjGSyOCfD0dwIKCkkmWaUqzI+cevae
         GAaawfD+gh3HdxYF0Vpww0h8zS8M5GuCz2WEFGHnyUA99T3xs3ZJGNR3R19T+AcKd0Jz
         IkL5J5NKhNhcwJgLKPXCdAq729034pNQU3vXnk3SNIi30vUd00WGTlMuOaqme6dkJh0n
         VtMw==
X-Forwarded-Encrypted: i=1; AKwUvBz5gHhYNJST2m8nfU3G+UnnOTdgrW2KSVpfcxYznPLeSKi/jaLDan7/qOJ+w0zyfFklo3T8QDSq6q5oZqs=@vger.kernel.org
X-Gm-Message-State: AFuF++lZq4bQ2F4VxhYfqPZ3EJFPmFblQ9hB3K1zVaJj2cozQBqSWyTW
	DHdhWGIOpXzpFO3PtSI6Mc9UdK84tIIXWE4YUPkSmbLzCmMt3M6gRNc1iMWdpExqTjbwz3ljEje
	En5QIeMcwp3zMOjsV9ckeOQVWoh8bG6atqFrNIl05Bxm5MQ4+DyqsqL0d7TrefjZyKPc=
X-Gm-Gg: AYBFou0OWIQcqfeMLzRYbWPSR3QRLm9yIHkqAc7RSr+lZKAxMaWb0+TfF6Qe7UZBWov
	eXrc1DHYH0ln7XtBeTtSJpmjd+MtkNCAsv8rufLwQCxR5Ao5SYSdvddrCeZpdcOyXK5BctknDQG
	+shz8su7hx0pqy/gmbg+nFQlkSWEwB15Qaau/kzybrH+l8IgKYMVuc7GNmzM6OuyjcaQTw/YUHG
	Y/B7qKtIrPpgtooWVR9kAGSrZ477Hz8zd9XdFcA1mLxORvuql0l/X22lNPikeaUX1VYM6KhSY8y
	frsufjBdk52k5Scol4fPqyImgvsNn79DAlV8gRlINcabClahhItP//IAGxR2l8MlwLRUr0rhBM0
	E91H4Gr3ayoPz7Vwew2T1Tm6c+nkDWWk=
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr14332817a91.16.1788547872121;
        Fri, 04 Sep 2026 11:51:12 -0700 (PDT)
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr14332716a91.16.1788547871596;
        Fri, 04 Sep 2026 11:51:11 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:44 +0530
Subject: [PATCH 3/4] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for
 GCC UFS muxes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: I01lyE73noZlkdS-iwhbYV7gdzFiZTz1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfXwe72laloRcB4
 CpRqAWH2Pt/itgT8n/NuDAibfKJuXam8c3p72PUwf7kERnK4KwgrLHqiYP6/qGkUTfQhh9FgT49
 wyROX0IflyefGqPPtuHkzA4aQCLy6TaW7P5XMU8FGdU3eHMfR5bQZH79QQ5xtUfEYabxrQk2vnY
 H0m/8fbWrIJtEM0u2saZ/SzHGWG2//gx8zkREVh4Do6J+0bG6fwnUtIPdgZz2OUJwp56SNDdLIp
 g5TI8Zd6cCSeAN72ke65Ug47bFI75CBp8SqEU23fwtfBDeLcvIRZNBvSuLToQZ924SYlcAWso/F
 IAeoimq0WvCnPWxdKHLN0poVqhG2UiFJzEaOxEBjZ6Y/JNsmnZdExveoIsfduAiC3VVIxR+vb96
 6R4pxHZkSNzaMpHyMDPS5oPoHyvoBTbbtsydtwVqmIsWGkM/V82E58F3spVN+h3i24dIchakjs5
 B/QBl3M7k0A8V2PCItQ==
X-Proofpoint-ORIG-GUID: I01lyE73noZlkdS-iwhbYV7gdzFiZTz1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfXxDMMI6yynPsP
 2ps8UKO4MaN6OQL2cdJPS1NXNPclN0+TVEb+A/eUyo3TlZYHs2EHkk0mk+3oE3CQ01SZAeM1xtC
 J7GE4J0AQxGcbpZWG0xyL733HlAcH1g=
X-Authority-Analysis: v=2.4 cv=eZcNubEH c=1 sm=1 tr=0 ts=6a9b1320 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dqVVpOBFKaflNhj4CZAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040172

Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
automatically switched to UFS external symbol clocks during enable and
safely parked at XO clk during disable.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 69 +++++++++++--------------------------------
 1 file changed, 18 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 2ee4820b6fdfb1ad2cdb15366cf746651fc1a36a..a47a2c6b961ba01edc69be91e299a190f4662c3e 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -481,36 +481,6 @@ static const struct clk_parent_data gcc_parent_data_17[] = {
 	{ .hw = &gcc_gpll0_out_even.clkr.hw },
 };
 
-static const struct parent_map gcc_parent_map_18[] = {
-	{ P_UFS_PHY_RX_SYMBOL_0_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_18[] = {
-	{ .index = DT_UFS_PHY_RX_SYMBOL_0_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
-static const struct parent_map gcc_parent_map_19[] = {
-	{ P_UFS_PHY_RX_SYMBOL_1_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_19[] = {
-	{ .index = DT_UFS_PHY_RX_SYMBOL_1_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
-static const struct parent_map gcc_parent_map_20[] = {
-	{ P_UFS_PHY_TX_SYMBOL_0_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_20[] = {
-	{ .index = DT_UFS_PHY_TX_SYMBOL_0_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
 static const struct parent_map gcc_parent_map_21[] = {
 	{ P_GCC_USB3_PRIM_PHY_PIPE_CLK_SRC, 0 },
 	{ P_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 1 },
@@ -907,47 +877,44 @@ static struct clk_regmap_phy_mux gcc_pcie_6_pipe_clk_src = {
 	},
 };
 
-static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
 	.reg = 0x7706c,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_18,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_rx_symbol_0_clk_src",
-			.parent_data = gcc_parent_data_18,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_18),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_RX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
 	.reg = 0x770f0,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_19,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_rx_symbol_1_clk_src",
-			.parent_data = gcc_parent_data_19,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_19),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_RX_SYMBOL_1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
+static struct clk_regmap_phy_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
 	.reg = 0x7705c,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_20,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_tx_symbol_0_clk_src",
-			.parent_data = gcc_parent_data_20,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_20),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_TX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };

-- 
2.34.1

