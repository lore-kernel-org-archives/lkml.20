Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D0928BAB9
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032403; cv=none; b=Ui8iNwgK/NOm/JozfjpTJ+F1Lo51Od5hs/bRUbO1+LTTTjYdf7HZ0y+ajFKn8Y626gfJlJzb1u1s1w1/PSTO2HC/SClPHqZvMpOYvhkm87TnJJ5Jq4sZWlteDliElKC3BhjZjn3YtGU7zGaodKYft7nJ0rY/LLHrTsmIza1h0M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032403; c=relaxed/simple;
	bh=er/Rf7GeNCbQhj8OCR+h68ddiNOINBqyNX9L3ydhTfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kzzJtFx8gx57X7rqLYNNJsfD+sd2oewePV05jdQ6ocaEEuXF37rvEg2RsNmOMjWYm2zN5S58R78trrpZovvy3TofKXp0BDoIS49gy/8k5ruS0eAV1rWhNgz2/48A1v2qNRbZZ1H3mWZwIikovuZKyHBmIqHfgbwXcMSx2no+bBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUhX5jgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwyKO5B5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUhX5jgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwyKO5B5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGwv2l2300909
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nMwcUTd0xqYO80wvVws9oXZcQyIt+B8oFPV
	Lth7/QHU=; b=RUhX5jgnL+wIyhRaMGSgHm9u5dx5cv5SpMMRU/TqEvbI7aCEcAQ
	eiKXF8s+7P+B0sys8SqMxHv6XBGzH3mSIQDfHzpZpb0osZ1gwx2DJVevqp4XtPxd
	9Ovv1KyY+V5vX8ApwTgn1wP0MIaW78NzNWbG6e98TxzzTITSHST0uFo7d3oWmQRU
	D5TxVYWXLCTiL6LpMSbepk0umsJMcvw08j/nxdIQU9z3RhOjHvtnvDj5gASwiGHg
	Y/po3YSAClrjucFreJR+LLaMmttvIZ2TPxT91Lw9DjEzcx8OpODvuIby0U2qykg5
	p9zmT6i6ILpcK0dRT/GfbJFLwA8Z8pb7aPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqfb1pbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:40:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fa5c5a4a6so49940441cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032400; x=1788637200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMwcUTd0xqYO80wvVws9oXZcQyIt+B8oFPVLth7/QHU=;
        b=OwyKO5B5d2YCZXn+uW3N6NGus7X38f9Cr0hBcVDoP6DpB2Cr5ODH6VXjxtm0dsYRWR
         w5twYrwe9Ptq3uCdD6Xm2E6HDAE0A2W7YCCNyhowV+SkDeUj3o2PSx0fV4NNnfU2Dluv
         7w9SKi9HW3yONvHb2MHxPyICsEAGQ88Qy4sninjVFRU11kGYZmLX7PtLN10Nbn2g2oxQ
         kPVcnA6v1aH6IQw1X8RPddGDdz/FEvHSYMbpzV7RANL7SWwoSOIvFakm/rzkSyv9eSbV
         uFMcafRGHATcyzfRJmR/6Lp73nL2r4USGYeniS7BVS4Y02w2Pqf4Nnr7n/AcWkF1FaNl
         wqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032400; x=1788637200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMwcUTd0xqYO80wvVws9oXZcQyIt+B8oFPVLth7/QHU=;
        b=MVSDDe9cBhF8g7ZhAh/CdUJPTBStzGo1tqDuvznTUtoAo+5VyuRALH6ah/ovf+mlz6
         Gl8+9PYys8UI1EyMR9qfRYoxcIYqhEFHyDFuHPd9Rd6LRMEUGKhxTQJqtcF0kK8nclRz
         uT7edbRTzI5GVMDJ8dLDgOXnVi7ftklaWOMdUYXTm+iNjq+BhD64ZtP/gqnWfJRMUfF3
         MTQUAhNieBeAe85yVt66hkuaGfeX3ZM89ftJk507plQY2fqK2igPPPQOtmvkgaLn0Gre
         ztyyYOMocuDegVt6nVgU+MiwQHnQtFmSGW55k+nzzMr5NrinHRD03A059H5LA53xpIWt
         BjIA==
X-Forwarded-Encrypted: i=1; AHgh+RpufUzAj4kwJz0ne1+nsgK2aY/Sh4nT3ZkaSyS+Ez56hDIhj1YJht/NBA+NDkHAY+DicKU4wmlbknSrCaU=@vger.kernel.org
X-Gm-Message-State: AFuF++kiCyBKF8p27ySMgrbIbL/npR9m79tUeB7xbbrsgTRQmSU175NN
	lDhB+CnZHxOUXUoNVeIJ0J8BV7HHx7Vx460vFxpPmM+zw6MtdWIfW6GQYQSgXXxAFbOnzuw2Sha
	sNxVQK/9S62ob5LuNzw9LQHA45ELqSLzCEK9TBjd0VhF9/bPdDrpQ8YbgGZpQbZEGPFY=
X-Gm-Gg: AR+sD12IRV1v3KIBEvDJvBOCUmQX3nOq1b7VAIE8rB2Ei6EYL4Bp2doRDUk11PqNo2/
	hgKkQucA66Pj0N6OqXYokxaKnXIfZMlhrvgjQKJaNBTGvIk1gzfs4UvHnMESLPBoQLxgImh731V
	fpKwE4sWYWjb5+30c/u4OJJ8/HTaSH+ZEHs1fBBMO6dnxdbaBgCdh4ZYEZw7rCxmmboh4d8SNyu
	/MU3H2hFjiiohHEuHGNpKZNTTbUrEkTN24SMM4C8pV2AgCor3pJAJGC/2o4Jw7HraZkhD+OXFzj
	zNOGCkdCz63MMZzNinmVAetYc/fZzLjw/dgCxXyS3hKGnZ9PzWtYm0+IU1XntLzQpP9C/td6KPI
	eaSIY30ZxJZ/Guuc=
X-Received: by 2002:ac8:7d09:0:b0:527:7813:a439 with SMTP id d75a77b69052e-52fb94e691amr169213011cf.27.1788032400108;
        Sat, 29 Aug 2026 12:40:00 -0700 (PDT)
X-Received: by 2002:ac8:7d09:0:b0:527:7813:a439 with SMTP id d75a77b69052e-52fb94e691amr169212691cf.27.1788032399737;
        Sat, 29 Aug 2026 12:39:59 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48432022ab8sm4710593f8f.28.2026.08.29.12.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: xilinx: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:39:52 +0200
Message-ID: <20260829193951.107616-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=er/Rf7GeNCbQhj8OCR+h68ddiNOINBqyNX9L3ydhTfE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzWHNp4vkWapk8o0ztEr6YUKdqCSNIqqoag7y
 6/FU69yyt2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1hwAKCRDBN2bmhouD
 1xd9D/4m+ux4/etHu43G3Y+N26Sa0wL8/qjHzd55QWHGpntqt2rTVAR/tOBf9HkE2fGGphDXmlQ
 UqeMDFkYD/GBzTHaf7qu7thJ2RTZ6hLl7TYWYYCV+qz64PEk3E7LDmiIOl4JLWPWGH+uyxD2wW9
 4R1YNsqeRN6M7f60oNEr0TuxReND9mxUAaRo+RSB7cNXwl/HFyaA7HKcD+8UcW/7qoEf2tFPOEW
 ulBYGe7Fp7G4BvlOifi0RTPC8YjD8vzUmoMwI31+Jh+CZlx8QHVoBU5Lbneqy5lYNzHDKn+ofsa
 eVbPqql/et7vq5tTN1bi9ap/dA88dmEll5OG6W1cyocEzoaXdGS/jkzcAHwUcmYnN80wwKk2M9F
 YFptSMGG3I9TG1Xezo3v+OAWp9kwURGhjr5X7Ua0jRBeGyB3WyqHcTZxQzWMXG0Y3pA+tLBfGyy
 moOPYcy9kEn9wvBEwB2EmQO71rCzsg/Arwh83IXnvIsmuOhHKpmdETj0QEN8N//ckgIubEgclJu
 Wrc/3JG9NvZlbrgRQVma/xaJuiS27nsPWefHKkHxHelUDutMRRVfM6vjUoC30if/iTYj93ZueOe
 e170qzRNzFtOfTefv09C/9fMdXhmVDCkmYXAl9dCxftAEzrZFmZB97ZzPnjDWHMdOzBSUEPb0S6 lDhMLH8vY51l6WA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX/lo3edZJn470
 Dwrhxrjv9E8EMS4p9S6bg8NxVxHr7l0WlHsrLxXHqotr1TQASdc/hw5RYqQ8LZYokfoUqm8ms4l
 /TmzsaOvtPqFbSo/Q3ekoF6m7aWPMPyIJaoCRvDP4C6vGyQZ+RoT2W7vGvxawAPOCRCYSAMWobl
 A2MugKi9cKhSkZ+iI4KmU8AXng7czJ5z7VuDlulQi71yT4FgWbnH+u+WK93LTmzjIvnJURn80T5
 3uyFsVBlkvzxOVLUmesTjqAGLIAbufkvPAbVyUwf1ihMveqFp2GASY7qR9dr3pbBAwX/shpJwT3
 PMd7ytzTocpyzriPb4VUlPY47iWc26bCGCAg6fY3xKyznK50+bQinUEAklo0744BSCeKwWfMSt1
 2xaRGVWcgjspNFibg3wMpvRfpNTj94lD6E6gZjo7kh5oghE9GOCDhu2NAsC9hfKm0t2CEbQYa79
 QocEhY3oA5rjrMV77Vw==
X-Proofpoint-ORIG-GUID: Ru1r6afRIvKthvu0NyR_sqlTli6GYYl7
X-Proofpoint-GUID: Ru1r6afRIvKthvu0NyR_sqlTli6GYYl7
X-Authority-Analysis: v=2.4 cv=Q77iJY2a c=1 sm=1 tr=0 ts=6a933590 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Ta6ShJ3tCWu1s0TIFCkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX45G+zDXoUuqk
 gZSfuCk32TzA1wHrbv2IymhjPn5z8KZnjjybKAlf8GNf3xY9QzhUnlc7pJNLkLSU7+xgS6T6a5S
 reAddDByr1eDpjU6/6PjcLnZFkCstXw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/xilinx/zynq-7000.dtsi      | 8 ++++----
 arch/arm/boot/dts/xilinx/zynq-parallella.dts | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
index 153b8d93cbee..715299f5d860 100644
--- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
@@ -380,10 +380,10 @@ dmac_s: dma-controller@f8003000 {
 			 * "dma4", "dma5", "dma6", "dma7";
 			 */
 			interrupts = <0 13 4>,
-			             <0 14 4>, <0 15 4>,
-			             <0 16 4>, <0 17 4>,
-			             <0 40 4>, <0 41 4>,
-			             <0 42 4>, <0 43 4>;
+				     <0 14 4>, <0 15 4>,
+				     <0 16 4>, <0 17 4>,
+				     <0 40 4>, <0 41 4>,
+				     <0 42 4>, <0 43 4>;
 			#dma-cells = <1>;
 			clocks = <&clkc 27>;
 			clock-names = "apb_pclk";
diff --git a/arch/arm/boot/dts/xilinx/zynq-parallella.dts b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
index 366af4fcf8d9..b4651540935a 100644
--- a/arch/arm/boot/dts/xilinx/zynq-parallella.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
@@ -44,10 +44,10 @@ &gem0 {
 	ethernet_phy: ethernet-phy@0 {
 		/* Marvell 88E1318 */
 		compatible = "ethernet-phy-id0141.0e90",
-		             "ethernet-phy-ieee802.3-c22";
+			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		marvell,reg-init = <0x3 0x10 0xff00 0x1e>,
-		                   <0x3 0x11 0xfff0 0xa>;
+				   <0x3 0x11 0xfff0 0xa>;
 	};
 };
 
-- 
2.53.0

