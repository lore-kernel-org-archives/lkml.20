Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395651;
	b=3KgH5T/7i1I7D2sB8Kzhrrj3FfI/0amo0mOEm5YIcj9GfMDc+CF9nB0dtjmS9GtqeAil
	 JUUYMVce5S9TqdcglGZvuTVvREhb02OZkWpreTvUH+x1yVt+3RKbcK95tT3fQhcVrTtl3
	 aJe1cbl/MIC8BEfCr5SvdWaIHEStWeJaCyBOVF3kYdWjxr5YoUBOZ6HhIuJr2lfuackmj
	 42KbzBCov5UbjxMLgg9UVfMBT4ZMIteLQZnZ0hyxgZO2MOT6jxvjEsepz1Y0uxNe7P3HL
	 jJqSHRvZjjbPy1pBlebYbUds6dCUn0i2Mvsrc/u5evfrfgKKN0q4MedPqzYq3xXCfkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K3Vw6d/u/RIfnHpjzJfVHphLVa5vsCI9milLjWO+GfM=;
	b=2vx6fNohlDlEuxNB0F+78v06rrUTSZ13n4rIS2dIeuENLbLPoaaKm+aNEDwzBLNLKR0J
	 sZPgCakxN84ZdHInAjnsuOADIAKuPCXtm/Mpvb7VESfQFwuMxBt5lmnKjkXbYaguCgVKM
	 HDr9/XMA5upSKMzD4gDrYol3LWqjNr0ORfKLeZ2fx57bFiXc1EEYL5jw82YghxSQ9elYp
	 2QtYlPHV5SsH7W3woHqg+eoFi+Xu9XYgk9zFQEQCnsxwH4fuGp9V4i5m2cOwnxfAjqp6h
	 L9exspigXKfsJ/oi0mxNi+e4Eg4GQtekepovHBf6bjdpYAvt+U5zEWfVt/0dJBxkcRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BAKu0Ew7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESH9GbcY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D126606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D126606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BAKu0Ew7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESH9GbcY
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAukDv1386358
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=K3Vw6d/u/RIfnHpjzJfVHphLVa5vsCI9mil
	LjWO+GfM=; b=BAKu0Ew7LFJsp1O6/VdtoCKdGqZdjLA5PZgFdml9LrsiEoRcUa/
	bZgqFxmMBnQOA5mTDyWGXawPg0HS5/qVD1WqTUGwQAOy45lXdjqzl77tiOvsadsO
	55Qo97IJartTuyQBluUECtYLd0onspL6yXMc9/DjPOKGrWwOcrobL8BNdh1vae86
	15F4JEg0GNZj41loY4LvkrJPs90SRdjMgHHTEOfXh0EUQ1KWXzIlGbdWFaFGWF6t
	9LHIE8whsONU+uDeOZFznyHfFFFLrttNI8mB9XwD3nsoJQ3pcfqPui/bYiVHW93I
	otlgf9iMvyqykCeVBVmbO0CoGef6qKDtEvA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnma9xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:14:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2cb77c7abso344034137.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794395649; x=1795000449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3Vw6d/u/RIfnHpjzJfVHphLVa5vsCI9milLjWO+GfM=;
        b=ESH9GbcY9rf2eYkdXThA/SYVBkeQVYPKzsq1tGv+l/lz+DS6Vm8oVHSLiMMmiqqfur
         gsRjlTh53AkiXJtGenKrIGHNfAEPp1JNbWqZcq+eCshCJlec7x1Qj+ppS0z8cgk2SBfv
         5yIyVcRxNumx1KWtf6ROruSPEM9tVXGJiwR7Z9osspqCWmB6n4+N+wot3Pj8p1Oc0B7J
         QN6Ak/hQOijuAMDx59pG1073+psV9pSt3W4Viq+Fsj60WjVWvtOjYglvEiUOlVuUoIqa
         uqnehuloAmfjbisqEEzNsXdwDIGDb3vHW0DaFwG3yGQ/CSaXcbfs1Xcf3vcg/pQt5TqN
         zrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395649; x=1795000449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3Vw6d/u/RIfnHpjzJfVHphLVa5vsCI9milLjWO+GfM=;
        b=HC4Ss1EEtALtKdoeaIfdv9RvmxYjNsgTnD3scebMPHCACtkAHy/2m53orLrcnLtxzn
         az5Cg50h9zGSaDWFt8JbVe2hYDicQ8Gtv4NaqAexhR+b9gXBuURPwAcryy26v4YzC39Y
         VlBclJ94fctqqo8G6xG9yczo5DFR4j8fR4rLWqjDMJObMFy6V9LaU/Xu4fkyLjVTYDAi
         9gm7wsT6KZ/1D9Cj9JmIu/uMOiD/YOQOmdvKbs9v0RzN78jbr+LdxyR+lNxVLHTo+CZu
         cI7q2WqapHf/hm5wsacSwbJsxScLjJrm+nj9Vp39sktPw7jWkdMBUv/JzlAhaZy2mUe9
         eESw==
X-Forwarded-Encrypted: i=1; AL+hErF4eWJNXiSG4h1phwD3pc21G/CVOCbIn8AcjUdyIVOPRzl9H+mfzgnE3ZauU6J5r54IDSpM170tztAKPUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xWAPvXaago1NHPBrj3oeFKSVRXTl/dQLIB+Fy+KaHeNvYsxb9
	MlofX7KsFNd/vlypxFVDRmnMTSIPtnW2VGIfeDLvxRYxWHDjCTG9hpTkGVxY+WGDyYSwhavt0Uw
	iDg77XcexN3DjqzZx/vjw8WnaIoTQeJMJjpVmAa56HkSdU/6DyJ8CLR81ZNFrOJIuAUE=
X-Gm-Gg: AYBFou0li4K3UhDa0Bkrd2Hj6u0LgbQfoB4AbcRTMPHoGzDPHKFxyofY8EhETJBC/bI
	B+RtwVff9WhjHMP7ENh2pW/l5ftB1sSLtoXjgYNhs/z+CrRLhg6PpbFALfvLZTec2ue7ElWjaPR
	bVW2nfhoQvEpk2emfGmDVax1u6g+niI/85YcdKCEUcLjE+K0E4tsefR41jtnh3hN4hOBgkmz7OC
	r4Qwp7IYikZhcsyrpLa3vxX8HY7QQvifXOhndSS4vlzwXo96wu+EhceTmc96TGmU2mxKwe/24SE
	odjVIp/Z1hXx1CF2BNZeeCCfvff/Vu7Hk2dw1nwzyb5eHrrYY2onzJYBzANqpiouB/bCwPROvYb
	O0pW9TF9Oti1htGfwKL7YbPTcifX0m+h6GPYHzMB2LRTshRr8rw5ITRKq1n+U+Q==
X-Received: by 2002:a05:6102:c4f:b0:7d2:75bf:2fb3 with SMTP id ada2fe7eead31-7d4edd1c21dmr468689137.1.1794395648707;
        Wed, 11 Nov 2026 03:14:08 -0800 (PST)
X-Received: by 2002:a05:6102:c4f:b0:7d2:75bf:2fb3 with SMTP id ada2fe7eead31-7d4edd1c21dmr468683137.1.1794395648149;
        Wed, 11 Nov 2026 03:14:08 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddbe68sm86994955e9.0.2026.11.11.03.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:14:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: example-schema: Show example of dependentRequired
Date: Wed, 11 Nov 2026 12:14:04 +0100
Message-ID: <20261111111403.83665-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VOFvsR8n4ujVMiycRZfmEt9KZiHFAXBQlZakD1jDTSQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9E371Z+5WzBLVKnM+W4mozaM16H4oD7otaHlK
 RASWqGJDiyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavRN+wAKCRDBN2bmhouD
 19OED/0VGeVYuCCyQixBA2tBRzwO/W3g0IpszbkND9U6X0HqOtnL5l+OnssJJUMR16EgEnZ5XlA
 n0ZY22oXJ7VrMMQ4o1IJdSZE0S8tvIHyRWcmYbReeZShKXW4DvG+zsi3lQjJpDCaHywIHm7bc4y
 +QBmgij3EJKOMCRZnwbXcuOEssoBXrYIe92ELMZslrfsjAaowRpruuGMAvGj8mWJAUSh+Ykt/V4
 sjHeS1DpjfkxoTaRyiL1yfVjukmyNkLgkTem+J3duAg9lbB0B/M4KkoKJUaiTPmv3hmDEOKqLQP
 2JnRru7NeBzGmjODwHvtN5KeKbJ5AH5QMwD/2aPie8scMLfWmuGR8fYGwwoFMywt7/yCC9XtpHE
 7LQEG8N/VCRkmSYEejBRbU9QSLDo1asgJAb66T1Alu4kMJgzGMx34eMvp4/6ZnoJvWKfFb78G7t
 jmz66jMNXT1mQIURzcJQBx4NvV042a0KecHjqT8a3+D6S2tzFjNU+uRumvYEuotR+64lGOsMLS4
 M9yfvLv35Vyo12eg0KgIxwV8zFxZhfPt7+bVKE2SaWis+x31zU6JVANObVPk8rxogsJgkqBTpsE
 jIhMo2wq3teb76dJSwCS3laexAZCKbMvkYjyfEWvTE3xoD3L1esw3+3ayOzHouISeZV2S8B9AWB YQ0QcCrIaOf2p0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L7AO_u1kwzZNQntQVwCsGpNNJGYydBA9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfX/c/t84jOqc6Y
 R0+salOlKgVPpHvrKko8TJlw59cAZiHYYgf5ZAa88gOw7HsNHoOfXoUbaXq6cBorQhoGc/9Rloe
 dCch9NpsTjG4PUgPCsnS+xT13m+DZH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfX3U0jOLvU7v8A
 7H1LfMnKToI7pGfLRSF5G2keUhABonLL6doTD9hLfesIEAlQk/xciCyhNye1e/6QuHK7U34K7+N
 5/rq6DBakLR2M29LjwEceGo2O+I0Kq1IhdeJ+MotJd2l/CKOv9IXrhraPm7K6JnWKEi7aE+aDdl
 hkivsL7zPe6zCv2rqX2Hxvs+nVp1N1hY5ZGzrwQeND7fHTuiYohBn+j7m0dNvbcpURzvs3ANyGZ
 pRf6zRKd7J28Oj0NKJMcLFewNca8bbrHAuaO3bcSV4UkocowUyo956BfA/M6QdxyDYLWokz5SX2
 sdYQIICxPJFuuJaMhMwipx2MyD1VNRvnt6XErjFM4Iz4UGSLS/8FLR89wzolsrPwMUHtNQaME/S
 Ro/4qwnX9XbI3tXdENzw83/Ydl2iIUtbUizbfFThWS51DF/CRTosqQLBhIc8nOYhOeSeRxBCoCB
 ucPUQXNdGodF81nJQOQ==
X-Proofpoint-GUID: L7AO_u1kwzZNQntQVwCsGpNNJGYydBA9
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af44e01 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ma7z1CdSWlCHNZC_glkA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110044

dependentRequired is shorter and preferred form of conditional property
requirement, over allOf:if:then: block, so document example usage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use clocks/clock-names in the dependentRequired, to avoid conflict
   with existing foo-supply constraint.
---
 Documentation/devicetree/bindings/example-schema.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
index b04f3cc4312c..a37d10ff7469 100644
--- a/Documentation/devicetree/bindings/example-schema.yaml
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -217,6 +217,14 @@ required:
   - interrupts
   - interrupt-controller
 
+# Properties might be required only if some other property is present.
+# dependentRequired is a shorter and preferred way to express this, instead of
+# if:then: block.
+dependentRequired:
+  # clocks is not a required property in this binding, but if present, then
+  # clock-names must be provided as well.
+  clocks: [ clock-names ]
+
 # if/then schema can be used to handle conditions on a property affecting
 # another property. A typical case is a specific 'compatible' value changes the
 # constraints on other properties.
-- 
2.53.0

