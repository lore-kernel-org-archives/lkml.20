Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E532479873
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834922; cv=none; b=Wx9bvIXHAOqJNTH8sU74ajcMjBHQ5/+l0RlIVcp13gCsxGoNgZXcA048Isy6XbIEfQwZq7s/LZwvAKuwLPwNhfKjV8YNgedwprCJuwSJHYEAqQ65gDwCFhmOsHtDT8muKvgUcI45DwM/Pe3umGeGtqMuX/aNmI5irHbxse02Kc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834922; c=relaxed/simple;
	bh=EKISGBUUfR2T00G1oUFO8B5JWeNXQjqvDxFBm53oB1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=blchW8F3mB2UCs8Xk4jEaaHkKFCSC0YlShJzRY/U4N3W/A22CDk8q1UCQPxgWxBy0rsYwccMh0Lnd89IEvaEQnSfu8EjqGoyC8FLrMzFoFBp1n/7r+8WdYIct0OAQps9KdTxxJKRnIcn2MJT11koB93GJEC0GJOjuj62d4Pd2Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAZb5a2W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eX2EvcA6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAZb5a2W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eX2EvcA6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gpu41090257
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 06:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=30Jdl6JqUqExlNbkYRrVWI3IXB2MAdHLsLJ
	yVQztsQ4=; b=aAZb5a2WT1ujq3/UmHCBkODWRjIvyLCNAPmAknyQ1PEKTkj2nze
	bFrNNSGpXyIBY9VgaKUtWTksLF+dT7JywDE5FCeb0lvS05Q3TVtH76//nDFuOtVE
	psOUhIcULvKDTjAoPqdmBSauP+Jfi6Rz2cY/DYqVly4yycL6g16JBPislVs3Qn77
	7RCluYFx+uz48K92ca6SZaryHwhzEtU1qZHj3LoVBRslAVJqr2rIv0CNaCod/ivc
	il1LCKk+4L8B1/ZjI6NjjfsRGJYwb6ucCJzU3tjpEenBP7Ec5EmwQXuVayDWb4Y4
	B8zKZVN+AKNH6thN9psCN1fog7kwNbUxmhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188st2sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:08:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bf4c0af4eso122432685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790834917; x=1791439717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=30Jdl6JqUqExlNbkYRrVWI3IXB2MAdHLsLJyVQztsQ4=;
        b=eX2EvcA6fDoDgqVXHGlrM+Jh6P0aEeIOHjniJmuv/I0gHPAsVmgWInt1Nu/BEmn1ub
         L9UPHZRv3nCm4RM2QhewUsZLBU9yLXXumO3p+irdFlmv4C6SYDtR6MQCgH2KTGJFBBea
         YS70v5nVMMnvLPxm3uWKQOEX+MMfemaL8HoeLyPoBFo4f+b/EDNHo8xNUOgyHNavPj7O
         3PleGRIfdFfbDR/ePqjGqOpG9zrjHuiKjqdzUWJiCjAHCvLfyVqz6S4ha4kG7/k7vtRf
         oQbKeT/ze0IfnQLukdqA9UbR7IP1Xdh6VrRKnq89vlWYH2LV4FRzh5iCBDbtgl1D6Go5
         70Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790834917; x=1791439717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30Jdl6JqUqExlNbkYRrVWI3IXB2MAdHLsLJyVQztsQ4=;
        b=nxPEyBWjlePzwMv8UTcoPQdz9ee95UYOP/OgIT0jdXonvlhG9QVLxmoa2NZj/Rj98i
         5SMm/QMbSEUx56MBpO8vpZ8WGGGt4sUwyv+FRqLJ3hUjNcUp/0LVA8mfmCxSCZi997TU
         36psq8CdJUEz0jSfmgKUW9ehOM6sN3gG2YA2V4LQ5PiaTckMeCH/6DHYbA38Q9g25sf+
         ke6FU5U4NJnV7QybAIqEVIi7vZuqgFc4qFbQ48wesRljlc7vA7r6qLdfzmVfNHcZ3ewM
         1htL2HrmNq5YhBbO8+1xjXKkqPoBuSEv4bZJBNQ/qBEw13yH0eOVbjIy97aqp2lx6rYW
         6yyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx401V2Jbevlkd+4UUtGtudFe+7cdJHyd1VX51b2FmhVDmsqJKCUeUQN1p3qwHphgJKKWwaeYGgT8XEOIw=@vger.kernel.org
X-Gm-Message-State: AFuF++mIc6OtanSq5hkA6YTBbh3Df0LDgfwiQNTIVG0gmpGGUXQWu+ve
	Q7O86Mxx4mlqmkq8ALptjVMHfKR8km32Z7JNiXR2x4JgUqwP1NsMNkXQGl1CFMX0LgMGHhyiZjs
	fK7aolRKSNV+8JKNfiXZeCmRout03AopAFw1fyedZZPQVal93liNEGivI19XQZNHjBBPZdVfoJt
	M=
X-Gm-Gg: AYBFou03x/LBePXIahkBjZ+sUm4rZbXdCXBXBlX0rSwS3azbmdcOeoQRzEfflOfp00l
	c0D7eNkAWYSf9gzr3nm09dTXNGzyVrrxyUnw5DN5976EgQWAmozj3hc9J5ZrVPCEQGaJ4PkfUSL
	A3Jq3T+03oRyLGUEvKUme+6qpdmxRb21jQaa5wsA7DWM9Ad+QwFvIj6WeF2yXks7EhId7rkPcFy
	NTh24G/CSsy7mSfHY9Xzjn5XGgHNyoilUFWWG9ERifi3n1R07tRf+GxNRz6X0FWCyaFGZ8WY7rD
	TsW81fEs1hkOKpEHtFYnwyoJOSvAjZOcH6OgSt2oU8Ks2HxrsBjmKqer+6BlyZMFWJxzkAWD5MW
	0P9uNdbYxei0RSGU=
X-Received: by 2002:a05:620a:470a:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93cb56464e5mr384548485a.2.1790834916855;
        Wed, 30 Sep 2026 23:08:36 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93cb56464e5mr384545085a.2.1790834916367;
        Wed, 30 Sep 2026 23:08:36 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a022619b42sm6316525e9.3.2026.09.30.23.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:08:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
        Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: can: renesas,rcar-canfd: Restrict resets in top-level
Date: Thu,  1 Oct 2026 08:08:26 +0200
Message-ID: <20261001060825.53335-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1417; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EKISGBUUfR2T00G1oUFO8B5JWeNXQjqvDxFBm53oB1E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqvfjZPEQDW0HRJhcKDjtn+70niEdskRCFnDkWq
 fa0vMc6loWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCar342QAKCRDBN2bmhouD
 15s2D/9VCFFdVrnKQhXM+zRwcwvmq5yxk0g9DbBg/mEg+4hgMmCb9rYnxbdldXBshulD5bvnpN3
 tfyq9nZDuYawCej166ua9X2diCl1uI2AZHGh+jTFWLcd5iFYI1OTM5hvaU7TxqFSdvGX1y9B/kF
 nvCJDCC+qTVTZOxelHp5EoA93XyGOI3RdlHiB8RmgwKcBbu2R5fn3Pn0bG3sxsbf006oKHMVclt
 G9LMDOFrNuPn21v6f1hcJYQ/BtN43dxIwuyX2AM4725YGIeFDkILd1bZiMrwX5hMrXjQsl2DJi8
 Iu9uegAKjtWNnTC4uiPVA8PyvJGt08LgjJS5WQEd02VvV6GhlvsQkSw1ExO+goD29Fa/0VFJpAo
 x6QQL/pjAa8mji21Vyr0WEyv2EiYtOW4Ah76NLWK/B/gzdyovJNvjMe1ZbXhRsTktgXHlGCs+Bu
 RMbyfdY9SAV09YyrkgjSWwMmv/SjO3YsbBlUeRiIBNdpg9vwE6D25Er1Kn2ovjWidAHKy9HmMd5
 ODpSdPcDJgK1L/UddA0gFhW4sFiUz4KlJ9HtqS2W1UTj+CZQu8hLeJEvkSTVfz9zTXZT7OUZL+S
 oLDjVxkIN2O+m0CQ0ucOHzz1XTSU8KwHTtQi/HUa7HYFwUbAv5EB4+iVmRCnaxTjtq7J1IfeR4y jxKZCR4LVFV3NfQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyNCBTYWx0ZWRfXyWjVT8VYsBp0
 o4PmHCeVYDmCfJF0H7KP61Xc8BxQq/P3wveWZc6WeCVpBySYtxsJJc3OZ5bs9ZxgUlz5r0fq9kB
 oXcqRe3a1FbG5h6A+1DhG1wKgWCBz50=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abdf8e5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=aMQYPRUqVwEaD7bFCZwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Gny6A_fVEWrr8qghg3qCPKc9kGH1wcxj
X-Proofpoint-GUID: Gny6A_fVEWrr8qghg3qCPKc9kGH1wcxj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyNCBTYWx0ZWRfX2GBrBSJ/Mcch
 DRK2UmVM1yKwIfUG7ruBYWj2DHnclibBo9tp1wd7gXyRZeWBi1KyiWP97bl+Yc14fcAl5OW758e
 X4lPHxvfQM9M3rY3FVDvouYui+Yah2cVrCkvLZcV76dOMogJ6EDXiFz03SAkvH2wRJab1foH4jR
 mfoGKELAmRxsXZqh5Zdgw+SXGw4MVVxXlLRIYwG51Wmj2HOfQYj5+0N2pRvpTPU1NEbd7NVexZE
 1eHAmp5svYFBBRLNGdp3iGkFgNLrQGqXMxtvttHQ+isl4+sWOOeSSCuOit2fR/zweZlykrAyzcx
 nIv4A5gLhn3ps3Z/UTAwxlwDHBE4byIWKJV166uME0jfz00g9+qri3B/NmnR/MudatfF1nREdBi
 aE6klXbP3KQCTL45mU9JhbiIRfWe48kz4+DIk2vhe/o6cHAevZ6OWrB67VwifMctuCZCoVDPnCi
 e9/MUbey0L6K+bEdg4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010024

Properties varying per variant of the device should still have the
broadest constraints set in the top level, so add such for the "resets".
Since top-level part says "reset-names" cannot accept one item, disallow
it for the two variants which do not use it in practice.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/net/can/renesas,rcar-canfd.yaml   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index b9d9dd7a7967..ca92e1a9a051 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -132,7 +132,9 @@ properties:
   power-domains:
     maxItems: 1
 
-  resets: true
+  resets:
+    minItems: 1
+    maxItems: 2
 
   reset-names:
     items:
@@ -209,7 +211,6 @@ allOf:
 
         resets:
           minItems: 2
-          maxItems: 2
 
   - if:
       properties:
@@ -231,6 +232,8 @@ allOf:
         resets:
           maxItems: 1
 
+        reset-names: false
+
   - if:
       properties:
         compatible:
@@ -246,7 +249,6 @@ allOf:
 
         resets:
           minItems: 2
-          maxItems: 2
 
   - if:
       properties:
-- 
2.53.0

