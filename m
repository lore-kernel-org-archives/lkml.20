Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143921;
	b=wD3VCdrPbX+luKZeynPTiDS10B6oYu28NBpuu2qy3bJDEalGCKwrK7PuR5+5XGpgVvkh
	 78Cf9xkQzBalT1mcmXUEZ2NUmFUZGot4gyBs8MP+tFX1vKow0MikSkTHB8vnBHBcmDabW
	 C4Fg2KjSrQCIH1kS725Q5nrAx9Zv76/c0fFbNNcRTjeKukcHE90s4Z5vdmJLb7EJFmgV4
	 9x5hFkF+1E5oI7JmZ5jnxuOXcrE9LSFBqvXtDZcIYCbbbNOu/nRosfw3iZyC3jCYHHwkc
	 fg507djch9Pyp+Tx9qTtW5oi9klBBaQJdHQAwhvpYazAkljxw06PY1QFq47DgQXh0lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143921;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3rxffHufu/Plu6e2c/GG8GZwxg3tdtgLE8Qiwcruq2o=;
	b=JyIG6Z4RmG43kngkFtG/qfj58+h9vGeLVaHLVhlR1eKbcd8hPtrp9az8OdeAVRXF2ZYj
	 duB+c+0Ew0HSO7lv7EZtXDi5mH4zIJ/EvzhVjTYhkv5lbESOvc7ps3KsHs9rZLgOksmZj
	 +k26Ri/ZCp3erO3OKklyKS6jMdH/hSbRT+Ke9kZ8i3mOtgCwzid1/HLxKhkNoiaxc7M5I
	 xu9NYSm4Eqqmni7j1J980nnFRn9gES4bLUSL/Gvlpn0PMI45kyOBZdi2TbabVZgH+SxtE
	 8DM0L8lKBFpBlxsIvwTkwfF8iRnV4I4oxGiD3GSvSX4Y509lgC9DpRv3zypQpxaR9ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGYyZvSl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+iYzHwk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393A6606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393A6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGYyZvSl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+iYzHwk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Ag6Vs711735
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 13:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3rxffHufu/Plu6e2c/GG8GZwxg3tdtgLE8Qiwcruq2o=; b=fGYyZvSlHAgC2IZN
	5g19idYCI0N9f/rkgyjLx0cxhPGP5mHH5nBcFSg4qA4ODi1OotHlY7oHZ6pRsA/v
	LO/SkuIa+Uv5H8fYA+3rwo3VNv9N1rhLcwfCraaGpZCGdCqkOTrACAAJOdXAPMkm
	CAZUNjyI7kk0RGvN/5OKhcD3LerBSMzIriEL7kS1KYZi4FRG9EwL3vM7c1Hmj2bk
	Jt2kpp/WZiEHaq8j/5AELiRCg+5VUNb6wx4UJoyD6YDWVjTKZ5iPxV+HuaIZfBDV
	JeBpESEMTzbvRD95LO9KeSQ0b4yzowyA3Pu8437kqUrI2H+Sbzc9hGbf6uGXledQ
	CYaH/Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvretvcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:18:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25dc2aa8bso242422c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143920; x=1794748720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rxffHufu/Plu6e2c/GG8GZwxg3tdtgLE8Qiwcruq2o=;
        b=c+iYzHwk0S/qxWYhgtmkWzgWVN6F1B3Quxb6bDoJ53OSZKglFahEkPI3OyNXszfEU7
         ItUWlCjAIUFgmDOhfY3pi5WBNK3ZzFH03LZhvyc/4Iwq4EhF7bj/CIi+4jKjBtuhMsWc
         /6MBIZEqpExfvQ6AeMcJJa4ln0ekMNjo1WuhExjMGfjI8Diffxhxp2i4d5wAPvQetzrR
         8RPQtA1SRHzLMj43tMeItNmvgi2CHSrqiBb0bMyVhn/bvRKz0WH2LKTAA9mMpaw36e3P
         6U1uEpLa5P66MgFOLiTOUqOp59dGTVqDTzDyXrqWsfe6HDLv8bRgcpzaZ9UjbqbsccE2
         fL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143920; x=1794748720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rxffHufu/Plu6e2c/GG8GZwxg3tdtgLE8Qiwcruq2o=;
        b=btQQlUfp+VL0KbxKt7PwjJnEg3bM6w2ZbLIlodR0v0QwNKWnvPkvV0XjHNT54V5W3a
         w5MlwLIp2GHjXgcZx406lhVEVdUGYV4Y3bWxFl7UUd9kCIlVyT88eCU6cG6S3eO/cKPV
         z9f3nERyPqXul/uhma8SK7nniu/OjxzKeTTSMOxQDqoK9imCAczJDrz0cfPN3cZ/IRds
         odHw9hsvZSx/GnXhIioSMxzQ1ZHPbW781BS7DZv1NuCJcpo28UZVkdZe8DKkFSFU6DaY
         oj0OCqynrMbLBySaqvUZ3/8ietf+Mzg5/unJFvb3MJYVJwgWx30ynf94c6hXWdLF0Fg/
         0k8Q==
X-Forwarded-Encrypted: i=1; AL+hErFrOBMHSvP13UyljGHWFhSMrF1x5+dbr69kG7RhutbKKCIsFKgeqtT77bI/zTfK4rxLEon5Tg0Vl8vCiEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ijIuWkXQsb3/dMmH690oMcfddSIwPX+eH8n6imBT+awm7y+qh
	EQhTF9UGlf7IicGQVV9roxU3vvKR+E/+XkgexacPYyKRJpmqAZwaauPSwzfQRhvNSHE6/e/F/Yd
	OIxoq/vEKWsfmXfa+MjXgtMJv02QJfjM5Cfcg8SGUzNJuVbmg+lKwAQyQZLjXVO8+Hbc=
X-Gm-Gg: AYBFou1IauNg/DO7O4Bm8Vhbq6d+eGe16XCBGhDjZsLucBuWFm5fvPa/GbWPedRFGHc
	F4BKVZP/y/K5qmc6TAi/E25EraxIcPsFkC7spyeSqzrSDR/vsvKYqhtrpgM6sCzZ6rOEfHXAslA
	z9Bxv6Cvh3IGi4fc5+hoDSbMCHBhOv98kmQ67E8sCSsXRkd/Z5r2G3udorgnnxj7RBhpKALwAt7
	j/ywfnFWuhm16DhpkCaJx79/riCjgb7JOD4Q7r7bPioqFRZFTXnMKkqDhvi3haJ09sBQRx0xnJV
	r8yBZGUfVhtkupFC04E8HwCTNy3GIKpAjwhJcgL/ZkLU3GwVBWo+KJlHAFOPHI4DxqLla6uML0W
	pkmlRaHpsASOobNAFwe6GXyMZpqOhEElbKzU9IsH/8B4b2eDLAQVyCSr5QORIa25PksBfoQ6FDH
	16H4c=
X-Received: by 2002:a05:701b:271a:b0:1b2:6cba:7f88 with SMTP id a92af1059eb24-1b39fedc610mr2073544c88.44.1794143919456;
        Sun, 08 Nov 2026 05:18:39 -0800 (PST)
X-Received: by 2002:a05:701b:271a:b0:1b2:6cba:7f88 with SMTP id a92af1059eb24-1b39fedc610mr2073512c88.44.1794143918877;
        Sun, 08 Nov 2026 05:18:38 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:18:38 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:22 +0530
Subject: [PATCH v2 01/10] dt-bindings: ptp: Document the TSCSS on Qualcomm
 SA8775P and QCS8300 SoCs
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
Message-Id: <20261108-tscss-v2-1-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX7F9pFxI7hPju
 NJLhKqnPFTL8vacTkeSOcceU6jvGDPFNNhkB2lu16CZMqK2jFQQK1FkEXh2wXO20gsVkVPiqSrG
 UaHublq4E9jJ6BliTvqD+riLhI+pVFo=
X-Proofpoint-GUID: NCT2RHk0UjNUygwBkINy_pQNtPLj52AP
X-Authority-Analysis: v=2.4 cv=FrKQbGrq c=1 sm=1 tr=0 ts=6af076b0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nKCL-24MKaImGustjYoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: NCT2RHk0UjNUygwBkINy_pQNtPLj52AP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX4+qeg2/3RlM9
 rcCT/vaps2IAELHSOywnOn2c8f4X4Q7U/ZpDM+D3xSdSzVJMyqeJkTMq/N9lhvvkMyTuhhEUdNV
 sXW7RCxGW/W63GiigbYXV/JodzXu+7YUmBzq2psSgvnFwK3OiWJGKWvAMfWXdLDolGRt40+QL6N
 Hz3+EbbMcyKgNRUAYh4lE0bnv8B+ZJFWPOgzpkB/ZR+nRiDO94/Lr4Zd0YBeqlfJV0qSM36JkOf
 3wEQM/oVmGyXfKkurw+p+CNIzPZubkjqTNWOzbXSUH43e+MhDRhLoFrJH6TwIghnBtt1cvrPq5Z
 E/pjSmDGw+zGgJ70uFUT5XsmVrIpAErDRbjKj3ZV64WNOpqEuZfkIGCAq62x9r6oSMtwXWBi8G4
 QRclQofXqStAIt5tmVtTfzO1kHYUnFdDtJXsmW2AeqpXGWCVpqZ8OpTsbhuoujW38NWfniaSwvF
 cjmEfQ2hGO1HLtg84yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
on Qualcomm SA8775P and QCS8300 SoCs.

TSCSS is a time synchronization subsystem composed of two main blocks:
Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
provides a continuously running counter used for timekeeping, while the
ETU captures timestamps for external hardware event triggers.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/ptp/qcom,sa8775p-tscss.yaml           | 169 +++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/ptp/qcom,sa8775p-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,sa8775p-tscss.yaml
new file mode 100644
index 000000000000..b3e3a7cd7166
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/qcom,sa8775p-tscss.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ptp/qcom,sa8775p-tscss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Timestamp Counter Subsystem (TSCSS) on Qualcomm SA8775P and QCS8300
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TSCSS is a time synchronization subsystem composed of two main
+  blocks - the Timestamp Counter (TSC) and the Event Timestamp Unit (ETU).
+
+  The TSC block is a timestamp generator that maintains a running counter used
+  for system timekeeping, and is functional with just the AHB and counter
+  clocks.
+  The ETU block captures TSC timestamps for external hardware events. Each
+  ETU slice binds a slice number to an external event selector, and a
+  single summary interrupt is raised for any ETU slice event.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,sa8775p-tscss
+      - items:
+          - const: qcom,qcs8300-tscss
+          - const: qcom,sa8775p-tscss
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: tsc
+      - const: etu
+
+  clocks:
+    items:
+      - description: TSC AHB configuration clock.
+      - description: TSC global counter clock.
+      - description: TSC ETU clock.
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: cntr
+      - const: etu
+
+  interrupts:
+    items:
+      - description:
+          Summary interrupt raised based on an external event for any
+          of the ETU slices.
+
+  interrupt-names:
+    items:
+      - const: etu_summary
+
+  pinctrl-names:
+    minItems: 1
+    maxItems: 16
+    items:
+      pattern: "^slice[0-9]+$"
+
+  qcom,etu-slice:
+    description:
+      ETU slice number for each entry in pinctrl-<n>, pinctrl-names and
+      qcom,etu-event-sel.
+    minItems: 1
+    maxItems: 16
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  qcom,etu-event-sel:
+    description:
+      External event selection value for each ETU slice listed in
+      qcom,etu-slice.
+    minItems: 1
+    maxItems: 16
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        reg-names:
+          contains:
+            const: etu
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+      required:
+        - interrupts
+        - interrupt-names
+        - pinctrl-names
+        - qcom,etu-slice
+        - qcom,etu-event-sel
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1c80000 {
+        compatible = "qcom,sa8775p-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>;
+        reg-names = "tsc";
+
+        clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+                 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+                 <&gcc GCC_TSCSS_ETU_CLK>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+        assigned-clock-rates = <15625000>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1c80000 {
+        compatible = "qcom,sa8775p-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>,
+              <0x0 0x01c90000 0x0 0x10000>;
+        reg-names = "tsc", "etu";
+
+        clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+                 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+                 <&gcc GCC_TSCSS_ETU_CLK>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+        assigned-clock-rates = <15625000>;
+
+        interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "etu_summary";
+
+        pinctrl-0 = <&cci_timer0>;
+        pinctrl-1 = <&cci_timer1>;
+        pinctrl-names = "slice1", "slice2";
+
+        qcom,etu-slice = <1 2>;
+        qcom,etu-event-sel = <1 2>;
+      };
+    };
+...

-- 
2.34.1

