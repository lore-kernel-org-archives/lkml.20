Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEDF4E73DF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409160; cv=none; b=q7OR1uLGzQinCf2/SBf4LiIdFaMKBMShQNQXPDPB6n/DZ0n218wdIumfS6PZYJl7HWNp7+fwlJbtfP9a0zFhv/sJbsD+5SZzy/9P2ONl6PbjLaoNgN6L8W7ISDJvMRqJv267GRpEJrGEre7b6hqbLwgxutXR0TpJq1vRKK3EOAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409160; c=relaxed/simple;
	bh=3SFfXzC0bHwD78fBjVebg7PPYXaNP6Xkrxk92qxdGA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DI0nE+n2btKRaV89AN8r1AOFM0jtewOFTQo9zlpmNF4wuYJA4XpStUVgROi3InP3noFO4x5IcGEOt+YWxx155LideoC7ctb1oYIJr8hpGKGj7EIKb7KZbdISP9XKWvWR4K2OU41QQ6npVXWwuvhyiLXlIzoB90BdSAHJHKkUv1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQuWuBsf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eec23Yu1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQuWuBsf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eec23Yu1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Orq63256601
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5CG1ZmhSBv17Pssznbk9lW+JHvH1kxpH7x7K0dZwnyo=; b=ZQuWuBsfSgRd0sNe
	dyrPqEQvVipR82/HE8/GBSJ1dqFVvxGJJ3kdtH9mVxOfOZmNa4Dz1Nlqd/6N+6G8
	fIUclXJEIn1BRvvBhBAqUSB7MA52Zsh+qe1CBfcS5P6TKZE1DJVK7qTNXjCO0IKd
	vC5yASYhHbUpe6kkmQzNpgM1D0uYziw7AW28tY8vlT1naB/x95W+xhUq68F0GCne
	4BSu7FMjakh9NDNxSZxcNChJ+n+G1L1p2if4Ed+KBwGnrOAOKTWU/JOsFhHgAEyZ
	iXrUr9Gycv3OfAsFdsKfa9n6HPUSADwfFIMc2OI24dKtoru5VjGpHIsP9QgYFU6u
	uwbvnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8tjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:25:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so457867885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409154; x=1793013954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CG1ZmhSBv17Pssznbk9lW+JHvH1kxpH7x7K0dZwnyo=;
        b=Eec23Yu1MVsMwj9srxXNf0HYiEc6j/oaUSkCny/x1KrvIiqdDCpYinCofFS84CvI7T
         Pg6RpOaoKFxNisapRlk0+hqoqOAMeuxg0+X39oDAKeNtawPFjEHvm9TazU+GILRDI8bH
         m3wuEv7YDiUNtkUf7w0BVkfmY08QZDT6wSTXurQpBQLb2tXd98NZRCx26vCN1/ZdVQ9e
         7JPCv6Zue8U9+zLIM6ahPYMOu23lDijfBZjxv39r11xIJV0KVsWtOcd7noC7b4YFPu33
         1mFN95azNDSuUfSHGJzUF+cHiMDVtN9k7vR13x1AiLiPMOF2Gks7K1Mvai4DaRUVt0j0
         psEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409154; x=1793013954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CG1ZmhSBv17Pssznbk9lW+JHvH1kxpH7x7K0dZwnyo=;
        b=bZyavDCM/LjOcjTT4FBkdRZDgnKwGDhJHrqKgO8s1MPMLv/Ke9X5SvZCZoNQuF2LBR
         5VwLui73ZLB+nrn8nK1+07fInI6s7m9xfxxvROAYAK9dE7n8syPYIV3Hyq6siR9pbGn+
         PPIIgMU/KsHnmXlB45qMgyJxC0cl1O9Vxn2pQHZY9SrAqogywfmIf/MErnMUwomeCUgC
         sQq9ic48/xfVyS/+hn40BXaLRo+WRrFT0FKeRW8kUGam0/UaU4fG8mzcr3J2QSzP0tEx
         bRxTP+Ro46WJzBNYMU4pkR/K+Y6rDpTZUfVl9wETEGKl79/QeGSLxxdJ1CtBymdp+OGG
         NLEA==
X-Forwarded-Encrypted: i=1; AKwUvBzauonvtGmE1bvSGSm9K0Jr2gD0NDPHB8Wi0oAqKmjKSE2V+MVwMLuqzwdpdSDpbR/N50Pr+5z+V2474IA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbISd/IE4eUOyXaZOFGflQhMXcDslwSRNMdJhn2s8E/hAVsIIe
	j2ZTcV1VxGH6/uyT/YUq1Z5RmquwzszumY9PyNAZl/DQqT+Wh5JVlgiKaeEBRLXdtLnTj+GJicg
	THfjOSimEodOax2FywWd+hK91ot2pytGXBvyBSbGk9YCjGyMmK4T37L4AWugTP24ERBo=
X-Gm-Gg: AYBFou0EvcuMmhVLrP9brii0mJVez4KMzijU0xH+8Sassw9cd2K05NXmif5cHG/ESCe
	nbYWQnvWAi26daSxNKs8z3aI4y0+Zw2qMgKXc6ZZdg10PjXiBo6DieNb0k1YsjRE0+SnktWKmaW
	U8WTMfsuwnNwzjt3FTem1f2FSD0AfM1j73W4TqcNjb7j97uAKQeIjvgnF+gCWncaXsdQHifOYJ8
	Gm0Uz5J2mknCAgfV7VphWXTUPS1pCYfGue+NEx4JocMvJwUgGvzTs/X2Pp8G0yUE8gt4laM5b7c
	BT+q9sARI3cjXPmtBxJ0c2mP6lsIJ+AvNZT6N8O3xaTSiKUL3d+Damk0gzLY9mJcjXqIxUHNkhm
	rOBWiNRpRichjMUtHdVmXcC98FUztgDSvWQhoiKmbQj1Wu3D67jQiAI4G/aIKbhY+ejcb524mSc
	vkhneZbz/T2kPa
X-Received: by 2002:a05:620a:7113:b0:93e:96cb:3083 with SMTP id af79cd13be357-93f29d38660mr1173729685a.33.1792409153785;
        Mon, 19 Oct 2026 04:25:53 -0700 (PDT)
X-Received: by 2002:a05:620a:7113:b0:93e:96cb:3083 with SMTP id af79cd13be357-93f29d38660mr1173726485a.33.1792409153274;
        Mon, 19 Oct 2026 04:25:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:38 +0300
Subject: [PATCH v2 2/8] regulator: dt-bindings: add Qualcomm LCDB regulator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-2-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3168;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3SFfXzC0bHwD78fBjVebg7PPYXaNP6Xkrxk92qxdGA8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f45ExUy8zE6GyGWTzcNpkND1+27Rx4Pfw9BQ
 6UtgAofC8aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OQAKCRCLPIo+Aiko
 1Ts2B/98bk/jBz49LoQOXRdknyPydiybtL39hdFjjUGkcUHaKwplQ7TB1JRybSNObZRTkyXdxJB
 +BY7yezNBzGTD+08+W14ZBvaWsk86BhzCqaB6d4XxP5ecFSPMPMhBylrI3MNfacfRYcv1UOnTlV
 M2lGTsjcb08YUJuAnPh5ufW5YvynS+xVBEFAboQhhSr7CgiJdBhCyInbkmbO7DfPrh/CUv6QT4b
 or2F/y1PNr9t+uOm1JN1a3Gpq1PkkFpjOnL53qsT9+Len7Mr7HVhgXuL4ryBLhsNs195CJKtkAk
 K/+8RsTwGCIjT/CQUApvfXUNC0xQzg9VpQvknt9zraXr0Ofo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0odugjgxnY2i_LCYhs_SekHWdWNrAddv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX5igoxvW41+W9
 +2DfcZcjp8XWiEIFaJtUw2AdR7vvu+BXZ5dLYr9ftt1a/y2D2Mkxdmu8kMORwXnXL0yx9ntoRUc
 IHPf3duE4ZypZ8Ak/2ekZtbgx+6ygDZ3204ig/PdI3ywoLFajSvdnUnwBk0Mr+1PekpF/pktzTe
 ZmgGOGlkKM+T0D4EEeiAi80PZKgyxKVDj8C2suuqTSJ71Uk02JA38borH6XHiV/QSJRxqcNxgbm
 cGKuYtyIL5/D44juoqkj+CR+1ndsaoSx4rrJlpAk3FJF+xdE8AozxkZpdMaOzdTFHtAOYmryBTU
 m+XznyULXkvug1FNbfsEv9mh5Cq5dZYJZk6jePgdiRC/o5bBX7e3drFmToW7vP6uQrzWDCKEO17
 v5s5pjUKL6ZgDEPvItEUCp93yIdJRYc6ZUf1lx5Ypb11rkty7vRyEkWBgrUgenaYIuvKiJYuveY
 O8jdeccMA+WUpmIprkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX9lsD4/cUm2QV
 9gFdr/h53noBkR28oLINozAWs4lNE5OpDt7ymq3EBIxRbQ1Lcfn5xxqUrbnoC/KJ0zuCbdx2rTI
 draDi7xafMyq6TrZumyRL1vR9JmGaKI=
X-Proofpoint-GUID: 0odugjgxnY2i_LCYhs_SekHWdWNrAddv
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5fe42 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=SXD4J7xBejkBiF3T0k4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190045

Several Qualcomm PMICs have an LCDB block providing the positive and
negative bias rails for LCD panels. It is not supported by Linux, so
boards using it either model the rails as dummy fixed regulators and
depend on the state left by the bootloader.

Describe the LCDB regulator present on the PM8150L. Use it as a fallback
compatible for LCDB blocks on PMI632 and PM6150L. PM660L has a different
version of LCDB block, so it's not being covered.

Assisted-by: LLM
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,pm8150l-lcdb.yaml      | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,pm8150l-lcdb.yaml b/Documentation/devicetree/bindings/regulator/qcom,pm8150l-lcdb.yaml
new file mode 100644
index 000000000000..d3cba1aa0c2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom,pm8150l-lcdb.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/qcom,pm8150l-lcdb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LCDB (LCD Bias) regulator
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  LCDB is the LCD panel bias supply found on Qualcomm PMICs such as PMI632,
+  PM6150L and PM8150L. It consists of a boost converter feeding an LDO, which
+  provides the positive bias rail, and an inverting charge pump (NCP), which
+  provides the negative one. Both rails are switched together by a single
+  module enable.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,pm8150l-lcdb
+      - items:
+          - enum:
+              - qcom,pm6150l-lcdb
+              - qcom,pmi632-lcdb
+          - const: qcom,pm8150l-lcdb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: short circuit on one of the outputs
+
+  ldo:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description: Positive bias rail.
+
+  ncp:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Negative bias rail. The voltage is specified as an absolute value.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@ec00 {
+            compatible = "qcom,pm8150l-lcdb";
+            reg = <0xec00>;
+            interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+            ldo {
+                regulator-min-microvolt = <5500000>;
+                regulator-max-microvolt = <5500000>;
+            };
+
+            ncp {
+                regulator-min-microvolt = <5500000>;
+                regulator-max-microvolt = <5500000>;
+            };
+        };
+    };
+
+...

-- 
2.47.3

