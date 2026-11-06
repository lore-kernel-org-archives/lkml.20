Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973332;
	b=2spm9KFFOTIqRIqqsIo7lqMHX7cgG3SocB585YJIhY0x/aa03jomnMgjwRn8R5XaX7tQ
	 B2cSudNsqW9AfLzudiJIC1N1NkkPLVUZ3RszMwV5WsKNxPcWDQtBrQQ8GCLImLo0ELEJb
	 jRofEZrdftXENMnpkGohizSDhAk3DuHot67uom2EuyQZsv/rj0ZQyCIVBo7u+w38B1Jdf
	 uGRVDNgMF/gQnSJQQI9/Pl2YIG8p4sDZQnfQMYqHqGjuThbLo2CTKj1ph6evZ9niQ6+g+
	 YgHMdy7NoucZ0BQh4NfvJ1Hi9eGrKsQ/GqLOkynWM4QCszT72A0+vti+dr5wdLKJQmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=F/AsNpE+EC3pdku8k1Bksk9/YDRfy54gqlY7MB29idTbXcMWHpXRptI8cmZ+FP1Tfs/d
	 vKHWw/OZ1eFab1qyLmnxD3L6YFsjDd5j0UXenUKFftiIX91hPc2LGaal4oFwzRCh9nTAG
	 /43F935XVKZVyTot71mY+VoOToWsSdBcG/dk5A4AT17S07g+eiArhuxigZmEvaZbEUWmb
	 VL/MzIrmASAeXBxBNYzXH2BlhDuBCtUaD5+HXBuj0pjL5gpSYdeQsUW6ZuvFz3x5+LqCe
	 wz+HdpUH9N6menzyzl0IdkWnbji4vWHly93VBGGaJzHRy7s3eHnpCfkuoPRdDDxNnzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TyR/YEPk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGFcS52A;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C5F606EE91
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C5F606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TyR/YEPk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGFcS52A
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoT4B4089117
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=TyR/YEPkABFsBr+u
	aYp+YS+zHOEzOqBrFp4xlfFnX26NdZV+QDRcY37O8XhvmSWSvl7PVp2ZkCHkvFFA
	dTG6galMukQhos82vKXl9KscbZWvr9hrXXE624QMJGBzIYzvWQYQp3929hI7xrdX
	78UKsZmSx6o5uL6km85urCeQpnUPMp21inEyNP9cWyzDmMICwADxPoE4rMz3dPZC
	Z5qeJBuZwA04kdC+PDte4Nd7QJmMcmTEwt2w1nyUvDSMZ9HUcxFv2OY6Ra7TuTgS
	Dp5o5RiukhKvhBU0GIVp0bo0J7gWhBSU2cDMbf8LzXrSaG6fnB0xpU3ydHkdkccN
	1gWkKg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa306j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:55:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99b8fbf29a9so40168241.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973330; x=1794578130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=kGFcS52A5/ZURsI0i1bYzDCWqq4AB6l03GptD0yz7HdiSAT+ejj86XUGdePOUM8MGt
         FGXQaYAro48+EwmTPhb2Fci1TAsc7/5VO9YKiQFngfIlcS8Ldf1bV6P0p4xadEb2rwQm
         nqi4rqE1SBz0ncUnUSw2TK4KEKhrev9LiSyHOinbr41dwq0lpIfdjaAPsoxhx7J3z/9x
         yIAXxQl9lDRo6g+liZHmi1XMUoa9TArcQiMy99E/rUn6X16O1qlCejSSdCo+t9JGw6U/
         sRWklFCoFT1MFK0QmiFSyXWL9MHK8kMdxD/qschYlPF8t7E85wExaxPyBHSmEtnSMUgb
         EcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973330; x=1794578130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=0SQgpCYx8vAXgpOjDDnDlxqCOMQZfpTwOnoCT7jvqSzmgYUGibCfC136444X0/Nbvk
         UZdjzCBd9MxBt+ujvSNMBCekf7Yh9LDDo3OhDa0b5ZdvGSXd2EWo0Yl9oTXyhvt9oefc
         1J0nSeWFPk+1om4kF+gt9s4hBwotSjgGU/nTNNbCm7YsCvtOVjMY5b4O9sEGfY+QMqCM
         9MOsTp2Jq1m1Mnmwn2JDpsJSERl+lxuFWwNKYbnhVe1gCVxvAE9hW2xEYvFHMvONMmcO
         /JFhkXqb3p/3VOm7RwNQfDYHSwSvAAzjZyCY/v9Hn5VdGxTsxV5DJjtfpjkRXqW9Ug/b
         qDqA==
X-Forwarded-Encrypted: i=1; AKwUvBzpY1lILvGsukXLcXUN4QZdhKH3yhIe7XNLXHArg4BX7elv3BknCnbtiLCFQCwWCpqIx3A5Q90s1hKjSLo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hQSMMMhIfNYg6exHWC5ThkfUokorrhCP6rcV1Vf1LY/cj1KCq
	8NuDvP9We9fToGUsyWR5N9vBIeEKzK3NrL5Zjw+JSNQmOYVA1wKI4I7zTLdRFJbOfkC4ad8B/Z7
	d4QhbAjVAM8lToLfSfG4Q4PU7h+GERvFd9DYvoVfINdN5KErEBSdy90bbed0IVV8AUjQ=
X-Gm-Gg: AYBFou3r0gSAgPa7AwOwPT0oXebYTaU5a8zrPiCEYgbFnIkCQe3NwxkJ0lbi3zxMQhv
	VI5xD/I7NrK7wMNFRy85bIEJfTLd7kMZ5msdX9xm9SYGTMNz8FW98FUXSBReeZOh/DDX4q0+q68
	4sTYRCQo1MWZFnYU5ypz00jH5O5gqSINO4KqBlqbn/gxePiDF0o9fyRjNgP9/yHNfBsMXj2VKBL
	gnGKQ3zIVAdwpof1325gq00opEvOU5C0mAygto3q+KFiYzzdGSg8Vwq0L4jOOxYtclt3Etuw9th
	9kygwPtNpsPW10LxN5QdmiyDDItnaoMp4hwyam3nnDKBjigIhNlofyUAmn77gYpu5nDkcDWKWKc
	A2MxwO0PhGXZgQ8YfQ/hbvMLOJ7lCfQLCW2ACSQrnmsQgOUwLzc+ECJqyabXVZbtm3jkBp9hxcb
	wqZDWlgdOxnZYiwrswVXUQ8u+83NIRMcdHN2J0LAdNgTGgDc6C4xQJTnNTzYtN/ukRf/NAcCk9p
	P/x/Puc99DE+RvarpLOymtSUhAg
X-Received: by 2002:a05:6102:390e:b0:7d2:7dcd:7c99 with SMTP id ada2fe7eead31-7d2a152a24cmr1200751137.7.1793973329590;
        Fri, 06 Nov 2026 05:55:29 -0800 (PST)
X-Received: by 2002:a05:6102:390e:b0:7d2:7dcd:7c99 with SMTP id ada2fe7eead31-7d2a152a24cmr1200734137.7.1793973329028;
        Fri, 06 Nov 2026 05:55:29 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:27 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:18 +0100
Subject: [PATCH v14 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
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
Message-Id: <20261106-camss-isp-ope-v14-2-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aeddc52 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX9Cw/99zncrSr
 jz+fO0pc44EXQ2TKjasjWMElQNMIPRRURnr5lnTJnmtJLWYAh7iuKUGfbGKOPQZOyPYy5vxu7EM
 jGlsI58dqFbH8MNVKHlYcYBZ/cR/qZ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXzDbhgWH39Gci
 hODVeJniKI6jfH0DUQMOPFGmqby2TK7/V8JSJ8nDjU6Cya7Sz56ZZr7/JCPbX4vB+KKbs1XbJgi
 J4r4EehbP3gdCoFPoHrjxIga4elnf72ewvCF71jSEbjiZnFoPGleuQJ5T/xQ2cs96kEGnk8SSgt
 JVBNkezWG2q4dqRKHrC7GJIuxl3ZYurushOtZFnByfVFPy1ZR//GrQNA02GBsLKx5SXG9nPeyGq
 e8nZLj8nv8XMztKe6hxwujNfcheQ1Sea2QnUY9w956zraCH4P8lXUztrMLegHGDKCZqy7qVHGd7
 DQqdBWvlDGpf+0Fv98xwarFE36hJNKlFVF4qfCAXyLHlCjxGBNM5gdA4SO8GKXYyN62sLXokuY5
 rGSRO/MmacqTkcGnHJNmNXKNbfRQb8/R3Z3jNsWWLxT1ojSyS5sT8E+2swQ+pOz8pypBfQ1/BPj
 ugTW7KcWkmSCrD/P7/A==
X-Proofpoint-GUID: Ia99ssEJ6MMaCBgn03I0FA8TgcjHZCyN
X-Proofpoint-ORIG-GUID: Ia99ssEJ6MMaCBgn03I0FA8TgcjHZCyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1

