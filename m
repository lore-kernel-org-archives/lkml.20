Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9BA43B498
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121992; cv=none; b=NWRuIi3PSXm9nqeQzVXldPhkxBHP32/LCQyxrdiajOPU3mscETSSKu1atKo8LSLs4eykY9pMZyY4BoQ8IM9rYFn87Mwcbv90J8y1DiFttL5yl9srE2imn6K3851ezAjo+TLnP7zZ8aCs8eX+pClt55iDDayS945+Sgnldta7WL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121992; c=relaxed/simple;
	bh=nTXyroLaQt342/D1uOTDxQ4VLOxeEnoOXRYineJExcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tYKg0+S+Zhh0eDZSGgT33agKcSCwMprSwGft8+tu8tPksy/Q7ixgzZ3pdc310XfBDOe1KzxOXRAuxdiLBgVIFu0eZhuWDC/XM0ZpFr3KlWHBMtSNepvZSrV2SdO0NU7IOOQMPG8Y8CyMbW8z27EH20/dUdjxd4z7U0gltS+J69g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0oI5a+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPZJmo86; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0oI5a+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPZJmo86"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kbaK3686775
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FlSp6howCugcpde+9LuhfG8wiAxl0bxDhbqzfMxaTrw=; b=h0oI5a+46j7w5qXH
	Lh/EH92KJacD6FE3Jmhkm7JGO6lyM4Lo0k+lyR803js+Nnqei1iwq0Hrbo+CmPgD
	7DUp0HxzfRgbu1GbIt5bTqBQrvfV/Ja9C4wi9XNVu9ANeGnlY7lStXPKHdHitVcw
	JPOWTTFlzZ0JT6DNloFUWYIjF4XafOIQGQAUmxsUmkOdJ/EqyO1RPEcezkRD8wkt
	WBwgrEg0nCI1mhkwzLyVcIs0h5ocWu0lo7rdUxygY50qMoDoSXEcsL9NnrL00n5A
	614Q35GadzgnY0VaDUdrM03q1wf/zmFko+zU/JhAo2T1eec3Xj7Mg1QZruyDVTA7
	hZx2dQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg1afp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so127973885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121988; x=1789726788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlSp6howCugcpde+9LuhfG8wiAxl0bxDhbqzfMxaTrw=;
        b=kPZJmo86GBygj5H9hwIeZFR9UHQQrqoYQ/uY+w7kOO+QmdrHrSmPceEQROZWRU0vw0
         DfNCae+Ws4rVDqgxBui+ee3tJlnta0NW7C40KVl887FE/HADQLIgwlxrlFszCbWa33rL
         lQQy5gr9CQs1Co54hpb2SCXN1Go6w0GcT4GCYUcBbkARS5Rcj5Xk5EZ+QNdCuu4XHOJT
         /oH8awKMpQKAOLc6l1xM0gR4iaqwV1I8ISZ/x3Y1Ze/AE/VZ5BMlvhicIjeU/wY8Pwbp
         //Lwh5qHIS/cmTjC9GL1Dhg7EI5ogjs1l2msKNJyqebuzpcbFIWvW11JEHpW6mU4iFcp
         St8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121988; x=1789726788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlSp6howCugcpde+9LuhfG8wiAxl0bxDhbqzfMxaTrw=;
        b=kuS0TndiFG5F9DPOqtNurMPRsvNSJPsVUIzuLpJ4dSQRJVVKDu/i89wRFsP58dnx1a
         sE5pKucB2iXpE29mqubNpZTrwUa8J6rXToIDp4yUl3JBfnr0EcZBKrQGmxaDFYHXiSgb
         jUYuDk7CHaql2p5uW2cB11o+S5aceRusMAIyuaH1Y+pQ6GANf0jtVa2zwOWm9mwB6CFl
         i0kEj/KrJfrL/ylCZZDRBHRMuAWs/l7CGC7aGR8lQG9zb9Wm5GtHXuxFVPDeAgClf65j
         /qp4ikgrD9akx6aGzpF2VDIyJEK2Sb7eEHES7gRpQUYDw003IE/kHbuBbnBohDH+v1vU
         JpJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxGPDaCC8Wf9gj4sBJt5krOwu+xgGOwNGDWJfLu6RMfK3Oe+ycn4JjKJNapxDee0opXYEZCZvE1XoXVA4=@vger.kernel.org
X-Gm-Message-State: AFuF++mr3fFMoumh3mA+tlhPRL5juULcMi7C+jl/+fEZ9aQDO+WjbaUO
	7uzHOI7rZ4I9QuNGn9/G/LhYCnTrhYA3rvPm2vgat2HX7zdwPGDUXJ9NOuMoDbb9xVe1gZYwzGp
	rgA+EnqeOxLyCcqcqnkgjESRU05LyLGEfYqgQhZdUQPE4PJBgmfss/YWdl/Gnz45hbHA=
X-Gm-Gg: AYBFou0MJoUuizkzqzbpcRYTXbIYG1GD/S9gFfL1XG+rH8JGDS8AwjYJfWZhOjlWHOn
	GtsrCM8xEW0m09/r2wrp//G6ksCbsMtoUaP5d1iWIIWy6fIvSxLfoHEyHg2pbwKqO4wN26hXsfC
	ncq62XeO8fpFPPhIbUYwASzWZ8M9jiTXek9HUmCSX33Uwug+wzQU7f5pCHOyzuPTP4B5HLHlOvk
	ytzFOc5Ffb9TdjJRAxqQ6befRe9YevOpwaA6XH1mRPpeNRJBBH49Ja0TqizhMazWlYlenmmUwJ3
	Gf6La6Nm5AE0j9ukfg5HQTsGsyhL+ZISIcYjDnZTcovG7C2oguEfH6feOdtrLzZSlknKaJ44Al6
	3Eu8nj0DLO1rKnPhvFwNT6ig=
X-Received: by 2002:a05:620a:461e:b0:938:d7e4:7fe with SMTP id af79cd13be357-939ea28d90dmr377176585a.37.1789121988400;
        Fri, 11 Sep 2026 03:19:48 -0700 (PDT)
X-Received: by 2002:a05:620a:461e:b0:938:d7e4:7fe with SMTP id af79cd13be357-939ea28d90dmr377172485a.37.1789121987910;
        Fri, 11 Sep 2026 03:19:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:15 +0200
Subject: [PATCH 07/10] arm64: dts: exynos2200: Drop redundant blank lines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-7-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1437;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nTXyroLaQt342/D1uOTDxQ4VLOxeEnoOXRYineJExcQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WsRKh1H9BOmCvc5kCLtNi6rt9pY5DbWNDHD
 zBIwgtGfy2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVrAAKCRDBN2bmhouD
 19nHD/4sotXF2SwfMxf8rfuKvpRrDnrTxU+sgSXanMpwDYNBOlfQsjBVMFljPu5DpiyNw5bPswI
 CLAIm57J276BQzxJynFy1N0J6+zKWVPly0pBXHqdDXFzRf756o7fXCQo0ulPUXYNYZBHhZ18JkR
 +Q7OiwsFNVT1plZovs5GZ/o7MFnfGLSnlDhC0PzTVdsQ1q3CwbvBwKA5HFrUOVDlV4YRUjplpQJ
 MtlXPF/R2h1b3gNb3M9BADdaGjXd755ZTR4AShx5QPFGuV8REmWUAizQD9WiL2fWsEpQO70HZwh
 K2uiKd5muhqdK6XPODgFcP0ENuORTboOPZYf2t4v4oIDs8BU5XKnYtjvfMd0d2fJwgL6DWkP8Ay
 4K7jahtyBE9K3iTg1J8EgA5fHuM+FcCgfkuw/AGxxkuSQOX3yx4dFEEAN+/oQZGoRFOoyAY+IJa
 Fj9NFoOZXA0BA+lakio+2XGW8PuHkAzpcJCFO4s7LriNnZelf5MXIyOAu6eFyp5baVHtBlgmpjt
 4aQtMRc4Ovt2POUw3T0hs8kd/X2nymXHQRt9dvaXXIti/+CZtvVMhP3bc9TFg8LRlpgm804iNxo
 dhAn+87Sgg5Jr0H/GZmi0sOEMe8wEubvpXaRLQJX5NzHy9od0OTgy0SaauJaNQ0VskvOY/gWarf
 tR/QZB/wanoS7Ig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 2T2QVGneeaA58dfbpsVWGswGuTwRxskF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX8/58RtxyFqhd
 fs6ej1Owmr53mqDqWv9PujU+rBf9fU11Pz2WzjMI9YNSmAkau2aprkzzoYCAZGAECtIVrLBYYmW
 HjT7upZ7LCn/yh+LCe8/iN1THxAFBtc=
X-Proofpoint-GUID: 2T2QVGneeaA58dfbpsVWGswGuTwRxskF
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3d5c4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xquRIdCsXmQ3_dtbOSEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXycJ2TUR4mq6v
 dgLq6JybWgHbhFWZpJ0di8GK/Qt4AK6k7Iez/PeUEU+Ha1qmYGI5XB6tB6l2+frsJGdsM/9JEQf
 X5kn8zXkAa+06mJwvQxGJEXQ6OeB0rWeeX8GKV7tqSgVmyD0v5rKiKHhjU9gLrYeTOmZlwYv4QI
 hoz3DrS8u8vv4Ta5nRM0KNFlOviBfSaBZn+gOSgWUyrKDf72dmFLAE01cKPj9LgBi6evrV56tqs
 WCTTOlHWECuMa+68FhGj7o7UsTzl/uMg3vb8bQqT5xsL76zncOcQU8pLcvK36PqFwsEPUxSd/IT
 98oSyq9h0cuup7TJOU6av+Ax06rIxfiihHk152abamXNxGlTwowqGS2PSeKgc0L0LEy8CEWMEJ5
 HK8FNSxEbmUcrVgVCJfUMaJ5x0tESx/UUEQfms1cx31xrLWwm5nY9/uYt+H9PX+7fWb0xRQlo13
 GPTJ9yESvgCqy3Twfrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

Drop stray blank lines, as pointed out by dt-check-style, e.g.:

  exynos2200-pinctrl.dtsi:705: [blank-lines] blank line at end of node body

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 2 --
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
index 5877da7baf5c..d5aede3af15f 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
@@ -702,7 +702,6 @@ uart20_bus_dual: uart20-bus-dual-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
-
 };
 
 &pinctrl_hsi1 {
@@ -1171,7 +1170,6 @@ uart12_bus_dual: uart12-bus-dual-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
-
 };
 
 &pinctrl_peric2 {
diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index b1c134f22324..3b853d66e19c 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -712,7 +712,6 @@ hsi2c_21: i2c@10970000 {
 
 				status = "disabled";
 			};
-
 		};
 
 		cmu_hsi0: clock-controller@10a00000 {

-- 
2.53.0

