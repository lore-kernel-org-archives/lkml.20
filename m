Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A273E9C16
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369328; cv=none; b=aN0U0wdOt7NNZZkG5VX+97v1pvr8xArjzoPn9rSsakqVxfYtHDYmNTx/eXmdtBkNCyQUWijhA5nfe8xbKFMsFx5PfpUjnQH7NK1SWesxg9UzT8Ngmiq/x/cLLWIab8MewZXMpL6UMjRVHwE2Lw/6VILc1CHnjVdxVFbITlPiiW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369328; c=relaxed/simple;
	bh=7NIhEcx7ODWT/lfx4MtyRvEtHjxqBR7eV1TzixGc+4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YfFsu39y9sPIZMQwg8EYwks/IK0n79W9Qd6sR4Ql8BIEFbCZ5E+EhTcJ8v/Mgy2yPflsmiG997BYbfTp0zRjP86BS5YXnGrQjN72Ihyhj7eXJBjee6NmwPKe0xred5yBN4pIEnBoVQPpAkYIETy6JBpsJHOabrn7tEcNwjv0x+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIuRRwix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ro/Svg0l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIuRRwix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ro/Svg0l"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5igSS3901030
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dHbCaLAU+iQT7D9la1CQH9F2SIDHGPGtVRirtSFtv/o=; b=dIuRRwixVoE7UPV/
	v0RTVZbZJe5kXZuzGKQm2lOAgq13c5eKimNOUAMDOF8Xe+73MIN3L13cRbwHe5wv
	PZbPC9jiydc0QmnssWJDiVgzViQJOQQFqgqdqx3Kq4+T/QP0eqgJ/wlm2IU3L2Wo
	YohHVHWoCHDfbezGWEAIAIw7GBbNdx8bBfrpCMGmVwFZ0ewPE5d3dLxP0ksxBfHb
	AXQNNvf/gRyzylLDOryYTtBxlIt5YJAKE0SxsieKOF2cjwXRps+X17yuQi1G8sOs
	KwQim2e4MKpnQoa6L9CoUZMrZV/Ydd8YJbeQclAZlnU3+3UZ/HkIZzipMvUU+5yq
	e1VgnQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5d9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:04 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c27804563dso2484658eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369324; x=1789974124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHbCaLAU+iQT7D9la1CQH9F2SIDHGPGtVRirtSFtv/o=;
        b=Ro/Svg0lu1Nor+tWPYZod1ZlClbj4V5iPqd8UBANRN6W2yiqbRglNgoULanhxiqp34
         owhHItBc+KDyzdpzjhgvcdxaPj9hHPNJFjfNk1XhpSYGia+MFgFJFN2+ZvItTmZFCkGl
         4xGjvxDL73rKsR4zMr7ijjAMWNofTJYUm3qpObZ171Xz55lwAEb+7cBb/K96ZlqbkITM
         SE/zzynzqfw8uv4Ifs0iYGQT3au912dcvBGyiXy6hXzIlLFoV6h0Wofrw1+2yYaapGh6
         f36taPV1QhWw6CKhmZMS0rs1Bkc5djx9IK7uUUUlkpyC4maYRBYo3LdUDR6PFKnPnyPc
         gYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369324; x=1789974124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHbCaLAU+iQT7D9la1CQH9F2SIDHGPGtVRirtSFtv/o=;
        b=IDt5LcLf0RfL8ZQqAKDiGKMiYkDLYcBpdpGSDsWoCw7NZAItYyp/y717TVYG8zTs9Q
         nvIMDx9japSzwVyKFACXWBUvtRGegYucQjxRirIqj4mCreHyZUpUEeSPeQC6mVpxs4Rr
         pGH7LBQsyNWjcqte12aBiiwSC52RiSEf9EOnkwXXdM9DiOAfXKL8nZrOespR+1nsBXJw
         uhCGAZzoUzBITzCpiwpRBJVEtbBJJGBYRffziJLcFReNwI/is2XbNW1l35sLwhk2x5av
         o3nSMlMLKantB43M0xGHcv6CDiBHD82VYVq3ONOiNo7sAcrhe1O0MLaaWXWKH2gH1o7/
         qbtw==
X-Forwarded-Encrypted: i=1; AKwUvBymMlVYHeU5GwXYarVvACMRoMSQVafWc3IkxRhoDl4UXpdVN1zpmresbtN56SVJEV3HKhkiGCvfrpSaa88=@vger.kernel.org
X-Gm-Message-State: AFuF++lLBgpssmFJX9Rl7lGmZ3dsP9QASS8+i2tFBxwjJiUEJVcJhGoa
	eu1EvAsCTmywd1y0LK3W3g7sXN98YRz39xo+oREiqoTg+6MCY5E0B5WAYXRG0f+9CiG9xN3c1a/
	R9L5lkc9wph//r8IYOv5Cv5uOwzpdcIIQSQk4WXfvxC2W5uXk/WinWlrZweU66dg/U9s=
X-Gm-Gg: AYBFou0b80w3zWPOuf6aI/7SF2uy9P/QmDYS6XdeDIBTyYcintEGNcIK2fHr6IhBbyi
	TQj27OCCsmGq4w7to1dQMkPbXkttg82vuw+VgWU/eKONUzIsWC/s2OHyDzi/NQKkhBqqgaosFR5
	CnPfzGvbPQFiegchJpPuHFTDGxMtbAuiWCL9XAflIjle9QLYwiTmYH0hdoWs7hsBy4h713Wyfvs
	awBPsEd0DYjzMEmwgs7oqqX85wuYvp/VBw0BHHgVxvNg24ovCczrubxrLjFuKYIcs4vOWWmhJ8V
	0EBjtOFYN3Xm0BPqP1MrVtqL6F2AGbICAkpXajry+vufTYMChTnsEB3vzfJGpBj43vMEQRJYR2x
	/emUZkq8TAOiRilOm+DA1/PEtk/nn
X-Received: by 2002:a05:6820:20a:b0:6bd:c88c:982d with SMTP id 006d021491bc7-6c53fe8437emr528788eaf.24.1789369324090;
        Mon, 14 Sep 2026 00:02:04 -0700 (PDT)
X-Received: by 2002:a05:6820:20a:b0:6bd:c88c:982d with SMTP id 006d021491bc7-6c53fe8437emr528751eaf.24.1789369323647;
        Mon, 14 Sep 2026 00:02:03 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:02:03 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:59 +0530
Subject: [PATCH 27/31] arm64: dts: qcom: sc8280xp: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-27-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1612;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=7NIhEcx7ODWT/lfx4MtyRvEtHjxqBR7eV1TzixGc+4M=;
 b=IagOhcj8ZK4TwxhisUO7iLSSMV0YTrXN9zVlNDHjHCtd+lpTYqLpNudxUFmMne3XmQzeefFMN
 eGB81eXhRHyBVR9/hep7CDwJKB/n87Wx03W+DHsLEWJiEeX5YIujG/v
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX+PR2s8Sg0LG8
 KUFJW4juJWudVq8c5zlGHLX2+DrmrZfryxTOkfx11f9zZqsLicIYhPtEJYt0qciMOOCHvc3fh85
 2jmjdbPLS3/kGvMK5tCp9m4Pl0IxOtA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX6l4TEQ6D+/8i
 v/Haiq64uqtt55lLpcyVuzkAn3CpwlmoGoWvdsskjXuktRklXPxMar/xqzhO6nGIi+hJ/Ht9obp
 JWwqSdPjWJJjnBa5fJdlR/Oixv98CKJyP2BtPuwp1dtbAN/wZNR43PyJc6J0Dff6xIxJNK/YlYx
 zJThll92OZH+eH91tXoioocpYSYMP/Kapd+YnSKRsyhBEEmkaCvXjwKPGonCygMaJqblsYvZpwr
 pDyQCj/nix15D/lBcs4GX3o3GvOqlLg6BQGND9D9gjApEJ4E6WflMnp3uZH+ftecfK37Qyig2+b
 LwJBridCvKgXoX7/3+dPIVi2AnBxmkFb3jiVxGwYTBjUbgUJ69qRPc7giLYFJDP0zn1F6T92uDF
 qRbQlNcyE29joP6kHHKYpEZd3nsrsn9onupdK+SR+gGcHAynrb5gvFAc2KsN44TgCO56uQ8aN0e
 e6k/sbsMugJvGL45Qaw==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa79bec cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4Z_S6MpAyjS2sx10nrcA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: Pjc_OlsfFJyuC_ssfvHLZZRfvCGEwNV7
X-Proofpoint-GUID: Pjc_OlsfFJyuC_ssfvHLZZRfvCGEwNV7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 874265f49d8d..b1e48b5ebe88 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -279,7 +279,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <355>;
 				exit-latency-us = <909>;
@@ -289,7 +289,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <241>;
 				exit-latency-us = <1461>;
@@ -301,6 +301,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

