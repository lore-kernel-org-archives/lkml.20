Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651883F4854
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847508; cv=none; b=s5q6sgRtGkexKB8TAcZuhZcQv4PQQB7nNWm+RWTv7cAkmO5YlXKiZF9RfRrT9zICHZUW1od75K6e9zjXEuPHC6ZkPcRM0pA6qXQCjvliDkUlGumCTSCuYdv9SKdiHkk6Xh5oQhlpx1fPJaWOc1YmhXy5bV0rHDgkHX0+IQbF5mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847508; c=relaxed/simple;
	bh=7VlpLtpjbYWqAl4eTeKy2wIA5lhKY5z4WzNabbXSzsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5WLXxjCY+9+1iQuuFUasPqi525Oh9Y38p2uuVe7+Lg5XDCWfUKkUvb41YlQEWwYXVrcAVN9QyeMZegdiNUt1vzsb0okPo8z1GLlNiN9OD6i/25rWdp15qHITqbYzs6ojnnZljz7kozWBiKzEfw8kJFoA628sB1cBk4OyHZw1kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuO3QxWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwcIN9MJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuO3QxWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwcIN9MJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xnhX396304
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oFTMP/R24ZD
	GiPr8D12+ouAQVW40apYrHT4rgZ5DgiI=; b=MuO3QxWcE9nOI1N8nRNBTVPoo6Q
	Rkre2666o64voCaHMZ7MiTvbZVqVHmZs4U/1zDXVcnQv5VHV3xNA+G5r0mH6qCMD
	cRhJySyaD9qPuwPv0HQ8dHzRgMKG/ZGp5Z7QbRcF4Dh984kt3iMLonXy5C01Fyn3
	x0miLczd7AbDHoAj5N9OXtpmFn5Gl8UBHreHnnpy2HNqPDNo201yrFNFgnsJ8d8a
	Q/Qhy4ctf+JL2dz4gp592q8+G/CNZApiEpi6OHr02AKTmsUUlQ/cXDXZdapXkqyD
	ao+lYmIXgXjvRt8r1bcAfST8jg1pda1Z4H4kKilBnkL3kSSqMcadrAyFeYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5a50m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:38:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1615522585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847504; x=1791452304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFTMP/R24ZDGiPr8D12+ouAQVW40apYrHT4rgZ5DgiI=;
        b=DwcIN9MJL4U0X9RjfrKwj0pY0P2F6RsqKo3xiKg7ZYB+WRiGuKHsSxiIUAVSeVOwuN
         jnqjg8kbaUv/w5wO2YFlVJx0KOBebA4YhWH7YY8gfA2MYIiEKMgzScCH4ClGB06m9Mg5
         KROQxaoxO2GBZI+q8CbOymlWF+hzlhR2P4VSO6l66EcJot9vdTvUQ/53FKhMPz0rBJKe
         K3/RL0dP+s1YoKUKS9GC7d2BldGoMpMG99m9QEnr9Z8+MXh3beGeXnlRvViQmDW0AEiV
         onY55a8PMlibQw+UrGPA4vSknrDaZTmmqttNpywkXmo1NfDxE1POjwlXh/0vdzUirFYt
         KzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847504; x=1791452304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFTMP/R24ZDGiPr8D12+ouAQVW40apYrHT4rgZ5DgiI=;
        b=MRaq4UGwBZNQqsWM7ZGFEvOdmak4z/KiEVYp39xlgbGvj+WII6jp/tkyhoyhR9fKOM
         I6VUzzPVW0ZTwGuIimMc+Mk6pKIiFwRyahDDkosss3s9c6y0oprPl00QsrnOB4Pw//qt
         51MbcJjzGkNrSucQHN90iBEwfbbXeuEzH4HlG2zfGr7czP3SkG9tCdSO/HO8aOwbPE+l
         cOLgOglKSC2PUOYDTKKKp3iVlj4XwNrDbItnfFuUAlbrjUXXcEvGTyyU5tgkF9W1twAY
         2TPtHfQkh0eofp+GFgujwRJqUwdTkQIlyG/1hQUqokZXiMjiLNS6Uep2UrnHIN2vQeDW
         Xjfw==
X-Forwarded-Encrypted: i=1; AKwUvByMENb2SQJRuZyMtLiXsT4U9lDX50SKxFgEEdNjtLT7r6BMUFRz0q1NcB/n3XeEhku5a+5X8ZHLSAhJ4zY=@vger.kernel.org
X-Gm-Message-State: AFuF++kyBkBXHNd2gVFpga5DcLd23UMUfeV/VwMrc76+OpoF51ySwWPo
	LSsNK+K7P02ZCgfCcjFEHj0JMAPM/VTuYJM/uy5EmwGBhQjxkqtU+4wVKKSSiKeCVldTdTahGnQ
	H+tz5dso3UxrK4YCurM69IRvx9nZkD1xfJ/VeKsclHJ/mAi0vf5UDba1vDXFrBFJ6xYI=
X-Gm-Gg: AYBFou23d8IEFPsfombxfT0wCWveLMjC/GN0J07hib36PUfbrXOQnDbXojsghDGakqy
	Q1S310d3qVuCKTalyZHnBvKbGCA4tCc61na0Q5PcauMgR8iou70qibioEHARRsVSRQdtosZH1dS
	Jk/ykFGSbEWIdzw2VrMVM+x+lGjB9uBoSK2CJ5v7mDUuGPEB38yP0iCcUXy0wwNVTfFq864qayf
	HiHzHyD2pWxguASL6FNx4p6+pYY06gOZcz5Ezt7961Svw1p0t4nlo2lsHwGddWWKjdTVfiIaaLN
	8i2/IdaDOFNXOxoC0v8FH9AStl/yphiMWH8E9h8Rq6ZORAX80xkBCrTk/bLrAcOWlEME0bhT1FW
	mjMLHfBFpvaY5rNjTSiirfvs=
X-Received: by 2002:a05:620a:6cca:b0:93b:d79a:c462 with SMTP id af79cd13be357-93cac22fba4mr719949585a.58.1790847504455;
        Thu, 01 Oct 2026 02:38:24 -0700 (PDT)
X-Received: by 2002:a05:620a:6cca:b0:93b:d79a:c462 with SMTP id af79cd13be357-93cac22fba4mr719945885a.58.1790847503909;
        Thu, 01 Oct 2026 02:38:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0692b5d7sm5231750f8f.28.2026.10.01.02.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:38:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: soundwire: qcom: describe multi-master
Date: Thu,  1 Oct 2026 10:38:03 +0100
Message-ID: <20261001093806.634862-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX7NdMJCC+qQOD
 nSXmmu2Unuw2W91nCXwOTjJ/IlKgZPur65+87JSBmGpCOoh8QQYDShChvMg14o0Qnt5Qg7DCEbD
 VzAbi7JBgMkbBG0ZXmlRewQnH67iDgQaIjxBRhS35DK96/p2mtxMW3gd8QX9XzMUUc5shneUdKX
 jxSa9zUOGInfPw/2cFoOB1sVHYv689AFdfkaADXCEUAemS7N8lnQdjg38NkIxK9cnLHvbwGfN3m
 7I8HVGuXNiVyqhfXve3jmOF0E3VSOG0yx+ziR3lQ6Kw5IHyjJmAdtCKu042XZDFN6mKc5CfPISp
 tUjgvBZsSNx94SbY0iF1AnPBYk4rld5DWyQqqRS7A4SeFdVHUmReF34A3cXTgd2QggYepPU/1U+
 i6XN/XEoQ6aV99I/QXx7SVM5wE24hnoovAArDp6g2aKN6gqXuiLWvOvgvYafn3vgiLwyzvP14ym
 CzzdgtJHipDr/+ff3UQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX8OvIxppY1dAR
 jv5FeiFAtxoMYGjV0dnnGwdm3TuzeRXQuhQenLVfh5I5iREvohdfU/Acd+K3byEEVl+lcSO5w1W
 w366RgUxn3IwBFNBfnMScLajy942sWQ=
X-Proofpoint-ORIG-GUID: 0ujrU3d9XOc8EYvqRJXGKxhLIgBecYUw
X-Proofpoint-GUID: 0ujrU3d9XOc8EYvqRJXGKxhLIgBecYUw
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe2a11 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8XpN2xwonMoseNaoR1gA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
bus with more than two DATA lanes. Add three properties that describe
such a pair:

  qcom,multi-master-mode  role in the pair ("primary" or "dependent")
  qcom,multi-master-peer  <phandle, bus-port-offset> to the other IP
  num-lanes               DATA lanes each IP exposes locally

Both nodes carry qcom,multi-master-mode / qcom,multi-master-peer /
num-lanes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 108 ++++++++++++++++--
 1 file changed, 99 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 8e6973fa229c..e627b92a3db5 100644
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
 
@@ -224,21 +254,81 @@ required:
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
+  # Multi-master dependent: contributes DATA lanes only, no ports.
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
+      required:
+        - qcom,multi-master-peer
+        - num-lanes
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0

