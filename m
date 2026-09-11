Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D6455623
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114897; cv=none; b=g0AyllJzeiUuzP1AyD/3ndZsD3AnbdVB4xdpijEfPTRXqkZuKUS0sMJ6f/PktTFS1QhWszYAtuRx7UETYnWE/nsS+AJFfhsDOr+UQnwa8NtE4YeyioFYHnGswwGlBq16LWTb5v0aBQYhFXpvXhfUOnNNtqfXZEgxpK4AjZ7ntak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114897; c=relaxed/simple;
	bh=mwkLRTFPxbfx/aCfkpcg51GVVHCgt7ycr1rCcEhiNDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbXPQh5r9VC+glP7jeSogpkbR+mDKHY7PmO+r5+d/551wEPBfpJUsHS1u8SIBgy6DsOXWnhg8CuEmDkNRcmBwTTRgy1yln36wKbTuX1istz3D6iuAXVCSL+MgJ5Z5JXa+MtaTHkH251ihc3fAJR7W4fC63uaFDUjjsL/LxrBCmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/XxxEJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDK4Rhbo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/XxxEJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDK4Rhbo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kjID3366326
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Oy4TzhqSJ/D
	vWDw+eqBd+EceR40UC6PEjoMrpbwGDes=; b=W/XxxEJNoAeJNvZ337GB9TlInf8
	wA54YGHHFFC/Os0G7DNNqCb7dDQUVhOfGdm82SXtwu0vdxNOq1+BRGVamzPMkBnW
	UaRa6tAMPREMP88s3qqwatRTI6ltF54mfCjvJi8y3EgUmhZdkXqs0Dcb2Pf4wq0V
	+8h85WAUUR2l9AYdmySD1tAszdCTNz+vEjKl1gcXn6+3epbP6TKZxQabzPj6p51B
	xWfFmKs5VaS1EL5HXdf7aYrcR/17QCCwcN79kyQLp3TcbOGvTwnLHRARnEKWE+7z
	0YwkNzNGuieKkVMs242oINfp4G55WGCgFzfC9VopUpKD/Agn/p8kXAFcDJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2au8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:21:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936e393061dso86731485a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789114894; x=1789719694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oy4TzhqSJ/DvWDw+eqBd+EceR40UC6PEjoMrpbwGDes=;
        b=PDK4RhbopmZaWYmwaezKiuC/uoPckGoa8vF7MuNwN5PhhrrJv8NOjq0xvTVdembAf5
         V1ukbiOCZeY1gArp4V7Ztyr2FqCZ+hFZMQTEvXBTyLicmA4qvMF1Cg8DiHe7/zA48J2Z
         ZAYOefqE1NcoKouq+D2xZvDIFZVXDJcbJ1M0Pc9YXSB6nRbS4AG77a9Y57ePYLFEGYQe
         1DQMRcocMEUOx3O8jWg07QpnsbmpNBTAOgYHgI9oS8Xck5n5GXN86ZbiCQdOIa1iDQTG
         aiInkzMadU3J5gv7kZwRoXTe9KQAev8aQStWUoVkptD/X2eDpVpDWC343TU3OmUd/BAu
         7KGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114894; x=1789719694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oy4TzhqSJ/DvWDw+eqBd+EceR40UC6PEjoMrpbwGDes=;
        b=IRkARCe9rNtTESYdXhaomiEIMZcEvHNxLBKJyeAEpO86YQHx7H01f7q+duTOe63q/4
         ldtvU5w6aq++hGE0lL17bv2Wk9OPDpF4oQxk0rmuWn8MgP0/nwIJUSTWQqtgC7F5TQ65
         e1j2RFN4jloSKfhsScVyoe4SJuuSGkFitYB81n9/BHMFTRMu/gBz925UOjf+EAvDQOcn
         GVbqoG580Ues8BRFXk4ZTYNW7XILSevX1SX8E26+bYvqjXuSk9e89zmKmLZt9U6qQLzm
         uGV8zO2U7UrTFSqmurGFnBA0dxslXzAu2hLaYZK1+kEqsqozt7Ttnu8GovvhgSU8bAzL
         /Axw==
X-Forwarded-Encrypted: i=1; AKwUvBy2giSsFV7XtbmHuGgoDYBQEVVdVyas7KLbXxiT5Y6UgrQr1ptiI3KNfN8Sm3kgm98SeSmfwU21vECyjZc=@vger.kernel.org
X-Gm-Message-State: AFuF++kOmvlFasLbZP9vgI1mw+dpphkNVAA1Kqlq2gL52W7ImUM9K1m/
	Xb9DCxH/9GFbfIJuW5aZBgNH5FPuJyjieAAVZpRcgRQBhXvQ5joYJYN5VVzTzL52yVAiWV/pjMG
	iml/egz+kCti8MlIKnb6ZgDwgHk+gmnY+lH+qhKoM90RsAg78gjYKJRMtoN7GkCpAF8I=
X-Gm-Gg: AYBFou2moDu+ku40tXKRyx0Qv1pw8uRNa+Y0qOTsDCXF+7UJExRRq8z2y19y+dtMcwf
	K5jVFZ3Vl4Z2PoACj622oDK+cyZc6IbiG9zTFWt/KW//zv+2ffRk5bHZNyz50480Hwvo6icT0r7
	q+uFKhksAkVh2/tUUefaNSJQZPI7rYyNPVPgK3BuDp9KXrk3BEfKug/mdEH+Egc3xQ9UyXbDYVl
	aRIV7rk7xcdlZwtfVBAqkaVn92EMHRA2in/xyK4zoaIDk6HohlrpEHeHppe8dI7uibVnhrtPt+g
	1fhuNhRmNi0DBxPbWJP/tc5hZKh/HKz1R4ZzzO0nyWvH/8RltgM/+s4i1N9FEmugl0v+vZnF0fW
	I2SdkAhZc1buw4w==
X-Received: by 2002:a05:620a:19a4:b0:939:d459:4810 with SMTP id af79cd13be357-939ea13c59bmr382467085a.26.1789114893498;
        Fri, 11 Sep 2026 01:21:33 -0700 (PDT)
X-Received: by 2002:a05:620a:19a4:b0:939:d459:4810 with SMTP id af79cd13be357-939ea13c59bmr382462785a.26.1789114893005;
        Fri, 11 Sep 2026 01:21:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4488880f8f.23.2026.09.11.01.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:21:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: soundwire: qcom: describe multi-master
Date: Fri, 11 Sep 2026 09:21:09 +0100
Message-ID: <d7b3d0618f20d18f714217d9604a7c09a3539578.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3ba0e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Na-TPb6K_91XsI5DB0sA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6NExnaA8ErUWPUU31shx0bmck2_SX6k2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfX9EppyE4P6KfR
 AeJcG5dkredD2BNJfedRC7dtGIfGDLMo7PecIMY4w18FJMilwuGS8O0+Cnaz+je9UdwWlS+S4rK
 Of1ESlFOVzQtG095Lx+Nwz+RiUjLuQY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfX2voIIqZSwH4V
 0TdCe7HXyMlc1vJorvJXxMRDiZ7OCHe4EmKPjBNY9LTL+IauPF7X2WMZv2xiEiYmBcstd2oXnPv
 vt6AlHpDVRBh45FEQ49fBA2JEwVX0YRQKpjhPM4QyI9JUm2L/62nCo2cG9mJVBcM1LBBK2lWdDN
 xP58AaV6VwtJbuEJnVT6Ee03kg4OsSFqfgBnCX97SkI0O/A+j8v1zrnw2gTGrjyNu90KNf50YIt
 rgup6ncnrWawwCYZHijUtT6Y9A2SLWf+z8Oka4xMpPhOXbDmolBhGAiQJfNop/iCci54zuuaQKH
 Ma0hoe9OBnrYno/ukMxXPsU7Dj5lbxUqR2o9YxqUCLIGPz/SwgZ6BSXkCyLRlyXH5TS+ti48/MI
 cX5XLp08hN56qx+LADYG/iHO7JONnBZftwtpe36rPxORMUs/sKt5qSdoO3A7dQ6IOMaRqXvPbng
 SP6YiTaWxXrFkfn24uQ==
X-Proofpoint-ORIG-GUID: 6NExnaA8ErUWPUU31shx0bmck2_SX6k2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110116

v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
bus with more than two DATA lanes. Add the two properties that
describe such a pair:

  qcom,multi-master-mode  role in the pair ("primary" or "dependent")
  qcom,multi-master-peer  <phandle, bus-port-offset> to the other IP

Both nodes carry both properties.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 109 ++++++++++++++++--
 1 file changed, 100 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 8e6973fa229c..6cf3285ded92 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -215,6 +215,36 @@ properties:
           maximum: 4
         - const: 0xff
 
+  qcom,multi-master-mode:
+    description:
+      Role in v3.1.0+ multi-master mode. Both nodes set this; the
+      primary owns SWR_CLK, the dependent contributes DATA lanes
+      only.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [ primary, dependent ]
+
+  qcom,multi-master-peer:
+    description:
+      Peers in multi-master mode. Each entry is a
+      <peer-phandle, bus-port-offset> pair. Peer N's DPn slots
+      1, 2, 3, ... occupy bus ports (offset+1), (offset+2), ...
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: peer phandle
+        - description: bus port offset (last primary-local port)
+    minItems: 1
+
+  num-lanes:
+    description:
+      Number of DATA lanes this IP exposes locally. Required in
+      multi-master mode; on the primary it defines the boundary
+      between local bus lanes (0..num-lanes-1) and lanes contributed
+      by the dependent.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 8
+
   label:
     maxItems: 1
 
@@ -224,21 +254,82 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - '#sound-dai-cells'
   - '#address-cells'
   - '#size-cells'
-  - qcom,ports-offset1
-  - qcom,ports-offset2
-
-oneOf:
-  - required:
-      - qcom,ports-sinterval-low
-  - required:
-      - qcom,ports-sinterval
 
 allOf:
   - $ref: soundwire-controller.yaml#
 
+  # Single-master (no qcom,multi-master-mode): needs port config.
+  - if:
+      not:
+        required:
+          - qcom,multi-master-mode
+    then:
+      required:
+        - '#sound-dai-cells'
+        - qcom,ports-offset1
+        - qcom,ports-offset2
+      oneOf:
+        - required:
+            - qcom,ports-sinterval-low
+        - required:
+            - qcom,ports-sinterval
+
+  # Multi-master primary: drives the bus, needs port config + MM props.
+  - if:
+      properties:
+        qcom,multi-master-mode:
+          const: primary
+      required:
+        - qcom,multi-master-mode
+    then:
+      properties:
+        compatible:
+          contains:
+            const: qcom,soundwire-v3.1.0
+      required:
+        - '#sound-dai-cells'
+        - qcom,ports-offset1
+        - qcom,ports-offset2
+        - qcom,multi-master-peer
+        - num-lanes
+      oneOf:
+        - required:
+            - qcom,ports-sinterval-low
+        - required:
+            - qcom,ports-sinterval
+
+  # Multi-master dependent: contributes DATA lanes
+  - if:
+      properties:
+        qcom,multi-master-mode:
+          const: dependent
+      required:
+        - qcom,multi-master-mode
+    then:
+      properties:
+        compatible:
+          contains:
+            const: qcom,soundwire-v3.1.0
+        '#sound-dai-cells': false
+        qcom,din-ports: false
+        qcom,dout-ports: false
+        qcom,ports-word-length: false
+        qcom,ports-sinterval-low: false
+        qcom,ports-sinterval: false
+        qcom,ports-offset1: false
+        qcom,ports-offset2: false
+        qcom,ports-lane-control: false
+        qcom,ports-block-pack-mode: false
+        qcom,ports-hstart: false
+        qcom,ports-hstop: false
+        qcom,ports-block-group-count: false
+        qcom,ports-ch-mask: false
+      required:
+        - qcom,multi-master-peer
+        - num-lanes
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0

