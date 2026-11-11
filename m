Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391267;
	b=jUT7mtoAAWZJwuSYasPqaA6usJGPy0Xv8Py8uNZWawjLFj5jyvAMYHMeAyTFxR+lK7wC
	 UL0YWomEYQG/bNorqQw1Vo6JwsckoOANz2j2UNPws+yOMBzSyzWSRdB6j63qXI9LJVfY2
	 vWp1cB9Zd6aMAtSrKgxwFxJ4YDpQrZHxgwsIqDeITfhgGmeGq7dQRhs/OV9++hkjO7ESh
	 gzyXXHEHB8oOlx16sNCDdAQjEBLbYA9FMFig0zxWLRSQvBJAIeIy3ebS16dlPbK2cLsAS
	 +JkOsEZ7mt05TMbzKvE8mSxLmR9HtBcXcp0Y2KMjnfrPbZ6BWFqcLu93/WgpOBmMrzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
	b=ZejAWEjW5iJ8M6YOng3vxnpA7zGZKzxCGQyAlO1DSbHoXv/CWd/ilozBV4ybCzOgof7P
	 2/mVdAY7vSlqg5Uyvl5VQoWCL/mnNgtYuAlXfPHHtM98qJYwDi9HRqksjt8NPtsyjgepx
	 JeEURL3JKOcdonAAdosO+znAQDoX7y3z+rOpFGIJPCb5wmzV8zhp7zW7eUDiNJPmamkNq
	 sNcb+g7UR4T3xZm8apy90yvkbf1t7wTDZAT/9CQJu/249+yMlGePWS3ZMIHD+wY5Se7ea
	 xZ5+jPTGC4p90ZcTBw/TYvoN+zL+ESN/iKc6x3QwlRimC52uYk+CDOzd9QC5iHOz0iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCwbsGiL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRJNyJJ8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47AE60A5BE3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47AE60A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCwbsGiL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRJNyJJ8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KgQ9300708
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=; b=QCwbsGiL8deVshBN
	cKsOzIJQ73WyK29znFgl01Xga7/uvYUEIct+HpOK+0/5kHTK4MnBex1/1pI0OVHB
	b3mA00840N4d5bldQbmpq6bIpQ7kfD34OgtTDxuzMCz3UGIElEvQ464oqVZPi3x3
	mz/qUwxpTZpN1bnKMimTZr8DtNoXVQJzK7y4z8riN+BRA3x980sapxsOWy2Okjkw
	3jNTZtWfvuPmX3oEkGtYCP5lWJKopTF8cF6yfhcAdGoL7Zlu/yVHsEkq/76t8LVA
	+zpmnJ7I/DP9fhNTxQGR5Ajmb3lLGXtBB3P4XejoWrYygVzjMFxZcQzHxyk39kZR
	5Eze5w==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5kps7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:01:05 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so3646299b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794391265; x=1794996065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=kRJNyJJ85biOA/kKJTj60e5iBiRXfByfWAFvSaolxQmJlXBxm04riDm4Z2EzvI0wKg
         6PQA4+MQ/yTHu6OC5Z6NFcCRUsgXR55nss+2gPAEb/j9UOzHWF+zDH7wVn6LBjJPRq00
         PA6a0hWfPHZfVc75pYBIcKMNZ9iiQg9MUtDVOT2rtqFtGjBfQ4Q2Gfc61RZmm0hvjwxA
         Um7RBArQbqdq3BxAH4nmLZlkfE4+D88OTchpT8Fg6VEp8mZjSYnFvz5QaZSQl83Hr+Tz
         dYqUJAdG2rSSuBY2vavkuMWmYGIEH3Ef0u9b393zsbUJUuEG4ritq2T/7sbzfCFbnqVB
         Q39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391265; x=1794996065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=p7dpSgYO3Qr2qQHe8FaiY36R8sXmpAjiwn/j8vxxz9H+3pfs/RltADRFe47RItzkO8
         YcOj2erHn2DUy3B/ce7oRsgrnupL0nUr5hmA9SmgX05G+cYVmHn1zgVrKnQ4vFmMBnYa
         KaU6qgAAz5xKHzJvhH+fHnQhLqr3bsS0BH3l8bF05nO49v+YlEkcN3TxnpYXkfGKzFzW
         BviSzWas+elCWCybIk8x3fOPacztrZzDyY8YHQx2skUZuDKJ9DThFu+huayjAgHdcqT/
         tRDCsDioehE5zlputd045rcazEH1d0g3Jx5nTRjIBiCtQ5VbMes1pVBqYf+rVMdD9EzM
         UYtg==
X-Forwarded-Encrypted: i=1; AL+hErGr2e4B72UVRor4BYhH+8b+XQAipeMiQsLEcUUPYV+uwwlxGpqnzHnCvTet59XmyAaWXz+u5eapNaEvlxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tTXZSRADrsZ+afBQP52gg18J/NH1SDk5pNNlMeKkTfwOHgqBb
	snZdauUYmrCz7IRHtK7hUVAZbogJnoTaOJeWNM14IxbXxSg0Sv/033JXva73CRfVIyuNF/iAMrO
	cIL8XOiowfmRILj5eZhK+PhMqk2sXH/8iSOxnOxT1NiQavBpASEVYqTvJIuTHmzKAjl8=
X-Gm-Gg: AYBFou00ytJj7nFjHsDbZrepnyrYt6m5208gNEHDtafOjaYEyYZyoM5q3FjDHU1vlEF
	ThVZh3kmRK33rmRPs0xaqmuC3as0QR3c5rxfw/Q0BpEuY7hr552XQ84p1BehlV45JlGdCugpBwa
	FORQf1th65thKtBMWzJVzGDjDflW8qemdUlGNdBJNAc8i68dT9+kRYPLInazh2Pv7vBwain9OTW
	h89PMaIFHrlGxwVBFFenunn6IRI80DaiABKUlrnUF8WfqfpLpg1fAEuOdbEoHfQ00qekFX4oj8k
	oGt5s/hrYTnH/bxFo9nz4YQYaThNzT1VID3QGsdYAvwcvvl43UREjaraQnqw3S2ioy84NsnQP0t
	IbDp92RwoUs6n3hsqISynKR/U5FeP3FFh+43BPXI9vnCUBTftZaLjGqukYNRfXBGnVU1LSxon6u
	pKcZclJvCmf1lDxxCp
X-Received: by 2002:a05:6808:1924:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-56b98d27ee0mr1503253b6e.67.1794391264693;
        Wed, 11 Nov 2026 02:01:04 -0800 (PST)
X-Received: by 2002:a05:6808:1924:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-56b98d27ee0mr1503211b6e.67.1794391264180;
        Wed, 11 Nov 2026 02:01:04 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504c276sm4686111b6e.4.2026.11.11.02.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:01:03 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:00:57 -0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Add NSS clock controller
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
Message-Id: <20261111-qcom_ipq5210_nsscc-v2-3-7e2c1dda3ed2@oss.qualcomm.com>
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
In-Reply-To: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Luo Jie <jie.luo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794391255; l=2069;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=V7tk6aEtOPhfOk+VPI7cIHGev2spKigLOSXp8SeaGFM=;
 b=FPdGwja/I0to/ZmRBr9rXIX0wX/bDKAU1xK3bC9dhG0h/+sBG00vXJCbM1eQXFpMhieJc78+d
 zQqoysUX1hbBKJPSNke8FUNppPMjsVdX2VfHSwBf+OW8jJwOM6o7cRU
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfXxpLpK3l0JJ/u
 /ncS7Bg9caDw8+Fd5wZjgLAA82Azy6dRPitFAneUD/DDYVkzh5z7lQJhknrt5hYEUmKfcKNBCSy
 bxG/cZuqFtF6aeYIQvG0UZwUDOLDWK4i4zgcbDPFUq24pJJe+gKGvOFH1IJojwt6lLt3N0jIf1T
 amREcqc3JMZy1+XJ/r4N6UY+RbN2YUtPR63lwYN2AJDlj4CK6JOZWs6lc6erdOshZlw+9Ei1y/z
 Sb1cwFajrwIQAMsPpROe+nLDKG/3SxRV+zPA+Z1J4JbIwkrrIEDn8XwLD23Rm/rFDlZCvrrIlyj
 K5HKISISq3zYJY2OynMCeRFzaJbGXmtkOYh64Pd47xGnkN6PrQW0OllR51hE1wvvTYu8ltrCLjK
 jE0iR1PVw9nVNC8xJkoYYGzXaP1BnrdQ2bZCmcPCA1QfFvUSFcCgB0z2KsGP4quL1qy1F5vSZwC
 rQJhUlqujbMKCGTYLnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX7l5RoXVxky1G
 kyxeVkSCfX7+S3oP9sq9HBtHtl1YFKfeOeGZXr0VPkzRSqvX/oGgIauHG9ZI8lqap5Lu3+lx6/Z
 JT5l4/VJ8NTvdtKaQYa8/WS29LauJso=
X-Proofpoint-ORIG-GUID: CJKdkOIOXi7Tz5rIb4kvr42CEA8WC54Z
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af43ce1 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6SnK136Pe_QpXSRpRBcA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: CJKdkOIOXi7Tz5rIb4kvr42CEA8WC54Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110039

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

