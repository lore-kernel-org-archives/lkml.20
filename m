Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014248;
	b=wrckebVrCWiROnGd5RDVpXi3CQBKKJMpPefONBF9OElXi1uQ66xUb7GTmteajT4d+FRa
	 LR67/0OnWSgh73yrs+8M7tL2V/F559mO1ulukwRv/2sTL42nI+0C4Oc3VF+w90LZQd40D
	 Cq/8bOzhdu4wzvz4xzMqWC17vi6E5FhYKJpjpwsAeFpnNHoWz+jM6268ccVQBQmp5kc71
	 e4kZEFXn9R7Hb4Yhmmo0RWc+wJLhMEpqXpZ9S7AmXh3YuFWgdEqkFmL+c7yxulRCA1XLn
	 BxQ2dmDBxWkiP6Ih/WhtwpNET5mnEdSNjWjogvEkROqmFx9mYWdBmbscADIcSS4/FtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=;
	b=oms2AfW+wygDJUeAio6SwxXdU/bFmyqCinrphD3PdnaUlNUl7K43U5/xa+Dy8EVpPmi9
	 TrrF2ji3BLqAPZ6IqpOL0V3W1EPCSxcdZ3ZQD5VoFpVPJdb5Db89LM8nnMJXeVUu2m7Ag
	 nCKJzYgYZZXK9VojH2K7KetV1KJeaXcSsnGr0i203AQe+arWiP2QgXIpwZzmDPYRpLd7K
	 xrvX6K+S+No5n8HRM0YofboaYGA7EMnuTgW/b2uMR2jNSoe/FKiI/HNJtwaY3vY4A8caJ
	 XEHk9+3m7+DMwT6yxWE5ZXZRM5pe3QaPix5LVdXgyTPfXL9X0lZAV3amzZbhbozqQ/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWBIaPc8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fpMWzgyY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E244E60A260F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E244E60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWBIaPc8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fpMWzgyY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtItS3085494
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=; b=iWBIaPc8dS3yeKG2
	4Uwi9SITvqMweKCDEwiqzl86IkjnUjwk8slr8qxPtH2nEfThNvbPWRKDOlD39ppV
	+T4noF8Tb8bv1rbLHQTarkwNe15cekDuUXg3T16wPxCMJB4T/XZ5uQsr9gK84CWG
	uVzCX18j4PDxStz+/4AspT2Sy6ImIdbznR+0Ohw83iqmCuYreDK4cBsYfLLCstKL
	YnYIf/wiMF1ZxyyuFeBioJ8s/b5WFm+bbdRREio/g2lvDB3/zYaJENjOWgisH8ic
	j0sxDlemfAzHNRTHf6aq1wPyAivAdPXkv7/CKWgTCFQnxqwBh/mJt028j/OR4I7t
	FTl8AQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3p4je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:30:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so1614837a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014247; x=1793619047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=;
        b=fpMWzgyY7jBweSkWGJi5RrVynz387OsWsy5QMbRL4ZwCbcdpPBuY5kzgFN5SfnrYtE
         6Lu+7+8xk/sOTYMDqtFmVsOZ06Uk6+fUl03gGW6k9si9FVknNQDq0B9eT2DkHD6shd23
         AleR61QIAa3z33l8fAVtrR59c+w1izGsdpzdGK7AP4+UdCbLJLJMbeHYoLYsugfDA6m1
         nvGsyoLyugvhdVB+HeJ6Djkz/K18bVUaPcv8R/6Sckr9/N7lGmuDrIKpc2C3pkmu7qtH
         kgOqNskpEVqGizT2Gu4rJ+utsM6mSybyDlS+rNq9xaufW+/NHWMxVKJkRUJwT6pe9Q0f
         o/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014247; x=1793619047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=;
        b=IaI/1jX5KmXGosk2hNMuqdgNJvOtZTFWLrOeKiEU899edadDKLBYZJvgZOXmyNBeHp
         BPauJ+e+SP7lQwiOPHoMWZIjY9S77XF9FHxPfViphkJMwEv6VXtzR3+AyRVmuHmz/mwb
         9VabT2x6uTepISwJhWMpc7X9h8MpoK75QEuA1RVG047kQ4TRDKHs0e9rY3uJK87tB1pe
         oiXsU2Ekjmeanm1LyFD2Fe1hKIfcYZCC6vqmTalVD9hdjqYWtODZLqWA6CJWQivTTvj0
         ZXMl6hj5Ce64BG3jsWBnFgvvWCX9g4thUe/QonBr6HlfDf8/eUrz0Ie62ftajH4+8caf
         UlFg==
X-Forwarded-Encrypted: i=1; AKwUvBzjcNsgAXGjUVNDE6KufdC9iZVbk5sQ93RPfNpYuGz1fw4mGtRK/n/GCQMuqb2u/ijSdBstXJHfY+EP9B0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxdNoTOEvU9OrTKn0eEXp0NfMQwLK2Eisl3ezym4KpSj9/VL8s
	PsHUzapAHd/Y3Vn2VH099VIg4iyM+L8Zvw2PYIPY+WDQZ9lpeMMe1G1m5yISqrjnK63HluL0ykN
	F/ReyJjxHUPNFsfJ6DL1aVSFcUektQ0TnxiiHF+kyTEG1RKDPiQo9MA/FvKOBEpg7el8=
X-Gm-Gg: AYBFou1dd5P2op15TBRRtMuNys2J5A0qLYZqCtx5eMrA9P1afy9uRJG0EbIeg0oasEf
	KVsvXjFZlNoR7LaRuQH6g5cDXL4UdsdqUEpS3irxmTq/7WAEtRKIzNUs+gxLa2HxY+HGWK931XS
	q5eDm/prCMMRhAROeWHFhitqyVh3RYHHJUNw23w8UIiOJO/9p2Yf9u/498rtNtjgU9I7Y4ZwhDa
	9115o7pT402TmXU8rGh7hqZz79egl/VDFZqISs9pe8e9OLcSvmZM8/4ktAWBusL6qf3P9tVKVAq
	gCSjdSWPoNUgXnD23cexhNaN6lp2l5RDSMW23mGT8tQlEvvwrY5xE0/XOHJsSK0srFOGbVTEidn
	CXmai88p2gsmwcumA0yKs1dg=
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3577917a91.1.1793014246477;
        Mon, 26 Oct 2026 04:30:46 -0700 (PDT)
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3577891a91.1.1793014245696;
        Mon, 26 Oct 2026 04:30:45 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:45 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:34 +0530
Subject: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: giBNyTuc0-4Gj9jamX3lB9cA6REyLfEQ
X-Proofpoint-ORIG-GUID: giBNyTuc0-4Gj9jamX3lB9cA6REyLfEQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX2jQy7vfALXEO
 yDTvSRMZwETcKZMZuoXMjkTu3mJcAsnq02tNPyfD3Td2yda64OT97O7cE6dt9RI3kw4zguClXlx
 li3quc0o9icaRuXB8n/q9Xl0jlZuhXo=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf39e7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX2Y5FUTnj0DnS
 mHmBIm7zJE0UturgNJqs7Y33GyoNJsEnqGniDaO0oPuXDa8OTvl9TylRmVfcWxP4vzyd6mFVrrG
 vayv+NhPHhcNozecDIXz9WY0wEIiZMwQvVg+5qRcdRGAwAGMyqsssUkmzpJ/sA/HRVq6JUHuBEV
 AxpKQ26BxR4hC3PmBF5h6yWpIJqUtRsAE8uP3ODQtVGzhWzs+6+HcLrfdNotswoy4m39xFKh7Fe
 oPI10AOibI8/sS+MfxNYaUOVdRmT1tcbKpfobxU5EGyGqiPqvz9YnVuWHfJnBdyvaBifYzftvYp
 RzVbiKGlQtHNXfooMb2bytyDsMbALAbFQFnNpst3y6dMssVaDpufdhCI2uG8jsUbsCoWJ2S4J0R
 Vn6RqFm9MgJGArm7Dvz2OfBHLeMwDFGDI3IzMSXXBKyQJVTs5S5M6g2hGC/aiNRu9HGC7c01T/U
 eH90LPjavCXcsG6s1Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs615.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 0e7df184122b5b94756a233a009ec0dd3675816f..169323635d39a7c3441560feb002e9e03a577515 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -404,6 +404,7 @@ enum qcs615_functions {
 	msm_mux_emac_phy_intr,
 	msm_mux_forced_usb,
 	msm_mux_gcc_gp,
+	msm_mux_gp_mn,
 	msm_mux_gp_pdm,
 	msm_mux_gps_tx,
 	msm_mux_hs0_mi2s,
@@ -581,6 +582,10 @@ static const char *const gcc_gp_groups[] = {
 	"gpio59", "gpio78",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio29",
+};
+
 static const char *const gp_pdm_groups[] = {
 	"gpio8", "gpio54", "gpio63", "gpio66",
 	"gpio79", "gpio95",
@@ -840,6 +845,7 @@ static const struct pinfunction qcs615_functions[] = {
 	MSM_PIN_FUNCTION(emac_phy_intr),
 	MSM_PIN_FUNCTION(forced_usb),
 	MSM_PIN_FUNCTION(gcc_gp),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(gp_pdm),
 	MSM_PIN_FUNCTION(gps_tx),
 	MSM_PIN_FUNCTION(hs0_mi2s),
@@ -929,7 +935,7 @@ static const struct msm_pingroup qcs615_groups[] = {
 	[26] = PINGROUP(26, EAST, cci_async, hs1_mi2s, jitter_bist, _, _, _, _, _, _),
 	[27] = PINGROUP(27, EAST, hs1_mi2s, pll_bist, _, _, _, _, _, _, _),
 	[28] = PINGROUP(28, EAST, cam_mclk, agera_pll, qdss_gpio, _, _, _, _, _, _),
-	[29] = PINGROUP(29, EAST, cam_mclk, _, qdss_gpio, atest_tsens, _, _, _, _, _),
+	[29] = PINGROUP(29, EAST, cam_mclk, gp_mn, qdss_gpio, atest_tsens, _, _, _, _, _),
 	[30] = PINGROUP(30, EAST, cam_mclk, qdss_gpio, _, _, _, _, _, _, _),
 	[31] = PINGROUP(31, EAST, cam_mclk, _, qdss_gpio, _, _, _, _, _, _),
 	[32] = PINGROUP(32, EAST, cci_i2c, _, qdss_gpio, _, _, _, _, _, _),

-- 
2.34.1

