Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFB439A04C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129218; cv=none; b=kYPfEUEcEtGr39AYlI3CsjPRC6ttpSKuvzMBB47vzHkgnwp8K91ew13MKhHBiSqXVLHvRwGiV3J1fvnpAVTFE6V4L/FASLPRmKRyanaZ8w3CK9O1IBGOv5eJazfIZZu9iZJJFyEmlrZDwDLmLItrtmQEildqfBgRjUZUYwAdq8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129218; c=relaxed/simple;
	bh=CJ9uaSzQghC6lH1iGbaK94WLx2v3FiycIFCYKuXJlW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EITXhyNoFZ6kScmcBigpA24cPX4Z7k0XZD9TxuUwcrYOaft3BpJMpnXS9zibClGBSUF4JjEp2OD9923z+UGdTY0BWFNQOy3GKQ3yusy46kPtEgNFhnFDj4b8qHcCWIgX48I84snVBtg1luqpszxFFSDZSge1PN0Sc5KI0Nug5z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prZPfVa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLvDk2yY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prZPfVa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLvDk2yY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FLii3U4126289
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P8GzhAakLwWM97pAG37TwFNHub2FFsaxlZcI6MJIasA=; b=prZPfVa8v5ih7+Rd
	VC0oQ+SprhiPyWjEAlZ2UzFk20uo3X+XzHLr+/w39geb8ms4qOum1PQRcL4oaPou
	12ZX8Q2TmzfEh+CadkswJpcYpaAflIlnX2qmqY1Q6vZzDgXmkrLLz8OT5FKz7BNM
	IfRBT8qiZUOPefsLKKfgaIkKrxfIjVsNXvDn2m7vNRcc0ZyxFQ5S0oIQ2AO0RwZY
	rwM960/FFz5vuUgXxUUB8xdFvUmTvwYUY31V2vQBc1jful5FV4o9SeoRDeDTY6sh
	RCkCAYEp+lGBMa0b0r5xwCFVU64J2xzA1kPt1T2MXSgpLqPrmymihyu9PwmDSdY5
	Brdslw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m2vwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:40:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso12352117eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792129215; x=1792734015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8GzhAakLwWM97pAG37TwFNHub2FFsaxlZcI6MJIasA=;
        b=WLvDk2yYydNObZfOJQsU4fmlTE/SzBH9wi0O0jWCUMJAJD3U4QpXKTxyRLCaRZtkm4
         XLPRZ+RIqXSKsRnExdoh1e8a52g07Nx8K83RfZSDFQtZeJyDlK5uoYSYxyTqPKL+Iwpu
         GF2dlbmqPurlD9NuQvfyKVHCV+mvYMRPytc+lzt6u4TOadguGnk26R/QMbjlHGNc4EWb
         +ZE0MgZr3NPavEoV9MFbVnwpcIlgJKWcySHkzBJyCW+vdOl8Wy/HXFcUYcxduqTI3t70
         pfnQUVVZ0xIJRXXXZ/Z8psQxcZ6gFuOoa8Bg8eLl+Qm7CCRBg6tYdEpwVaVTPIL/52Gn
         6gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129215; x=1792734015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8GzhAakLwWM97pAG37TwFNHub2FFsaxlZcI6MJIasA=;
        b=pUlYd0vPhWWDckEQmrbrtHgfApyalH2e/rP+/s59lOcxB4b9nNj+hNT7NkpeF4bKuM
         yK+CZKOmOeGaek/gi6VxbKAbY2VBZ8kfoZ9eLfUM17EV1LprpvWGII7drd1ZR6v30omC
         vbAfFRxVdrS4uiAAxJc8/nVe0WAfChH/NyVH4WUW+VrNyse1A9rpigE+afXkjvzEKvTY
         WB+4GFqi7zUbpXugNDnL2PQomR8dsw1UBmmmXcOBt+yIy0rSuA9PnkoOpeW3EPl+HdUq
         CVwFmyIvIpXXKwDggM7PeDYmdi3td65+zTAw3KBMlppAkIFGNBkAqX4qPVkEMwBZzobP
         OePw==
X-Forwarded-Encrypted: i=1; AKwUvBwdECBVP0HFo64AQwBiBXGR6WPHaolsQbwabojx1rTXCEBZqFHXjdL/Veu1t6ZpmO/UZ2lpG9vLwi8qDTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9cDgYNZ+u60EkuCerLZn2T9pj06tZFXGDwRUNV/88bDtvwm1b
	OKS2F7qT+igKbCEWFgux/0GyAD/lCdYET+HWZ83+NGh/1Th7UIlLvpL49liJEM5i3hc09Nxza9O
	2dq4gNFWCnCpUgFK9SIyFyu+BpXliJWOEt9DU23wMzmQGV2NuAudi7SS2S33mCcASjOQ=
X-Gm-Gg: AYBFou3QwQQacFc444BBzHRvpHuzr0qoyQTVSaA5Q0ZfEK8G8ZJW/qwI2bwevjDSEGt
	dMst1u6FkR0Ul6NaIlW3sRBuC6hUT5TI7ZZXq5oV99OHe1dTHMGk1CvtIj6suvOq8oGUbX5QNUI
	OQjIqmLhFAiGCrfzeZtZkMdAyGr/ofLG47n4XTx6bVw6xHwff6OzCA3esMNG8SzdkSfRKZC4FiI
	j3XRfcHLFdU4WEJMxcyFNMXRFjpsT0/7ob1F5ucrvRGsSjSx1VPKAs/SwB02e/jxnWazsxKFX4Y
	BGpnjw2ZFpybzm5/jDkDbj8ItlqGgA3QlAM7Eilvkk6vXavDGK6HqR7deQd3QFzlMO2ZxbamAZs
	fPwtwnkV5TfyxgvPOr3g7fscTw3F4QCzdydOl
X-Received: by 2002:a05:7300:ce86:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-360ca2ff3b8mr803908eec.1.1792129214766;
        Thu, 15 Oct 2026 22:40:14 -0700 (PDT)
X-Received: by 2002:a05:7300:ce86:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-360ca2ff3b8mr803886eec.1.1792129214248;
        Thu, 15 Oct 2026 22:40:14 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm3811393eec.6.2026.10.15.22.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:40:13 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:09:56 +0530
Subject: [PATCH RFC 3/3] arm64: dts: qcom: nord: Enable SoCCP on
 Ride-Embedded board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-nord-soccp-dt-v1-3-ee13aef55d8b@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
In-Reply-To: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1b8bf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=J-qd9a_u2GMogK4B2f8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: lCPC3InAKen8K9nKRbdfvU88UFBJMvWf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfXzvNzY1O4wIKL
 BN5gX+kGZxGwychH+NB5X3cUz3tVkMhdGBPpX2Td1HjSdZrRbymcOgldcRpbyk0pdg+biHP/V20
 kPNPVGknW28InxSbpkSt3C8Mw9yKJe4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfXyHAWlTvb8ZfH
 SLltfnFnXwlCk1cFcDQ3Nf8z0wHPdKXqfvtlkyGocyerid4gZxrC6OJTgW5LRgniGho9Pgfy3Tc
 7Td5DhQ2FrgJ67Mjs0D+4+bxgrl5OdtdkEBWrDEiD0vgGuUyZVSX9qKom1oxynbtdSHsdopwNUW
 MqGXS2VnHElc9yq2jmIfNQc8Y78V6V0whrrDCHJJ3Zd6fCD+1xT6uIh9mIrKRqZ4A06kEAvj9oJ
 ZZpRTGcS3nSohJlLpOTBhU/kK9prKyAy994+KgzMmFP2WcoMGwjufJb6PYujiT5ibIoMqiJHELm
 ZonSUXDqM0T7VGXWmFdmAV5QfEz6aBEhPFIlRlu39ZTv4E9+51ewYlkJdnkV/2nTUWdB8d7OzvK
 6nnC4CL7Tg26MLNgh/jUR4T9ar53MsCHc36NVO+35tHi2lFQskOuyCWePGRmVr4fXdNa9kaKSAF
 JCdY/ywe11Wt1owPYCg==
X-Proofpoint-GUID: lCPC3InAKen8K9nKRbdfvU88UFBJMvWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160022

Enable the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1206609a5030 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,12 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+
+	status = "okay";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0

