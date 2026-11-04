Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793767910;
	b=yUJZouRkBZ0fPvk7DmWkWov9zYyvJB77qy4g6bXGHCtg0erkLZMY/uLMHiIhx8EucEVC
	 RqNYo+8bTQfZZ/ZDJ+lHOeJBMRFFW6wmSY153ArMarINm0q4m/G+dw3rpHnSIneKsGy8z
	 yLsR6MjYlbx1qboDE+3SEVokl94saWOR5yzPUOhKXkUz2X8dCsSjGBl8wkamGaujDvy2k
	 97w2TGm8MO8VxO2AuMaMOWG/mkEunwhROqwNFiwVQJGj1HZcCNNnbBfI6XyNnal3KtmmI
	 RnQOqH4G3pd6zkFaXOa4TZwTbflFGCOd60fiU7UeCWEj6IGIzBs4fvWc9LuUJflhWAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793767910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=;
	b=azERLw20E6urVl6oXAEduJGSCvD3QsOsj50aKvfq+yIhTNfDPdG/UcyuDM5/LNPouShK
	 phjZ0MhTwEdxhVXtewi+rJaMVTRDXvK8C/xUx3l4XlL+H4OxtTRxYibg5wdDEJ+hpfL3R
	 2lx9o7GYeRj6ve1seOkB5a+xQS+y7qDz2FnMCDj1Ibbvyo/ySahtsSeercQeYRjXaRnKo
	 YvHgH77DI/cerxvvBxJbjVVgKytNsBgZLdK1+X5LoAmRZ1CeNT3+GMH2LBr/EouZAibop
	 emWbNuKOaL1XUaXZW9P6tWSPGUwWO30y+NaGGoHmWLupwDN9oBHTxIA/vri8BZezekQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HWEwH1op;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksY+XdiJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581BC606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 581BC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HWEwH1op;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksY+XdiJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RJVP193647
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 04:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=; b=HWEwH1optVPYUqVe
	aceBWshnkGrwruGAjEBFgtxvmbTNElTenKAn/vI7u4NWXTO8Uk2k1X6Kgic3a940
	vOk4OS2grUdTrEonPEVi1hQVsoLpD6YBH19/aF51fDoZMPZZ3/zMxB0IA3RrNqtY
	Hnv+A7XUCttti+upkzdaZCXBXqQRlD9XtuBqAukaUYcbhNUBFAsIvJWmdPkCNW5+
	IJDJl1zfPBDzCBPuEEp7ji5BvLCddvlBbizHWDzc3ygo5b1zmftx1KaoDzlKghUP
	Umwc+TbmUCHemb/P9DWXJTfp9H/Y5Mgmnwd3F/pp58dWOzOMa9rhsURo2HVjmEzn
	SOfWiw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nj0d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:51:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso562064eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793767908; x=1794372708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=;
        b=ksY+XdiJhFHI4OU257oVI6Hf3ByyDhZKv6nJ9vsRRszTMUwOUumLyuNGANl+Mp2Lwu
         zbLQE/gJFVHbcLWJOuj5jvvbSbm1sJKCWftNhBU5T+517y/C41Ng1Q0pp4ivVDSZ6siQ
         SbaYO4+FM1d1896TFmgQ3y6oWWEVTlw/L1VgAVQ0ZprbR5+UGyukQYlcIx954ulaK3CQ
         zzA4dbYsJ0Fn8zIeePzCiT9YI9hf0U0ac6EfH3xL59fFB5NPfbinU4NWFeS0wbi6mBb8
         to+xtGjd6GHDrNhH+yNZMfr3rI4SRjpeMKFyuF1dPGGVjdke0oIYQba1Wps/wn2O0x9T
         gCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793767908; x=1794372708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYYmAr/X6jkEKVI/rUiLckvRRdWrzEQRkaCP6T8C01U=;
        b=TWSgxcKvr1UPupZ1062xn+6vlI73mXhHG2XhhvhNJB8M4IcGjXRlLbwDCMwUS2999R
         TiCcDg1mgVRi7qxZ0D5RyFbfqMuKSRntC534piGwPEOl1Egh5/4dMgn1APXy+tB9Y8K7
         MUQQpRExaDfLIpPb4YNz8A9TIWGbhjmZDVMUZlh2zb4ttpFraMjStHuMDGoKq/t57gSH
         boo5UR6RDQx/4y90W5KAIrzy+6KBDPhckd0uFuajv/py2uzFFLPhXHQQEApMc/D57O5e
         A1nyWlUB8dVkpYOPwN5oT3ZImaxoXIWF1QY3CuXXRlzOw0+nrsnuSQSRxvlglO9fDaB6
         /GVg==
X-Forwarded-Encrypted: i=1; AKwUvBznF3vGtySosBInOAQ7EMB9HIuZTCZeJhD7+115MP74+rF6SQ7dY4asUtI6LMkOzhVv9ilNWVXKAAvsnWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xq2F/tF2qEpZWng2TVh5PJDivp5sasv4QvM3mhckj4aVLnK3g
	IeMTupSoa+7MJeYZHBj4NAhE4HfkSMy1bYwGgbxyy6ImsWX1gR0qz52A45jRcMo8piE14uuMezp
	I10mWtgdeA9urYi9LR6kMUTFGDFIs1LRGlN0ZO2mJPYruu1iUutrfyp9wF8SHdpFN9GY=
X-Gm-Gg: AYBFou0IShqEnri2bGLF1dMkPfzWDd3RjxRQRUG5jAy7WzGlWMWFM+dDl6wTnDHtqvj
	Kot/JTqk6dGTHgxHvmp6l60tTipv+dExbkqDVdzwwlb4QqQgaom9VRD+lTZtuy/i44q4ejm1fnL
	ap2tQBQTrTdb4+5jeD1I9MEVwB/6VNitkh83h8yYLzdCPkqzctrMaBdsraCgh5PEW4vkyRgOteM
	pfro0DRsW83ETQcagBpuYgpxmFoZ2aPrHpAoK93hftApKUNqbkZwZqwHKBE6k42Ygtx38VL93Am
	r4D6K6OswTbF0cjUtyQNq4nXDdGwypQwZ3x/8a9NFuo5pZmslVXKMjmDHGvZ2oit2ajhIw3A512
	o4a6yM0Voo6Sc0AiDOavOFM5iMhtfiJcr2T1ngZpsoXvtQFvZfWxtrNFG/7PQU2B9FKzAsPxA1+
	ilEG6suDG4gIBQnB61gMKxDlLk
X-Received: by 2002:a05:7300:5b89:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36a424c7b7dmr34368114eec.31.1793767907789;
        Tue, 03 Nov 2026 20:51:47 -0800 (PST)
X-Received: by 2002:a05:7300:5b89:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36a424c7b7dmr34368044eec.31.1793767907147;
        Tue, 03 Nov 2026 20:51:47 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394c2a3sm3427958eec.20.2026.11.03.20.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:51:46 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 20:51:17 -0800
Subject: [PATCH RESEND v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC
 haptics
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
Message-Id: <20261103-qcom-spmi-haptics-v7-1-418de67ef84a@oss.qualcomm.com>
References: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
In-Reply-To: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793767905; l=6461;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=YcJzWuwZ1RPM60Xmk1Fr6v59EnVXQyCH0dMpsNpXZwI=;
 b=CA5I13+mOeWUbTYUy65Pz3XTLSbPcLT/A3rPAwLHcvM32qGlUjec+jzYZ8jzlgown5Ku6PegR
 DF9cZ2/qKLLB6MyUevlgPXPeRrHyDUCuP0w3g3K0pbFywMbY6APKuFg
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxOSBTYWx0ZWRfX3aNQKOooAuCs
 V16+toWNHyG500UteiWlUW64aAFw8r2M7uxEmlnk7XFTv0En9gS5SVNLBXU6h3rm/5uKNS77moA
 PwEGHO88Jf8fZaMfCwdYsoGE1COFQV9zGtxxdFxYs0W7EcWs3j5/8mf4ZsEKXycbMAkIXeBrTY8
 twCvpMi+zrLxpy4L/M3dX9XjnK+LnY+SfanVddZeUcZlJOQR1gEQvxSn0EAKHmkXfH/4yyEMRPz
 XUi294z7w59zWzYWHnNNyM1Q44noJm6mfwsOro4E7go10RUtIe3qhSenjeMQLjBGohPPAFyCz0i
 6tdP9nYvbOGzE309FJNUIUueUzI1dBULinfj5Yyig4EMtwlpiR8KrdOAKl6z931SNulfLCTrIuw
 7uhooW1ejW1SDP9mhxvdp84nlCH6U6Jiwwgk3mlDjq4BkjUaFcQ1aGJatU/80KBsciEYLXgHUST
 58wojXYHwC/7LqrB88w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxOSBTYWx0ZWRfX1J06cv2G796K
 QluT/kP9wK+Zt5Yza5sm31KNOgbBhh4pmT1aMPHQPDBaChBbiID3HvPW6T5Rg77dcqDGLnpWkgL
 HjyIime511ft7nla/bURhdYYngzpoPw=
X-Proofpoint-GUID: grTxRlkGu-navl5zAofBH9UHYFw6MnQL
X-Proofpoint-ORIG-GUID: grTxRlkGu-navl5zAofBH9UHYFw6MnQL
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeab9e4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bI6yuv9Qsz7HNVLwNVgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040019

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

