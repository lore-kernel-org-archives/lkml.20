Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458354;
	b=Zmc7orCAzbCsKtVh0chg3F1/Fuvf6EAuBBW5bE7RfVJxigvwRHWvQaWrsSWzfaTqqz58
	 1wTiIExdm9GovstlRHws+n+DDqxzlKpR2nV0XqJusyIBDI3HYBu4KHszZlXhKuYDAs5VH
	 ozIEl3ZCR45adVUr7eY1poYz6TCYZXxPzJwZxbe7hJMzhdE0uvXKjRN/ylkMv2YA2U+8o
	 CjFIwm8rfbURowGubiqsSSoEInxNKItJh8+R4UyRj68uKtMjd1t8DAHQrh+fRxU7ghhQ9
	 V036vZ/yeFXiRWlBufFQCl2ppFflkZzCGbbpB95XDjKiyhDjOQ12ZoDc+LpnX1JbOfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fxy6sGdpDXgQryJhvgb8rDWmqWihFOMf7jh1rczOCM0=;
	b=tdVPZLZ2ATdtUx711WDgfDQpbBDmnj1d6kPSQDPB2uEJTFY5zLvpid/9b2CJc15nudxJ
	 UZ81IiuW6x3a1VIL7SP1Fg8TbA8L4oKXM2qj2zti3OjWDneDXdpcEBcs3072JlSqKUubL
	 4c2pOTsAeDqZiEP9SU0jwfZwcwa+4uOv7T4bSEJs/p19cwYLLXxeXtJyMAtdGHIoT9Q47
	 bijLgxB2SrAiA1RMIsSKX/ZwVd8itd58ZBXKiPxcLdFQ6mVE+zorzIlwerF7ot+XEunkq
	 oPNOkYfo7rZp7DMZJ0p6HCb08HMXdTptuuQUzcNp4RjE0xktJNn58t7HsHOrwzjcBUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biVp2lgf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsnpPw3n;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350B0606B6AA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350B0606B6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biVp2lgf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsnpPw3n
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2aU091475355
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxy6sGdpDXgQryJhvgb8rDWmqWihFOMf7jh1rczOCM0=; b=biVp2lgf6UWmyZkq
	okXODcS8qJkPmULCFJh0VFXYy6GqCtbvxrK6ntX3mhVpontbvHvcbp1D/Qx9Qx0y
	bPWn2ZdUrmIPnrogRi/mS1cbMDWENKrXkzTSSqLQM/kC8ohRDYWjERynTT9eXXKj
	pdkrLaahZx9V3hi6hNL3ndn9jLGiZ97QhL4nRJXk2ggNNsDb9zBc77r9PlFmPbT5
	jrspiypmSV5Rv3/QZNrvln5LGmRWM0ytQymznsBmFBVO69NXd4GKafXWdEFEPd6L
	NZBWVoWkF84LFrKjg+nrCVgzO6HeRbAuu3qpWLie4ljxdIqv3FbWPp7x1bQ5pJg6
	65Hmlw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymtn34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:39:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7249737eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458352; x=1795063152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxy6sGdpDXgQryJhvgb8rDWmqWihFOMf7jh1rczOCM0=;
        b=bsnpPw3nTRfBkTK6lZB3ky+YGLJuuf0ki9K1be1sr8u5L8b+C0jdcWQMsRH+44n0ns
         oeCQrxHmjmIk2JVqOzInpIxzuoPC/vw6cxTtsq9xGZB5yrkOte69yRtyLCBaxhcu2YR7
         Pd80NqAlvqcKeP766XU0IxA4mJEeYa924vvkfKH8cPBUx53VS0WW+9XAMJ3Xyildw6aD
         V+fqlJadBwKBVtFBtVOVTIm0nTJLXn+aeO2SIH0Ldz6KqPq2uOyz82h+K01LJxKyaNdg
         xQXxW8YReku6DUxeP2zgH0EnVE8DDTqsuj05uOkAa+rV1MaJUFoa9+dZRSG6RChstByj
         tN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458352; x=1795063152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxy6sGdpDXgQryJhvgb8rDWmqWihFOMf7jh1rczOCM0=;
        b=hlZFfXXcrcadhtiQxXBzohZFkR+RBV6ZUz24FtHg+/O5aH+Wpi8/L+pa2mbd3pKxAM
         dftCXVhP5JczDoOgE6dWKKxvBna3SgciYaNETkneMvG2ebQpjdQxy7aIpcOdZQd2TFGz
         McVO82Xv3y1kmpl5GBsH17tvpshUkUuwsJI/gvNylHBXQ/1X+OdROxl5qR/wfVhFk6EC
         j+jS2y+ju+GSCxIhRlVdhmYIDv7y0jPpyP7yy1Yzz8lKVq0bZ4RyKw21XER55ldvs/OD
         6xy3v/3YKSvp2RWNro76/n6cxI485uF5nthpg1wwr+gPuwLYFPVNJ0cpNB7kfSPCCwUZ
         uFUw==
X-Forwarded-Encrypted: i=1; AL+hErF6I7Xeb++a4YwsnC8dS7eJP7wTBZOy6GwKzKi6O9PnDvwXnRdwgtVbzDMmFpwv+l31PZOTKV1TBjRG33E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lr/WhwESTFztfXDeR5VeNvXNMiiNXX0IC+dRLIcDF1/jMfA1e
	hShcyBPtP/7ap29zmytcwJDpY5LjDBD138Ai5VzIoCJh0bKt6zI6mV39qTYFvRJq1zOFdzZ8ZGP
	p/MXiMtmh2ckz8pPF+Yhv8lRwYf8AEXB4O7qoR/tqZwzxw3155NOr/059OMuCIP3BoOwuZ5prtF
	8=
X-Gm-Gg: AYBFou3yjb2QrGseV64gJ3bi4LcdaNIptmbZFb4cldzCBKRFyes9NVM70Cbvydt9auD
	3cZT/uBVRsRkMGKR3F+UKFf9yUHRBnUHSt/3jggtySd1CYbTY9lt86wu0d9ttWJAs9sjxa1nswb
	pAGZawpoH53yJwi8AyKoDGkN+/Nkz2KH7ui5AJCft/l0PSLbrLarMiO59m15c5PnsG7le6g1Wrq
	/1XvnPterSbtJpY0JAsXc8mOBakBv7wmHY57x/P87SJuzQFUPwKBp+AxWj1yBZK790r71CHVOpz
	2ko0VD6GmvHeMDV8KRGoluhBF0weSv1WSXT7VCc4DwtOEefRmQwGkaEU/wD3SkyUbXPFD3ohSvj
	stIokk8hoXTgpYDY1SymBH6KzrZH5dWgsU7WanRK9gF6cXKDAMNtkvGwG2X80QBimQCpMN90SNl
	YFeawN52JJ3YIgoGbbeDykrTp99BMAMjS7q3eYkA8ljXU3C0/VgJja8Zijy/qVNhwYQLHEVAXYN
	4b6aE8tSKUT
X-Received: by 2002:a05:7301:1604:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-376aa766a79mr4184360eec.28.1794458352123;
        Wed, 11 Nov 2026 20:39:12 -0800 (PST)
X-Received: by 2002:a05:7301:1604:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-376aa766a79mr4184341eec.28.1794458351554;
        Wed, 11 Nov 2026 20:39:11 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm42344790eec.23.2026.11.11.20.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:39:11 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:08:57 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
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
Message-Id: <20261112-imem_restart_reason-v4-2-3c7177529526@oss.qualcomm.com>
References: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
In-Reply-To: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Fy9uuqCLYsO5p6ezryfcZFH7M3L8vPoR
X-Proofpoint-ORIG-GUID: Fy9uuqCLYsO5p6ezryfcZFH7M3L8vPoR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXyURFuctLtMhr
 8VuapsT2qkR5WbPA5kyEQp8OukMAOqYKcqzqhaDakDo6BXpoQPYaubsmnLWaNjIleHwHndrbdG5
 EQ1F44jhY/5yTUOJiEG4+5mMYHnvWsSCc1GgYPOCDpczggT7ptKdoG+j9ozcTggf2z4fmH3g5oE
 55YZ2eRE8vFfopngzMc8DISNVnmZT81yer0WBHWcMT+QX8HVei6kwcikyyRjcK4hRkQGMC+G9gk
 QM2jifC0lhIaN6rWFvkYJZL4IhsWNlO513rrAIheItxZrDcJ187q77PBgsOUwgmbu3jd14w1N78
 n+swBv2V1de5MP7TnWunnRmBBJfa716CXNb56pQNB5HbICocbEzTeMVDB85lPuEkjEdyEV1vSkR
 gWHRt1RBWdR+meB+g0PHnunm88TxeoIbjwYKXtLaSAbUo8dLLorxYXt7WsOdp/VKOQNZsfHUDC2
 /MelyFbQrp6x4eJfoHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXzXyXjv8w1gGB
 7H+GFk/o993su4yv9bAgjX59Vq+5Z2maZcjH7fXHva3PuqOHX7hDS/1b6k8SjXV+kmvq2XrJj8Q
 sxmlK7W+hXj7FtPokSvjQyiZL3KoifI=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af542f1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

To achieve this, add the IMEM node. The overall IMEM region is 32KB but
only initial 4KB is accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 25c32e966de9..06e08238a12c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,6 +493,21 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
+		};
+
 		usb: usb@8a00000 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,snps-dwc3";
 			reg = <0x08a00000 0xfc100>;
@@ -573,6 +588,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

