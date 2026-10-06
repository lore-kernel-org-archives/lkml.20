Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD98381B1D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264580; cv=none; b=fyyUfEEpjqtvQIlPpwbdpmN6OR6/n0BzEufALj0awBdEcKHgW+kqHOVbK44PfiYH70okrMdkfiziTGWhnKmJw393DQW9dGK55zM9RrBMsdzRlIJN6mKxE9pZJ24FEwICglsf8wYbUmBxOyIcE0TsMklppBJOijV9UQuNlqEtJbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264580; c=relaxed/simple;
	bh=r93Jb+RRci5KjslpMwSwutEV/c/USqhXg7qpdeh+1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3vqqjOKG/teDH90TpQEvod1mp5OI5jZJRuWjupyp3PXmIv/mihzAqzYN+avVRIDqmgtHre2oUB9kwlgIi1uTtBTMPEoaTxlLd8tLG9Ai6wL6UJvbTU1USuLcUOCM5h6OMjpXSdRMeV0X9FhiWwniUtd17juozjLZxHmdDbTjGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGm6v3Xs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSewK9pc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGm6v3Xs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSewK9pc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963AEnk3649356
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 05:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=; b=KGm6v3XscGWir+j+
	DcdnJdkShndEyP1ZHB48EdljHIb5VD52QKGo81YTB8IzCjYkKm61PAUWgrN/07kt
	e353mJfs6EfrsVq9/s42R4SuCN+BmnJEd/2i1BfJQRo3mXNbiWU/OPUai6pr01LR
	/curnycN2Mo27itGJhIUrxmqJggUVQ3z4IZzr4RWk4DuTZZgAvkT7bTjruYPDrtd
	JAk+qyhx5rGRwG7EEDIdj+6VwxmDKlNZbC9iq4vjWkVTkgdmKUX/ycSkT54iQnGa
	ABLzU7bRAYugZR8l73BTdAwwrhcAU/pmf+E+X9rfo6QGyHkw0M9g+O+FuMsiTSTR
	yxWmow==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0a2cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:29:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-150efa76c57so2790308c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264577; x=1791869377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=FSewK9pc+hsutgD24aTJqQtkzA8A3z09QMXvgIkx1J8K9gqhq1id3Ak1v2Ago5o0xb
         lj8pu7i7DYEB6TLMi0UbH0Q7QNwYyEuQgonlFMDxY6d7j/sB1z0++BHVECfdO/Y9DeIR
         qGnnUTATtJd9vaqyAHKQfTkpwMFwtKqDzQxpUrC++NYQdA1tHxp77gNgiMcyaQtpeYVa
         7cPMPWM9Iqg5Ge4Fv57DZNCO9jShdCwoKGemOs+GM6rxRiUnV8v039WXgiJAnL/mUJyT
         THYREoLhSW6jlI6MMCAps0iu4j+V2hSUF3XLMcMI0DKAxHbPOBhnjH2/6PP9dwu4ttk0
         SqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264577; x=1791869377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=JlbbigEl8r1w3FfNJCaMRhtcHzn7VPnAprK3zXh+U9Llz9Atl20OpTC7ZzHu+WSRZD
         ahNydavnY8y5vfVRQqwA4AIamgeCrfoT8CFFirkyjnAWTCDccGeIWUfKtTssUNEmwwTv
         XamU3ozm86QxGmiGGPGMc1aYzObUbzCL4rG9/QA+e2Y3wO7UtvqEfCCaQx9LJXEjJd2p
         MItCl+yLtRp0Y/uf2+aQmZ/7t8xsQ+l2ghcUx9zKQgC3oE2P12HYt+CNl+MO3e8NPiaU
         a9qfqSTSg8TDGsqtr6uDdPUGZn1u1N8v9BZENWgPwu9TOYo0EmCdSOJ1z9VpieY+RmtJ
         CVOg==
X-Forwarded-Encrypted: i=1; AKwUvBxoUZY19JZPbl9CuXQ6izu3z8rRvV4Dy7ZssloxbJ3iRrMzDKXyFdSj41xFNUBl/vv3+Qp3EAeQo6yYBrU=@vger.kernel.org
X-Gm-Message-State: AFuF++nSerInCvD9u3DVLgB5YsIyWHUp/HRl+aW7cdOFXeXQUxltQDZC
	wGEuP8ada6t1j8yUlP8FWO2f1gn2IeQH4eOUZF3jnI2GrY+upz1zZHEYiF+Nb4fY7+8JPROLgJY
	L0AFQ4/of12QxFovvNXpQn2IUGuVGMajirNd/s0U/nsRrEAOepbcsBHKuZ89CBoTQC+Q=
X-Gm-Gg: AYBFou1id6YuNR6rispcgpgCMeb9Xo9GMFnBS1mAaWqXWI6Vr6vikEHJrowg26qSeFD
	5m2O1U1/lxRSK92Wox834rryCm5jx5n/XRE/BI/evQaPrfAYNi4ATyw0smuiUP3L7Mv7JVkexQt
	epS5WsF7+3K+W8jb+G7LJUoOr6MgHwbftdZMlLeuM90iMWZUhflO3ZAXJFF+igdaALltGRBsdwm
	8dS9s/muhZvJ1mKaLxBEscX8lijB8r2Y1P5mI6RAm6iMEDl+6O9UoMO9TKwSspsfSLXYosLRQL4
	umSTt32RGLALH+OyIXr5j3J/tQ+Ov+iVRb4llCpzOByfgOSuFX8MKDBqrYK4OIbPL7eN69EZNBP
	buIUrFFmbZ4oqEA5C6cArojz4zqmkXtg3bVV1UTtFF9Ms+xOlkm78GuOXWQzwhOXzU062nT5595
	ICCHvO2/GWemQVf1CHVjkYd9gUvlbm
X-Received: by 2002:a05:7022:f902:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-151c0b1bc76mr13208128c88.4.1791264576470;
        Mon, 05 Oct 2026 22:29:36 -0700 (PDT)
X-Received: by 2002:a05:7022:f902:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-151c0b1bc76mr13208101c88.4.1791264575932;
        Mon, 05 Oct 2026 22:29:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:35 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 10:59:16 +0530
Subject: [PATCH v5 2/6] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-phy-v5-2-cbe9330a6449@oss.qualcomm.com>
References: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
In-Reply-To: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX9hS5Q7ZFF5l9
 hnwQaTibyBISZZwiNk6F7GzcxSXMDvCChr7DyL/KPgXps4fA6LiBABdEltyj424aoASSn2q27Zg
 S+Xk3SaoUNW3USXYFe0UkD+CRO7QXCRTvldTYZKcanBF/CeBZWxwQjzogfV5eZqvtWgDd3T1Evz
 9WbmrAjnR7sAymiAMNSVJMLEC2FVZDgAxPTTCU1U3IkSTDoXkTVgqQoi2mYmCVeGPBiGtgf6PM9
 dyFZGfzETn++iBg8YxnmYj77eZiy2ISR9qMIDi5/GiSUM+sPiXpFsk25exdZzIklpUTlwYs7e16
 bk6RZoIHlNUVzuY1GeYHK035Oe8MVfpUFc/aQ5C+tygksEuCQWjcptORoHtAo4E7ShevUB8PlAY
 rs8BE/rQfGjB9F0m4uahQa96BLl8mS3AOnn/WYJbaIY0MNY3mLK9Ly67WPMUQhRH+GuxjEetL8t
 guA8w33jCUEVZRJGgTg==
X-Proofpoint-GUID: 0IcG5toX36VLnrcLIk3_fS8wy2Y21raY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfXyYYkXITc/tVf
 sipA8hRjNB8bYrORKeSqMgiVLwoj2jJhi/mSmFfImNAg7p8tfVEAgjeENOx/24fKI6s07Kz8Xo9
 PFept3jdAz3gRb0tpMpqDyB+oktrxKw=
X-Proofpoint-ORIG-GUID: 0IcG5toX36VLnrcLIk3_fS8wy2Y21raY
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac48741 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JwZr8aepJa0OdLIFGX0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

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

