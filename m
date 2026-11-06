Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956912;
	b=nV63ksL50+5cpzYwBzLts4haLvpRMC8kmQJA7MBmWtGc1h0BYe7/jNMEu6yrVWBq/CNW
	 ZyZN3FN5dP5+nkLoIjZXgNvHBVvYPB96IJ0V7pLP6mZLFxEQ2Jfa00WPtHhlBCJN6cOcY
	 6QVPe00t1vDNXuc16vKNTBCXuXj2SMieaNzJ+fU9JlYqCWDvPUnfKlGtjPb9qlz9Rs8NM
	 eTL192cDv+DX5DAqazqfPf7KFJp5a4OChnfhiwR15/zr3SEkp9228C+YG5UIMO1xsqMIr
	 SucqUP9iyrM6N3ne8yUYhrq1mxHwORZZVk2XpZ0h1LeohamJVrWiqugoFGrRUVBqB4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=;
	b=YpvHidXFb9rlKfXZJiYpK0DQvXqp1u8GIU2hDkhsszYU+Npmd6wnxGF8x6jdsQs9LUVY
	 AuiVM5WRAPkw23l00+UgOzG/tjYZ1Z4w+2gTbb3iouwLjLeyKjn4RIQPQp1ygt1W3gX2b
	 IaeuNqgJR4FL8QuDp7OKggw0TFbqUYgbfFdzlaNpjnhcvAelGysd0k6SMXYCf7GMxtbla
	 dt3+rZKfsBIsgL7F4igWtOb1aiUQe2///NTG1DP7mMZa6DgtzTim7pgkeeLilpJ/G/iuX
	 9lzvMby5w067ffXTNVzIsS3pEPjLp4yI+NIBhZ0jZIp2qVJt4fTZV/Put6q+H3Ts65Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xo1JhVKX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSDskfeN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE73606D833
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE73606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xo1JhVKX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSDskfeN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RUD92730776
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=; b=Xo1JhVKX77fbpcrO
	aera62y9qKBPU5VpNd/JzPwbOb8Nn07lhqzhDBCtvdEUogEyP263nIpZ9T7iYwFM
	OObAR4Q8cb0ViJS+90OiMmNVjqHg2K9nNujTx13txPnbpqrSUWTUZcdMCuTKQrau
	hHJ+zuEFabU7cDEHBQt8PJ2fV4mYMj+DooKeoVKp6byhGGRO8MQBsBqy6uO6zx0m
	27njwpooKpfnjL3wAAllP9/pkrTFni6itZLzOW3q0KLViN97CX4WntUs0u0Y4pDM
	/XLeTd9ND0m8ZzKEMluxOG6+8ZfBxg+XenS5p4Cd41OpcbHxDi5Vr6sfJfwclCJ8
	UwnzFA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9j22h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1004994eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956911; x=1794561711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=;
        b=LSDskfeNl3peHJLEKbnjlMaPX88OOoSx/SPIKg3FHptlz4UswbpnLOWBkdO+GhDYFZ
         c26g0SMGYxzWdEZQvqcqEYjw11tND1WnsXuwUDWqopcUPGDvBv+3GFL5wnMVS4I0Mjms
         1T1vzkzFeNwtVLXy9CxXKtHZsyRd9xKRKCaTRrTmM+1XiErXXtKwXWPZ6UUiZxttJTDm
         GGmXkhuHV6OAVsWjo9z+QGLFAscF4j4PDbXFKLGuHBbFMNIAHt/c8X3AWi+UYVsaFMYj
         NL/GmkPGJ4Ba02G1tqStM308ew1QdIWXXky+b1qMGHZVDWcote8uBIPfPJg24fkMwGmZ
         QzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956911; x=1794561711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=;
        b=HKyHky/4M6cyknlCcmT/h65hIxZqk/DanTXMd3W7FgQzn3/F4N3/h+OCUZ4beYu+nd
         fvuaas6x6mmN0dmOffaLpU8rn9hvUjpg41UECBLtrGgGqEDQwzY3zT2c8ZraaTn4jxcV
         FouKBxBQaITU1/EQ1Yfqp48vWy8eHtEjPe0mySiwFQHxCZdADRdXndglWF5nTxsTYlJT
         GJLN6H2YqiSYoUvx0ctUlFgkm/zWf3849sjt8Oz2OIbFa/drQRoERaeElk9JwI7lRCAh
         yXSIfk7FWnTzg6MynQ77kmv6GtGsgWrLORlKtAvWLnSB7qsEaoc0V7fDXQpq4svz4Fhs
         3Mxg==
X-Forwarded-Encrypted: i=1; AL+hErEUrdAXynxYhCCRt66FfHkAPq+/Gk7fssQSBHMCkIZm70Rr2ViQqfGYJob7QsTtv8rsbwyUBJ94+ArfNwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z92wflRgNlbocP0uZBPMRGiIGT5nKgjSPfo88EoqzVSrKcQM7OK
	PdDd5k2Samu2LxXSom47Wo1cDvhcTQrH1s4ERp+g7RQcuS/+ZRSqfVSV/0+WMETaT+mnP6mY3bu
	6Ebt+3CBGuhF//iogANvPTDTOS5Y6j2a3qF3MwEOzsabNw0/6epurvKFqG5uCQLmjF3g=
X-Gm-Gg: AYBFou0OqLsEJxveYEcdbT9SpkAPDG28YJcR/dcttAu2TJCXtoUzhi1h9Ih+/teVEu1
	O711MxwPMW6xZqwVa+DESXI7aBFWLRKE89rwiXTs0GnZcajUvcCEykeoMJT7ZAEWH7YiSafT2hP
	YdpoQqh5FzWxzAURWflMinyVyngZioWCTGN6xvZGXCjFuKvXeVu+AnseKboeGf5AjYRlvc7/zUC
	kDdeF1VJVgZ4I+83DauhOg8XfPQZCRXidDOSvrSND4jtQUBtfjgH47N+xvzQ8psDsPhPBe9UhY0
	UsiSW0XtZXCUV1dBrriFyUPLl/T4HR7l8D3g86XzA3aYRC+LYf75FBwCQERW3IApwsKXxLM6fjv
	bBSVVcGZ3bVY1w55UOPcWoNG0ruKJ9cRI61UwXlprrC+QbiHz8hqzHuy/vrPqaJEuP+ZKowecMe
	7O2AxzzsUyxPmcX1pTThBOgkGGuzfNEDwWMI9SF7Lvrd/R+HkLF+oV7JLHxW3zC7tRrxSqdJRUx
	d01Bg==
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr2454545eec.19.1793956910701;
        Fri, 06 Nov 2026 01:21:50 -0800 (PST)
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr2454512eec.19.1793956910018;
        Fri, 06 Nov 2026 01:21:50 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:49 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:59 +0530
Subject: [PATCH v8 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
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
Message-Id: <20261106-08-dts-v8-10-d91401955039@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 0Y1hLcVAS6pfGJgyvxFptK605OON2wl0
X-Proofpoint-GUID: 0Y1hLcVAS6pfGJgyvxFptK605OON2wl0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX4tXUn64k6KJd
 5SR5lVqW6qk95MmtKEjeyfS6CmvttaBKERoDRxzcHPYggPKEGnie+1G4fCmmrKkaYJeIgVEgMyH
 VPGUVXMGm3wJ+6XNwz0uu+et+JthK7k=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aed9c2f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ll64UZJxbc1SGzsXvscA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXw4KnxBwJS6A3
 D9GzWvE0PlpR2FGr47Y/LwaSbgbqKEXoestanTeBCGtl336XdXrMip/TEUrJZisaAGfH0whbDxJ
 /djhugGzojEijE5shyWlQKJ9dC69BCk1MVXA76YEgzTTD4U5LXNXJCh1Gbb43enPvJely+VoHaF
 JokTkPaN9BD7Th9sChHUlGUj9oPRzBJxaaH6TbO0Raf/2A0l1JSuWcv7njbOB19eZVorkgcsQ+1
 BU8RJvuuZdZ1hVAj3+QzW3uEdTQ4iCGjuUSpbpAu0H8kR9aH2BphankA0kYVBlcO5DQKySZ51hr
 KRx4YWn5wVfSfjEiIHyzt8sMSlkCnmKptU8qCC8jPVhUVQG0q6MtkV8RgyhCdsxPaqX6Cag9Kvp
 69L9NXepd1usgn6YzpuDDTObclPNekd66f+eAMAKURhL/JdfMxRZrlLXCzVMLuaNp3yc+JO+vR4
 zYLvSxRMZcQPQ1Ll2yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add SPI node definition for the QUP SPI blocks present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 35cd55881969..61a58fd5d4ce 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -168,6 +168,14 @@ opp-32000000 {
 		};
 	};
 
+	spi_opp_table_50mhz: opp-table-spi50mhz {
+		compatible = "operating-points-v2";
+
+		opp-50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -434,6 +442,18 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			spi0: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a80000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&spi_opp_table_50mhz>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x01a84000 0x0 0x4000>;
@@ -470,6 +490,18 @@ i2c1: i2c@1a8c000 {
 				status = "disabled";
 			};
 
+			spi1: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&spi_opp_table_50mhz>;
+				status = "disabled";
+			};
+
 			i2c2: i2c@1a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x01a94000 0x0 0x4000>;

-- 
2.34.1

