Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52733A5E91
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369347; cv=none; b=C7EJ+uJaxU81uFJkxGJp6qBcRWEzwNHRjtgFT9SZOo7QRIvhcVIMOxUMVYOmHWRD6+yCsWqgM4xh0hyw4i9H7F9AcSvSgWUV+7bF/RqwEyM2xEBLe/OT5UfLuHu6OyOhPiP0X7DyEDjjMXX27azJxOLgL6JbF8qM3BHRbmLENGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369347; c=relaxed/simple;
	bh=CBDgXzTxRjJiCKtxpEV1qF9wkTzEdzPsvn+oi3mGHxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ileQ8w3gXsIUKZ95InzNn9HpZv1phWwyUn/rJfqtq3S+8qlQuhzcbCDkT7ihgacxgFiW6zOAzpWsTI3/KhcOZPaZPHyA1Cy/kkuWqbe6sEeWKznjfZrKeXjHfEoCio1YDSPdYMvP5oDSMjPyijQqskTB2s9pG9fwo679jLrJg7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oInBVkFT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHIA0EN7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oInBVkFT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHIA0EN7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iqYJ3196570
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPxs/jEaL4dFb59dmL0UVeX0MXj5fE3eP/DlXY2DISo=; b=oInBVkFTzb7hOYGw
	xBrA88LFwQk8CVXUDCpdEYsp9nTPBSfMnVR+eFbRmZWfBF879ds4kQtkiFj+nAAR
	85BB3nDLvRBSqC3jf2OwpvDmOIZBf9dlXrC3v90IcmUn3dsKEWP41Yysn5fKtTDm
	KbU2OlMVsxp2IxFJ+gPWMevP+Sw8weDUQzZvzeR5nuItlotHPepEkEcvXX68oRQ0
	yrR9E4WsxGslt93jCRDFitLdgWCZHIEZVyDzzLJWVEvR4WaLqq69r1thXa9Kn1HR
	m7KCQEm1nqowWvp3GVjEpm0E/UQKVV4cpZDJ7qseqXGeheAQ04JmKzHUJ75DooBS
	U3tzwg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cddgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:24 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-80139a2495aso5270169a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369344; x=1789974144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPxs/jEaL4dFb59dmL0UVeX0MXj5fE3eP/DlXY2DISo=;
        b=gHIA0EN7x7E9S86IAlS2SRs6svBqHu5r9CGoBXfHCIZXJ9d7OXrXMC6SW/5yRYWtNi
         yGdOCVhjXx/LXJqvi+0jmbm54cOX5O4pNOK+GR16EksQkz1EuiLltSctZWpSKa1unMQv
         dDqzWA5EefhZir7lK2uMCd9U5uVC6iQqiLUjZ9b/cIXBwCAhhIQt9mV9uJW6Px86u+wX
         PzoSYKMDVlMIOX65+cWjh/aGBUpEVPGHbEiCa5l14oKWS5aI5N2gG6mNnbPoY3z+wwyb
         S3TOpEYBINXyMgrnWqHpM7PqQy8fDyPIYmaieB+0mzj+i/GQiZBuikfNUb2gL0Mvwl8E
         72CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369344; x=1789974144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPxs/jEaL4dFb59dmL0UVeX0MXj5fE3eP/DlXY2DISo=;
        b=T6sVsd4Zxz2DT03D7Kk4M2Sa/dEQrNeeCs7i91ctqQ9KxR/J5VDj6NIChzHS2UmV8T
         NDfMqmDDDSh6OgUvvEKePF3/l/dBrFeu61Tgv2HuBLveROW9nFGGSgDe8YRbFrhtxR5s
         jZbmnh6OEo7p2XUKAdmGXQAl3ZyVJ5QXhNfDWOs03NDreDpMmcxLVEUPqyqKz54Bq5mu
         zWWVzo3ufKBbhFkkDmBUOQnJYasZ6Bg4F9Ioijzmny7j1JVfwxKhJxA+zXgXg7Gt2Q3c
         uV4dfNzdrZRg9+rKespYw/kDgwWXoyd1effNxKq4JBbesYlL3O3OyMS1T7uLPcshuBmm
         3Zog==
X-Forwarded-Encrypted: i=1; AKwUvByKoBekMEjntZa81ImVD5TQFOXXQwlK+0jsISq4+JcKQUNcXe2uIG7i0+YUjm+hfHJgt19Gn//0QghMIQo=@vger.kernel.org
X-Gm-Message-State: AFuF++nQn/y8jAfwRgU9rqWy+BFR6Gne8Ee36xT16YaxF6PLoMHLV5YN
	rXhVXn9LyEH4XOeaHtOF2GGhGBNPfhAHpMSWw96dmPdbl9i/0n1VpaDB/HYT5reWONXJcxcQc0o
	UoE6Zf524ofOyERpxRtYOA+jCwWbyuzwvY8MP860YeH0HgCFJqYVmdJyfTDzWxRxi/T4=
X-Gm-Gg: AYBFou2dK1TQhIKeynbFKGa/Hg6fxu8R64jLJjbPBFoDBC646W0wJm8wLGBaA7AZwOZ
	RKFWm1vwr/Xr7WSUCeVOMIQqmlka/jiB8y8Gwe0X5IS55/afHi22ZskHIk9VHYWBffz2+wcRdXg
	f94Kpua5dFqDdyOcK0Te5pxD0xobvdVDmfzdMLtF7n23UN0I+AjDDUnIn4i/cm4mqHdhROXm8RI
	tJO/MkucKaULfaOPirccwd/7V4Hj5Mawj1lSVVpvJ5dPSWpmgfZb9REE6Ja3d0vHs9kwvLcTrWk
	jRAAqakyAfjBG4TvXftrun0929Ri8V8dYvbycoKYBd7jXr7iFqFsEAW4au/R9mFErmPTNOwgrPb
	ppCYihhNjWmEMCoiysAENRAAkQUlf
X-Received: by 2002:a05:6820:1899:b0:6b1:9f9d:79f3 with SMTP id 006d021491bc7-6c53fd76a77mr557122eaf.17.1789369343906;
        Mon, 14 Sep 2026 00:02:23 -0700 (PDT)
X-Received: by 2002:a05:6820:1899:b0:6b1:9f9d:79f3 with SMTP id 006d021491bc7-6c53fd76a77mr557065eaf.17.1789369343327;
        Mon, 14 Sep 2026 00:02:23 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:02:22 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:30:03 +0530
Subject: [PATCH 31/31] arm64: dts: qcom: sc7280: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=3514;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=CBDgXzTxRjJiCKtxpEV1qF9wkTzEdzPsvn+oi3mGHxU=;
 b=9Rvls6VnIcZURsfNBpmuCL6FTyRvlThvYX7BHG9SMeXibUPCDDp8/qaKA46zUD627C5exxhNu
 zWYMT7gQwRKD5w8lIw0r0loxof1SEDLf2gXJb7dmhCBX93qPWxRTS+S
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: aQsXbSZneTj29ZEsoqeCXZny9lYC2l7Z
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa79c00 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=P85SdbWTqQQv0ctVFKkA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX32lDYMte4aWw
 +zDJKrEfojMAkCTMpOt7hNoWz7D6kDvBpJhYA/LcmnLbpCIZaRThc0Fvj7XnsXwbTeF/59m1kKy
 a5KRpqBPb1SClxAzvlX8g9+r2xLrGhs=
X-Proofpoint-ORIG-GUID: aQsXbSZneTj29ZEsoqeCXZny9lYC2l7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX4Bo+uHHLKvXW
 KbW/vGeti+pUE2Ot7xAgzptlTBhko8eG8ot5oxnB9vIy4GoT+7RijdOu+z5Qctdq9F1FxpzEDjV
 mlZFRCHmSOZqlKABlj1IJoA7MN1ITMxkI5x2znap8B2HfhyM0TAIjn7VahLIDg8tNxaA/Wj3bNo
 vFwAUiNnBpJwOMxz+SzCXeR3C6rFn+OD4SmomQC7bpDDM4HDoWP4Ig6PQuZtBciGaw75/spUVXo
 oubqnoOKmJYmmNYJGEJM9wdgijPRUiZnkHSTDN0W1UKn70RUAW5xvk8ubr6XdUnrYpnyJyVVzxC
 OOK1uWRXW0r0cuiEOvcI6tEofJC4MMQ8ptQ+4v7xy7tDybRpcUanrWVp3CrNzdbq1O1KoODPgF6
 5WxiJk5itrOXmmJsbbH5uUL9GaKyIO9jP/qWXJR2fsyDWKlJE1nO69bKPMmpjcsGodvEOiLnEkj
 KzwxDD2HnEi71OhfkTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 11 +++++++----
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..759e16ed00cb 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -442,7 +442,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-power-down";
+				idle-state-name = "silver-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <549>;
 				exit-latency-us = <901>;
@@ -452,7 +452,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			little_cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-down";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <915>;
@@ -462,7 +462,7 @@ little_cpu_sleep_1: cpu-sleep-0-1 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-power-down";
+				idle-state-name = "gold-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <523>;
 				exit-latency-us = <1244>;
@@ -472,7 +472,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 
 			big_cpu_sleep_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-down";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <526>;
 				exit-latency-us = <1854>;
@@ -484,6 +484,7 @@ big_cpu_sleep_1: cpu-sleep-1-1 {
 		domain_idle_states: domain-idle-states {
 			cluster_sleep_apss_off: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
@@ -492,6 +493,7 @@ cluster_sleep_apss_off: cluster-sleep-0 {
 
 			cluster_sleep_cx_ret: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cx-ret";
 				arm,psci-suspend-param = <0x41001344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <4562>;
@@ -500,6 +502,7 @@ cluster_sleep_cx_ret: cluster-sleep-1 {
 
 			cluster_sleep_llcc_off: cluster-sleep-2 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100b344>;
 				entry-latency-us = <3638>;
 				exit-latency-us = <6562>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index debf62baec9b..116a43b7e18b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -31,6 +31,7 @@ cpus {
 		domain_idle_states: domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x40003444>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <6562>;

-- 
2.43.0

