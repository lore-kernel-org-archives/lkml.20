Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956892;
	b=Ce2eRMiBlrFqCRB5W+Oy35L97ZRV6VZmQJo4El5FJqYLr8Kw2/E4o4eot+k4oM2Og6ra
	 CTk1kbJ6W//Wt8T1Zo8Pnd1sXtwLb1ihF1mWWGoTx0xetZvcSN6mt+hKgZHpGVBoLYKy1
	 luZxiZTCiTMllU2c07fCoT4RQEh2ftLEPOwWkx7ZrlZRD3vsFMx+WAaGBShYMZvV0aHti
	 HOHIW2WoRQhyC1lTypLVy9jvyJpMFl+rZHR3sEp6I1PvABTqTEcNBPthzO6nt0wbOjRVH
	 jhlHwICGpKwHp95woTO9yxf23+hX+yIc3KYdVbblM/U+3QX98NeuHgCdgjxkOXFwxuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=;
	b=JcqFJCmGqp+5qfr8/40haMH9tiCCWZu6Q9OBdQbgAJafvIiiKbDrmUlRsXERVkz+a38O
	 K+K9AHgcRHdQp4Dj9QNgCe3I2+aSXrTZe+paCvpkl//YHZwEpVU44Z5diUjjpOITQ8sCh
	 1cYGj1jIx3hoWSYgfqEnU+LpwzalbhI3Jl1Ta0zey+17IuO2i2yaDtEGz0D838sqEcj1G
	 f/p2AWvocL/py/9PabhjLR2ueDsMjTcAvwtBWf9rpNKMJPu1ZpAc1ZasDB0zzicwIOpaJ
	 9abgsoH4dJHPPh/k63OX8ZxsLl/R7RADsmsnbTlZJkyLem7mzN0mF0pEGB1wCIwoJMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SwuUv5yk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE0SiNMG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0797606D80A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0797606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SwuUv5yk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE0SiNMG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RKQk1679586
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=; b=SwuUv5ykMMMlZMjy
	ydJlVb02szNBtZaEnxgImAGT74GgneXkq+HNRuow+LRIytTT76CwuzCvipHlWxZh
	qxxO9qfm9LVm9MC/jn6Nii4fwRtOUeUvjjQxKA8KZ0lFGPwedeIK1MM+RJvzAlFN
	NDNOvNFDEu9YTSaFpkvxkBGU6aQL/NUtUrgTwA9+Yf4wzUz4nCApqHftQefHG4v0
	AK1zCbyhlTs+l9p+Tr7tQBErR47fXCybAT4kZqX6no3vMGEvbk936SEHbfT81Usl
	NAhMgX1MC+16zxhM24Z0RjqiWM29KlhPYvmgLcHGfsh49N8gqbnpyN+jnmpv0KGB
	QFOUDQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pca2ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1004390eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956891; x=1794561691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=;
        b=kE0SiNMGN8/u+6FAL2pXtOSIkD2TqxfxNAeLXXqcc4CViKss/gJaB87fp70FtF9OqH
         4B1zZ6JzznI3mC+HttieLDi98lo+pyRc82AQJ3UBvItp2rk6eritG89r1eB/wNWANHXr
         +xPjp6HhWPYoNQJ2LVk4wDY6tUaPfifz/YDyyBz20y20eXSPzN1y0e/d3IiTVjsXVCrW
         ZhD6tgCYlIZ3MUBaNqV+crHqVMTjyxq7BPYgf4Vsmr08bTnb18bN3HrXAc2WDAW18My6
         jA9oVqcxmxRt1hyhFS3eOKc+zuu7vPpZ5x3zdMvsVEIk8JipDCTi5rqCkNw53/3P4Zg5
         DMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956891; x=1794561691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=;
        b=OF0FyJy+ufxhvJvjmHf9sYaRvdoKBByPdH4YLc3rh8/gup4Cx+se6T9ryohtb6CFdu
         drHdjJFAt4DQf313lk+uzKhUiKFSx/wwhNHlqPxm6clyec4sESYUlByuS2fbXxtGeE56
         G6NqMXw2KBtzHO27+bIwrZhQ8f9G0nge69ta+R277cfwzYB3mmtMX2FQbtGp1QYgtp7h
         Rly2DtudAFhOQ0mHf8E/BCqfb5T1ns28pRFVh9sZxAv/kI4b6iYXBEulG14CUo+Qtozm
         UYi8CLMOl1E05A9LYj8NHYSjcatI+mNnpxORQEvu/KM2k4JdaDvKwEWZcaEwmqHA0xue
         mJdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7bo2jjMirSeJyAQ6GWLtU2HqTJjTHxs1sSg1FA33o774BK/A5Q5ygQbdlu9cJhQlhcSQBVK2evI7CxxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w1bdB5pZuKz09AYp6BIxqbvtDFw0pshx3o+CYG32mwuNxD+Oa
	mCAXC4ak3hsBItevvwlYtJhOoSnnUsJp86Me88XJiqe34BjGAooKfGhw7eAJBSJ5MM6paRJa0u9
	76dpqet1vtQLRdG/X8Rmg2YguYS2paU4BJOesRLLEp5knzt7xLkRKZjrOIjb0Zc0QK3I=
X-Gm-Gg: AYBFou1gZcuzCT9JeXJv/lfXgai2lL10dJI1u8DwIy4cHCfn9UU4lmu/3ATCVkeQGyq
	mAy+nu9xVeloz3SvV7y5lP5TyveeuPJq0UKpPxT/XgmPletB1QR7t3KUDgcCbRys6NbHoAS1Hp+
	AjaaUrngso3C0nzhYUPE7wtVvylD+6ZLqjpY4G3ml8t2alfa+Kq44c9OcBbTskMnJi39W1MwtUT
	tglQCpLT5Tyc+G/nSMMIhAMNsYp42U5YLBwBT1hcQ1Gz4ewDvNTTZtSuufbmo/xsQUBNws2Eppi
	INMM0b/sU0NBiJ11/X3OHgi9k9hizm6tAMKbORDIB6+40EVlBFN2UmlMHOpnrPGFLEVaKVDfoON
	Ss+EMbcMRGQQg+vC6CHB/YaoPMIpQq2Lt1YhQ2kq3srUsPZ9JbX7fyc/+XrGld4zxogg9yXjm63
	Etwbq4bjFEPgFXiMEk1AOjzI+Rar7exdctWwRwN0l5SQ6hKkSwYHih9tIsDd8yuNXO/GCekJ8oQ
	aTEnw==
X-Received: by 2002:a05:7301:4d04:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36f764286e1mr2526676eec.26.1793956890534;
        Fri, 06 Nov 2026 01:21:30 -0800 (PST)
X-Received: by 2002:a05:7301:4d04:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36f764286e1mr2526649eec.26.1793956890009;
        Fri, 06 Nov 2026 01:21:30 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:29 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:54 +0530
Subject: [PATCH v8 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
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
Message-Id: <20261106-08-dts-v8-5-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: kkWRgdX4aTxdO-jllcXQfMIU3JGJxWPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX0f5mU6r60wZ3
 4CG3bYr+6XyJWA97COq4V7KVwURw+cM+vu0OcLP6OaWFjbp9CrkK/mMbJ5KiBBUtbtTXBrztXro
 Iet/aam7vwtDfWTQToXd6POVxmfeJxO1jjKp0C6tXAoYFMaNj5jZLeSmfodKF16WPyXzpRu/shK
 mu8t/HjIUSuLsl6Ep9vbb+dIw6TWX8Ut0NAEOR4M0RnXVBhd74i5v8HCNvkce45JIKuZpHA3tNN
 Es+eB8/GL6ekJ7JMh/b1URudc7tSiJEFpnMKDyZ/Tyz32WsjpDlICEVnjJTnErM2WiJehvmTpJ3
 ECP7dL/OgbhRmC36X94j6jYImHWpdsfEP8uQO7+COqgxSYb1dTxXrp88z5LWmjN3wX7+bAVIIrE
 p0K9japXDoieTIm4YLq5UOLSWi0/IS4lObtjG/sq/i99cccAeXpcoRrtIj9kHYHn/1KZsypCVro
 xbLj5ow4/mQh7NQr+jA==
X-Proofpoint-GUID: kkWRgdX4aTxdO-jllcXQfMIU3JGJxWPh
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed9c1b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LX2C00z4I0v6K8_64uwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXxdmfdm3l4ndm
 rwU+HwZy18uvroBCwokQWsOjoSMfTQ9X6PfyxJHQASve8AeEQCkCg/Hoiu/tq4fef3X2kJuLWtw
 JTgHcVaHiL0LQFrPdSkibsNR8s+QMGw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
all CPU nodes.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 81af32af4047..6dfc89903d2f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -36,6 +36,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -47,6 +48,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -58,6 +60,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -69,6 +72,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -80,6 +84,20 @@ l2_0: l2-cache {
 			cache-level = <2>;
 			cache-unified;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <181>;
+				exit-latency-us = <149>;
+				min-residency-us = <703>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {

-- 
2.34.1

