Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014256;
	b=E9V/7uzW5K0UbhbYt8CtpIGObqTrP9QI1xmhR4KLRcSMNSKakNKelzla/qEBbCxI6nxs
	 lseWn+gS/sORlVvbMpPu3Z5f1WY+dzus+MVS1USInsIo6HUmObuVojXefdUCvNxeW8nLc
	 CP1jmLfJQLDLtlqT0Mu/XRpFhexMPiPyBpNB95c/jNYtOSzbWSTPdDeLgYdxXPx7ekYqx
	 Y2nfaneElYJ05UrhQ8bAtLirnYumsEDDOi9z8+vpuSya/dBwo2QSUSN7PXFsgkEI3n56p
	 w9FZX1pbq2KAfjHyg2f9EEdpD7Csv+22K2UFRx/3VEJCPhuW2IcQX2sELdFHrL/eBQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
	b=XTDrch9gnaLIcLVQU8LFu9kyEDaTxszEFB2ck+RghAO8lm162nOMZhpXOgPPQNhJT5Dm
	 TnK3gzCxg/y6t4Ac5FnwkO82CWNLAnLVPXZSgFguvFw93uQMClWpWcWJS1Ml/3vd4+ceA
	 hPTpd6W++ssmDVs49a50EgqK6CUXpmxsrqkNMWoedhMBBpW47L0PkBdEx4+/9ZmQofnxf
	 SGsWxt/24BbSVOZ6+AkSrXGjnP1p1mMy0G74o9TO0M9MRekilSEpTmTn+sIS3cqKFe3bC
	 oeDqepWVzsT7dambIcyF0P36XjuO9IsHtfZM8ZUSYYJV9R01BuMdlVJGcmAI0Bl+/lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npaCX9jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5M9QUX0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7C3606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npaCX9jt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5M9QUX0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtItU3085494
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=; b=npaCX9jtYxzYT5Zt
	t7JV3UfqfK/8A2WwX5npM8A8GheMCA+qj+c3P1NesESmYtTssFoxz6b4+uHeBRYB
	MQdKYlRY5jKKRc92oQ3Y+9CoYXD40WPyHnAURMSfEvePs2h6bFQe5ShF1QkSV9bt
	hGD/AP7gXGbyhWeRuATFmp5KoD2WAF6vgKgHU4u/3pxpu8CrfwLHnJAKvdK1lLmp
	z0P+FZXpHNqfy89HCnX/waWyrlQ5SqForeAAnhpT1gfzezJC33TMkqvbzbshzi+9
	guAIn1wCZKyXU5vb/FPwi/Qh7c1sMuHy/x+7u0eqFAk1Djt/gzTvT+nMnBWV6uEI
	7xLAwg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3p4jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:30:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso2648296a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014255; x=1793619055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
        b=B5M9QUX0JGMgRE84M896uv2k6Q/lz0+zdEUMc22BZS0RUFWPl2um7bbjjZfAloBC7T
         ID5B0tpzFouSZFFvx7zdVQTSoanL/x1b2MIARjxBOEpvuD9vE0tAQq1NBWLOhmGsieLz
         q1GbbU1w4YnM3yFPYt0ToFQ+wV3V4KV5rrIOf5QMpKksD5Pt+qX7AjNVC15Yqy5p/KmE
         83AKEHiwkAn6v+lZ/KOql/1l05B1pSxify5pDf0nvHrQcgJH7NkjaDsrA2pn/jBcehWW
         5stxqgQJ0WuVKcpM5RT4XxWjEpDIJc/Hp8qur0R4FFcbGoTPoZlwbcvz12dZBTY9w/UJ
         gOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014255; x=1793619055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
        b=EMLV2znP82NkpeOtVdbOd7VtXH2qgH+y5Wlp4P1rbE+ZuSfAu9T2HlPGyXAynQPpSP
         GHAZn/7A8sMqwkHyJ9g9PdmXr7uBudtuIleemYBnr0Kwwljv+rCfOb/8zJCl21dvWHfp
         moSA3gRrkFDVThxKRJ48tCXjTKGVn84SC7jMGHgqQO8yMkXF4IskZXgbrxgrtuF8IQU9
         oaCIs0+zTtBkAX1iatDaImpvzrkGRaSNHKHyvo7hRZMXxxArZKHiqOd8DZWadXtjR1MM
         yXE39uIMyR2qyLDoWJN1ZSeUl2JnYnXj8lBgQwTtAEzSA1xv0wO0pHhQyO2aJUE65tRG
         pfsw==
X-Forwarded-Encrypted: i=1; AKwUvBw8njkGNm/2Zu/wIQ2wHFPnj/pf2Tlq/TXW+wrMqTq4rDA5tkiAK/YPss44qHzcPHV3GlL3tfDOoyjZkQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgkxFDky3SwS7efnZg8m9lDhW6jqceoTmyjHwutjjWoxpf8s35
	Ptp5wFLxDXx1reQiwpDDh0pV27LU7a/boc7orx0PIcyN1W+vbs9uzSF2ih22SLe3+dwpMRqJiAR
	2fQHieer+dHV/krGohTQqWHCV6XkoFHLvbBHcy7L1Gd4gR5nvbRrBy3j32grReIpOV54=
X-Gm-Gg: AYBFou34Hn5vmAdcgx924MsHdZK9jQhV4PhPko9cjWKmM0huJ78WGdr564j2HvRr5Py
	aHLbNWGwintvKemxXAB0TmoqJ/zPTiaqKJoW9MYEMM3MI0m2inja1oyL4PEc14b+CRaAYZnnrbn
	66VkwfZiX69xM4jlSJm+qv3ZNZaPUAnG8JcrzqWdav1MS0YXLcp6yKqtTwYPmoA7TNyWGG/pmRR
	CDetYxbRdJwqBSBAHqiKDwNSKrz0RPaTtDOcA9xpL2BXkiA+vkmBIb0bg8WjJLm+hIxEkU8BY5H
	BhJduB8GwlONFZCq7RrU1eFn01RHK3dhjiihJLW9B1jXUM52ZXVUQsuPoA2RRHB+UfOwjQ0KZu0
	XEmFSby8awP9V3fgG0Vudgxw=
X-Received: by 2002:a17:90b:2689:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3ade9a35ef8mr5288326a91.3.1793014254519;
        Mon, 26 Oct 2026 04:30:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3ade9a35ef8mr5288290a91.3.1793014254037;
        Mon, 26 Oct 2026 04:30:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:35 +0530
Subject: [PATCH v2 09/12] arm64: dts: qcom: qcs8300: Add GP M/N clock
 controller
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-9-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-GUID: VkCvClcgCHc4MnO-EbX3rPXg5SBQQbg8
X-Proofpoint-ORIG-GUID: VkCvClcgCHc4MnO-EbX3rPXg5SBQQbg8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX+iOjmV7pMLSE
 wvX5QhSeYIfPZfTn4MpcNlE2uCgRfmpOWcRB2Q6SvrdMgVf+7r29gg4/OzX42gWiODYUvw1LvA/
 WiRh87pFNyNJW31QdJdpLLyAnqO6IyE=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf39ef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JIsdQxy8wyWm9aXyvGIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX49cTSLg8p7kg
 u/T1l8JMR42QLqW1KQEDPwX9Rzq0cl/++osnZvHfkUJ3ETxTAzSRFjGA5P5HhNiuaNRavKhRXRu
 YcFZh98+yFycL885u8XPmmcFU2Ta+C26qra+0FQcpA9NE5aM7ZuBwP939NqkEg9QP0ZBd4VbqOu
 TvXgGEHdGXrLBSc2t5vSNJOl/x3QrMaQ73+qwu+zjkNUUxuVNR3Cw2AbRlWhHPWcSUVI8MpyQxL
 KjJAx58v75Cr43w5bZOZCsm2OHCNhrqkGQgviUAAx2Fau4AO8Jb45n5/0h3TPemxqjMUjASuHPV
 MKNHPHX/as60M8+rbR5jCGeODUgl0FgQ66E4LEoiuYT9K10L+JPSEnqthSCsh3MdNf/UoPekX7A
 P29EYh9szrlYj43EqldwYA5JNGrGdjTCQHFA4ktW4GPzU8hk76WjVisrRMOjWVrGm2Wk2JLHden
 1qF8l05aiyhwc2KPAcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for QCS8300.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio32.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c652005dae9b93bbb8f6a28b48be3b..e122f70eaf20c65df5854e644887ad16da94a7ec 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4891,6 +4891,20 @@ sdhc_ice: crypto@87c8000 {
 			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs8300-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -6457,6 +6471,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio32";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio106", "gpio107", "gpio108", "gpio109";
 				function = "hs0_mi2s";

-- 
2.34.1

