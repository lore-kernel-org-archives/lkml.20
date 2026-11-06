Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968409;
	b=uXiw6RZDVatp+lWx+XSFeXa9qrL/QhBkoNgyESO/GvXONMivl5xVHzGDF0fdT4KNicQH
	 mgmhfc0nmVJkrDys/+fIrOqOdOc3u5HFrV//Nw7cgGOi/XCZNt+xa7J0/oajtiJ4zwP2J
	 BU5KyariHAZBdYopDphX43hl0NdL787eJZGy1g3tddUFvN9ykZqoJJxDHVGcFl6XOH17r
	 MpevS3hD9Xgpk4njfBfVja6NjEaioqVAgkQcrmgjN1OAyrl12ZadYNgT9+M4ZcoTLoQtl
	 /c0aFf+Kh6CBVghsehtBR1PShkHsMc22oBmvSvjANMgOIag2FbA02rEy1JYxE2GcuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
	b=vuRSyFVCiaVHlrOlbmUMB82UL5QglvDZxnXSLl/rkYuT8UTK0JEO2MWWPDSTS3F/9D63
	 MPoKTJwYall7AZ/58wKy87Z/pj15s3tMpl7uJavNB/AKLT2mMTaROVMdSKJmTwTYGlOeL
	 Dz9qHIwgxz3oxU6v9qHbrFWfYb1GyuewTh+0LmSAfnCKelHjKEHQYFNkAgt4zRf8GEFhQ
	 BVIKfyx2dCJHoH3vmvFs/Gtw6k5fVRQDP7m8DyzYeutXbVISQFFuNEXX1WP7x7pXRgnga
	 lLODU9rFy7Cdu9BadOzuWNaooPzgK5xyGwyoyuplROaNwFLhEcAVoqLyskv2CkIQ69g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fu3AmKKc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxCCIg2I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28C606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F28C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fu3AmKKc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxCCIg2I
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APBFe3645837
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 12:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=; b=Fu3AmKKcEYz/xx1l
	IoH2xAcg3CddEvzgqhaeRcMq7G4D2vpA3MO5xK5BU17vfbJsnOFJM/inoG9qGC55
	T+6kjTulZessePNg0CvMBDkjaCdipYQV5qq5ERh/oHbnKtLBdRpASuJ97tMzkzZt
	0uL5VdVi4liyPQN4V+qrR51Fe10ncGhoP2aDnWLQ6I+n39xMaC7rKjQ24MHPeTPD
	WXM+Euj4mA1SPbAK8lC+LC+gKXmPRahM8YkghucdpFACXx2YCqQHFr4vaCGgF1oY
	RdkssO+soMRt/AyhYgcT5YGpOO7s7p9L47FUPON+2dVcY3DsrS04pYwvIK9PESeF
	qcnUuA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2r66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:33:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so946418eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968407; x=1794573207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
        b=hxCCIg2I8Hy5Pg6aUXOPc8LmjCpe3corpgQHAPiMfZ9WXXgno4Rkvc7FUmrW/10zFA
         VNLCBkFsAZK+15QhOdfq6/6L2a2GItNDeL2g3nx874IJqfEJg/MhR0AoKK00yJdbjRWM
         h8oSVr0QFn+59EYoDbU5H6R/ocybrfx1E1zRCe8YhphHQR64B4AaBymo16Cnl4igZO9q
         lCo3/WoxlaAeYj4IDg0kS9rwe7VF3bv7A1urody3yhuANzz+CTOg4blFlvVF9ttUWuRS
         OIsLTbyNCGQaGCcw9+RahbO5lVGxBEik57gFpkOyK5UOu6E0ZRbit0ps3vxDOU3WkIAl
         dyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968407; x=1794573207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
        b=fO6Jk1jzmLZH2nd17f6tFJF23tMjIroveeZNMjlRavONSrbfnXDiRXWBbdRmbWUs8P
         T8LR9sRQm0gj+RQRE+I2SxXiStUMrYyYX1aHwc2i5GtoywbAe/GfaH2tI6fDEXQAEZ6M
         bDw8m5Gf5onhxQ3NuxryD83M4fqJL0TcrldM2c1AOaaHd+YTJjtN9B/SZI9n3gVuFUPk
         Uu7nOHQa3X4B58sfyrQBkdmdRlTJm0/Gh0CE+uQM81Pnrss6kAEEJ5VQOQkNFItcv1GP
         MC5P0xb0TJCkgrKMMobeaoU5SGyqegCx5AN2uFjVOdCreHykLpQYBTSEseKUDu04AHeW
         tS/Q==
X-Forwarded-Encrypted: i=1; AL+hErEqNg1am2LwkPrgne6roQmlpEqO79yE2rX88sl0EVyejz+xvABI+PK69Q57bcjRj6aN7FJVAi9Kw6xl4Y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nPg1bH6x/qQaHmbsYglXSQuPif9LZYVdawvFaVgFtBdLQtf1O
	iEHRQ9GJ2P5wgaZoxAG7pRDQCrI/zcBnJ6iaGerJCJ8FyvpmPscamuM3JDnJu8YkQ57CA3Oewst
	9X8DNqA4cDjCI2uYugGpSauin4VJoC3GCAbOrJd/3PVToM5YP4sM659oIjlJSERz6ZBU=
X-Gm-Gg: AYBFou1x8yZcM3jlPQZNyxFpphSH7xdPCMYj5oqJ9drBiVGkcxQspai5L7WwGkjjn05
	a+noM8+bJgx0YrcDFSuwp2Pw/mqM6qFNwB1K3Wzd2QBSqVTVpMJjinLdvyYUAbEpX9XUXIwckmQ
	WthZesiHksE6e6GBrfgU4e6XlZUnTu0lLlWXirAtDl8e4zbHVpTsbalO+zWAACJNQjLltgpNI08
	Au/KYdA9xDo+p6cYFFNVGGexHOQaiqrXxym8w/7BnR+063gCntMhRVCZFGAEyQILK5Qp/xhPIph
	lsxQFJd+0RTrU9NiwnBz6C/noq4QCjtN3MIlXEP5G8COecZgF/GZyNWNejuux3JPFbZ3bWieuBk
	4nYJ96XgJgCirfGhRHezEqi2G6S3eDREO91IqWIUg9SujkxdWcjbpZ5xZs3EgJ81Wi7ENQM1z18
	DWTGMe3S0a
X-Received: by 2002:a05:7300:c7cc:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-36f76c17cd0mr3148770eec.27.1793968407114;
        Fri, 06 Nov 2026 04:33:27 -0800 (PST)
X-Received: by 2002:a05:7300:c7cc:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-36f76c17cd0mr3148723eec.27.1793968406370;
        Fri, 06 Nov 2026 04:33:26 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:25 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:00 +0530
Subject: [PATCH v6 v6 1/9] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro codecs
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
Message-Id: <20261106-add_shikra_support-v6-1-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=2759;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=vsQiZmFC+ZXQTQ0lUOQFxllYT5f/JYtRbkSGpdjvRBg=;
 b=HLz9BdEh8/qiFIXkZbf4Rj8A9mKmTNbB1Veg+lgSeibcOithsRhztMi2M3t+GlrkvkExNtV38
 VDP4iSOR2CTBnRVk9uaySFlblpxYUjmG0Fsypf3vkNUzUoI186SfDwS
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedc917 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=enWoqSm7ZukIuFDY9bkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXxjb0sBoBuN/o
 8sBbnAnTxnuUSUv/nufoNrS5gMeX7tuXleYMtIi42cwMlNcKnZBRaXkxO6N2gNE+eqUyKA0qJr4
 plHVsQbIt/foguqjSjKS/RQH7wwfy4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX0V2mwCmWJyga
 czEUio5qv3n12pH+YMrq/RrIJQuB6wFpX/gsvJQHxuRM6Ng//qdrjFoRwMDw2/nUhDGqLcZ1Qab
 cM3iq5d9kz+8eQEAfC1RwXSr+vhSmfkDR10x5g8s0NV97lKCYoCnJ87i0WTbYBvtCcsnYYovG+Y
 YpblYiAsxIB5g99upgZa9R8V9ZW2P59EKzL8cMZgrsgVcr41gr47CBUMohMoxangJ/viOXXy6WI
 czhWaCFeBoxn+T/SFYOtJrlBHNpyaPlhZQi7j1chbqwHftLp8m7/GtNfJ1tcGJZ9RYQJDr2J8p7
 ozezXoVxaf7DVQpcE1Q8pmLnRYIIUrPr1LAyio1thIBtgd05dNeOKU8lNdzQQzyrJhAFvYHOv2Z
 skAmYQX5iB9tUq2dXkzT6T9yj9XudpTaQhWzcIFscAGYhXkcnLEzdjF53mIZERaA+o3TD0d6MYN
 oxFJGQEpttm6vQ2z+KQ==
X-Proofpoint-GUID: JUwSzfs7eK2SO6_0qS32XuiuO12MoBEU
X-Proofpoint-ORIG-GUID: JUwSzfs7eK2SO6_0qS32XuiuO12MoBEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 16 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6e34..db63a75f108a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
@@ -138,6 +139,21 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbdad37..683ebf702ba8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
@@ -168,6 +169,22 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

