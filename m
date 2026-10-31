Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453034;
	b=qhSE8u4DgU9W0IxG5PLVziXdRezPPUZslX+6CCKyWdJo7wtg9WPcYJJYYXDPde4NQ+RY
	 Ack+DpK5iDJkAcSbk5BSQmqUELMrbEfQtxbO9mwvHwjkRbu/QZl7bAJ/vDeEzLHdM60nE
	 /mR+3qERJLhLwf51g2KKmaOAZAbA7soCvbBjCmQnMtjNnOmCPj9GIDRLlD4JJy1Ob56kQ
	 IoBhh8l7eH1DoEgM32ufR0k2zN49+ba3+OHKwVXqm4Bb2O233HtkDXCPBV7vvB2vFCHrl
	 XnBOn6fTdIOXk6NHfQmR6hlGZvFlZAF0tacJjwxnv+IJvlBleSbbNLYyamQ+8LE+Eaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=;
	b=L35E0dUP2dTgC5wSbYFBkfz5VHBozXclFvvqLktBh4FXb0zstcL/4I6M+vF1uKK/J3Oz
	 IBHlvb9UaMU5SxeKLTwSmCk0lyxO2UeJwNUynSBqnFBDhGCVSsKcJVsWs/KoLXMcFDLOG
	 XtYpBNvnU2PvMQknZ/6BSdhtQwQhPknQl1x/1VVz5J2dJPKgCQEw4tCA8Fcu1TiOHEXRm
	 2B9NSB7RrLcJLm4BxM3Dae7/qD1v4Lnm+655R6Q0yXGCYSNaVKDSQMSTg6xLwPehiuPgz
	 +78Vl8v0RJ6sriUolKte4n4jIe5AKG9tUIARz3w165vdb5tuQmDf/3RbHeAHYuDuI3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OHIdTdt/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCjL8yo+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0D5606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F0D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHIdTdt/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCjL8yo+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD03s1590574
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=; b=OHIdTdt/k8FzhNl2
	cpnKZ1ptWxQGb0qB0J1bVEcitOuq4xWEcnr2EOpTWYIqgALc0VUhFkF0RPyfVYUx
	upWrQFRgmhfS0uiaDSOVcGKv+IeKM/01VMuJCS6U66F8YGzVmj9NXaPc72cTl0+P
	byaiVgmePxMVz5surUDUwsvbh/zwI00JumCWPKcHT0G3A9jrv9wBWbU0DDNPeC0F
	5TZh4td081cDKOuegK5XISTZ/LA0zV7X33qphGD5/aerHZaC4QPM8n65c0woUfVS
	m8tDwr5AfxHw6FICPvkTlcq0hDezNCgQJafWxQpV7rOT/aS64OEagoa0lUDi2emY
	Ei1ZhQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk10d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:23:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so2718480eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453033; x=1794057833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=;
        b=gCjL8yo+aKgtBfkG0bGwFG8yW2mFQtzB+R+4pcQmLdSECo5nhjlWhosdgB0jw9I3/C
         wi3n5Fpnp1rK161QtArZNMSTRtmO6dOF5RYPI0Bz88P1gf0IMdMqL2fMzMnh4721s4HO
         BxJ4FBGGYpzuuW+QkfD6TXGfM9UmUkSO43vkeuFGEwWaLx+R+HDX0vqyULPTUBK0Bf/u
         f0dJM/QB67p6o9j33BgZFlU/Ym1A7OfRjWrwEOTzv4zsUj7P+0yyvrwL+bDYWoV6kr7e
         bG5EpQ4uS58c2QphZRCQKP6/zvCd/u8AwfXAqhkO6QNVHAMzIUjhG9Pkvjpm+7tPRIdC
         qdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453033; x=1794057833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mr9aAsQ/GcBjwXE64X4/hSdBwmEaTnPI15Fz4ghAQGE=;
        b=Quwbo/sZUVZgJePS3/0qD1YtM703/c2kboTVaNzI/PpUNEm19xwBj5NFAW8a7mOApG
         fiv//frn1qedApXX6qjowZnBPBrEix6OF5HBsJW0SsaiVo72c5k9rKxy4wvLkaqmTiwg
         XC+b5sRiyFdD0kERncgwT3wQlnPcoRNBw3PIeOm8Ud3qQuE7ilMD0dusSCyTYKg1wZa1
         csK1DBK4h6PgUvW09svjaV0FSQXl50oBI1CAqh2cfdo/2xT0WhLr299sLONny+ER00ns
         etfvs224gMWACrVUWHG8n4i44zKHvX8qk0V3GRVKGyn5vwEAAXU4oWNjC7D5Bp+c3G1j
         cYJg==
X-Forwarded-Encrypted: i=1; AKwUvByEcTcJq/cBOcHaIlIT3+H7qmIU+IFuO0IoUtczBQBukYacWOt5W4Rs4Aw+qjGKHyeFErExIuZcQlVLAsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYMGIZexY16jnuJU/wRfwDN4el0fv0GuGvIDN9DSJRG+iXWD84
	rmO5BWRGcgplmb3n/swLNOCtGMgvs/o0kqJIU/4v+qKh245TBqkBAxQR46u4yQh9Xp2EBzLstzs
	cqq/h79H1Uj8HZCNtFuM9ElTBlknbDzK6jB0cSzWynw8lzYEWZaNx4jAu+F/+5ILSCws=
X-Gm-Gg: AYBFou03pShObzf011To5e/uQXgB0TU5GWU2u3IybU0tqEw1BeIKPBE6PCbtpTyU7LE
	vd0HsQPOjPdyp+qwI2MAFiBncTNzA75PC9cROa/z5zoKc1fOFrN+CyQvHldaFNPWW3HoLLZ5SRa
	0iN66R+C9CxP0uWKdVzfL6XaPqtyiYfPKmJ6DdMFXiwmJgfdaS+0oueA07B3FYH/0GvYAfzwOfd
	SnRBG4jQccQpCt9lKlN0m8XDQFQTM/CasWWnNA5Ynr6UJswKegjS5zFusRK696Q3h+UiiS/NnIx
	h1VzZf/liXd530OSER62DfuBR9ocK+cbq7KwsxwOYikJgeFaoAo6hK1i1TxExyAriS66VmNbOM3
	dBXPdyQHm0pXgHQ3Lyb1bmfKeUeRJ7S/TYc3aubbERPfIGfhRreg8/n757/0C9ZYrpND7+5RItx
	afGmY=
X-Received: by 2002:a05:7022:5f0b:b0:168:3243:c91a with SMTP id a92af1059eb24-1ac5bbb966fmr7281699c88.13.1793453032647;
        Sat, 31 Oct 2026 06:23:52 -0700 (PDT)
X-Received: by 2002:a05:7022:5f0b:b0:168:3243:c91a with SMTP id a92af1059eb24-1ac5bbb966fmr7281651c88.13.1793453031986;
        Sat, 31 Oct 2026 06:23:51 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:51 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:52 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: hamoa: add thermal hw-bin support
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
Message-Id: <20261031-thermal_bin-v2-6-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=5501;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=lf/HWOiVq2goAnrErZNybKHU64QNy57/+sqtdj020rs=;
 b=/Ieq6VVIVGsWZNyme4tdWx2ETcvYzsJYZAS/uqPl5ZZmRudHR0vnc97YcG4YGo2pZBntP4/Qd
 K647mMQbYYcAS1UWfdPAs7fNQUQGlJ+UI/J8s+s20H1EHR1eNsO5Me0
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: 7ey52G88-FVzJksBzeSQpe-eL9wTwU4N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX6AMSliEbWSP7
 pfVs+IeNUZRCCCetG8VAHAXZ4BwV+/zTvn0FdrVPVAGs3gOiPajAxLl7pU/B5t/2W/Q9SR0vNET
 ZJ8q6aSEfaBEk+asI2eQk9c6xwhKD2Ur9vez83843zLqX5PRfNvQsXyBlSrAM0LNspvy6UMkizP
 nEu0QJ538KRvvzTrzhTzN+LwK6w+jMOkAi87TRHqq6mthahIW4e6aT7kl+toUKs/BI/dDkl1QrK
 4M+ok1IifRFLjpjsd03Xf6Fjm/VpoulkOwbTlBqSFIl9zjb5VCRgpwoOWcbcLhRg7LKDo1J9eA2
 e/Ue+dOXlL+yTxRYI+4w9lvRiZY6d5G1Q9PVZVaWo/h9Qf9xrysPfz/N4ovelFJs7G85Wrlb/9v
 j6VJnajXz8G3bYIZGuC+abzkA1tcQzGvJev9ekxznkIWK7oonzPBk+ZC7U55FUkP68zoUUR1CPv
 Ee90Ucpj7hrlMF6N4cw==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5ebe9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HHdy7Z-N7RtC6Qn240MA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX7cUuYkzLFVO5
 GhtNAaRrHUNqyK/5rLNpeJKkwhW0yR0Bkny27WMxANC60+KxicTbdMbhEWQSSnjIAcC4wQudZoF
 5LEz/dQueN4Vt4tolILKCLxTMuCz+i8=
X-Proofpoint-ORIG-GUID: 7ey52G88-FVzJksBzeSQpe-eL9wTwU4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

hamoa-based SoCs expose their manufacturing bin in a single i-temp bit
of a qfprom fuse. Add the i-temp nvmem cell to the qfprom node
and wire the tsens controllers to it so the tsens driver can feed
the bin to the thermal core.

Use that bin for the GPU passive trip points so industrial-temp
parts keep the higher 105C threshold without a board-specific
override.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 66 ------------------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 42 +++++++++++++++----
 2 files changed, 34 insertions(+), 74 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 776bded3a312..03d753a0ab74 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1553,69 +1553,3 @@ &usb_mp_hsphy0 {
 &usb_mp_hsphy1 {
 	phys = <&eusb6_repeater>;
 };
-
-&thermal_zones {
-	gpuss-0-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-1-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-2-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-3-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-4-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-5-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-6-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-7-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index fcd88e5f5d7e..6cf911e30973 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2766,6 +2766,9 @@ tsens0: thermal-sensor@c271000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2781,6 +2784,9 @@ tsens1: thermal-sensor@c272000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2796,6 +2802,9 @@ tsens2: thermal-sensor@c273000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2811,6 +2820,9 @@ tsens3: thermal-sensor@c274000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -8809,6 +8821,12 @@ gpu_speed_bin: gpu-speed-bin@119 {
 				reg = <0x119 0x2>;
 				bits = <7 8>;
 			};
+
+			i_temp: i-temp@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 1 bit at offset 0 */
+				bits = <0 1>;
+			};
 		};
 
 		pmu@24091000 {
@@ -9669,7 +9687,8 @@ map0 {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9696,7 +9715,8 @@ map0 {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9723,7 +9743,8 @@ map0 {
 
 			trips {
 				gpuss2_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9750,7 +9771,8 @@ map0 {
 
 			trips {
 				gpuss3_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9777,7 +9799,8 @@ map0 {
 
 			trips {
 				gpuss4_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9804,7 +9827,8 @@ map0 {
 
 			trips {
 				gpuss5_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9831,7 +9855,8 @@ map0 {
 
 			trips {
 				gpuss6_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9858,7 +9883,8 @@ map0 {
 
 			trips {
 				gpuss7_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};

-- 
2.34.1

