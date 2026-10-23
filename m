Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746162;
	b=jmIBmO29LyB+pK2pe53JSWmXpvfCtBmqD6sVMoxwrzIZQ/vP2Qt0QWIkxauCXOslwTrp
	 YZJmCe/2oXgvrFAFA/EsNNNETV9hUxqXLGMBOm0qM/CiMd3EFQROTyiGLmEl8Cxj+Uwgm
	 JassESNzzzk1m2HSQ13JDZFqFqBfkTPlIJiwXd2FurDvtMBE5Ohp05JLGJj1IrxQruUWl
	 793d4Zy0+PfhSjsaxvMXWP0EBtJxEwWDzQp8k13/NsO30wR/QGfcf6Lgq1yvCBsEuVRxH
	 mg1xLCwLnKuSy27hfmumcoU7+vBDdJ9RKdp9SNOyHr4ve6bsTo1LLFkeUh17tQpbxzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dhJsyioNXqoe/67sGFvekH2yPgEUsEgy1mmIhMnO1L0=;
	b=ySoc5UYLMIDQta77bG7cfFUSJNqZdDdn+Y8totPWtx3X/i//mNBP1WWajK03y+F6Iz0J
	 h4FDeDhXobi1poOYHsYp2AQEEP42OLGFApavPgdmqNEyFIkhicG12Xn8u3U88mfsnJJ9F
	 V4AHgjT2cMyfUpsjNRnAiLwkV1C0OCZ+1G8Qu91+BjwQPJN59LegGPRghY7546tEO/tYN
	 LEOWcdHJMJWKHBFcQ5HPQqYQhxK6hQiAjV5TlQeqdIe56j3bgauDmIdGAff0geA8W/YOG
	 YN+dDdro2wuL4mlF+t2XjhTSIJ195DpO53NMK7OfIgCY+2TPvdKMUNU+eSwCAiM/QKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lXxyoDxD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2DI3gFd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D7606A335
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 843D7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lXxyoDxD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2DI3gFd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FDST1767187
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhJsyioNXqoe/67sGFvekH2yPgEUsEgy1mmIhMnO1L0=; b=lXxyoDxDUmbcHWnU
	TjRNRkvElUEMP1zVwDpiQijjXn2RYNXJEgasCCHqmUmQOHE+gtso11hj+1/PKofF
	C96sCe5BWD4i8wcOFg9nZ1zAHipMheh8QHeTH4bURTvMnDB5r+ojYogKQ74RThbT
	1sa2y+x4zp3ULIFtKYJS5NiT/MCoaIb6se2Ri4jw/HwDANuiVNNlHeEs2Z0U2oSg
	WHn74nd9vccdRRICyrRvoXmBH9yCKNZ926VIPGL82+rpVZWIvKE694URVLSJ1iQy
	KmpYajY4nlC1TeWhh/7eGNYb401NaefqjTCNR6zUFLT/3sOQ5fzKb00QGhy4ROJl
	W8wT6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahua4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337f26ee19so18708221cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746155; x=1793350955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhJsyioNXqoe/67sGFvekH2yPgEUsEgy1mmIhMnO1L0=;
        b=U2DI3gFd6ITm9DzrRgjI7PwkPtGtTgfY0FmOsBc+KizjHRAZzItEpH9F6d/+FaD2PI
         mpvFJu1yHuRfGrqDIHQrLmt2dRTwiKz001DciKH2c4gydD1sG2vNwc/6hpV8L8OpInau
         OsJctiotaNR1Wwn1l/mYYXXFI+Pb+zvuEKeh5NgALr0Z/8MnCVFM21l23XPkMR5CdyJQ
         MgAlOc4UYopa4aCsxTYbq1/SxlIjFjIxjRbUVerDXiffK0o3VcSOJGhpC8Y8kTJzuJFX
         bR4aasgxx85+HoboAYAJfeMAQJMOU4rwY+h5LrWDhMR78obaonHEwI+P8FgqkQY7+EJu
         yeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746155; x=1793350955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dhJsyioNXqoe/67sGFvekH2yPgEUsEgy1mmIhMnO1L0=;
        b=KJ88KGHlypFOHrYxSkpOSsE7DM/rOKPD460h/x47Y36oGIJ1Q+bQonNvzo1P2YoiVE
         w2hG1TnpQFB9oU7it+EKoC0DPwulbFkHoSoPJjxIJPNk+0+ETjMuDemyxAwButMqXNYO
         PZIKNTdo7cxuD3ULMm4NZ4op+vcTrOV94b7/BFDiMAs/yGQoFi0cIS/GhVotlNoxzxQd
         3YhWJjmK2aPoNOz0xx1V3/EVRkVKoW7XIec8EKTj4MR4eUVmtEnIq65dX40ggUpyiDSJ
         0cH5FsxoJzuWfyTPkvRHF9TpKCQxaOfWoMQrp/OHVsYsySA+YMh5MNJXZvv7nPJa6HQW
         rm2A==
X-Forwarded-Encrypted: i=1; AKwUvBygx5P9vI6yHEPCiRti3osR1v41grZHH469voJMbnKofMbPJLobxHwBagay+L0gSmg+sAR0R5rpf88falc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlTwo9IZT6NesnrHrqBNce9/xQBnt7Ka1C5Si4jFQgH+Q9S5tB
	fxT9npClkTZ6eGv6NuzluSWpIWEzMPPVPvrAewCaoHHHLyy4luP5XE4p6f81sbAmtpb9WpG6DaO
	DJJs9PzrUtuQdDmL5vJJGwpcM6yFyvGNcp7ggdAnCHgxlZcXLbgvbRX5wP9SBSgydkIs=
X-Gm-Gg: AYBFou1AB1tOcOYtkrataP8brdZy23wptoiIKfGAp9D09Jy7CXaziJ0AVw4IcUbctaX
	vpa68XoC3ilMvBxUkqTrsOuKvM8LKmbm79RG82bCBdIFeqXU6PVWynpjd/4hP1P4o1kEa7f1+yC
	M3cUG4xlHaNw3Kj0fzsiB7sBqKblCei7rv3xZ24YwC3DkSplkXXSe5dFgpUl1h8yNqJbEq7ByVz
	LqdJSGMCqyeb5b4daquze751Xe2EBuHF7TIVVdRkBHCIHqSQ695APjwD5O4O1s21bYSsdPRGaiT
	PDO/auFXkTQtIUEtKUhEh/lA7pxJDbhtqi23A+tzk/iYhcZdCt5myE9LR3u0zKNNffq0xyxwK2K
	aOolcHW3FrqkdtsZwW1audy6ZJCQA
X-Received: by 2002:a05:620a:2b83:b0:93e:53fd:413b with SMTP id af79cd13be357-93f6f842247mr289307585a.59.1792746154787;
        Fri, 23 Oct 2026 02:02:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2b83:b0:93e:53fd:413b with SMTP id af79cd13be357-93f6f842247mr289304485a.59.1792746154390;
        Fri, 23 Oct 2026 02:02:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a215437d4asm23076245e9.3.2026.10.23.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:02:22 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
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
Message-Id: <20261023-sa8255p-emac-dts-v1-1-a34d778ce9ac@oss.qualcomm.com>
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=23zIhhjG8pQRTvWHr3LJ96wEHqil9xLHbjMCYkHD1FE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2yKmO6d4+s9JqHLmKoIpODEaDepUxCKmf8PJL
 1w5h6UACPmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsipgAKCRAFnS7L/zaE
 w54ZEACEpGL3pZO5XBAbCX9VJxyYpEPSPtxS5TGEz1AbtEDT7hmcPpXMu3Kp8igAKvd9n8CFkEA
 iJZeIrqdLuGnhN22hkew/SvCvXuRDasTxBMGDNPJoZqD/oqKj7iS/A3tBFbwBaUNoNxwbRNedJt
 d+wR3XUbIRkwH9L1aMcTNLRy4oHpKkt93+RMhmF4zF+S46F3qMdwMWgnczM8ZADVcyhhBvY1vsT
 KlLGO36NpIUBigutL8M282Ybm0NhPqs8as5hRhl2BnkmFWnvqmqs2QrT5k/+jxl4viizSQ6ANfr
 t3mkxr69pp51GpFIBXuDTHMw74dZq/bEW+EWneUJFlogC5fe6N/xN2GlDs5cdh5vBFRjsNdRGxf
 OAIqC/qUbd/dMtpYiYMlrszeTGYaICOuQXFAoChCxizQ/taE/tP/aVBa317EXwOwAtT+IS8Ne2w
 T8d2zDOd2c3/1Na4KQNPx9m4czPBIRh6/zwQrmcqf6ABFBFi+5+YT1moPaG+hI3KBb+Fm6SVLlv
 fKu8synfqG8KQof38DWGx8zLSHDA6wjOLdrcydm+FYvrWRygUb9qyuHNtUtwwthZ9cFhg/cnZww
 r/ELRwB79Ej9GTMydc1Ro75zuFCD34PcgLIjCyhfxjKMorSwDdCbA9v+uSnr2zWqvGitherxrNi
 ATPklPe84iD9fgw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX6Omt1/Z4vD2+
 GXM7UD8G8iz6V1dOLZdFjw+MS34N1icNNWJS1qRJXsTtGeu96y84SDStcUihidLHYR0qyoMGfTJ
 b7M+0dSr8vqojQsQisXOwYhLN8fjYJ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXzYTPqK4Au8SJ
 lI49zlSlb1mEBUq7eKbqRT85w956m8cP+a6JkSB6uXvoJm1/cobSC88q1t0SIukJD2oO+waBJSG
 IbggYvEkXqRxzkmQatKEqhRD92gUO3jzirPLPJS97cICtx13b81OdoBuXZ8sCLAOBpfzFcGYurq
 y2LONwPLfoK7neshSOsSC5XlQBzfpcY1+1QYYYpzEcx7cCi3h/rv7drflsOadztUyUckymg/XbU
 tXjro2camYj1thXaA2cQfbqd/Br6sBufqIamTCmV8eVHkgquzsYEWtLvgqOFpoUM2SrM6CCjZH6
 ySl76D+yBK639cNN7omCTQdMMONSGjh1fT7W/F9vV7FS0U58w5vHciLADgmcUc4rg67ukzgeUvA
 6IkdWjdZnK+McSbh38y6KN05UntIJQU/avWxsUm7q0gr+wZAYG9lX6K8QKAvStLCxIwyxwOElyZ
 CNGCSsjkw9cLLAsmEgQ==
X-Proofpoint-GUID: 0Te2LQHIGC-XEJTxSRTe42cRX1csy06v
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb22ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jHMX-OgH2kBFWhD5V08A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 0Te2LQHIGC-XEJTxSRTe42cRX1csy06v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
stream IDs per MAC. We should actually only use 8 SIDs. This has
triggered a crash on sa8255p after a boot firmware update. Use the
correct value of 0x7.

Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index c71b1a48c3832bb40abbfb7d771634f4d197b0e8..da740a0876d4adcff0bb9458564c868a6f406b0d 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4395,7 +4395,7 @@ ethernet1: ethernet@23000000 {
 				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x140 0xf>;
+			iommus = <&apps_smmu 0x140 0x7>;
 			dma-coherent;
 
 			snps,tso;
@@ -4416,7 +4416,7 @@ ethernet0: ethernet@23040000 {
 				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x120 0xf>;
+			iommus = <&apps_smmu 0x120 0x7>;
 			dma-coherent;
 
 			snps,tso;

-- 
2.47.3

