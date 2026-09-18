Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6EE4FD26B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737586; cv=none; b=ijxgf31jNowk5B+jaO2x6E54pmaQxKL3N04Gs/xm4uWvNCxwbPoLH31v/tgG5DxolFNWONSNtvusA587t9oSqkWLqK2cSIoY9JYwSEFbtq3qL1vtNkCGclA1KAARgryVLfAnsBOdSnpqhS7IfWfGujOISXJIiYZpea7A33jTyl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737586; c=relaxed/simple;
	bh=MU0rmSfq8z627CzeHXf/aw3fNFEvcLWJdhX6oXFHzCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9MmSjL9/phb2EhySy22d7Zxx9KeGYaoDQ2TSj1nhBAGd5bx+785mJvdMRFRxoQZK2J8mtyYn/rJvvjy9g2pV0v7x0HUh8b9+9hu21TgEty3w9X1dH0cbrUgM6UeVRPCGs3n5Zcf5t80BXKV2dnTR0hPmeZH/u7tHQ8bTnE5qe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgSZz3lE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwcKc4al; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgSZz3lE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwcKc4al"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICuDHx153228
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o8tgPrluC9c
	kzRzhPb6V5SaRrtpKQumwcAGbMPyJNCY=; b=jgSZz3lE8WtC227RRf7n+MTwtv8
	9GycrP918+r8Y99G7rF/Amffn2+SJDxjqmJeWiwk2CtQEu/5pTxWtlnKmYy0l1dg
	trXHuMZ8dY0jdpoNSyERhnzp1lsCWz1ktDrq+HgpxA0E2fqS33YQKvcDq9HdQ3/i
	4oTW7RcuXDL09I/xZEb7yGQDOjKaloRD+BFRF4sV1hlP5QmSmYSj2CqbDqFAbfZf
	s+EJ79DmwWIB2faaTxW6gtORj0kP1AgVlN+IG5eE507zuue2laujKsD51wKsUcP6
	JlnhBuqpWmplIRZP9MtB722+I0pPWGajj0QPYGIyedptMnaj/8iOTyOrj6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdua9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a2d361e1aso168777285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737582; x=1790342382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8tgPrluC9ckzRzhPb6V5SaRrtpKQumwcAGbMPyJNCY=;
        b=OwcKc4alz5HXo0/n1iRv4uScRL3tGXdEvuaalnMzM06qDcauOJNNsQyE8+G1BmfLQR
         TsjWB37FfZ7CDo7Ibt9RN2oB++hTM/KNyh9Ww3aUsWjokc45D0xlRGOGl7m2sHGnnNir
         CYMXIC66CexVYlRHrnSIFD8WGdtXlxhg7fSaU2FsHwTzX04nmceAVMCcjw90Zy18ASIA
         ccNtWOJ4VynmBaeyBBwUfHN9CBU4SaGI/sptRfP+A+IoaQMMNcDKdrJ28s5MtAc7A1rl
         M5BrYMns3Qe3uE2mD/do4Y3MzBkYcKKAWu/lwK2uUKCJy6hrbPcA8hPz6RINl7vQzE2/
         5qkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737582; x=1790342382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8tgPrluC9ckzRzhPb6V5SaRrtpKQumwcAGbMPyJNCY=;
        b=s90z1C27ZnRmTqSnByFtpBkoLeAce17Rm6S+jAVSs1NDlqQbKYC62D28pHNpepg4pv
         to83bhbkND+lmw6bv9LJqOmsyXCBkqBasTcVDKCBcoTtcrwmlY+ALIXQFdBW8Gf2Yv91
         u5iDIe0RIS5cpbfXY3hAeo8ihoi20ZhchMN1W16QwH36uNAqPD31g3upAniPeHryE/yO
         8rY5DzwMyYQzR5FHhKd+YcLreLB035oZ3nNo9BexQcuHMkGznWzNeY9tA6cXzJ2nN6L2
         9uWEIlWiW/Nlv8+swddYecuTGXA/WRjkgvGDzXqq8rznJB4oLWYUo15iCsSXvLzIBLV8
         gEiA==
X-Forwarded-Encrypted: i=1; AKwUvBwkQIzrdfzecwbho9pF/xbmMakKQSwiwFPSpiVm1TzDIbyWjE43U/Tr8sl+dU6TVT/MLZ6GHNnIV87wCaI=@vger.kernel.org
X-Gm-Message-State: AFuF++m2TLzdAp9FBB1kwi+6y+7R9pgDb8TjKmWVkU5IW6/hP135JnKf
	V5W/3AjktXUlSBZGMoriCHpxmv8IPxggm1yiHTzlv151tXTybIlu+RfAervzz37B4/Sq5jGKjh1
	yKV8GG8FwbiDn2Up4EQWeFqJMkRE5gRCgDFOiBXOErlQG+KSBnbUXEEIm/bsa/BjSEcw=
X-Gm-Gg: AYBFou1oMCb8gEIavbbnoBFAQDzKmM0PA83lGiDTnRzjeiZxRs/1EJCBKy03IxIAEbm
	NbP+TFVM6uJMlaxJWLxl5jIAolrHRIZubgYI1ULZEhvNiqLXJEtnu2jZdFLpTsjmkLRi4wHJqGX
	EXJ+GN4mqYiDVtbSRwFxGSGVjRxJzVtxcUHFAgkCcFU8b8B9XRFHN2WBIzQg7pZxt32fA1INTfW
	vO18obVX2KTjM0qYB68equDE2Q/SDtW2OsHPEuL+PIP5E870J0DGypJS+x+Ym5dSTHy9pqwIgRn
	0GLakyngREfNouZ80rAYXqDSTWNTxQXtpCuI6R8x1toHMLBKVMRkv4BG6REuDnok0eg45nkNxVT
	jNUSDT+DsElhXmQ==
X-Received: by 2002:a05:620a:4686:b0:939:707b:ec10 with SMTP id af79cd13be357-93bdc9fdefdmr324190585a.52.1789737581702;
        Fri, 18 Sep 2026 06:19:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:707b:ec10 with SMTP id af79cd13be357-93bdc9fdefdmr324183985a.52.1789737581179;
        Fri, 18 Sep 2026 06:19:41 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 7/8] dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
Date: Fri, 18 Sep 2026 14:19:12 +0100
Message-ID: <20260918131914.681588-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX05rxO9wm2MGR
 OaLp6mUT4+d4koLBPUAmZDoCsDDPI1FPyC7hyZh4QwNJ2+5usLJ2ZfAxVYRIBCT6tjiMuLa4t92
 OV8m8P8xYwIp7egGixRBg83tER+maG8oLicBosu14f10vRlD6BivJyahejem3+fA14/qh5iEnqW
 WwmNO69XzJkisc/+vy6tnbDoEz0FHKR9VuGYUFa1WBTi8TnxsQMW8JUu7MMngfjfHOJqMPBgtGT
 meogfUVrF3t60/I9vuYLtUH3tGyegk3Ilfzn9E2JhewKZN0rb3D6gGDanGWTXEgbsw1sFqf81EC
 inj5JC8i7PQFSpfvir9y054VS6M7LMEfywq/9zhwS3pSFd1dRkFhQJ5gZweIGWGOh+SGT6Qmo+u
 3oaMwpyC+Ck/0bb7UGWlsIUqThFXgHyYJKZscF7d7PGsJeGlTe5jTb84Jl2mvtgO3o5hBfJGAR9
 5Lynl27RjRCrxsJmSKA==
X-Proofpoint-ORIG-GUID: uWCB_aWoKDDrDxUJxTZfkg2Y5MomiEyr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX5o0ZeMLrkGM4
 67J0TcxXMs5s+kvbL5pP54d0eNUmy2hMqMh18WW713wwUR0dUX5y7AEbjU1lSyDlJ6rxIefewOC
 ULgak3fwTepocQ+zYqso41cfmnruj90=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad3a6e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=fAJwNmJgYEpPzymNVfgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: uWCB_aWoKDDrDxUJxTZfkg2Y5MomiEyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180189

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
 .../bindings/sound/qcom,wcd9378-sdw.yaml      | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
new file mode 100644
index 000000000000..33fcd0f191ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -0,0 +1,102 @@
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
+  Qualcomm WCD9378 (Tambora) SoundWire codec. The same silicon can be
+  fused for a mobile (non-SDCA) mode or an SDCA-compliant mode; the
+  qcom,sdca-compliant property selects the latter and is required by
+  this driver.
+
+properties:
+  compatible:
+    const: sdw20217011000
+
+  reg:
+    maxItems: 1
+
+  qcom,sdca-compliant:
+    description:
+      Present when the codec is fused as SDCA-compliant. The mobile
+      (non-SDCA) variant carries the same class-ID compatible and is
+      handled by a different driver.
+    type: boolean
+
+  qcom,port-mapping:
+    description:
+      Each entry maps a slave data port to a master data port.
+      Entries are in order starting from slave port 1; slave port 0
+      is reserved and not represented. SDCA-compliant mode uses 8
+      entries covering DP1..DP8.
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
+  - qcom,sdca-compliant
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
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+
+            qcom,sdca-compliant;
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

