Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF944E4C51
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717721; cv=none; b=HLpQfZurYig8VjGxr8QsFqBehSlrnBsS+a5YcrwXz1OJcK/WaIxLxoa7/76N6cRu3FmtoeIfokQc1cGPCswZMu9ZrFslvK4nVCm78RimxSe1Kv3HNVejyxerL5rKbD5Bm1MzA3V3JjyQgIEJVEKF1FXYjveHx3FY56JjzZVQlnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717721; c=relaxed/simple;
	bh=NS67m12FohtVTM0LAceMS1EJYY9P5UQk+hL/TSpoW4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CkAvv/vWZgF+wJBYPNO/Wnj+Mph/LbbOFyxrrW8WmTvYffu5YOwwDnfqb9cjD3wqnURaRfkN2OmTmkm3ZfFmLw7hlfu4L8d2jBKEydVAVpLjJfZdE6g64ChWLBWMtthHV3G/NljpdoN/8zBA7xZPjLCWa6w4lGXL3t+3l8sGJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/1nLxeL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OhFQ3Fnd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/1nLxeL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OhFQ3Fnd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TL2IP8708107
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mjs3rlDnLUk
	N31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=; b=K/1nLxeLKcYSOxfqweu66c3+R1p
	QbVy+Iu/N3Uv/tIvQL3P1IdYDW4f5g2qsi0jInw/n7+nqih3o5G55Bc8UXRd4QZN
	Bh1u1YgG+S2HJml3sFEHmvFsHJ8VeLcbbjIXGilmXr8wkdaYKor7dd1/bE3RPn75
	WI/oG01P+QNmVVaJj6kwwpe+vPQCSK09wIvENKbbJA2I3pbYaD7WJXCt5OkpE4kk
	pzYYcRcRTFd9WlRSSjGV4rIdHQjOK4WTV8Y9ewDwirLoHHwwhpa3GOcNf7LQQ4AV
	TtRS/Rb9R2yn4+2ULGg/ECOmuGrNTCycm/sAK6Zm5iNfttMuchshr/eJEVw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0g1ksk8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so9274095eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717717; x=1791322517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=OhFQ3Fnde+X8RiPmzF2tZEPg6aG7CH0/5Xoj1+kHOJvIluaCsjX3aWSXqEOLrYWdnP
         PZVPuN1+0Y339dGauDBXVFq6IUVcWQKh02fOhWcfrhvMi0cPsEiMChBr5058zjD3bEz+
         0e+AiD98O8/U9tp+4uF15ODFDnsJrNgO8VkKSPrrUayAD+x9A/RS7ehvxQa12VDdfHHI
         FlLNVYkF4Na4JgkZX5yxEf7RMh7eDJbHkBCObg7uY+w6dnvHuagDbZF3c4tXdVR1413L
         TVQ8Fa9CNPXG50rdEVk3RPTzKGpNdRp9fTvLTgzpF/KIB8/Wocein4508EKR75BKrBms
         ghIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717717; x=1791322517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=LT6qqCnR+7R0zVdXFCEojHe866kXwFShaRunI3iz6QdSZHAKmsAM6IlZojc7AdT+YA
         00cXd6/4buAKjMlsXxAalZHz+QmY5dbtPOC4Pz0jU+z6XJRIANuckDjlDVcZwwTIFd05
         FCmt8NIBLp9Zpz3ndlXKhdACVzVphC9+LnMX/2ieJUHMxUQ+npOThC43lu/olfUZHktS
         LE/UOlq14b3cZ5z7slQjXuyEnKDnsqC2yOybcdRI3Bz3KAqdiqZXJ5NBEUg9JdS6v+UL
         h4+fLKfjtvhp/uSyC0dCLXcX6km5c4WGszfL4Dgk90AyNQsyrzM5W543vm/iLvLtVY4J
         e4yw==
X-Forwarded-Encrypted: i=1; AKwUvBxSikGjtsalcUlSG2CgDbtX0fteoHjf8c1Hi4VTkn95BNuFZ1JKon00wXjdFUdOwTxBoEMOzMcAU3qd4rU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfqRYOtw9j74Fmy9NzBONzRx6OnFEqPpMRjpXEyJDXhPN55Hiq
	V6MAw9FzhjlWhvUgFFpif6PNCYx3tjCjdVc55Y6KhVNaMGYt86dI1Ko+sy9d8Fm1W5BP0t+j31m
	glwI7Xg1W7W0EmuhknpwaroeFBcf3YZCQVwMhuR/6dAoN1KAtWHoOsCoO1zceNyIQOX4=
X-Gm-Gg: AYBFou08osxib8eT/S9iduVDD1GYWazMZj/cQkRNMH8PnyeHxJ/3jUIw+GI4Fp0rx12
	uM8GmpZ64FzpFOVJnK8yYDMQAeoHcFNYvw1KQG2+kCFS8dE/DBw6xGrKpZ5C8Eyl0xa6BuFTiee
	BJnEPqWGsZkAdPfOc8TsfeJurmaPDQvGALvnmw8YBCL2VIaPbL91A/Uf5Rh/dlt8NviI4H0mTQ+
	E5CucCxYeHocqZc6Pax8eybfTwveVRLrtFZ68JytkVsx/qUuTGRO3D/pSfVxMU0aeXn7qmB1VtM
	THh11iZdhjSe3MLqe+EcZKi38Y7t7sl0AGJGTf7YOkoA71D8P5ZFr3eS6tiwesdmmbjdG5uQX55
	hlZQiRedhuG4mgdzPnj/+WdcyHu5DCcx9B70J9JcnWWQU1aI/bv9s
X-Received: by 2002:a05:7300:e9c5:10b0:33c:e74:4624 with SMTP id 5a478bee46e88-34c63afc496mr775806eec.27.1790717717131;
        Tue, 29 Sep 2026 14:35:17 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c5:10b0:33c:e74:4624 with SMTP id 5a478bee46e88-34c63afc496mr775765eec.27.1790717716443;
        Tue, 29 Sep 2026 14:35:16 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:15 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/8] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Tue, 29 Sep 2026 14:35:06 -0700
Message-Id: <20260929213513.2401005-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: J6kSm3SItoQwd56Zwz8Q-CoC2JyQ2eTo
X-Proofpoint-ORIG-GUID: J6kSm3SItoQwd56Zwz8Q-CoC2JyQ2eTo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX8dmiaB2rmlkU
 ajWoUSEIO0PkrzsOLv/5L9tp9pu/fXsX6w5dbyOujY8nAHbCOcnHmb3eijIZwPHh8ZWczH4t5S5
 AS/+xPkbVvWC3WrPAKKGWipmmT8t4C4=
X-Authority-Analysis: v=2.4 cv=Ysia1IYX c=1 sm=1 tr=0 ts=6abc2f16 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=RJ9lep_nkaVUh_m6BXgA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX+uTbpuLHIIoi
 MQ1K76L/l+6YuDkfS5dwAPOiZrSkXQdaOFX8P4W7B6J8eJyygwCp7+7VR5Ky0wqEuenB24FXpWb
 rNX406j0Bp4dhucIQAnmET6JBw7VOk6B3J4tn2YZH2ImKOR9nf7+9wOYFgxBOEAK8SCJkkewvoN
 3d70qS7kx5FYgT1xZfOnvk3LzH6oUu0HeuiAo4R0W9t2LwufBJpQJaPVmef1B2BHFKHXecEaN7t
 23zqDaQz9VLt12xxWAv37Db7cIG0/RmFZzkg5cPnfvN6hzhlpNKiyjsyZuhJel19GnUotZwKL5c
 9KhLS9WbqcB/4cSUwXllGsMfrHxbvwNuIqF4r4fvGwa5VkrcG2onyUmOyLnSILHbKvLEWP6tiej
 zlDcPi/Bu0iUDb6gqepKPZpbcSk4ObMTLIhniaVP63i70QloIZNay0+CHoPIcF+FMtxHGUZpE3g
 aa0hFJXSw2xjPW44mbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
EUD on the primary UTMI path only, while SM8350 supports EUD on both
primary and secondary UTMI paths.

Each UTMI path connects an independent USB controller/connector pair and
forms its own role-switch domain. EUD routes traffic based on USB role.
In device role the debug hub is inserted, while in host role it is
bypassed.

The existing binding models EUD using a flattened ports representation.
While sufficient for fixed device-role configurations, it cannot naturally
associate a controller, connector, and role switch with a specific
EUD-routable path. This is problematic for role-switch capable ports and
becomes more pronounced on SoCs with multiple paths. In such cases, each
path forms an independent role-switch domain and requires per-path role
awareness.

Model each UTMI path as a separate child node with its own OF graph. This
representation is used for role-aware EUD routing regardless of whether a
SoC exposes one or two UTMI paths. Add an SM8350 compatible for
dual-path EUD topologies. Retain support for the legacy flat ports
representation on SC7280 for backward compatibility.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 138 +++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..90dc104e4475 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,92 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: This port is to be attached to the type C connector.
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^eud-path@[0-1]$":
+    type: object
+    description:
+      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
+      to associate role-switching behavior with specific port connections, allowing
+      EUD to manage role transitions independently for each UTMI path.
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Path number
+
+      usb-role-switch:
+        type: boolean
+        description:
+          Indicates that EUD relays USB role-switch events for this path and
+          performs role-dependent UTMI routing accordingly. In device role,
+          the EUD hub is inserted into this path to enable debug
+          functionality. In host role, the EUD hub is bypassed and UTMI
+          traffic flows directly between the PHY and the USB controller.
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description:
+          These ports are to be attached to the endpoint of the USB controller node
+          and USB connector node.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB controller.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB connector.
+
+    required:
+      - reg
+      - ports
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-eud
+    then:
+      oneOf:
+        - required:
+            - ports
+          properties:
+            eud-path@0: false
+            eud-path@1: false
+        - required:
+            - eud-path@0
+            - '#address-cells'
+            - '#size-cells'
+          properties:
+            ports: false
+            eud-path@1: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8350-eud
+    then:
+      required:
+        - eud-path@0
+        - eud-path@1
+        - '#address-cells'
+        - '#size-cells'
+      properties:
+        ports: false
 
 additionalProperties: false
 
@@ -77,3 +160,56 @@ examples:
             };
         };
     };
+  - |
+    eud@88e0000 {
+        compatible = "qcom,sm8350-eud", "qcom,eud";
+        reg = <0x88e0000 0x2000>,
+              <0x88e2000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eud-path@0 {
+            reg = <0>;
+            usb-role-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb0: endpoint {
+                        remote-endpoint = <&usb_1_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con0: endpoint {
+                        remote-endpoint = <&pmic_glink_hs_in>;
+                    };
+                };
+            };
+        };
+
+        eud-path@1 {
+            reg = <1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb1: endpoint {
+                        remote-endpoint = <&usb_2_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con1: endpoint {
+                        remote-endpoint = <&conn_2_hs_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

