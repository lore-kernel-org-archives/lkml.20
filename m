Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621467;
	b=gvahdPQt48Sek/hecmhGX1bGtnWRutsZbIFmxYrlP5r5Uxjv5Pq8kgunNfT2C3daYKKR
	 NOH5WNwsJ3pyyYygcDjbXOqn6pdWwuw5rufdM/M7J7ovBY5Hfn7aK8MawIwzYH8ZSSkAl
	 AYxqzPTnk5dt1gl88P80zn9ajL+Hpm2Wm/RLo9fGmmrxzLrKQdtN0uu6QYu+0octBtl1/
	 /D7Djc0d6UxTOVTg2jGU8wOBMZKORi/1FPa5/60pfNhXyLtNvCJsG4iTX75jiXuAhaBbN
	 /jUOecm/ciqPL1hpUvqij6Ac1m/V96TDWv543Tppi87hJr2W/Os7O3zHMDf2QLGt8Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=;
	b=TaDCAbIIxvqHmpCGsyjfueebOLFyty7ddouReIlw7YZDSkygcL1G+PIsYQLqHKWw3XvO
	 PFC9NQBEJHrat3RUBSaNxr4WfM9F3Hyim0WpHcVze5yfq+HRbKxmxNY2iibHRbSMlIqq+
	 fDSDNenr3H06mK2ueQuZjmLA9wdpDXkhLTq6wyz7FTT1f8kqJOYkVSrNolhhES4PubCn4
	 VUp/W9U21vGg7+rmAcxh6GsvwjtFRqE0+qYqa7Xe73IemyrCivs73jI/lCFH+Q2EAQJw3
	 HWPhqonEtfVfL/mW2lkaq1H+G4sLzDdRzySuV3bL67QkgbGVswZW1ADswLzCa+OUt5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFaaotrC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCtAri8G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5B660A3812
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5B660A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFaaotrC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCtAri8G
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6w0213988
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=; b=pFaaotrCb9JYp32O
	x3X5urS6mI5MRnryk62kyZ3aGhdh0e3BWmnEPIhdqj9s7plKv5XFQacA5yq8oZYB
	8xYB5mCqM0BKL+VgWDooeDxPOjKWPZEb0L63JWGKVhiITpwMXT5UwqHR0QF7JlPY
	qkgYLIfSE0Ry0vwfpkNWQw3a7jnRKfcmJjq7l+px/juZQzg29fBm8nTv2eKmJmNz
	+C4wrvnoEnKO/KqatE++OL1NudpN10/0yAx+JfpELBODltm8pWSAZLBQ1NRqiIg9
	I4w1Wj908wFb8dZDNMLVwYxeUvM5RvVfyTgpmNdReTNZ7/ngvMweFkTmdBKlzH58
	6EN5IA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sh63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:11:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc175cb172so2596879137.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621466; x=1794226266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=;
        b=TCtAri8G6Q7L4GcZBndptPEq+jWtf0hMQTwKX5jfwq0HV5HnY7u7sm7kKHpue2Wt01
         3n5RT/pO2hkhNcf7IbMq/wGW6E+JMdka8+oPN+oU+2zvqH2KyiHpAZdiK3U3k1E0F9X3
         ysf1kkQ3n3Pf25ybxXwPB1DYQMYGofOq+RNLxTYZT1S/xyZdakC4HvGPsiUHscQe41SU
         EEzEda4hrovVETF1aBRdeavHUk3ghGb+IO/NrPZiMQkaOkV/WA/Odc2jcpq1RsWkyrjb
         dOG1FOxarbJHrrq3tTXc7Q0pZRnqebqPph+4N6DmZg+6p9PE7MUl79QjSprP9Y/UAX3u
         05kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621466; x=1794226266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=;
        b=hrsmAl4yofjMC+6jODrEbYauS80xKsX6f+jDRj80i7lxh4GHJRNuNvQH+CsHpT7Ros
         AAP3iFOT4Er5CGJs2K1nIqsPQYW2pMsgOMGFQrvZ2JuO6tgRYWJIINYpQa5JDfBfilvM
         d9BV7Jq2mTeCriYXdG+v7ewlwu8jCIFERz2iwGBl/yi65Yu3MI1Z+jq3dmsKS7152MKX
         wGQ5JupjF4mqyVAwKg9h7y794S26tJeFHk/NwZlVadA3JHztE0CRxhFQM0rbeQmhObtN
         pRbqiX79jszLK59X6/SojlNY4DFVt5YKCCxFiGq7QVyiOXuY1s3RgAwySEWN9epiqiV3
         fLgg==
X-Forwarded-Encrypted: i=1; AKwUvBzy8qkMFZrDOEKeqIq/wPUXAbP6uokTJ/9R4yRmDx3ZUDK6KyAcfORzP/lHTcbt+uxqYxRTsFtzTZXoDVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lfvMRsp/kL8x7WE2qLvXjBlb+ZfsCvM89vkWp1N8504kDZIiP
	Qq1myJhWimqQ1S8i1zEL+i04sASZK7xipeqlT8IE6PGSjWEVFN9QSPctKpe3hMU4y9CWrheLadA
	1TRy7lfgb2DSI45J7OAYy9T77RDNUSdnRfoAcMLwCUs29lgI3u50o8g9pyjp7lDcLgtU=
X-Gm-Gg: AYBFou2BChlin0TASXU7qm+1+CKQUhw32i2X9kUiJt7bOdO7vwL+ZoOxUaELp7NKkVR
	1G9H3nv2pAqrTBWt5wrguzFt82moV0aOuEJNxdaSMQ7I5K963lly0KT66onAU4KuWXs/lfrUXM2
	phXCrHgYg5JxzYZpI5V2CqIbSeM18/iAEe++LHGhDi8Dywnv1KqOfk5r7wvBaDniTunDV8FkD/D
	aiXhqVg95X5aRsNiLieVGrGvInvoRLGocz6sra9kuiJ3hoisbTD1ULYYn18QAECBF0Iv+iriqGP
	+4BEcJiYnChauP1mO08iKwALeH8t+9yCboBPHPbvXqqCaBVsaj77Wk7jeesoBV54fDeyt4LmHlx
	aedYqh86oBdJQOiJ1POzhBLHigPzYCiTvgusWs2FOWFe9glW9l/5Fk2m8OA==
X-Received: by 2002:a05:6102:6b0b:b0:7cc:1274:aba3 with SMTP id ada2fe7eead31-7d0726cacc9mr4313377137.22.1793621465448;
        Mon, 02 Nov 2026 04:11:05 -0800 (PST)
X-Received: by 2002:a05:6102:6b0b:b0:7cc:1274:aba3 with SMTP id ada2fe7eead31-7d0726cacc9mr4313354137.22.1793621464663;
        Mon, 02 Nov 2026 04:11:04 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm19304405f8f.36.2026.11.02.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:11:03 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:10:48 +0200
Subject: [PATCH v4 2/4] arm64: dts: qcom: eliza-cqs-evk: Move sound card
 support to Eliza EVK generic
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
Message-Id: <20261102-dts-qcom-eliza-add-ufs-variant-v4-2-c92512c7c759@oss.qualcomm.com>
References: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
In-Reply-To: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9216;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bw3lRk27DYHr1IzAGaOF70J1YE4CAQr6Ctzh6DIASCw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H3QMe81gFRKWbP0l7Du2RptXPNwQzSBpFZyq
 1UW8MHkkoWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh90AAKCRAbX0TJAJUV
 VrwxEAC3ytFvNuLfUcTun6fJnZ/1Tb8nLADyQxlB1EIDnWcYMKTe89XJJSzImtuu29xtGXgn/F8
 ouw+qkmhTzJklCWKPE1WxbtsmSLLgusrAno22QalQ9LrSNr7qB0eZCamH7tG6HSDKCBqTMEFIdn
 pf1jXQ5x0mJKccUklh9BickyHaIwa6gIZH0Y8NTvHTJwMq2lOeF/ICNKF/31tLDk3jdZDzAublA
 BcFiYJUWx408l108QszeFsanNDAieAX1DAb4hSbgib2vc1fKbwA3rnD6uWSqoshuRASv2EkE81S
 6TNJ8wwz6L5cg8RUcgFnKzXh5RcRf5f+aKHgj4kPBcKzlq75tssoA6lKq1bBQRyDD0ei9OAADE+
 bgNhIHT8UOyZ94XJDzIQnVKVAJS1lgm+CmeLQTacs5s+Ey4T7En3fvhnJVz2/0KnP4QsmRayvLr
 FHuYKCAB5REyV4YUXsa3XfWGKQErWQjKOaSCc5XXpqzLahJmvJXOlH77oRfd6IBo94QuF4Zu5bx
 ttXeklKQc9UrjaiGbfL2VH5QzWeClRYogY4iqx8EFRHeYaWUGyGfJXvDHYYdtXzOjXJbeD5zYhB
 A1sSH3r80zlR3j7BC9wpkXLbX5DLqywUZqxoBVssMZg3E3C5lGD0CCtLvJSpB944QgKgLs0FOEe
 yPOq6qUb6RTSNlw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: fK8XBQuhlqSIb2hu9pgRBvVrAxPLetXC
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae87dda cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=igo63PMTUtHa8Wayq9QA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXxwGeXVz8uzjm
 1Xj6obCyv1Vc+pxOBIZJapsvuHzJg54Vz1M5pg5Xf8jmM0wXPMAu/3VvwjPoxhS873Uv2UQ19tG
 a0rKdIBUIwmPeKWAfcg5CFu7wAG/sxQZQIt53i+l1uTKI7Ozg11UBSJNhHQkJXU6vzLmwsd3F1o
 8fU5CS1TrxWHOtlQWPCymq0X4II2p6H/Ad74UfdKROvaxROb0qZ+mHhouqL1rKTn32NI3j/UVBo
 5vGmobt1nYeH1YUyPDm1juRbjMNHITXVuP4gzoDiXqlhJ/MBrGwHmQRGJVpDqszXf40L9125QcR
 9zokBXlFB2f/OZNGrmj+ClhuYp+4gwFWqcV9r2nnAAQFgZ1tMS+QSnjvepP8G9MXu4L5gyVFYrM
 0D/rjpI2TX84dyDUdczJT/2YQ7LZAhXETZcYsTKaEo1r9HHeBt5yXcgmIWUUCVQgHlnyMQHmbIF
 bKnocOpXsDrB9oUCsdg==
X-Proofpoint-GUID: fK8XBQuhlqSIb2hu9pgRBvVrAxPLetXC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXyAZhAGWIAxQL
 OAkkshDreYPXTIYuWt60b4RsplYATjOqaShLW0UtU1pBkHHUb6oCsEEtRgG5JlVSrQR9eba4oNo
 UvDWOIfhZ6i6EwE37Sete9cYEbRrTUc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

The sound card support is the same across all variants of the Eliza
EVK. That means we can reuse it even for Eliza CQM EVK later.

So move the sound related nodes from Eliza CQS EVK to Eliza EVK generic
implementation.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 141 -----------------------------
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 139 ++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+), 141 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 5e4175291f05..43d428a4ed2d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -5,151 +5,10 @@
 
 /dts-v1/;
 
-#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
-
 #include "eliza-cqs-som.dtsi"
 #include "eliza-evk.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
 	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
-
-	sound {
-		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
-		model = "eliza-cqs-evk";
-
-		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
-				"SpkrRight IN", "WSA_SPK2 OUT",
-				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb",
-				"VA DMIC2", "vdd-micb",
-				"VA DMIC3", "vdd-micb",
-				"VA DMIC4", "vdd-micb",
-				"VA DMIC5", "vdd-micb",
-				"VA DMIC6", "vdd-micb",
-				"VA DMIC7", "vdd-micb";
-
-		va-dai-link {
-			link-name = "VA Capture";
-
-			codec {
-				sound-dai = <&lpass_vamacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		wsa-dai-link {
-			link-name = "WSA Playback";
-
-			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>,
-					    <&swr0 0>, <&lpass_wsamacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-	};
-
-	dmic_eldo: regulator-dmic-eldo {
-		compatible = "regulator-fixed";
-		regulator-name = "dmic-eldo";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vreg_bob>;
-	};
-};
-
-&lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
-		    <&dmic45_default>, <&dmic67_default>;
-	pinctrl-names = "default";
-
-	vdd-micb-supply = <&dmic_eldo>;
-	qcom,dmic-sample-rate = <4800000>;
-};
-
-&swr0 {
-	pinctrl-0 = <&wsa_swr_active>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	/* WSA8845, Speaker Left */
-	left_spkr: speaker@0,0 {
-		compatible = "sdw20217020400";
-		reg = <0 0>;
-		pinctrl-0 = <&spkr_1_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
-		vdd-1p8-supply = <&vreg_l7b>;
-		vdd-io-supply = <&vreg_l7b>;
-
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrLeft";
-
-		/*
-		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
-		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
-		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
-		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
-		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
-		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
-		 */
-		qcom,port-mapping = <1 2 3 7 10 13>;
-	};
-
-	/* WSA8845, Speaker Right */
-	right_spkr: speaker@0,1 {
-		compatible = "sdw20217020400";
-		reg = <0 1>;
-		pinctrl-0 = <&spkr_2_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-		vdd-1p8-supply = <&vreg_l7b>;
-		vdd-io-supply = <&vreg_l7b>;
-
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrRight";
-
-		/*
-		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
-		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
-		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
-		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
-		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
-		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
-		 */
-		qcom,port-mapping = <4 5 6 7 11 13>;
-	};
-};
-
-&tlmm {
-	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
-		pins = "gpio59";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
-		pins = "gpio79";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
 };
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 6c5cc47a183e..726fd8dd6c0d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
 / {
 	aliases {
 		serial0 = &uart13;
@@ -63,6 +65,55 @@ pmic_glink_ss_in: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
+		model = "eliza-cqs-evk";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb",
+				"VA DMIC4", "vdd-micb",
+				"VA DMIC5", "vdd-micb",
+				"VA DMIC6", "vdd-micb",
+				"VA DMIC7", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_0p9: regulator-0v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_0P9";
@@ -94,6 +145,16 @@ vreg_pcie_m_3p3: regulator-3p3 {
 		enable-active-high;
 	};
 
+	dmic_eldo: regulator-dmic-eldo {
+		compatible = "regulator-fixed";
+		regulator-name = "dmic-eldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
 	connector-0 {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
@@ -148,6 +209,15 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
+		    <&dmic45_default>, <&dmic67_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&dmic_eldo>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie0 {
 	status = "okay";
 };
@@ -197,12 +267,81 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&swr0 {
+	pinctrl-0 = <&wsa_swr_active>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
 &tlmm {
 	sd_cd: sd-cd-state {
 		pins = "gpio58";
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio59";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &pcie1 {

-- 
2.54.0

