Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205652;
	b=uiESPW6E9pWsR1NWmsY4IU0UV6uLZ51o8lBMLF/sptKU04dL5oZoaOI92g1sOaanIOs4
	 xpwEupVBogOVIxzQl+Nh0XJzpBtAdSWWDJabZV5v3O7LKPDFBEcEks36Hxd0EZ5hvC94B
	 8DGoAYQMe7PIJkCVWEKT272xtj2G5feP/pMibPTB1lewvWTvz4uhP5Z9b+v23y20GQg+r
	 xK9Y0tIZ9UXyDvDWf7z4c/uLSl/cF80ORkYjMJHyepMlVYevM4XOa+996SGHz+6xo8/v5
	 HOcEqH3hvljbzb0FLr41Yd0Qs9N44Y285nFSA59fWEiJR8yP3xiyMnI2qJYJJW+LN1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9lJO8yrpw3BUbzBS4kl1WsJ8PY4vORMCggNcE5/sowc=;
	b=hcmTbYRhFeQVUn3s99veXmUCFxPK12YUbZyDV4lVVyEGi1lmVMnVan0HAaMsYMhe6AKf
	 4kgLIsP2KEk/W19bFLPHxa316X7sBR3LOwcc52uKdHxdaI2CC+02skfpNStkgsc1H4puq
	 DEKQBAF9dsPilu30v8mz9QIqKqO9/SbPfLsOG0RbIOpWbnUFf9kpjR1zaaCfDRz2X2WlT
	 SZcXtSnS5ILyUGYRIYtagIqwycXnaiiqITR1z6USFvEZXF8MWZof8rRaf/gpm/75Qhex7
	 IwTxeY7o64Hn+9KlrmjR1ccB+kvPDTgI7wkSZzMOl2FcwOaJvgYetV0Ccsm7c+S3vGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZdk3bvi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoqHfO4Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A78606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A78606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZdk3bvi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoqHfO4Z
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A1IR3611089
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 06:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9lJO8yrpw3BUbzBS4kl1WsJ8PY4vORMCggNcE5/sowc=; b=SZdk3bviUCE91hQG
	+Q1HYTnvnlwwCEt/zwKp3UmDMpzO3QHu20DCO4NdfxNR6Q4mVG2gjiK8YlObLA7y
	o39QtnGz/gigA8qJcgklEq0JDSk+FI2EEYXVoR1tVUy7NHPgoTVehOChqKsqsVMt
	CdzddI0gckpCtZTuSEEhE8idFmg/zueKSA6+TrPOjSnhhNuT2qwjah0qgBb7lPx3
	70qSIkvcBS7iSLg8JMJ216BGgOtgQr8UaCSp1GXbiKtu0rKcAsHc1LZvuDMDq756
	Qs2v/NbFB+wCVAz88edZSSicMnjzGag9yJtGzw47G60Mn4i1JnpxVgE5CwRZRMQx
	J2AxGw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnweum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:27:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37390b2989bso1983382eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794205649; x=1794810449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lJO8yrpw3BUbzBS4kl1WsJ8PY4vORMCggNcE5/sowc=;
        b=QoqHfO4ZkCcnGLsHWv41+PSnCL44wqaug3l1Dl4w8jGqBKUcg0G6rj/jfWrroerYw7
         2dRcvGnPcKragbD82ubAPgU2NuDvgYxC6m4IOIgvpFTSYWW0IGQf2fS5f8IRwwKzvGFr
         NiYH2+yz/YsPYeByLRDcs7D++SBSnY5A2F1KVaxHm/dsr5YvbClfaNptIoBliNOvB5NL
         WfkbdQaAbLLIrCBfTGRZA9ZrKrAeKF0MajWG9UhBfI3h0VN85RNpXEK3Mf7KVOT/BL3X
         n6o6LVIKvJD8oK5gH5KCGOK8yagHU/eefIddZn1hYrfWyuVZv5HAGBWDN4pUmaKca4w9
         ecnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205649; x=1794810449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lJO8yrpw3BUbzBS4kl1WsJ8PY4vORMCggNcE5/sowc=;
        b=Yk4EFwVIzAIZRf6OVEyDFf9zWzlm21bocH2Ma+vy6+2M+NeZ9BDfjrrQreLiEeaa2e
         UswplZNdLUZmufQ29ggERpyf2yl6OpcziS5ARrAAj8bwOS7xzvnWk5c3c9X5mBcVDB8y
         zw978jhHUL0T+xCfbWUqLocW4azAvwZj43oTkZ4bHzsQx0hjNS3UMIXpXtwpL7dhBMw4
         pzvQi0hldYcghVPZRxw+2WDGob0X1PFSOJzYIfuhVXHEGgTOvD+e1psVW6eyDrwea8fJ
         FRgWxiTySN5M3Rhzq2t/5Xv4V0GaglwqALA5cyeXd0zdsqO1NbvSbbKdNiKSuvmb6TqH
         fynQ==
X-Forwarded-Encrypted: i=1; AL+hErFnTVKbun9uOK+SulLdyfS00hhsZ2sKt3EdeLKDIlyY0brldv92h7sExFUVWCyKda4LO0JETYYeCOArzjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1K9xUpqc4n/+tB8zHwyCfj/R8k8gMlG66L0uVk2n8ykBBIAEI
	VI7TDk9g8ElsvzUM3OJvswuYwkYMidwyRbK6J3O65dpld+bIWsPcRxoHaykfqzTrw1nSkpTXzkF
	T/xHkk/twdT55fYyngMezKfyr//4svqpBx1ABBuKgg3YZlvOlMQrsQm804+FjEjHvbxA=
X-Gm-Gg: AYBFou2oOe0AIT5ySnbpCJoJIfakgm/5dPgyCxBnQxJGMhtr0bJEVlZ3RQuVLd0Det2
	ItHHg5uWG172veVjIL+8SOCL18VBAdo1MzW+RP8JgN5Or3EOUMDrvvmcisi+xcYeh0DnK2yysJY
	DBBXMb+F3CFJ04d8qsl9NOke7Mic5hDFx3j/HTEnAR06yyo+E/mMCPsLNSgYPujQrLNfsvnuljf
	7Apq9BjX7DkMh971a/QS12MKclMZTkrdQR1709KuekjpK8QqeijGicQEC2AOhM2WA68JGql4SwA
	UNtOpr1NsSmQ2cMl9GezEdiEbdddNeYthVT66hrHse/elD2D83j2efJ/aH6E7Q2q6/QsmDvLnrZ
	uXyMzJPZXPhT/5gqOt/RPaS/M3a+L4IdewhYWryNo2257M7clToxbzUi5/mzoOhI13XAhKhTgA1
	KojgfLVCs=
X-Received: by 2002:a05:7301:dd82:b0:35d:d671:933a with SMTP id 5a478bee46e88-3725dd59d8dmr5276175eec.15.1794205649239;
        Sun, 08 Nov 2026 22:27:29 -0800 (PST)
X-Received: by 2002:a05:7301:dd82:b0:35d:d671:933a with SMTP id 5a478bee46e88-3725dd59d8dmr5276136eec.15.1794205648626;
        Sun, 08 Nov 2026 22:27:28 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f444csm15812458eec.19.2026.11.08.22.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:27:28 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:57:14 +0530
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT37802
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
Message-Id: <20261109-jshekhar-nt37802-v2-1-a8e9efdcabd7@oss.qualcomm.com>
References: <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>
In-Reply-To: <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jayant Shekhar <jshekhar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794205638; l=2780;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=6A0PN/ZwhHfEEa/gLa1HSpBnzXndrJU0BtXt+eizvwQ=;
 b=fMXgzr8oSYD/JYtzoIIVvi3Mgn8Phaki7FN3OZeVHeGFDWA2gbXZc/75A9DHViEOdc+wsQEdL
 mrW7HBveoklAt0DgLrAkzJbsNgZs3pJPqYp7YWAJ+yoYIaQ6ZeDB1xr
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: tf5rCsf6toj20di4PvfWt8Zz2GkwgW6Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNSBTYWx0ZWRfX56YoxWj7mkyL
 04Ofd0xC806he6E5UH0bkAytVjI7lwIk0BF1uTGrn1czTyQOIcOryJcFl7aXGrfhVxCM4UeXeDl
 hH3ODNmx5WSxW1kW7VBhsqZ0tmMAmYHHypHx4k0eKpcftawbtRNp6BCs1p9O8kJYbJv1T97AGD1
 lGTFFu6I6+850DW1jCplT78jryt95/bhi4z4r8s1VQyVjzV3UtJ4zNI2uY/yyH3gkKITBlA2raP
 OkmylMlCD5QMNhajcBhsMeHxh7TNNtDhrdI7nq5mzPHWkU14gRa15ZsAoA5Xcd6fEBkHeRHyhPr
 c3fCNzc2NK0MGruNLN9zQakHVl135fZqVRxvFtVbBSrOE2ASWBZbLUaviL4Ip7Q3o0k5njRAn6I
 XKiFliIpo5AdrGTTlq1QmG1fOHIj4Yox5mTqMosRHmGo2fKAmCBXyld1Fs1sHWC4Mrw5NhRkREF
 bVCGQbjN4xHhmiO/JvA==
X-Proofpoint-ORIG-GUID: tf5rCsf6toj20di4PvfWt8Zz2GkwgW6Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNSBTYWx0ZWRfX2krNXMDeYtBa
 bMgnb7PG9/fWf89uvWCPpcy1/p/qo3nnH5kw3fPORcj0pQF1SCQO29Eww3mfHGFc3fkF+wcanq6
 waoqfOuaxIkYx5eVAnsWMYcm93jjCPw=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af167d2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4LWvrIubDFmFlJ2n6vYA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090025

Document the Novatek NT37802 AMOLED DSI command-mode panel.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 .../bindings/display/panel/novatek,nt37801.yaml    | 49 ++++++++++++++++++++--
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
index 1b38c1d0af68..be318cc84d52 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
@@ -4,26 +4,30 @@
 $id: http://devicetree.org/schemas/display/panel/novatek,nt37801.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Novatek NT37801 AMOLED DSI Panel
+title: Novatek NT37801 and NT37802 AMOLED DSI Panels
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description:
-  Naming is inconclusive and different sources claim this is either Novatek
-  NT37801 or NT37810 AMOLED DSI Panel.
+  Naming is inconclusive and different sources claim the NT37801 panel is
+  either Novatek NT37801 or NT37810. The NT37802 panel uses the same common
+  DSI interface and regulator supplies, and additionally requires EXVDD.
 
 allOf:
   - $ref: panel-common.yaml#
 
 properties:
   compatible:
-    const: novatek,nt37801
+    enum:
+      - novatek,nt37801
+      - novatek,nt37802
 
   reg:
     maxItems: 1
     description: DSI virtual channel
 
+  exvdd-supply: true
   vci-supply: true
   vdd-supply: true
   vddio-supply: true
@@ -41,6 +45,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: novatek,nt37802
+then:
+  required:
+    - exvdd-supply
+else:
+  properties:
+    exvdd-supply: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
@@ -59,6 +75,31 @@ examples:
 
             reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
 
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "novatek,nt37802";
+            reg = <0>;
+
+            vci-supply = <&vreg_l13b_3p0>;
+            vdd-supply = <&vreg_l11b_1p2>;
+            vddio-supply = <&vreg_l12b_1p8>;
+            exvdd-supply = <&display_panel_vdd>;
+
+            reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
             port {
                 endpoint {
                     remote-endpoint = <&dsi0_out>;

-- 
2.43.0

