Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5183055D882
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959460; cv=none; b=fmEx2smkZU0HjHddZBuYxB1my3DlKKLBZsZ/VbgvcQLCGPfxWRrRGexVntfmmDJwu4qapj7ADWMH5asEC8ZF9iULv5lrBSADv+aEg9Qs/lQ7leaIWitXHRfZPP9fMDtt/XvgmXbi60RLIDnXcqpdQ/qswiaro+cCWi4jyrAJyUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959460; c=relaxed/simple;
	bh=IWHg3NxDjAQuyvLPrxd0bg+vjcwN4JdBqQLR55GtCQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XF2JPZmRMPvBBIHSlUjXC22R0zmFu1ughr5Suh4Je6s582iI/+/tQt1B15CWS8ZiqEkuxWeCby6iQCOqsO+5KGaIXh01ef9JkPLVjAkbusqpkEfHB0ve2QG6QdNsRkVE3yanm9OIaQhjBSjHB9EIcU8Jobz9/qJOyz3wOI2m+98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0gQ8qgY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GY3OjkZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0gQ8qgY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GY3OjkZR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU6Nw599687
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOoY6mCIop7DLsgHwFMY2E+1AD8DaONcY4sNreB3ZeY=; b=h0gQ8qgYGJlEmNzk
	KlsIgk9rdc6MVh1eMqzOAhKoZi6lcdhQxLYC/AWDb4fcQ8c47W1S6jTFtjX8QiHb
	O/CVQwWt6ZPHeVUcNRkGn1DB4MgM69YyMojMgEypKwUbIEiM7SVC+Jghvjps4kTy
	BfHhCC/4qrY6upCDPrJ/ARJGXPIXgKW7jX1pmm/KhT6lCs0cEVqyuJGtOxUbKESk
	24cQIfBj9vdhKBPhKVoCMWvDl2ahXOgc1GqBPl1RwN5+/4xOJCfouR6+S1VIBLSV
	khtOXwKBqQxeA/6ZuRaNIK3kScC494NNXWRkEowRbGxyebtma7OZihMa26RisIvO
	KugT7w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr22q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:10:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78350646d7eso5121038137.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959457; x=1789564257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOoY6mCIop7DLsgHwFMY2E+1AD8DaONcY4sNreB3ZeY=;
        b=GY3OjkZRd3Su6M6cAZfmLMTZrc0idVO07GlvRyPGOQWBEkxluyaoxih7eev+O6qOjB
         SJOOsLbSXApY+QXqKpIqJcUIl8n+E5x0DIsT6QlUEo5oXMEoKKa13sSrdaOUzTWtbCcq
         weUAHxVoW8M6wYRugAv7cQldb/PxO5kZasDpxtPoH60Pvt0kVIg3BxuxK9UHtKJ0ygRL
         +W0iDe1yjUtDMYXLON4yNYi2Dsq2Fb6aS0HtbYq+WVYeNxZAFk1exKA/UxePhi+XwuvF
         tfRItedoqYzYqihD+VH87DlR/mwcnYF6znp8HqJ04kNFdpRzrASF1wrTycp/WAKhwuN+
         XzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959457; x=1789564257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOoY6mCIop7DLsgHwFMY2E+1AD8DaONcY4sNreB3ZeY=;
        b=hD71tys59s7p1Aq37rHDdD8xN5w9TTbj0dqSF8jRMsUX6IGZpXyoj9zbozI5/pFu0U
         kGC0NT/TJW2imhRWaIsa587oKU7dUwDDsFxFa/oUAtzxMICUtdlDvj9/c8WqmY3cTOuC
         9sdUPVLom5Z1ipdZfjQvFsnCpeRIVyDzmykN6KS41IIMrs3GRgXmckVYUNFpVS32gbBc
         j2wuI1USZqZfzt10FWsaM/AlJtOog8laIc/F1OJI0yjNsavn14m9cZeCohZcgyWX+6R0
         hfHSU2nmOjuHShXzH3kdJ4Jb4gw1Tpu/iFJhXEkH1nwZdlB84cR/qMXeyz/Y95fn61eH
         BHWg==
X-Forwarded-Encrypted: i=1; AKwUvBys8YACDrWYvBfWI1Qu4IJq0qC12yISXxpYVbZ1AhX8jD3eTzmXueBvVECS5cPoUCz0sw6mrxEGBeb5bV4=@vger.kernel.org
X-Gm-Message-State: AFuF++lG8k2trPnbrckSAVfK9ti6YJ+to20S3uJPJP38uyplYg7s/ExZ
	ZNvmsR4jbGjQFrJSpPRA4Gx7/VovbBGT2uvwJafAO0UnRF5k5rAvwGCBHBzutQyWRLKvoFJsYc3
	9BQmJiZ50p12ubZnve9aKj3+hmcLPCrbI97v0b1DfBTI7NgqJQ6s3IBW6O/u59slHCtc=
X-Gm-Gg: AYBFou1V06UsfrvW+F8u+SIunH4xIIvcoDVZ+8Ej5Gh6Iftc+EJgJ11H9/usGm7DbW3
	jH2q+8HuK0XwmRCJsIT5VCB2aK0XKaLz2qaqFRjRkLpkWGCvtNvhkfDdooovASsfn8C+wIhxT0W
	3KacAHgd7FAGQCoFbxeysu93BwuFQ/TnD3x+zodOBBrH1wKrZYPSQm/z88syDRiugNlG1VwSI4Y
	7emBDDXh5aIZ96mRypiVCd+9G7pvei03oKfLV9Gwxq3Ow4bu+6tOC5j+eHWBscJweSVyJWD89KK
	5EcdudgGsOwnTR12qc+e/MGjcVV+45Ldcd3XC/1VRe8YwDcBNL3z1zBaXIYPzZ6wYJV4BfJ+VSP
	h225UM1YEEKnEMMzCKooBvPg=
X-Received: by 2002:a05:6102:8487:10b0:78c:d14d:8389 with SMTP id ada2fe7eead31-78cd14da8d7mr3449096137.18.1788959457275;
        Wed, 09 Sep 2026 06:10:57 -0700 (PDT)
X-Received: by 2002:a05:6102:8487:10b0:78c:d14d:8389 with SMTP id ada2fe7eead31-78cd14da8d7mr3449079137.18.1788959456631;
        Wed, 09 Sep 2026 06:10:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8993253b3sm114594e87.52.2026.09.09.06.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:10:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 15:10:37 +0200
Subject: [PATCH v3 3/7] dtc: dt-check-style: Handle continued lines in
 check_trailing_whitespace()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v3-3-474bb324ae53@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3744;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IWHg3NxDjAQuyvLPrxd0bg+vjcwN4JdBqQLR55GtCQI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoVrQ/wrQD5dOUAzOlhOoUz2/yu4cVQ4j5dxvs
 nNDgSAsnLWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFa0AAKCRDBN2bmhouD
 19VsEACWac7hLVBKAEoFjIbxvmu9r9yLN4dCqP4+LDIaaYtD/49g3hCdUXrQpPHcB57xCtLD/SR
 yhNiZAajXDw9ggsbgzOBMUCBrTOYhFyVplej1k0yQbUb5EopQ6BlDxEsUOU/LP2CPQfuvpCRBrA
 gnyejgfTmoP/QnBnl+AUnolJwNicm3vnMKVKYU3Ocl9vAK4UyfDT5J5et9BtQ8zA9rsqS+0dSrE
 MzdDO5S6mk7CTglzwUXAw9/eRN1kGu8ZZtHKpEaPb0ZLNLX4w9sbNZYljOapfql4xFI72F27Qp4
 TcW9pFnmHDTIzJ8HslzOyPj4+QE5+Q9ZDMXoH6OzZ6osYshdJnDpYQFjH94+iPq3wd6fYI7uqDb
 8dxwb5pil8K3/LXD/Ttk7dNy2p1TiI2Ru5GCqq62ZuGgDG+TmjSUXRgPhWISpN/XIoTmDrCK5dS
 BUE6lk+beXIYsYnvf7X+sV0mWIF0HU1muRYMmrFU35iymhxzkT2A/aAsM50KefiyXNwypknbVBY
 Ce8JDCfs7TKfGdA2QnV6cG+i6clw61oPVqx/3oXAbG0JakdP7e/uflIhH6lHtEs+flOREizfsZr
 fEfFBZWxCotARW1f15bRcUenoYwkEfJ7/xjovlpqMhEOl+vHnTg60YdeRkZAJyRLKoZQZJ/lDRt
 YT9l9q44e6fQHZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa15ae2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=n0VsRDhmN3h0bdBGaSQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfXxuxkqHF5gccs
 Vp30xuwAUZZ1Kmg13z3T1Z2SoVwwU4Qn8aiVgz2Gbyn0Q7z7nAIS/Y9ONsdL5WVW91DTeTamRcT
 pT/eWGojyyi3mKb6+BCpJKYF6coHftCz/Bq+2uFoXLhCVr00I3GVaVj4xUCwwPsrHPDGMBuzVMa
 3GXGFBWd48Gi4A+RmBssvaZTMqwX8X1pwGaw7K0AAGJCNFuXJzp9Cn2S1toysdJUKy2sBLVIhZw
 lWV4rqp7AkOooUQ7aVUf8vcM6IsfTFujAY84Nd5LSav6UivACrhVHJVwwodWF2qRt+b/ZWI2Omz
 5ilANpBr75JZjKZ/fFU+iEsvpF19RmblD6kOcy4xn/OoBRetaPyC1/050w7quLPteDQx7t2plzb
 gEVj0tPxAXD+Jy3/lNw2BuWbFz43BLa5BwFEWsf9vJg8vIZ/uSTE5sEQNCrV2gb5Lu9By5dWNQS
 QFgK4GPM3FbbobOVOKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX2g2pKJJ0DhNE
 dMPD33QY5v2pRA5l6zHhc3cf8LYbDeKAvdhCcjwtR5SGp8jRsFTNWnS2e8Zfu4DGRge1kQIyh7l
 0yw8mIM8Q1q4NP66rSBOC+aeQZuJcXg=
X-Proofpoint-ORIG-GUID: 8nxW9etMDEa3jvSNOTM1YzZqtzWtfnP7
X-Proofpoint-GUID: 8nxW9etMDEa3jvSNOTM1YzZqtzWtfnP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090147

Continued lines are not separate DtsLine items in ctx.lines, so they
need own iteration.  Rule for trailing white-space is applicable to
continued values as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                                     | 10 ++++++++--
 scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts          |  8 ++++++++
 scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml        |  5 ++++-
 scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt |  1 +
 .../dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt   |  2 ++
 5 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index ff5e715593df..3694b0b1ebb6 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -985,10 +985,16 @@ def check_tab_in_yaml_example(ctx):
                 yield (cont.lineno, 'tab character not allowed in DTS example')
 
 
+def _check_trailing_whitespace(dl):
+    if dl.raw != dl.raw.rstrip():
+        yield (dl.lineno, 'trailing whitespace')
+
+
 def check_trailing_whitespace(ctx):
     for dl in ctx.lines:
-        if dl.raw != dl.raw.rstrip():
-            yield (dl.lineno, 'trailing whitespace')
+        yield from _check_trailing_whitespace(dl)
+        for cont in dl.continuations:
+            yield from _check_trailing_whitespace(cont)
 
 
 def check_unclosed_block_comment(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
index 1eb24d91c640..73c24525ce18 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
@@ -5,4 +5,12 @@ / {
 	compatible = "example,test-board";  
 	#address-cells = <1>;
 	#size-cells = <1>;
+
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+		reg = <0x10000 0x1000>;
+		clocks = <1 2 3>,
+			 <4 5 6>,  
+			 <7 8 9>;
+	};
 };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
index f338c14174e6..17eeed3411c6 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
@@ -25,5 +25,8 @@ examples:
   - |
     device@1000 {
         compatible = "example,test-trailing";  
-        reg = <0x1000 0x100>;
+        reg = <0x1000 0x100>,
+              <0x2000 0x100>, 
+              <0x3000 
+               0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
index 94d9ae9d616c..a15a7d637c30 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
@@ -1,2 +1,3 @@
 # mode=relaxed
 bad/dts-trailing-ws.dts:5: [trailing-whitespace] trailing whitespace
+bad/dts-trailing-ws.dts:13: [trailing-whitespace] trailing whitespace
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
index cfdbc8476c73..4f2ec9572bc6 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
@@ -1,2 +1,4 @@
 # mode=relaxed
 bad/yaml-trailing-ws.yaml:27: example 0 [trailing-whitespace] trailing whitespace
+bad/yaml-trailing-ws.yaml:29: example 0 [trailing-whitespace] trailing whitespace
+bad/yaml-trailing-ws.yaml:30: example 0 [trailing-whitespace] trailing whitespace

-- 
2.53.0

