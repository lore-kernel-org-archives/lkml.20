Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEBB36B900
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134107; cv=none; b=psgcBOW5OVXY6saOdQCiwH/8lkuysc+J1tiYI/6qHfAg35/BBvhI01MCdWoMyRk/w60MxZPIfZjjpkqWL4ckLBfM3UURKvdK1VkLFf8FyUb1eY5a6I7UiZS3syLHpcEv68oYQ9p8EKHhxOsgrYHDgk7c1DD8WIae0eabE7LcHEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134107; c=relaxed/simple;
	bh=+rmEOu8jwbySGTgVv5UO0yGs2DJOOwC3xcgHzPVUKHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aY4qCs1YKqa3MTmbFreudMqjUUyXvx4HHGRgmguQGpcBNat4/1ELpeXYJH7ExZE6em3VdxsR6ai8JOmdUdcHPm0gJJNXCrWQZYpu6T3kRxJIOw3XwEa75aO3c8AcrSAay8B7tBzvIF5WgBbGu71MJWOqCihsvr1Jb03w+zFNci8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRM0AvAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbhosJ0A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRM0AvAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbhosJ0A"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N35pcm1153712
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QHaFIDZx7qovoKETDKtt+j1Cug7B4ShsOzETEfDwns=; b=cRM0AvAY7u0efmDP
	x8H2+Jugc8ttGg1rns0Qh4R/G++zhSZmMZ2pgB1xZXXxBvGA4VtcdfNeUPM7i2Gh
	dAi7yDwdEjns9abj16SHo2viYeNEMCtT8DWJ4d8TpzqUa6SS5S5A2e0358b4HQja
	2J0SxEPgkJuJs7Pxz9EGaEIQ7s1WnMqf39iolWnlba5LDWM3XGipn/n+xU4hmpbl
	LYXMXFnxT97F8ecBCue9on2yrnDCCjpGlS4RJlwTgLPTW0h3M+WNPKY7K+5+npKD
	mOZyKzEEfLrJCzfkN2uP0nJ5JSr2kp4SqBgHASiHOYEk7IJAvIxvi4dZqYfAbp57
	MhYjUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7jtt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so905050a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134103; x=1790738903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QHaFIDZx7qovoKETDKtt+j1Cug7B4ShsOzETEfDwns=;
        b=PbhosJ0A9AoPMzbU/7N1YaILSZulHUWZ77XAY0Rt3wS4EJf1KccKWdATBE1UXIzSlY
         y/Vv+sVjfaVyHBb9e4tR+Nt7GYfGgg6BnMnWsiAZd29RNIEy536ztqBb3voBeFEocF5e
         pLkAJfBHhkR4jgqx8UtuUHEkTjRi96O52IJu/0WRjlpIpZmoxxo0e7Z73tLhH1egYzoG
         lB7CqausmdqfEvIynD38GC2dXKYcXMl2alzkZHI76Ku/lPa5UYPwWCjicMRW5sUGbOgW
         I784ZUQPRIMB56wnYt/jIEmYndvMhj7MR3fkTB7ukHvQRKeZZex1U0WBd4ZoIccctj+J
         T4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134103; x=1790738903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QHaFIDZx7qovoKETDKtt+j1Cug7B4ShsOzETEfDwns=;
        b=Gmq3MqMtE1yir4V0j7GZVP9RUHXn6CvRH77BaddVdZw7PsO4bmc8gJhZ0peH6pnU54
         ZwtNE/zxwbqws/m7YTi0cE4Waw1DbnucUi4yHMK3zUM1GmoNE43Tdyp8mn+HdhSpQadU
         tdUJM45TltLnhmoUktIIQJjoggO9+nB3KUB9Fmho6KzCrI9v32noVbLx5XZ78FVV/ouL
         6xsMwFpC6c1ZidsocQxaKSn/aUyfF3/5bEbVnRqlqk2rh7Wlp/cwTCCECf5ViUb2Djrs
         +5SShFb7onzH7t21IeYjy0eXZFR449zbdti4CvetU4+2ClLWSA8lySzyqQAAt82vDGM0
         jFOg==
X-Forwarded-Encrypted: i=1; AKwUvBwLStR409SSi98l/kXW/tUjF8wd0Alb6qEy4tR7DHCjbodoa9rSh+cL/YJhmljGk9adSX3UaoDUwLy9tdM=@vger.kernel.org
X-Gm-Message-State: AFuF++klgX8cZnbogdqSwDGCP/CqCnvVp/MuVCkOt44cLwmmTeZlN4s1
	AxlCpaCAHmDLZU3iPEFtISU/qNPTMnkJYL+6D5sY9M+/liDJlpy/a1VaM5bvPVvVjZvPGI5LSNP
	D635hRAvzwEH7ay0gfg+SVMGIytEt0gU3Lx2fLX06FOIluOXxNHw/ft4gWygZHp1TjMU=
X-Gm-Gg: AYBFou3umhN6EhG/wmBKA3eRiO6wsKa/5turCbHFaRPiqYuV78ugIwdscT/An8VOJkW
	SWzwi52Cw21zv95FNDMsSinVGDL7GRCIUbXvaOAo+L+pzP6WQLO/nyMfNj4Nizd6wxOTGEJ9PWX
	tMtFmSCYunoEavKwrt1NAYVwHCiEO1dFz/7ax/FbFZDYWxLVq0pQHSwj34vRG50gbIbWqLK+8Gs
	JFPwl8wP/bbPbkNLXhbFgDHfzZN01sl9Fl/gGYhcQvXDzx00GJSZltHQrMHfVnVF4w3LSmk6yFK
	nU/M2rLsB3YmlsFIFluTxBz/3/FUGPx7cxw3HSMgUk7PiWJTNiWc4sSVohuQ+ZUl3fpmF/XQMFO
	qOc7CCZ4RIc6QT/lLsp4DC8woJp0p5HVqxoAxWd41Kn3f1tIdw0se/1rz6nhFrV435F5JgMQ2SQ
	==
X-Received: by 2002:a17:90b:58f0:b0:3a0:7d60:450d with SMTP id 98e67ed59e1d1-3a07e640f4amr1184305a91.43.1790134103364;
        Tue, 22 Sep 2026 20:28:23 -0700 (PDT)
X-Received: by 2002:a17:90b:58f0:b0:3a0:7d60:450d with SMTP id 98e67ed59e1d1-3a07e640f4amr1184278a91.43.1790134102822;
        Tue, 22 Sep 2026 20:28:22 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm3603525ad.41.2026.09.22.20.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:28:22 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:27:51 +0800
Subject: [PATCH v2 1/7] dt-bindings: media: qcom,hawi-iris: Add Hawi video
 codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_hawi-v2-1-016ec3d24b79@oss.qualcomm.com>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790134092; l=8957;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=+rmEOu8jwbySGTgVv5UO0yGs2DJOOwC3xcgHzPVUKHI=;
 b=HFy8xe07+JablCBW49/lY65OIoAarzsbvaBdT4dksr1umSUm/g99qWYTSfm+73l/tl/S3Wr9l
 QTmsqMlZQV8BJW9nDxsoH6HdDMGgIJaA1eYhBytJcut2IIEgzbT+vEs
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX84xgCOiNNPt6
 UnGvgelqQEi4BbsinU7Ggqt5K+oFUnIlAvNEZn1QafF7pg+IUDMA0LS69M2dTLUmChWB1XpaJWc
 /c7pTemg5Nakjx+jV2PfyOYpBO8Y8gI=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab34758 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Z9fkTJdRl1zmM-sw7WcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: q5rNH6XlBJAxFikavBdPBBX9M6oBN0Uh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX2XCVlIMTV1QG
 7CLafgBrveQuG/J3/fPyUzPcv/A1r7DBYppzD8D62RFTHZoSOkv00YTDdyWOyNzb7dzceAzPWEe
 x6J3Mze3qrK65Qz+GqN/yU5b15H2sKPNVHTvdBXPRyYaxlpRhvWKRSj0M83auF6N0ml30IggOKK
 DfJ4L97j7MvOlJFCfjLJZ3oi3oiJyvoshepyvYtwhHTtZ2EJqS9yHguZRjKSycO+GPa9jOcW3dO
 sGxDtqldxmyF3fWGx3V/2ZuFpV27irc/VV4OMzFygeK5X7DbUyhLNppkD+AVSUknKQWe3A36o7v
 M4LO/YWJLSTGvyrZZLyKfDLd0AimUmNcmnPuczHPcEs75uB1OW76KygSGZDr/XDJmKw8Il7CC2o
 mWT1h207u8R0rnLpPkpGTLw1x0a1h6R8e6HXvcf/J/sEjmNdzFjJfI0b/D/exma4wD0VAY9QMCK
 ODm3kohOmy1lOh7WgSg==
X-Proofpoint-GUID: q5rNH6XlBJAxFikavBdPBBX9M6oBN0Uh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013

Add a devicetree binding for the Iris5 video encoder and decoder block
found on the Qualcomm Hawi SoC.

Compared to the Iris4 generation, this block has
- additional power domains for internal NoC(cx & mm).
- additional clock for internal NoC(cx_iface).
- additional power domain and clock for apv codec.
- different reset lines.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 256 +++++++++++++++++++++
 1 file changed, 256 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..13e346414a231af9a146076de6a3fa9e9c488624
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml
@@ -0,0 +1,256 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,hawi-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi SoC Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Hawi SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-iris
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 13
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ifacec
+      - const: core
+      - const: core_freerun
+      - const: core_ctl_freerun
+      - const: core_debug
+      - const: cx_iface
+      - const: vcodec0_core
+      - const: vcodec_vpp0
+      - const: vcodec_vpp1
+      - const: vcodec_vpp0_vpp1_gating
+      - const: vcodec_apv
+      - const: vcodec_bse
+
+  firmware-name:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  power-domains:
+    maxItems: 9
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vpp0
+      - const: vpp1
+      - const: apv
+      - const: mm-int
+      - const: cx-int
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: core
+
+  iommus:
+    maxItems: 4
+
+  dma-coherent: true
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/clock/qcom,hawi-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+        compatible = "qcom,hawi-iris";
+        reg = <0x02000000 0xf0000>;
+
+        interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&gcc GCC_VIDEO_AXI0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_DEBUG_CLK>,
+                 <&videocc VIDEO_CC_CX_AXI0_CLK>,
+                 <&videocc VIDEO_CC_MVS0_CLK>,
+                 <&videocc VIDEO_CC_MVS0_VPP0_CLK>,
+                 <&videocc VIDEO_CC_MVS0_VPP1_CLK>,
+                 <&videocc VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK>,
+                 <&videocc VIDEO_CC_MVS0A_CLK>,
+                 <&videocc VIDEO_CC_MVS0B_CLK>;
+        clock-names = "iface",
+                      "ifacec",
+                      "core",
+                      "core_freerun",
+                      "core_ctl_freerun",
+                      "core_debug",
+                      "cx_iface",
+                      "vcodec0_core",
+                      "vcodec_vpp0",
+                      "vcodec_vpp1",
+                      "vcodec_vpp0_vpp1_gating",
+                      "vcodec_apv",
+                      "vcodec_bse";
+
+        dma-coherent;
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                          &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+                          &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                              "video-mem";
+
+        memory-region = <&video_mem>;
+
+        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_GDSC>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc VIDEO_CC_MVS0_VPP0_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_VPP1_GDSC>,
+                        <&videocc VIDEO_CC_MVS0A_GDSC>,
+                        <&videocc VIDEO_CC_MM_INT_GDSC>,
+                        <&videocc VIDEO_CC_AXI0_CX_INT_GDSC>;
+        power-domain-names = "venus",
+                              "vcodec0",
+                              "mxc",
+                              "mmcx",
+                              "vpp0",
+                              "vpp1",
+                              "apv",
+                              "mm-int",
+                              "cx-int";
+
+        resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+                 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES>;
+        reset-names = "bus0",
+                      "core";
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffc00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1540 0x0000>,
+                     <&apps_smmu 0x1620 0x0000>,
+                     <&apps_smmu 0x1544 0x0000>;
+            iommu-ranges = <0x32000000 0xcdc00000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1543 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-150000000 {
+                opp-hz = /bits/ 64 <150000000 150000000 150000000 225000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d2>,
+                                <&rpmhpd_opp_low_svs_d2>;
+            };
+
+            opp-285000000 {
+                opp-hz = /bits/ 64 <285000000 240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs_d0>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000 420000000 420000000 630000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-560000000 {
+                opp-hz = /bits/ 64 <560000000 533000000 533000000 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000 630000000 630000000 1104000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-800000000 {
+                opp-hz = /bits/ 64 <800000000 710000000 710000000 1260000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+
+            opp-1000000000 {
+                opp-hz = /bits/ 64 <1000000000 710000000 850000000 1260000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo_l3>;
+            };
+        };
+    };

-- 
2.43.0

