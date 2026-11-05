Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884087;
	b=h8o7ymwcm7UJ5ZflbhSD3deFzljSJrnuMEEfp3Ky2ZVLvmgGxuh4KHnj23fB6uBnNzn+
	 0g0vrZbqtKfZGWDLREZEd9oIk8YNQlUyJ7rTdAh68wgo9sOPUKFjQ+Wt8VeRYMr6qk1Zo
	 paRlu3xHBaoyKtSSH+56mSgnDJ7xxXexABbLsfsnxiRAE2Nr+0dRxqyN99M2yHOje3UAw
	 jQZLd260GmxZsiSFgSL+vFI3shpX1OMZbbqQzWBeROjjdH8dOMln3LuTqqapK4l32p4Vf
	 kzoU0cL0Ie0AzkOhzjIzQ6gv8ImqpZiOh6z/B+p45cUqSZY0JOMwHZ1K/X7/ASJ331Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
	b=R83sKKrTGNiHCU1Oe/90o+AEZdT4JRgIhlqV2gySA14divsF1wbWmW+KJSRdsrHDhvgF
	 28L0CqKZvsai0K8jTtdNskZYsEbF2RIWEAc6g4p6IV28donmxlHRBHdunWEdTBabsiCPJ
	 IrUM9gQtOG6KTMqMXusb5bnhIfwOl2MGxZVdoWGNs4EHpij4cT0zs7wClSpuypfklebgE
	 t4T7SgJBWDjEFYqIeCTzxgvB0MmtXRX3Zh09iGd9cWTRIyGnY9tHRNTFAxDbOnISfnMS7
	 xEfHH4MvzJm22dZlHMQYbgbTajeOBQ0M2O901JYE6UvbFd8LpCMtsP3+tVoBXTMy7nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of5qfoBT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JVnLdgok;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDA5606EEBD
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EDA5606EEBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of5qfoBT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JVnLdgok
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tJHS082990
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 13:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=; b=Of5qfoBT2tN7w9SS
	eTfmrVcEdQLOeJ91QDApW8Q9Q4pmu3QFKUx3TLEJMqG3ONm5Yy57CYpyoFrobkJ8
	WtAWOsYmjaf/la3Zb7FvCsf4hcgqFv3zc6krJ+B1FlKFUNSzdRXWUkIlhhJstMKX
	JgPQoaf1ghM0u5rJX/6nx2LBSeY4+HnbiEj/HPSHHXGnrbT/N1VqBHcHnRiFtkGI
	+q4I6AmA79Lo50xLbVWEqTa7pGGOrq3uoxT+Z+uxXUgGBq+z5XIPxisa1r4NHd5B
	yTP6sCLSh5MuVT3lUBwe/x9CSG4t3g8UxETuoILb7cfw7G15prvoNHD1aCQbwnNY
	dW6aKA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p0wtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:08:05 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b18c67095dso27875327b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884085; x=1794488885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=JVnLdgok5agBSKZUB8toVIcyAUIyoPGRkwTKUzo/zynSPCs57SRvRc1QXMB0/rvgnB
         fLYq7g0f1WllPtPCKQHPYti6wv9Ijcky9mCj0qvatvuJX9pd5BQTNhcaT1Lwll4qPqsC
         L3azSHHHaumB6WBI+XcpeNXGvd0q1udenIuG8dgA4F0Ok3+rDYJiwtMM99u3AeE9SmEL
         5Lz4i0Lr6zAnyYCT+zjA2LVJx9MlCcxkvuKOqLmiuXmoAsw/o2PY3FTHwIFgZvl9BGlV
         ntat4z1wwuUyFx86Yq0NLRr3DTgx71QUmA1XL3hNHlyTdCN1x/AebzGB9Aecj9Fm4TGH
         w3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884085; x=1794488885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=aY4Na/w325oJG/hqiSYxQaXR3EaGM6qoZDnUrfFICou85wFeeyDsGJPUck6+rpzyXl
         Wm4GbGsaUIeumducaXKo7DoT/vQa0y3ZLb/vbkYTQkP43q0G4SZHKnmjZDzPclYSDTGW
         n9CoW6V/MDZ2Ad1446WvZvYAkp27UPQbuHBzPh+aqh9PAq44epdWYe4R96Z3KSYhWiBh
         dHcMfNc7R+9w6FCrD6zdLjLAmLC757mK/n1oyTbP+kULkAagzjLtZPunYD3C1xTduO6S
         Ag9L9ebQzaIHFS/LjUMyZLGjZVwStVtXWh45sTu0ud3neGtrN672JVTkQ5/RZoJoCtQO
         y+Cg==
X-Forwarded-Encrypted: i=1; AKwUvBz5Wv0BXjuCCJPF0tsMPpWMaEmNOLh/CwQVEpimQawpvrxyNHe14fKOEirDQOF5PhSqvDdqy1ZIxp+pUk0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FYWVxI+XXmpstM56YqBi1w07BjEl95k8ZdKObCwq9DcUbGXMq
	3DbCRLxcnk9iR2AbHF6Y9Ibd75C1Xs2/dn4kXXu5IgpfxL+gBumw+igqP8xwjJXRdzN0h+JlfIa
	/DI45ZvWXJAVEua8FE7p7hqcs1e+Rc1bLKc9/dney9D/BIX5ua4gPRDR6Ys6MQLiSJEY=
X-Gm-Gg: AYBFou3yD2IkmhdCpDAiHkum0dauA3mc828IWF80o7zTiQX+eVF2i8DOL7r8oOOa2uw
	yTE2X5Bo9o2V8ePI3MKPpTuwoaFt5KnMEgAk9jDgk2tAp4UhAJTpitI2LlQR2sypzyhBNBueoKP
	BQgPxN+d/110YeqyFpcLvug0xdteeCD/Dm1ZVzL1HvSIuchB361ufXS8WkXsPq5jiu2xFfSGSKb
	5aTPTpmwF7AZvtH9CZtHrpQoV2PPcciZq44v193BAmyU+/WtrBssBqejkuOxPPTlcXemz59+ttB
	WiZQaAQjPMJO2S7VQCEOYNNHuJX7Yaou1VymXM55QWxYtMNLJGM3Ubwm1MB+nAhUcHMHln7E1gC
	RZz08+dXb7D0VPSVYOjkfm3CmcOiJSlWQ3Ib1QtmLkh6bV0x+c58h3vopgV+aEbi1dxMwvy9br3
	1vh9xXvajIOP1mUqWQ
X-Received: by 2002:a05:690c:4992:b0:8b0:e680:616a with SMTP id 00721157ae682-8b2b66f45dcmr147056457b3.24.1793884085060;
        Thu, 05 Nov 2026 05:08:05 -0800 (PST)
X-Received: by 2002:a05:690c:4992:b0:8b0:e680:616a with SMTP id 00721157ae682-8b2b66f45dcmr147056237b3.24.1793884084340;
        Thu, 05 Nov 2026 05:08:04 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:08:03 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 05:07:16 -0800
Subject: [PATCH 5/5] arm64: dts: qcom: ipq5210: Add NSS clock controller
 node
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
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-5-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=2069;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=V7tk6aEtOPhfOk+VPI7cIHGev2spKigLOSXp8SeaGFM=;
 b=NQZ0VnXNNs5TVcS/GfGIp8OMqr4bqDVVREAqgfRdanu4y70VLhmGeYPMpHa85TCG6ztA5t6gu
 bw6K2g89zZUBmx9UG19aSrHFqkgmyhdbqNUcRDDR5s47APAPUsRdBd/
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec7fb5 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6SnK136Pe_QpXSRpRBcA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX8ThdR+7yvqK2
 QNyGYkd1ERUVhaciW8RZB0Tza+Z191+t0AuEp0/RsIvNd30HLBaEC+S2nbUYCx6jjLGIgp3t905
 y5mnYEkOhpT0reomeyh8Xfym33AQ/mB78gb6xSUeM/pNlWkxUni+JoH12B9MuXBU/jOHhuGRz4G
 2ERKyyNtehlAzMDmw6d1FyRhwBiAtm61VZXinPxDFpWz0d/oJKiv7Ahg8XTpJzLVnTW8MYxgZi+
 odeJSrXEMs1aTU+46jwES5QElK5sFmjeKwHOmKkCRkOX27w/msZ4ioNgMHV72zwWCgaJui+1YpL
 k9ad5M1s7411tt1jnlp6xxgwIrVe4KY/mvOf6hOt0cUreUui1E6SfMFXZsK1a2coUUV+IxZUi5H
 CBdgFkPrk+l/Mvs79ACnu2SLElTNsZPYfvksnn/9Du5KLAr4ohSTQnQ2FKTx0Abr3CH2DbQhGaW
 V+UjfpsGQ9NWsyQzTig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX5nqMV7uzIMED
 /zZ4Ulw5S2c8Glpr/1D9XqBU4w8zANlTY3XF6i+6sjg9EnAOjtpI4J6IL96lLzXQKNhOks0MiqL
 URwmxxl/WQiGQhs6l5C7Gml4dzTHTHM=
X-Proofpoint-ORIG-GUID: 2TaM3Uh4lnQVSCLnoRdso7x1MaHOhABX
X-Proofpoint-GUID: 2TaM3Uh4lnQVSCLnoRdso7x1MaHOhABX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050052

NSS clock controller provides the clocks and resets to the networking
hardware blocks on the IPQ5210, such as PPE (Packet Process Engine) and
the integrated EPHY.

Note that the CMN PLL output clock names are reversed with respect to the
hardware block they actually feed: IPQ5210_PPE_CLK is wired to the NSS
hardware block, and IPQ5210_NSS_CLK is wired to the PPE hardware block.
Documentation is added in the DTS file to call this out and avoid
confusion.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 0c1ede0f73b2..11915f8eb156 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -331,6 +331,46 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		nsscc: clock-controller@39b00000 {
+			compatible = "qcom,ipq5210-nsscc";
+			reg = <0x0 0x39b00000 0x0 0x100000>;
+			/*
+			 * Note: CMN PLL output clock names below are reversed relative
+			 * to the hardware block they feed - IPQ5210_PPE_CLK is wired to
+			 * the NSS hardware block ("nss") and IPQ5210_NSS_CLK is wired
+			 * to the PPE hardware block ("ppe").
+			 */
+			clocks = <&xo_board>,
+				 <&cmn_pll IPQ5210_PPE_CLK>,
+				 <&cmn_pll IPQ5210_NSS_CLK>,
+				 <&gcc GPLL0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&gcc GCC_NSSCC_CLK>,
+				 <&cmn_pll IPQ5210_EPHY_RAW_CLK>,
+				 <&cmn_pll IPQ5210_EPHY_RAW_CLK>;
+			clock-names = "xo",
+				      "nss",
+				      "ppe",
+				      "gpll0_out",
+				      "uniphy0_rx",
+				      "uniphy0_tx",
+				      "uniphy1_rx",
+				      "uniphy1_tx",
+				      "uniphy2_rx",
+				      "uniphy2_tx",
+				      "bus",
+				      "ephy_rx",
+				      "ephy_tx";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#interconnect-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.43.0

