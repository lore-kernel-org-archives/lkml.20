Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014278;
	b=N1gSr9LKoRX5zunNkVmLtidyMjQOuCuRDRpJdLWxRImgC8yZslm4DBbDdADzh35XYarD
	 nIWThFjL6f0hkMj49O8TArNkT4UefSSjJDKS4ktbDP4Bu3goFgbm6r2R13gHxhme0qumX
	 bIwbqLpiyC+exJh5YbbMAAAblTRvBPht7FoYg1gslysTDxKwGrNDI2nKIzI8Y/nPr+2Vv
	 C/kQsg6ukwW2esv6/PAy9GOp2PJzpDjZwtsrxeA5/0kLbOjh9qYKpC1Q8dWVU6JuqBpuG
	 mk2eMGOTRLjVmTEefLcSoeYQaYfqQX+Yh65DZ8iu9iXHXSqIK77P37zb14e+sVaEU+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
	b=dFjL/DU1cMyYEU3EaCWPqA5kNF1z0vhzWedKKcNd4iiLkXyzJHKYlOnMofzBPQxyUmvV
	 whrJ12dKbn7kDk3/vQMJ+V0tSVDOLjtmLDB6dGcAE003fdy9pNMlBGUVm0Y6HHZ1QUVvi
	 3ABy7NwCgIgUaK9Ck3ZpDH3i5/mMEv5ewCnFVtHk1bSNjcWSbXek9II9oJfU3X6bkQ+J3
	 3YSsZOFNIz4RV37nHUA6ZFvICuf4f1qfx2jYqBhFD8FOIv8Rm1L9bWzTTSZfwpOqQz3xw
	 k+BFYp6kpUIPmwfFQLG/+TIpveFZlhorJ0xcK59SXtHldFR5+LBkG3Iumzi0l6FfDAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CfQxc4C/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkPpEYnF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4892460A2616
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4892460A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CfQxc4C/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkPpEYnF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsmMc2168524
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=; b=CfQxc4C/kewcTgE/
	Qv1d7WZrlMrN1mNjVUYktg8rKXaO+MniuiEVjqBweZpG8m5lmPGysCoEkLmNV+xm
	5/8fWVO2hq3iYArAubOuj2NJ4DP8N6zggHTeJPiz564yB4twCoJpxKE3NVqPcSut
	fovHAokjYqlTt2EAyzcoeGufiXS+O4NPGJuop8gZp+Q71K0Vo0JOMIlYqXMKlWTa
	nMDCnFFXK/28dbdEz/nS04MV8NkUiQipL9GMvo03JmqxCryK6+fw654eLK+Ua14u
	uIVniQcEEs/oyCdPKXCyOvUZbBZRUEUB4TrnPL7u0o/niVqVN8EtK8u1DPwx3I39
	m8PjcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60j3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:31:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso4451120a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014277; x=1793619077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
        b=WkPpEYnFcFNU7ej5dlx89hAl4uz+8lAS7V8S8D2nQmWY0vARSHfkmsuWkEAArwbN4I
         uw0oH5av1brBVAp6o15XZnaJZ6tDC0JqnXTAyBLtfJq0PBSzdJyA5ZR8xxbe869LXJ8Y
         0coZY/5zr/jLA+iIIsrencUxqFdj92fXTZsZeSf+I6t/6C20fzPd7jO71iYmeX4f7ifh
         xsdV3Feilymx8fXwYH7Cr13jvhH4zHBIYQVM2CH7n77G1aFyfxpdAzTRLP1I3RKXMubo
         ssFvf4klEuqmFlMa0nRCj7mVxA/fOOgAVYQeLqEj9PT+kooZY3r/i//K3X7aNVREEXmr
         eG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014277; x=1793619077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
        b=gguTzptXRIKpmZvJxbCQK3c3rNy55mMLMGyOTNcmjfvsDW8PO6UAPi3W9k/X/rcIv+
         VCmiZuQrEltJOvYSYveLv5EhePijQ+EAl/Rr9ZDa4trq3P5I66b5oXxP3IliF1Q6hQF0
         ClDY7vCnZIX8Xmq3kNMoX7UHG85I1Wo6cxsKTSwucMTulsmI+LoQuO6hgKiOWL0Pf6th
         GJKne13OhldmAQBfh7Hkx68QHeddg49mZ3SyYG69V4tRTVsZaaic/b6LQy/bB+CmWFe6
         IEXeHM8LhW2FhsG2Fwsz/Bh5S+KmzDbrhvTmrpnwJCethGmTrVp4rZ3UYzWdl9kQVDRA
         GAXw==
X-Forwarded-Encrypted: i=1; AKwUvBxToxNyxNqEAsOGER1gy6gsVN4Tl3uPWi+dGGE2soql09dv428wPpUBdRVQUmKBw/Vq4tlqdvHXWoxP8/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+3JFE8RlSRiW3aGNN32YNU2hwXC1IQf5yqWNKFBV+ozVe9p+j
	YVQw6YGbyZv4/Ln0nXxR4NJS67NSpoQHbIspQL5kxxHcEopMk/JAv+cIwmBeB74TrBZOAkCdSRK
	FrQsug9BbUhWblNrqYu6wfaBfKdsMcYStUVYkCETlR5OE7s0Mz7kHePNpzwVsFw3Ktps=
X-Gm-Gg: AYBFou3n4QImdyywDSJmJOYw/X4tifNPJ5Dep/bmMbuFDjxL2zcM7veRp67zzCCOct/
	03SQSZC0xBvh0xLznSpPyF2qNEzxl2dTvdWdg+lhcdehaP7E15pqRruP0pRN1Kl2SJArvGOIKHe
	Tp5nKs9r4uaVb5QXZe8JVlOsun5ypt+3iq3jKOcx+QGsIJkz3w+WJEqL9lD5Gsx2/NmcU6HT1jw
	IWS9dNQyWIRZ1xbAz3gh0yRL4W2n/WVVf4F/d0Cgzdxg7R/eu7pHDzL5+Amrw3+zLGV90mTXYnc
	11rcf/D1Ve1sczCI/bVBY33y/MS3jNPe6K+0ARnsK+Rxucvj9kO9SvWXvX+Bfjg2CpnQ4zNFJI8
	9ZFEf87zjb0BptEJJ7Ic0WLM=
X-Received: by 2002:a17:90b:4d0b:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adeac04b22mr5611299a91.22.1793014276957;
        Mon, 26 Oct 2026 04:31:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0b:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adeac04b22mr5611246a91.22.1793014276253;
        Mon, 26 Oct 2026 04:31:16 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:15 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:38 +0530
Subject: [PATCH v2 12/12] arm64: dts: qcom: qcs615: Add GP M/N clock
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-12-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-GUID: PoyVgHiom1SmAK99AlOOTaiXJYz0RMly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX3mxhz9JuQekw
 DhjqMyV6oX2ThFUErrMT+0MmtuZp3KxFz+qM4u1j4VJiRc6qgVeTrJbl+MdVwsaJDikKuPfEvpY
 oAjS0KSZcqeqbSE9wOVZloFDA1NgtQFRuXiCqo3cbg6G29y7DMmiEfv9YdUzIdedfkZMvOgUz5H
 edBDhU8SytmmhppfsB4S+h9pD5kUDB0zeQbENZTCUrm3jjJMGPWa7l1oYbP9lVzdEVO27zBZTdf
 HcvosJWPGTHZfm8JwibJ6SKJC80jKO4UZSyzfby3OhoPWdZ5uoQyliSuvVEa6ExFOBC84Qrg4QP
 0L24VxMztuRi652noFdpHHeJb/gLbDqqgnqhBPdEScswk1n+vb8N9vXTrdIWjIoGnx72+Zpgehh
 MNyTXoXfpVQJyfAPkiifENoOzteiNeQEXzEBNxbCXfqyZVF3IHCJgh5ZtjCx9SQMLMj3NUExXcj
 9EHDVteH1SkOJCK25Cg==
X-Proofpoint-ORIG-GUID: PoyVgHiom1SmAK99AlOOTaiXJYz0RMly
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf3a05 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Sk_Ya6Pm9egUDeeQrokA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX3k/0hTDnwRQy
 hXG8qVcED1GlBakC+8nxTlog0UFqFH/MaIB4ou9G3umo90/sqhHmZ+EsdkwHe6W0blzPm6rT6hS
 ZdYVCn4bK1w5EEGQuMssx7FLDJ/s6xU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for QCS615.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705c38796698747dfe7bba1afd1859e..c415e782804ca8c9d09670cb8c8cd2353d796b23 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1611,6 +1611,13 @@ cam_mclk1_default: cam-mclk1-default-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio29";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cam_mclk2_default: cam-mclk2-default-state {
 				pins = "gpio30";
 				function = "cam_mclk";
@@ -4028,6 +4035,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs615-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <19200000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88df000 {
 			compatible = "qcom,qcs615-qspi",
 				     "qcom,qspi-v1";

-- 
2.34.1

