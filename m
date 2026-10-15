Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F7D522F1B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058183; cv=none; b=qz9PpjkI9z6NwoGh0iRHGg8i43HoysO1WDztnfddoq4CH4hjLgU0zToXLFfa6SbefNw81dlGQ2xZH8IdMf3VEi+a2GfOF/mEHN2WNKSXcj0Omfx0mNkT0RxOku+MMLo4qEnOVE2nF9Q2McQzSUEaIsSbszQxScNWtLOW2/CAgC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058183; c=relaxed/simple;
	bh=uXma0x2l2wqBjoOcZzn8IVH4sZ/ICl8Q0BX6Fyj3Fn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qixl5qVtPQZxTlySo5OBAl5a+SGFCYBFmbzcMATGC8EaKmx0tQvAULSYK/mzOp5J7teK12RapDm8F4XM4arJllzFo9g/qUkASLMEPuVx/jOZ0H9FJ/ATZl8tcp2zstYVCuEPIv6mcAiKboL8SGhTxR/Fu7YThjfP6Ri0XVyafH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CsMR7IJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jhFJWdUr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsMR7IJ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jhFJWdUr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSBj2662666
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ByhdOUCDCFZkR9AkmOM8OvWfYh/AqKaZyHIi7MgdSe8=; b=CsMR7IJ2TunH9DgL
	cmkQ/e+JzfleuNiIjiZDoYSUvvum4ZNSBcVL5QwDjOTSdn/8x1cw0mXuOAuUbC+8
	wXSgLV5dw5AXXu2c7mNr4+olSuC9VlOY5d8fOkH890RrIuUajL+lD3EoNWjMbkf6
	NBp5eliZXpbVDi0RtSZP0oHZgHjMejfxhbVRm/BtsCVkiK8STjXd/4xnVs8t/z+3
	OKJm5JOSE/Xl7tKnMHXtwzlza6KTL088QApWEmaqfPqjIyu8i7udBDNixoAZ7/rM
	6JYNOUHXd9rF+gnmX+NbyGeT+p5GqkVwraVujCL8Oe876NYuM451GaQoQnMhzSrM
	tdQOIw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1dwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:56:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so6516936c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058172; x=1792662972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByhdOUCDCFZkR9AkmOM8OvWfYh/AqKaZyHIi7MgdSe8=;
        b=jhFJWdUrhvzlOP9E3EoqEVOwLjR13D8/6QNlom8+yJT+uxZjCasASbA5c6FgTcnIUM
         O405SWl4BLSKvcYohxi35ZzKueqjHSuFPoMxC9xrOT0eIZzTpgEOolg7k+VDxWhnSdqB
         lGd61fyOqHI6zG7kg2QPKtn5HuvDo/Vw1cmhI1L1oTqBNcxkvB18zRwPNzKRj5hp+evo
         fFWLhjjzAFWc6rixFeglDH7iNp+R5QIeN8MIAwQuaPMvc4+dXH3hBXqH51JKQCHNqKCc
         XCsw1H9/vLC9rEcfNbtlJxnx5WZ50e7QDkpM2MQcxRQOQCIeiR2phJsNYbIvm9X2jXNp
         GAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058172; x=1792662972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByhdOUCDCFZkR9AkmOM8OvWfYh/AqKaZyHIi7MgdSe8=;
        b=pZItFpatud9+sRum22d4FD4T+yV85t8EZIQvjZIFUtmxEMafIm+g3Kq/+gVvy2vPR8
         Zxhgm0cCJkG6rvZPz8ItkOOs9gXVUB3wbOyZ3gGWciGZGI15mkvLVS8ymwrzK6nghsc7
         rbrGgjaA9GJjmWl/Y6UgOF0pvLXR66RVpg2BH+VoZaM7Q/Zgv8rVufG1z6RBelWD3Qc2
         +WRc2WItcAyGBOj8iCjN1lbq2iRnFiu7r47ovRItb7suVOY1YjV41OQED5GKnBWKCLSd
         9unozekYn4yxuk0J0vIK5IcvMQJ/l/Wbo4aBsqbnYE42xvJeyeA33f3oZhwDFX+Ejyk6
         6PWA==
X-Forwarded-Encrypted: i=1; AKwUvBxyu0gj1zHQdpSQiMHackQhId6YDnHnjYEccnneM9yEBKLtaXjJD3wNbC195WATfyuhjuF3948zVEw8kHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs6OQBakYKVi2Bk0BhOwq8Z8pvwFMGevUlbH1dgXFIperZKvJS
	5rilOJVcEEBVFCcsdFJCH0Lwbs/mnPX2606/kfktHpHi5bTxQcsSvNGG/+dbRJOTqvNI+P2WL7j
	L758WbuWKQsuYZSguQLtQXMRVWLlm/5qUYAtAt6jwm4Zjf7wIf73I2aV+3FJcZztRyfg=
X-Gm-Gg: AYBFou0YwzQFprDW7S5ygOS9UdIeDsTml/P4D1Ishtr+sMC21Zq0VgWpe3WQncall+z
	9htc+MoiOAD2CJ9aLX2yt96wg9zAKslluy7DxpXR4FKgQVCpSjkC79l6cINSAYGGwh6ZUvgH4C/
	NbeT2Fl/TiiTskUyWnujyTBHBuwVV2alpdLnyRz930whHTe5TCeRv7P1xOgL/DP8I+BcPaFq3s6
	643yPeuMOilmtYa5rXCXI8WSXeofEG50ZPiSg2d5UQw/Oq9vyHd7RSX4Qy63oy8/+nPJ2MbpCbD
	o47dDLCUcASeIsu2PPcgHX0Ml982PQ2XhbBov4wCzcP2BZ3x3hjk1FXNSuW3dxgBonFXKQykrbT
	Nd6LRJnvNr5nqSUs6zEjuWTfLTEWx
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34481554c88.24.1792058171770;
        Thu, 15 Oct 2026 02:56:11 -0700 (PDT)
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34481502c88.24.1792058171276;
        Thu, 15 Oct 2026 02:56:11 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:10 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:23 +0530
Subject: [PATCH v2 7/9] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain provider
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-7-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=1132;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=uXma0x2l2wqBjoOcZzn8IVH4sZ/ICl8Q0BX6Fyj3Fn8=;
 b=DREdCntyDkJs8jeJyOQDvcGfxG3Sw6cmfGGxdznbs+Lih9GzsyrTm7LcSVxLK/FhKBY6SYkJC
 hfE3EZvvdZGBtKf6kDZOv9zVh3hAIoo3VLr7+MzMGM9+Ib3gb8Au9/S
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX+jZgSEAXgsEy
 KwgwJGcyaaqjgTr8gTrGP3qs9B34+CcLlo86bzCYSCaNi2edNeftgfprPOSBmLlM3nu/c1vuIkq
 gLhLCMS6Jytc1HoNXT7tuAjAgTRpcI0=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0a33c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RDWDdWZ4iDCRx9RkWiAA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: GFggGGAjzAVOIMLStZF9QoV0Xw1yTevv
X-Proofpoint-ORIG-GUID: GFggGGAjzAVOIMLStZF9QoV0Xw1yTevv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX3CVNWsm9ouaZ
 Euz7Edl2BWXeRTao/cMWobHbs6n+tZPjQcuPKXDVasPdEnafrrsGJJNZo4FB9RcWn9avpk4Hs7Y
 wSdm/sBwR5+ez0790k7+5DhNxV1oDnaJrAYWhi64XPrCookjz1Pqw+m9DPZeVZZleB5K6Y5RXzO
 TGd9D3sXmEZk9jekMwbJZSJ9G8DLTs7cFGpyXK9A9fvHtS0dvi9dmJVkmf9Cwfgv3PRZXDyhtq9
 f5tGLKbb2IVzwvex9t9AU+i9GJ2bEjBvrBrhyCCDsVArMooXWoI339qZsRXg/3U8kgkbSbJWsiC
 Jmotm2wP599qH+Esln727ejJC3PJp5S04bW2cTfB7/eJYSn8v7YSMkCkpuFH45kLkUBWLd+Almv
 biYwsqBIW3SK0arWBefFL3QFAHbz8j77WSs9uV83MufuuP/R8JN/3qg2qfK/kmiHgo+5SgQxyyK
 8X9J6YH5leIKMDz0CHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

To make the MPM design more logical and avoid probe dependencies, the RPM
notification is managed by registering for CPU_PM notifications.

Remove #power-domain-cells property from MPM device.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1ebe2c40d64ed670752a680085b871..05505dc3b400e923a574bc89ec9a8e7382ab803a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -205,7 +205,6 @@ cpu_pd3: power-domain-cpu3 {
 
 		cluster_pd: power-domain-cpu-cluster {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep>;
 		};
 	};
@@ -281,7 +280,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1

