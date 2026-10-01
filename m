Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EA152F29B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867511; cv=none; b=QhdgDsolwykJY5o97K8qdMcSD2lHzAN39bivU91lxkjGnbzBuOHtU+sj+w3B2+xXZk0dc3dzIBF95rdw/77DpB01xOwYOBifdD6tYgGLJ9DLWqdeOwSBE1hj0e+MpHWwhIyw3fbohY8CF3+FEYDS3jRIeIdfyY3a0JPVHNikiQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867511; c=relaxed/simple;
	bh=dI7m1FeXlnmKyQLMayaKeYb5fzOiFLgYrLOUxUlPMc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JxTByC/3OHDPn1R+xTWceROq1CANcoYL895Vi4/SMjyVv624CZJadgJFimDcssyUJOCbKL0TbfTI3awLBTLqOqSDhRqUEXdJigYed/zMXBPavWrNFPTm0YMsd9aOr4e/ryO8zsSByJ41tW5mTd20Tpmq4YPzhKA9H97FYNHBGCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NuVhbr0K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUfOwVId; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NuVhbr0K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUfOwVId"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Diq7S3071044
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0II5TxQSaEC67w5rIgcCrT17yfasH81HdhycT2Z7zU=; b=NuVhbr0Kdua21k9z
	6QGMkOsYaD1asYqaf/oXRDZ/F1OpCMRGot84fQz3VcVSupcoxme1F2rCGpppIlxy
	+eKUahzE/hU0PQBc4Us5rrfW3Afb+t0Ngl/TqbQb5rNt983R3aPNnqkY+V38/28a
	u9+5SiEkKmy9hk6qET3YS/AHfz0fyk0vxuzMAj/ztHX16+hcIx5t520zNtWOgM2p
	E1ZPVeAfVaZmUhyO9tc/Pv25lTtfFjqjFnb7xP+c890cs30xF70nuOTwOwqW1HP4
	ccWgj49IXFXjKx13qHws58nO5kv1Qw8fuz6RQ88p4+V1l6Q8e0glrLw5zMz2Whnh
	xvnvKg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nthnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:11:48 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-142f4306744so8344367c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867507; x=1791472307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0II5TxQSaEC67w5rIgcCrT17yfasH81HdhycT2Z7zU=;
        b=UUfOwVIde7dUH5B7Ft9Wmi7TGuwiNKa+95vW2qmHOxDgDuz08fwfJCqtiu7JC0iywG
         BOFv0FFKRBIu55wH5RRpjo3Wsju6i28QLe6wYu1iQ7yZa6707wDEzMCRcWkKt8CRrtMl
         jp6qVlYCbD/W8uFLchHJFgPd87BbqhkUAZBqdK6snP7zEaUukDTaBFHHqHZpYHi6Xrwg
         zRaU1OUWD8YgQkEI9Ucv40CjMBu6kjBhOiwmEbZ42ItJ4bwmHvIu1dSKQWR0ywrQAiG6
         +DSCufnH1bp8fVZHOqKj70WtM6y2Rxm6SjmKAGowMhJnzUnonpXBWKTxqZQjNZJj4HCK
         7Sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867507; x=1791472307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0II5TxQSaEC67w5rIgcCrT17yfasH81HdhycT2Z7zU=;
        b=pHtMJymbReYUGeyPvxp1ZlGlOnOolu4BKre4wKlYrfH11Bf7B3yWuO0iAss+OAtbsP
         4FfTy14zOEjbvWr1dXjK+OQxHmO84txqPgBXqlcLlc6cvZ2IzO+A8V/1+VoTEkW2bUuC
         KlFiQPSu8vdGs7RERjAUAdJFQ/Vaim3JdcwImP2maKUIkhQ7S1WWuNkPxq+UoanZ9Avt
         hW0aEmsPB33UjjrkHzVVCP0S50Z6XphiLrgQTY1CSAKaznIQvwmJQSUANTrXw/a7YSGZ
         tYILaeMgxamGA2A9ay2HlRgKGG3aFS9ngnYwKXGffwtdwzw2r1UZAC5PvTdymoMxz9Dn
         3oYA==
X-Forwarded-Encrypted: i=1; AKwUvByFrkaXXZqWSpq6wslJZMa4hdwFvQbSX1V1ywt8SZ3cFoN/ynM3JlZLBaEknMRoU9twTS4G5LVh7IHgZDk=@vger.kernel.org
X-Gm-Message-State: AFuF++kIJQZ8qGd1Yl28vUNMyRd4Hhkj4nG2HmD986hjiNiwMCTHTKH8
	hqfm8TupMd7KRdV+awvS30ZuMVYu6kzjZ4CrlSMSt49kE1qH4AJxWkhR3LUQOD24Cd5d2hfVRnB
	frxI80TMIDXoaGryDOSHH9GSG7UB1F/4RkM0vBEQhR5WdaNNuyc8Y2LI0vbVQYhlfRVo=
X-Gm-Gg: AYBFou1zz2vv17xKICdU2DRtGQOAZHQnNHvNE11ztZN3mgwrvHPb1lXA6IxlgEVFbgW
	nMvLqtzPZ4AfCBo7XYB0FtqcgF6lz3jOtTUrl8nJMRl1ZquXbGzgYohDAH1oD278xZLH9CPlvRo
	J1pNAw/AnZrVM1v/zGjOooAG3Elm56i1Y5/tYqhmER9zBEFFOz6uyhogUwycXpqbBaMW+w7VSXb
	Hr2XfA7/x8fyPu7yxdvkmD7OPcpUO6dkUjABGmicbf9lousBq3WNuFbRyyFhiY7p8mOJR1f0scR
	i4XxAbHBvcVZW+b4JIA/jBTRpySzQxkRyg78PuuWVsqZODARkX/hPWLXmL3GSdhaQ9b2TNdnSLQ
	zPqOip5VfliMTPD/U1gslTAUPb8FLQUhXOMx3sG6/WEkcHlIl5hsH+wXdaGs3IJ9U2hQfFMhvRl
	GlqLgeY0AZ7k3lzgzNIDMi8MRsC5OnI9tTFg==
X-Received: by 2002:a05:7022:b884:b0:143:298f:33b8 with SMTP id a92af1059eb24-14d3378266dmr4533223c88.44.1790867507285;
        Thu, 01 Oct 2026 08:11:47 -0700 (PDT)
X-Received: by 2002:a05:7022:b884:b0:143:298f:33b8 with SMTP id a92af1059eb24-14d3378266dmr4533189c88.44.1790867506716;
        Thu, 01 Oct 2026 08:11:46 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:46 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:15 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: ipq5332: add support to get watchdog
 bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-5-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe7834 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXzrC1/325AWA2
 DAt+F10RyBJMXR29Tnd4k8vYbQv/LE0GtbslQoy8Hlj4lNMlTAVQ69aYjHpBtJ0+o1Bdqfuxqs2
 hBR1WEFowVeP9IJojkEraqX+4S5/ccU=
X-Proofpoint-ORIG-GUID: z4G_03bwJi6J1MqIs8ymZR1lKitTNl4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXwSY6y0pntmat
 jWlfYrPF3/7Ll3FoZCjMcxIYuunk9Q2zGH1wKUvU+S4dibgvAxhPQkYaCy8cNX07HE9grCYDwE+
 FzAxvbV6V+g1DZB6ZKQx/YFfehyfJeIvOzV0bNB8nj1tS+cqozfyLoXQI4x6PJKqW3i7/OyRuYd
 8XrtxatOIxzpeq3h8gcrRdKuF8fE82/ywqRL1xDLVxDCsssh6P5i4+t7KIu9Wn9zR1JlOd9BOmw
 Np/YDYMROCwLmQUHtwa5nA2rRZ5nHPQdz5sKZYN8R8O6o00vEFnWZBc08dH5q4ZpVBfQe7Sds+C
 RXsIkMazXTyFWaV/FN5quBhQ4Jb5BckS55+648cEWYEuobvCkJ2eU6LWnFp311HjnKdfQ38th1p
 Tij2FcHzo8MSc0KY3yzJBfbxefh3WZMecznzC5n+0UJjJKfJy/UMV8PF8U8P1111Sdcpxjk8Enc
 FtHLWyCnuWJD47xfUig==
X-Proofpoint-GUID: z4G_03bwJi6J1MqIs8ymZR1lKitTNl4D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 3e10f45e182e..6a54a548b4f8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -496,8 +496,16 @@ qpic_nand: spi@79b0000 {
 		sram@8600000 {
 			compatible = "qcom,ipq5332-imem", "mmio-sram";
 			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
 
 			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7a4 0x4>;
+			};
 		};
 
 		usb: usb@8af8800 {
@@ -585,6 +593,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

