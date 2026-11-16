Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840265;
	b=dAChh7r6/q/2nIJqMHXHa0iCUW5PJ+uRk0uqdDWGOQp7sKqvgvqP4GSYe79cbliAzJz3
	 GiJGE6poJZNUlvI2BILn3B6ykbZgyvapnYxkhf10GcQKqaF0tdSi/2GbYXuJVMLu6GskV
	 +fxKNbYtTPB31qGYBpW44QQKcOBAArGNO6yr57vTLMe361220Lg0gpr1nWkkzOBSxA6Gm
	 a8h6g5pd71kf9EW6HTlUGLTKDBOD3V7uAm+3H/LR9eLjrUokRzvn9PVc4o2nuGCHZGzVH
	 gPFO150+cisOwTCK/vcFSCZWt0wKZoMCANuaqqb2x3Z27qfO8XtlY2ClYWoPDf9bdIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840265;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=2kuZOBWjmhmmLjP8fRTgGm7vuccSc99dr7ng/N6d78E=;
	b=qWrfWB7yG9ouNdcXykv39uzJngTOKpAeEuHwEQ2oq6SZdC3FnAYLiJN8+dSRLS1gVaWd
	 bOCHdrwfvLpSBGECVMahptzbBpb/nfuyVBMKWq7gW8pyBhc0f9pBQy7+Ne9syVUXgaZzb
	 u5KCzenM5iV829gL6faaOU+NHg+pVDN83sbq1k5u0CC9E5jowNP17sxAhfS8erQ2qvU/W
	 4smxGJc5l5YBC837IXnsyHXUKkB9PDhntuiUvavhuI6gvkWqFz8tnEKCxOHxhsbMfWNcx
	 Pm3wKBFYgj0nJO+grzTwlTKAy71UvSxcaM+OrBg5nqzprEJG3sD/ItvqzQY3qII8VZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6AE606A31C;
	Mon, 16 Nov 2026 14:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA6AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1794840243t617b2a6e
X-QQ-Originating-IP: CFSIFdcloDVFT33Z342POrn1WXtNdQEi2iKLLXITvZE=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 22:43:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2011228312288718548
EX-QQ-RecipientCnt: 11
From: Xilin Wu <sophon@radxa.com>
Date: Mon, 16 Nov 2026 22:43:55 +0800
Subject: [PATCH] arm64: dts: qcom: sc8280xp: fix GPU peak bandwidth votes
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
Message-Id: <20261116-sc8280xp-gpu-bw-v1-1-cfffc13f2fbe@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMPQ6DMAxA4asgz1giLqLQqyCGJjhgBhrF/EmIu
 5O24ze8d4JyFFZ4ZSdE3kTlMyeYPAM3vueBUfpkoIIqY0yF6mqqiyPgEFa0O9r+Qb6hsvHuCak
 Kkb0cv2Pb/a2rndgt3w1c1w1145jTcwAAAA==
X-Change-ID: 20261116-sc8280xp-gpu-bw-bd32f9249fc7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dragon@radxa.com, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2644; i=sophon@radxa.com;
 h=from:subject:message-id; bh=K8sDikKS7Y6bLOmCz7bfwrfBbld/nD4D6VZ4pa13bMc=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFm/xdZJrd/BtfPItF11bR2zpjpm7JFf+nr3hDSTTWITc
 5eHHX3H3FHKwiDGxSArpsiiEM8wl70y99pTsVI9mDmsTCBDGLg4BeAiJxj+Zy5O/O/PzRz+qH7f
 tCN/Llckh6n37GxJe+e04rdigJe7IsP/FOevrimFc3qu1W57v6hpn07xj41LwvrMq6Y8O2f1tNe
 ZHQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OatzRg8pHEjpw1VUa8u8zTxGGKKUI+EN8qo5uj9SB2yjxgkfh0PFeLVR
	1qkjLCVv9bKft6+a/4efNZeYrAXlNfah0XlLjA+DOcSpiTsJTwsb/JuWKh+FPi2JElvYhOK
	eqTEG/XiOHLxCqL6AHN90umixoD9PVDwu9Wa5bKJCA0EJNzJ6WQqX5NSnEmvkQZHKhhmfKM
	WUbEf2ZgvGj5ZlIlg5TOftkMcM4i9MzvIloPdE/llrlFQOwUObxUPbdxO0PAK+JwsozxVZO
	tGiCHE9ijxTUQHnFv9DtP/n1sGmneTNsjfu72LaNn9oSPqGYTdsZT77qL22BxRaTohsXcwr
	Otb0vWZJAoRsmRVpD3HsP9zKp0V55yUp49OGcMl/LmomIBS33IktIX4+TmUepRpM+hVe5rN
	LnhF0KwnELp6kTs4n5t63M7RnAcALvKzmqHvPFgcfiB3WoAL9LA6Gs31tBGG3beaOrjPLH6
	6ll1DtF7q/en32Tp86CY+am3obF4kZ3wHukkzbjzvjemXOUEtWV0T9S8t56frQz5qMjsBgY
	UqVySK09m+/T2t7/NbO5wIQW5ZEjfP7Gqy6UTP9XJhWpBnXv3OaAgx+DAVqqYmWzjk39bKF
	JL/gUsAXSyrSNbO3o0+/H+div6ZsixpNWYWMCirw5Y5trX9DI/jdbtmxVVK+vhPmL+N3sSR
	AeEOI+atWawWJmzWXcPoa8vR8Q0EzYmpW3mUSMz7yQI4AxkoURunwfOfib9Euf/2+N7tumW
	hGkAB/9U8h2qtk5KnucO742D/WXS4J66CuBUTJQ2USBR2t8Gp0GRsY+9zq8PW+urwOMdfMf
	ppbiElYHK1b1NmyAztDIHgBcqyZ+gRqiEmyR0WEqv8LFCdoaeUsgwz5C2expQjQPZqBrKaG
	+jtA+SbmNPdD+rCfxulUNviVitl+2RbZeMbkDRZq7Zi8XRmf0kG3SpATj3g3Ww5+tqVKvWv
	mX07uUNF2Shk6UT9cxp91YdiCyYYCtrSoXl8T5+vq4XXlIsl/2HoR7YyTUbTFPp1NEiXNTr
	LQpUc/43KvHSX8EeQ7
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

The GPU OPP peak bandwidths omit the four-byte DDR interface width.
As a result, the interconnect receives a quarter of the intended peak
bandwidth, which can limit performance under memory-intensive loads.

Include the interface width when converting the existing DDR frequency
levels to decimal kB/s.

With this change, clpeak --opencl --bandwidth reports an increase in
bandwidth from 23.3 GB/s to 60.5 GB/s.

Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index d17475c3e66c..d4c49ea52c36 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3420,49 +3420,49 @@ gpu_opp_table: opp-table {
 				opp-270000000 {
 					opp-hz = /bits/ 64 <270000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
-					opp-peak-kBps = <451000>;
+					opp-peak-kBps = <1804000>;
 				};
 
 				opp-410000000 {
 					opp-hz = /bits/ 64 <410000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-					opp-peak-kBps = <1555000>;
+					opp-peak-kBps = <6220000>;
 				};
 
 				opp-500000000 {
 					opp-hz = /bits/ 64 <500000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-					opp-peak-kBps = <1555000>;
+					opp-peak-kBps = <6220000>;
 				};
 
 				opp-547000000 {
 					opp-hz = /bits/ 64 <547000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
-					opp-peak-kBps = <1555000>;
+					opp-peak-kBps = <6220000>;
 				};
 
 				opp-606000000 {
 					opp-hz = /bits/ 64 <606000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
-					opp-peak-kBps = <2736000>;
+					opp-peak-kBps = <10944000>;
 				};
 
 				opp-640000000 {
 					opp-hz = /bits/ 64 <640000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
-					opp-peak-kBps = <2736000>;
+					opp-peak-kBps = <10944000>;
 				};
 
 				opp-655000000 {
 					opp-hz = /bits/ 64 <655000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
-					opp-peak-kBps = <2736000>;
+					opp-peak-kBps = <10944000>;
 				};
 
 				opp-690000000 {
 					opp-hz = /bits/ 64 <690000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
-					opp-peak-kBps = <2736000>;
+					opp-peak-kBps = <10944000>;
 				};
 			};
 		};

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261116-sc8280xp-gpu-bw-bd32f9249fc7

Best regards,
--  
Xilin Wu <sophon@radxa.com>

