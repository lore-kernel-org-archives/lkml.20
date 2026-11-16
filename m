Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824403;
	b=oqiZjVe4rEKXbyeLXNSLg0fnf3Mwm4yJ/UlJEy/oKStbFyLEQkQMd9XlqCWHYqeS9EOi
	 g89jASvpX3mjVnyZE0P1FK6j3+Y0d9OONhdtvAf2FrLgc8TdJMwXxf1gJ1AjU+4UjgU6I
	 xliA0zpldRW35GKFeLtqu3lbfxgdlO5a6aj+em+EdnveFHhKfkSVPoEf1b+/zRALv4q2j
	 ZP49pSCa3nXWU8DWNFQyirSQqSTeUEpfNx+fsZ/KBG3zKwQtqZLcFTI+3BmcnHZelfhNV
	 t7ZUoh1cP/B1c4xd9nidqRW3AyhP7EfWKZ2MttYjEZgdCXhtPxbnZq9txYpr04QkjkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vITkXUOIKwIz3F/FjsZXi+qjCvbdxlE0z38bkytrMaI=;
	b=TSJrvMHt0F1VTl1ddvsGtb7pVsrRtALI1XTQe3VIGcXiCM1X9DnJtOgqjURpVkz4YZ8x
	 wl5kLqU6sRpZyy48mkcNE+I4BaAfR4LBnFm6Jn9V6kS4m6vdqqpJ+LEbX0G6ojfGIU+uA
	 izL4wthAogfqmV3tDVnxwETfDNszc9dBKcj8cc0FKjqHJO31jc7vLeWQTtmG5wJNJ3GOG
	 pZcQidbtu+0IdfPIIPc5UvwQ0nDgYs9499CPRfhF3xzDvR0a8dV53hnIFoq0tDvkKoOj+
	 zHxuC1gjSgmNRcxtKYSpzbzL2KfYrKfBJtm5zaQBzumYUOpnaJy3+paPMRDMzFco2ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hM5tp0fB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KKZIGoJP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC6C60A2628
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC6C60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hM5tp0fB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KKZIGoJP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7exWK3488793
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vITkXUOIKwIz3F/FjsZXi+qjCvbdxlE0z38bkytrMaI=; b=hM5tp0fBHV/jKh+O
	3uuQVrORrHiHG9eua0pHNlVRvWLW9YsMvmsQRLRLIe6jPDTDjlelJThigIj8OqpE
	o4JsbnRCc68SrR0MIVMyYSVy1IwZm0v+Z5FYByDrjDZKCMFemKCROY3UAe0aw/jz
	kiS9DTi3cC7FB/ouxl+abIqfaO49R28TgFnRi+AilGIXOam1iOK9FKUAbqbLaQdB
	i7MZJFH9K8GEhDnwJ6lfzIYHnZQb0inMcCAY68KtQdfFbdXCw061OAli6vASJ0HW
	nNC50bhR7mFasPiEmwQlH/m5snl4KUpGvdWH9tecD8gHpD1RPCeDShd26JowsHbD
	CLOGDQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcdwns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:20:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so2685406eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794824400; x=1795429200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vITkXUOIKwIz3F/FjsZXi+qjCvbdxlE0z38bkytrMaI=;
        b=KKZIGoJPBK+zbWBtjKofURWti0lUYU4eysl84RA99BAwZcfpDSzS/yfrDyYrp2DlDO
         Nmzn/7U32spcnELXTfyA7eWPLTm0dNyEQCyHHCPScAMVKWhDZV26uwl917Lbk8hmK1jY
         wn2HpzEpaEZMdtHV8QDNvF2kmufa669TDEdKCx+4esnCYIHw1bJq2+mWKTIXp03+kMWt
         zvxuhMzV60nWeM8qt/fZo3H5hw8wdZ1xsw9G7p1jV0NElt8gdWP54xnxQcmGYiopfOhd
         1fVuRWU9MODwK4QJ2XZVIYm71oSZ0OtCMkone9CGiG2+wtNwnlqPu3+YdGbVweANgb29
         KCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824400; x=1795429200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vITkXUOIKwIz3F/FjsZXi+qjCvbdxlE0z38bkytrMaI=;
        b=nNRnrosjKZtV1Gu6EXcNk+9MpEjVcgw/FSo52d6n2OdrDNIpMWVHDm6MXhfcvGa83f
         MhKcvmbp4Y0MvG+tAwbkdf1aAMDyll20iDwKqeu8xSWW1CVkfItgN/fQROU64BXthgor
         qadjB168+xvYI2VzypCShDttg9rADt05P3wTRmdog6/6owI6+TSFM4vJ4lBWNFgZcXA1
         GquoUcpSPnGlVoqXCXnBbIMZ0lSuOqVZVBOyBX0WJf0NpIYANgfV5y8QOjZSDXtN/bD9
         oTmWg3lcdffBh/CJtJDKSzPqP3CU2rdbkCDVwKUWHXhyJx89l6GYbFIAIwOsz/Ejx8zw
         6H+A==
X-Forwarded-Encrypted: i=1; AL+hErHsY4mPu9VGnXE15JsVa1S6W/7svqcG0fYtVZ3mR8i2igSI2DVCZW+F5WpQQULJOZd1Xng29ZSAUGt6BwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D3qkRpP7QL0/qt42flHVcLQxKG5/u3rhqX4WIrGjQtw3ja3yJ
	Qam5X6oz2qsFQKZePr0dgwgzmWJKEdumWRD6BjQA5VSbuavsltXFyqByv8d+967UiI/mx1qk/0k
	eFQtjDfP/rtyrjm31IxOzDc7WnIMVjWFNS+JzC3ku4NArOgExpV61KLT5xcnOUi6wxgI=
X-Gm-Gg: AZFdTZeqP7n+F+9teuUil3rMN2cgrUMnnd07B2IEgQVWHXZr8SIny2CSkAuxnalTde3
	5eVaf9JzL6ZaOQIYOFyhfWdz1mHJ9afMudm1rM/R74ig/VjzY4pMdG9eSQAafwxzOHcz8RoUch4
	hgzfZC8mN0mWCoPBCMgso198ytpS03S6NUXWEqMT7m3fWBlNCNBUnLEsM4QWSgj5GrSMWGK1c9v
	TBxSRGJtPfeQOs64WycGxdy8m5kMryfpjc4gi+fa1w4e4iQ6Zf7b73b7OFLMxcx82R8Q+Cp4t1l
	tmOdb7wIsUIgfz+nXRTuhA1cQvkdAlb8EDcYle9t3KedeJIGw2pX14mwdHP7DGQUpfgXHSVtYM7
	KaSBN1Vsn0JDtXy1oYNyXvoRk58PAcFlbrRcwhxxPke3uFkQxbxkv5kdUezPyyTzmOmU/WZsUVc
	2SN/3yHW9foNF1ENCM
X-Received: by 2002:a05:693c:20c8:20b0:36a:37:1404 with SMTP id 5a478bee46e88-37966e3af34mr9607569eec.13.1794824400271;
        Mon, 16 Nov 2026 02:20:00 -0800 (PST)
X-Received: by 2002:a05:693c:20c8:20b0:36a:37:1404 with SMTP id 5a478bee46e88-37966e3af34mr9607524eec.13.1794824399552;
        Mon, 16 Nov 2026 02:19:59 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32599557eec.26.2026.11.16.02.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:19:59 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 02:19:51 -0800
Subject: [PATCH v3 4/4] arm64: dts: qcom: ipq5210: Add NSS clock controller
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
Message-Id: <20261116-qcom_ipq5210_nsscc-v3-4-1eaf92698379@oss.qualcomm.com>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794824393; l=2069;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=beU54FXzwyrnuCcc7U/sv8QlVLauZi/DeLqeFsbtHI0=;
 b=LEg1pPKNgDy7sbq9s336DvRligY97/kGMaXfeVIFPu5Rp3TB7F1OSLTGzJQIA7vg+t40R3AJt
 Fa/hyNai5yYC9d+RQlGxM6nNX8kO8YbJkpwkAd1UeYdcAOd3KRBPD98
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MCBTYWx0ZWRfX630ysN+UXgvC
 OzBnEMIi/oVg6NSGvQg7ysnMhu+JGID2XAvzCiToZ/PKMJKmIAHh15m6gM28xn/8Wa4C3Fd+PgT
 muUPg8inOKBz3oFVjR2SnRYuUiliMNs=
X-Proofpoint-ORIG-GUID: xFVj6zXMD6Sgvkvfx0-E60d76GOCrVeJ
X-Proofpoint-GUID: xFVj6zXMD6Sgvkvfx0-E60d76GOCrVeJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MCBTYWx0ZWRfXxFHjiEhAnC9d
 YbJF1lMFOZ67xdzIL21KMM//vmaeG1jf21ZjzzSH7PUu687SfZ6Zez2MUXsT46sg9TsEN/jCufI
 nWRDoDswjRMBfNg6wCPiKN9YbkyExz+6MKCl7+Im+oGahuuBRbG7ov7E6ZGWYgRJ2OmHed375S5
 4SQA0jWEW5mN3Zn25LS36xG9MHl88wpmB5QgXkap1WXkqPGZz1kO7X9f7VHwwEsLq1iGVmudo/D
 0JobaEMwc4vod2jCpp/yRwjLkfu34aUQ9MYFEvEC8c5rxn4pFo4REiCXHG3Ph0ADAlZZiMOGiTB
 ologZWe8qTRW6iUQk85jb9uj6xah0BkdsuB3ZRGGCvRXtT83zhPMWeDAEkRJNKUz7XiedQNK1LM
 borzZEtMRMnKaZbYGcLCVdqeVOdEiOcPrZlHQ+HVuGGz7I3SAZ5arhCcm+F/44AJnwJO+VQSdMv
 nsDbZdwCa/Ucu7kctuw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afad8d0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6SnK136Pe_QpXSRpRBcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160040

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
index 6e4de7c29d29..575c06a8e14b 100644
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

