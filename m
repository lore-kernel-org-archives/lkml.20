Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9614582EB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775698; cv=none; b=AdV1a4geqht9RtQ4MRh5kst7r2OQvJPztGcOyop5pB1AR6DJlA2tgIxLepc1fruxRG83NMMJySynu/PhBATW5sbqZuvc1JqHfA1MyuKy3JLl/O8s2HQyNGOOCTwoLjYYyh1ph6K0VuT2nr8AkjX14MAt1eV0Ygy6nCby8BXpkBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775698; c=relaxed/simple;
	bh=ONk8ORpuDxsy7eZ/zdhchscAUgGd53Hb+8JZrESknE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BpzuxvqMnyTzvZKf9SMfCbikpEu0mMigVACpQramDqDc+1Et7Y1ahEmN1JN51KlSx2ilk0HVvQWElgNdwTdgquQ389fTCKUWnGLrW//fQJ9IMLxhrPZBVaGmJItwQVAvIY/OQn2HxhuLYKmGEGnZRX93157o31DEB9OnYhjSfzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrOskTnz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSXwxi3t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrOskTnz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSXwxi3t"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bcdr3189639
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0hmHfxWXS5P698ha8xUMVL/9pnNf6u7RgQbUvi9yTw=; b=PrOskTnzRFwjzB1x
	wItIU2ywHy7Imk+c6p0vLlWD1oAC8LLdvxsa1wSigSb6n0YVeE2IPvl9Zl0RGvKm
	F1NjwXKipYlgRarqpDdzFokzGMLnJ1huwu/rfJyBeWtYn0EBi6qmLFrScn8YK3KN
	ILYjWD6dxn+56dA++ggZvNBIJszmHo1IOyNX8xJG9hCE85vhThcWnPIKXqQnQJF4
	zLIQw7g94AHT+Q1eF4ht5VRoRb60GMwj1o1S27jvEJAaZCeg+2xzJIFdLWuG9ttY
	Qh6w3ZYeZTtOtThzmh83fISxk6Y+3dxK6NWhtRWb42EzeyPGD/3SZ/31nhcsANmL
	D2H9Nw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx08fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:08:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso51021435ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775695; x=1789380495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0hmHfxWXS5P698ha8xUMVL/9pnNf6u7RgQbUvi9yTw=;
        b=bSXwxi3tKb/zFeEA+6/lycJ8pHhUJn2Gn4WJ90LuQLMd1bnEY3bnByMkThGFTkvjT4
         doLnFGJ+SQxinvMXefrxcYNuMJeqORSNP9bnY+ySERl5nErS1ArUjkQtspbdf2rR/npS
         BL+qQLvUQOmi7RWt89cMZDG/mTmEoiApJwqrrfdjy3W5KEuWP5YVy+JA9i/m0cwipnEh
         E8YzZoE0PJIHMmwcpoeXZtWNLAMzGA/U+GviXssgx6iL+sjUpuDoB8IeR5tqfbcp+L2m
         5jhbij8qP467ag9Z3JRPljjNLkCuzrTvy9eR2IPW/7JQF1a8g8dIyy2ChOkTChLvTt1r
         W+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775695; x=1789380495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0hmHfxWXS5P698ha8xUMVL/9pnNf6u7RgQbUvi9yTw=;
        b=pyZLorRYjd+nitOSiPz1P5sIBmA6pUmoXUi/HbUWZjfhqHRxOkHO4xnW2nOniCsQfp
         elXBqRosKSh2YSDIF6g1dmDuHaKVw7KXaKfKpqcKmYVSBfuBf2zNeA8Dkj+0QFfA02nO
         BFUzZZ8qK5Xn8Ifk9YVn4MKBHhWxNi20hLP+gP1/ONTZ+NgG3OHWNmygrxqhdChm9Miz
         G2S4SbCDx+HnnCnac0+WD7mRdUYD7tP9bHrUBzpmy3TGSD8V4rFP4uB2AObV5T8ennzS
         I7oTop99seyCIF3vreeNWTLo19PFgQxEeBDLz/XqaOOiVCjcjvqgLguEmZqXY6gkKuYP
         DoYg==
X-Forwarded-Encrypted: i=1; AKwUvBwPt3pMHkUjvX6n559F5PEykEPuLSbTlc2erEtg4J746OXbxyGqBZqBm0vBE/Tr5QDR7mPmeTyUVUud/6g=@vger.kernel.org
X-Gm-Message-State: AFuF++k9L+QRS6iLA7Af6Tf/aN4NfRn+8oVc/sXU460KBGz8lEYL7dDj
	khARscZT5ZAS9ORaZchmdGjjCWq2Hihiq+rwPZcfh4rGF8k10N9smiF70P0dlS+Cyetd3Hymenf
	/e+fCavLcGcq+C8vOIoG44UimUSTLdEjN78DsFLPP+lMOoBL3/JkFFkYm1GIYGp1Gvvg=
X-Gm-Gg: AYBFou0tsvFn77kWpOUBABZuDCURD/uz+inKrquGc4kyEq5igXjPIXWLQkraJvtD0ag
	Ht82aDrHDsygrS9bflDVvqPhgYfhVJB7tq9yNfzUCRLPDb04TWgeHaP7PDRAj1EIxgH21zNmUr4
	3k9Hk4wWSKyjDIr6MY0onGo54Y6HXMN8Pnljqe3JHydLlpR8BHDEK5TN0iwt/CDT/11V8v0q7+1
	tcGV2vRmYavI0RPm+20t8VkZINvfWKlC+CDNnhB7LRoKkbLDjr9+SbQxY+JdZ+SUJFqXnvy1VLm
	3tHdhWlBZECQ1ASvdtF8yeaC94rfZXRaiqMzi6M6q3al42uX+miwQGNB7iZq2WOpUMnstwSRpxm
	blFkHh5DzdLD2dd3CHDuEK6wTaQ/eY8w=
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6747105a91.16.1788775694584;
        Mon, 07 Sep 2026 03:08:14 -0700 (PDT)
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6747058a91.16.1788775694073;
        Mon, 07 Sep 2026 03:08:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:13 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:47 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera PMIC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-4-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=2527;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=cI0ALWv/LigAcGVjK0elBRZg7Mq6Gatypt7/q7zaAkI=;
 b=/E2HLTAwFQBPdLx9kvz9gbsxKnsDFT2r1RQfu8/wJ/w4/mZQWxIuwMoqwwFEBe0JIFOz3fxb3
 77OEMduIi/+CEgl/1zdTksQFhWdNkQfQ8q09UjCZERLObqAf4N3/cKR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e8d0f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=o7Fm7CHYE8stcAh43noA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: E6VXmOXS1KuWXYjUS3Q3ZCQEkTuCuCAx
X-Proofpoint-ORIG-GUID: E6VXmOXS1KuWXYjUS3Q3ZCQEkTuCuCAx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX9NEmfVGUtSty
 sdXfNHg1NpajOMQ/dhdvfHC2WuybVxECR61dwbK1RD9cU5n9dQoZVWGqe8KGJ36qdQUj1h0YMsK
 wa0vustzNyjmBhrrHh3pSkTFD56MhWc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX7BFxgoakgcxp
 WE4EEM7b1uaCqCDlQBITlf0+vHFygmCKRlIXT7vY5E9m/KFTsI1obAnHSnAfTr6GlidyjXh1isZ
 PwS7fQ/r+g4ayqp5IIZ/1+PLFauNKpYKDt0eFijPNPHLO6o30sABJeD1kcLE8GQZ/4wgWaoiy+6
 l9RJWJ/bkFW1hy4Q5cBkqQlxj8P4HSrPY6AtuLU3ZoQEqg0chnM06+ssLKnWMx1kuSdHGmPOV4g
 EC9/ZngudFb4J6AfaQgpJXADERsSzTfmxsW9YCf6ZBY+6/BUisNxLn7NrdDg1uyTwqLdrgGK0BP
 tbNdv3oFgOIq+J/UF72KQuZ7Cn3XgXIsVJQAYSyOzEkxSC2mjWvzCRLIHO8xKPtLb+GxrYAZe3C
 EoppzZu8D47lzNmd3oSVPe+HsktmMTSSUd/6zsio0KBUQ2nzB/HkcjI4DUG/w5cSShrr1sng867
 BfnRsfmwcvhV1vX4Iew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add the PM8010 PMIC node with seven LDO regulators and pinctrl states.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 69 ++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 4df3ccfee106a49ef8ff018f22b5724db0b76813..68a191890b7d875564080d9fccf85ae9451cf0d0 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -671,6 +671,66 @@ ptn3222_1: redriver@47 {
 
 		#phy-cells = <0>;
 	};
+
+	pm8010: pmic@8 {
+		compatible = "qcom,pm8010-i2c";
+		reg = <0x8>;
+
+		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_l6p>;
+		vdd-l3-l4-supply = <&vreg_bob1_e0>;
+		vdd-l5-supply = <&vreg_bob1_e0>;
+		vdd-l6-supply = <&vreg_bob1_e0>;
+		vdd-l7-supply = <&vreg_bob1_e0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm8010_default>;
+
+		regulators {
+			vreg_l1p: ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l3p: ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l4p: ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l5p: ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l6p: ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l7p: ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+		};
+	};
 };
 
 &i2c8 {
@@ -1090,6 +1150,15 @@ wake-n-pins {
 		};
 	};
 
+	pm8010_default: pm8010-default-state {
+		reset-n-pins {
+			pins = "gpio106";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	tpad_default: tpad-default-state {
 		pins = "gpio3";
 		function = "gpio";

-- 
2.34.1

