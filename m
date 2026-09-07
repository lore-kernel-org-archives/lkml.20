Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30E544AB97
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770326; cv=none; b=E3RtEKd4Je0yLNP8a+zfnr341PFB/Fkv37o/0NhVFFmHyZl9gjc9rNrmbZsA+C1lGosBVLx+ZWGUrj2Lft2r4WrfW+BUB/uZAmocWoxY7LnYNORH6sO8ghipFFuOFAA9NYYXSffwhZ0IrVUzoDb4RgGdl/pZAkhjaUi/e9Pwf/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770326; c=relaxed/simple;
	bh=5BRFpMT2458/X4jlA/c8yR3sX4VMh8e71LTTWl+feMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vjo//bm8v9ihsGcugL9/hdqJ3ZBFdSgeSsgwMKEVZOOhF7zvjS/NedYSsKVAj49eQKJRsAht6JxufdwSHgPaKhWkW6J7p30mydI7yeQGQOxojVzx3Y7gVejgAsSVcggk3Oc3YWpO43HS3UCQyXvMF74pW8D+L/+LWcUKHzKSADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+ZVwGFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezz8Edl8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+ZVwGFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezz8Edl8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Mal2838813
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YDLD18vZOwo
	NWTUh9k9LmtYOiV35zaZzn+mU3vs14sA=; b=S+ZVwGFX9MAu9gFBtvFndu3TRM4
	IU6/knzwcEG56mpDCbEzlFgBJT6X5ALKdPqzwWvlYwXTrRjZ9kztxdKlKNnp3e5H
	gEz9FvOVbVs4POPWBHUYslA1WibdPhgNSbETKNmSZj0535JinTEo8B2JUnmWBgub
	WKbDsr7dEOMC9E1NrZYaEp4Gd0a7NrvG0/y3bv6p9XaBfUZyTckrxtS0ZSzLPK8x
	8w1vuaSQfbpB/hbTW3G7JnpUq+pJ8p97RZr47obGShqMdWLwmBD6b/DAYFEoDs36
	1aZ/czedRfMb7DISmFJercsPcA8sEcEVZOj3BYDkP9qMY2o6i1CZVUVmjiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuep0tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:38:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-938153538caso527822585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770321; x=1789375121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDLD18vZOwoNWTUh9k9LmtYOiV35zaZzn+mU3vs14sA=;
        b=ezz8Edl8uk2ijm8lLfpqNo9+nMJ01YWPGj6rOFB6zLQJRuVneXfXRG8fdkfYwQMvC3
         9CTwM7/xyLSjojc2SakwAwV4vHplUCp3rKGcnE07WtcJjB+GzMMU2v1vgt3OXQBHn+vt
         3VCty6cycuslvQULkRjxBgEN8xEKT7XVL/h2mp5AZx31Aa1PKEsTYpYi4oCe/nBb1ItF
         uB1RAvNGTV7nVm2f+TFSiRetoi1jqqLbIo2RUOOdTYArDihjScxREDa+gx7jQSeEUsBO
         zyiZSB4ezRjRY0ybF5Iw35GQrd+JldyasKL4bKj62neu4aBIg0Cg7X9p5Sq8OHFgWy/Q
         ViRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770321; x=1789375121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDLD18vZOwoNWTUh9k9LmtYOiV35zaZzn+mU3vs14sA=;
        b=VXMttere0+6TSVervtSyC278HDBa1ptJUPkdfZcy7JAFExfoltFwOyV83j0ZGDWQfd
         qB+fq3+ZwQZy4zf4czspJz3OjFqaRIn6LiLwcUbpLsB8rGtfiJdoSK9KgjxSh4WcI5XH
         95lWSr5eX4M/y5nttEjBHReTbH8AgGe8/WHUUZMPXayH/UfeWZkCxm0WD1F9vEA/QdGN
         7uIs9PofHtkSk9DFiG3t4gNIHiX5klzZHWD6JetY7Eknep2I25LLpkIM8voGden+CRnc
         TGSkOeAoPXNlCYoHCN+8lKfxLyR22pm9X5UHtr7nlS6zY0LTyLvv+TPZqPg41PiPqI0O
         kTPA==
X-Forwarded-Encrypted: i=1; AKwUvBxtC9lfwBukPGF6QO6zpJdZCTgsrQdUA3QcbFnWcprgtNOz8V5eEkyv0aIvrTwywmFBQUNtT2zzTY1uuso=@vger.kernel.org
X-Gm-Message-State: AFuF++n9mLl9sWZCxpa/BXXEVLcQG2y+fiY9RtjSBkB7qhxq4OX7PVU6
	zBikUl3EyN9beMdNxvsEnAX/ZO3Qou0mRDC76/DpOtEfSvdPFw7BGSTxWCVEPTFTnBKIWo+/n/N
	T4bZuzaDUKuJsULZAnaA916ubU2JamPNGrv+0CKIMNE+Jt89kBOwDWi1jSZMnBQiVdck=
X-Gm-Gg: AYBFou3YlcFatNgffa8xdrGu4NS9j3pKedfQdzOE0feb/54tmqPz0byb2iBL3CajKjb
	8cc4n3Fl9hGSxERRTN5mfTQRZJXOGkcf7MtF1I2Udu7DKNbjSWDPxoFrRTh4M6CiNw9YK2nGFAF
	YcbVQqIzi+qLjPehssw24ce8I5ErDub+QZvJlqVuBpL/YWleiTCtVF/1j40iLK85TRvtCI+2KAW
	JT3Umt1TYaQ4bNA/jy5c2q4WoddcJHICiGPy17Fw0Qka7qgUq0xpsHhm3mMWhXwj+beMEtlytKu
	kFHS5b8Tz2PTPNDv8G+kp9CKNuSXdd8fdT61ehLOegAD8sTTkpo8mTAqSHnW2itHySuD2ffBp8w
	aabe8fi47jtI2NQ==
X-Received: by 2002:a05:620a:460c:b0:930:a26a:fb2a with SMTP id af79cd13be357-9398031b58fmr2040001485a.2.1788770321141;
        Mon, 07 Sep 2026 01:38:41 -0700 (PDT)
X-Received: by 2002:a05:620a:460c:b0:930:a26a:fb2a with SMTP id af79cd13be357-9398031b58fmr2039997385a.2.1788770320710;
        Mon, 07 Sep 2026 01:38:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 10/11] dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
Date: Mon,  7 Sep 2026 09:37:24 +0100
Message-ID: <20260907083727.733705-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX1AhuLFkFWdGQ
 uPoRZO8Oit/SXUuyB4OERisCo76pplgQkpbblUrLThCT+xi32Fc7b9GT5gJlG+5Qd0pn/qkN9AJ
 DTxlg6LdD0/VxEBy0hUPFH2TsP8dIm3eXVaSAdVqNLMKOHjH7igGBQ/0siuIz2ajat3WG7g2XdH
 iWVfBVdyC0B5UkLYnykQ2fGIu6jRiWGtqx46k5sqcHJyTruZgtXAN1P9mA33l0nHBn+DciM+J/C
 w7nx+0TxbwJTuF/6/njNHKFScW4vvBKiYK+Do5BNT/oKgtaENGl/p4AN1CNPIDm3VeuVnhlnK1M
 agabcvyyGLd1YQEWSQKfFck9AinW3FSffK/aarV7Yet/sld8ZNvNntpSuzhIRAIm3iYrPTQNGl/
 5t+6qOGI5XGGxZN81426b3blFvvm8YsSEDmKPprKbW3rROJuncAGNRzAxkFcZS8LP19sgkakP5p
 JENrKTbWBvS1ktIWg1Q==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e7812 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=fAJwNmJgYEpPzymNVfgA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: KuXEeYwpsXXHRgc7PXNlujzeeS5rR10h
X-Proofpoint-ORIG-GUID: KuXEeYwpsXXHRgc7PXNlujzeeS5rR10h
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX7cr9+vszNT7h
 hCA4SLLHVdGW7to3QbWO46flh88lKemEvUmvYcFv2ieyT6ygbOouXBtEgZb/rzk4yvz8uWP7F3M
 rsHBCjYXFXcdZ+KTnlQ3/Kcr0a/E9Jo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

Describe the WCD9378 SoundWire peripheral which is SDCA compatible
soundwire device. It provides SDCA SimpleJack for headphone playback
headset mic capture and MBHC jack detection.

The same silicon is integrated in two ways and enumerates with the
same SoundWire class ID:

  mobile mode: two slaves (tx, rx) on separate SoundWire masters.

  SDCA / compute mode: one aggregated slave on a multi-lane
  master.

Note: both of them have different bus toplogies 1 device vs 2 devices.

Currently only compute mode is supported by this bindings, mobile mode
will extend this binding as required.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,wcd9378-sdw.yaml      | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
new file mode 100644
index 000000000000..9a6c309018ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9378 (Tambora) SoundWire codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description:
+  Qualcomm WCD9378 (Tambora) SoundWire codec in SDCA compute mode.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,wcd9378c
+      - const: sdw20217011000
+
+  reg:
+    maxItems: 1
+
+  qcom,port-mapping:
+    description: |
+      Each entry maps a slave data port to a master data port.
+      Entries are in order starting from slave port 1; slave port 0
+      is reserved and not represented.  Compute mode uses 8 entries
+      covering DP1..DP8.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 8
+    maxItems: 8
+
+  reset-gpios:
+    description: GPIO used to release the codec from reset.
+    maxItems: 1
+
+  vdd-buck-supply:
+    description: 1.8 V analog buck supply.
+
+  vdd-rxtx-supply:
+    description: 1.8 V RX/TX supply.
+
+  vdd-io-supply:
+    description: Digital I/O supply.
+
+  vdd-mic-bias-supply:
+    description: Mic bias supply.
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - qcom,port-mapping
+  - reset-gpios
+  - vdd-buck-supply
+  - vdd-rxtx-supply
+  - vdd-io-supply
+  - vdd-mic-bias-supply
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    soundwire@7630000 {
+        reg = <0x07630000 0x10000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378c_sdw: audio-codec@0,3 {
+            compatible = "qcom,wcd9378c", "sdw20217011000";
+            reg = <0 3>;
+
+            qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+
+            reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+            vdd-buck-supply = <&vreg_l15b_1p8>;
+            vdd-rxtx-supply = <&vreg_l15b_1p8>;
+            vdd-io-supply = <&vreg_l18b_1p2>;
+            vdd-mic-bias-supply = <&vreg_bob1>;
+
+            #sound-dai-cells = <1>;
+        };
+    };
+...
-- 
2.53.0

