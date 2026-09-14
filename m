Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5723B4EB6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369273; cv=none; b=X3xCj96QW65qSQvTT72+Gn0xhwNQbAoQbPiJB7upfHE+YKrdV30OnHete4T6+9z7qatPtTfeNSMBK6f12bGmkqbGJCp1b3l71SzI04f5c6vQuy1nmxS0gW87D4/5LEWHHmohevY70kMu0YrMsYAyC8q3WoBqir5h7ZA/seKM4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369273; c=relaxed/simple;
	bh=sUHQI2zKTTPFVkV4CpF0N4F68r4HNK5wcu8caMk3tl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t5aGk15LOks7RFXIJ6eDkd69EcxTiIoZGjSvmWjhbi/WCAfT6WC+xR5OroOi+0sgaCnW4+3YdEZ4Rlr4UIG4jvgA3KYXrnHtV0IGIXI19i7FSOjMOFC/Hscy6GM/MToLwvIyLmWROWzi3jNWrgt8qDIYMWCMcWyEsxtmb9JCefk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMqPFPzM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Im66bBS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMqPFPzM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Im66bBS8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j2go2628221
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAfPHYxaizBg/8qKTJcsfkCWOP2KxuaSQ4CoLbeE3RQ=; b=AMqPFPzMrSxySk1H
	bj1+xL/FvMbuoDzYZNh8iSqPNsZzQ/U3mQsNR+JRxsV8v4q0pwFhBRKwR7vWQJZc
	qG9iE0Zxu9GCVGsAHx7u0NjrWlhSqHF0VcCPDOhMw1UpZrnKXL9Lew5WXlAUoCnE
	2AHaioo4S5toSCq9qPAQKCAz2JHkfwIjmxqeHeMvKhjDvUqS6JFR/VCN02gapr5h
	jbBnTsaMcKfIqMgoyjpWPb5cZzH6na94A91aA1TibQl0O5UmV6NO9iiXcWpy9Zk6
	vr2sLJ8+HKWGlnzR5sYDeKxKvP1LKFsD//vGVCj+HgkT1r5Pe25Rec2qCaAbtRdF
	Rtn1Aw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh59k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:08 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b38ea4c6acso2064324b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369267; x=1789974067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAfPHYxaizBg/8qKTJcsfkCWOP2KxuaSQ4CoLbeE3RQ=;
        b=Im66bBS8pDN4l2/vBUji8NRorIzNmzwoRFUWF7IJmoGaSAjKhdsKVjuWcOJsRDpw/N
         9fPlCSAvk1Pij3AB7uW0g6tmy3afF95FuqxnjH2ka9xOU4skszTlyRn8K3mtstmkw20o
         LSRlsSrlzGWrGf6kNKCGmpKa4DMyVWHDrm0VVloB2C3nT29LCXSSzRaf+RGolr/46zQ+
         JHV8E1DBfxdQ8s7n6QHO34hkMpzLXjc232Erqdo/zGyFjPrDV3wS7u28zjquDMAXMAZj
         AnA4+FNDA7QTFmkd1ftokVhhrjI9T3iAcqw2Rs/4qJL5PQsYsi6rv8KDzXKdtJXK40pQ
         By6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369267; x=1789974067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAfPHYxaizBg/8qKTJcsfkCWOP2KxuaSQ4CoLbeE3RQ=;
        b=XX+2Q5ixa0aGo8PEy/WDZqgCOddlq/VLXOnaJMUwmaPWPK+dD1G2hov7HS8lLDIQXp
         aoC6AWN5X0L8ZawGC1ApvGTqOYPeXlhPnpGJ60hanGW0UDR0maERbdjrEEpZRgQKMyEL
         XnqRPpX+H5Zsey9W+/ujwroR/MV5vWNXZ/dSNYf3QGo2llfT/oarasylbc23dgSkmz3e
         IVjrAdSVT6HnGZwasThN7pVVOOFF9vK9qrSvuvE4cIJFyQzx4SpimlxZ1zCxWPDbzbB8
         eezpPSkYzSBkf0k1/SPUTznzOZORqOKaqsPpN3vyrbT8WOCkz1qvygB+Y4GY57Q7u3I+
         7Mfw==
X-Forwarded-Encrypted: i=1; AKwUvByEEhwlp2GN/sUUOyfxH48tZ8Poe1vWNOSvI0AEQG0blN5Qp5zwHGICoV2AC/EAOxsvBua2aFSDVTAo4iE=@vger.kernel.org
X-Gm-Message-State: AFuF++l6MPom8PhIguJvOTbIiXt0RQefiJx76OGZQujKTGxkzMOa2jxk
	r8IZLfsrevsJLkroua1YZKCMT4GvXsXpWuFalLmUK+teXeQAc56gnw2tVQF7aBuZsqUXTEuJQQO
	ds8APE/7wqI56QaRTC/37zWCuvx8V2vKXvMFK9vFjNhbwmFssUtg+w+bMh7HZ+8wKD1M=
X-Gm-Gg: AYBFou3gOUcIcyhRp8/Mhwu27I0bIcyRAQqfZKXM0qjC6XPUpNBUnb+KuqGwT/iGyfn
	8TlWugv6H9Km4Gas84X2mVA1Wzrd/WKGUP+ZN77PFWNmab5v7jRF7MteQI2C1owS/nJn3E0Zh0b
	FUVUcjiKORlUUtkgf8N7W9AxD37EzlWmCOYo6BwFrzpT9UzDI1RMtXfXBRoXAY8EyMXuOAI8YOJ
	muYRguNfgkiFWWgn8fM3fu6bMB8G6cB8ASE33SPRKE5+2c2Dud04uSo73zCPRP0mv22ASTxiaqV
	UUOqGsSrtk/v+zax81ssbyuZa4JgWgAeVzcElHg+Wni2TOgJQz6LOAKYlKqiy8n0ddqdJxD/fVv
	neOVvzv0aJ8Izk06W/FXzs9l6KgLO
X-Received: by 2002:a05:6820:1849:b0:6c1:177:c7b1 with SMTP id 006d021491bc7-6c541b3ee39mr524793eaf.62.1789369267452;
        Mon, 14 Sep 2026 00:01:07 -0700 (PDT)
X-Received: by 2002:a05:6820:1849:b0:6c1:177:c7b1 with SMTP id 006d021491bc7-6c541b3ee39mr524774eaf.62.1789369267032;
        Mon, 14 Sep 2026 00:01:07 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:06 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:48 +0530
Subject: [PATCH 16/31] arm64: dts: qcom: sm8450: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1890;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=sUHQI2zKTTPFVkV4CpF0N4F68r4HNK5wcu8caMk3tl4=;
 b=7/Cc3imxcSvIYE6NQ1XeJExbOL/jCu1vyA1Jlc2/5KBo0vJpsjPiXhaUIQGgbBP/heC4DNKT8
 VeN8KapbyNsA2br4C60HeB0txsuQvUpRmxb1lcX62LQLOHEqMpOVfgF
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: yTt7AU8BZnssuIfbWiUiN7_F-ZMO05Z9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX/Wdx/7spA/5c
 kLi9bv3/t+RsBx5wwFYWigT4UG+tCTCfxYtMj6XaTr6B3E+vSAJWMBj6uQQdrC0/6a6igdW1h2X
 cTIU9aj9rARoWQloPq9dcJYOBj4L5VzFQkZNtRPeUUXsCt+GC+/wyL76ZtL+fmU/+gwnIZOeGAw
 Uv41hnf0V1utsMwmneFGb03Txiy+YoNXmxeTJV2xKIkdQzl4pA0pcD+9WNckcLgJzATSPlYr2fl
 +mdqBpAEsUh8mW3IDsh3GRUD26w0HZ1Y60hGKJOiulojRJQYKPU5Ns9Nsb7EwXhdR4g7u21/Sas
 zI7DKWu6Huw68T0QrzRdafkiMmfkdN750LyhvNTL0wZXJV9uSsh2GECYYdigmDWJ1sEhV7OePrg
 x1VRS/kMSLub96kckp6cOFZPXNvrgRXjzyeDroGwXP5QuoPMXLxThyfRCK3kRcsjSqDpty9N420
 BorloySbMRd/pfl64uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXzWJDUdmSAHDx
 6D95rlH4Twn6GQ+Rukntb4KVRqhZqyTs19QdmF70wUY4cjqnM70IjtlXYA/JMBsDAvqZZbwEdqs
 USh1r17sgesO0OzjNS7rn8sal7kt3WY=
X-Proofpoint-ORIG-GUID: yTt7AU8BZnssuIfbWiUiN7_F-ZMO05Z9
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa79bb4 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OzLIKpLSOQ5DsbBBciYA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 484ec8ec8c10..dbbdcbd4d4f3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -249,7 +249,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <800>;
 				exit-latency-us = <750>;
@@ -259,7 +259,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <600>;
 				exit-latency-us = <1550>;
@@ -271,6 +271,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <1050>;
 				exit-latency-us = <2500>;
@@ -279,6 +280,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <2700>;
 				exit-latency-us = <3500>;

-- 
2.43.0

