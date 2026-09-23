Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3239A481FCE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159266; cv=none; b=ZTGoMlYq5dNw2Adsn9qEZQi8JCdNnXM5f0CraUBsCVh09BqTD0nTVgLOk/3UymGVB/un5jAiPeM1CVfnBYy2l31HF8DnkC+jLO5I6rdTdc3i3XOwPdfPUgX9VjzUsZVvE3EFeo1aDFj/Hcu5vaNERQmEoDvyio/zHqDtJiweQnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159266; c=relaxed/simple;
	bh=2l0HOP6mPSZOtBbSF3ksRuZxG+DphYWlDRxyeluAzLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f/eyDOMYZ8N1gZbgu5ODfwPMwOIf7jIIdmsdj1/SNAEN/CMSf8wrVnS0l5VaGtcqDu/rc6jbZd+zDDugfw8sZb4WYEUTe3lB0CxM9or5dtht5PUrwP7eGCISuNIsY2dCIA6eXM3z3R4eZPmTGvEYpLDDpWgJdxzfqwyzHvx+Kqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYoIN555; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDjf+WUw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYoIN555";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDjf+WUw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2fqK2236745
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgxQRfbRddwBR9e2WGSz/EjVQdtkUcNgTw11zOQWGkA=; b=MYoIN555LywVykI1
	FNl0777F9gPdr+t5MjoOv+P3K4GzSNanLaTai+dsa4bDVEJQuaKYbyskjSA9W5kG
	p+fk5kLHnQns4yQb0wMMdGMgNzAS1A41Lck2cuoYTCmZz3KsAeEGOkeAjm2Y+nb6
	dgqpyp4+kKtNRQo955lfkejAtEzJMYuO3zzevrlzoo8bMlyPT53dDR+sKddmAlGt
	Tv4QZrI02ziDt37r7DgUgIgYFwZLxrvqiRboqTMipgxAPPp58AnzI1Bgq4oef0Pa
	AEmdMfScgXnfefPhn6wldNgdjh65UyREdIxki67GndE2Vjq+7J43alS0s7Q+cukY
	pnVyiw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7gaeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1138352eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159245; x=1790764045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgxQRfbRddwBR9e2WGSz/EjVQdtkUcNgTw11zOQWGkA=;
        b=iDjf+WUwc7iCtvQALQltgsH9EDYSDQXjZUZ8A7+8qMvJ7iXALhMMQ66fd1gJLmCjSW
         jOYrp+eqdmzLnU738gtJaCGsGISCyo4huXhXUFSAbpOJyXmt8oICJmcRuZGlAqrs5qre
         SB7KzD2TPkaCE4z0OGlDRZjh8m9CKqVYHpf+SUJ3Sznb8bYFDP4xORGj3EaShFj9IR3l
         HzC8nr1bWcM75pcA90lkRsGTyy0wZHkOjkl7LHnk9vJZcZ4La39LQTTCTeBZD0J43eKe
         N+re5UVrqOvvz50zZLUvVA+nnXY/80Zgkcs0PrOqHGVYfvUKvknYXNzlNUsAaA2qJehi
         ZwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159245; x=1790764045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgxQRfbRddwBR9e2WGSz/EjVQdtkUcNgTw11zOQWGkA=;
        b=B7pJLNCn3ydyl+ooY1Cbuo6kGhbxQ1JSql+0aNNTTV6xEL51qXN/BlScNkCKy6Aehn
         NZo1eCrR0AQhFwAww//RtbzFJHBMyGEYIQ+ydMwacZk3jlVKKBUSBtKbYr1x4SIyx9jT
         usInh953AgvjsnSAR35kupFPsz43zJbzX6EF2jnQMt5cM+SE+JhEFDhsmc5r1E04dbsS
         xbvr7aSSgmwGKZU/iYYL4eVXNlq2nJBm91xq8bXDhniSod2K5P8A5yM8h053zObtiXej
         woavDew685rfUIgtHg+LRZi5sh8h7ForaWcZd724En6YvweETD0jy0zuXuZRWe5HQpKL
         pJjA==
X-Forwarded-Encrypted: i=1; AKwUvBzFJPF3mK0wrHKK2Phqk5i0uDYklzEms6es4bCnWP4a46g5+mm8o65JZpqdBEzRTOlvSBiKUuWrWbUmbEA=@vger.kernel.org
X-Gm-Message-State: AFuF++lcHG0gmMhirQv0psxtHpbtYgbZTeXyCG1tbzmUflkzCgkmOQyG
	sALTXFh6Re0AFMFPbZ6iEUxnTIMcBjTnJiCDt+NSXKbCOEeBND/I4HHajcAjatHFLNB7O9v6L+M
	Q4+eCdrwczpCQxTC78UZJSOVMs7ngVKcD7ITSDRxmStO2c3lVo2dpTJj1GTZ0wJqqCHs=
X-Gm-Gg: AYBFou2FoR03o1rtuMNiarpmMrWCajoBT+Ru9XSng6wQM88jDgyFc54jdfekPgpulIG
	0+8iMxejQ2xDWDa+o7/lN6M/HffrRwpC/XGXM+r0ofh80XmxKo7HqZ/GTSk7z+s+B+BkJ7+tCL2
	AKhTUhg71PEtvRMcZCbd2WlajZ0SfODhjFvox6KV3XjUmlb1S90rSJU1348a1NMreSKMyJY5V1+
	wRez5VDB7pbwaauUOyAEg2p723a0o0hmbPVs3FjEpBP3xDuFcwr6wtqARh+73s/Z7nSXHT4WbMq
	L1Ul+7IgacAjfWK/WHyoF3RpNTXS477N7nBpgqeefCh0Og0nHMn3PwpBqmRHfLaemCUo3u1r7hK
	J1rxZMMEpV4xnuQjKkiVVARo=
X-Received: by 2002:a05:701a:ca0e:b0:144:eaa7:2915 with SMTP id a92af1059eb24-144f90f8090mr2852424c88.14.1790159245104;
        Wed, 23 Sep 2026 03:27:25 -0700 (PDT)
X-Received: by 2002:a05:701a:ca0e:b0:144:eaa7:2915 with SMTP id a92af1059eb24-144f90f8090mr2852391c88.14.1790159244606;
        Wed, 23 Sep 2026 03:27:24 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:50 +0530
Subject: [PATCH 10/15] dt-bindings: display/msm: Document A850 GPU and GMU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-10-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=3397;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2l0HOP6mPSZOtBbSF3ksRuZxG+DphYWlDRxyeluAzLM=;
 b=SFUs5FDbVaozEtr1Ys5yrhoHlAOgul38VUPaf7kTbcdYxKZKqgEpUm43xftFNbo3KxM7TiZvu
 YuOUkWDXIeqAke2d3hs3JVntTErY0j0vyVb516CqT+pexr5DlK8C6e4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: o4hpspWsOW74MR-f9WLTn50ficCu1uTA
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3a98d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vA3qWFdfvwbCGvS2NoYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXxq6iyxGs8w+L
 I644ysSjVAbudKHo2n4PBJSeO08KrWxL6oGXpxM1TTtzCDJBd+wtiCs8IMQ/Okob2bL//AbxiKN
 +gilq+ruHBK7HkD2N4SZ621LBxGc3W4EYUt/PryQB6qf//TWHXYnFH2j7BOSyGA3tmPPqti9hDg
 +GH/Wkgxy611+IqkvBPx6cbS/RQmIqpvrXQUBoadGM3qV3uhdw8Lx1M/otzwSamR5Zjbq62XDn1
 jrWa3+FPaE29dSRHpFIeO+T7pA9mqCalJC5bDDwbOL5IaXO7yEgGqN93J2HptYtxg+hrPVA9Rhk
 eWIyOcePAoQUSeoAwKUQh7E3arrI1L2YaUkraEyHpB5SlbQV+FnDp6QsPRrVie7Cu2YkbswmjdD
 WiONNduckDFBlfi59cvGTfFNqyFa+yDzYvmLL8L9rAREArK0ZOm8oZ7o0d4tT1EBtzG9df60YR8
 1nXpz/tMMJFN9wWmKiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXxcZuUqVnmgfQ
 58tzSljltnV1/YTvroibbtpuAsWH68eYqLbrFj1ejkHk918ksRs3ra3re7pI7vy4Nw7GHZ6B6ZJ
 Td7sqWdK6BBbyu9Xeu/S4ThCj5ucIzY=
X-Proofpoint-GUID: o4hpspWsOW74MR-f9WLTn50ficCu1uTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Adreno A850 GPU found in Hawi SoC belongs to the A8x family and is
the successor to A840. Like A840, its clocks are described in the GMU
node and it has the following power related updates:
  1. GMU is now powered via a dedicated GDSC connected to MxG rail
  2. An additional power rail called Bx

Describe this GPU/GMU along with the new compatible strings.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 44 ++++++++++++++++++++++
 .../devicetree/bindings/display/msm/gpu.yaml       |  2 +
 2 files changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 9e459f12ce3f..875fd1242528 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -55,14 +55,18 @@ properties:
       - const: gmu
 
   power-domains:
+    minItems: 2
     items:
       - description: CX power domain
       - description: GX power domain
+      - description: GMU MX power domain
 
   power-domain-names:
+    minItems: 2
     items:
       - const: cx
       - const: gx
+      - const: gmu_mx
 
   iommus:
     maxItems: 1
@@ -359,6 +363,46 @@ allOf:
             - const: memnoc
             - const: hub
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-850.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GPU AHB clock
+            - description: GPU MXG AHB clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: ahb
+            - const: mxg_ahb
+            - const: hub
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: GX power domain
+            - description: GMU MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: gx
+            - const: gmu_mx
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index e5efe2d35ddc..3438eebf2fa4 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -415,6 +415,7 @@ allOf:
             enum:
               - qcom,adreno-44010000
               - qcom,adreno-44050a01
+              - qcom,adreno-44051401
               - qcom,adreno-44070001
     then:
       properties:
@@ -452,6 +453,7 @@ allOf:
               - qcom,adreno-43051401
               - qcom,adreno-44010000
               - qcom,adreno-44050a01
+              - qcom,adreno-44051401
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.55.0

