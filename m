Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419126;
	b=4cfP9MYZhAPBW/UMP/dCjiou90g1OE8iy9Muu5XFktN1TO0uq+6E4LjnTPjlFGGHfA+p
	 3+boKPaz7DGbzgkwrlTZh2Jb7Og+q65DCfnXQSVq7iSAHa+TDXczKz9hIw5v13qFKAZ5x
	 kuJlbqpX92w+Vy7470daJdyKv9mmMdw4jbyhTwM16IFshP3omHdm/wv/0XIiZpo9+h2Lb
	 13WV8clAFzDXQNX9CfdGEn3sc96ZfaemfZbpGyfbNK+XDTQ1wTtjNDpTO/TdQix2DS9qs
	 gZPG3Lqf2i5Zjpc8R8ZejKDcVCyngFjkZuudHqBevsedb/LeAnBZWjPhLAl+3GTtnNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1kQSwLB+fzRuDQRMKlhVRp+UlWNsgysGW3ozsYvCnqM=;
	b=D6x7DXB50Fusmi57uI+R9GUfbQ8Y2uabh6eOp0Rwym7/GRk0vWoOyMBsTEF8Bz0ZiopQ
	 hsd/nx/Ng7daBSWGuMhQfqcSowddPy2ZnpCNqGkr0UNurbfmtvwV1LyCaUe/1ocrPlue6
	 9TSmzuzKKSOTJAOVlKOaMKWNnsk+n8z9eRdPEjFL1Dop7YpsZ/kn23pATKKc879N/N/aY
	 a8xIzVtZGDZQP0L1G0k/7WGyvzZWifXHMv+F5Yj1FJdOPpB+Y6AXbBgd9eW+eA+wiHIgv
	 NE7hkxOP5wIc90fQf6RmidFVqzP+Kixq2+jv8iuFaMFmMnpK7DnKff5i668YQoqbodA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=logbUPvC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Re7fFm/R";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7922606C1C1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7922606C1C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=logbUPvC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Re7fFm/R
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHZ3F72662977
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kQSwLB+fzRuDQRMKlhVRp+UlWNsgysGW3ozsYvCnqM=; b=logbUPvChFd9rbdV
	udC1oXKBL6+PPIybAPu3+g/27IJUfg4liT4gQbgBOmNeadk8KFz1L2YQ+aVuU56X
	EkQU0XwP66kCC3poXhJSEWUiVX04TQgCEpi9emwSJfiRmBqg6PgkftJ2RCW/gqfX
	cPP1pjc+O8tPg9zbq3nXxE4QA7mMj9/BSmIKLSdhRXIyuE6scpYSIRGmLuwMTMtC
	8K6HzI0WZvq5y9XGowYOvR+sONo3t17E6sHeFWstMsLSlC8SWVDpccBAmKf+pDsE
	jrXKpdII/JCgjxnecHyP0LOBtIz4evNTWe07BlbPBZpHU69RAUz0VgiESrL9PhqG
	xnp83A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0g1ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:45:24 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2c7428eb2so671100137.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794419124; x=1795023924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kQSwLB+fzRuDQRMKlhVRp+UlWNsgysGW3ozsYvCnqM=;
        b=Re7fFm/RSsLwLxAH70zgwgiSIIlHGNgnpQ6M7zhvBy4/MXXv63nE+Hs7rx7GErbWbX
         FpEtb0lAzLedkU17gIJDfj9BvwSYCkOnM3+M3ZFViO6qwVudAevg4oF38ND+d6P7uVA4
         9VeecZMkmu85rBLa17XChLlO6iBLUGQFqsrohgKH7Ks/RZp3EO2uT7AwFvHnuzQupMC3
         1nlZkZwtmIus0Gd3lV9q+maWiF0AMlRMLt+zaW0R4nOgD2JwSjdYQGqHobUpgIbih+RW
         Y/OatHS8poW1SzWUqJoZmoh5jbsXM/2DH8nn9jJJAFuXUXqpujWcbnRbiQ86nUoIw6N2
         7e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419124; x=1795023924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kQSwLB+fzRuDQRMKlhVRp+UlWNsgysGW3ozsYvCnqM=;
        b=gRN/NPWT/IZoMAEe6a/3JwEaVVGcAL8IgqWF5mUBaOvkwAfJToef4LjXA0k3ysYMgT
         cCcJSaPBY4bBunkUpRMJvAICVQDFoL+E/Wy831JTEYZnSQkydaYjEihQLURbmGQTQn/H
         nG2Vc6ymDCLF+zErzdln/+aLuSeBLi9rj9pJw7Uhd7MiJMXqJ1K74s1NLjN9Es6yhvc3
         cMnV6Sm3E8W1zrFWxQ24VNjd4rVUpWaABNn4jOcsETVG96QB2C+k+Jp9/DQZZMrNxGsG
         C3ernZEZPQ2Vr6fiMOU6UtqnR3ApkMbZUEcZY670JBQ+AnEG76mixCSoC94tUhsi4zli
         g71A==
X-Forwarded-Encrypted: i=1; AL+hErFEa9AHiS3bXkFDBMcoFJYoTJdH8figU0yIBi8FecQmovDUNT62RyqjckYWuOE70x1zhwSO1oh2r9460xY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jocdytwXKOGin+4GojgdG9BorvkUDwZ28jsI9D0r48UBk2z66
	O3BvOxECfRAsXAlhihvt1M6ejnNRNTJjLe2asZEvXOUngLlwqgWQZVDx2nFrisXlfsdcJXPirph
	f+d6F1Vrx1ebFbeGV+D34pEutWxwTgVAYMkLYr8wdpo/EhTMgENuRaf+zxV30eHkym8E=
X-Gm-Gg: AYBFou3e5WSBC2xHuYotaZiNh6IjwefBnc2kGSc1k4n6u4UWKdxendu63E0kqxwRTl/
	SrX1vaXY1h+rQQKuWIfIkyGGNit24YTeXUk7smJYSR0SrjJsn4boIx+jPry383f9Kp/VdAwPUvB
	CNyR7/VzJM4nl4zM7xE5WVD27SSTYsuf4hQrT1ClpJn4fpzr/0+kXNuvQaW+3Jk+mw+X+4WYVx0
	F6p9sxz7XIzD8sDBvWbDgORkDGcCdXp54DhQq7M/GDtPb3qrNs4lNSwnPpozcY7eBWsfcHAf1G6
	SPp6fSbEIYr4H3sa1wkNyy5bwq0mnT8fSFg1rFs8HOymvQk+6+x0EkZCGYudil65k+QYrw4Imxp
	PmAT6+LKvZoDiGYLeP93bVaLZOGOwAbGsC4JvaFJogdWwHsHRzPu75onbVzFerUEMVkpNfw==
X-Received: by 2002:a05:6102:c8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7d5061b81damr1261552137.31.1794419123977;
        Wed, 11 Nov 2026 09:45:23 -0800 (PST)
X-Received: by 2002:a05:6102:c8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7d5061b81damr1261538137.31.1794419123452;
        Wed, 11 Nov 2026 09:45:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f5810sm4846525e9.0.2026.11.11.09.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:45:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 18:45:01 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
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
Message-Id: <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
In-Reply-To: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=947;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hbrjZvH0hhYgCazLv6ThBvBfAtKM2TTDR8/XtS3ZJS4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9KmmauDWI+Y9xULUnh8XyMtrW28AyyFTHiIhq
 VsF2A03zUaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavSppgAKCRDBN2bmhouD
 1503D/9w7wx6Z2qEMiyq2ZWmcqISJSvP6uzy/1iMjmZg/gLuocm/cHe5ndH0sElMmXUH9EADj7T
 6zC+YJxOyZ4wpgephNA3DdIScwUhlNl+/2R90pdzOALEs68po5n/YKR+MN1Mp5cbMUPa4CjeILJ
 ZI/t5+xdb3ASSVooTc8rVGIOaFEcgbOLZ9rHazJPU7c7a0QFdhkx7vdBkAqSsvHOZvUJJad64Al
 hlaKFkW9lxsEFcxS74HAzichA60uKBNaO8FGMHiU6nc31y4/n2wr8FwzhgOS+t8casJ+J86r8Nx
 8Mi24/e9PejVLK3a2I+JGON1Zce/TelxtjV7HX73yYkSg6nlCUacae8Hyu3u/ssm9jbyotJbvmk
 gWrbFk8/hJvUvGajoftaEbH4FUXAt5Yti/AkgwCRpK0XKtCW+4Eu2t3dXPJMlGwS3Hhf9M+g+Jb
 q/j/nAKwzWzSAkIDp/G5mBBlpe2LJYhRgiNc+DVbxGHehtxmQ0eWjR/MIXHlsstHf2lJ0I0z2+5
 mk7PbzMGz/m2o886r8o+hdFYs7d/c6WdFAF5Uffk+mjNv8umaHWWBfL/Fud5nGo1uONmvnBQS9O
 aq19e+RktF/mYWUhfZS1k9j7jWCnwImgNdlLbC1m6Q4NaBr8LCvTga3U45QCmTe2jLLXdOyr5NB
 285bfqlU6UrVmLg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: SVB2HXqnvM1m65xQEEyClNGwnCkBNzyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX1ZHSFTrU7wRh
 3swPV7Xj2YVSQRIr1sc0Wh1sdhenL3IA/rz9xdb5MchQ1DuUbIvTfRz1vpdaaiadkzlcN3CgCRX
 weh1ntgWJ7nGdu9xBljTuHSrMEbXEktnBaRvtds2OBLgvhGUD0HVIj5MqsoK6aeDchA92CnA2t4
 UciYwZoOEKil3ZafCb2vH5N9oz/go/yJsPd3mfLMoo68bnDNIDndhC4yXOfHcZHQp2W6FYAdAnD
 oTAPhGAi93IsxNY4/5ku3XoqY1MKk63t4vHyfyi2t7V9CT7oqsMkZd4w9UvJY+Ij4n9gTdxRUNg
 EuCe2FZ8yX1BwS2+SxO360y8XoQwWtP04OHO5pEV+9SiHi60EJsogQ2Ghwes8X0RG4yMb+ukQMj
 UkaLNdPFyetdUZACvgmRDfEQIGLVP/ON5XKrQRb9eDwLJISXtrYMBSAZ4g6w4qgIBy1qEjbL7GG
 sbw8qTPReymS3tXCaOw==
X-Proofpoint-ORIG-GUID: SVB2HXqnvM1m65xQEEyClNGwnCkBNzyv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX6MZr7fJo6SjO
 Zi2nuaOTVW87hWRLjsmsrJLK4LIQCJa5VtbqayMO7YnLSjRGzjM4ga2eaZ6BV6Sxh5W1weverkL
 DM8QAGuMriPmek98lt7Wq7FlsCHNLbc=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af4a9b4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Jz4vbV5A2nIxJx3xYRsA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110070

MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS.  Linux MSM DRM
drivers will also fail the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 7a3f8afae22d..9c2cef11e7a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -189,7 +189,6 @@ &mdss {
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l2a_1p25>;
 	vcca-supply = <&vreg_l22a_3p0>;
-	status = "okay";
 };
 
 &mdss_dsi0_out {
@@ -198,7 +197,6 @@ &mdss_dsi0_out {
 
 &mdss_dsi0_phy {
 	vcca-supply = <&vreg_l28a_0p925>;
-	status = "okay";
 };
 
 &mmcc {

-- 
2.53.0

