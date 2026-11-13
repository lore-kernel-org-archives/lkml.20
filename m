Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559496;
	b=RbxebMG7O0ESsJHH7BndhjhJ+z681X4DgDQtqgvktm0YS+WGwdyMEChhfZGrbBm+0qGW
	 A30laO7nany598wEcWWwJ/gHDvPXIv56XA/UKRWTRm9ENnCxXFMAM8cON7iabSbT34EBN
	 XDGPkdTI1nlIJyObBz57mp0ef2uiQlHVAMOdah0D2jtPjOlPPOntkHZd/KtjYbf3HzKQm
	 C63ycmnytSn3xyk7TbuTfYqvzWqGT65V4PJUzZwgMNZi4CzVfCOJNF8J3jXmnrCg5Ksmt
	 5T1DP4u+WkH7qbl0gsdz5Ut1q9l0IGUrFo4QsdfII/zqDjTNunJQVzCsKKoxrTDqmEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qAqr0y0c3ANATn/bhBe6uVlQ1yjBVTFNuYpOZthfFyE=;
	b=4C7vH5ySymjG68gCybaLNKrMmUIFawW5hHwequzF0bZPGlUuEJ4BdorSU+0Na+pTUAb1
	 eh8LZd6lOR4ae+Kv6faVy3B2D89YmBVAw/JyAwNja71KHOwfnOen2GIKWogcHFJqq9CwA
	 JXzHL8lM5WSS4ztxvuHltM0Z30O6cQeZct3sByIA1+xWaElWepW2jV+8XZCv9R3JD8Z9e
	 0Sqp5iA8pUR3yWCq/oeENMP57oA1BBtE35NSSXyCF9lSWwRyW8LeqlG+b9mYkdZJHVrBI
	 /NkhJNP7yY0OOiSQCaqQ6nXXa6Z5crhe0+W4mzEeffq55uJjWU7yQsmkVCYNOJ637mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjlG20A+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hD3uiBlE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24B660A380C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B24B660A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjlG20A+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hD3uiBlE
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V808619210
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qAqr0y0c3ANATn/bhBe6uVlQ1yjBVTFNuYpOZthfFyE=; b=UjlG20A+H4dhVO+R
	Uc5ldBRge/eh2a5re0i7cVdw0AyV86Ef7wD4BeBJHnowM1vgCG5rigqRjVmn5dW7
	TOa2CwdDdD2N3kJGgLpeOv12n26HpwAhKIDHqZTAtwQw+2XBlAkWjhS8ZAmKyee0
	K2MSGlC2/Ocug+W/BgHkxtxfoVaNe+k+aKAWmmS/oDIm+lDgreHTwMvKxL2V6yHX
	zy/hAH+k+BT3AZQYu5tnwis5XdkIA4ffECcRZms3F2s9jP7HsCK/p/ABZwTcpGUA
	8/Uupk2LDMv4ieYyBPa+XzHJ+5SYnotZRrAOiy+nq0k3IcByWryf66knaUUJrkGO
	eSqAFw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs048w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso3309775eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559493; x=1795164293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAqr0y0c3ANATn/bhBe6uVlQ1yjBVTFNuYpOZthfFyE=;
        b=hD3uiBlENyAvxPUPrfuQgWnTnTQdOtYzhEs75uOg78fiBrC6H5ff1LTTKvvlStRl4H
         W6E8HD5mvbNMjBGDHXA1O7KTfyvUFDHB4y1bRO7Y6Ok96frHgyS2DMmH/s1Pmy6JZSNG
         6TVLwYx86uqmdRPLelXKI6j1iotgYt0refg8Q91Yex/iI5HmZJtsBhRb3+inWWSdovYG
         7HD4zm9E34ZzGMxxpfSLVE7aipeyiqFIGVX9soYXWCBMIc5DPO62f6YFYvcEgUukCOgp
         pz3JfjvIzSFnCMdUZXZ8XBkxuGsFv8vkrgXENGkEsca4uJ8kX6W6tAVzLmrHcYjFOGbl
         qSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559493; x=1795164293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAqr0y0c3ANATn/bhBe6uVlQ1yjBVTFNuYpOZthfFyE=;
        b=AdvyNukesAP0swjYi39ThEa7DQU+9WuZT1xjLt2xbbiDQTMji5n7VA0nWYgyz6xARN
         8Rv0DxK8MykEhMekPeMljIixltmAhE+bVHlwTWMB6X5MMbZomzGDhVOt0MhduKJnzMly
         lWOkLjEQXP4cv5/b8a5XUyCPETALcK5LTUzfigX7+4XjdhUr5F34JrEwj+pbdMDExhdT
         8dINFPGIIhYfoE44sA9d0K8huhQ3Qvp0kcKW2TToE2vAhG1H5sSGDSDZOla+/WEQLnlt
         Q7TWDruekPNbt7MDgORe8jlk/AHecZxRVtSsrqNeh/MI88WPe0sQ4i2W1VMbAW5bD36I
         795A==
X-Forwarded-Encrypted: i=1; AL+hErEfse35kDhNrYVMl/iLGYlgw/P5GuUCYMlmsRJlHXGdWINgYfWqvdAObbslBLEIqQAecUenMn18UBpaN2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EzDowH/o1GrqwNVurk0Z9iuGEaRoIIwAOdnsm0xoWoQPq6L56
	IWlXTMK9o4edpA32VPvx1rtMPslnJmGmoJA3vxxl5Gei9ws4Pew8ueDyJv4+TCbAG7EwcUwfNhB
	RGul5XEc3y7Tp0S6Hy3rFGbHOEJOMCmsbbyhhUvbbeLC5WUYHoAq0q0QfhYnEP7qc/g8=
X-Gm-Gg: AYBFou0wdAU+IObV1j9DP5VH1/fcXWXz2n4i/3Fn+usc3EDncbkaumLXQkvYKo6YW7Q
	aKRXPliYXhCS3wbbwqSV9stFve5Anw3Zpizi65sOufPZQtsgpu/urBMaIbQWH6So+KoMRSBUvy6
	VWYKw5FWuKnELQR6lOWFyWC8UniD+44OSAa8s5zWT8YKHTC4GnNbO19IO7FtwCMEv5lqL75zXHn
	2aJHNbOALY25GZNvUFd9OsbHYcLFN1qF+9QMTnK50M8u2OGTXW/6987y7bV7+xFJOy4MFclbM/A
	GZZThquvK7WnYApUyJcY1mifmt+lvbOVpqECEfAUi/wV0ZnMbL+E4R+eoPTnRsCTj3iFcooeDnf
	zj3hRaPB/TYCWDuKcy1z5VONBKHMqZnmsiT7cc77ZcWXk3sOBKWH1iph0PtGCgXfZzRa/k8o2YE
	AFT40=
X-Received: by 2002:a05:7300:c7c3:b0:376:972f:afa9 with SMTP id 5a478bee46e88-37966387a09mr1646215eec.9.1794559493271;
        Fri, 13 Nov 2026 00:44:53 -0800 (PST)
X-Received: by 2002:a05:7300:c7c3:b0:376:972f:afa9 with SMTP id 5a478bee46e88-37966387a09mr1646188eec.9.1794559492485;
        Fri, 13 Nov 2026 00:44:52 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:52 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:13:48 +0530
Subject: [PATCH v3 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
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
Message-Id: <20261113-thermal_bin-v3-5-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
In-Reply-To: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=6059;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=el2uGrzjfzzcr0/E7ywUdoy8ioWHrdz1v5pBik7reFk=;
 b=J+OOTjtl5hfULeACGvJNuVOUjQzTj+1UZ/UcpG9FG5Jz7+wEC9Mb5ILgzp6QYEbYJ7L9J223N
 aGfSOSxA1dCATYNGI13oipI6FVpvnHivYaV9eiAyH0VNeaGuVpXEkuJ
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX9H/W2UBnZrCY
 41O+ay5SXMPRdT+zDT6dfF6isA8X1lIpHGdmDOc8FMzwSLXQCCBYH6imCDG0R44VeJ5ZY7c/AXA
 UO3hSC6tKF1ZcUcZqNR/l+VgCASLL6QkbOfHAHReT9EbAXWLlnB7itpiH7tb4hSSpnAIaLftdoS
 VFdEj4mAG/caQQvq8lkmj9SOycBKgSU7Cme6vcVAYe6dnj56f1Vm+LLXMNbDI1Ah2qKTPtSbteb
 LUJ3+iefuKrMfAmn4m/31wziHafyVEZZi8s7lCMv/JlLHqihvQyYFe9BEPtcSgPbWRV4+a3TJI2
 xpE+tzrJuDQwDb8ze4NdAIDAfzbElj/8XJyHqf7XbgXXJjqfu0xY3pnMW/88gS/7ID+nXBTF9B2
 eTfG5SFFGmJvAu1UC4+U8yntBrVzzA63hgJRxr2/HV53Zki+yySpax6EaMljKD6Idknbx+lLAiF
 YwxvC2phBIz1i2DVEEg==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6ce06 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PCFpqnHMHODqJTmB6Q0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX7hVafE2rxGet
 0iPcH3D+3d2uGWT9e+V3RHS38NG/soqyqez7f3GBd2Hx/d06URrj5O7lOZnVxDEixTK6pVYfmrw
 S92ZhMjbA0akByp8FbfTFeZjckW/Vts=
X-Proofpoint-GUID: thZBExBfU_9ieqt0tdKIjjtp4eziPSfn
X-Proofpoint-ORIG-GUID: thZBExBfU_9ieqt0tdKIjjtp4eziPSfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

kodiak-based SoCs are binned at manufacturing time, with the bin
computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
now reads these and feeds the resulting bin to the thermal core, which
selects per-bin trip temperatures.

Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
the passive mitigation trip points from a fixed 95C to per-bin values
(95C for bin 0x1, 105C for bin 0x2) using the new
temperature-bin/thermal-hw-bin properties.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 58 +++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed6..79553bf43a7a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1028,6 +1028,18 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
 				reg = <0x1e9 0x2>;
 				bits = <5 8>;
 			};
+
+			jtag_id: jtag-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 20 bits at offset 0 */
+				bits = <0 20>;
+			};
+
+			feat_id: feat-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 8 bits at offset 20 */
+				bits = <20 8>;
+			};
 		};
 
 		sdhc_1: mmc@7c4000 {
@@ -5810,6 +5822,8 @@ tsens0: thermal-sensor@c263000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 				<0 0x0c222000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <15>;
 			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
@@ -5821,6 +5835,8 @@ tsens1: thermal-sensor@c265000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 				<0 0x0c223000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <12>;
 			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
@@ -7164,7 +7180,8 @@ cpu0_alert0: trip-point0 {
 				};
 
 				cpu0_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7207,7 +7224,8 @@ cpu1_alert0: trip-point0 {
 				};
 
 				cpu1_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7250,7 +7268,8 @@ cpu2_alert0: trip-point0 {
 				};
 
 				cpu2_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7293,7 +7312,8 @@ cpu3_alert0: trip-point0 {
 				};
 
 				cpu3_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7336,7 +7356,8 @@ cpu4_alert0: trip-point0 {
 				};
 
 				cpu4_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7379,7 +7400,8 @@ cpu5_alert0: trip-point0 {
 				};
 
 				cpu5_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7422,7 +7444,8 @@ cpu6_alert0: trip-point0 {
 				};
 
 				cpu6_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7465,7 +7488,8 @@ cpu7_alert0: trip-point0 {
 				};
 
 				cpu7_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7508,7 +7532,8 @@ cpu8_alert0: trip-point0 {
 				};
 
 				cpu8_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7551,7 +7576,8 @@ cpu9_alert0: trip-point0 {
 				};
 
 				cpu9_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7594,7 +7620,8 @@ cpu10_alert0: trip-point0 {
 				};
 
 				cpu10_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7637,7 +7664,8 @@ cpu11_alert0: trip-point0 {
 				};
 
 				cpu11_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7752,7 +7780,8 @@ gpuss0-thermal {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7779,7 +7808,8 @@ gpuss1-thermal {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};

-- 
2.34.1

