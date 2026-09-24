Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C4E4AD4AA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266338; cv=none; b=cHZv1b56wt4fHMZvBlC9Wsx9VQoZnZseN8pyje507syYBNxPQRmfbaBcX80O/Knsq9e60LiX0phHgKwGWL6TE6fgbZqjnlgTsN3t9neBr2pcJr0QV1YSXHryhXyFw+TGP1a4kjoMZ/sGBjDULoW8x2BWkezqvpmM3j8oLOM6sCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266338; c=relaxed/simple;
	bh=nFu5cZyJWfYCZQqJSD1MA53aV1Ql8TKSLZDCBHA0S6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2/FXEQCgeFLzzb7oO5hzjVj8MFGZQgZ4cpKFMba6owU+QHCcSvXziSrfpQ+pZbNVMC4aUIp8nIyy9y/SAIY5811bh8VA0RR1c7Mfp+b3PXeVFUkTxW3XzL3r5bq21PfyxzLXh1x/sQqUfpUqsBWg1xJl8ZHrRS+8Lf+35QoWpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oY9i4VQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3Z28Cpg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oY9i4VQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3Z28Cpg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeudO3220540
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wtr8nAFBmhA
	G5ZPJSvNGUOY/BVd0Wfn7M3OeN6XL/Kw=; b=oY9i4VQhZvH7+/N1hgVd1bwVEFM
	duRiBpxxXX+r4zzax/P49F83TCf8aEekqhyZJY40ITQrntV39eNX21sUofYPA+wr
	ggit7y3v9jHh1cmbYVJU2VPpF7HDHLKlWTTdqhHGGKHA/iZ46rVPs/JRC11qCEWF
	ynp/4ojMFg0A1BZAkj44gLIw6FFootcHgv+uPbfMdS3B5mvzaeCv+Kgyn7+Ctg8r
	uuZMxM4wjI3c4Y5X/qSIDng39vgUDNVbTSJbRURU+MkUuff+DfOa3zjFmglYRv0k
	0gw6TWYJl0y8qrZu16BDyZ/jMjauvaT6roL9kp2uANOmaZEv0wDagLGeRvg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s91ghq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:12:14 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6711a336db0so84145d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266334; x=1790871134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtr8nAFBmhAG5ZPJSvNGUOY/BVd0Wfn7M3OeN6XL/Kw=;
        b=a3Z28CpgS5pBUPDs497NzUt51LFiXHdfCe7h+lvPlEQnfGqaxGI8IOCq/PqIW9UQrs
         +U10o6Mv7ZmLm2uZJb2jF/If5CQ+bYpzKavsd5ELxaJ+qbTOOQofxfGmgl03O3YsprqY
         amcDIftVCFHMIHwjjYGcxcaAyQY/deOEKKjB5HEh8dL+SpjUrG7HRDhn7DmPyvNEhnvh
         nwfa3ysTRKwUerP9z2eVK9oKxfw/kYvurfak/JZTpGBSZUTbuK+3OyrxdiE7KuZ4jHjq
         S2e75NIQgRn0xeOP3tFHNFndobhY2zJPTGVyamfaohPVQ0clLjbLWQfKjv/t1T5YR++x
         SaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266334; x=1790871134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtr8nAFBmhAG5ZPJSvNGUOY/BVd0Wfn7M3OeN6XL/Kw=;
        b=BpCRW49yONiH/tacJLTBGAc8uxVh+pIaHf+r8Ab0shTFql/n3Icnqo2M7FFcYxw8gB
         O1l4TLICw4dybXP5UOXQ5EfMv10YHHf4sYsFtK7KFej/jcUh8FvSJCy5SAnBM8v0tW3i
         3CdeySMynxFxPQ8kN6nidB3tg3MLSxoDpDImSQ0pzA0nSRSkcbXgKy4Mupazudypj8VC
         Ba2xWg91gSRyZp6MuZRHQPs1znZ+kueRwMHCcgynjcG7GgfiZo+BDdMpS/hmmL0EITCg
         PiJ0ThRs1Bdemje/c/w+8tZxhkyO78NPkED07efz+t4chRyoUkUdOWPcffe9QUZ1XQrn
         O8RA==
X-Forwarded-Encrypted: i=1; AKwUvBxEECDmkSDEbgIsOXlSEKmZovXImwClOD3u+IVIGD/uOTZgDKMAkbBqUWYPR+tHLYmzKsSSL5orAaLoFu0=@vger.kernel.org
X-Gm-Message-State: AFuF++k+3En1DwwJ79wayxoFBioWL0z77jRAqkLaWAyyNFJFUco8J1nE
	Mt5Gc4hRpXDpf/Rg5YYIGHbxrcoZUZ4fry3NaU6OuIeOhu/QyRfUnmS02Z/5al0xDdMcuF/H+rC
	hXt11qbeyArXapjvarqV1r55i40Xjm3ftAW8LeQrSWHtx+O0b0JwFv7lsWEYxRZ80QiM=
X-Gm-Gg: AYBFou3r9cmaGW9K4ETxGp8phfQLuqS/bisQisO48tiVuHkaktONVfnSAI02pKnEQx6
	QSyrHgZtltfAg8dpqhwfQyDYlhioQQEzQz8lETfcvUl7IQiPmzAZtGQ8VzFLDD+8IWvwJmtzRWe
	Qf++/WZXC0tbEICGRjAlAQJkJdNJBfWUCzT5uIeWn7W1DshK7sUa0p1k0T5MReBaXmrZhcGf7OS
	VIncdVhnOCQO/i/tHjdTNRxgrzAwnWie99Fvc72e6W+F3/TRRTQ0VNNvxWzXWrSCayzLL96JK1t
	QN9dJu969kvdSUuoC0OayPjrA0PEBWDH/j2058WUySTCFo6D37NrcUhVtRP4X2/27hl9D+J8oOR
	VMCwXR21a5hdNqoVCHk1WnoAww6LSqZ/pafmiuN/QL4nKolC7JXuzmmo1L2o=
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1794989d50.71.1790266334451;
        Thu, 24 Sep 2026 09:12:14 -0700 (PDT)
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1794935d50.71.1790266333703;
        Thu, 24 Sep 2026 09:12:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91425cd8416sm9698296d6.17.2026.09.24.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
Date: Fri, 25 Sep 2026 00:11:50 +0800
Message-ID: <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX6ZVi/h1edAYS
 BA5T9lA7wlmbDpoigbgKwFb797O5L6ZcWWL8WizQxsgJUlQTuJ1hHYccmnzdXNv+d3cE6CSvx5o
 flnONEVXhb7RKWkb/ftl2O0ZOkuIrxfbgo6lIgpIk7xP1HwFf85rwN13DY247+kwca8f5e1Ztgc
 aMU017IYYlrjwxfihUFT1jUf8kMCqxJ8oz1oleEkwuy689OgrX5thCAuFSSoDSoQGnuKcyWxjBe
 QkaV9TFlXnhJaJ++mS6K+X1YbD8pvVUfSYNg0/ellNYKCpOD+JXsGRnBKq17epUfNCJNfqEZ5ko
 oVDvQLbn7jtwCZQmD7SE0ARAYwfHoxPAyCJpKcSOFyV+0zpLLXjpKlVnM5BrAwDRdbCDIkPOfCP
 JtewP1zeZwk+TXaPXkvB17k6ttnMn8ENS76dFybLGmI4JpZ6vPNPglmOPHS5lz90+HNOoFzZE+b
 ET0uSQ8XxxmvI3woHtw==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab54bdf cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3WhL5buBUIyFYQ3kjXcA:9 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX/CkzSZ4gD8Eg
 vh8vvzPUgZnsKG7e4UDBDYOH2ysTivx82f+4yI8DYvS0ju7Tov5dDT3MvY1Bc6WsSz9IbF8zaS5
 abJ1sKACzThAI0pWXHXnaHijzfvXL/8=
X-Proofpoint-ORIG-GUID: ieLSOBZGTj25nSUmwiEgZAFGLdfacEgp
X-Proofpoint-GUID: ieLSOBZGTj25nSUmwiEgZAFGLdfacEgp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066

The schema describes exactly two clock inputs for every compatible it
covers, a board XO and a video AHB clock from GCC. That is only true
for part of the drivers bound to these compatibles. videocc-glymur.c,
which handles qcom,glymur-videocc and qcom,nord-videocc, and
videocc-sm8750.c both declare their DT inputs as DT_BI_TCXO,
DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
DT_SLEEP_CLK.

Because the schema stops at two items, no device tree can supply the
third input, so video_cc_sleep_clk_src can never resolve its parent
and registers as an orphan clock. It also documents the second input
as an AHB clock, which no device tree using these two drivers passes,
and which those drivers would interpret as the always-on XO.

Describe three inputs for the Glymur, Nord and SM8750 compatibles,
keeping the existing two-input description for the rest. The sibling
qcom,glymur-evacc.yaml, whose driver has the same shape, already
documents a sleep clock this way.

Fixes: ed9ca8296147 ("dt-bindings: clock: qcom: Add video clock controller on Glymur SoC")
Fixes: b190eaea5780 ("dt-bindings: clock: qcom: Add SM8750 video clock controller")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml   | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e985a450451d..9bd746afbc11 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -42,9 +42,8 @@ properties:
       - qcom,x1p42100-videocc
 
   clocks:
-    items:
-      - description: Board XO source
-      - description: Video AHB clock from GCC
+    minItems: 2
+    maxItems: 3
 
   power-domains:
     description:
@@ -79,6 +78,27 @@ allOf:
     then:
       required:
         - required-opps
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-videocc
+              - qcom,nord-videocc
+              - qcom,sm8750-videocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board always-on XO source
+            - description: Sleep clock source
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Video AHB clock from GCC
 
 unevaluatedProperties: false
 
-- 
2.43.0

