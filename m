Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783515;
	b=0B9wjQTDi6pgZdgiej63EwFUZE7qtWzbMDD92HgPG4OUu9sqoomFY4utRO9tLNrL0GPA
	 ZFL1lXBwWQB0W8J/2v6zHa8kWPIiuoq/9B7ghDvJWl3HArv9eIAwjg+dso3ehFNHvSIci
	 xiJDzOdshFQNBn1Aob/IvH8Qan/MbTkyH/tXawBpG6IylzIXka5SYCFvf8wxW6UFVLmqF
	 Xib/kK7pECmwbAiB28IgvnUkhPwpH1/SKiP7csYLLxxacg7TyLogkHBbLVQPQ3iJ2l92P
	 tNKjc+f6WvaBZFYIKB2rzL8ctvJRl2Ttip7QTistfISv0Msf/6rNO9f2lx3gf7wuQog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6GuykzzLpkH56pQe4JsMmTWSBVarOy+Q20aNwDP3d4s=;
	b=XUVkqWCmiNrBowqRspvaA09gwTYN8V5Cldyk18r8fAfQ8cbFqN717M54CL2doHwsNGSc
	 aVF+1v12HmV3cwiE0prPO5wO+x1Xmy1waC2dTiS9x07gTNcZlCS4Scitrxcy6g5PtVI4q
	 0H8XvBR8KWQBns10bIgdhVCx7M3DGecs7x9/gebjPjr0sLpPpB7UxhkbV2+zpveiqRUiE
	 q0SquX5+8eF2jqkMwyJ4W/EqsmjPxKmN61GqSsxeoQ6RIvv8gNd8jAoba3iIqqCKUbOz9
	 xKh+0Hixi73AhuFUa8IpDKMSegXI0OIW++y8fGR0NrgHU0oSeOg8+gmTh6WOEr9EtOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ly2+CodM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HDCGwwyn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AEC606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38AEC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ly2+CodM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HDCGwwyn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48OnEQ309857
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 09:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GuykzzLpkH56pQe4JsMmTWSBVarOy+Q20aNwDP3d4s=; b=ly2+CodMQxIjSAiJ
	tyHWVL6T//F0JJuiaYBeQW3qlj6C5Ae1PtXVCSRjupmXQd67VrwccNZPvvmuUcHr
	0hoMVUxykUke5b61mH3JNJSeciZLfBvc6felfvih/zsYtpUI2Cyk566oSGthXciC
	HmkVpkzWhTk0Xz7Im+ihuwO6THW8ix2Fg/+8i7Yaz2hpwsEY7BK1CUmfN8JWIUSH
	kKI9RVIVluLKrGZVwnY4oZYQXZ52WxzN+S4nk9il79uvfcNN5wsfWxlCi2/2Vnpx
	2a2oq7TCPZ9jbDlXjC2NgjqKBEbYdzkLN93souFSGtv2LUMoVFTAmNHd6SuQGrox
	ctl8uQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163g6s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:11:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eac6e96bd4so8182285ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783513; x=1794388313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GuykzzLpkH56pQe4JsMmTWSBVarOy+Q20aNwDP3d4s=;
        b=HDCGwwynk63AQQ48SOxeC1KjVJO8Nee9tGxplLlkZ4slG6rwCFwRWN0JAxlYsmS9PA
         +DdzAn21sMw9QOvP+FnghCowaik6NDc4SxukJWj5UfcxlVvFaNIOTolvuVLBC1ETLQ4d
         fNK9LBj1DiipW5vjzI/s4KBA8M8rHmGBSIqEhIA2HOlPRYf3M+egkug8B603MWcDvrGy
         m4gle2FLAuoJzfoYj7+QIifYvfePJ6zpbgUMdJyzNEoB4o3Lrhw2qT5PELwit2IWrSPH
         ef0CYTQmzRSLyOS7QxqybFQ7FVAZLQmyg7djsoWETZ50nm62Y0KzTfMzpGL9v1yE0ld7
         9TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783513; x=1794388313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GuykzzLpkH56pQe4JsMmTWSBVarOy+Q20aNwDP3d4s=;
        b=H+XeT/L/VJt6jdnbN0V7TNbzpRvnT7Hq/XM1N3orLKQQxhfoyp8SqsJxFjX1ieV2tQ
         48eVWyOz8jqthTXV8ixp2vqp3LgzJvLLV7suL16bkHzOAS2Lw1zasebJtZi3klFP0rUg
         rm/mZRUS+fifiaIkT8ne7n/0H5KAmPSYHIaBykqaYNQW+ML99cZ3CjCfcLVFtDzUxRru
         N6oSy1dy+Fot5GzSEHMoPjJJ1ulFfgr6s+xnw6VQfbl0vct+Eaf6iwLa8xY3eFqaIKcf
         p7qI6vaigocgzcQvCpbozLJ5DfvUa2+P76Vh49tuRS0QZqTvzUNUnKs7FugkscMZrjfD
         g9wg==
X-Forwarded-Encrypted: i=1; AKwUvBydScQdCwZ/Zbv3kdxHYwl0uBL+T/wOxaddiDQDdPqKhOx5i+1nK4Wmo+g92lA3xRiq8b8822eglWxPe+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z97s7clzD/bGwxOtSwkXSrjqNPt9kNH4XCcJMOZ/PMuesyYMRza
	qfyqdlfNzLBlYJogIn/7ppvZW9YGVJW2Wt/IALY/apMPwU52krv33ZsV6X0Kg8b8OK8WncaR+xd
	PF7S7e2msuph2mW3xZmjB2VxkpKvN2ymtYNUeGUSD34WSKy2irsOm1ToyDQV9YpULXzg=
X-Gm-Gg: AYBFou2L+RXhx03VR8tKCTYyXW3v1nRTzsE9wk4T/veIPaCqYMJZ2EpXJBd+x729mNZ
	GXMX+pd6AkdKudVHujYVm/mPLuPvD4ndIj0QtyIY9V03lta7nGNTpL6YgEy8mTOTO4ViedVMdPj
	w9OoFPQUUaVhjLb/cYf86nWQHVItxVXuk3QAzJfcdYYJEL56fXxcL+WoqezKGXfZJ+/Ik4yFXrO
	U8+Nieig49jwdFDSzvn3KJsoPsIFBOd4I1q4sQURMflu/7AWo3l1del8CyFeuApkoikdUvIXJfz
	eKqlKFnq7kzVR2h1cxaE8Ej5mHPgc/uwvvOkG+hqQ6LfuuZvPQp/fOeecc2hLy+BJoGMOzSWC8T
	qtd3nXwgoXrVGRZ30pr9fJVCsI9fCc35I7BTEtZ2axNMIJTBVeVE0JBbCU4Ts+7xosB82fcxa5a
	4l+5uESz2g
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13983266a91.45.1793783512632;
        Wed, 04 Nov 2026 01:11:52 -0800 (PST)
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13983233a91.45.1793783512186;
        Wed, 04 Nov 2026 01:11:52 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c896cc6sm8253877a91.9.2026.11.04.01.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:11:51 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 14:41:36 +0530
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT37802
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
Message-Id: <20261104-jshekhar-nt37802-v1-1-58e5e7fb2556@oss.qualcomm.com>
References: <20261104-jshekhar-nt37802-v1-0-58e5e7fb2556@oss.qualcomm.com>
In-Reply-To: <20261104-jshekhar-nt37802-v1-0-58e5e7fb2556@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jayant Shekhar <jshekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783500; l=2222;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=8A0ZKqgwoan8Smk+YA31w0++rT/VvW9+pTsfyOAxJv8=;
 b=7X5FqluwOB8V7OwMt2jW5i8pgUVH300hw1vXITg/Cr3uXrREPTcpNQ4GW0VFYlCaalow7mQVv
 ConL3h9588gCjSGxkOT10ExM5HWosSKPkHE+EN+vc5CKV6Z4XZ52jRD
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: 77QPUEsz6Woluk3zutE87AoxVQWECr88
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXwA/0W4oi+Vwm
 xMnhmLVCSSkGYiztXZNhPdsuk7IpgRNLGWSKlW/re0CZoH/T9+B2YFG1rb8J3ZGy6fQlVjjP08G
 HZxY31btySEBHbA5iK7N4CObaNyDDGY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXwg7szDLqqp6Z
 ldm/SQwOg0TE7Z8bQwG1BHA3URmVoV5arn4iJQ4aAA9xyDM5tiEZ4ceX3diWWrvmly0BdmoW5kA
 Rrs6hV6Q6sGoMxC9u3ZQVS3Jm8Rk2NXln9KNe0HZWoH7QDXHI5sfLd43IVnF5qz8g+NBcTi5Dsc
 wlITPLXUzjCvgByF5DxpGbef9/in9nIM3/711VUgYAaBvUiYC8DY5VdoTlZ/U8e7PN3NZYwT2rD
 64VJgzgKKip8wIGrqvntcAn09WK8r3cH7YZ4ebLm2fS0TFUqB39/gBWTA6Y7zI+yHscR4CdYfMn
 Cj/oPQDs1NjUkFL7IY2hIzt8TohEvh+PIc87gRTi1TmhN0J4cXkKS6pgb2E3I+Zh/hB097Pr5nN
 Rt1UotCs6Is072YaGaXDHvClmcNV4K0KGLlN+eMt/PTSd9RH21R8w14rh1T1CzLZo7UKZCQn+gS
 uS8DmTiPqCjnyw9L0zA==
X-Proofpoint-GUID: 77QPUEsz6Woluk3zutE87AoxVQWECr88
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeaf6d9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=RPLscFmMtlOloyN4f_4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

Document the Novatek NT37802 AMOLED DSI command-mode panel.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 .../bindings/display/panel/novatek,nt37802.yaml    | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37802.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37802.yaml
new file mode 100644
index 000000000000..14a59a9b0fec
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37802.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt37802.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT37802 AMOLED DSI Command-Mode Panel
+
+maintainers:
+  - Jayant Shekhar <jshekhar@oss.qualcomm.com>
+
+description:
+  The Novatek NT37802 command-mode AMOLED panel described by the Maili/Pebble
+  platform. The downstream panel description identifies the module as CSOT.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: novatek,nt37802
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel number
+
+  exvdd-supply: true
+  vci-supply: true
+  vdd-supply: true
+  vddio-supply: true
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - exvdd-supply
+  - vci-supply
+  - vdd-supply
+  - vddio-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "novatek,nt37802";
+            reg = <0>;
+            reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+            vddio-supply = <&vreg_l12b_1p8>;
+            vdd-supply = <&vreg_l11b_1p2>;
+            vci-supply = <&vreg_l13b_3p0>;
+            exvdd-supply = <&display_panel_vdd>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };

-- 
2.43.0

