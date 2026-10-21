Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549888;
	b=iwz7PdMl7Lb6QqIqrhfAWu1zXwnGAfKKod4AIGqXoU5bH+/CFjepdXTAgMNyq58vaF45
	 43+oEfx15DlsxOIY8bdD5c3BPeOcZ+BC7klEImr22b0hqlfZ8ksJVDwdIdb2AvRF9oJDD
	 R4Zm4sY3LgDruSOegsyoNCG5c0gKv8xlVKDrv3R8qn1L2+sY8smK6SLdAvzEvtPtBdtYs
	 lwvN0viHAFE+r/rd7jeXUxS4Q4UygoO1woH8Lz+SxYv1/PG0v3RXRFgSrANzLT1OuMQH8
	 RXV1CkRZT/Yue62cUX/yPld+ygah6dMB2LYyXL9kPIm9kY1kLhMiOb+F8kwJu74dNKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lj0kmomju7m5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=;
	b=U1jWqa4wFeHxl6WdT/yx9zWiBNHchprYX75npddqPVWnD3Lzk0Z3PospOpuZRHSuMbQ2
	 KSwpaJ7p8O+zwTt3opxvijl6f3/Vi3i0DcmwLt2JKyo0q+Y4Ed9ZqiwOTolE/O4ydvQZj
	 ND8bb4badbUxNPnplR+lrXYwVEvbGQZ7dlWpuW7BFnnH2xkDKA3PvwpbApOvz3xlIlqNe
	 4iK0l0qqa+9JXa633ZmKpTzMdcehwursV4KF+yiunDQEKakTOFGzi4OxHwGzoDDyFk/vn
	 qnwzVZfB6C4hqejf2jNuK63+wLbgWA7nrF1BLK1xzLI/Hz9IzzMCGm1wHS8AZkmU2Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMt1JD5J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="jA5fBx/9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E4606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50E4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMt1JD5J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jA5fBx/9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2ExPI2562791
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lj0kmomju7m
	5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=; b=FMt1JD5JCDGlx4wCpYWoAnHdRHf
	YVxX6KBCwsnZcZaaBrgok/Cgb2z/OgZl9JJbfYSvMcN1o0qDiR748fLX+neH4WST
	oScfI6DyiPUZjv0e125VN4MEM+ozQn4vSdqsIL6mMpEfv94ybwj1T2lf6p1T8iUB
	JCy0rJuDoTvlVSCaBSGM0EJt8mOpzwLmHBdTk7EkxfkfS5NZiVG9kGm4ZcnsC5NX
	1cuANzOjT1iK1gT5s2SIjXBbh+QpNUPoeq3vJPsHMdkjuJq5YidYxqJXBiWvloHs
	ZsbbisDFp4RIvz+DOfp5H5MtTTTkd7zVEtNW9QYSN06e10cKpokwfpYgBsA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd1yhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:26 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so266287c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549886; x=1793154686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lj0kmomju7m5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=;
        b=jA5fBx/9SodvW5dYbJ1b6xj9nOIepLWRfEJEXFnoXGhSjF3z1LUsjzkkihdjCgdjqb
         JoKqRp1PYCxfRz/RQEs1buK5tA0E99l/lpi1uEZ/iM9K6Qbi2ICtwUG7ki0H9fSARV8y
         1Q8EgDuaMJClDF+YLMIWdKjwnOBGAxJElwXNVrJzLTjadOIwgIKaBFetJ3ZDDHlbHL7W
         WaG3oE9CO3lxyEDF+fOPJaCnFbb0+9/5LhYdWQKFyyV0qlf5MMWI8onKO3kIXrCAZh0S
         HDDnbkGWcZk0gEl4IAvRaxvEkyPMbLaRO0UbS2WxW+ivF0nd2SCTkysYm5CqfoaMz0oH
         JgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549886; x=1793154686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lj0kmomju7m5w1CpEmOSa5jPN5H54nN/hxyFjisk2rg=;
        b=y7loW+eE1DuGNfiYcTu+ylelG13baO5HEZScm4r7Aie2ljTE75pojurx3E93oHfDCz
         Y9xOCZulx6zjDlGZSyN/QpyWNP68hXSP1NgKW0JZrONnwvdXiYHo3fw+ackRGjhY9iNN
         D8qkWFZdHQ+sUgcS96IBKJJ9sI83Yyl0wlYQfPY7t0Z2OBv13ZwuAzVktyWKQNZ2ADzC
         7Ej2rKB5y0c/JoRuUVoWx7XkRQC86GfgEScIemmXe8kmPwBlaQOA+9v9HTHcXCXpbvGg
         ijD+eRYVRQe6hg8YL1cmVcI4tqCNgdr3/nSEEGMV6NIZvlx82i//hKbjafNEGptCcN4H
         NkYw==
X-Forwarded-Encrypted: i=1; AKwUvBx8eSj3bsQd51AigVNdt1psM0FCtEV9Yfp3Qpv4rFBqemKaKEEBJBYHc37SdI7igIJ21TTez6+eQaqNtiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9Lf/CZNL8OxxvoTxPGWdFrs8WuIKHnbXsc/ft9NicM/dhjprE
	/pMnG5z+nXyv9xxDLl5lxKZQB35gXJDXFCvtS0lGUtOssiElR+ixwcGqXBJeVTmnSIUVgt0qVcy
	EBGkOt6/CEKvefVEUJLzVQouxAfslreFUqhb0m5pcgz3++H6vaANcoe4zBd6EWDBAaVQ=
X-Gm-Gg: AYBFou1GBs4czT5THtXOE55Bft+8Fgd6VoZ6wvyT7jlzvfl85Uw6475wA6FCtLsWkxv
	Dm9gov5sj+B3VXEMKN1pSDwoytFI+QVn9Kh7L57Kng53+EBq87aDgDtGFW06wHbq3kPiFo2oSKc
	GXpkbQjfH+fwJQ8IEHuKGQXSzfrXkv81SgEAF/58yyOEgNzRg2RoemkT/9sW3AAmpdQ/Rsr2NZq
	3wr+weg8f3k2kyXLygl8KUO1F2NDPWJgroopqxKmOvwib2NJE3GeqDOzblfN68ECXWnJUGrRHxF
	FR+TB5pcRgMImI11EQryduhBgVBqf294jlYvTpbrdwkxReUNv4bC7Pk3yv9ERmILKHeLHsBEPOr
	5L226SMTI7iTc4840/SfJ+I1DX82PVgbWCxwVeKgKD4c4W69zgB+2SpQCIVY=
X-Received: by 2002:a05:7022:7e86:b0:144:e38d:8e52 with SMTP id a92af1059eb24-190a784c70emr996412c88.37.1792549886116;
        Tue, 20 Oct 2026 19:31:26 -0700 (PDT)
X-Received: by 2002:a05:7022:7e86:b0:144:e38d:8e52 with SMTP id a92af1059eb24-190a784c70emr996377c88.37.1792549885477;
        Tue, 20 Oct 2026 19:31:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 3/5] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
Date: Wed, 21 Oct 2026 10:29:18 +0800
Message-ID: <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX7wXLJqmr+eSs
 5waUJOVMm1pnhsgvd0mddkkqHntZbtf2wsuIIh/AZgpk6zgQQAHgG5mP6ZNI0dqsMjWmYQBI9EL
 aJ03H9hOEAPx6DTCGLaynSCbt/jikerL1sFLxyq6kift2Jt0mIUfSXOF9mQhEHtMqfK0uQSasLS
 9dZvgJQagmetcZ2Gn6VBHs7Pg0pjhktNNL47j+R6q7XKOM5U/icyh9ZyYrfGWA79oiI0NQcE/eU
 O/LwZecKfvVFKVF2FgQzIb2Gvw0vhnVp+SwVBOLkAQ69I2nEQXdVa5g3vk7S7r8yRDUxtP+c5Rs
 27cL6Ca9G1iGKZZNySt2PZkDzmh8V0w/f7+SuG7bCA+EgIS4MHENiNKANuErRW94BDSXoY6gGMo
 rjUzdP10MCH2QSa743s44EHbXbiO1cmTcfSpUu0Src2sYC7pSCoktoCK2AHYMIduSxE1rtvHrP2
 rNCn1EQeEz7tHxRT0zg==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad823fe cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ccc3-NsNM3ZFeKEqOdcA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: ZyV9vBtM1YpDZUF71eb502oAF0ImuNci
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX0OXX7Mv172rL
 hkjw7uTaADwb6hQY0xi1A6bZXOBjl5WyzKXDANLfTvD4xAadtUX/qwpUp0qRPlyzEVrO20H5ngC
 AAmSa6kpNfSjKnoZN1r89jaxydDq2Gs=
X-Proofpoint-GUID: ZyV9vBtM1YpDZUF71eb502oAF0ImuNci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210009

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Ride Embedded board routes all four PCIe links, so enable
pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..fcc07226db8b 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l1e_0p9>;
+	vdda-pll-c-supply = <&vreg_l1e_0p9>;
+	vdda-pll-d-supply = <&vreg_l1e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

