Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C77D3F8246
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910599; cv=none; b=I8gp2WbuLi7O21XD8GJNpzKYBvu/r2ac9YJ1/7N6SYE7lHsTyoCfJUrk5DBCj/JdhaKEtXX5pS17grkwjZhFGqX6jafmlUOwmG6F/40mjIMzuBewrV1H5CH8DcRTypWpWwpqJe/uBUKCBKOKUsYFAAYgP8h3F3Bdyw+nLJkg5D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910599; c=relaxed/simple;
	bh=YcJzWuwZ1RPM60Xmk1Fr6v59EnVXQyCH0dMpsNpXZwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ll+Jni/Va0xAZ2fnifA0Z85QykvPghpcYe1YmZIRNuRBzN5s8E2sHWw7jrqPjEz5imMcWpUhbOSahDm/MlFT9Xt/Sx2OiB82K3R0H0xYUEOKs57FnHQLPNyiVAUzRbTT5hPCF5iTPEAZtlKzlUnaZmDAu0AahoapliPkLynJdNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtIQ/bsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ecc9mkSm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtIQ/bsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ecc9mkSm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66pur2046035
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=; b=AtIQ/bsWp4n3wEmX
	1y+L3yXaOGP/lQ+xPwRu/e1Zed2KvnRK249wWj0M1s9GmVJ5HeJcSCkkhMpB4/79
	owJVeRS9vwkWbKuCRtyG4VAmuGhodlL5A0iJ039bXbwutvb6K/bOgqPmBMPzj3gf
	dYAoK6C5I/agpX74vm/OQKdgip4lKVxrpMDXroQOB8HXL51h0P7oasl+yV7I8goY
	x2+q2u38jXdNr/iqAmTSgyMJ2cKXparjO6LeS0mObNeFkwnLKb1I+Gfu0ZfwTxRA
	aDbsmV/J22Lm+6C6zGITlhLcrF0meh4+R7l1S0coOrrd7/icBTyyhzTBF9PZZVFC
	UJfJ3Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v39jxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:49:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088203so1079541a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787910577; x=1788515377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=;
        b=Ecc9mkSm5+pr0UC/mYybbmN5qm2sDKLivLbOQqktkAOeZTqe/F0y1acQrI/LjlOFCJ
         wEpMbxc7h2kl6lDQFzF26E7OklY3OAPGzwR1X3wrd//c7d8tPLiTdsP2uiMn2TsYt+ma
         F5BSC14SxFvPY9xQcknsgyHO5Dnd5jyQ7QkexliO+OJh6gFzgeCXrE8lLEkMo31mcLAv
         9oXzURH40LIltjcB2xLUQZQSzXyFrq6AGKwjjWwenWTIKy8MS9n42ftS/aFM6UVSFVEF
         Defzy1N3D5lNk51/YlCRe4yiRGksqESxe062e16kB9+djXg8n+Ca4r+cp9B7tn4Lp3NU
         FzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910577; x=1788515377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=;
        b=k2lXHDcf1W0oKsLO6y0/BpCCXIyQFW/B80uaQbO2rJqU32XnYzxvlKur5Ue0aTCuC4
         2Ed7dA1Q6/hRs2jIdcYMuN/dwZ4gNu+NrEravx+hkq6UfBgL5hjwDsepZRQdBIxN8+ba
         GTc7qNY9J+ou84/65no3YKvSxlfUPbZWIqOpJ5zEy1U+peN+I/z9G/rrcawvD1R7yD42
         o6fICZC1dSmt/GRGtkWHGpnazMV0aTTNPurydU0SUWu2T0lr++dVs+6BCrS14/srW0NW
         3nuH5DiZZZsEndW8YSibYoFvxFRaNInPlQeIbrSo8gXIvRciFxYmys7BCkr9KVKJlEnw
         FyPA==
X-Forwarded-Encrypted: i=1; AHgh+RrGdqCxvamO5B3VFX8stcABkTZyGZdc/N66Zq39+uWBt2yTd1XelwjfblySinVhT4HzDV34jPBHEjP3tLk=@vger.kernel.org
X-Gm-Message-State: AFuF++lvhveniG68dhAM9NPPFO3hZstAL8VMbTOXbi2SSSZfPboO7fhv
	JZw6EF0a+x9oyEb9EMuMZ1HMJ9VVoUtUlLTHtNcE6qidlLJblsb5m1uunnpitM6GYTOQPmiOT52
	U0E6Vr4FukJgVh2uTiYr22rSxN29b0A3UlzlUIQ6AOHpdkV/l9KkTO29DCBWLdGf0nqE=
X-Gm-Gg: AR+sD12VUqmaBCiKGMSMQn6CrKjrQAlWVFMHY/FTromMLpnUfT3L9BjCKtMV1Y3YqcR
	FJ0HvWMSMOgs+xv04DM2mmWkKtfjtGAx/JItOK+EH606fDKAOnehjWE13bK20XBZX2Pe0j9Ac3L
	W+TeNkaY6cPWSsX6PeyLgBJcqv+lGahsf/bgP0APGbyS1ub+xxWG4yJT+sUYVw34V+bd/bDqYMj
	1Od5SU/r5U8rdAYFl4hwb6Zl2h8I4P7aulkASNA0BdEjyuWAl+5KHfSMbgh++EquZesE4g0Sxik
	ZIdsVfrmCtTjWUDflMs5S+Y7fuK1Zx97eARF53R9vz5qEWExoM9kUR94ZGZDK8udBBSGl6kj6Zw
	uFpoGEheb4vknstcXlkDY15rUOoEh6dNNllqOkCYF5D+YIiK6vLHH
X-Received: by 2002:a05:6a20:db0a:b0:3d0:ba81:79b7 with SMTP id adf61e73a8af0-3d26784f3a8mr12211050637.12.1787910576798;
        Fri, 28 Aug 2026 02:49:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:db0a:b0:3d0:ba81:79b7 with SMTP id adf61e73a8af0-3d26784f3a8mr12210707637.12.1787910574941;
        Fri, 28 Aug 2026 02:49:34 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f783c57sm4851549eec.4.2026.08.28.02.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:49:34 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 02:49:19 -0700
Subject: [PATCH v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-qcom-spmi-haptics-v7-1-0367b3ac2e1e@oss.qualcomm.com>
References: <20260828-qcom-spmi-haptics-v7-0-0367b3ac2e1e@oss.qualcomm.com>
In-Reply-To: <20260828-qcom-spmi-haptics-v7-0-0367b3ac2e1e@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787910573; l=6461;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=YcJzWuwZ1RPM60Xmk1Fr6v59EnVXQyCH0dMpsNpXZwI=;
 b=K90zooDTYZ589cAtVeKL9aS4swwJGlljOoatZpGEue6YcxFrgVCTUelwbtQ/p7C9g7QCr1hmw
 dOwWvkfzbXpC/vmYQrnY5kv6zRrbZN6IzuY+Rxq0Pz4wprBWHueR4FS
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4MyBTYWx0ZWRfX7W8Ef8TLIbz7
 JAMAsdEheQVuZBm4l3Cf/pKhyymJQ0yw37HFuGnT3wUOr0PiYwX7FVVgVrtB1cq5r8zc11CMBSu
 NEEG8e2QeLtn6+aUvLWoP95fXdKTOZmwIzvfNDNyiwB+QZX8aLvxyp7RjCaaaxbr6ohKdkB8Sp+
 l/77jDyRUEZIADhCoR7HDxWr12gZ4tvgEwer+V1O8ouYjGzTb0mSjPWWQxdoBQMkTDGslK3hFw8
 +SEo3oopQtTGpnr9Y3k+HfqkfDd8XsFUOadqeGwy6xe1NVvZlxLSEo+yY8Voh+qcDhDDdbqIj5Z
 U9m9BGxj2U71SMaaqUiO0RrO/AR8N3aX8kv2oR1N5m3pyZaFdT9pO4BwnMYgy+Cn6UxkEfdDiiP
 qwjse0fPXaR5I7Nu6barkAnYVmhc/+31q6CFdcDUDjvdq57IA8zqK/JpEv5VLbO99idejPh6Qse
 g45UzD74x8JPiIHQw1A==
X-Proofpoint-ORIG-GUID: hRs1n8-mSC5NHRBeEqvJ8qsw3fCjbe2d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4MyBTYWx0ZWRfX5SvROa94p8Hk
 SFBBPG/+Va0LQ8Qwo+Jag6TOICUBOIAbcSuycv4a8z30IZoonH69Utp4OO6EZAEyqut9viFRu0e
 xxGJHGbc9e3A8IzBoCQ6sDylj9E7V4A=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a9159b1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bI6yuv9Qsz7HNVLwNVgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: hRs1n8-mSC5NHRBeEqvJ8qsw3fCjbe2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280083

Add binding document for the haptics module inside Qualcomm PMIC
PMIH0108.

Assisted-by: Claude:claude-4-8-opus
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/input/qcom,spmi-haptics.yaml          | 139 +++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
new file mode 100644
index 000000000000..ce2c9e893a0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,spmi-haptics.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Haptics device inside Qualcomm Technologies, Inc. PMIC
+
+maintainers:
+  - Fenglin Wu <fenglin.wu@oss.qualcomm.com>
+
+description: |
+  Certain Qualcomm PMICs integrate a haptics module, such as the HAP530_HV haptics
+  module in the PMIH0108 PMIC, which drives an LRA (Linear Resonant Actuator) with
+  an output voltage up to 10 V. Several play modes are supported in HAP530_HV:
+
+    DIRECT_PLAY: The hardware outputs sinusoidal waveforms whose period is
+      defined by qcom,lra-period-us and whose peak voltage is defined by
+      qcom,vmax-microvolt. The driving amplitude can be scaled in the range
+      [0, 255] via a single register byte.  Hardware-based LRA auto-resonance
+      tracking is enabled by default in this mode, allowing the haptics engine
+      to follow the actual resonant frequency of the LRA and update the driving
+      period accordingly to achieve stronger vibration magnitude.
+
+    FIFO: The hardware can play an arbitrary waveform composed of a sequence
+      of 8-bit samples at a configurable play rate.  Samples are pre-filled
+      into the internal FIFO memory of the haptics module and continuously
+      replenished via the FIFO-empty IRQ until all samples have been played.
+      An 8K-byte FIFO memory bank is available in the HAP530_HV haptics module,
+      shared between the FIFO and PAT_MEM play modes. The memory partition
+      between the two modes is configurable via registers, and FIFO mode always
+      uses the 1st partition starting from offset 0.
+
+    PAT_MEM: This mode is very similar to FIFO streaming mode but without the
+      data refilling capability. It is designed mainly for short, latency-critical
+      vibrations. The memory space for PAT_MEM mode must be reserved for dedicated
+      usage, and the waveform data should be preloaded and remain unchanged
+      thereafter. The haptics module can play the waveform data from the memory
+      region specified by the PAT_MEM play start address and length registers.
+
+    In either FIFO mode or PAT_MEM mode, the following play rates are supported:
+      -- 0(T_LRA): each FIFO byte drives one full sinusoidal cycle with the
+        period defined in qcom,lra-period-us.
+      -- 1/2/3(T_LRA_DIV_2/4/8): each FIFO byte drives a half/quarter/eighth
+        sinusoidal cycle with the period defined in qcom,lra-period-us.
+      -- 4/5/6(T_LRA_X_2/4/8): each FIFO byte drives 2/4/8 sinusoidal cycles
+        with the period defined in qcom,lra-period-us.
+      -- 8/9/10/11/12/13(8KHz/16KHz/24KHz/32KHz/44.1KHz/48KHz): the FIFO
+        data is treated as PCM samples and drives the output with an
+        arbitrarily shaped waveform.  This mode is typically used to define
+        custom driving waveforms for specific vibration effects such as fast
+        attack, crisp brake, etc.
+
+    The drive voltage in FIFO or PAT_MEM mode can exceed the value defined in
+    qcom,vmax-microvolt to achieve a special vibration effect, but the waveform
+    must be short enough to prevent the LRA from being damaged by operating at
+    an overvoltage.
+
+    Also, hardware-based LRA auto-resonance tracking is normally disabled in
+    FIFO or PAT_MEM mode, as these modes are intended to drive arbitrary
+    waveforms that may not follow the resonant frequency; autonomous hardware
+    resonance correction would interfere with the intended output.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,pmih0108-haptics
+      - const: qcom,spmi-haptics
+
+  reg:
+    items:
+      - description: HAP_CFG module base address
+      - description: HAP_PTN module base address
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: ptn
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: fifo-empty
+
+  qcom,vmax-microvolt:
+    description:
+      Maximum allowed output driving voltage in microvolts, must be a multiple
+      of 50,000 uV. This is the peak driving voltage in DIRECT_PLAY mode,
+      which outputs sinusoidal waveforms. The value should be equal to the
+      square root of 2 times the Vrms voltage of the LRA.
+    minimum: 50000
+    maximum: 10000000
+    multipleOf: 50000
+
+  qcom,lra-period-us:
+    description:
+      LRA actuator initial resonance period in microseconds
+      (1,000,000 / resonant_freq_hz).  Used to configure T_LRA-based play
+      rates and the auto-resonance zero-crossing window. It could be also used
+      as the initial period if the LRA wants to be driven off resonance.
+    minimum: 5
+    maximum: 20475
+    multipleOf: 5
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - qcom,vmax-microvolt
+  - qcom,lra-period-us
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/spmi/spmi.h>
+
+    pmic@7 {
+        compatible = "qcom,pmih0108", "qcom,spmi-pmic";
+        reg = <0x7 SPMI_USID>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        haptics@f000 {
+            compatible = "qcom,pmih0108-haptics", "qcom,spmi-haptics";
+            reg = <0xf000>, <0xf100>;
+            reg-names = "cfg", "ptn";
+            interrupts = <0x7 0xf0 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "fifo-empty";
+
+            qcom,vmax-microvolt = <1300000>;
+            qcom,lra-period-us = <5880>;
+        };
+    };

-- 
2.43.0

