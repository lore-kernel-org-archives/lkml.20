Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AAE1A6817
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218764; cv=none; b=LuS62ukHiwwbwC0L7ChN0NvzK8lS0DtuMcFx4ZLvXs7z15YvzN4pzWxwqmx9XYkc3S10xKzjBlFZYtkafCRpSdU6YISMVhJvV8YUfyMKSi9ZRFvKykRnJBDGGZw1Q5/QUELaAeDK4lUuc7Bbppvw3wDn2gNC75gwnagVvdkeAXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218764; c=relaxed/simple;
	bh=vuxpQQHSHpogoXgcj1g6nYIyqWnif7Aqe4zqMtU2VSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hup3uELeON13YXSzW6C2JJ8T7CjyeO2eBWs74xrbhJWtaAvDylkyiBeUTqx5B48ob7Zh8TIBBXSGJC3wYrP4fLaEniylZqBwgdP1UMkDQSmt8DwUpRuRO0T+JqQgvOCwy02T4cyozZhr4rA8/SWD1hLnUrhC8vwcbQ2uDyV55MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVdadjHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAwVzQdz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVdadjHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAwVzQdz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EOwIj1358112
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 16:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=; b=RVdadjHKRDFdePLL
	+B3B6fED203OnFhhjYuocbbf9WN2gYd1eD6mUm3oA7wa7T/vR0qimuJJ+Sxf0KTi
	hjdf57cxmIAnK7zltI1nHqPImNvutUsX2IjrEchEBypCl29TpHHt7hmNWYGkDJJ8
	ctCptH2n/6imq4Sfr2gvI4pB5xUZ2QlX+v1BBG/n12NIKGrZIl6pxwjkjD5YMCid
	htIrsvqUDthHhKnhOBauqnjROKe85EQaCYZu3WukUXZCjvqfexj5RlthcvE4iPJV
	/sj/14kFVKwMOCJqhsrG+KYQEDmMKo3OVA3Fo1d77j5FDhP/0YmiFEJxqAMXorXT
	zvEInA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cvngsuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:46:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f80c76e6so21831795ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791218762; x=1791823562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=;
        b=bAwVzQdzi/K7UAvO3VtT1FcKRerQol2DmLtgQlvJLIAQRYUGzFaJ8mWHc6H6XPeCEJ
         fhP1Ip5odVQ2gre7q1fUiLOmNNFyVHTmqKoKdfBUg54HmI62HggEnnYQeEZ6ZkSZ1pSK
         eOxipafOBS+q3pgp3bzUzd16Z/wU6NRddyG78sddAbEelqqT14zYiGKNzzTDOewK5Yt1
         uUF1Hqu2fdZrc44/vdeMFDqPUwjlhTR0oKhl0PapRF81ZDlgJ0WnXaU5tbYHZWqmDhhI
         LjZkbnf8p1YJ1m6wM5lZ0DD0brTcLzJe29sp2mc/CaXHarhtGXPm+tIz+cfStGYpPEu+
         KM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791218762; x=1791823562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=;
        b=AwFszBdCPa2RZEBPRCOafu7oEtLA8l/K77NqYCRlGVJx9MT06M5L2GXIflsgSvaOU/
         G4xZ2cBUt0iIQ2UeGnLSYbNhBBYP1eqqvmbtxUtLgzy+tY9vcjxeKCTYZU3D3gkf+ud0
         Wp6msSHtz49SdAMOvIwnPmAm7MGlAqZBgu5FF0JLVAzoB8xkEmsfK5wRdDtO5eP/GHqf
         cwC/XDdpqIUR+o0qDxdmGzwbvhl3I41uJ3j6oHbtl2IVz2j5OcicInKX+lLGf/hY+txC
         0yS59mG3leFkeOPmrGod2TMmciMTR+Z0OFRpD9qu3yWx6Ul+ptubROFa93n3x3Ji3nYJ
         mbVw==
X-Forwarded-Encrypted: i=1; AKwUvBzwYGNHH4S9zc0GpwB3MFZK27fY7PQCwMRdnyo9IhEdCu4HF0nsoK+OdKvmpdsi+iSTHvU3uNXO1jX/2V4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEbPNutEZBB3VnO6M1pyShB+Vla7gVzuKE4IyQaEw3wVbAOEBB
	yfzg3N7oYIEm8YtO/8zvo79cP3xGhWqsabqiSh8Znnu/+IFt2iexitlBmTZYqjYv9/Hll+A+vOz
	n4kx6RF7bUxVuxWmjPw82kvYMOenxztcp5iU+Wdz16o4ot0p3Dz49JaF8AvcEe1PEYes=
X-Gm-Gg: AYBFou267v0755CUWc1i5kWZNDyE4HJayx6Wt0+P7CwUGUeQLDTX9fufuyxHcojI1y6
	j3hj82i9Vnb+VB3kSii9p4Dam2SBGy1EhWy5kzcKdFX3YpHCyWujmFCuaoy5JV3uJOPq2ff7k1k
	Sgiu8brMYAPEzIzfo7r8AlAzN5Ac01BAM6Yt8T06mCFKDQhsR6sJk2ISAvTCj8P1SVDGKmt/sNA
	MWbyzQRgL3XAuv3dxVpLG6PkCgHRhoCER0sDgZp7JKy9bDI/xUvFfswtnpv5hN9OTwg486Bv710
	JOHteIB6TFeCfrZPYBSGenelUPvaZAj1IMC0FTJN4hQaHYihsOLf5J5UqqXs6SaF4Lvgec/9I3e
	3quBvJurQ2hrvOdCw7vixjrUQd7DaWzajFmY=
X-Received: by 2002:a17:902:e5c6:b0:2e2:d77b:e584 with SMTP id d9443c01a7336-2e49b652159mr106114225ad.13.1791218761891;
        Mon, 05 Oct 2026 09:46:01 -0700 (PDT)
X-Received: by 2002:a17:902:e5c6:b0:2e2:d77b:e584 with SMTP id d9443c01a7336-2e49b652159mr106113895ad.13.1791218761385;
        Mon, 05 Oct 2026 09:46:01 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a55b6161sm10665605ad.1.2026.10.05.09.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:46:01 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 22:15:44 +0530
Subject: [PATCH v5 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-i2c-qcom-slave-v5-1-6254cc7c08d3@oss.qualcomm.com>
References: <20261005-i2c-qcom-slave-v5-0-6254cc7c08d3@oss.qualcomm.com>
In-Reply-To: <20261005-i2c-qcom-slave-v5-0-6254cc7c08d3@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791218753; l=2790;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=vuxpQQHSHpogoXgcj1g6nYIyqWnif7Aqe4zqMtU2VSg=;
 b=qlo/yCL/da/k8bjEDYuBMYX8DIv6a6sleDD8q3TXdZR3mAF8G0KYj2LBdEmYA+ZbNAkcN8WRj
 Wukk0S5AI/mDx0fb2LyC1o8vBh3NvLCfosD8tAAlALF6Oz+bIt/eOi6
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: hza8y6Nv9YKXw9kqZfvwincvm8VcHERc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2NSBTYWx0ZWRfXxgqSTlsyQ8Kr
 E6SpUQTRhXTWWNEM+6ZBboxyqXW5BpSWXWeM13m4OhIvRkWtHurh4CvSrTysQi+SZ+zdzf48biE
 vJIKsVkuva64DYpdsZJZwiE2vpdTG5XY6pfyBztXD+5y5/urNCI3m92PyWP89XsmftWokDuVyaF
 eXvzrBTeFy5VRuAXJ4KpZa3QkdKcLmdOz9U2dRFK4xJfRIJgRoDjigOcbWAGNBygfSOJA9QGqbm
 V/8uVaMOeW49f8Sw3MOCE6Aw1F77UyHY5F2yPHhISTcKzaCt06MwSWCJICEWJg6yGkPnsQSh3/N
 4yHsied6TlgNMPj+KUU/5UK7gvFgwMqyc/qc5/4lnNvh7dW9uViAI3U4V0hI3OTik0SLdzUVwpG
 CX9SKXdsk0n2NpuFLyB7HWtokCWeawmENVanKaPhg71sSAXWgYV8Sv8uriaQqeGPeB3MzVJwr2e
 T3nRwWf3O142cOta5XQ==
X-Proofpoint-GUID: hza8y6Nv9YKXw9kqZfvwincvm8VcHERc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2NSBTYWx0ZWRfX+VCfcgC/5Dlo
 4CBa023/ZTxQpvkFpIIO/fB8C+hGSSjOriWhXM+Z/rsJoRNWqhOu1RN5iBUtQBGX2Oo2CaHGkIM
 bxeFuHxDIrBIYwVDwUcc33T0/AypQpc=
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6ac3d44a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=64-jBHeFNbSwsrqMnDgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050065

QDU1000 and related Qualcomm SoCs include a dedicated I2C target
controller that operates exclusively in target mode. It is a distinct
IP from the Qualcomm I2C master controllers (GENI, QUP) with a
different register interface, so it requires its own binding.

Document the MMIO region, interrupt, XO and AHB clocks, interconnect
path, and optional pinctrl states for the controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../bindings/i2c/qcom,qdu1000-i2c-target.yaml      | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
new file mode 100644
index 000000000000..9a6b08f0ab0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,qdu1000-i2c-target.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm I2C Target Controller
+
+maintainers:
+  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+  - Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
+
+description:
+  Dedicated hardware IP found on Qualcomm SoCs that operates exclusively
+  as an I2C target (slave) device on the bus. Supports FIFO (PIO) mode
+  for data transfer.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qdu1000-i2c-target
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO reference clock
+      - description: AHB bus clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: ahb
+
+  interconnects:
+    maxItems: 1
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - interconnects
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
+
+    i2c@88ca000 {
+        compatible = "qcom,qdu1000-i2c-target";
+        reg = <0x88ca000 0x64>;
+        clocks = <&gcc GCC_SM_BUS_XO_CLK>, <&gcc GCC_SM_BUS_AHB_CLK>;
+        clock-names = "xo", "ahb";
+        interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+        interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SMBUS_CFG 0>;
+    };
+...

-- 
2.34.1

