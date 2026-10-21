Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561799;
	b=US6k74FguOqAJh8pKO2jVN+1rsCDgQA4MQ9qbZnTZg5KPcLhnDEhNkmI8V+QEWIoZxLG
	 FW2wdHeCJaPvxtRzEEV5C+pP1mFeUWMA82lOdKNX4DwJwlTS/DvA9/Ub8x4ePIysaSltX
	 b+mcoBJxtU61jWnMCmAi8+eLUgXM4rcWuw7s6S6PckgJlA9JNKUJVhAzQjM1aFtgTcCFq
	 hE0PVSefg1Oe+zaYeTbTKFxp0yirjMxYR4/lrwRGm4GnIMu1wiCzVW5vMFZn+8mPtvThG
	 Yq2FBF6HJmnjMYunGEG8DZTBkyX3HIzE/5zR4YTTfRa3e3MjB1VPl3aEruUyj7R1hAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561799;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DVD8d4W+YFzudkPLzaR7+6xOk4Zd0pVxOH27B8rVB1Q=;
	b=3kDc329pjJ0pQ8wbTu8k1MYf1FACarg5XZzpJUO5PUF8+d9SwIPPm5z9LiBEDKBAZ/w5
	 FevKyGBstTEbrtuZ+niQsrisyLBok7jl97pIPa6U8GaWXYTL/upsDJPmUh6ML6AfNzVk3
	 reDJWU6o9QsmbCIHp4mHqOldD30UXFCaeeHPzPQiFMNw6MT7PM5vuTeJQaFejFLxdk4p+
	 e+PybXG3A0pqg1+rMdIKuYLHfeJIfHZPxriZ/XcMrzHRJWPo9x9lul8M4jbr0B91F7Go9
	 /EAbXALa/zRMzxZvB/7G/QiiM6YEhz9v5vh4WbW1332f1sXCnL71TWp8qYA1uDLfSdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUPXRecU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J22EuIoG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE53B606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE53B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUPXRecU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J22EuIoG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jIdY2848123
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DVD8d4W+YFzudkPLzaR7+6
	xOk4Zd0pVxOH27B8rVB1Q=; b=SUPXRecUCl4EaIO8e30o/xA+RFO9NZeneH/2Bt
	xSt73f2V97jHbY18bdCaFaanptJsXznqY4/Q346Ibckr3IdKAkJLC0GR5tgXjwMS
	YPzFbz/Fo0dDVZk0fqt3b8uXtAtLQXvDc6nQDN3DG6I0+NcWGQ+0Yp9EBnj95+XO
	6sTjRmUCOFJUpphTRmjREHQ037MX6TqrRwJAuqacBY+DZo/Po5KNyvMYCT9uBJU5
	2ynWlqJAnOgcRfhJbhCgyxl1NObES00W4E/vXCaax7NgzXV7UrBbPPaTQeS98MmK
	dvNneblNBOHmIWwc7PQzgOithcBbB+w0DYPVh99S8VccUiAA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99yr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:49:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso542041eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561797; x=1793166597; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DVD8d4W+YFzudkPLzaR7+6xOk4Zd0pVxOH27B8rVB1Q=;
        b=J22EuIoGn6C7l/duMJHQ8mexu2OMXDufJgmw3+FruMDHGoAYVhT+q8TMwMEG5UVoZz
         HTwfOUEwluhS3sNZWWFSO+qviAhUVWeYzIB4lQSpYMVVJJRX91yIcBe4Qz6k9vYRduHL
         PBVjYwmqcXuq3WY6prZPwsMaUE3/m9niDA35DVWxsWasoZ65TYVNPHlrle3k6Lx0Xt4K
         oeigBmb944cuJzRf4dtfDMSW2PlruWBT1lduLOOVy2zn8vqWIhspY2iMWXFWinwTePpp
         XdUuMV3+rnm3fEuN7Fo5/VgLsmPDGTX89foiTMIPjV7FQXS/XqVjo/4Qmx0gQhzW8KlR
         TQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561797; x=1793166597;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DVD8d4W+YFzudkPLzaR7+6xOk4Zd0pVxOH27B8rVB1Q=;
        b=FQtp4hUuxEF9kCra8iVChlwFY4XQHc+r1kO1YeyjaOM2lUJG4gnvJoTfxrtMLlMJVv
         zyRezhpfUOK3HI1AeGdetZXiY1XVpGanxdcqEK14JStu0kHt/5DPdEjA7ShQTHdP6t0f
         Mxcul/KGVyjw0Puai4Uun13dX5X02MnjeGdXzDxqkqHX2vcQPknp7UJ8bcq32D1M9JSv
         +4qKDlwNu6nEiI9L4fwIiKdyCiuzUCri4Wfcnd3TEGP3gSFlf1cb4nXq54Upwdcv5bX9
         8Y9if6SsFdqq90s7BhlwzRFxE4YYSs3t+/2MiP3NDDJ9/Y9BU+YiNPLOYGKc8k45CkgW
         r0rQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+ORAYthRLqAWxiDZd9WtBlu7KxiZSmMCT4/jsd1vX2HVRcOFf69teUG+QhEEb3Mr+fZcC7yqhMLFKHvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeIy482rZEHDrEjEJce0qgUqhRKLObp0CIxZFZjpgSdWY9+GEw
	stGG4akVEom0veD9X6w+v27z2dJlfl3DgPNRFuv4nyY1zsu8ZHlx4f8mkLKyncHfzpUPn5j7M8O
	5wWrsbMRcHbVeEFSCMTTs/5732o4cCout/9C1wREEg/OCmG7z8KMxZChJPSZdtM1gJyA=
X-Gm-Gg: AYBFou06JSjeJNkT3i7rNB7YlBwQnn0l8Zcm+UiORtMWfFa8xZNZEoZl8GsYoK/w4sn
	F7IYwUVwAtGNEnfl2PUbMlIbz+RUnolCZJMTq36fotdppG8HOGv0amQJfP7alFfhIwJo1vALQXd
	ie8OutZClo3yTMEDj+5qiJ6JE86DEg2IGqVoEfet6SvNu4P3d4baPAluu6FsR345b6AU0+L6RtQ
	xZmY7Wd0a+HAYQ5Mkk/uaoxiryfYq5HLnVX1zKhJia9i4lAtqUiwN7MHmiFnSU5KnUO64s5haZA
	eueyXaqLbtR5MtWIf1l40O0y/J/emYbryZUcuJS+0sm+BclTyvhHqkybMEP097krmDQU/vvoHKT
	F8u2wD+1pedD2yiB2W+2rUV8CImS44KScgoOYCClfT2Sv4v7J0RZPFwZN4PKnJdhFm/pVFn4eiW
	KQCQhFqRRRop7YTKmL4+WoljGHfm+YUA==
X-Received: by 2002:a05:701b:4284:10b0:165:55e2:2d69 with SMTP id a92af1059eb24-190a7380f2cmr1440617c88.46.1792561796403;
        Tue, 20 Oct 2026 22:49:56 -0700 (PDT)
X-Received: by 2002:a05:701b:4284:10b0:165:55e2:2d69 with SMTP id a92af1059eb24-190a7380f2cmr1440593c88.46.1792561795812;
        Tue, 20 Oct 2026 22:49:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903b3d0530sm3656464c88.11.2026.10.20.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:49:55 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:19:44 +0530
Subject: [PATCH v2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 IPQ5210, IPQ5424 and IPQ9650
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
Message-Id: <20261021-ice-v2-1-3dfa8f343ceb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHdS2GoC/1WOMQ6DMAxFr4I8NygOiAJT71ExBDDFUiElCYgKc
 fcGmLpYepb/89/AkWVyUEYbWFrYsRkDqFsETa/HFwluA4OSKkOJmeCGBGGb1zqRaZpkEC4/ljp
 eT8uzutjSNAeZv5ZQa0eiMcPAvoxGWr24hErCEejZeWO/Z4sFz8TfwwUFilQWeY3FXXUJPoxz8
 TTr9+GMw4Bq3/cfEASndM4AAAA=
X-Change-ID: 20261016-ice-e1d8ba304436
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfX5huJcB35ww4o
 CnMLi5OZVezC2XJZuK6WLVGO/g/q9HzB0/quxmrL1FO27rpy/p6yT3Vfzc/uVOLWzaR6ZhqFnUI
 +ruec0X4yKjjJcRLoqQm5V94PR68TTI=
X-Proofpoint-GUID: tZfq6XWTeT4wvGR6FKEP_tYTFnokEDzP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXxXE8Zu84rHs3
 tYfriRHgXwYO9vpAYm2hUfPt9EXBQ/fXgN4QlVngJx4u43W8SZEGDhqMOigILy3UwuyCxjP9MB1
 UESftO6MIqGVe6/vXxd93IyeK7hZiOyccGI5NXj6eN8lugY3UOnhR/My0S/T1TIOCy6DvOSSvdp
 /OR9iziDfmqXEg5TW4bfU9m67lEmyougGYG+m4RwosnKkrGe+ymmvOB/gilpWJ1mpi7O/0wNeyh
 zJSZU63fmiYkDstSf4BHc86HKxNEqenK30HmRMns4SgDnIer8zVSV5Tyhaq9b7fVVFYj+X7IpLW
 9O4/NAYAMMkDbA+hLdVmiCkBRQRKmz7gEbYAck1K0HSJ3CsEO/wiK3VxDJ89+4tZn6ideDykYif
 0ayuwLyTqRfdaEKLtRzieNmdCsB1d4QS6lX7b3/fhNKnQSLUc/yEQ9Ndekba+unvcJ4KdRivmXE
 vKBmfn4j2yNk9+txZzA==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad85285 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xq4CliCqeop8EqABAtsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: tZfq6XWTeT4wvGR6FKEP_tYTFnokEDzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210022

Document the Inline Crypto Engine compatibles for the Qualcomm IPQ5210,
IPQ5424 and IPQ9650 SoCs.

Separate the power-domains requirement from the two-clock requirement.
IPQ5210/IPQ5424/IPQ9650 require two clocks but intentionally do not require
power-domains because they have no RPM.

Preserve the existing requirements for other platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- Fix sort order in the !power-domains block
- Pick R-b Krzysztof
- Link to v1: https://lore.kernel.org/r/20261016-ice-v1-1-4098b1972f31@oss.qualcomm.com
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 27 +++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..b98c4c6b77f0 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -15,6 +15,9 @@ properties:
       - enum:
           - qcom,eliza-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
+          - qcom,ipq5210-inline-crypto-engine
+          - qcom,ipq5424-inline-crypto-engine
+          - qcom,ipq9650-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
@@ -81,7 +84,6 @@ allOf:
 
     then:
       required:
-        - power-domains
         - clock-names
       properties:
         clocks:
@@ -89,6 +91,29 @@ allOf:
         clock-names:
           minItems: 2
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,ipq5210-inline-crypto-engine
+                - qcom,ipq5424-inline-crypto-engine
+                - qcom,ipq9650-inline-crypto-engine
+                - qcom,kaanapali-inline-crypto-engine
+                - qcom,qcs8300-inline-crypto-engine
+                - qcom,sa8775p-inline-crypto-engine
+                - qcom,sc7180-inline-crypto-engine
+                - qcom,sc7280-inline-crypto-engine
+                - qcom,sm8450-inline-crypto-engine
+                - qcom,sm8550-inline-crypto-engine
+                - qcom,sm8650-inline-crypto-engine
+                - qcom,sm8750-inline-crypto-engine
+
+    then:
+      required:
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,sm8550-gcc.h>

---
base-commit: aff5f30d65bddca7e5eb635119057688e6c04135
change-id: 20261016-ice-e1d8ba304436

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

