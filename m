Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E603C0A1F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369301; cv=none; b=Emnsr2Ux9NXV7iowdq90EEJavxTUSZupgDZRZxEDOXhXyjWixAbf7trIrTMsO/pXEhfwlORQDezP9ugBMIlBWFRjW4EqSDFM2m6cW53fOb1Rbsq/5yo08pTAQQJyS9uvhPF+G5mEkQluxGGRBX4lWQYVhQ4Pa3zLEKax5dAB0TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369301; c=relaxed/simple;
	bh=aLFrDhmumA6bdgDpKeoGcUNeQ/sPpRUO4qa49r+x2pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AG+59S/S8hAx3Vpvyf+tU9nSrTaIkiC7qs/+yTSnyJFutbDQlxDeEj7lUWkuMqM4saJMniqKi4wl4aUCfddal5AO2unZOG760lcxUuGN7np4HCuvf17V0rGcyEFMYP2yrs7mQDZmK8AghhmhXd+Ff4cBUvUTEPGHJaQm7ZZN6cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBdtgnJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eoi+sN0u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBdtgnJ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eoi+sN0u"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5islk4058198
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Fn9S60UlMUhD8iVGlXcZ6ydU8S4n2iB2RgezkqcK1g=; b=EBdtgnJ0e2YLtR+A
	wW0TWAmNL4JuDeOhN94AA50R/RQdxMSHsHztk+z3alp6YGFpLXHKJg1ZB0m2razX
	PAK3n3qlSffKkjYk9xZ6dZxs7djqcxK2A8MVjRCzzruFp7Q1XINtWEXpbwBRMh7W
	EmH2J8t2PfxN36HKzfINxGy3LcrKP3GlcPvgFCCjpgauyDHoxcdYQ3yXzhxgim6N
	mn0Dpwf5/myHcvuZpC6xnwqT8VAZRypYBrviBzekmuFnSP3fiPdmkfQC76FrFjk5
	S5Y7wzsFM4bUl7UDVhIctL58pMSYA0dK0o5gA/rcNmvrz9De9zaQrAyA8tgfS3wN
	aVVYQA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hss82c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso3982395a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369298; x=1789974098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Fn9S60UlMUhD8iVGlXcZ6ydU8S4n2iB2RgezkqcK1g=;
        b=Eoi+sN0usrQMUnr2maj1lSwQEWGJ3UIAisOabct6m80bP7TruVxsp8whWbxAsyOTc1
         0WzfepPKKbfLYJBjE4quzXu7sQKEM8IUauXX3+j68jrxCxC/W531YS5XWbWOnSE3Lqfu
         c0tdFxiT67LEE/lSe6i2+EcOlqb2e1/u3AJMr7NmKuxjXecFtoA3oaFTUttK/VoMi730
         cyLgXIh4XHwOy8BXYoEqaQFPAej+Y/XCZAsP9dcm3s1tIiFUSmC0GwViZBpD0z7pDAFT
         n5tKmu0lLCQKspi2HBASMOQn/z+ORQw8DTSwHpPXHM6P6o836pXhXznmn5mSuu+3q7At
         It/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369298; x=1789974098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Fn9S60UlMUhD8iVGlXcZ6ydU8S4n2iB2RgezkqcK1g=;
        b=OwiTOe5jdACbaMsQ53FY41dBg6I1Nip1ZZKd/+jT5T5mfbhGL17kK9fhZjBAC8gaVs
         xSgJJI2tO/p9rJvJ9xVEvgvKoJOqt05Utq+bdxVH9H/+G7bj/Rxw1r6/fzDLKxhaElTz
         gJFOTZPxfCDL6VjiULd+2KWfqU6iY+D1j6eq2/FA4cM9OGTpQ6ywQ5phuNJY+diUJGhq
         UVzxxtzatkxkD0hr4qU2e6ZUNx1sMr7l35TmoYLokmasxV3XHhZyFOWWhxVyl9tOW60d
         9r/EZ52X6k6j8eMW2CvhNrfJfBvCuZoND/TGmbb/TGVW5+EZbgyMyQtpELzLWyUoi2VV
         eY/w==
X-Forwarded-Encrypted: i=1; AKwUvBwW0BsFLx55OJHfnvg+Nlkto8Y8Zg2ISShnhxKu1St11g8i9SYxfySxWF3WMj0VNHwxsWgTFY2l85vQI9s=@vger.kernel.org
X-Gm-Message-State: AFuF++nkxgzxsvmnv09rs1vcHpIJZmUCLaqeSTyQb9rAB4GCluvJSxYL
	B8OG7ycJW67s5WJ01kbJ+cOXQ8iPna88jVe39nW5x2VGwhTd8KzE/ZtkQWb82UFi2ELuaXmOKFK
	XCrvoaXMJ6Vpc9TyvnmLZe9MNYV9DvtZOr3rBBj50SU/28+S9XnNgWx7cQf+PmZlpjTk=
X-Gm-Gg: AYBFou2fTpphAiF1qAXAv8Tk2bb0wr2Kh9Ti4pgDl3fh3kN24fmOMJkEYZZLiBG/IiH
	dx3mSMi2dOkKU2brkAH5tlW6vXlOJu3TFAYjsjtELCB6QxFW5P/EKC7VbvBpjOKq0516KwZzuOp
	ZAallRfc3Hg3Lf1/nRPjGGy1suyd5aR4u59lDc7oo4mRNf6bNwLlu3O+JYlzFzGp2ynvBN5t90l
	M6qTWunAtPVwcdQiOkCw5pEPO/LSOKsIy4Td3rOOHg1kX7qG/DL7SWlGU9mr3yI2rZ8/Nx9zmSz
	2jo3h5CbHcUrHjO/FE8M0JP6TltauwAOQdS50NnNbvoLPuPxjU6Swf1CgEkK+FzbbHnFz7Vb11X
	VjZqqQ1qrfLPuIE2ggsnKavHJKp/E
X-Received: by 2002:a05:6300:6698:b0:3da:b089:dba0 with SMTP id adf61e73a8af0-3db404b87a1mr2970851637.1.1789369298174;
        Mon, 14 Sep 2026 00:01:38 -0700 (PDT)
X-Received: by 2002:a05:6300:6698:b0:3da:b089:dba0 with SMTP id adf61e73a8af0-3db404b87a1mr2970722637.1.1789369297623;
        Mon, 14 Sep 2026 00:01:37 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:37 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:54 +0530
Subject: [PATCH 22/31] arm64: dts: qcom: monaco: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2457;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=aLFrDhmumA6bdgDpKeoGcUNeQ/sPpRUO4qa49r+x2pE=;
 b=+/4IHXgpQTemZ996rJoLS03+/negzmdl+Gz0yiItbayNpcvREAymA5UUJnTdIwfgXjREhpwTd
 3LlpY9OSQIgB3DmoAvsr3KJTGqSe/DTtHsqIBtyi52UQgGgO4oEN6Bq
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXxzjZd2YnHtog
 91bdy3C1sC2jA0OkYwZWxEiFof4Acp2NEGv3cy4ZfShKZf4oIL2Esq0i5y3Csl8wcV32k/vCywW
 RDV9US+8I9KCVb9cynFX5coGTZpPqaa5g+7L+F+OHJ27Vvw8pN2+ZgELTZYvTjJ5i2wkAEevZ2L
 Qz6nD8ERtuIcyym+YoPIpRd9QByOFE1s0X6XDnuRnCJfHzr8lDnNUbPBYPQbmX5ThJJVE4Qnz2W
 DR7mRtEDlAicPI2xAfSdhiR2kQ0cHImysKQcwyXGbRJOGq1c2yocS0ms2HjDIccVUTcpxj3RNCj
 Rz+vh8EcPx4lsNT6h2kYiZkXBuPi2WyFoxL7nblBPPwd4B3UYU4dmjtl9EKBs6+iXc5+9/BKia6
 alZbt00GpMknKLHclMS4EpNq/Cg6QX1ck7uRFDcgDQjmY84oZ9PiNrTIuWOJyFSpo4sqBPt1UUf
 xwyT8G56g/Q9gNrehjw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa79bd3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yc1NNpEMZLjfPbhxpboA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: I90gRx3m5AcPK11ae_jUO_EcrHhyq0XL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX0ldVfjqctreH
 /T3caaD/5Z2ftjBZwJsQlbeG0qrK6EuodC2jizRjWg+HBMKXTHWacPmG2oCsangsM/9HLDF9HLd
 /xv3e5e1tEcg7ioVfW9KmrzKNPAc+ds=
X-Proofpoint-ORIG-GUID: I90gRx3m5AcPK11ae_jUO_EcrHhyq0XL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d36844..2b48b58b1bb1 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -309,7 +309,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <602>;
 				exit-latency-us = <961>;
@@ -319,7 +319,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <1061>;
@@ -331,6 +331,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			silver_cluster_sleep: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2552>;
 				exit-latency-us = <2848>;
@@ -339,14 +340,16 @@ silver_cluster_sleep: cluster-sleep-0 {
 
 			gold_cluster_sleep: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
 				min-residency-us = <6118>;
 			};
 
-			system_sleep: domain-sleep {
+			cluster_sleep_apss_rsc_pc: domain-sleep {
 				compatible = "domain-idle-state";
+				idle-state-name = "rsc-pc";
 				arm,psci-suspend-param = <0x42000144>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;
@@ -720,7 +723,7 @@ cluster_pd1: power-domain-cluster1 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&system_sleep>;
+			domain-idle-states = <&cluster_sleep_apss_rsc_pc>;
 		};
 	};
 

-- 
2.43.0

