Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E853DAAD0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456998; cv=none; b=U3y5i9kJeNCNEJC+Zyy/t81L6NqyCEORrPrXDaO03xXvcnfGzTAUjtF7xQU9HkA3DAt+HNnpy+2V5fhKzLtASVGU6iwEiQbs5y0wZKbr9+8XrLk0ualV94gOJb/gVUvZ5P8uz9xhtuEW83tO7h3vOtkb1M6tkTQFUQhbP4FEDK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456998; c=relaxed/simple;
	bh=1CwEh8Q/rE1NnBMoNQNfgUNpKNcbygdha/9UWzt5FEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6E76RcGNY3bb1i1rdlRnq3ZjYyqbae19SHSh5Je4zACNj+vmVR1zcfz0JGW5O3jlarGQ/uUu5KhW4KjCTPPvqo8+4kJ61KcwwwCt1cHtwUSW8yp977z2zhxfYx5ZUf7LLF/uyv7iDuO9+M1Gr50NNI7LV7yB9E2P7pbu6eGMNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBvNlURH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGNLB8uj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBvNlURH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGNLB8uj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZbVM3824010
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJF
	plso21Xs=; b=GBvNlURHys0JKR9lSkOpSc3CedUF3nzxz0c/Qr9yV/tXmwRWGEf
	OK+FnCXK70zkftAUk8mV+CCt4NM0LhRTd5dRxB158Cb+/jBKJpDf5hGSj1ByOm1p
	J73U7C+XY/Hs0gFfiVuvi+uEO1HMGIQG5BHWpd2qPQQcaT21Js8z7TKbumjIrKSW
	J9Hi7FibSnJAr3DcJsNvpeqzxMzgM95S0ACpwvoeRnczC12Rf2zBNUqX/vfyfrSQ
	EJ7SBWd0GTMcFDX/FnUUmiCgAq9tFXT0yPpYWkDFCV5UmKPzHpKy7eFRaM6ToHDb
	eEnPFJm9fHn/Is70FfvP/q42n/I1OSm+VDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41u1t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:23:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a01d1d1b6so499609185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456993; x=1790061793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJFplso21Xs=;
        b=bGNLB8ujDdVH55qromSseT1yz0FnMO1J5VqNMuqzMtc4sWM9AQsJtNj/CKToEHJjoL
         cr9Kf0bog1oQ4CDVitF+o7omebKiy4wTtltcPW6jwyg2Bow/wL9FkDY3MUamjWNcWi0X
         RxeHtPHpq5jbd+XNj8LouB1BAnMEjJeCN0mhI0vS5RJpW3DOkM5Ei+RZ3FXtvbUB1gWy
         zhUNBm3t/Wn7AMFIAoeUb8djhjVAUkuQ9jM3q+2dTsepZS8toXqTkD7/OgyvOmamY+3i
         aPaQcAHn2UDFN2OJ6IPoPxAz/DE548mzcMZAkschzQRFMjQm+IZ9mFm6JAU3F8g7bE17
         YmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456993; x=1790061793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJFplso21Xs=;
        b=2GLQta0AhZKpLPu/qADoGW5TQYvLG82mMfdQpGQNzzn6loDVyhKRBjDvjonHBctaA6
         GXcLAZB0oCnGcstHYEGEc0zrnast4Gashds4CCoiCquCxN4vRHtp5HY+7yJNwPBMVeDB
         fU0SQ77T4KfgXC8JE9rlWPT9k10WxCsbvW5vHniGxWW01wifP/mUK8uPhPIYyRkTHIAl
         pWni/RE66p9md/FvO1TJZBvX9q4uPXp4cty00a/DWZPAe2LrnrLY1IrU6fp9s2kYEoIT
         6TwSFr+r2+YvaJQK8d7Yi7gOdsjwcHq4nn1m7EcPSjEXXdoMR5fyy5wRtxHFs/WPtPwM
         6BsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7dm/9sFCrVzXs3i5raZ8hpSkyoe9PigNn/t5VtEHb5/TRsKdfDwXHPD2+pwfVlJJSFpdg55fNzBv3vTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nbRVct0V6IJ/T42o6RMfse9l2b3puUay35i2+YLZ9555oUCKFv
	tzc7B7Cv9DyWkO8PKUANXlgaxiBju0SQgNeu8gDPDGfxwg9VVQ11Dd75Qgofia2RViUtBWeFMF7
	vKrYh01Zgje/j5txW0Ya0lgutflh7jr3EBgkr0fjSZ90pKjwL6E3/J0Diogc5Gus6puY=
X-Gm-Gg: AYBFou0vtx8tWVyiGx96Uph1KW3fBoL2tgIFpr7FcKAJAZ1y1F1YFpwBn7YYx79egSH
	eYbWhMo0EKnNQirpIciqzTstUQcd9ZiH2uSUDVYrUj3Bxh8ZZIkpZ4azytb2unHEi/+IqxVE0ul
	kIOjcU0auTxcut0vA1kOI1v7HX53Viu14LaCA/Jar5mxMH3iAdaCpk3+pZSWyk1aoKxDVBWy7GR
	mPIEf+UzeXVtygf61i1eY9tHqAflo3OFYQFtKVpJuH/NAAhjmmwAfqWkLSOwQaBPQkOzsjjg/Up
	MdM5+KFuvaRYw+02KetXDI0d2wNL96uxUIGNotqciZIOuSy3ZerHA8DNWfusrcuuoav6SNdoGmf
	5+T+y4gAdKTS99gc=
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr869987385a.9.1789456993469;
        Tue, 15 Sep 2026 00:23:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr869984785a.9.1789456993090;
        Tue, 15 Sep 2026 00:23:13 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef2e117sm43920095e9.1.2026.09.15.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:23:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: imx95: Drop unsupported opp-hz-real in OPP tables
Date: Tue, 15 Sep 2026 09:23:09 +0200
Message-ID: <20260915072308.64047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1CwEh8Q/rE1NnBMoNQNfgUNpKNcbygdha/9UWzt5FEA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqPJcJRY2BJd+T88jYlFk1GheN4sqq8i4Wa973
 jvqfy7SQ0qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqjyXAAKCRDBN2bmhouD
 104gD/wNqgSpuFjJGccDgJI+wE97JAS7/eb4tNGBVw27ynWMA5AqDYYnvK5X3/F0roozimR8qs8
 hDvcWCNNqHU4PBXYCOoZ5jQwYNgxs9wv//rwxKzJ5N0AfAEXebev57u30T5bc8JK5KpYeQU6RII
 RFDIPpsdytPmUNKkZ4n5llMHmoPJlasIGEzldd/SJkwV9vB35E/gIPLXlFyJtcow0uh/eB+BnY3
 bJSs8g5xZcwsRfAnwlv829d5OjgV5FvQuXUsLAuHyo0athGI64upCpApkhDeAKeap54Aot40cIR
 yfRcXxCz23sw4rw5OTQHvP4TfU9r9m/dSIPvir3kLQ5uYqJxeVnRubV7iaxukhTATBafHTZAI8O
 iAWLQinDVXqRnIm4lEDubTnN04cHVaXqmtUfdqHXm6m3v45rOwQkjB7LRRwybInr7LoqXvt2bhV
 Hf0SLRU1rHcx+lGbNCo6SKD+N0oyKqIv0jprhs0Gtxs9hPTfina9cD5+10Pnqh2Yw7g0nK9DyqY
 BBDuOUrfd/4FdUjjlPb979qdlPRLjXqlwI45/pjwvvt/8pe0P9957yxMk5ljlpzClRua4ILx08F
 5PtakefXHXbQBBpRwKLD4bguq5rEnqRW3djJQAkzymjQIQwGHO3k/IVsJ8XE0cwM1pqvufUd4Pj U3wEzs/QFSi4K0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfX1TnxKOfGIAWN
 ioX+RfFNNTwPzBb4mBDtZS2k4K6u74hONUNgx5IfbZRrdrhL6FrYIl1wP4JLYDiPH3oH8P+VrYE
 Qlqfv3uedojxrpYljIKL61JOnReO2IuBMVwhCXIDBRIMSTrBIs0ogAES/cKRjpEKeT0rZ8UZWMR
 I6KVwto/CpTpyZO2uiGAYgaEKwguMDEVigHGb5K56MDDklxU0RnENC89G0iXg/Q8XNbl1HYp8n8
 vYJJSObnJa0hiVCX5kUG7zKtdaUrZK+rawQfCBcIuHeoi8JQpZWirEnWhSbW9vea4szIsPvSJvF
 j6kKQ7kuO41qpOGDtzZ3MxOGzznfW5zOc25dmmTQoiKBg2MWZCWDIOSMfG76ULERhqfWLLmQRYj
 uozaRxoiOX4Og7KQgF0GfWRQDng8OzoZVuJ0nIyCFcn/Tq6jsOzQfJ0hNwv+FzmQdqu3gujGL+4
 +iE8MqkLuSkTC/uZi0w==
X-Proofpoint-GUID: TwVpKt1nIWU1GwjMtgLwq1Hn4w6PidvR
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8f262 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=LIxWyly_AihzR3FwyFQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: TwVpKt1nIWU1GwjMtgLwq1Hn4w6PidvR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfX30J242uM3oLw
 DBfTmmBPVtJLnr+EkdaCjIlIKmPzNDK23W/nIUQ4hbMs12+0XJ1RLX9hUllmFpIoSK0KxxJm4h2
 kFJ4hiBAaDj9u731yAO3etGBKjVP4ZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150104

There is no "opp-hz-real" property at all defined in the bindings and
new DTS is not allowed to bring undocumented properties.  Fix dtbs_check
warnings like:

  imx95-15x15-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi  | 3 ---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 1cb8eb15e5c7..99c72d5cd125 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -255,19 +255,16 @@ gpu_opp_table: opp-table {
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-hz-real = /bits/ 64 <500000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-hz-real = /bits/ 64 <800000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-hz-real = /bits/ 64 <1000000000>;
 			opp-microvolt = <920000>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 887abb1c4784..306239de096e 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -323,19 +323,16 @@ gpu_opp_table: opp-table {
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-hz-real = /bits/ 64 <500000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-hz-real = /bits/ 64 <800000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-hz-real = /bits/ 64 <1000000000>;
 			opp-microvolt = <920000>;
 		};
 	};
-- 
2.53.0

