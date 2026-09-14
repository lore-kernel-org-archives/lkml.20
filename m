Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15823E5ED8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369321; cv=none; b=ESWbzN++pEMJ9/SarV6SbwHHgfyebkF5sXI0wHI2UPYl66i7wo7F8AOZxV/HX3yZ3cig3eUpvKIT1JDZGZQXPmFbkO7waFA2q6fzR7PF/KeEaZdzH+9k8ItYTPLj2cwEIqVSO8slFs5vh1Ve1zDDF4yXrmxYzSaJeMMKsphBxUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369321; c=relaxed/simple;
	bh=+h56usQ1Yi6l4yflRcAwvqNaGPJ0dvqeFkKFkxOsdqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIslGy2I/PUANsm0seDjV635+iR7t3WiJXw9fLgEjrD51FcjUPqOw+Jjc9A7zj2Vr90iRuZ0yqTg4XdtGd2xQb0LXMLtitwifzjUAG4gu42Mh5LjilmEmK3WPY08id+vBA2YMCDJ4uQnoSSNB+gs3LtsE0FXMyl/P3Gw+No1Yl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkNXhaBe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUoXdCfr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkNXhaBe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUoXdCfr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iZgN3127224
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7uUZEoYKnPQC+IwF07A6iNOwQUBJvSOALmC7A73oXls=; b=SkNXhaBeHLbpLZCc
	eUJvpP2i3W3CXKZLQV/Qxjws4CIwhW6I2SMStUiNkRK6SLlr5ogvUxHr4MWrUeTQ
	bjaEKj2ke55OeVulJPoicPnrhjMwDgjS6c15WSRDWp69e0LcyTxfT/5HisWrxFKc
	7FEHD/HT/ErQxUxA6KqdD1tXRP8umWJ00G9Ok5squ+ysbqDQIk8af6kBQd+jS6Kj
	hF7hUAkUdnloT5M1lFPfb+fS/UBp0mniFlFDSECREViHw1oEhRwx5nCNwJjoxwqQ
	CDQI2HN+Rp67kXskj19FWPy1dSMv3eeptZezdb7RJ3fVZOkGsp7Du93gBmZOyI9a
	S/grqA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018n9g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:59 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8048c813cceso4474042a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369318; x=1789974118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7uUZEoYKnPQC+IwF07A6iNOwQUBJvSOALmC7A73oXls=;
        b=CUoXdCfrKP04C9Ryzr3ZeqEkGFKv0pPHvi5Hfz7sGCS9d+NrSmGwupo3yJ4b8i24fK
         dpTMivEyE5GiB84dW6n5KqwJ/Qu5fXQgw3uolnJjdA0R1LtsYCEHxPon6uANCap3mT1M
         xipEeE+GJcM3r1NjYeJm+6/36H77Ash1ZueN2PgPVs2JZsfGdZC6P1g8mMwZe6BP8y61
         toE8dmDNypILsLl8Zu0f91eXv+6GV+tcu8cPf8TJbiqlvb00LUDmuB0V1QMQLQa+Nunv
         9rli5KUEOSJfdvgGsfrV+xG7bbUbcCCSy+3Gm8Iqw/gMcwSl+CZduWEglksMjN0SXRP9
         DvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369318; x=1789974118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7uUZEoYKnPQC+IwF07A6iNOwQUBJvSOALmC7A73oXls=;
        b=RoT2KqzKhlayEf8GwzJBw2OazRdzDrErkXuQhHqV4nHebnGWkk+W6cHLXRsTXEnmBX
         fu6daLjHTVp3pVOIC6MGF2BNRDYVyHBY7f2+QbLZ4OqdVniu99QSzVh5TQnGMm9fpt7R
         PrZaD8wrgHMuErqtVHOgrNHI5qj89tOxU3XdImOjCOQTBEpYJltxMA9dSXvCrMR2kqeq
         EHGGlEBhs+sU4sRerMMCBw0yO3RW8LGgs6JdiA1FEoKbKd9pWAZR0SjheYWxQGO5zwn0
         81n6EmR8V6Rl7p83D3JjNZYX32k4wV9K9hY3yyQez+xgop6ARkmCwTMIV0ntOV3x37+I
         psnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzkkGAQN7B5Dz2VDl8UzI3XPjvtfhENssSo3brExLj9b5PJ0epm4BDIRn3XqHAXeR/UQNvg8u8/BK7BRY=@vger.kernel.org
X-Gm-Message-State: AFuF++mukEQlgsF9A8K1bdyafyNPZNW6wKRJ9055bojDU196jRHJ7D0K
	Jx+dPe5+qMQG1/Ns8M8SVzNomUGGgdYBk0iKp6dweHFmhgMbsUnhrYJr1HgvUEwOnXUauiot+Wq
	dh5+4LnJSNk8carFa/27P1y9yeCcHE6Y9E/K0rjdbv9CtahCc/SI8RdGV++Ql5TxN0u8=
X-Gm-Gg: AYBFou1A+2ERileSbf5l3syFvqbTQyRMG18FpGBpkQo4vPUxUvU7jVgq7HCL97exHOe
	N9q0tVxuUGLedkJ3SbhyYMbtlqwRNbCg8JbIS+DuOx8/h6/qI745PjJbHyPqFuySnQ8BefCL6yg
	HZ+LXRWZpRlpRJpDZpM2ZjeyA/HfUT2G+GlAMxNdQh8RLSsSlUkbP+grYzAtgnwTZ4B/hMQq0Ym
	p7UfrqR8NMI8PBs65K6JChVraW0daFmYEKjKfhjUawv4BEJFCsKxg1cpYqlAVKFZzEw8PPf1gE+
	9a/jZuzYUZbnQL/HLv47YXyhY1BTSeFbseaIKXltx+aPruWVKiplnaEOMtt8rKd6EBfcIcMoSd8
	86Ih6mSbfvuRDcLhau7jQQ4j9l4hS
X-Received: by 2002:a05:6820:1988:b0:6c1:7804:55ec with SMTP id 006d021491bc7-6c541f44ff5mr590580eaf.44.1789369318264;
        Mon, 14 Sep 2026 00:01:58 -0700 (PDT)
X-Received: by 2002:a05:6820:1988:b0:6c1:7804:55ec with SMTP id 006d021491bc7-6c541f44ff5mr590519eaf.44.1789369317598;
        Mon, 14 Sep 2026 00:01:57 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:57 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:58 +0530
Subject: [PATCH 26/31] arm64: dts: qcom: sar2130p: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-26-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2150;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=+h56usQ1Yi6l4yflRcAwvqNaGPJ0dvqeFkKFkxOsdqE=;
 b=vtfdxNDELY/SzoJL7yy9m7H4eMcKSyEgUN+9jEQApbki7qdNyVBqbV8sPhxyV+vgIWgYPF5L+
 wBnApohFDUvCpJG+Z8vocpSo/jiJ+CA145H3lTvbVkWVPFDxUabg7Wi
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa79be7 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zNJdEiMgPnwyITR1Q1IA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX5x3jcbrRzWWM
 Mm29uW9SDrlV1TocNfUw6E/MCK0yUod+owykha3JAsdRQFYcF0F1GxFxDDA4YET7PJ13TGKnlqX
 NtqGeKzkP/y7tPfB5iRVBbuIBS/n/kQ=
X-Proofpoint-GUID: cNBYQFV6lhvKKRIT5iz5qFMJk8HuKlAc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX+kPAZ9ClJ9gd
 MwLi9xVg4/2MKz+kjRZPU19/bwJduW8BJLrBSh1KipSZLXh+AE6aYMji6YZEha3D0gydU5GvBon
 Cw2V2BCzm+VckfiJerdwS+PhrM76jDL/E2bForo6MKqFbrZk5zLhY4tXUHqgMjiyBcxkBWGVKm1
 RWenXIV7E6oZSLCJmkZUd/hBVAhn+dg0Xg7uDW0FYVMF8hHjr0Gx5kvl3wzKS1zq+WArbGlBfSM
 n/i1E7EhxXhZpkZitPF7tGYZLUisVAZLMCpJmLypieBGbCJmYhQ8g6YQbj1yjgXP2Ru8/jkGL4O
 AFHui3LXxKUOP0pQI5H9UxKsZQVUeaaNEigVMoSnE7hAiH3FMuvGj9798REERnj1m77ax7eo3hI
 NxUmSF2t99xegQlzKc5Jk0q8/jika6Y6PHS4Tkme6C7WguRGiQdqyJ/XrZWjz9CghrUiJZL523R
 D3fOrKiCthKwlyRPmNQ==
X-Proofpoint-ORIG-GUID: cNBYQFV6lhvKKRIT5iz5qFMJk8HuKlAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
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
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 2ecead79806c..e85bfab7bcf4 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -157,7 +157,7 @@ idle-states {
 
 			cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-power-collapse";
+				idle-state-name = "silver-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <549>;
 				exit-latency-us = <901>;
@@ -167,7 +167,7 @@ cpu_sleep_0: cpu-sleep-0-0 {
 
 			cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <915>;
@@ -179,6 +179,7 @@ cpu_sleep_1: cpu-sleep-0-1 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
@@ -187,6 +188,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cx-pc";
 				arm,psci-suspend-param = <0x41002344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <4562>;
@@ -195,6 +197,7 @@ cluster_sleep_1: cluster-sleep-1 {
 
 			cluster_sleep_2: cluster-sleep-2 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <3638>;
 				exit-latency-us = <6562>;

-- 
2.43.0

