Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015105;
	b=J0dMRFVp8l+WdX9N9Lxc18xrkwgl9+K+pTgOpWr30DmAXYlSIckPSvmtFmuCDgANu+qs
	 aerO99npfJJDk6fuAYWuXEUIp+wnamhMkjXPHmAXTL3kXXHm5A1fXTOrvEKZXnY5f+j34
	 gkfenOpyiCTixbo/HDjezsEPMxCWC8F535N+PjfpMm1kPzYrl5o+icL9rpYELHMINsHWD
	 7qsQH8Rj60EHr/CxAJhHOYcK8zSUrUftQX8KAsK9/LDu4iWDH5TFPF5/GCC5lPYYcIuk+
	 ziEFFwOo3Jn0fY/otvM8En2PQwXP5nB02h11cd2mqSqw3vYC4EVFea6Gh/gG5h612wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZAF9uxrJdgXMQIPtYox1qnLFPHrNdYWSb2lkp636Cbg=;
	b=Zcb8gXYE6DIIzn6c9qfdNhSBQZZoTZ71QQEJrcODLKcfS3d8cbJ9nGqf+aKSXjqQ50qC
	 wWcdNQdJB0mEbX+bv/gTA8Uny3uV4Q60D4IsP/SqZL3jQNQUD0aRNSvhAyxBGt/KzQwPL
	 YwgALStG9GthazmSOX0NamxRV42CMtb+KTiygMcAT8fvgq1Eg8apTOXb8d/2sr/dukkD8
	 r+jJe1G90BTUrjJn6hRnqNsiM4l6qavKALf5Jcv7wbXfpit11kmB00ubTUDK62ghQD0QY
	 qPl1IzlB69ygL2Rxw57tQPHm33LJPwXMTwx7c0Osm94t7gSviPeMjVBWzKFrow9lnBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wwh9QgAl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJnhdvwV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492FA606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 492FA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wwh9QgAl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJnhdvwV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtB9G3050171
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAF9uxrJdgXMQIPtYox1qnLFPHrNdYWSb2lkp636Cbg=; b=Wwh9QgAlV7OK+lpz
	y9Xu6eK7uZqP6qchjqNVs3WZKvLgV/76uA61VHt4ycw7kNW0syadJ5UMUump5ZZy
	yEqWOfhEdNyd2ocklgdP4PUKrn2sso9JosnMFZ9gSCk4QMxkxNWPmf1eN4/J+UEQ
	5ylmO/K1ke5S9dnjH8jL8exNM4GiDYK+6GSaHkOT66IN+lbJwfFE2yYmtcm6F3ET
	Wkqo0rBIPn7BAIKU7B/ZQUnRUqnFH2b8KEFtybIaHea9vsQXcZKy/8E7MRkKAePu
	p0waL2BoxfruMPpXVwqB+Wt//KKQuspMbJS00SPDDs7KdFl4egxYCDj8mnW+0xXu
	A29qeg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9xkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so2755111a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015102; x=1793619902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAF9uxrJdgXMQIPtYox1qnLFPHrNdYWSb2lkp636Cbg=;
        b=TJnhdvwVCOf/M+0sYu4mZ0xf0gwJcK+cwbR+mSlvevqyXny2KM7Oz94PZZsG1wrjdQ
         vSJcVuJWZKTZUvo0CLlfulhiqHR06E2SfonRmUHX2djFn0e+55YrUJ/Kliky61dhCaH2
         yy6slNFJIIe6nH3kyZew8UwHuqBnXQ+FyJZ1jxdBckhF1QGVOeQO+8qn+BS0f037Asxz
         8TaTSMP9tPzrDZVgKKOkJ8fnoK81TJL+KOFzGEp2c51vR60B4O+tpFKIVEUKS9nOSBbB
         BhxuNmGSb0UJygXcucDd+ZpTLJXpSwzolsEzqzOMSGVi26s4MgZtu/g9wXLG9ruV2xaY
         r/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015102; x=1793619902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAF9uxrJdgXMQIPtYox1qnLFPHrNdYWSb2lkp636Cbg=;
        b=YmZrpcPpcri9sSgJVaGf7aLs2dlzZXbJhWJEUVeNhVIXD1CWUVtFjf/rULVoe5zH6P
         7APNLa31pZKNlH0c2uIl9aVzORPZkH8lqRzBSW14fQw+qmJkvEYZ5n1noodxuFL981Bg
         5DEypp6gLA5oLUusLnkVPKKPNDR53swa1FxhZN97T22Ed3RUVVSOzzoi9V4MvxmyU4xC
         kVqU5A5R3B5LfP/IaxuMp3Q293o1ZOR5u4cvGaiWZsYlPGK3t77yT8A1xli0mCH08/L/
         fGhduacWKFnaEU26zmhz9D6jxdNiljTuW7EMOH6FAgTlr+Q5E1DjUWRHj5tPw6/X8c59
         gX2A==
X-Forwarded-Encrypted: i=1; AKwUvBxeHX30N2c0hLshN5RyJBt5aPxiT/Bs4dN6/rpBgWhX9MmHKLvwg+daCJPeCvJUCQ4epwiYZsU+p41zIIM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDKtOx7WmYOzaYcY13gcTiS9OAEwILMfzf0eG70bX3ezB6BPrj
	P+aRLOn5kwXEk/63DZzKnlKj1lW0h3uzqzwEXUAH4sk2mmt9MpahUIOstgoPazSbN06ZEjo5lLU
	9v2YiBb/qlFzw6sH/DiAJp2pZ/1TQ0B7/DwW0oXh4/pN/7JmiXtH/fAHkdWqlkHnKQxDLmPGJ0e
	Q=
X-Gm-Gg: AYBFou3BtstvlUL5nLIBoVtHMX/X8BA4hrqTIVI5vzU8ZxHZlQ527rlLcfL45mGKxg1
	I7MyzTrj6+RbwYgLdnSpxI7vH9Awtj7Kz37es6GRqw4fZQYWrnAXyedeOzkBgZeeABHBOUUro0i
	ze0LorsnQ6jICf+cFKZ7Co6Tu4hRx/61YvUy6wPpCJVBpSkT7tQK7Bn/Y/d6GiwihdIwbe9Zue7
	AITjcy652rpI4xXf9q4YtA+XaIkRlhEwErzyTPAOjfZGIWCUiCyuKffygSnAakqxDyWrl92AGZb
	yTS8gYivKhMd2C3V05itL8BJHap2gyvZ9hmHyP7wyCw7IOvOHjW2zGLcNvotWe3sL9fN2FqN9St
	04p1P+76Tb2UntQkWP8jcSSh6nDo3qzjGARU=
X-Received: by 2002:a17:90b:4fc9:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3adeb0fb875mr4997793a91.40.1793015102074;
        Mon, 26 Oct 2026 04:45:02 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc9:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3adeb0fb875mr4997763a91.40.1793015101346;
        Mon, 26 Oct 2026 04:45:01 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:45:01 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:31 +0530
Subject: [PATCH v4 v4 3/7] arm64: dts: qcom: shikra: Add soundwire and
 macro nodes
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
Message-Id: <20261026-shikra_audio_dts-v4-v4-3-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=5498;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=58Tj0Ycl7vKxEl+OiHQY4tbzXcRQxQwdd+T15JQr414=;
 b=8YL30zabkUPBog0iVlzvs/MUs/0c6grCNE2JujspA4iJYvSVrg6TPimKrWrctzPgNB0nhW53r
 E+l0o1jbhoeBXUTa5mCnGJ/Yf1paCEUPW+kH4LIWbQwX2tRtS0sU/t4
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: sJPp7_wW7DzklJZfOtB7YkTgVMCs5eo5
X-Proofpoint-GUID: sJPp7_wW7DzklJZfOtB7YkTgVMCs5eo5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX1S/GYZPm9rD4
 5pQnMFn89yBQPWaH0lr1aUb874x+LvIdLg7AciBTvZIrFKvY7eXpoH9j58awDJ3k/s68C/f9j9p
 5b1zweIx+ZsSdleQolXtL3a0/GXMNGh4RMk3asRooJy1ZXwQsDFDUmRYbveO7lgOHAoT6yuw2Mw
 toY1zOQVXVIEcHvBZFRetpTkGxJowA+WuhAc/PuILpPKk7uuzTGzFMiZNCB1Zsv9pala4W8L7w6
 WsxgeeA209ZsrncVHHmCTuZypjrHHJ9XAMGGvmxxYhoa5EiRvlS4C8W8pS9hJw3nR/oNrPtDDVU
 Jpu4dspZfNNv582V3fNp3EV9wn/cRA/jX/APuJ5XLMBBJ3xS6LLr94Q8ManwjrNzTd5hI2BYU5L
 464FbmBWmUk6Kvk5axb5QoNtj8b+QX6HMiPDLm7mRxRmKmSXoWWB6WlxPGs7Ssv7eWl7sY1pWY8
 05wMr1Xq0OmIma69H/w==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf3d3f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SBFx_aHcOOkmsUdThYYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX2hVA12jYVUgA
 2sQ7cX9ygHMVQr2T4RdHITmPG2yvo6XED/boY2Qq6yqPxWmm9uBBNphcQ2g8FWVd93E1JbynUrr
 aSxEE9fMFI/zhlNDvzN+H+Hk2TUWjr8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
DMIC and SWR pinctrl states required by the audio data path.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 172 +++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 67ad6c3e34db..f234dcdb9785 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1060,6 +1060,70 @@ sdc2_card_det_n: sd-card-det-n-state {
 				drive-strength = <2>;
 				bias-pull-up;
 			};
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio96";
+					function = "dmic";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio97";
+					function = "dmic";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio98";
+					function = "dmic";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio99";
+					function = "dmic";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio105";
+					function = "swr0_tx";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio106";
+					function = "swr0_tx";
+					drive-strength = <8>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio107";
+					function = "swr0_rx";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio108", "gpio109";
+					function = "swr0_rx";
+					drive-strength = <8>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		pmu@c91000 {
@@ -4089,6 +4153,114 @@ qaif_cpu: audio@a000000 {
 			status = "disabled";
 		};
 
+		rxmacro: codec@a040000 {
+			compatible = "qcom,shikra-lpass-rx-macro";
+			reg = <0x0 0x0a040000 0x0 0x1000>;
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_RX_MCLK_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_RX_MCLK_2X_CLK>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr0: soundwire@a060000 {
+			compatible = "qcom,shikra-soundwire";
+			reg = <0x0 0x0a060000 0x0 0x10000>;
+
+			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			resets = <&audiocore_csr AUDIO_CORE_CSR_RX_SWR_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		vamacro: codec@a078000 {
+			compatible = "qcom,shikra-lpass-va-macro";
+			reg = <0x0 0x0a078000 0x0 0x2000>;
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_TX_MCLK_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_TX_MCLK_2X_CLK>;
+			clock-names = "mclk",
+				      "npl";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr1: soundwire@a080000 {
+			compatible = "qcom,shikra-soundwire";
+			reg = <0x0 0x0a080000 0x0 0x10000>;
+
+			interrupts = <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "core", "wakeup";
+
+			clocks = <&vamacro>;
+			clock-names = "iface";
+			label = "VA_TX";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <0>;
+
+			resets = <&audiocore_csr AUDIO_CORE_CSR_TX_SWR_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x03 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>;

-- 
2.34.1

