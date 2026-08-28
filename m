Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6412946EC90
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925947; cv=none; b=ZadMlNoyv4+Tvb5olz3snjuIJwQ6T1iwuO9J7BahoYVMWpUz1KsnT0d0NP1K4erAIcg+Eq7+sQm26fB06aClPiuPRq2loeJSlmP3Oj4OfTB/UeLQD/qN9qpkWG+yMTvhZiCNbWh9Pc9gPyVDnX+68FJAxQaLITbzwLHhkoBcrYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925947; c=relaxed/simple;
	bh=caxf4nP0LYhd5tTHzg34r3IHakvLdeyikIWGEpS/fMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+AGL6yNzqnQ+9hbJycyLJNupRTYf1EVJU3gefBXjvpd8hS3ygKVySx+37inzlUV/TCVvFo0HcdN/9mSsViVhuF/HADwWe7KFG787NS2La5S2HWkYdZULSLREVjeuiBu1wjg1tMOgERzlW/syxKemlAB6fmA4FJHAw0niRY0S6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJJm6zRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdJu5HEo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJJm6zRl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdJu5HEo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDknhn3205948
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q5nvjyWQigaJq/X70FSOqlsHb5yUcVYouF+wJkhwBr8=; b=IJJm6zRlwgC3LIRR
	Qsl+RRGaixMMNMB8vt37n/3o15KRcAgacEop/PAOXaDLSHDWAq4zWiXA6rOHoU1/
	wRY8jyL6tjQ7aUhNwr1u3Z1LD4RehDK4BM7xhyj/8Ux12o2ZJwUyZx6d12qERO4b
	+wXJABugKmTdcE1tTJR9vCETOIFK6B010OhDeFfX0nEDyq9qS4y7/UZoI6RPFHSc
	rhhiwWW2zALuM6gdSG0usU+GOt3KzemyFNigbTM/JIWl+Whakt9AgaYOZjRQXrcu
	8gTxDmHCSLXfwPuTnzClNvxc8P76aHs0qixAr3eSvL8yx47wbeuO/Ii6OmVyZkeZ
	wxBx1w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb7eh10yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-784eaf6cdb7so260417137.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925941; x=1788530741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5nvjyWQigaJq/X70FSOqlsHb5yUcVYouF+wJkhwBr8=;
        b=cdJu5HEoehWoSJDfYNnP4nHFrpm6bTpkM4oUeNkhxcR0q4I5T7SpmQWAhHnQd1FDE5
         NKKDeOvyfOg2azZ5HLt3kUJyzJEyvazo6lCoLl288gc9V/oRBbVHftHPnv/a+GWruobV
         i9eVXHBjfJMy9FVmudkNdVSmdQONnK8M+73Q+NvyEXMhpngacGkpdBIEMznRgBAvN48Z
         cnw3v4G3m2bA9Z7s94H6OahgoOW77hnRBgaB7OB7HBEV0CGokDyhKa5tdRMhOZkM606h
         wpr9Q2XqOM0aFbe/6OhVOgwXErjetzNTPWgLBN0JbFODcyR7E0uMynSTv7ko0dKebQLr
         rbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925941; x=1788530741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5nvjyWQigaJq/X70FSOqlsHb5yUcVYouF+wJkhwBr8=;
        b=hjEQ9qDke/RJ4H/qvb8sNhLI33NAJ1mqSzBIwgb4uhytgddrpuVNkP1msVRm9dz7FB
         LRBM0bpXKlyJkkyZW83fpmbhV7/kp0dcNJFaaKiYO+IOZBAIPqORFVkbIYO7MTEb9Y1D
         871SszKtA5nu/y74kIZK6WWH32PAKc/H+KOtle02qdKT6/kp0Dj4z1PUNGTTXk/6knfR
         Lil1jM8pkHsiV1bhz/VLz9Rt2/uf7YOy3tmPbd+lyAv/MoMo6KW2MVTHI2fw1qQ5JLvn
         ZekLghNg/HmKMXKYQcKVPS40vFD3mkCnE32ewlc4sXfoO+Dol9nlU26LCoi7qypsiebu
         UK8A==
X-Forwarded-Encrypted: i=1; AHgh+RqhoL0pJ0Dx2KBDiAWg/4YLAG71WxAj8qb1uTKtLauTrHCPcEuBu1cuGOkMFMoKA1lydZxHCS+x0LpyJqU=@vger.kernel.org
X-Gm-Message-State: AFuF++k+9PrDMPqZI88JUOlLOMDC1inuNU+sTWorSlkHXpMywTTbqmWJ
	pQnSPcfP4HDffBk6SiFNSpQYGKTu2BvrufUC89zyonWBLDmjPhNWCISkJFxTjNqlH7h9wm7eaWa
	E4VmH4csBC6xTnbUMk5Ca0++XBYBd0b854PQat8gWyXAaeTAyO73dPdG4aEOfbdsJJh4=
X-Gm-Gg: AR+sD104ykw2mney9KXIQQqkMsf1vJp2yObLyEoZ4iUJ/wwf3x3IOj0cDljhO8VR/j3
	bwI6sr4p3pG2KuYyOhU8Q1xT0VD3owWLNOxDMXdcBtMMG7Wx4lPBUsmQx6Mw10nDx3fNpOBt6/J
	TzfK6MoLfhuOzbOkZtaUT61xW4kupWkpNCQP9AV0jVhGy1Gt7A+eodjQolk+l6XH+thP5Db0B1S
	lOO94NH+UBIuf+PSh5KCGWNvMZHJIG62O9StDqsY4fdQgVPM9vdUWfDBky7qmfvA0vLHBxD1uHN
	XUjdbpDOHoVxOG/AhbgAi+bJasjte1qVqERct/cq0L+nJEJr+DI77VRGd1Pib9epKRiWuZz49K3
	1lA0gPabaw07MqVLwXeusY4U=
X-Received: by 2002:a05:6102:f9b:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-7859946b444mr2147814137.11.1787925940857;
        Fri, 28 Aug 2026 07:05:40 -0700 (PDT)
X-Received: by 2002:a05:6102:f9b:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-7859946b444mr2147768137.11.1787925940211;
        Fri, 28 Aug 2026 07:05:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:03 +0200
Subject: [PATCH RFC/DO NOT MERGE 05/12] dt-bindings: display/msm: hdmi: Add
 Eliza HDMI TX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-5-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7950;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=caxf4nP0LYhd5tTHzg34r3IHakvLdeyikIWGEpS/fMo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWcR5kCraTeaFlb37qcnOqd4rhI8I3jzoXSI
 zJeI7SgTV6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVnAAKCRDBN2bmhouD
 193pD/9Pw8KOp7bE0U7nphpfhHH+pJ5kmrc9xszbAWpknu41CZuqBNzvnIVmI/87O3l04yu+XM/
 nIZXHGSfzXXT3/VCAi/PMq707DZjAL/y39fRt2+ctP614cFbko3erU81p7ojZkGqEcZY6eH8puL
 yIwxHDEmOcdiJR103GYYowj+hBdedNMvx196rHVh9QJ1AMwIOk8llTZVKg4L0VFnBqDUJnutK9S
 Xgy0PldBUDOFC5SdLr6jv5R2vh8zYVbdL+VTvTGcKSKVetvgkW/K0Y25ThXx70xBMpik+W9Udsv
 EubDNTKHwL2qFLFo+Q6L2BwQskm089cA7Q0zTMdJDbZWsa2Yu1LJsbgEPAiOb+f3CMrkiljvidx
 JHfqVQtcfw9wSnxz7v/y5v/l0f67OIvX5a69xWT2Yjafyvjlf4f6FSgfuSxdqEuPmtyMWv9JKC1
 Zu/DbOZAA5Hcecqitowd1arraQY9pdxP0JY95lc9/05K9sqKXvII2XL06xIZ2dJYR3lGAsOltXt
 fDWwLDAgzHskVUCiU4G6IxqCmLSP4qSsg/dgfeOtvBBmR+k7WbFj2+iOoosSwNm9xJEb/u7H+w9
 liGE2Wfk14hL1+/7opR6DhrAsyFy6xiPYGoRh+aEKoFkcTiw7uTLasmvPbgHgjJv6JsXITndgjd
 8AB8HTHR70KHKaQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Aw1j9EbgdXv6GAKKOlANGjokDobdxLsO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX5Q4B4+RrRXa8
 Z19m9a9KTTwlN1clLCew7itm45B2Zr7/NEJgvy2LeW7fNi1s/C+i0hyOe3XFXIvHvDJZae88Qu/
 wBIhdrRdg4dmbDrh19//53LuQF0l7/ZPj0UaN6j3S/I3ZSrYIEGVMsTcLIC9TQc3TyCPa0CUOaL
 /7t4kOz9leFScUQbgcQsHdmQzkTDRxVX4Nbu0sZiUrKBXuYvRfde3uxdTkfEAx1kQDcsyybJ1fO
 Irg+LJNc5f2fcPz/yigaVqt5DjqhfQ0FpDUM9nyX0flDUAisAy4Ee1sX5LxAArUXbpfIMKKIWVL
 yCR3wAqoZwaBLHd73mz4WI/DOitSAGvCTxmeK8cXxNz5MVQMrW0ztlqpffRIKn5Ilsv7DDP08RQ
 BzCex1DjRXZqZGu6zIMyPYku6TzpidVdOMLpHr9GxDyIcNBsoA895iKh6X6MBkaEYt9umyy70R+
 TzAlRRCBEVhTl0qpAAg==
X-Proofpoint-ORIG-GUID: Aw1j9EbgdXv6GAKKOlANGjokDobdxLsO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX9wgzcep1lxdS
 Pv9CFw2gU+CjPN/AogAL1Wst22xyLrMDpNTHK87LRjfFMr7kW3qMoY11B5JmjRSi8/uPSeYWx29
 8xQkrfjC1q/1l6aOfN64mx+GjNppiNc=
X-Authority-Analysis: v=2.4 cv=RoP16imK c=1 sm=1 tr=0 ts=6a9195b6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U2XnKTW_qBCVAJQLEIUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

Qualcomm Eliza SoC comes with HDMI IP block, built on top of one
previously present in MSM8998.  There are just a few differences in
hardware, mostly about handling clock reparenting, but more notable the
old binding looked incomplete, thus devices could not be considered
compatible.  The QFPROM MMIO space is not really part of HDMI, thus do
not include it in the new device support.

Document also VDD IO supply, which is providing power to external 5V
elements, like HPD pull ups.  This is not a suuply for internal HDMI
elements, thus it is valid for older variants as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/hdmi.yaml      | 67 ++++++++++++++-
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 96 +++++++++++++++++++++-
 2 files changed, 158 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 02d27ccad024..6adaa095b747 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,hdmi-tx-8994
       - qcom,hdmi-tx-8996
       - qcom,hdmi-tx-8998
+      - qcom,eliza-hdmi-tx
 
   clocks:
     minItems: 1
@@ -35,10 +36,7 @@ properties:
 
   reg-names:
     minItems: 1
-    items:
-      - const: core_physical
-      - const: qfprom_physical
-      - const: hdcp_physical
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -62,10 +60,21 @@ properties:
   core-vcc-supply:
     description: phandle to VCC supply regulator
 
+  vddio-supply:
+    description: IO (e.g. HPD) supply
+
   hpd-gpios:
     maxItems: 1
     description: hpd pin
 
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 1
 
@@ -113,6 +122,12 @@ allOf:
             - const: core
             - const: master_iface
             - const: slave_iface
+        reg-names:
+          minItems: 1
+          items:
+            - const: core_physical
+            - const: qfprom_physical
+            - const: hdcp_physical
         core-vcc-supply: false
 
   - if:
@@ -136,6 +151,12 @@ allOf:
             - const: core
             - const: alt_iface
             - const: extp
+        reg-names:
+          minItems: 1
+          items:
+            - const: core_physical
+            - const: qfprom_physical
+            - const: hdcp_physical
         hdmi-mux-supply: false
 
   - if:
@@ -159,6 +180,44 @@ allOf:
             - const: bus
             - const: mnoc
             - const: iface_mmss
+        reg-names:
+          minItems: 1
+          items:
+            - const: core_physical
+            - const: qfprom_physical
+            - const: hdcp_physical
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcom,eliza-hdmi-tx
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: iface
+            - const: core
+            - const: extp
+            - const: phy_iface
+            - const: pll
+            - const: pixel_src
+        reg:
+          minItems: 2
+          maxItems: 2
+        reg-names:
+          items:
+            - const: core_physical
+            - const: hdcp_physical
+        hdmi-mux-supply: false
+
+      required:
+        - core-vcc-supply
+        - core-vdda-supply
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
index bd4ba91a171f..6f50f7106c8f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
@@ -63,13 +63,22 @@ patternProperties:
         contains:
           const: qcom,eliza-dsi-ctrl
 
+  "^hdmi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,eliza-hdmi-tx
+
   "^phy@[0-9a-f]+$":
     type: object
     additionalProperties: true
     properties:
       compatible:
         contains:
-          const: qcom,eliza-dsi-phy-4nm
+          enum:
+            - qcom,eliza-dsi-phy-4nm
+            - qcom,eliza-hdmi-phy
 
 required:
   - compatible
@@ -79,6 +88,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+    #include <dt-bindings/clock/qcom,eliza-tcsr.h>
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -405,6 +415,90 @@ examples:
             vdds-supply = <&vreg_l2b>;
         };
 
+        hdmi@aea0000 {
+            compatible = "qcom,eliza-hdmi-tx";
+            reg = <0x0aea0000 0x1000>,
+                  <0x0aee0000 0x1000>;
+            reg-names = "core_physical",
+                        "hdcp_physical";
+
+            interrupts-extended = <&mdss 8>;
+
+            clocks = <&disp_cc_mdss_hdmi_ahbm_clk>,
+                     <&disp_cc_mdss_hdmi_app_clk>,
+                     <&disp_cc_mdss_hdmi_pclk_clk>,
+                     <&disp_cc_mdss_hdmi_intf_clk>,
+                     <&mdss_hdmi_phy>,
+                     <&disp_cc_mdss_hdmi_pclk_clk_src>;
+            clock-names = "iface",
+                          "core",
+                          "extp",
+                          "phy_iface",
+                          "pll",
+                          "pixel_src";
+
+            operating-points-v2 = <&mdss_hdmi_opp_table>;
+
+            phys = <&mdss_hdmi_phy>;
+            power-domains = <&rpmhpd RPMHPD_CX>;
+            #sound-dai-cells = <1>;
+
+            core-vcc-supply = <&vreg_l2b>;
+            core-vdda-supply = <&vreg_l4b>;
+            vddio-supply = <&hdmi_5p0_reg>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_hdmi_in: endpoint {
+                        remote-endpoint = <&dpu_intf4_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_hdmi_out: endpoint {
+                        remote-endpoint = <&hdmi_0_connector_in>;
+                    };
+                };
+            };
+
+            mdss_hdmi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-150000000 {
+                    opp-hz = /bits/ 64 <150000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+            };
+        };
+
+        mdss_hdmi_phy: phy@aea1000 {
+            compatible = "qcom,eliza-hdmi-phy";
+            reg = <0x0aea1000 0x1000>;
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&tcsr TCSR_HDMI_CLKREF_EN>,
+                     <&bi_tcxo_div2>;
+            clock-names = "iface",
+                          "ref",
+                          "xo";
+
+            #clock-cells = <0>;
+            #phy-cells = <0>;
+            power-domains = <&rpmhpd RPMHPD_CX>;
+        };
+
         displayport-controller@af54000 {
             compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
             reg = <0x0af54000 0x200>,

-- 
2.53.0

