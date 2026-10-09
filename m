Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F9F3B42D6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521420; cv=none; b=r8JtnP+kMR61hQsT6GEgH2zKQvFz3ZtqO0HixwvWZ6dt4I/T6G+tBtL+Q7+sf7fm/LJqqawoi+z5cq6wnYKoKhJkC6LcDg64VUC6bDjCRrHzhSypYYaBm5tERhdlL4kkLKs2kwa7k5XDZ2rjeCt22BME7YD87dZK0wL69q7Q7oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521420; c=relaxed/simple;
	bh=r93Jb+RRci5KjslpMwSwutEV/c/USqhXg7qpdeh+1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ti6qZg88dMLckLYrx3dyJKD/OKOZ2AFKv6M5DIgR1yM2RkGW1xiQ/SzFhCq9l9Pjz1GtTlkKgDbnWYi8d2/jGD/T8d5Kwwn+j0tvHVpHB1v9jurDDZPFTC0JUGcVjXAGEtLRtBLr1pjjuwR1ZzLxggm2Bdtt+Mmv0XjNMiP2SdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8b5JH3k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnB5xblt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8b5JH3k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnB5xblt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HFpq1712665
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 04:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=; b=H8b5JH3kdUFu3rX3
	J1/WlCwX3W7DcbIX7TRwNpgbs61zSdd+Ee6/pxzXeJ/BJt26+rYQy17RzETjGJOi
	adp258z45EwZ/Fe4vTZ8Ve6jTKAGvZ62a4LGgurdeqP61kGchELtZ40GoNAnx77P
	XFiAk5yekJlOCyIdxQVFYdPo/JFrjAStkpVRcIH6qxMqw/i4F7LlnojPkgpo5Mo1
	EriKd2AFdmb/WaCvl7XPTJAXAFcGDe4xMU1Z1fDcz7bZ4MiV8fO+UcjnzXCChe+Y
	aXVee2jt7OXQtvmvmZtx0whMw75jK8gPZo25h3agEWZiUYBTbGE8Kvet33veqgnZ
	JkxzaQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxw9xqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:50:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso1145610c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521418; x=1792126218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=gnB5xbltBrg6vSi5UrnUpHuOhZAfzZaW4xa5MV2o7zDpsvgyRPuUNP/Odac6VGazP2
         Lpi/5yww7YuyyeAGH6VNQN4BhBmcnzkVPm5R6aRplsn526RYxf1GBBIyde0cSDUo2NK9
         kljW1NHB2sNbRBgbUc+43Isv3c2pmQiPid+cG94b7XVHpLvMDEt3+JLS0HoN7JDljQeC
         PkxVxTJ0Ok5ha7EcaV+w2y/cHrgLFqVsuGRXauaP1l90WM7Xpb10ETD8piUptbCR9R/n
         UnptOnm73YuR+3gH66KgjUd0WKnmya78NHGBL8z0I6HwhxY3adKZjv558Nqgv/taFKrv
         w2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521418; x=1792126218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=gWl2jcCzQtMBfoS5VPqm3KeEZMxIfiCapqkgqrNv58qxFy1gvwjDOMDxIROKZvXCBe
         ZmxryhpCJ+fkg81uq3BHhXLgqkNUCSkcbxcSWI9qR0oDj7uBxnb8phANwlNlf1Y4NCSW
         Loh21oiyMj7CMcjzJBb2aN8bHv4D6T7MVDXcyMurliJGqXsdRCkQqz1z0Mwjbkb3w/4s
         nMpsvOI3g75pEqGuBwDMxxzF9PDTkL7pw7fbE9/fHPH7nzv54+2G0ZXlAUqji7ZjGGvc
         +Kdyf7sLaXLo4GbejmVPb6FzpgQJuO6FbwucDPPaAw+v2S5RzKA75GBQGpQvwPYO9E1G
         lQeA==
X-Forwarded-Encrypted: i=1; AKwUvBxs482NOxT4OHE88y6hBj9zt5Nr/N1XRwvMO5+12JBRsqXcumQFLmUHLvQGkOz3oZtOkvOZtq0UI5UOqM4=@vger.kernel.org
X-Gm-Message-State: AFuF++k4XRskTafyobvckMFftA1FdvQtRFeEv1CXjEZAE1vhfn3ACiiB
	PgkPbR7zvdhLVQxjffNTVyRe88/Cf+jqr+1C+9/ABA5m4lqqRopfkKi6r/NzOuq5j10e3NNZVg5
	J/TRB02zi14BSqKAeAJ4/Uc9dXH2VLTCYAnSZLOQiO4XJyhkMzz+/rDbKgK/oBWXvQ1o=
X-Gm-Gg: AYBFou0YmWfeL6L/YyGx+a80irPq4KoNXB7gYKXW/Jtd19h5M0rriI3Glg9h9oG03e1
	xRmapSK3Rc6w8o+i2iwpxwO4iQI3YlHzuNeLvdnC/wuUd/AglFjP1edVd1OXJE/wpFK+LbnJ405
	pHfhZvDccDqmDQ0NjDCfQCaldPAkCo10ZN0fT16pPBeoba2h8UOghmuuU8nMapl8qrEXYRpengh
	Vc7evr2Gks4FZyFZ4uckdZj4nlEbejAMvfhr2Vml5GumX8duZK7CNN2ahKoDC/3Yb4Rki5p1Z9a
	vDtKJH3hy3KDk6NrNxK0EFLb/AtsDp9MK8w/XFMSqBxml+OHQ+kZfN4B7vz9/dqU0hhMVyCWhvP
	ome+JkAeoqEPv+u6y58otVhAyd/VBfnAOn//sxBTGdaNKY358jd5Fd/n5PHaYszGtfVDEdG39tx
	YXiPMJoa0UgAZIIv1jXmxXziKfXoIlrQ==
X-Received: by 2002:a05:701b:4314:b0:166:862b:9bcc with SMTP id a92af1059eb24-16a5f01dfb5mr1176340c88.18.1791521418086;
        Thu, 08 Oct 2026 21:50:18 -0700 (PDT)
X-Received: by 2002:a05:701b:4314:b0:166:862b:9bcc with SMTP id a92af1059eb24-16a5f01dfb5mr1176261c88.18.1791521416787;
        Thu, 08 Oct 2026 21:50:16 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:16 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 10:19:56 +0530
Subject: [PATCH v6 2/6] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-phy-v6-2-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfXyBvVk+rfwmb6
 v1nJ1DZrXAkcfVK5yk+MBWs2eA2OoCpe8fHKJ//Yl6KCdQkNAIjMHUhxqpxdd31xF4yXx0DlZVk
 s3V7xxhAe0Bp0vPM6NNPQPkXYyF/ce14akKHYn0jgdEhf8ur09PnkGejeRyRg0Nk8AgMcI6kc+d
 jJAmC4FXVrpLO1SCXouNEfWY7IO7H9gANTSwr2SOtYc6NFPocsoM7bmgdotSdI8GhslRf6KkSNu
 yrtPhXEWR1JSMiVPghQYIwokq4CDciC2dEqNAPt8/6XivDYawKMeXitkVsFC701SkFwv0Q9Wak9
 Tn55c7yHEDS2Kh2X/caU6TGU+nFeHQ9w6/r22mcr+6CRJ+C8ca1vc99QP9Z/qxEfvFYsr5jheZr
 mS+kdYuYLC8UWR3lSqTlYwZGdK6j6FixeWhJW7SRUukVUwq6bT7VBgj5igORtrNjhWXPytL+Hvl
 UYlLqndGEYtP5D+p6+w==
X-Proofpoint-GUID: q7HmtM-rbZY0X_7GJhpbbNVQlxh7JtFE
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8728a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JwZr8aepJa0OdLIFGX0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX1uiDVxvOldis
 TQWj10S5nl7OG7VUKqPfZHnEhoOZ9IW6YcVhnluEjkd7+CbIZxD/srV3ycJGcHo8kU4Noekn42b
 0729aLDmb9xd4+HdNlUAQW4vLMZwAWk=
X-Proofpoint-ORIG-GUID: q7HmtM-rbZY0X_7GJhpbbNVQlxh7JtFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090019

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

