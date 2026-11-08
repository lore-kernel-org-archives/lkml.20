Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143934;
	b=vLRTDfClNunVap6++sAnb1JO+EbQ9EN3Fb1yOHvg31HGiLJKeAbho8Z6mgw+zm5BnrE4
	 JD9hEAo8WaaZB2ltKMfyBsToz9z5v53HDKRWteZh1Zf4tu94q6zRUNk23GFJIcXeIOW4r
	 tTVlVSIZXj0VHHLtMj7JbYl/Adf8H3ZW9JINyKs4GGn8ho5f/rdyWQsJqaXFd+pm1Ueeh
	 qEHcZK3y1dBu5IsOivt0ZVk3KjQcodXj/hzSN+mwypG6fQLoKw/2OhaChscENElHlHixz
	 emEQT4l6EbgCKf04/kqCU6lu7QTzS7hiqSXH5kaL+J1EHOnPoKvKKhBYLnOcOlHKydg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=;
	b=tPxUkIek8XhlURT8+GMNtghxSb0e/4yZBxDOH35tTQjrKeftnXvRexcfheMj5xCtkupV
	 stctBfpN5veMwe8o5URmpwf8EscDq48mwEnWjernr1fi/kJU1bRtAap7qNleQt5ZPzQuT
	 biF6NDKJisTM8yMKkz7CVJnzG38L++j9o6OV+8/6Ge61SIXQ7YC2LL+lTqhC2TOOh5mEl
	 ltB96vwRbfnKG9twacXZ4E5mmDYaTpAlk56nHy5UDOa8jT9/Ad0BF9gAforRzytFI2iVW
	 VpOrMEdCzjaZY7Oaoji1SD76bG1Ui6WWbTVkPdNHzlAeEOVlCNruuNImjCNcMYUpF1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjpIq5Fq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T20O1Q4X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B35606A33D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B35606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjpIq5Fq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T20O1Q4X
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AgRo7284091
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 13:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=; b=QjpIq5Fq09/ZOwsS
	zp4uRdZudwfM1GBDxURkl4ClOx4GfO6VpBH88Lgs8mGpDnD0xJzrFFS/iOrSYu51
	/buocqrqZYo3Ya+tuGswXyiDoFLDGRWzjTn0LCsacqGt6CSSuDKph83HFEa0bLq3
	BHEEkAxrXL0XOKJanxY5AThCHYXxtu9kBiyvOSy0ix3z2ThBSRLgCZj9agY5YEta
	9QHp77zn43W8O47Kq4izQndnNb54WCMVB5h806QoRbimyCgmyPRFluvKWF3hFIxL
	osKUl27//iSt4rzDmleqLu8135Jdvz2NRsDQ3eXxxXaCcj5xjSrOMBXaErj/PYG4
	KGrtJA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99jsug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:18:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so157083c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143932; x=1794748732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=;
        b=T20O1Q4Xgv1S/6LUq1uPJSgIAO3a3s0vkM7Ha3yid84FkJWYCsdfRnjWGoyB9vTAac
         cmu96wDRsY6/5F9vK22ee+Oh0uLWxhbfxfbEoHINwvz0WLc3kTSoCeTTmIkCktGlivXa
         kjbCS9II2uEA1230aKS2nv8riVnhnfuHNlJPCOKdmmlDEesjnDoe9RDjiYgZHfo0vJEX
         dFs8TCNm+OGEHczj1esmr+aQ/jyHB/scpyzcpMDL3fo2pTFBGfG45i2UHioddWD7HUIW
         uV2La2yE1mQk2bEa+2YZ5aKx49/eC/zIxTJAVoEx4R3vgzFd2/HPmSf5Y0FJMyhS9pzA
         jXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143932; x=1794748732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fqo4nrGyAnBaLf6Z27KaPtJVcMK19bg0Ax5ABM4JHOk=;
        b=nsYr210d8nmx6pxfcLot6HLNZfFVj/UaNQMNJJBzBQTJjzsFVW9d27TeVmB9w9Uhuy
         Z1vLX97wxT3h6tdHTGdhJoYj4epC5e9s8T+u35EDw17tTJu/1eyS7giiYToW1dNTZWiP
         ouqhgy56lw/CqgrHOy3VIaMvQ7HY3pAbQfZJp1EJCAjcXHQh+bAdvu3RagTOBUCD2oYA
         6xOh65ikYAcotl3HVITmU0x+xIH/GHXe5teNMLJytDqUP7H0KBi3m3Yfr/lPHS6ktnkM
         OQcWjEJMG92RK92bCUWzFJs4A9PmCV4VdBvm9i2ENzMJj6gyflGDJGkqP7wLFxDriKOn
         pJ4A==
X-Forwarded-Encrypted: i=1; AL+hErGZKXtfdOjA+OFoumGhlV4f4U0wHA3q8DsX6LXP2hdKI+kUw1f6VLzesYmMn0m9C11fdRvEwVvqWs7V/LE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S271b/lXfcbnL6e9z8Qx7VcNI61kNTBMESoyEHbEHzq2ppuaV
	2+CoIfd8R0gk2+dCXBxSuvaNQFnK/kqaaOE5Ng3R+/R3VKdwpS2GIwSIrtsDaapdDaskK3USmDY
	IWk8utJkQTBglLDrEXonbUT+etkAv9olUYM6PUgoElt5cdIbf/GVjNK4MnSxmdRlQvm77Gf6sGp
	I=
X-Gm-Gg: AYBFou3P3OLAWAlsVS49TUqVcCWk8HfPlIWeA8Qdcv6QbKs0QfxGAkIkN8Zla/D39dc
	wSIc7TRorYQoEDMvdd5zxEMzEC/oG1KfDGmpIJo7wXYGCBRGIqcGqWACiAo7SAxiWekmTyhl23h
	Agoxha0whRo9FpB1t2NOatk0gdZ2vuCMF3pOiTU3BwgTMO2DKTC3fIuYQIXV74L50l2N5dClZ+i
	Mm2DCDcJikJY953G2GV0ubbeLmNydJ9SW4w85Db6sKE0oDffT08sJaTfSlhvJoe+PAJ1oy3Pfrl
	4LYaiTWBcAhLmUJG/pPsMIXuAIIHZ98NN26FvmVBJwDct3aaze5fx2giVOB/AP0HPPEPR70U1Oe
	HayePJ8t+AeLDjp4kC7Jq9b8yAXoslWPc2QjyS0/qmEPDegJmCodNZ/bBPE/koIR7QvF3GHsyEX
	tMQ58=
X-Received: by 2002:a05:701b:2802:b0:1b2:46ca:242e with SMTP id a92af1059eb24-1b39fecac22mr2104856c88.14.1794143932146;
        Sun, 08 Nov 2026 05:18:52 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b2:46ca:242e with SMTP id a92af1059eb24-1b39fecac22mr2104817c88.14.1794143931442;
        Sun, 08 Nov 2026 05:18:51 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:18:51 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:24 +0530
Subject: [PATCH v2 03/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm Nord and Shikra SoCs
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
Message-Id: <20261108-tscss-v2-3-d5f575010427@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: J8KMKucETT9TqHN5MYyw7V1sI_9DUDyV
X-Proofpoint-GUID: J8KMKucETT9TqHN5MYyw7V1sI_9DUDyV
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af076bd cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nKCL-24MKaImGustjYoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX4j0NFc9r7/7J
 haCRBYi3UpZwVKBkVFWiguig3TPT7phylLIPiEe8wtW7q/R1jTpDMJ7OUO5e2FPQakXHPR241/L
 xGrxcXjKSLwpsHgSHDplyfCeNGqldx08cJ40GXsdtlXOV5uEdlhZQN7BVxP9oQzpHreKtVf0A0k
 IpmUzrvhv8Vy1P2KBfQNVMyIYQYH6JGZEvKF3ROFY/qYYjhMyfKh1jzXohQ7AdqRZpjlTs7/IIu
 TeRG0d51Uy1wQE60AMbNpicgFUmLXZ4zgZ6PLSz2h5JzeWX63hXbRE/yiMpRDsAi0mp4lTQXEf2
 MUsW5iH0Ixl45HUjW8ZObS3uXEt0L6rKh9o5Vq9cKxeMt3lf65YRj6H2ib4h0Y2NiUf4GVTtdM4
 zDreGhDj1//kSr9wZBy0NCrJDv105gH9LGKPV/bnR4pgEgtM5ZFOkCVzj4TJCQeQK8GYbhwWlW4
 /BH0gYj4HEoGD6CQbVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX+XlHcTb/TQMr
 HjtRLrplovjAh3NacU9sl59yivex4F8ayGw426VYMsYP1qY6e4Tcl24Z27GrHLua6B3Ik+z36xh
 tCiQF7++Aj4phx/LyYkbWHhog9FibRk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
on Qualcomm Nord and Shikra SoCs.

TSCSS is a time synchronization subsystem composed of two main blocks:
Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
provides a continuously running counter used for timekeeping, while the
ETU captures timestamps for external hardware event triggers.

Nord additionally has a timer register region used to generate a
periodic pulse in sync with the TSC counter.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/ptp/qcom,nord-tscss.yaml   | 186 +++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml
new file mode 100644
index 000000000000..9d49e66a35c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml
@@ -0,0 +1,186 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ptp/qcom,nord-tscss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Timestamp Counter Subsystem (TSCSS) on Qualcomm Nord and Shikra
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
+  Nord additionally has a timer register region used to generate a
+  periodic pulse in sync with the TSC counter.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,nord-tscss
+      - items:
+          - const: qcom,shikra-tscss
+          - const: qcom,nord-tscss
+
+  reg:
+    minItems: 1
+    maxItems: 3
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: tsc
+      - const: etu
+      - const: timer
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
+    maxItems: 32
+    items:
+      pattern: "^slice[0-9]+$"
+
+  qcom,etu-slice:
+    description:
+      ETU slice number for each entry in pinctrl-<n>, pinctrl-names and
+      qcom,etu-event-sel.
+    minItems: 1
+    maxItems: 32
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  qcom,etu-event-sel:
+    description:
+      External event selection value for each ETU slice listed in
+      qcom,etu-slice.
+    minItems: 1
+    maxItems: 32
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
+      required:
+        - interrupts
+        - interrupt-names
+        - pinctrl-names
+        - qcom,etu-slice
+        - qcom,etu-event-sel
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-tscss
+    then:
+      properties:
+        reg-names:
+          minItems: 1
+          items:
+            - const: tsc
+            - const: etu
+        pinctrl-names:
+          maxItems: 8
+        qcom,etu-slice:
+          maxItems: 8
+        qcom,etu-event-sel:
+          maxItems: 8
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1c80000 {
+        compatible = "qcom,nord-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>;
+        reg-names = "tsc";
+
+        clocks = <&gcc_tscss_ahb_clk>,
+                 <&gcc_tscss_cntr_clk>,
+                 <&gcc_tscss_etu_clk>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc_tscss_cntr_clk>;
+        assigned-clock-rates = <250000000>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1c80000 {
+        compatible = "qcom,nord-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>,
+              <0x0 0x01ca0000 0x0 0x20000>,
+              <0x0 0x01c87000 0x0 0x1000>;
+        reg-names = "tsc", "etu", "timer";
+
+        clocks = <&gcc_tscss_ahb_clk>,
+                 <&gcc_tscss_cntr_clk>,
+                 <&gcc_tscss_etu_clk>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc_tscss_cntr_clk>;
+        assigned-clock-rates = <250000000>;
+
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
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

