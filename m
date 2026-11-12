Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458207;
	b=KVXFEm5hZOlONxRPi8fP+kfiTmKnKqV5v6h1pmPdaVKD8NWHjCJD1tJUvGyqKhwAQIR0
	 PvHRVA6H5HbW0NeuGaZgJissOOJm3FIGcCwZNzjYrOckLymou+lByf+vjU26eKRsyApGQ
	 jqPyGqKfTTPCwlD36kXM4mnmgFsjisbzxCjdrx2WlUtfkcG6XdR8bKhTCpB1xVDilVsKu
	 YGzk4nHwYIteGYDKr1vWgsrWLiO8O35+4b1+EWcbVJGAYlqpAeo+oFoveP2u/jJKjp54i
	 MYktuRvx+ZvvW3svrrbiwT2qtCH+R9aihHNPXsIfleiKxW+Yof6fQYc0a5N5OMBBH3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=;
	b=cVleUCsBMrCn9nZlehvRJLXsjm4N21fi6OhHwyhqrGHPlOsoyiHZA+bi7PuYpXbqSFjN
	 mZsJMpNuv3W9AcwU9cswJ1Y6LRMO3GgGftOixHFADmG695+I+1r1Jyv9iFl7ORryZe747
	 fpFgeZ0hCCQ8/Be649Lk9ioFlG84zDxRmOtWBm305MF4vM+nQLwcDIpvFhiZndE7N+yzw
	 EGOBU1kUEDjHwLuttVP/JTkmW23unGx4cHvM/eMItgXqs9rfVKrT5+MM36ztOcYo67jiz
	 6l2248ahLVs7cjJXN1ZPdAuQGxJDDYLoemL7JVR+EZ7EJBZRp/0rAPG+firejvqDuRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=haHgWDJk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BN1Qa/tU";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81172606E937
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81172606E937
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=haHgWDJk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BN1Qa/tU
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZcPc4149412
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=; b=haHgWDJkNWeyovMM
	x1+9bm/akHpzvlMlvandBQuEx8aj1bJk2RvGjgFv6Rq2mY870NSyozeqW/PCgJtp
	FTnNuVL2gu2kI9njYXhaAPZCQfHtQHiMkiQcuXYn4uRCXO50Wyq8KVgc+/Hmw1il
	Bij++h46yEN3YQU/n58kafaU1riqrcP2zLnNOWLFwREQFfh91pR9LwpB6bOXxbed
	7sHW2cMcdPobiM2nqBahH/fqg5AFXRS0jPF2ZbACelw7exTFFyxDDV0/iOAQKfmS
	Vj03jP/VKYCThI/G3zmHnPrF2bfpp7HEsNibBoGpOA9lSdt2rS0aFu0CtsJ59tr0
	4I7fGQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc61pry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7247582eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458205; x=1795063005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=;
        b=BN1Qa/tUDs2BDng0YxE7K7/RQXlA6iETsoIFDO2/jGOfLc8WNk1IKT8V4OL6jva1Dh
         3dxj7uJosAHfjh72PIoWj+fDp2H/CT6g5a8aJGXzE7bKjX3Z1lEvVY27WRF83lkavrX2
         hf/1LTawZioQNkhDe1saht5aF/Od0dp/OLKnuEWefx0oIS82qnpl0n2lrt7SVHNA9J2J
         leRrTkFezGf8ve/fmoRdVvLJS3Q3jkhUHc59R+x0ui9Ho//Tid/C9VI3+SogGemGw7k2
         /fW4Y3d6+QP+OuqYcDd8lHL17g38uuA+KMyCpqldvxKweT3mKbUw0b3lkNh8js2KVl4e
         bqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458205; x=1795063005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=;
        b=I3opuX3gCkkOAi6OGQM+2SyQbTWrpVsiWSMVzIWrgGfS6b2bDnufjQQMl63KGuqUTQ
         nZVQv/EwXVigt9uoVGmkMfWO1EdO66D5cVNitdOCa1bmLx9Ttfn5m3vcJucFDWINGyQm
         S7/InYQzzlN2Dh1IlznBVfAypIM94uzP9rfqTim00lj3Y86FfSXVgBgJ5/NHXNmXSky0
         ZyBnGyx99+81ZswAxJtOu43/w7kqI9PqG83ZV3FGpD6G4mvFZIqSwBPqYBu6Vk1QCGHw
         XKasJpjkg77WpXQdmveUm7+lGm8xFcw1PWJOnQHLg0IFGzZL+SmBjdcipWj0wUdqnUu6
         YhSQ==
X-Forwarded-Encrypted: i=1; AL+hErFu6hgjIAODw5W7lHIGi3J16sDyG/GD50azVG5bGz1PR5ycTIP6kJiWmrxh1/C9ssJn3iCgyHUy1O+ZRZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NVEO2flzTAdkiwkq8cTaJOoCpug9wccqPTSO/gW9N9r4QC/MV
	3ONm1+Gn4sE+Sny6++/Gwqv2HWQ/zTp+aLMjV8dq6PPRFzn7fP0g5aLuG8qAQA6q8bmBGgiL+2z
	zqEprlHRMYDGXuvEUUdREC6heVzxdEUAnicDdh2MAPrlspBypi6WYYutEwz9kFWdQ0QY=
X-Gm-Gg: AYBFou3cUD0ctGwGWKIX+TZm31GqYcKPobe9kqFRQMZSpCbov1OCznMSF43qdnTVtph
	YZLHO5GgMObq7FkoqxyCJf4uf4G6Z7nkPBhASw/upwaTZ0ExuDQJ7GFdlktoOgrzhYCqqFzApvk
	xCl96sqPBhl3x+bmxWpZ6nSriMNA1XeDG5SV+yVBv4GGACQ0QVMqZXx0SI1kULAVaAP/NSdPP2G
	5lGgqGTlbsxvQViSDpH+qncMOoVz+BVcNjWkyqzzCsHVyEiq9dwACUR/3vhT4gulxA+EAwaYFI6
	xvHrbQscr26Q6S9iAF2y7A3zbKmpKBoSLA/+ej1nzHXt7vTC5NJvftHhwdETQJFzN2cfThFuvDd
	dns9UNs73tSgv8WCFkqNbpm9bEf20/C9oDVc+1DU/MDr23eKXbwdIy30sTMZ2yMCKe6Xi0YM2T/
	sKjbPChaZMOjIBGLcoQWxLpS4WyfoVk82sJcDCu7lwy7/vFDuFnmrDrmFtg7jwykEWvSOEZidD+
	AmaZG8=
X-Received: by 2002:a05:7300:d18f:b0:366:703c:5ef8 with SMTP id 5a478bee46e88-376850cefb9mr4226700eec.7.1794458204395;
        Wed, 11 Nov 2026 20:36:44 -0800 (PST)
X-Received: by 2002:a05:7300:d18f:b0:366:703c:5ef8 with SMTP id 5a478bee46e88-376850cefb9mr4226676eec.7.1794458203695;
        Wed, 11 Nov 2026 20:36:43 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:43 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:23 +0530
Subject: [PATCH v9 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
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
Message-Id: <20261112-08-dts-v9-4-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: fEoSjqhCQcW-wyYT7TaRTSfzBPVYJD30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX50zgKQV+Rqln
 YKCXBJv8XlCIiRqSwb+Ne5TqngXj/OFtv028PDFK4JqiM4qTUSm0ofFH8UdZ9ZxztRCU32C3vzL
 NpVzxbFmQHZ9MQ+APpxjEpiIkFECZ0Shx4032IXbmic5Tm+CLbHHbXIgyFvbtEe2Es+RGY2vz1W
 aKZcuyBwehEfEeWrqP8xRdN5Sb62UhoiZ42rLfzg4nSKMONbeWKIlgU4g6Ovx434Y4TjWrwwVQR
 Jba9XYatfwY3lxXlrxuu+Bn05GLFNIu/wir6qfcGHgfyt774y1aoQ3tLupjWSlC1LigPG+bqStb
 7p0iFsnVw+fHSYTwFZE8CXT1uTJ1aD+VLami4+8pWfGIa/dX4V8hHi/BvLVLzlGz8lmbpBTcd2b
 LndRzVBf3GPqiOuNpc3vwJEC9P3UFDchwN41G1sLfVhNRNSeoz5WyEX+/orhym9VWPojjbsK3qI
 GdhFkbuhOFcGQLRkL1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX6a8UKd592Tjo
 iCcyAoUoqWNkkXv6Tgkf9AaEHZHvmiQPwxKkqyxgqDpOpm2n8GnSlzUdzvAVMHlrJfmmUwA0hOf
 prNYbWKR9AcqdfbQvsnOQxkkqjR+bDo=
X-Proofpoint-GUID: fEoSjqhCQcW-wyYT7TaRTSfzBPVYJD30
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5425d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 17daf277edbf..02fb76283f7f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "WPS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -132,6 +146,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

