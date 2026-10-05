Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5718135C69C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182224; cv=none; b=WKqUbQCcVSBVL68T7h0tNIjiZWgjnO2hYvlFCjq3Iv3hD2Zy8VOQch2XPrfVHs0tMZmjqvw6UCO5uNAlZNs556Sy778gkGN4MA8+3RYyWEUeZQCZ+To2XTYHsOrIvDctAHD10fMobngrucvVXomlh1xFfJTVf8HMT8PF87RnZtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182224; c=relaxed/simple;
	bh=r93Jb+RRci5KjslpMwSwutEV/c/USqhXg7qpdeh+1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkY+Q69qGsh8x33WFYnwttcFaLj2D0/jJQjCoLmCGlgMF7HAEU05IsuEwFJ7bAkMDPMzP4tKwx/9F265qFbOzTdNutglQ3ZaTR39NCrTbsSJWlA8ICXtUDMzxRDBXUx8VIB6A16cTNdGTkuZy4WQGMRTalFMuobReRFhQGH1O2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fiJxWS7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxlxO/xl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fiJxWS7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KxlxO/xl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103Jn3688170
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=; b=fiJxWS7mWMIDfILt
	g91sFCLxVy2KL/tEDQXC9/KK5Vs/jGnUJmIwqATGJhJPOt1UFlROAYz3Ko9AmpYC
	R34G4d4vxXQXV+FilDiAAwlCeh8csRBcM0nJhb8MYHCZvwL3Of7B0qcZfWBmaktZ
	CWzBf6z2m+zc20FLVKor8izYBP1GqPiL5tBSov4qi6/dUKGLiJ7waA3wW3mKeBDv
	8TwlNJbZrpt0ovzRE6qLx7pEwY8Rd2DetScUflkg8We50s6BmlHTPGdheVkLhj5T
	Ib8vhpfSMn0K2Boa9nj+jZplBTFK0LLtbGSWA7hzxjTNVamCWE23rJSL1wBSxMdV
	0zmtmA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfjmxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:37:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d62bb27a1so6568725eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182221; x=1791787021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=KxlxO/xlUnDrdTtPKn2oZ9pgotFzbzmLq8heYnZXsXGBabibpm/j4znkY4bjNtgzpC
         kKTYjx8o0eNulHj9otWGwFTZMAVxwPtNGKPDfjmVFzW7KlWs0uKi7ypTjn/BvxWA9nU6
         XxpOT3Ig0aohEsxyl6AYCsP1c6qjRtfbvem6sObfmnJbF7WKmNFWcocxkoNJ6blclrgc
         nyfWyehFh1hUZnlt0YU10ZlGCwvsy2LNVkBHjEg9FHYvy8fS45y11JSpnR2nUtIoCOAR
         q8ACIKjkoxmag6k5aQBfI7eYGAFQS9tE+ewHZOZk/iZRogeI1NrdK5M6umX/25R6sZDt
         BKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182221; x=1791787021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=K8+PSEhFvxim/WK+z8AJk3m/hg1gXcYNlsUFb1i7eckHdNIUw763WAapkM2YupyYH8
         wPc13D5Xj4naBaDJP905WMq5H55KFQ2BNWFpHdhJk7P6YYZlOTRbaAZMfPSk2ctpVPym
         tP28Df4PMIvR7Nprx4ioFbkn2WEJ1qzb2pCwVJjkvauV63B1PLuOp2ZgaXOrwXR0dQ2d
         i9JnhfNkfFtLWzlc0kAC+8Nv4b5rVyE0gDYBeVvFmvCh2o2ckp4sOxgFmE5HNVBIP0+U
         Oo80r0QCdvhb1VguNLcjAiD0vE+El/YW40BWHWMztzr0pgHgPgaJB/zBnMD3ABTvdgs9
         BIqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnQsVsIi9gOkMfxlR+hC3F6wu8BspJ8hdxoihzIx5uR0Kxf0KDVC/FEBHtzWYhucVZFKXoBDw38+Yayjk=@vger.kernel.org
X-Gm-Message-State: AFuF++m6YT8YUiM+3V3b6pbV2LgwvmrdTAfBvG4ZuGGrBAz2nCUg7LgM
	Se38siD+JtMiVcgP/GacsGAGjxsqQVyaoNT5ZUax6GbS9fiHE3svc/0lVIpEHzWf08gK4WSSg1M
	RPLmnKzzmjJlr0+RNuNBaCJ2q8arMyi+nb3JPmqsqM5mMAhw9B8rnxqqVAwnNjO6ZVz4=
X-Gm-Gg: AYBFou3KlKQO3BXSm0Rwbibm4CWPEKWOQD7eEwIRxRdqeB4y3UsX5RHBdWERPYOIdig
	1gFFYLxV8QoesIRTK60EZUccSrz3pwJdZ6O9LrNLjjbeD78BLefubihvYBaGeAkLYeU+BuNJTYs
	xHZd07c3LICL4AoTJey7XNVxaG1MPqreJe/f47v7sgLoffFkBucpyMitWWCRfWCgpY4O8BN/5w2
	TCbXfVZ6wFWQoQEoEUCDorv4hXJAnbiGaEy6ubT22LH0sfiSf2MqjHSaISLkYuY6tAi+y/7QE6x
	B3bw9i+HmTaItq+YfLUNjnagsjAON1X1T8BOdurMstC9LqYI5K4E1TR/Iqy1Lf0/7h+H98oB/of
	R2jTueDevr3Yy1MX8vQkxLAWPz/tRg65dzFnUzFujP8zkdCO4EyM/J0U0b+sNzvS9ctfbgEzw/t
	2c13cYM+oQsxPY5BhUF/OKAiiv7mF1
X-Received: by 2002:a05:7300:ae11:b0:341:225b:d6f with SMTP id 5a478bee46e88-3511167b095mr9141552eec.19.1791182221258;
        Sun, 04 Oct 2026 23:37:01 -0700 (PDT)
X-Received: by 2002:a05:7300:ae11:b0:341:225b:d6f with SMTP id 5a478bee46e88-3511167b095mr9141511eec.19.1791182220622;
        Sun, 04 Oct 2026 23:37:00 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:37:00 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:06:27 +0530
Subject: [PATCH v4 2/6] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-phy-v4-2-b04c4123ecb3@oss.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
In-Reply-To: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: RAuSCFsgM7UvT9O9GNg0GmbyxqGARqAP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfXyo09o0jAYFkZ
 TaUe3JPcQHyC5ikUq/fHu7UCkQ6sDhsiLKPGj0Fcv//MxHKx0xyX9y+uUfy8ef1+K0myVwnTgHH
 Abah8hr4ny9eJIsyEnN/PHkD8cUQ1oo=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac3458e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JwZr8aepJa0OdLIFGX0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: RAuSCFsgM7UvT9O9GNg0GmbyxqGARqAP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX9lB7Vl68C+PM
 hQznjCcudNNI9s2YJHBdjjDXVx2mgU9fn/fHd1VTqtNyXgA0/ByNRMnFYN/juwr86pfc7hEVk0+
 VVbF1XOKj9Z/HZlpJ3jzVTMQBlCQMiSLDMzvYJOWlDcKJ1gMijnfxjBQZcNcqzV1y9WkXtmlvVW
 x8zFdBJna4Kmf8R0H0Kk36Cpf7h/V8RnvxZNMfSmIely6714+Yv+IuLM5Hgwr5v5Upk/1RSqtZl
 ZMMvIxFISTJf3TQw3jdyOUzieMu9z87pDabbicvU2JIpYasengGbtG4IWN2EFkX9mc0Zz9oEf45
 mY4DE8LcACUIDVZnhSLLOJ9CKb7S8KVPVpj0SocTLqcwnEHB538H8EiH+dtubF7OT4omdswOXER
 tDVW6yLRwZbUFNf/HOOtAZPY4CwmL4GHsEJh6uX317U0hxMl2EgNPJ0rudE2FG0W2xneZmAP1Yw
 B6lJz6avokEluQJJplQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050026

Add qcom,ipq9650-usb-hs-phy to the list of supported compatibles.
Unlike the existing SoCs, IPQ9650 does not share a generic
"qcom,usb-snps-hs-*nm-phy" fallback, since it requires its own
tuning/override sequence, so list it as a standalone entry.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..db00f5a99d80 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -15,6 +15,8 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,ipq9650-usb-hs-phy
       - items:
           - enum:
               - qcom,sa8775p-usb-hs-phy

-- 
2.34.1

