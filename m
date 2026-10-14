Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CCD47FB14
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969266; cv=none; b=j+nAUky5xNjyC890gU9AjAB+lyMoRyf7w3I7RPr002Pi/0QdN5SxSZeB9gY7PNqqaTIAJzXAnMwgkYzm0xWslV3ypErTjLPacmi7p+msUefoepEz9TlygDuJnTBeQTzXblSg5j0Iv0S1jjG6MIsMreG6kywbgT2+Mjz+NIc8cek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969266; c=relaxed/simple;
	bh=XjqDCkyewrBzwac9R8b3kZcouSm9EVUp97tlLF8Ho/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S+3mXxX97FoMk/iUzoMqzWfzS87Rv7xtwR42wiuzMqjUR06IHIG9uow6B9rCZU//dHsX7a4+5+ZK6fJFdqab7eiCgYO2S101TvGLiUNqJCkvMgn3f8ag7sm7a1YohpFkwDOKdArOtpJ1U7qqcrkwJfUpBhdEYotFkTzNQWDxKgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzIGp/jA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWLY7t/d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzIGp/jA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWLY7t/d"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6QnVW3103937
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fCgZ8m08GdP2r6C8RcUE81IwgkQsrBaJMa43tMr/y6U=; b=kzIGp/jAUVqkIEiB
	tgyhJLZgRNke3zmq4w0Nq0v8F99hYKMF+HdvAnb/SEE4n4NcTzF7AKaBtpR2tIyo
	wm+6AQ7K7wsCyIL/6pzrSJD+GzhzF4KdeGe/8fSqkboB+IZZqvvKJwS4MEwhm3ro
	SPwAwVoufDodnNwE/dn6a9fONX+PZSETsCY+4ylzRKDtj7pkTxCQ+igmej+hPv7X
	5f8zd499wrOVf9812f3eGUXhAfFqNekVZn3wQYIlNJGMPH5e+Iw59vLQqo5aBylT
	f0uaeYQtpLwQKL+/hlXgRefuO9hU62Il0upL0Va7lrG2v3qmz0fkCQ8T3Gt1FtQR
	8dtgQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9wgt2632-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8621795e7so37415015ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969259; x=1792574059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCgZ8m08GdP2r6C8RcUE81IwgkQsrBaJMa43tMr/y6U=;
        b=TWLY7t/dTigIzJZ1pOynoP5LWBLHjEXoNmE08eAtD5KXnXR1CNb0A7jFL74h4VutPS
         +GP+JkPBSrU81IXtmmjGRcV3FIzD9lqu8Ux6rWfDjETlGvfGyNKO2b/MJ13UFWeEl0WU
         IW9Bb7PB+z/+h7w7iFg2C5pqhQ/kFmDbclmK3+4r4d7SgYT1q6ksZFuExYV2xnIZ5Nwj
         hL3yR8YxUC5vCifPCzdQ1T4KYqnnx4z9zhJfgL1PvKl3ViE1py9oSvcasjzKe4r8LLr3
         cwvSNE5wPqW8x8DnB/t8ZrKZozp42G1dI3qE/s6TgmwxSqwi/9Dl/A8wWb7g5aPx2YqH
         HFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969259; x=1792574059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCgZ8m08GdP2r6C8RcUE81IwgkQsrBaJMa43tMr/y6U=;
        b=GiP+k8Qef0oOeFjpydGKaksksjCSDX43VQ1WMjwOURv8O5vLBY91xjzCqzxL7rn55O
         XEWHKyxUKwfMjrpCsa8f+CMuEilby4eOYs5OSwqoqy54SMCRJ5VOVszkEe7BVCKGi8+q
         MzTq+LUfSAjHnhCI/kZDvt765FeHiuqOXnZ/P6GUpNaxLxaRVcSoBuu5fBLvaqKFAuXM
         7RFiihkEDbm1PaiIzPPsliKz7/bgPrjmB5k8gKYYuAuPedfVXUuF9bcRtZFfcA9iirn0
         XU58tZe2J+3FZaOjdoNxVaHV81TsWdgwBtwCxDtJbOXsUNDBGnzI+z73hDov7KHglKw/
         92gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJrXDNg/v57XkLwAa1LeXBxe+A9rzJ2dLv23DAPt6wwlSTkbODapFEY8hHmiHw+dynniSxs8p3YTceeJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPq7pXMoOABNs6+X5vg90Qi32ITyYXlbMT1zECJAU/jFHTR0Pf
	c2pIl7Mog5FsvjXdajzuIgN7k+cEQeaZ8LoSoe+5glPbdAwrdyZrGKqtzAi+CqsGBWwbcd6x0hp
	qsyQFP0sJNy5yyuLBFkWPtGEy0t5PehcscDY4L1iJKQkpShaRF8AMISqbSeYzzrjev7o=
X-Gm-Gg: AYBFou3gL5NIOUD0l0nzNlRjsKHLDkl+KeaCfA2sVc3ZjFtuXG1oRcFcqgr10wsdxRM
	XDQ9vE+19YRxBv9NKmfh+hUoYG2MMRdUTY3Xt+A5vLFko0QwpZ4Im8nORjLK5/vF3sT+0CPsDtk
	9RtPKGl7VHd6Lkoq2lrAY9afW4rdCmuG3W2rfzjx2QCJqz2mglPAbkmb3ESnhxC6/K/NOcE2d/l
	qyCDkgs1Lg9LAWzB4SNf6qcmGFJwT7i9FLzoT32HgnP4x4eg3QGX4NpVAA3qDYu6W+E/Wo02Ysg
	KcqusfRIXLWjydPDhziAwB488po95/k8xvcgO5d7b4jz/TiHOJOBA7PWbCHzSK/lGbqR0G/ijLc
	aoxVSLd9cjxtWPj7BmxYcZr4ggBhP2o2yzLw=
X-Received: by 2002:a17:902:f711:b0:2e2:c69a:bd7b with SMTP id d9443c01a7336-2e842ab6413mr120780715ad.13.1791969259160;
        Wed, 14 Oct 2026 02:14:19 -0700 (PDT)
X-Received: by 2002:a17:902:f711:b0:2e2:c69a:bd7b with SMTP id d9443c01a7336-2e842ab6413mr120780515ad.13.1791969258680;
        Wed, 14 Oct 2026 02:14:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:14:18 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:52 +0530
Subject: [PATCH v5 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=4231;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=hgnMAngpDFTBBVMIoV7sw+gHudmMoq+o7sI1Dj+SSlA=;
 b=ps9ZbmpGm1vKC239QFJ7D0hyrH5RbJxImVCmtgyR+AHT0B6K1uW4ITgeUQCX2A9YhW0fMS9oe
 dhFVlCLLTd7DHUnhmWIRYvve34Vr8auuuXWsdySfAQ0ZtAdj6ipSymV
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX0hHQDcmfZijM
 Ql3obxufFSQ7l+0r+Tj3nnu+hD1boqyqQgwB0ay5udmQEgnKfyCaa4iXtcoGJT8ENAwy4KmQLo2
 vYFab8EiGCYACp8P16nk5UJw8STlglapjvAVR+YRf2GcDNDjskBwGmxdCLckBI0f6vO1Y1I+s+a
 d3X7dgW2O326a0nQSSf5LISzXD6dFCRA0XY0XVjB7UxZr/dUfOtF/lq5h4K3FHt7Vq9cIpn00fQ
 hkhNRBRDMWo32YYFEcmHdZww/EtqAUWdJ0lKRcTOFWUuKYRC3zoe95Qdh3vFWfAPJnKSqpoFryh
 lX/zEs3fx0uHY0F8+YhKKJOLTK/OMyC431RZrY+hmBFGHEwxgsuEOhciFOhJteTM2c01M2nwNZQ
 udmmCYaVkjq8HOink4KrXfuHAlo6hCQZ+0+YaKTAQokFwseKKn7gSyUlSaHftx3oVApHiVTruCT
 AIRztkDNFBaIEulxdxA==
X-Authority-Analysis: v=2.4 cv=Jp1kP84C c=1 sm=1 tr=0 ts=6acf47ec cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MdR4w2dFWrRrHIxOyxQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: iCDj8C9WxppOf42qcsrxSfhCAssOU1fF
X-Proofpoint-ORIG-GUID: iCDj8C9WxppOf42qcsrxSfhCAssOU1fF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX8ipsdHTXlDew
 7vP+96qNoGzcDVJroE79z4tgDjwem+HjvGLmOgtN+IE5FBEOqRWNr2YuXLWYW/Wj1Z3jSWR4LJP
 FAacw1bf6qxdHVE10zVl2kjs6aPCpxk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Document compatibles for the RX, TX and VA macro codecs found in the
Low Power Audio SubSystem (LPASS) of the Qualcomm Hawi SoC.

All three macros differ from SM8550, so describe them as standalone
compatibles with their own clock constraints rather than as SM8550
fallbacks: the RX macro uses the 'lpr' clock instead of the 'macro'
clock, the TX macro is based on Bolero v4.0, and the VA macro takes an
additional "heartbeatpulse" clock sourced from the LPASS VA CSR rate
generator.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-tx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml           | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index db63a75f1..142955b85 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-rx-macro
           - qcom,sc7280-lpass-rx-macro
           - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
@@ -139,6 +140,24 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index d8682ff2e..2df72450d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-tx-macro
           - qcom,sc7280-lpass-tx-macro
           - qcom,sm6115-lpass-tx-macro
           - qcom,sm8250-lpass-tx-macro
@@ -142,6 +143,24 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-tx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 683ebf702..7d56f9c36 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-va-macro
           - qcom,sc7280-lpass-va-macro
           - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
@@ -185,6 +186,24 @@ allOf:
             - const: mclk
             - const: npl
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: heartbeatpulse
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

