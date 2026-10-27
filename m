Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106770;
	b=D0i1IIO/J1LN1QKAJ59Dhdmr8UEQgt70ZtH4K3F2YlDs/z+iUOpRNVPqAdfdE36IcQOz
	 VEBkNoAcj2i3B9iUF1/4I8iUU3nEItudiWLgPGdsPVs/Vy0ukOccxTeY8EA2RN48yfpGG
	 rswzIpU/gvBnqKUro5LgBckE5lDqFpZh5HOKVZu9u946o79toPHxLHOjd9EAWQEl8lVMH
	 HdVheWMCa5QSFCaYIcal692Kvd2Q2wBtbRx1Mk37Ocs4/FF6zOQhFrUCL0IhRrz2qDnzH
	 7XC1Qf9SVutQRKlAUT615BcIYarl3UVU2DJqEZF40ZZOqK1pN9n3g9yaFyJyoz0Eytw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
	b=P5FnN1GGFedDlfy7FbSx99Lr2wR+uEagPatrqYmB7m33FiejRWfaBC4eIwGwW+e1BX7r
	 CiMay01jljeuA4eRiakCioLSK3vbDHxeq587oZmM7SCryB/GWy/i2m0R5PcXbYgXo+vXr
	 E7fpbNTpD5DUbqT2db/P7dIGj9TmAn6weQH3dzOinhDNd+OASa/pSJtTb/6VQqiCmQpJs
	 kKwQT+m5uGJQ5eglx5aIJLMmzKYLmk0pHro+Zuzz9RDcbGlKvC/HaX9+AFQ+5B/H+tWT+
	 oFfOVJn8HaCIsOfHQB0rqgphrccfZ2qtOClHdAEDwncW4HKFbFPThFOlquxZW7Y7vxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQtkpOeW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RNbxUXaL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAC8606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DAC8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQtkpOeW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RNbxUXaL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdv461061021
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=; b=ZQtkpOeW6Rr7p5s9
	PabEUgicQCE3V5bKyMyuJXVsGGn5t+hMypxiiQM9LOFZlCLxQRFi+N+6yREudGS/
	t5QGn2tt/URhcve/GiK4yFHDEvGeuEG1P994xAPfXNg56quIEdKRDZbpJRrfgkrk
	jzuBfCBlnYILAN6RgkB1IAhN4ZyvOVEXaM6+eZm+J7c9qhIqlmXvW8zLG3srmJtQ
	pSa3003NwioWmUOGYz/0rhPScbSuV1Sy2vJNHL72A2ZygqNlgremXTy+beLDq5OM
	QYdNK8EMdZCqXxzJKiR4VEHKNcXDaNRlLfa/eN2Pe7Y3qMuvuvbuxGqXVoIF3Mc/
	6Fu8gg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9nt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:12:49 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b16b1b7aa5so45219887b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106769; x=1793711569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
        b=RNbxUXaLEJkK/dQ01HJZ3+Ng6YiRIqHTHLx3l2Ccs++Ax2jueuaAO9MBpH/K+hsXED
         YoFxe+PSLkTDL4HeZtnGphr+FUMClu/t47BIaMFxs0UVOfEI/GWCoCIgzhlvLQPf8tcf
         oBaoBX7gfKlN9x0sTZ5dV2nkoSyDgP+W/p5Kztb5gG31isoKPX2QU22YJPmyD3hJjLlo
         MJf0KeCwXFsS+I4zXR9IMhlttDI1r76z8zbPgMd82RgtSumu/+gThYPMik1K4QyxcHI/
         JgaNl+edLveypjJAqLA96Uo+lOmZuq0KTix45BRyvLXqFPfyTV51uXsjcjc6A/ciMZfT
         kSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106769; x=1793711569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
        b=FHwd+uaH5u39utGCIfL8PwfxodGU9uqcuhrNT0dc7OjGI/qoqFHYWvw+iAYRUG3fla
         PwtCAgExCB/O07CBSXEVehrwDQruGVfjlW9FQT2R0fk9RK9DwLbjbB+qB/phR5tq2AY9
         d557kz4dddZ2xjQW5pmUQJSW8Jfdiuwgrm5RTRGwg8Onowh0dm/gDQFh37eFpdKcQvHS
         LPQkzFeC0jp60Tvc9OnCmtNP6OZChcAqaQ4vh3Mv+U29SPXYHTkqizSUSknmSkrQiNiL
         TJElmznhqOA5uugku+UBm18pwTnjW3FGPnbQfLIE46WWjxE1X1mUXPToFUJgFNSwOfYl
         GBxg==
X-Forwarded-Encrypted: i=1; AKwUvBwtdO1SLxqXsQYeqAWO6yO6EbDMIjfNgC/FVgiT810kl/SnrZBRifkKv1jYtGlKMqawJMduF23oFYNITvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2YZusXyxgiyNaSWAP3P2XaDy522vvhVY+09O/bOY9/6NSKG/m
	N0ss0JtZ36i2UjnifTNAp5/bTcgYyZRlkRd0BPJKmwrBioO0fRntFtwSGHaGol7W3Vs9AnyjJtG
	jCzSG+V4f5KVdfbHmmbi2nz5bFD89bUKQYK+wYL/51SpqXec6sefeqMGfeNStXYE/28c=
X-Gm-Gg: AYBFou2MKHp7WAkj4C+D7s/Ml3S6zELCAMFNo79/rPeTiTc4ihgekkTZVkCI0L9XW1k
	NVb9RhqVAHwzOT2aCS21IvLsse0Xeg1U4uuZKQO5wl8y4k2FO+8MWLAxA1sCR/toxel81ZPv9L0
	vxFZi8pJzNPQTlZ/JDTDAKX8QihpEIE3HepNF8mBqVmOa6dqDx4Hp1mRnbaZfUWZorridEIMdmS
	Yt0Nyl+maxoSNt9YbE7lyeO/MQKxv8/7PXja1HoFHynGDKQrgGF3pp2Vgvpce4WYgiq3tvb2QTc
	2bNefWN2GIHX34kLSh1/z6h/RcLewRssz8Gjyid7RRC42rXttJjCvTae4zSKjhri/xN7OdfbvcQ
	mBmxQTaZCgwY0/6o+ylJItN79vteV
X-Received: by 2002:a05:690c:e3ea:b0:8b0:a8cf:f424 with SMTP id 00721157ae682-8b166c2e9a4mr82725797b3.41.1793106768482;
        Tue, 27 Oct 2026 06:12:48 -0700 (PDT)
X-Received: by 2002:a05:690c:e3ea:b0:8b0:a8cf:f424 with SMTP id 00721157ae682-8b166c2e9a4mr82725537b3.41.1793106767943;
        Tue, 27 Oct 2026 06:12:47 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5ea7b9sm10743547b3.32.2026.10.27.06.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:12:47 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:41:10 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: shikra: Add CPU idle states
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
Message-Id: <20261027-b4-shikra_lpm_addition-v3-2-424abcdcf824@oss.qualcomm.com>
References: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
In-Reply-To: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793106749; l=4971;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=ZnLGNV9oQobHeXgDfZngn36a5StIkhMbOX9ZnhpmU10=;
 b=XU+jcypzv9RuT0psWnM/ZKwJr563SNpvvhU4OYtE+INNFKYelQt+/uWw9MwD4F0tQX1wx+z4w
 8mfkJIwQqBHA7Y9FoVhjroZa/36QvG2EgNzUqJ59AlvjN+8+QMKH/MG
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0a351 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oZC7bev9MFt5y4JAElUA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: He9Lil6v9ci1jTkTGOHcKirbXA5CUmlJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfXxrOqL8AMG60a
 7u2DP8Hq7OjKm7DKMQbF86gzWLylc1Qj8vTFsNqz+qlCDA6eIA39C2eufqDE9xEITXaHip+h7Cq
 lzaNBxgCjucRehdjpyKRRL52P0o/hIo=
X-Proofpoint-ORIG-GUID: He9Lil6v9ci1jTkTGOHcKirbXA5CUmlJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfXz50W6nnyQXKB
 +pmm7/BUQBvV6HOIv5mo9lbMZwXBJP0/cODVbJ9T0RpQckQJWSY3iBhSZUXf+rvAb9jMbfTSdXa
 jyBA3WGBr+Ah2pl+Jmr5qtg/v817t7Ctx6v5adOaxn1bAZfkGd9p4XlYzmlB3yZjwhStg3OpHup
 9oDZ5D2NxVFepDmMzX3krzhhtXP8nizBcofAxgnhJ093x7YT8ixxevZpWaKEfThu+gRJ4cUtdoE
 /9bzvkA+0YML8EuYCp5FR3IzkzvcVmNWBVgZ28tZKKO3WiR8Ecy1i8390JRrGvEgGe9/6lD3FIS
 VCMTRcZUH0eH2kjj6vhL60cUf1Lvs52qU9vK8obtw6agGtrkbq+JfaLfBQwmbBnjA8sKreqDbSi
 HiYLDLgw5HolSFMcQI1a1ZKUFB8f+aTVgj5jt46sd02UqVUuf0Tz0nNR0j4Azmtpz2fwW4Tpv/B
 vSvpfjGmFKHGpG2RzPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270052

Add idle states for the CPUs as well as the whole cluster. This enables
deeper-than-WFI cpuidle.

Remove #power-domain-cells from MPM device so that the driver follows the
cpu_pm notifications path to handle RPM notification. This avoids other
probe dependencies that arise due to MPM being a power domain provider.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 93 +++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..74be82ae50d16c7dcc7bc7af4deb28794efd47e8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -40,6 +40,8 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -50,6 +52,8 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -60,6 +64,8 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -70,6 +76,8 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
@@ -105,6 +113,61 @@ core0 {
 			};
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <915>;
+				min-residency-us = <4001>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <526>;
+				exit-latency-us = <1854>;
+				min-residency-us = <5555>;
+				local-timer-stop;
+			};
+		};
+
+		domain_idle_states: domain-idle-states {
+			cluster_sleep_apss_off: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cluster-power-down";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <2752>;
+				exit-latency-us = <3038>;
+				min-residency-us = <6118>;
+			};
+		};
+
 		l3: l3-cache {
 			compatible = "cache";
 			cache-level = <3>;
@@ -144,6 +207,35 @@ pmu-a78c {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>, <&big_cpu_sleep_1>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_apss_off>;
+		};
 	};
 
 	rpm: remoteproc {
@@ -217,7 +309,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1

