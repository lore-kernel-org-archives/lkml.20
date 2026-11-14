Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678900;
	b=pHYRp0Ty9D4N6GSWrLubwjnFRIa9ASX7DnokN8OdkD+Qd5E0C2BoAv4iQ5FgNwez6l0a
	 Pk7Le2g6kcOO+mLQE9WquCg0r0GtMQr4vm3/OBzkhi/gEV/8nOeHk0sw9f27YV5cqB9wo
	 fiJiPRFsSdHukeZRzqEvCgMZ6KilfuP2Q+zni9fg4g0dlpmCDSmahJx2s7mWQAv3nfAOG
	 /39vLbm5Tqa9538/YC3zgaaSNf7CaxwQOqnjniw9VJCu2XZ3PbVRkgBnEXyHkjgI5b6BE
	 LsgViYTcMf/BHIPtuV4puF9Hed+lwFAIR3HVbiFJfLLzl/QTH/AKUni8a6LQcrmffkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=;
	b=J3nwNUxdDEM4kzJ5zVoMnrE/xfLvbhLhzXus8tIlUG3jGvm92L38tV55r8UhbQng8ZU7
	 kXiaNMZqbn0Vqb1LNJDkj0LTwySQhRGJu6IZtO6CNJSYzOFnZXklC/rrgx9ysw718BeCk
	 Dh+gGmPh4qoL1+K3CtFFWAsWXGfHxRPSkEWXzNgfpAaNDVtL2O+YFXEE8kyRui6g5/rY7
	 YvwKj0gxTqHZfXwElEg1ACzdszRdaMUVP1Dk4T4sWveUCpZKQE+2sxC9CbPnMiKPuMa7F
	 CWJWCTlO1aP+lStF6NOo7nmyoiEIFLlTrtdlCHMxEQhpPFLKj2Xx3uhZM0OZ86GzuNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9BOlHNI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESLBgVka;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BAD606A8AB
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19BAD606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9BOlHNI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESLBgVka
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEHp69N426034
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=; b=m9BOlHNIqLAo1BZK
	6OuVEt8QYlY6rUtJOAJ8jJaNRaffF37q004zZkVKHyEKHQKfYkod1Ozvsx6G1Prb
	g1+6ZGHsR4YcpyeotoK2oGK3AtuZKUz9nZR4/AFivYrRkLuk7yL5755gX6J6vMdg
	8zYFDChPoAk5jBKCbHrQxL40nFm6K/MLGZ+BlzeE9+d5xRm9+ybUVTf7p1dmwkGC
	FhxdFxiDtHu6tcrhTTX9sLEAOZHrTSv1WoOiyHFPuPe3M3Pr3EfPCGdggLdiE6vN
	xUp3k0pRZ0oWB/LZegj39KbOgcdteIlVX6JKIor/R025kuByI4McSI+GfhY07gqy
	Cx7ZQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjsewd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:54:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso611595985a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794678899; x=1795283699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=;
        b=ESLBgVkaRBGAzGxByioeXJ2ie99bqLotTvvTnfBBAEE8ZKZk8rMIZZqP0py8qnTZe7
         rPPYtFeFpDTmb35WQEFDTLz68o+uw/FU80mg+T/n9MnbfULkthKf9IcohbIZpQQpYA5E
         /CFGbu9BOripM3p87AcCG2SHcv99zhKSHCYrAglgdNFoZo8uBmXlD9R/n//vTijisdhB
         pxbIUMaSeYENQyojt+4+4BYvC9rLhTPnsYJi0iZ925VSFdpewosRmed6bsed7L6cL0Ml
         HvIRoUhn3Hx2ucHuZmOA/CJfwaTdsD/+fjaoKw+s5r7eQpwnTPBz/XEXJPgYw2AmSUIk
         MqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678899; x=1795283699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWPuKJ/V2DaQHllZzOMnN6QFel9q0m/5M9pFHMBY898=;
        b=vpk8uHw8GnQ1dNI2EAbTHUk/q7lSa5wEAt626nmBviDe58etpqHGSEPcMv1IltjLNf
         h3cwq1XlLm69zBoiBYHUSx9+K3oPzXeOlVWCkpYkrDzVj5bbjjLBTQdn764OpLG3EKXI
         EAbPyjJGdo34BkLUatJ15VNyuV156omx16VBFXmojqZCLX/ofMK9JEv2DF5SRf2GQhh9
         BQHBAAMgRWHA7fT25QZJ0bXyOCwpNUap1wWT7qxN1+uRd9CH4X21uag5BG3BRHhTQoYk
         qpGkW1NXFDHfg0qLBYUzzmqvAlKRjqLdCytcLI/B2QY5uDHNftfhRyEt8FUiixesySyY
         yHNg==
X-Forwarded-Encrypted: i=1; AL+hErFqBLgEUoJvPZXlH89vP8Kk5jgPvLADFPqSq2m9vLli4XZ2dyP2LfWX2Sx2ATuBkRUOkeRI+CfEvDL1N4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PUAfhOfuSD/DWaYI627I1CUzSxRXUh77BAiAaADmDy080WRw1
	HWtVS7zBfGfgAp5lavsp5IajlaywopZi8c2JEvUg6cp0jI2HPxX768yJsXRp7z8A8OTIyq064tR
	3HXB82zK+6iGPAP+bxSBGNRDsfGJhY95r7DG/8v36GYYZqqdJ53+E5U+ZcjFYEHeWovo=
X-Gm-Gg: AYBFou215mg1C6TGGlbDSJE9WpbhsRsgnkUWmt0FizZw/UUBO+KlSCXgYPSUPH2FYP9
	MRRDRLtv9wc3beY3JPINk5p0FJqTgN0YvfjRzKA4xF/jLgMpLqkzPoIrk3mfaiQkTYhJVTPh38D
	37QESZuwp8mReJ6g1sVZZSOZTiblH0A0MOrXYQ4Wajlk34lFlSP2P/hRVffsVdFkPaDAp+wczjY
	W9Sr55Ff+6RJBOXMkESso038KscAufp3k55B85dOY/9o5xOjicvbl5xnJhm3LxTb+qbUKiuFnKK
	VfVzSXYkHaXVjN0xEH4iMgukhOk/k/7toMRqPastmWgKrv5+9HqCEDuYHzG7gZFZGLpIH77FS7f
	Vd/awG+2Z3i4LD9OPVZL9q1r3yjYmWmB6DPgZQ221KMNmMY0LojFjPKfCuJvI37co39Ct5Q==
X-Received: by 2002:a05:620a:1727:b0:949:6e10:b8dc with SMTP id af79cd13be357-9496e10bae6mr196350385a.13.1794678898560;
        Sat, 14 Nov 2026 09:54:58 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:6e10:b8dc with SMTP id af79cd13be357-9496e10bae6mr196347485a.13.1794678898148;
        Sat, 14 Nov 2026 09:54:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm11060292f8f.9.2026.11.14.09.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:54:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 18:54:38 +0100
Subject: [PATCH v4 3/4] arm64: dts: qcom: msm8996pro-scorpio: Disable
 disconnected DSI
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
Message-Id: <20261114-display-msm-of-graph-v4-3-b8de044c6c1b@oss.qualcomm.com>
References: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
In-Reply-To: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VAmAuSw5Qrz1Gz52ayox0A7+zqwBb2WXC/d4EpaIHcI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq+KBj/U1se/9pEQcrSLEYidME6fGqzdtTKxEP5
 iEtUNZ/oN2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavigYwAKCRDBN2bmhouD
 1zcaEACaJZx/cwNuCU2I2yLeRQN/WGPPfc4u8o0xMi6NoozUyadyvLWur+AT63rJg7Xw8u8cuui
 AoYR0BBQFOdWpcr1x2hX0ac8pV7dUwYmXY47jM8jAOsLSoSvN5UGfgVOqOteZYasSVljSl08Ybj
 0yIsNi8N8ymmL7UcLsTMhtXl6huA6FilsIK4R3BLnmjLRl/0ZmfIHoMvvuITVpNDYeMXoQt/3BM
 oOmF2X6JpFlvl1uKgwcDTgFoXWvsjheno1mUfGfA6qsaNpjvE1DffppmOOrTvq3eqhmI9Kzs0G8
 eQ74Jx/iF71PNPFclYYe+HZIZgOTHOYV0ChKNMrxITNKIYFXX7kJt2QzZsSD9AqhTPd3wOF7YRE
 THGN4sIQd+2FuY2dmljTugwUit2WwLrkNhkjfpXdh3I81TZ8FNCbWGbBhv/I3+cXoE4/iA076ie
 1snmX0yGZhbs0w5zSR80fUMPHpXJE6kkNoV+31jzps/06/7os/JDVbDMKrLn8+WaUeweqRtF8uV
 Dz2CALqkARo4wW0tbU49Tgw4AfxNstsO3kE/o/8bkI/sqK6VmPcPs+KLF9siaI0z2cAGtBInhJ7
 vWmSEOp4jngAmQUo6IFVKcZqwt2zJhwu3kHTlz2MdoP13I+fpv4JbGcUKDCqCfmvIpwDI5bgt2i
 69WvE6DuXNryRow==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfX3TX2s8eB/3t/
 Ykbm3e3FlSD+yyDsdadYn3eUKDx/JCnSKE7Hf7r2NvT6+pAluw7f2r3eqanzre9Mnmh/AAXXIOh
 NrlfXwCjtLl52DkETixL8/0fWUWy/cQeXEy5Cgt/qPp/4C575ZidW5NOGnZ4A8d0pFwGSCRL2H2
 dl3m29fy1+ylQOePpbGe43jCxqXGGzvJn2zlzfJMTwHeFuypzFb7npPRflxRKhHxxvA6hscX5Lw
 ZLtxcGgNQLRZLPfBDrr+BhIrtAQuzlkZqxWsA2itRrXfyJ1iVXL5X/FFTiGwvcGIKQyk/p8dX0Y
 jRR/GMcFemwEt5EYWI80Dz1kh7P8KCMIa4jRlUAig98xKklPdBkuyNhHS5z1KCQlJgHJw3oF1FA
 j/TzBjB7HKK9pkuIspu46e9+9S//dXJ+Qbq/4zAlVaRLHQ4g4VCpOa4agO5rE29arjyeKhrwuaB
 aSPUnit3LQm8v1pD2XA==
X-Proofpoint-ORIG-GUID: yxXzgu79iO5on06lg_CAzINevk96W-Nr
X-Proofpoint-GUID: yxXzgu79iO5on06lg_CAzINevk96W-Nr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfX7XGuT9SgV1cO
 S+qXLozoZck/wytfLE+F+Mduq1lk75LxvdG7DIhX3rz+YtjoZSmD3Z9VDqPO4W2k9ckoU9bbUql
 vdU0TzPpIMY+57M7catijiOw0A4rmwk=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af8a073 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=F6vqezskldl5T9wOwfQA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140071

MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
description in DTS) and MDSS being disabled as well, thus should be
disabled in DTS: no bridge will be registered and no component device
will be bound.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v4:
1. New patch
---
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
index 1cc33c3123a4..85c542328d96 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
@@ -111,6 +111,14 @@ &mdss {
 	status = "disabled";
 };
 
+&mdss_dsi0 {
+	status = "disabled";
+};
+
+&mdss_dsi0_phy {
+	status = "disabled";
+};
+
 &mss_pil {
 	firmware-name = "qcom/msm8996/scorpio/mba.mbn",
 			"qcom/msm8996/scorpio/modem.mbn";

-- 
2.53.0

