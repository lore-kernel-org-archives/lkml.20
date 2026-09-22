Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C00E283142
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049420; cv=none; b=rFd66QIuEIq6eKjWVZbfkFirucR84bTM0e+9IsHjow+uyufVH2RpctgEY1pxxdvQ7j8AEeE/xY+Y1PLxLbZ12sw6yjk0HU+YgTP4MV91g4vA3yH2EhIhzSQuZVNMTyJB+MPXM2QfdnPKZpqwNMWfYgBSpxj8J+D2d/fVf4oFTSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049420; c=relaxed/simple;
	bh=w5cFDvauDgruD+36S54d4kqkMhyWmgilo8XcvR7nbDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmG8oyGM5qCVEGiYjLkd+4mzSNTr2DrSit5SxVlHqLWGkp6uR+WSu12moU62BkalJaciSDNgQK3is0tFkk/YoQ1hL77+HBMsXZtHulEuNo2I9foeBW4Ytb5qA5uh4dS+NsacHbsQ/QX0ZyRczY6Bru++8YyOl3Gw9qOUI8TG5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmizESbi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfJxClk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmizESbi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfJxClk0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0EpAf3186248
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=; b=UmizESbiP5xlgRfv
	XgVnZdFq88FcF5JxPPOjy6itEIUTgT6chHBRse072+ZNwqytsEM4KpcHC3YDmfxW
	C8dKKLJRvOEGnF3vwDUIFPz5p5D6xO+j0rjcQxXtQhRWauQFxfC0LpRbgZ2Jf7nR
	3rbbG1ZxYb3HU53Xoqbomx9SYsejX3ywDHifR3SVHdbHxWErPDNWVpfu6Pub3TXk
	ZqY0Ct00Rbd07CmJhxcVwgZwR4gtkKjft1i+xl3ctY3rFgwv3zf0lRWOgcWOLzv7
	G65+sw3K2+9bJerkqWhIM4WZjaewsbhjwYue8m1c4pDp59SFWLiWsp5MaNm3npUd
	vKRm1w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybgnk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:56:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso1571035a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790049417; x=1790654217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=MfJxClk0QiCZjL28I+rPyncN5xltnQFG/19WIriqGubidOZTvS8YdCX2QV/zhPjTlD
         h82TpTB+bUbtXgoO/ms84OAkmKonJxycxksNcwRF88Cv7qyASa2QKkyIJvq/4BNSeBPc
         qisZeSvgs3Zad87LKlOnyl6b62L8/mtqnTwSX/MwOKDItYvLaQ5or2WJ7aJ4Z49wcPGC
         FDpJ81btDp/FrveevsdeLESeNHOLjalMzrmvBXmmo+C+CZyf/f6uEW3UugTquRZ81rna
         lyOq8DCbAZWTT0O4OQOA+4ASMUkyDmlU7+NeBG4mz0rL1qRNQSzJwk7uQ5Qi3+/N+kko
         /2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790049417; x=1790654217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=WX+5NT3mHJIVM8/j5V3YJbZL4h6EqjtoM+3DXrEGLpbWrxMXHHB7OJh+8CMS0GTJls
         e2rgCXEeoRjClReacwBEbKNkA6HQF4rNUOlXqBTTmpXAt215wUEhhBNLU2ZRbpmCvrAQ
         jPVFq8E4Xxw10kQ8QvaBJ3Cchnz3JQsZCURgxsVeDgIwFqxTTQMUfi/+3MjRm7xldU2M
         DX4K5tsFSqeY9uuKAliEgazLHThveKzrmBg69CNgaCGZYWxBbr3JPOLpF5dXch8LepBD
         oRwCqv4qtqeUn+Mk1TnLFNOoDs9GtvduhFVn50r9UzXbjqI09GOecZM6RCZ/ey2VoW5d
         4sSg==
X-Forwarded-Encrypted: i=1; AKwUvByBTv2Nb+UliSWrQFsrpcidT1cD2F7M6sSVJ6URgDqiEpiCSAcm6SiEtSJumcJq5nwvwu314DHePN2I1fA=@vger.kernel.org
X-Gm-Message-State: AFuF++nhybEcqVpc2Wk9dEQJyHtWyKNLdnJCuvUoBWC3UQFRW9+KTK7C
	wZjAAPeD0+jy2mMwsNFf3M0eId3XpcmRSijBt/tZq59uc9+2yDr/Fx1cv+LOqE7XcvBKDSx0X1u
	AWC6tDF62rMOEfNFxqMorfxtJiDEZIunMIYxllrmvInbAxeXmFaZRbNjHou1cbKmb3aQ=
X-Gm-Gg: AYBFou12MuEZxKPj6T3xf8ppoODXdlA7GN4r0SHmP0rvi5ImJukHyMztlaSkbJeGdcY
	rxYlbnZKLdrqtsR5LxS7u6HIDJMIQ8Or9+dBp66bnO6bB9jxbCXrq7t72R9UP4vsZkAIgwvGrff
	TlnTPI+hlqRZi+zWzu2yEdZHBb1oJiNp8vbflaUsBPF56xYoAgqXX2feKdgLmiONflPr2dNPpap
	jfH3OkbqQo8o2KDngglKkn3RUiJZGAQNW4OyQOHhtmmHCjHLZ6QJQAth8xmqN0Rl6CotJKv6T55
	b+RBHAYWYqsATsQzGFcIzvVgM8T0mi+v5LR20Boc6P8fZMhvrEpOIpRwN0TiJAXgyqQcIFa+e4l
	Qod8GbCV+CSyS9AEim/XGGMq+9YSE26A=
X-Received: by 2002:a05:6a20:3d95:b0:3d0:7a2e:f827 with SMTP id adf61e73a8af0-3dd8c44d03amr20494640637.16.1790049417413;
        Mon, 21 Sep 2026 20:56:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d95:b0:3d0:7a2e:f827 with SMTP id adf61e73a8af0-3dd8c44d03amr20494599637.16.1790049416930;
        Mon, 21 Sep 2026 20:56:56 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e58fcsm1613139eec.2.2026.09.21.20.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:56:56 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 09:26:37 +0530
Subject: [PATCH v4 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili_camcc-v4-1-87704b664dde@oss.qualcomm.com>
References: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
In-Reply-To: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab1fc8a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6Q3Ru0MKm2Bx8LS0oh0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: cMfg8yvlpByLr_ecJWAXFzxi_0lTT7LZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA1MyBTYWx0ZWRfXzvYYQOaFxSsJ
 +MKeae/ue0Eph+HDn33LYNBRxFI3OMKUT0bamE/84jyJnHmBRG+NOLQuOQVBQ4hFajKeoEETnd7
 d/jJqhr1warlT5E4jnNdUs2O/d6L2a13SUJsTmcTmJKUKO8b4tyXUhF6hjN21cULBvxVequd24k
 iI+YGUgwWg2PfFuTNuNJyYpZVvRhmzVQS5S00wjOwDsZqkeV4BSrWWjZm8jCS/aZJ45yrH/54ft
 LEGZJ+IscCCdid5ZQzOWmlNpfpBxE4x2Cj8uNzgoMJJFQx/L5xeJ/e6opufAqaymkOCnWUqdYF5
 APO8x76avfzdgZrQ4gX/LIf9La4cCfi291umpTr4sMjrV/Y2lb1Ay5g5VLpc3ndYA3Lya/0jAOB
 27DIWGlt4WiU3oCz0pjltKghixi65u25Mke/s8Hz7tY/M++nuD2BJK3B648fdYDmgcCP2Q+pGDj
 fhjzgtPRITdO/lXXIjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA1MyBTYWx0ZWRfX79kxHmZzWYb5
 C0yM/SDF7ZbRt377nJNBb0Y8kYBweG8+iUpTW7p5r7SXMY1sqvqjJ4eErWLfE1wFxQ9QAEQLa/T
 TcuEunqDdMTBU7d8/B6GFGdMo7n3mUg=
X-Proofpoint-GUID: cMfg8yvlpByLr_ecJWAXFzxi_0lTT7LZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220053

Maili camcc is a derivative of Hawi camcc with minor changes, and
hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
for the camera clock controllers on the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index e2a126925e9d50046d1b4ad2506d7921462f5fc0..64f5002931f24003607349aea3ce366f5a8ec369 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,hawi-camcc
           - qcom,kaanapali-cambistmclkcc
           - qcom,kaanapali-camcc
+          - qcom,maili-camcc
           - qcom,nord-camcc
           - qcom,sm8450-camcc
           - qcom,sm8475-camcc
@@ -43,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-cambistmclkcc
+              - qcom,maili-cambistmclkcc
           - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
@@ -95,7 +97,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,hawi-camcc
+            enum:
+              - qcom,hawi-camcc
+              - qcom,maili-camcc
     then:
       required:
         - interconnects

-- 
2.34.1

