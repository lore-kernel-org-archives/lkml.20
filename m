Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5510648A8B7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045277; cv=none; b=TN5kWeBISesq8Z2K0+GMQbMVsPSdFi5s3s2lyRZ7ZK7Z5+mmKk03RUlKyKrRp5ss9Fv6C75xMKnkK7yLuDPjfm+u1uXvkuWLHFGOwo8rYP13J9WKNQMgMCRpt45qbTPMmYZY+vzeY1Yb7BhSSIBFhYTMBQMVv/oxeDNYEBp3l20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045277; c=relaxed/simple;
	bh=LC9mRgiYkzTZ2U6TbeyqAk3KahVEL9js5PsQVWbvhA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OxFKhVmWh2J9A6w4p/Ene7gfGZDzkMflhajTQCGmfcXyEeRjKoep59/Mevl34wbsWiVexFHrs6qntrjacEyR1Csa32LYWiWIdI9XXVpP+7nQJeMn1FGAV/Lh6345oNPvqlyhAsh9YqI9rX0wFStZnndv9hamVlmzwAM2G+7qcv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCvyfCQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rr0eBuXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCvyfCQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rr0eBuXQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7h3R244653
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVJBTgr37Q4yEUm2p6q7VSV+p5wOBSjPWPCp+q7El5w=; b=mCvyfCQXtZJyq348
	ODy5xXFurIYF6Hyc3nz2MKKpygNb3CjPCvpnjY4QNMdD3yct2SBXgiRkqYQwxSA6
	g+9a8+ihNiDIu1pqv2h+Ls1Ue4pBJtQt+GsT5EGETrUSdzQKJWtGICbHvIxx9xqt
	zBt4DHIlnNHFHdtkzEcQnEgjwIhMyKxu+Bo2ZJ7yQ4KmAW55T+DC/7JZ3PUKeZ3n
	8J9eIHg3/OnK1bohwQpjc4OnUITzpZl4Mq8yV4MMW/kcWkuCk4mHi0A2c2CMWYJP
	4JmiC+5/xmlZmo12wT4ZkjkoxhLGJX+xav5j8oU1S5CMNNznOLmK3M6TKmRHa7Ai
	eaDB5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfkywn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso97770655ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045273; x=1789650073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVJBTgr37Q4yEUm2p6q7VSV+p5wOBSjPWPCp+q7El5w=;
        b=Rr0eBuXQK/5T6BCoA4cMTiW+jqTrhRGz3HtLxWD6ZL/NncI5wfRyl+TiApntPZctxU
         8UpJV4hiFOQq88lyd/SesPH1xTL+yrhxqr7LFruo1nsD1uzyPM1BQRZnKBLQjcPjI2Ct
         70GB0o/r0NBae2FdBE3MtEg6Mzv4wYt9H9pg+GvzNqNLYJjRqDxR+0wKXVHfvoAAquJM
         RQdkYfnUEQmdSlZwluETEqheW60JXe0BhAY9GJYJh5uPhxNTTX5r/DQwAlokll2ifmnT
         SfPXcR0v9FIC0pGY3GCU75znJINSFZe/ZW/DYIgO/xan0rXXwcF5R8BkkxkzPbaghvYm
         6nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045273; x=1789650073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVJBTgr37Q4yEUm2p6q7VSV+p5wOBSjPWPCp+q7El5w=;
        b=F8KvfwbDlQaPMlKgwKF1IGY6NPJxaBnwqjcccoCV5X5ULQ3+8HDyQ/EtdQYTlq6+//
         QpsMSleIBuPR2em9RoRA1pL2rgXSiSqrFZD15X/Y4MA14JOkxqvmYj87P0STW/BR7Jvs
         NJGsAd1N/eoLpl4LYy/8u5cU3VbkejTYDXS5zG4UeQ0H7/xT94HxRHFuasmFWyuAhHzk
         UFCITE6QCgxEQrj5xGe9uB8rWx9haI0CBrh3a5O26gB7/AoHN5j2+uvbRo4i9mBle4WD
         ljmUpjQ+Tuur/6DDtFW+G6ZuahRi+lKHij5B1R5uVBnwKD9N9oquKubYwtZ4UvSywCUM
         vL5w==
X-Forwarded-Encrypted: i=1; AKwUvBzxfWmAEnwfMYSARl1PmBEA4VAthBZW/26Yk16wqT6arU1f1WX+448YhHyr+he5Fjlx9ETGIKjRLsMRGeg=@vger.kernel.org
X-Gm-Message-State: AFuF++mT8s96V/KdARdt4Ym6jRF5cAMBkDT06c37e+8Qq51Dzac4Bq68
	VZCyjZDHDFxw8BEnzQvC1hmJXDf4yIg2AaK9Y+NaxNZoO3R/POl0vNrJkChjCn0oJrmjZ2NIVZx
	hff0CSUqXikkNwjc5Ngq8y11X52+ZAbqyXAFD6kl7brvmVaF/PQWq2+Z1qfBr4o1mVIY=
X-Gm-Gg: AYBFou1zt/9Ul4a8I05nXoVYIryT+/FIoNW4XS167WIMMspTrCIXgvMLL2MvaYt7LuU
	Xynu/AbjVcqJQlwKAfiMh7OiIVHm7pJ+PNnEO0bPzwkGbYS4jdkc1A3Q7H258OXNV0YN0WbB5yY
	vgYSEa7d3IT4n3N1saWQQO+Ca4pJpCWe+iZ5g6Nka1BowUYyVa2Xd6Sp0fEQOEzyimfHssi4jzT
	MyQhxY6FkYSeua3DsXbdbxg2hkQbEXpkLXrAL5UyQouss/T1la+RJVVHofQfKr4hS1vZB14s4IH
	SX1hJDhIrfNKENlbbt754x234UoOnQ9K4WyAcmSBl9BIVZic3h6JzcziMoEZW/BWc7LH+1LJEbT
	9yvFn44XKrq+DtAieKzPkzXwi2QVoZuzB9Mb2
X-Received: by 2002:a17:903:46cd:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2db8dfe7322mr175297925ad.19.1789045273114;
        Thu, 10 Sep 2026 06:01:13 -0700 (PDT)
X-Received: by 2002:a17:903:46cd:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2db8dfe7322mr175296835ad.19.1789045272576;
        Thu, 10 Sep 2026 06:01:12 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b9f0sm88424805ad.20.2026.09.10.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:12 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:30:43 +0530
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add Nord compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        zhangfei.gao@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX6tQidfTPwgj2
 oNdbUxGlgvXEQdsunVJS7gXA2ZaVaS7VRf3GAGfn+H+lqw8DKEl8/zQ49APPRMZzBoFP0bfjdJL
 S0fKqCO9FOtRO2LP6DdWMOWH8XOMWeA=
X-Proofpoint-ORIG-GUID: NjVTpXegpdCGQW3-a4BoExOGMrkW7g4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX5rpj1RxwXS5e
 Bvywe593zEL9rqPXonLgLwnLdOo2y07HdxnN0dDvudbVbr4UU4m1IZTHAJfLwLFzvkoWyNQI8rT
 nxd/EUkBLjv6hX7InRKxJVUN8nBLT2tCquo0lJB62skKAzg0UJG7sFjefgWHE9Mek9IFpZ/gppo
 TWO18v3wQc8vpHTOeLET341/l+w9dJKadHmMK9Q9YW0Xsx+zIM7goxppQW/PSlxSQb3P9dAn32R
 RLUcjJWg4iDgR+cJgVPH0AJgGVvTiX77ui/V1UpVdupYGPFoCdXnkDxvPX/D4WKL/TV76Cop+iv
 6vo+EiiSDHY7w8Nn223YR5EQA6T5WsgrrW73Uyn1djeo/Ph8LWs60WZ8HyX/UoUlxHTJj9t/8I1
 5pE5W706jbAR8eGouRRM3QsiqqnQ/VqkzQfSjGQ9eNxq0A1V+bLSCNf2OGf1oBuv2VLQHElf8nG
 EPkAYg4pUC84uQpAxwg==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2aa1a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Nsn_4hRXuT6My6vqaXwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: NjVTpXegpdCGQW3-a4BoExOGMrkW7g4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100156

Nord has four DDR slices with four MACH9 LLCC banks each, so it exposes
sixteen bank regions plus the shared broadcast OR/AND pair. Add its
compatible with a matching reg/reg-names group and raise the top level
maxItems to eighteen.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 55 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index a1340226a0d0..2141e5d4de63 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,hawi-llcc
           - qcom,ipq5424-llcc
           - qcom,kaanapali-llcc
+          - qcom,nord-llcc
           - qcom,qcs615-llcc
           - qcom,qcs8300-llcc
           - qcom,qdu1000-llcc
@@ -56,11 +57,11 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 14
+    maxItems: 18
 
   reg-names:
     minItems: 1
-    maxItems: 14
+    maxItems: 18
 
   interrupts:
     maxItems: 1
@@ -355,6 +356,56 @@ allOf:
             - const: llcc3_base
             - const: llcc_broadcast_base
             - const: llcc_broadcast_and_base
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,nord-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC2 base register region
+            - description: LLCC3 base register region
+            - description: LLCC4 base register region
+            - description: LLCC5 base register region
+            - description: LLCC6 base register region
+            - description: LLCC7 base register region
+            - description: LLCC8 base register region
+            - description: LLCC9 base register region
+            - description: LLCC10 base register region
+            - description: LLCC11 base register region
+            - description: LLCC12 base register region
+            - description: LLCC13 base register region
+            - description: LLCC14 base register region
+            - description: LLCC15 base register region
+            - description: LLCC broadcast OR register region
+            - description: LLCC broadcast AND register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc2_base
+            - const: llcc3_base
+            - const: llcc4_base
+            - const: llcc5_base
+            - const: llcc6_base
+            - const: llcc7_base
+            - const: llcc8_base
+            - const: llcc9_base
+            - const: llcc10_base
+            - const: llcc11_base
+            - const: llcc12_base
+            - const: llcc13_base
+            - const: llcc14_base
+            - const: llcc15_base
+            - const: llcc_broadcast_base
+            - const: llcc_broadcast_and_base
+
   - if:
       properties:
         compatible:

-- 
2.43.0

