Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422508;
	b=LWvdh7yvRGQXEtprpJDjD92fT3JO6v4tCXkGdNWJp6nOLtEh8v6ryJZKmvrd+m277pgU
	 MrRBJDksPMHWSHpM0Mukj3DpajAvwHSISl73kAA9Eaz181p9a2MCMDNsCaMRqlhLOmZz/
	 j1eXtvzPBU52G8aLYIXzqOSWNrPu9Qc+WswsuKfSgTC3xunkCQoa8GEuUrE6rGfbIR7Uf
	 fF48ZPLnMhDkHm0gZGX3Ft5Ni934QCNQQi/gdhkhDQ/VcsDWB9VHn1jXpzLD9zEfJupv2
	 OnIPgd+Bljj9/MvxGueGkAhxnbqKA61lbQyKcjvJKfQQG+AbLPC9CBpn4Yfu/gdDThg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jg/KTHFOBtwtde44/snwUiVpXPFhDH7Xp3dRiaUBRFU=;
	b=zR/1k0K6JxeIZ18QKzdX3I7f3Mfn7WTns3Tha4bXuHGLlJ6l11U29wFK+KKZM1RrJgR6
	 yUYjvdnVJyVSs5TgftIOqXMuynADEIZJO3cD87AxU/RbpX1nJ5YanHPlcOVL5tgEpTicI
	 AMjSoXC2Wo1sGlETKDi3x0D7f7w22MWa+tgDREBZY7EcQxoZo0Ji3EK1iJR9rM8iTYFfs
	 VND9jAa9TLaXQkHow5lQTkuOQJ4Edtn+Ar72wO4wx3PQMJB9WAFdYgUCAz+7AcNf6xQnq
	 iChjhaskqic+7Mec3tzO02a0UOAfVOdURl9BKJgeR3oWAy1LvQ9bscuw2K4K1x/d5Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aozHOBGU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hoYbTMm5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824DB606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 824DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aozHOBGU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hoYbTMm5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIZ7262795770
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Jg/KTHFOBtwtde44/snwUiVpXPFhDH7Xp3d
	RiaUBRFU=; b=aozHOBGUpotbI5H45FA16Ct8GPJHKSwuKE9emudKv2Fqyhuy9xo
	1sTXNLDwL511IwuQDNAe2qeq62JpCv6l9K2hMKOwy4MZozPaVODHmrQdnx34nFcv
	4G+4kszy4GUuf+iyHgaGRkEIiq7Xh82aT4Fax0La/bnLJ3WXavxCJ991n/sc230x
	gmYnl2Y83JDAD0fprztPs0Nyqbelz+p4wbmhQ+YFTL5IWBuk9miegFpk8vwK9eU/
	8AdbRfa0nWOC/2CZ3ohDb9IAJwBMsLVyQj0wMUiMmXmMNHGhUsXbf0dlE6Kf+JO0
	+NPMUScWkU8XerJEXCmOA6Nw+sb0qPTvmvg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0g9f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:41:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso240594137.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794422506; x=1795027306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jg/KTHFOBtwtde44/snwUiVpXPFhDH7Xp3dRiaUBRFU=;
        b=hoYbTMm51oHrqKLO+zbQSVvbViGj3bYiCLYYruxQIJBF67ttZIs5I2On6Qxz95K1CX
         Hh7fwHXoKt2OKRcNs8slKqSs2nESSJOxYMYnDjkb7rVPKydy93WkfL9ZljlTf22CYajj
         yMhk8KTNZIS5DEcktXXijnPBRlAOe9zW5gViZGQwW5AgSAeH+dMDdnxMpDkk3KBUHTYR
         xGAIB6Bk/L5DbkMryiuzpKqSrkzePl0yBF6aCPCHN81ZywpjeXlKvfJG3xW9AHT7e6ic
         KciCXch19v8r05dVuI9Uyh4p8ekKGut6ZrYrJWBBZCVBGOks2ultHnejf13InBZZimws
         yP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422506; x=1795027306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jg/KTHFOBtwtde44/snwUiVpXPFhDH7Xp3dRiaUBRFU=;
        b=CacdDG2jjeoWlopWK6U5/HynmbA5XCN/5cUu78pYJHcWKrHb/8UO7elQv9vRccICt5
         7rDW5Yc7ZKd6ZI2H+S0BsowzS0/FzkJhXgBbWP5bbkWADdsSigFTUGzHUVxejf5CFisY
         sFULGxTcUsYkB+7OuyX63ELqYKRhqQ9VTjDyImobkJS97xGAWz6/y/aE9hyaqWgTN6Z3
         p48UgTIQwsZ+2z+IILU7Yqe+kUF4Gs8UQ4qnDPyioLUkmW7vb2lTl5DkLgDWxsJES+n8
         Wq/4wLGKr94u6g5oDCrzxbQG1tCioc3chS86rbyEFBu+P4u9BpfU2oH6ABnjqhnObSZW
         /Emg==
X-Forwarded-Encrypted: i=1; AL+hErGRw9nyt08CQgM8ekN3zEpMJrYw75sPrfhQd+E1JYpGyZ1riI3c7/UGxQs/U2v5wAAM825FobaRKWZO1cM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O9EzuLxKm1vsFiiFO8PQ0WB2uX1wXGMtQGoMqO9CGrdR+irtv
	E96b9XCLJUMLR7yc/HVYjyC3UEmKv93qrD7gjijuhpjotNsQv7lY0h/g6lLsFlm/O+LJDwFdfZw
	y07HjnCfMqiOOE+k+CXCNHBbxlazLzqNFdffkzc4aemlrSFYC0uLZQzWWGAn0nT2NAjemGWSPIh
	s=
X-Gm-Gg: AYBFou26SM909v6Ogq9sTYgcckpiXYnyTV7uKlpKiMYPcXnEB/7xhZOHVsRTljmCtze
	DV7CVeGecnOVxhgbiMfaLxDRNF2QcjQ80ki6Y8UTanzjQ8PFDVMPAAt3QHvK//tTlFmXw/nQ9jY
	jBGaG0TOn9vpnrd5WEFFQiwfk1ZuYTxSwNsfmmzBmjClRc1gLnB5Db90KqKTwpmjKBHS0sUIjf+
	muKie7rrxD4VBXqNQJC5YlD9pTOces+1ART5oHsxFrjkrxTxLRZ9TR7bsDXLWp34LG/gqTED8kI
	BtMD0MgX7CiL+HNy9vkcEEXmt5BNdx+4klldY5XmOZG6mNZAkzNpCiih3BCVJ4OsUuAMBvuvezg
	J198gJ04VFgQ8vNwN2OK45IgSM1g0WFjWiGZcUjw7PsoQb6Few19/bkvODs6CrQ==
X-Received: by 2002:a05:6102:160b:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7d4fb28a79emr1229657137.15.1794422505632;
        Wed, 11 Nov 2026 10:41:45 -0800 (PST)
X-Received: by 2002:a05:6102:160b:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7d4fb28a79emr1229645137.15.1794422505132;
        Wed, 11 Nov 2026 10:41:45 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm7705105e9.10.2026.11.11.10.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:41:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: example-schema: Show example of dependentRequired and dependentSchemas
Date: Wed, 11 Nov 2026 19:41:40 +0100
Message-ID: <20261111184139.205114-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2884; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=gyLLVdP+Ex8SA/ryo3pBJ0ZHnPJrA+/PevPf700KBjQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9LbjqHENkruDW1hjWni3IK1CvXaIsF8NN/joL
 JyAgqVlpHmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavS24wAKCRDBN2bmhouD
 15dzD/9I9mzq+MaPTvPb/PJz7fBrPUS9ipgdI6QddKep4z/xAw54j1RHuxgkOmqBLwDgfB6C6g+
 sED27F9gA5DM1L7D4kOnYEDx4bt7sQ05tfvh7slEMZKDk9fc4FEdo54R163O/jP9PRj0c4jri6D
 qRQq8TKFs/B/F68nv/qkjNtxeB3qQMtl0PaEAiACOUzvQNOI8A6e61l4PDxs8fgZcfadCiKBeyy
 RBPtqUZ4fLmGrjpQka34i8rXegFUwYRUNn0gBQXsFOWt1x9AxZbB1uwnyGnL2lLjvJb5UU+np34
 S/BMvk0YCyRHzx4PrfVdk8zkToVZ4xx0a5mDatFdoXWQZqyyRouWfdEKBQ4xOuwofnv2EFlQuOV
 u4V/E9GZ/5rSd5F+Zp+jvpEvrnUkx40uedrh6B+QN/tLMSCus72cGih3dGqPmHJLQoiYRNNBnpg
 4+MlA20g7FvcUsjTIj9gRsraFyCFGSrWfyzhAlh22RxXdXoTTznp2dk4VTvmVvHGe/vp3tjXKe7
 TqvYcT9SX9Sdck1pYRebMuW/zM2KOvD7jvD9fD2WIhsH2730aXx+MRFKB4U8HQyjiTvJi7x49YP
 1/B2Uq+QPB8H7wM2U/5zXU/v23DzqoYi+QiUdr+xyOyRT0MpUvskP5SW6mqKR7SLlSCH9GX9PY+ vgORrqLhGDw+xhA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jy_-4FFSgWeDj1TZVzxwNNPR92SYGCYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX3DvmxL/O/h4/
 bi0QrbhR+5nf6gqregg24xhWzGIwz46PMjO1Z0lLbbS25JEAuwa6NGvHzrOJl963g/jTStzwEKQ
 Qj4suDiRkyfHr713MZt7SAj/PZ8LpNW0lrkt5BFz6EwHL1+lp8ZKzTu4KILwdtDQQMMpS8JBTQ3
 0Y2RlhzXccfpytL9ORYluWqvwFfg+WDTHc6MuOobS1p7rTCbFnb/HbEILOt68asduRYTTZRkbu8
 SNahQ1cFZZlhSKrt6yVwcyWSMrenQouzxB542pSta3/S3gxEq3ysN8tVfcOdbiMOLvWbOtrd4Qi
 saMFfqCTVDy5rNd69j11kAeNwCxnov2l5fn1s56W4y6Bi/I+JmwtDRh5JBX5z84a2eD8Wh96oov
 45pOHUqi3ZsgzeABzrIf4GyDw+7iDDndNjVm/LjoDojF+mGgqannfFhhRC4hkyvHrB4b75/pDTv
 Y6IghBfXWQ/qYfYdyrw==
X-Proofpoint-ORIG-GUID: jy_-4FFSgWeDj1TZVzxwNNPR92SYGCYu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfXwdA3sTyk+rXx
 66Tdq+mKG0YgEkpat0FT/exPyLEOZ4f8iJhchhpEXcIDrBkJa9uqVXFMGoMnA212z3CQ7TMPXfk
 rsROCrENZksyCvHkltNOdpjVWxA0cZI=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af4b6ea cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3XJjmg7gPLNQuPhX6QIA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110074

Document example usage of dependentRequired, a shorter and preferred
form of conditional property requirement over dependencies and
if:then: block, and dependentSchemas replacing the if:required:then:.

Place both after the "required:" list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. Replace existing dependencies and add dependentSchemas

Changes in v2:
1. Use clocks/clock-names in the dependentRequired, to avoid conflict
   with existing foo-supply constraint.
---
 .../devicetree/bindings/example-schema.yaml   | 33 ++++++++++---------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
index b04f3cc4312c..801677a13755 100644
--- a/Documentation/devicetree/bindings/example-schema.yaml
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -202,8 +202,17 @@ properties:
       compatible:
         const: vendor,sub-device
 
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+
 # Describe the relationship between different properties
-dependencies:
+# Properties might be required only if some other property is present.
+# dependentRequired is a shorter and preferred way to express this, instead of
+# "dependencies" and if:then: block.
+dependentRequired:
   # 'vendor,bool-property' is only allowed when 'vendor,string-array-property'
   # is present
   vendor,bool-property: [ 'vendor,string-array-property' ]
@@ -211,11 +220,14 @@ dependencies:
   # must be present or none of them.
   vendor,string-array-property: [ 'vendor,bool-property' ]
 
-required:
-  - compatible
-  - reg
-  - interrupts
-  - interrupt-controller
+# When given property is present, entire object must also validate against subschema.
+dependentSchemas:
+  vendor,bool-property:
+    # If vendor,bool-property is present, the vendor,int-property accepts smaller
+    # set of values
+    properties:
+      vendor,int-property:
+        enum: [2, 4, 6]
 
 # if/then schema can be used to handle conditions on a property affecting
 # another property. A typical case is a specific 'compatible' value changes the
@@ -238,15 +250,6 @@ allOf:
       # If otherwise the property is not allowed:
       properties:
         foo-supply: false
-  # Altering schema depending on presence of properties is usually done by
-  # dependencies (see above), however some adjustments might require if:
-  - if:
-      required:
-        - vendor,bool-property
-    then:
-      properties:
-        vendor,int-property:
-          enum: [2, 4, 6]
 
 # Ideally, the schema should have this line otherwise any other properties
 # present are allowed. There's a few common properties such as 'status' and
-- 
2.53.0

