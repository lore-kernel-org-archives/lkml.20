Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768926;
	b=jwOwVSX0Gj8TBSK1wHzkf95P0aWDnmWfNyd/3bkmT7xZHKoIYBUAs84J1mx3uNNRAPnJ
	 1jzqrxbytozlyE2yD+1CRBSl0N0EJ+psoGXcvQ1AT0TJjnGV9ox6wmh6Ebmzz3gvnmFoU
	 4juJFil7nB6v2d84k+s18NKZk5WxmEiXz1vhQn3/U7xQ3ShYQMCQiXSxm7/n+6vt3JtK/
	 IG53aKeWQWgKylAgME++Zgi8hzej9bWOpb0s0SLJ8LGQFrxQUCD3n95Q0kzAQdrg1Gaqj
	 Wb3v7InoLaqMumfhHjpl+wDc/n36icNrjeYEZP/Q80cnn371t5xberHs7ldVC5Y/abw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=;
	b=5b7p3EU6Kro/047XolQ3IyBdqQSXXDUOXQa1hK2bg+hDfblPdcLWI+tsY34sVob3BPtJ
	 C7vYgYP8ZJ+y5W7m8E70aGQqWXInsHGsmaFjIz2bGpzpSMvuN2NFp6sIAii0SU+VTApMm
	 ChQT50ueBLCfcQkQuOCYV2SYHjeSprFpSHcmTHKhZLhYDc3Vhb6GKo90J8rktnAuX/sWi
	 q2tSLEmFYeF+kmdocHSmrTf8zZGtgyPpQzJmA+ecSWU52SsLvVapHUIh8wY6CcanvHd6j
	 dlcRtTsmHsrCBKuOXEcV7ZpQqcqjDoR+PnWS9Ul2LR2I7/z/oQEIClfY0ZN8afVjc0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dApBqP/z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BlADsDN4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4999606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4999606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dApBqP/z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BlADsDN4
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RQWU222290
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 05:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=; b=dApBqP/zi35tWyBL
	GnwmcjMiUGY9Ml/e2dUMzlQdO6JiAx7f4Ia7kPSN3Twv3LhKRhMh0fYyGoyTQjjk
	NVrc5yOLsHFbIRUsQNHrkxuS0SntNVgpAYlq8hAV/mE1atV2xGJIOWMHB9i7MlLB
	0d3I2NDaZdEw9uj3PyUi+f3CfMthwPv/U90HJIaN34EDeTVH7KEy3EqgyrYK5rV4
	9Thwyx6iHTKrlnTrlXKBMR1DyLOafcKeVTiXfvxi9UNGHgEubnxBp1IBVQTNSKgO
	2hKuWvApNqeDRR+Ou0z9YApcWGvn0E07eJtHd2nzuKdukXb3hA0cjvxTjfJraUw3
	iKBQKQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubjuag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:08:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so438991a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768919; x=1794373719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=;
        b=BlADsDN4582YFRMECAWD8NFzFQdF/5luHLSqE5szaLWLVrKW7ydMU4elpvhcGcB9h7
         vVrT4EBRS4Xvgly4GyvD+Ze9XYYC2/JGdstIoRhNfj/W4Xzg1DqqYR0IpwdgNQihjlYx
         DMpeK6nRSX1iDyWS0Hee3p8om2GTDoe7wRqMgq24zcza+RNlP3ugrbb6gU5QAnMT0xkD
         GydSTLYpAA9MMKGv7AZps9y0hBDoiojq3QKrjaqWf/dTHGGV79QO4eeN539X7vPmUwmU
         q3AxcTpTB2YG6mqbF/4IVS1kuujncSDt/sW2K0hIeoYqHxrJgaBgv2IE/+90ChqoVptV
         VamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768919; x=1794373719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=;
        b=DmQ9etsS80Uu3xBQU+aVAzloikpcaz5+XJygjcQpIu95J2XoLIoWWjwksBo8gMChgI
         Sq08zt1P+cJfcauEtO8gvPLJznf76LyKjOf1xkZMlVaVImS0SgkJZ0WysDBNbHGToIMP
         lN535DTkdPHZ74c9cfOgijPD3CEsuMNoZH0+TQkmpfm9r/i4zajAf6imWc76j1hfPHrp
         aZzQokWqnXRapb2f4G3TUSE16BBnBfnAPt/2uN6C+fHa7RZuwUhUTZDs8ahp2qzGBDp8
         jiWZ2fNcmlW8pWwRgVFy+uzNowNBXVBoE3fcToYJEw0gQ1XN5+5n3ZYangJQtcTGa7Ln
         o7CQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpiwc3jyPUqRNe9v5w+sj0XYHG9QT9XhWz9nFJ3QDINQR/mN+jsgxanNDOY1eXLjA7eItyF/NOn2RAXT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E7lWpcBUF+N+CiqreMYS64UkCZ2Pt0iUy3jMw/eh/tToO+76I
	MD4ziTucQcj2agikuoIFpMWctYFCUpQ8rMEoO0jQyW1VIHXVjApItvS8UnQyvITTu2RCgg+7xWW
	9GW56Wxeep4SL7LZNONl7dmBF5roCmlNCowqeeuqpgNe+kH/io9Al02BlMHpwKrlTCdM=
X-Gm-Gg: AYBFou0cn6FXLK+RsGgPIjThBqO7ldidrYEBujervxbdkDudFL01l7m+pkmLpkb8KKo
	I6YSWfQwoIJVUuvJORKiVuiH08cnSbkb8iyu42oRT2Vb6N5BdM8QrVpxbTSv14AFdLkXZpcJamC
	qMpVxa9VAzX8ZwtoGmNtiqoyeFMJM9IU4GG6tNaorSsj3RSECmZdhAu+eT35Z7mSEfeXhB40kiE
	IkLhUndHkrSLzG8H/ghF7N22WesOTEqzKr4WHmn60rM12F3dRTfo9huk2FqCaKdr9tM6+egEwqL
	vUx0sCNpTNSsfllue+34vUoVIdKxPUwgF/I9EOnEUiQC/7Ddc2OoUDNAoWB+86qgt/iZILAZVo9
	3ocx/T9+Z70XSq/0UTWquBmevWY9QyEP8Q4Quhfp8a9fUP1XfmDMutuOv2db4IA+dJdAgKUFJ1K
	Edyvw=
X-Received: by 2002:a17:90b:2891:b0:3ac:a11a:7c8d with SMTP id 98e67ed59e1d1-3ae897d5fb3mr11245273a91.59.1793768918369;
        Tue, 03 Nov 2026 21:08:38 -0800 (PST)
X-Received: by 2002:a17:90b:2891:b0:3ac:a11a:7c8d with SMTP id 98e67ed59e1d1-3ae897d5fb3mr11245255a91.59.1793768917849;
        Tue, 03 Nov 2026 21:08:37 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:37 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 10:37:33 +0530
Subject: [PATCH v2 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO
 clocks as critical
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
Message-Id: <20261104-glymur-av1ecc-v2-1-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfXwfcW0T70gLF7
 KjZFZDTjJF7PShb3MqIzzkVCMJfk1NCO13S2nzJHrvaMjA18ex0cPdpp1SpVUcdCvTHsPcINjov
 Hg9IJlBjfDuG8p0herztnq8xg2xNde8=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aeabdd7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4K9S_alWPkThguqFwX8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: IxVlipWueUZZu0Z4U_3FoH_7qqmWNxXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX1/e4xSgtJIjx
 ab1U7QeYk9tyFQR1Dl3nWpvy/98wkAsf5K0p4F2hDo+tmTB9pnqbrJ1X+XPi9GbMxCgeixl2jdt
 movXqPUdGlRZvT2CmP+DIl80FAH+tGEOrlIM1vJ5E505irmCiYmwvjJnt3honoBRNLZP03/DfbZ
 sCFMF1AwzdIz8YD1meoZUuVdoz6O9Oipy6g/vWGmITosWP3/ljh9E9dQrqLCrckQmYHnXQtjpW/
 f1Sr+uWwKXl/LeRHhATCd8gHDYEan1dysM9RzGXe1GP6ehMVs9ytNSeSw2ZThQhbZVXbo5uan1T
 CJMDQ6QS+Ql/LSE7cysWHJBjZJyOUe+qcWe7Ie/QCdvHvXBar41LbRxSUYJG8sHTqc2D96aiH2j
 jEUBe2UuCxV3BLOch8cu0QBKbHMnUn9L4CtiqUu8AQ+yfjQ2eiPWdGUMqC+tZwjZ81xk9x3rEjU
 GzTNZoOW3YpW4XxwZ5Q==
X-Proofpoint-ORIG-GUID: IxVlipWueUZZu0Z4U_3FoH_7qqmWNxXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040020

The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
Hence remove their clock modelling and add them to the GCC critical
clock list.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index be18a555fe314a41e5335ce8cc100ae8ed226ccb..9418a9b2bbde4be8a28b6ba4405baa780de654e8 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -3373,21 +3373,6 @@ static struct clk_branch gcc_aggre_usb4_2_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_av1e_ahb_clk = {
-	.halt_reg = 0x9b02c,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x9b02c,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x9b02c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_av1e_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_av1e_axi_clk = {
 	.halt_reg = 0x9b030,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -3403,19 +3388,6 @@ static struct clk_branch gcc_av1e_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_av1e_xo_clk = {
-	.halt_reg = 0x9b044,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x9b044,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_av1e_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_boot_rom_ahb_clk = {
 	.halt_reg = 0x34038,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -7915,9 +7887,7 @@ static struct clk_regmap *gcc_glymur_clocks[] = {
 	[GCC_AGGRE_USB4_0_AXI_CLK] = &gcc_aggre_usb4_0_axi_clk.clkr,
 	[GCC_AGGRE_USB4_1_AXI_CLK] = &gcc_aggre_usb4_1_axi_clk.clkr,
 	[GCC_AGGRE_USB4_2_AXI_CLK] = &gcc_aggre_usb4_2_axi_clk.clkr,
-	[GCC_AV1E_AHB_CLK] = &gcc_av1e_ahb_clk.clkr,
 	[GCC_AV1E_AXI_CLK] = &gcc_av1e_axi_clk.clkr,
-	[GCC_AV1E_XO_CLK] = &gcc_av1e_xo_clk.clkr,
 	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
 	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
 	[GCC_CAMERA_SF_AXI_CLK] = &gcc_camera_sf_axi_clk.clkr,
@@ -8483,6 +8453,8 @@ static const u32 gcc_glymur_critical_cbcrs[] = {
 	0x32058, /* GCC_VIDEO_XO_CLK */
 	0x9b004, /* GCC_EVA_AHB_CLK */
 	0x9b024, /* GCC_EVA_XO_CLK */
+	0x9b02c, /* GCC_AV1E_AHB_CLK */
+	0x9b044, /* GCC_AV1E_XO_CLK */
 };
 
 static const struct regmap_config gcc_glymur_regmap_config = {

-- 
2.56.0

