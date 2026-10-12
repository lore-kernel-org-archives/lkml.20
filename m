Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A80442FCD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789813; cv=none; b=USDcvXY4MEBT4Oz9r/O6kEgmigkZ3WL7UumxD/D4BOLsRd5Dw1yRQpbWiUHqFwIxf/7hotP1tTydAIFnHRmYLEPAy9iDN4eXtEdHANKMPLx11lWKY2ImHgY3L5NU5nhmYh8dBblUtyQr04l4oiULepwTwZd9pGCQ7RVRn7k9XVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789813; c=relaxed/simple;
	bh=DcvFcGV/3JaFCs4OBqUsVk6AV6BrnTuD7duM/24Np24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFCl4MkGvVP9g5p53WUVMXk6slYY2xkw0KFIUgIs7HZ6WYnHotHz057lGAScrCL/As0k27Gyi64fMvy1U+ihuDk8oVAOyXsnlDrUglZ1E0iw9+9w0YEZ3+I5c2ZKEcP4X4uIbDJiqv7FUwGY9FSV9tJc6ABsY50mn5F3zNN8mQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVOwJn+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnJYjNIC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVOwJn+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnJYjNIC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55keL1856960
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xItEDcgU6Hazp4g6PGqe8cnvisbwpOTtZpc7TG93B1g=; b=GVOwJn+r87iC4Gxi
	hZ0F1Ng6N/gSn0d/l7996zg9jKBSHwdhIxC9Xu9MVgmpQaYiKVLkdz9JQp4mCS6+
	YsSVIMc6LphX5uDq2di8GRQeTfBkGKGhQd+Prx+lCpv+ObsZ/04okBEy664fS27z
	cqgzZ/AKTzwN/ox+qzDufw1NhFgoS2lWwfxg+Ewqa0R59B/M3SCwd9f7k1GGfHHt
	SXGYilNFw9wWSSiP8zG2djMv0YGxs9D2DrDkIbkpK1hxOUqynsN8VXsJoQ/UDiL4
	sCTDS2vZcNbOnYXU4/xm04uywxubtU4goRvAcYxE+cG9CZNZnI4FnsjzN5P3iN6l
	HVGRQw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxnf8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:30 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14fed306427so7397183c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789809; x=1792394609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xItEDcgU6Hazp4g6PGqe8cnvisbwpOTtZpc7TG93B1g=;
        b=hnJYjNICxrF5jjEYCNYajWrGz5pSqv8iJ6nK9CR/+l4czKcWUoUVO0T4Imr4hGZyW2
         md5C/+qT9oXKv/zmqqrk6mjof0xrKk5tc24CSL25ND67Ok9ffNMu6mUtv5IHuy00/wIa
         ijNbOjKVrpM3utOOUm+m3DFjiOTz5sXDO4fZ+C0kkXUZaekD4smKPfAv3NnP2oWf9AEA
         IyI7g0NWx3cOoC16fZvRXcwdWdsR0axeN6G2t/jOjh9sq4ae/5YoIImBDVgyvv6AIsd+
         aoabEl6yg22mcMQBBXSO67R5v9Ygqf9CCMWv9RHRHyo3mbJ7aoQdPbJnTtcUz5+B5tw4
         QflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789809; x=1792394609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xItEDcgU6Hazp4g6PGqe8cnvisbwpOTtZpc7TG93B1g=;
        b=SZYrLExR1EUeYk0hYU8+XGUdDj7pcJN8jIm0KnWqtUVbxkux+sks0zUK8w8kgLAXLf
         sSiAaktxtXOJSa7eSQeg2Kw0/8z7AjTTehswmOzXHC0JfqNV4J86W/Qi/xYXmPwJ4gbI
         g33mhHRwvs6vGAEJ4nLsvXWkkaCTp0rhQ8kMrePa7Sp+EHhenKK+OXt/jSR/O8iyzQ+F
         ul/scmxo3BvqmHjGIWG2lP0eQUXZKojVLE9duDzKxJWFGkLEHO6Awb1mTMauLWJo/fle
         t9nJD6XZp3k2/qrRESNqZcQ/ctZ22gasxwMVlv6lemTlqAZDnUdioGW8zr142xK/pKRS
         EtYg==
X-Forwarded-Encrypted: i=1; AKwUvBw+mk9myvRORShuKgmtKsNbD5BILP0MU6hdfD0alXIHI3NJG3EB/iIsi+fu85KMN9ZDat26z8shCLcxuUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvXrq62U9cOdLOrMSbk1KYR29M9a6wfzgIjS7sG27pEOCKk6JL
	Ro7g0YWvlCVD1QTIDPJklcJA/T7cbcpower2RmjXaBlpRM+mP+Z3NupcKtmMKZPw5tD9UVraClE
	5sBYY39Pis/qIReamWFKUP9MO2sHWa89A7JfUQ+2EbCijxWheV9Q7K/JWIVbmGWCO2AU=
X-Gm-Gg: AYBFou2nciG1LUCnuBFfTH51vvVQt3YiElCVd0cHFbGidF5BvMkoyYn1W4UZ3WW1Tzt
	DNhuNyGMnnA4wcDZ2EFWyPj4gAzG8bHvh1EAFcQexR106gyLskBpWGuXsEaKDY7xCAN+0DWT1cO
	4jEsLH7dNc5yVXVaHFKufD/AF6ZNs8D2QM04IQN5IAvp4eeIdzncsXAdH06un6KxC1ihd6ysEdM
	oZTqoCztXR0uVFovYs74QBthvt3yAwoD715ckw8RT+eSjMcN3zLcf/+dd1tMnBrZ9eVGbBDt2kX
	xbYTMkDJDmJ91/4/2lvY2eM732MEJdrnSWNSKi8Bc2SMmbuQXtAfhx+jz7jBbvVkptYUWxo3XRF
	//ho7VD/V1q3RoEoEQE4AGJYmOqk+vOPQihw3WAUC49a6Jm3z9MWplKcc54yKZteXX0/gNXl7W5
	3R5e8VzByYpuK59srXlu0Sy3tPI2vZ
X-Received: by 2002:a05:701b:230c:b0:14c:be8e:69fe with SMTP id a92af1059eb24-16a57922026mr12584380c88.5.1791789809283;
        Mon, 12 Oct 2026 00:23:29 -0700 (PDT)
X-Received: by 2002:a05:701b:230c:b0:14c:be8e:69fe with SMTP id a92af1059eb24-16a57922026mr12584355c88.5.1791789808711;
        Mon, 12 Oct 2026 00:23:28 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:28 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:05 +0530
Subject: [PATCH v7 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-5-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Y8xj-OtVbcfKi2dIwrbq-2AmOH_psHJl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX3hr+or0UVDUk
 IuIT779bo/2EsAozktVl2qcKEcluGG7rdB7HwR2vsQ7wFpg0dcAFk1kMI4FT9lfaVIlgFrzJau4
 RCFS4NRTqPzjP8exO6jyVgKJbQ3GcXg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX9Z4ivDluI2Ym
 v9+CSuGM/rt3pk/Dr/fnNhAJxxWqthXU2zY2er4yO8eTI0jWEkHnHP/z1fnjOnEo55imvXTVuu+
 fV0AHxMBRcinGo6/duGfRK2IqhPlGvShkH+pSq6Ux01RthpE4SIUR4yk7we8wHvB5ZRkXCdju3n
 2xV+7t6Zb0AK+TtGIHFDLdLf+jNUsV9PEtUzf/CfFmtaIeI7BPlIN2VTWdcR6t5+GP343zMU4Re
 k7gIFqRBt6d3xn7D3UMMrZZ1nKVOltOIGsbDSqKXLXcIAkR4hMUt/uFO8mWVQBIE4f1BArM0DCt
 Rxf8eeq6vI9Rb6BBPLw8FWZX0NjYzI69kuqnUYIwdl8wWWhDUO6QWJvF9b+jfGopnuOxAhu+WRJ
 oxHiyqKcvTBthQzkglJphYg1VNCV2FDnsx1B0OySeicj74mg986JzA7HTt40qI2WlkxRkVZmLYX
 jRL6J4eYO8gMxWiC3hw==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acc8af2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LX2C00z4I0v6K8_64uwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: Y8xj-OtVbcfKi2dIwrbq-2AmOH_psHJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
all CPU nodes.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 0c03295f61b0..d28d68a10958 100644
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
+			cpu_sleep_0: cpu-sleep-c3 { /* C3 */
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

