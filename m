Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3757488762
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159268; cv=none; b=BLo9J3jfOjiusQWzA6vDqrNFT/a+CKJ5xz1SJBvvLluNfCBNXj9XyKUa/sO8BuzchazMfdGx22fc1jJ5n2KVuGzNyawxxjtQRwR1qsSnYrNTD4WCystlkZApGrqrqXB5V7xbsHmwv4pWzSuuZKSnIjLqN470Ii66MEhgjFAYmoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159268; c=relaxed/simple;
	bh=dPgaamYjOu93/yM3gV2qF9nzfgiS4ZPKow7lnCe+mLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grXqr4o4LpqqyadUVoHIrNGMdrDRkz4uUPfM8QH7p0/juwArI8eVccrl5sObWl60CxuRLvFI8j7e0pm1CZa8x61UaH9OKb15bsp3c+HHqHIgPnKxYLSORmTAst3qzM1Cgoc4go4YIQUhfqA1ny7LFhSnjyWhEJCvXF/wsB4gHyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Trx4Xl6U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbmHYqcB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Trx4Xl6U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbmHYqcB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2hKs3208436
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1NuOH1NXcB2AiI/hLtOWQM1XgjcXBrhm8FLEPIqXD8M=; b=Trx4Xl6UZKDhwbvB
	eChrg8GkrK1mFLFBmIrEvDMVX0t8RTkR21kvIGY8qvKVyur/LyYRza4GDeDo2rvb
	KRVf4mb7VSOkjrdSOZVcjb7jpUztFUTGNn6Me+1/JYoKR7LbWvDOtdrvFGTRycsF
	eoZS4vzTGk7nAx6OgeEbho/96E44Uuk+Yh/X6rm5tpMajQtGh9XVqyL1zEp7Olr/
	BiU+ttXtpvcnSJO5KLXYmIWHpwDC3aZtr/mRZq7SN97/Nn2EIfDvuIs6hbx28oZY
	XT8bF3H5wRFYhwraK7Qh6enTlhhC/5dR3hQV1yV1NoEksWGRt6HhiLnzpcGP4Aor
	06ChCg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1gq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1384427c3efso1297184c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159253; x=1790764053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1NuOH1NXcB2AiI/hLtOWQM1XgjcXBrhm8FLEPIqXD8M=;
        b=JbmHYqcBT5WXl9wYJDFteZ04+i5sHEB9dMooxBuj1ApqKVsOb+hckYIs8R+4u2Wwyj
         /xKTZit/NOjtYlgOK2kQGSoYkyf3CFPUA+kx9MViaLpKQJ56mne3we4fqu/U7Ki/t5Jt
         O95TIEKGzQFQz9GwHnqn5XqHy8H69MOqNTaBWFbSTkgUtz16MEap+9st0YvAiCerWdl9
         K59zd71N/Adr5ltuvtmPjpP7lu5h3J7abwT5EE6tFkHiiVR6nieESheViuZKUQVZzZeq
         0cdvPw82Mmf1mbEr5DLby/hAxNgvH+Qi3L+3Z10bTmXpYbvyTDlTaDp/lqQZjn7Thhmi
         GheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159253; x=1790764053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NuOH1NXcB2AiI/hLtOWQM1XgjcXBrhm8FLEPIqXD8M=;
        b=JLsQWXbZpL0WrQZyqcgDfMT1geeAkSjoTlkmsuPrTdYe/JRLe7GsS9oJSxlJkesHPB
         /jAk2jcHimt0uvzQi3XhujkNLSze54b//jQ3Iyt1Klt7ep5/Oiy7K14wzprRie4EgRfU
         iliFfgv3mw53Ptknzbs+B0RDw5P50rp7yOZZp4zbHKVX1vXM48gV9DzUNZOnumlq2feo
         D/KgBcsZE2gPcjp+LlLc6nR4HmOiB4nc6LrMPuqCVqz6GY7Tu1q3ybYPENfECiupIbHP
         vzsgvnWwixjiJiBK464gAr7mHRkfI4DsF7NaQ9umy8Z/WZ+X6wjX5FVSBM8uRDuK+MLw
         qqsw==
X-Forwarded-Encrypted: i=1; AKwUvBwEQeHEen3r4k2I/aEgdHLFU+gmfELrV/f9vyTjWT/hmXWeEUEgFXkzgPVxt8NZVOHh5r1SDU7j0RkLqyM=@vger.kernel.org
X-Gm-Message-State: AFuF++mjLh5l3Ns4v2K0QN+dUfMXqoP+75x8LAocTh7q7pubbMN4/7ez
	lYsmih85yaCg/4OVPz+sHGW3rANzwwaaou47cfOdnIs5ztCI63ijQIsmGsDPxL3K0VuW5Mk47Ma
	Hof+sHbxdkUpA+lxcUxviKvz5zyyz/TU0BJbXFzG65s43fZ99dXo7sUEX1q/yT/Qzxp8=
X-Gm-Gg: AYBFou2yERepuwFFxjI64dxpEw+Y7XWaT8MrLIO2LIx/S4qHm9UnWcYLqgggXNkRZn4
	i9uEVYBYkxgDKQlffKKs+e3oEBhTR2swwOo8s1KnrDFQXPTez/KFvkqEi37r/sQ6h+VIioO+IBq
	Zc81UwaafNyj1OP4VR1Zt5y31fY2Mdppk0Ps+TCW1J/gg/01xuI6v4uQpl+EYAPm7iuY95ou2aK
	EHhRptKyJ+DWCJc+E4yeQPGrPHIEtffX/KjewJsCFHJm+xlR6d/Bi2k8XBsDfRxTMhb7a1TSLdM
	7vtlNjxagwLXFdJrDgsTDE2Xb/Iu4v0tsNDyR4XWAeHJzhXbpjaaR4MEMaRISAj1a1uloh9GPbO
	5fb4j3fz0bJhGhUFHLk3RFnM=
X-Received: by 2002:a05:701b:4187:10b0:144:ff51:2d5f with SMTP id a92af1059eb24-144ff512f97mr576928c88.33.1790159252598;
        Wed, 23 Sep 2026 03:27:32 -0700 (PDT)
X-Received: by 2002:a05:701b:4187:10b0:144:ff51:2d5f with SMTP id a92af1059eb24-144ff512f97mr576909c88.33.1790159252108;
        Wed, 23 Sep 2026 03:27:32 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:31 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:51 +0530
Subject: [PATCH 11/15] dt-bindings: display/msm: Document A845 GPU and GMU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-11-0c3c79a1a470@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=4840;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Di/O0uiu9sPfgbWZQ+DWpyFRPmaRlm3RFUo2LVR7Grs=;
 b=oSIRTIhIZTWgDC4dXD32uIpXePSFy6yeSCHpm1fL/BJX72Hrv/9/RdQGTvztY59Hyg5ntcCm4
 jHdUKpXw1dgALp5yZOyf/ttjpjDm4SFkpgAu8+0TssXWGH1uhbPRZd8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX+PPwmqK+dgJl
 c0lRklz1Igyj4lDRUbo//zxCYJii0hMihpaoIRM2DLXzT4dHxHieWK8G0lh7RQukoOqG3Mp9PpD
 e5IWHrJK4rpw+Pot3MmAuhg3gzIq2aI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX/0mKkUkZGqZp
 yor4Y52zG8dI7ccXpHz3xEUBcrZm9cFJA7AbKoyZhAnBSfnX3UKiv5GFmwILI1iYnRvhrjAISQ6
 eylxXKSQLUr7ZhnDjpj8ppkHmTrgxr0jIUt1GPgS5hds0KjZG28a+yK0HHfF5Tg7yiVmvB29e7m
 dwYeI0yN9IUd/PH0gSb0BiI0lm0z2G5ud/pIHdMhm6FPbXcZITzITJeGheAx7KzbJA1aENsRp4G
 9J48O+Urs+Wfkjpmp9/QkN5OC5B4aFnj4CA8TBN7K4aWNhCH5ehV989s9TO8qSvCUk04h8vs6QC
 a0JMgqT08JhmclqN3XtlEYdV2qF5YACI6vIW3h9CgbMe0ralutgzgu5PAaW9WQ7WoV4yzJDLHte
 nCiPuRE3kIsU2H08LY+O+td1Za+iHRkIhhibvWw/91kcUwRcw1fJKtALiFl2RUdQxosYI6haxhd
 yr7dgOmrJkX+qsSxjGA==
X-Proofpoint-ORIG-GUID: vb2XN4_O6-tTz-GpzUWUYo-rIFAbnPSi
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3a995 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0V7fMRHxbeNora9F6bUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: vb2XN4_O6-tTz-GpzUWUYo-rIFAbnPSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

From: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>

Adreno 845 GPU is present in the Maili SoC which is very similar to the
A850 GPU, except the MALU block. It has different set of power
configurations and the GMU clock list. Document this GPU and its GMU.

Signed-off-by: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 54 ++++++++++++++--------
 .../devicetree/bindings/display/msm/gpu.yaml       |  2 +
 2 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 875fd1242528..be4feb87f274 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -367,7 +367,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-850.1
+            const: qcom,adreno-gmu-845.0
     then:
       properties:
         reg:
@@ -380,7 +380,7 @@ allOf:
           items:
             - description: GMU clock
             - description: GPU CX clock
-            - description: GPU MEMNOC clock
+            - description: GPU SMMU Vote clock
             - description: GPU AHB clock
             - description: GPU MXG AHB clock
             - description: GMU HUB clock
@@ -388,7 +388,7 @@ allOf:
           items:
             - const: gmu
             - const: cxo
-            - const: memnoc
+            - const: smmu_vote
             - const: ahb
             - const: mxg_ahb
             - const: hub
@@ -407,7 +407,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-x285.1
+            const: qcom,adreno-gmu-850.1
     then:
       properties:
         reg:
@@ -418,42 +418,60 @@ allOf:
             - const: gmu
         clocks:
           items:
-            - description: GPU AHB clock
             - description: GMU clock
             - description: GPU CX clock
             - description: GPU MEMNOC clock
+            - description: GPU AHB clock
+            - description: GPU MXG AHB clock
             - description: GMU HUB clock
-            - description: GMU RSCC HUB clock
         clock-names:
           items:
-            - const: ahb
             - const: gmu
             - const: cxo
             - const: memnoc
+            - const: ahb
+            - const: mxg_ahb
             - const: hub
-            - const: rscc
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
 
   - if:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-wrapper
+            const: qcom,adreno-gmu-x285.1
     then:
       properties:
         reg:
           items:
-            - description: GMU wrapper register space
+            - description: Core GMU registers
         reg-names:
           items:
             - const: gmu
-    else:
-      required:
-        - clocks
-        - clock-names
-        - interrupts
-        - interrupt-names
-        - iommus
-        - operating-points-v2
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GMU RSCC HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+            - const: rscc
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3438eebf2fa4..a11a4dba838d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -415,6 +415,7 @@ allOf:
             enum:
               - qcom,adreno-44010000
               - qcom,adreno-44050a01
+              - qcom,adreno-44041400
               - qcom,adreno-44051401
               - qcom,adreno-44070001
     then:
@@ -453,6 +454,7 @@ allOf:
               - qcom,adreno-43051401
               - qcom,adreno-44010000
               - qcom,adreno-44050a01
+              - qcom,adreno-44041400
               - qcom,adreno-44051401
               - qcom,adreno-44070001
 

-- 
2.55.0

