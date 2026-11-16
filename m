Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835133;
	b=haqrPfg+prHg95fYr0xvqRP9U2c7XDWRs4EY+B2KUhTioV8tBsUCK8Xevw/hYuW9XsJU
	 1VaYcEGe/Ns8SNrHr2qspU25OllAwZJIcC7TbbiREOnUIiuvDvnhdFRRtiQE21BpOEiXB
	 8k+9Kw4fWQcNrAiFcuTs3zl3/cZFcy8Uh3T3GGUGrJrrjOnwwe5O3WaETeIZNaK0LFFXJ
	 KhqC4Q7+Mp9ml4//9p/Yang3B0Ojym9Z7rX0bn34wLwgr9O3j3gCuXGLxwTF/ZC8/8qbK
	 ZmE0ySE45jXIDpOH77GatEOvnuveiOc6RAHEBWpym0cUwSoDfgXt1nDoxecy8jrahdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OLtoSJeZjAckwtbCo1gNxFkHnpxWN2Z7BDJOvuvO4Ek=;
	b=gwwxUQhAeWqJqEsfiCOx+XnZ77cRJvaA57tavDs+XiMY5L+P70BwfU6pATSN/nsWNrsX
	 q9S/rO+5RmUck1e/MScSY+mGIIIB2Xr+Vewf71zfAyqu/L0/glGW7jYy8923dKgAvqVkU
	 PrUfJFkIax6tK+o5ULM42WhscMSaoFXB6yelmpmZpe1Pk20D+gGaCiqhZZzJqErpc4kLo
	 kL1htqasp9MUUheE5q4smkPiaGChm3nKDbWi1/u+8b7i3w9fZajDKC6XHApmpuPCxKTX+
	 SwXGwO9XTLuGWS689gRPKaypb6FU9oXJvVHh8coM93QINM4cKlgaw2+1yYLzFeSpW5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pTpXaik5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E19Tr1Nn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E5C606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E5C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pTpXaik5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E19Tr1Nn
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0t681552448
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLtoSJeZjAckwtbCo1gNxFkHnpxWN2Z7BDJOvuvO4Ek=; b=pTpXaik5UaLuMpZ5
	gwosfZrHEBd5EvS0s48O2QogFIbv/SkJAFJuMsrQ+MA7DUj1gMPnu2uLfdqkcTmM
	dm1ugjQ4tPXb1NUGppLUq13ywjeRpSwlPrP4YPboXmfypO2bf0rEiO/MX3UFwIKx
	uB2TxD9Ey+nIUdydtSXJUb2dI7W4WotY+/PcP7v54lwDG1NfItVK9tmtVQcMYxUO
	pWibRKdiinOGy5nAflbUBMkcVjgUcEaqmanVclQ3NMUtEUUooQ8W+eCOGuw2EMzE
	9i6MZlOlNYMdGxKoFvUwhFpavOIxjagz2wiFGTsFnV4r1phh/3tqoPlkSgWAhp/t
	oAVBhA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2gw48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c046843f1so45111906d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835130; x=1795439930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLtoSJeZjAckwtbCo1gNxFkHnpxWN2Z7BDJOvuvO4Ek=;
        b=E19Tr1NnnRQCT75hMQCkMvq4pjBowcynqgMOjqT7yKNNuUKeD2ibDr/AQ9o+u65GFk
         w2U/dHXZMw0fgYx8pYt7nq8eTrBh74k41hP27tOXX9LDqXb09YFiLkQHVh95UkmRX1Mp
         HNnpx+qj1yrseflq5n4sgVE/ROnSQ9QSIn3BkXzk79z8IfjdiBXWEf4rwIpjx8aDgdPK
         Otb5zk3mISYTZQIu+cSDKHKQQK7neSSKPOg5ISChfxDlR6FqNjeNhKfVe4oCYh9QyW9G
         ANNbB0wmlMh7nT4uvyQG7AQApIj94WXcD54s8zhHacNCw1iCgHF0SVBvor5LOHsA1acf
         dRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835130; x=1795439930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLtoSJeZjAckwtbCo1gNxFkHnpxWN2Z7BDJOvuvO4Ek=;
        b=VOIxBVlSyyyr05WfLLYJ/hzMy3OUkwMxdwoxdgW2+YzCU+8PnwyGOi7w4dKDNisBKJ
         dLJXzNuCikiWbXVT+d5ryGvPZoPn4ClyBT7F0ya8Eq+mygYHCj6sUrUcS9ROb99My7hu
         1i5Ve2me0xrX92W3QT6CQAD4z59n1XEe1zpY0rzwPysq8xvAyJXUZ8IZuWeTfkPjZ308
         7lLu+vUPFrYQ95HrfxGJmUS3jeP98N8OvyAKMAqcKDomAjSkANYTTPpv1E44vfFNy3mq
         b/AC4aLf079hc0xexQM+1VTV6As2ummn6QWmmoUog5RA4JoMccF+1PVUjwU19edd94k8
         5N0A==
X-Forwarded-Encrypted: i=1; AL+hErFn54WuQo7XMROaZ3+NrbW50Hhsu3jeVxx+9ptORLqOs+2S5r/X+P4S8pCtrzhBkSoPjX7BoOnzYPfwSoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HwvotzkDrcyEycEmL87MMEmdyId2yf1KP7vE3y9rXec/QP/HI
	RRxb0exv/HAihLFX6LRW2sixQ6vOVZcKNT7zdLQybBX8qC7U2Nq9OBUD7B+UlEQfP9cK4yn6ukt
	hmRpZJKYOZ4kvDUBoHvVEVyVHHlmV6mjnsmISc90RcKiqDMpEFf6HCKkS8rkLhoPaTrM=
X-Gm-Gg: AYBFou0LEzMq23tjCmYRQ75cH7rcmR2q4zw32ow8OS5Y+O5c1xdEWIOsJeV+s8mbFO6
	iaw+eCvhT13Balv+7cIVvV6Sww/kwyv/IdqoMyYvwqH0fGkwv0/9dBnYda9UtndyGaDoeHTnGJm
	riYTTDw0NqSF7ZRv8VQxy2ZxiSfBQ/e3uOFIVAKxDVssnQdfDFt0TXW6tB7PtwF/Z7tVTnTEm5S
	XHcgeWxH9rfITEOrfjFX9ROOZP8FS7rc2kTbYqVhw2mCaDbaF3syNY3yrL4jvmGKojfJBsGXIgn
	sbPFNvqxXMfDY/UlaAz8bWz8touKSnbxA1GF/KHCHYa/tda02sNeaJYqyaAS2wwOy6rP1uCa47Y
	b6OToE05jGry1MiSF0BYAbQMrgTrnvCkFj2qlinA1e24AQcNXYy9XgaLKV8lpsKTu9pGkgqNBF/
	zD
X-Received: by 2002:a05:620a:84c9:b0:93c:6507:a6e2 with SMTP id af79cd13be357-9494bbdbaccmr1577628385a.65.1794835130350;
        Mon, 16 Nov 2026 05:18:50 -0800 (PST)
X-Received: by 2002:a05:620a:84c9:b0:93c:6507:a6e2 with SMTP id af79cd13be357-9494bbdbaccmr1577622185a.65.1794835129672;
        Mon, 16 Nov 2026 05:18:49 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:49 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:49 +0530
Subject: [PATCH v3 10/11] phy: qcom: edp: Add Nord-specific QSERDES COM
 register header
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
Message-Id: <20261116-nord-drv-dt-v3-10-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=3377;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=uzH13SMkMubkKgwh4agZIOrQBBl5vNpCxmjdcZREAHk=;
 b=2jcTPord6CLMISExCWLoyHcqTIsMG4HEHO7kN0UTK6uiwaaMI6hNbcfoM3VzAX006i/Bc0BEB
 cBWkkijyMlNAVEhWe9jT4eodcbWIAjoO+vvpSe0yHdF62jnup/6CuZm
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afb02bb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PUeSZSab_OCI25pZbQQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX4T/tldMZdo2T
 dIYMSEJesqHofqlkD+uZ2Hjo3MVphBqdQEXh0VpWKiEHrn9G7I3if2fhEMeLb7F7xzFLiaJEkPO
 wzh6iOrsDO6f8l03NLGJPY4SqJ8cFZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX24viaPipAZfX
 hOsD2QjInleTlKBIYXlbnXDLfY/mpiOes+/LtaD0czjVhjfNQjrM4j7wkb/J/JVUySjINs0RrEn
 2wZlmRtoOvnxNTVDBUqB0mOHelS15sdMA6ivN+uG2iJvj5vfAawnSffzWm72mSZcOMMHJ5Z+OnZ
 5XSJ0s53pXdNyvLOhm0EKuMqI/tOeDJ4YcSUOdFERr0dnrrrl/NzyESrHwfvzynzn0bsaBqAixL
 +P6n6rayikINibM9bM8Zj/LTmDA1fJ9BSFRR6xo+fn97xvbyZFMX+CGa9oPlWV2N/dylobUE5Wa
 8InPqOmBKX2QOFmwx34jebl5a0iqOIuhJziTj8t7WwRvlA9Z7C3Y6jclMkAm8VVa32udKGZjJgV
 u/74qsXzGxBymeDVzrNILXh0CIuIWzJsbyKgcoLbU3k2jKRAOPquyc6lwbTkmiWDtJAGFEQo6jX
 5+CB9loyaMZEAtYcF9w==
X-Proofpoint-GUID: nd0s40IBSKgS2hghPX97vHtXu0TSos0L
X-Proofpoint-ORIG-GUID: nd0s40IBSKgS2hghPX97vHtXu0TSos0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord relocates several QSERDES v8 COM registers relative to existing
SoCs.  Rather than adding _NORD-suffixed defines to the shared v8
header (which would leave it ambiguous whether non-suffixed registers
are valid for Nord), introduce a dedicated header
phy-qcom-qmp-qserdes-dp-com-v8-nord.h that lists all QSERDES COM
offsets Nord uses under the NORD_DP_QSERDES_COM_* namespace.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h
new file mode 100644
index 000000000000..f38b48dae39e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_DP_COM_V8_NORD_H_
+#define QCOM_PHY_QMP_QSERDES_DP_COM_V8_NORD_H_
+
+/* Nord DP QMP PHY - QSERDES COM registers (relocated from v8 base offsets) */
+#define NORD_DP_QSERDES_COM_HSCLK_SEL_1			0x03c
+#define NORD_DP_QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x058
+#define NORD_DP_QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x05c
+#define NORD_DP_QSERDES_COM_SSC_STEP_SIZE1_MODE0	0x060
+#define NORD_DP_QSERDES_COM_SSC_STEP_SIZE2_MODE0	0x064
+#define NORD_DP_QSERDES_COM_CP_CTRL_MODE0		0x070
+#define NORD_DP_QSERDES_COM_PLL_RCTRL_MODE0		0x074
+#define NORD_DP_QSERDES_COM_PLL_CCTRL_MODE0		0x078
+#define NORD_DP_QSERDES_COM_CORECLK_DIV_MODE0		0x07c
+#define NORD_DP_QSERDES_COM_LOCK_CMP1_MODE0		0x080
+#define NORD_DP_QSERDES_COM_LOCK_CMP2_MODE0		0x084
+#define NORD_DP_QSERDES_COM_DEC_START_MODE0		0x088
+#define NORD_DP_QSERDES_COM_DIV_FRAC_START1_MODE0	0x090
+#define NORD_DP_QSERDES_COM_DIV_FRAC_START2_MODE0	0x094
+#define NORD_DP_QSERDES_COM_DIV_FRAC_START3_MODE0	0x098
+#define NORD_DP_QSERDES_COM_INTEGLOOP_GAIN0_MODE0	0x0a0
+#define NORD_DP_QSERDES_COM_INTEGLOOP_GAIN1_MODE0	0x0a4
+#define NORD_DP_QSERDES_COM_VCO_TUNE1_MODE0		0x0a8
+#define NORD_DP_QSERDES_COM_VCO_TUNE2_MODE0		0x0ac
+#define NORD_DP_QSERDES_COM_BG_TIMER			0x0bc
+#define NORD_DP_QSERDES_COM_SSC_EN_CENTER		0x0c0
+#define NORD_DP_QSERDES_COM_SSC_ADJ_PER1		0x0c4
+#define NORD_DP_QSERDES_COM_SSC_PER1			0x0cc
+#define NORD_DP_QSERDES_COM_SSC_PER2			0x0d0
+#define NORD_DP_QSERDES_COM_BIAS_EN_CLKBUFLR_EN	0x0dc
+#define NORD_DP_QSERDES_COM_CLK_ENABLE1			0x0e0
+#define NORD_DP_QSERDES_COM_SYS_CLK_CTRL		0x0e4
+#define NORD_DP_QSERDES_COM_SYSCLK_BUF_ENABLE		0x0e8
+#define NORD_DP_QSERDES_COM_PLL_IVCO			0x0f4
+#define NORD_DP_QSERDES_COM_SYSCLK_EN_SEL		0x110
+#define NORD_DP_QSERDES_COM_RESETSM_CNTRL		0x118
+#define NORD_DP_QSERDES_COM_LOCK_CMP_EN			0x120
+#define NORD_DP_QSERDES_COM_VCO_TUNE_CTRL		0x13c
+#define NORD_DP_QSERDES_COM_VCO_TUNE_MAP		0x140
+#define NORD_DP_QSERDES_COM_CLK_SELECT			0x164
+#define NORD_DP_QSERDES_COM_CORE_CLK_EN			0x170
+#define NORD_DP_QSERDES_COM_CMN_CONFIG_1		0x174
+#define NORD_DP_QSERDES_COM_SVS_MODE_CLK_SEL		0x17c
+#define NORD_DP_QSERDES_COM_CMN_STATUS			0x1d0
+#define NORD_DP_QSERDES_COM_C_READY_STATUS		0x1f8
+
+#endif

-- 
2.34.1

