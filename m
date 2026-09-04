Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ADE3E8337
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509814; cv=none; b=c4VZpe7V3w+3MjhBLZx+BW72z7YkTrBdNUe4SC0fSAN5TZa1wvg3obPYGksxwI7iu7EnvQwnIPFNzLpr8IGEYaUgtiffc29Vs5fwP1x4UxbPVw/DsOU5NOFcZ+v4ckQatD2HEwS8GScGHtWPTIyC8PGeAgwo5EUSBIj9cI/836A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509814; c=relaxed/simple;
	bh=yrsdg3XGE8YNqgGK9GBp1eF4EjaDG6zeXPjU/tgt9Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqOu4WHtJ54F9Mb7v28H2+Ap0nJpNbUNaMWKhc8anZ6UM8IH0lwL1Iav6QK/9a8lErp8FMcHQtZiXYPIgdmkpbRcBKdUY0sMpFyLHhflwOggNAv+s6fexpDprZ93t+yjmY5ra3/ETlSN5N4EAcx/zFG4E+Sb9tBpKrptwL0cWyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pilt/M6X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJR1L9x8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pilt/M6X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJR1L9x8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mXRo2838280
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 08:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8YBRwLvnHMf
	dCwZ25ECl4bK0hgHBskEkshgI3gq5z7c=; b=Pilt/M6XPfyy99VTjgn1GOXWc1E
	Xfx1jSEl4OfVFh4nl+4Sea058W4+guYZabRsCLv/mEB7sVzt8qmtXHcL7+0OgvuL
	xO4+BtBoG/THMe9/I4CF5NboOolOyvKB2m9DbGd6JFVBnjju5wCuFkoIPuldLEPh
	y7B+zTx0OVmtjjjHry4CdbGSxpKbT0EeiacMLDRF8LUrzoH8kRbUnPsc2wK82D/A
	9Gy/lKQMLXYhBHmfR8Jz9c5XYbv0K7pdGSFqnC+z110nrm5XiwnSJ0WOyrgO5CjY
	LxvYR25E0o3LILwOtXaRJZzIW4j9wAFO012D/Ops4w5BGhrylMn7BtfC+lA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqtrhsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:16:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso1012019a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509810; x=1789114610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YBRwLvnHMfdCwZ25ECl4bK0hgHBskEkshgI3gq5z7c=;
        b=EJR1L9x8BBGeHrdYSHqrSkRiamXZeYHPaGWebGxlGD0OWAFWEIaofVZp4Matg38cUM
         2rD9NscyfFh4XRROp+42eOMYXKMcEmEp20YRYeYQsqtp2UbxFUbcS7MslWLx2xG3Ay21
         GFBXdSpKfcAFXfwlHs8vnmdZAy9wMMb5+OZpVw2spqqLmjAFIDFPwWBXO/VN51tdTXOn
         yHPFaMMD2/QnSZtk+CI7HSJ+Dl1VqUH9q+7w5khRi7u51YBGxI8oUOKcix1Ur7gWcWXh
         BZB1m8QmtKM9kWyM/178LuXg5IdZeDr/B2ieTN4uEL8PgiYSzdqUZs/GMnXt+LyhQz+p
         n3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509810; x=1789114610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YBRwLvnHMfdCwZ25ECl4bK0hgHBskEkshgI3gq5z7c=;
        b=CjYogYGinAhbPuVh9tmTgVMt0tZqEiwVN7god+/+SgXzAw+Y92U7flpaoz7IPR1h26
         mwAJlnhrZXRaSBouYYft3t/CNbhwq4goPuroVu/WrqlUu1JD4OStpoqHowIrBkooesJo
         HvvQPLqNg8QnUrQxb6MYb3Hp3SRleR6QLJj8twXL8ct8ELDwYIFQ1WkQi+Y/szrixS4X
         0hQObyVDgN5omaFNXk1GIa8NqoAJrVYadpBY6UQMwqIo494LaB33ZT64h+Snx0HJMwhw
         PYvoNaN4bbFoLsmUqAKi2M5XKcbhoyof91sMuwaWioX0s/e+yF288VdDPsU4SIZCr7mY
         wSHg==
X-Forwarded-Encrypted: i=1; AKwUvBw+EybgE3J0vN/G8jCtEGFtA/EFqUMonJAS+g11dvRvvfAr1B1vPhhPAAaKaJfTHR/vwyD9WvLkIVlo5bM=@vger.kernel.org
X-Gm-Message-State: AFuF++nIfUW3oK6RRS8L3fJvwL7c1le+9X/XMj8N6XR3ALfjD+4lCN9/
	zuwwxU2ejxpeSsgQEU+oSXrmVGgOE80G+i8TaHgbFUqS+S0FneZkonsu4pcT5reJpIGUMRtXhA3
	2wJDs36kNQ54nG+BttUWtnWWxr9bp+F64AzD6EvDEs79pdlcDnlIW7tG4O/luO6j/O5Y=
X-Gm-Gg: AYBFou2Eve6UBjb2ayy/Oupmt6/KfWbEWihO+zYoT7prpsaY+9y/CslGXUAjhqo2gWz
	njWmL/lB/zfEs26Ujz0ZUdbp1LsHrF/th1pYlXfVj/wKGvmBqBFnJmk1tM0V8CksgfGjgdpjCg4
	S/KmFguLCAC2fBTJOAwt7Wv088yGgObj60aP5JWsN+5GImX3cgt7SFJBcJovmmKlMia1bEwafCD
	ldXBPQzjFQZycXuyisZ06/eO2bZ+ude31/7WgFPvCI8PVq4EQa1rZh+eraMVgRpHp/9FnGxxpWw
	NNcJHtLr9L2B2hxPFeD8/mNzkrFaqKP6teVGs7DwP/guMXQLY1zhI9sbvOus152EOoKsNqfe1D/
	89MO3PH6pdXUUCsjRGCVODwxTRkwHgmZaUb8LmY4jMiXgcVN9oo5U0rrVy05m
X-Received: by 2002:a17:90b:1b05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39b262a89d4mr6050028a91.17.1788509810225;
        Fri, 04 Sep 2026 01:16:50 -0700 (PDT)
X-Received: by 2002:a17:90b:1b05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39b262a89d4mr6049983a91.17.1788509809802;
        Fri, 04 Sep 2026 01:16:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5466648eec.7.2026.09.04.01.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:16:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Fri,  4 Sep 2026 16:16:16 +0800
Message-ID: <20260904081619.593602-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a9a7e73 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=eAws4zb0lv8ujySLY5IA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: EsmzXkGM9jKqqLtY9dYkcpDur_mxyvtW
X-Proofpoint-GUID: EsmzXkGM9jKqqLtY9dYkcpDur_mxyvtW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX4EcZ//KpXY//
 GT79JlizU5b52ItAc5MQdE8O0HZ5sLGrcHuukVnL5IGlCSFK3iJPwKzJt7U9Kg0bHI4uaET0Bby
 V6/WY52XfvtC+t5yXw7qLWfdCVdYgEw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfXxHWZmxxM+JZe
 6HWf9BTB6p72XCqxYlt4My23X9qO2amW/B8mfBqzLbJKQT/u5NSWaITaTPH3ZfJcjip4qBDZePS
 sx30xKnrmwED77703ALliflPvqjBWJgw6kUjL4yblH0bwDgMElSf0lMgQdtCLtpkkq1pXolWrIS
 yfjHZHB0g8/sbN1f3GbvUB88tG18gJ3ZXHVRUrjTmDGHjhrJMcuwlbv/vfCu8Cnc/ZqGiJDbSUR
 /xAIZNBqIu6cMUZZ475+czvDTbYAdGEVKgyVulU67deEyfghEC+AqKLM+dSF+SHMVzDGlObDTu0
 Q9msrhyf0jhXLs3g/EkD2YzNMQ2vcqTSk7fJQX5xWIj1mCZNgHgXYI5M03wAR/EWJY6dcZ1zZe7
 jkoZoDJ1Oba4e1A5PyNO9rp6AwRxGWKho7W4IUfCqkiMk9aSW+htnHS3mcaX2bEUsnapGc8Gd5T
 gppO0MlwajJzyHACWDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040075

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 03703324f487..83760341456b 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1865,6 +1865,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

