Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7EA46C4AF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942967; cv=none; b=cJbyew6CNffGxCetcThWqr/DPzBN1GexPizFY03UnftAbqiJuO8tYguJ76mUhjrwxtNpzXoJIk/h7KKT2A1gCJyUxaTTO8PdOPUkOJ/j7j+AvRu925irpHPWuwuZFShPChoPRuWb07DQdB78KBkCfwtCBnQEZo9EE11ZlI2nSGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942967; c=relaxed/simple;
	bh=IWHg3NxDjAQuyvLPrxd0bg+vjcwN4JdBqQLR55GtCQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PM1CaYCn6i+OGkRgOxIc9cXn16eyw0lNm/IcHUl5rbWhpzm89doQwXMOjKaW7L82kSUEptPY1XlpK+VroWJSzJh71iInLSmSH6B2euiohBmktVb7nOjwESJ6d2eB0bafomCEtPTuOIURpDaLBZlfAGLUaMGenMJBVgRBtPBIxkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=babebhFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mqko7dZn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="babebhFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mqko7dZn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896WFCF964976
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 08:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOoY6mCIop7DLsgHwFMY2E+1AD8DaONcY4sNreB3ZeY=; b=babebhFHpu+aDK/U
	/jsF//7phqFo5nJiPdQ/43tCQ+rWgcgi3mQBeSa/bQw3uF30M8Y82sHNzUNY6BAj
	UcUOLHANH9io5kaJA8gDFtnrfGYxZmZTiRSHFoEtJKDjT8hshim6vzHgVUDA1WVq
	Ok6fYjFvfC+Vori5R2kEIQSfK+1N1JVRO5A8WMYKI4Zedlzho7d4FEVcaqpQQyqw
	3MYIj3dq84p8nP95ZPhkmoOhGOgJrC3t5a/MMC/YPIdNZR+Sw8PH023FGAxRPB0g
	gSLSc15v6nvf7k33MYgbsC8rxBayZh2LPEt5bpRmxhIcE5AzifNEXNgasRWVCZdR
	jHdbGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha33e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:36:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so1059778485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942964; x=1789547764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOoY6mCIop7DLsgHwFMY2E+1AD8DaONcY4sNreB3ZeY=;
        b=Mqko7dZn5LEGUsC8AjtlIZIokc9FYX2PrFkaEAL41TuaTBJh31W+Jj/tva7WpFTVEc
         gINCsNdyY8EOLEv8w/jrF6RBpJvSX1JfOPYlzrscWUYjsPTEcNgZjXNpnSYiIZUMYujD
         ZZO69XCXhSAilf1uqdpCGESVr3YT/MpfGfzHi9C1ZCZ3u9AiPrbBNLjB9UeI3ILh4JQz
         UmfIClAjYTgN4PuR40adqehS5sSMayz3tH2Lflkg/bT5uFSOCegjBcYlfHI+N0mhRBXw
         DtCM+sVpVGVdt/JTrqjd4LzC2bEMpFw7HG0tGkpuWvnXbbKDdnxjf9pSaPJ5r81NY6RG
         lBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942964; x=1789547764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOoY6mCIop7DLsgHwFMY2E+1AD8DaONcY4sNreB3ZeY=;
        b=nzcW4twckpDbz3Ax8hXTHJPYmG72+blbTUgC4HjCTBYfrzROEPYBjVw7l0CvVvxFST
         7eBowNsn4VO55U66LvK9nBbV541sFnJ8Xnbbbk5lnEu0y/pUlv/MpjWXHEyC5Me1a//M
         P0cPXDTn6bI66QZm+JC+uBCqe4NPqPcTFUGbP0GZutwK5OhkC3NUFn3z0L5cfWJhh7Mn
         QttjPmTQc4M0ONipCNwo/WVsx3nvAFC6jofQmAq09delngSe93DYchhwKmiHh9KNAmKV
         b9P911pBqS7hglpTqB4pE/xvkCEW6ZZkykgwG05b7zFRz/6NRtUpwZ+Qg/KU2+hEiYxq
         0bmg==
X-Forwarded-Encrypted: i=1; AKwUvByOTKp7wd6zScA+RCQj7gc6oDV8NI3CtNMgsqIqQ63KAHRUzkRDHTLNa61y4gdMYcYiuTeiGu4FHnbFGt0=@vger.kernel.org
X-Gm-Message-State: AFuF++kop0ByqpLHRqG/XHn/11eBDbl4OmUB73FA5ze/ipyEuLlRPkfy
	Gz73RkdWpYU+1ZaFsKlQ+Ey9xwoMhg/DQQmMkZLhYmj/IEfMtd/GyTt08JFv3+hUKEIIrchNJej
	8Cf/rduL6ZBu75pb2Tw9m15zc9njcfMrqtZOCqs54ibXZk6qs1VVom5YUtmJElOOyIFw=
X-Gm-Gg: AYBFou02G6njbPHQGlPVw9kt/Sii78z5TxxrEMg8z5RLMmM6bWBykgCYJjInp4XyrZe
	pbC/G3ikeuPnmdmE6fh9K9lt4Aoc5m/yyLb5i7xIQ5DEp0Lgu1+Fs279Qj0IEu6p1ZAZNxQsUTH
	aVCdpwikrp2bo+bD/QXdgCwROnztP0DSFLQL+i+kyXzFPeRYHeXvUujtQG6gf8zrAaDhb2zE0eg
	wSgW6S3qzmdRQQtITUYrF0KYdOhx+sehURerZBJKsCZIteWMTtQS2SdRXGdztoLdy9lIsJ0mfWI
	93vAPcpXJLacSXj5fPaLn8de5U6qL37dIR25XXmGA8uzwwVcUJYiw1sgpoSubbqiukDkaXr0QNk
	tJD4t7IO7pXlqhh8BI6jPGag=
X-Received: by 2002:a05:620a:258d:b0:939:2c5c:7977 with SMTP id af79cd13be357-939c93fd11cmr605479885a.20.1788942963505;
        Wed, 09 Sep 2026 01:36:03 -0700 (PDT)
X-Received: by 2002:a05:620a:258d:b0:939:2c5c:7977 with SMTP id af79cd13be357-939c93fd11cmr605476885a.20.1788942963052;
        Wed, 09 Sep 2026 01:36:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm43210269f8f.34.2026.09.09.01.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:36:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:35:46 +0200
Subject: [PATCH v2 3/6] dtc: dt-check-style: Handle continued lines in
 check_trailing_whitespace()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v2-3-c5cb4c9d9b66@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3744;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IWHg3NxDjAQuyvLPrxd0bg+vjcwN4JdBqQLR55GtCQI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoRpnud/QxRRiZNqO9ZF+4J5CS1iqOJQDgkHL3
 mVUs7bGsgeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqEaZwAKCRDBN2bmhouD
 12ATD/0UrmJzGsnG/5GAeZAi9+LiWnuHC7nzKuszc29m4L7UtH6xIPok9H1LBKZ0aPLJf9XAHpe
 0Od419kWAaiSluBwgeV6gA4PaUGWXB5f1+Kkv1jh+TXzhEdF6YeEjFJFb4tXZ5omXQl6oJcSg7d
 LJG7I2dvTc0rKAf6V/pXuN/OqmbtN91RuOymQNZoySPTlpXAtwrW3bT3J81aYIpm6YacNBfmoGP
 bDSBrOZQ7CJajmskfSPOc+sb+vq2pL4+Wd3jTLnE5Tn7jnh96FzDO43Uh7j/Di6/PF+pQKXH8tn
 3mi5YEpUUyqJi/ZHxQR1elsmtQKOfPMHIfjPwxpiuQ8tZMKmPI//YnXaB4TWMB5/4WnFskQKz/j
 2ut0+gB2hQQpBM42yENvwgY2DC+l9SMhuYnfdWMwpVt94bQNeVWjdsOlxDi6TwR/jsrUIJsOgxC
 IznM9sv2PG2AeGOCKcb6hZ/Yr3hchaazGrFzWQxyaYe9zcxb4xe6rN20ZgCgiKxW/eNrPkR64CF
 zf37B4CcIK64KLDWh/ogiKctc0Ima+0Vfdy382wJGkxshtGrclH+FrPYx7JzNtIMnBbu/dk53A7
 IczLbF5PMWhFu0m2QVTYkZao9y+FxXp1MkIfyVNGuN90VPDX/0HS4ad8WDN9agIJJa4t0Fwng0M
 3agiDyaanNmh7Og==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX6DZfhCmmo7Qg
 gfp6z9Gm9fekxlIYKdUVu9CmcehsL8UqQGqEreDwhe20PlG8gpnkZjNhe04sFCiWjrbrHDv+DiF
 AMwwzRkS8FV4qJ+oceJ9C11kA03gY67WvS58HK5/NCAiqrKewa5oQ1H3dl48YWilSPRvRXT0QwX
 f20o7Rowy3qMB6vK9sKPcW15utlE6cfhmXDy3MUJXtX+A/8tl34LDikRDTzly8gwGSEMRrYTueh
 +UauLzKDpXpE2pMd5mme5jCzfToK8/6XDcLHOP+BwUDvn7zIbDjP1oJPxEdxnTB6cBj8gpJWmTZ
 ZzmA+sdIXstTS2P3hfgRf1GlJwzZd0r9WImHzWjO9M7XfFgGJb7Y0sONI1QhwjITRV1MGJVIt3L
 d/UZ+GKqavJHBZPZJ7kJdk6zmSygfUDaISQp7CdD49iq8Yfpq8mZpGftjdjlQLm4bSSZ+FpS7RZ
 YX+zWvQy2LjNWIyRLuA==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa11a74 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=n0VsRDhmN3h0bdBGaSQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: VnLVr6WP5aoPmVDXhlpFUwGRD7Yb9OGp
X-Proofpoint-ORIG-GUID: VnLVr6WP5aoPmVDXhlpFUwGRD7Yb9OGp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX82szMpV9wlLM
 R7jc9rR/tSujo9vGCcyOTbM8W8dRK+qv30kNtor+zAUkCzSiYdcmNWdx3bjfGw+do09OKKx+6Xs
 OrODwPyMNhFwMfznrLSTriP3c3P2p4w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

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

