Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159343E9C2F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302776; cv=none; b=AH51PQFQk4cDjkTLqx9+Fyq3Bhg7lcxDd5Duhwua55cAb36vnAgvuSgBFGXfb7K1NmNg25YQ8DDVmjmN/q/jOVptirmvneGUlhfK4KHzMBJKusy8VygfsEfeZ2AwE/aEbBLeKfLg/FqPP7k+k4Ejw7tTydDCq5ZKIGXusKho/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302776; c=relaxed/simple;
	bh=vns3fWZ9F1LPaW/ex7XVhNsx9UCowEPvW0dJYWFUamw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkZMJ6r1H2tWy7HdVHE2fxijoXC64to6AuAvswyweaq3yZ3cMNvhWOm0Ip+VtGtOnL79ouxZv+N+aYB57tW/q6lla3WnIVhs68PS8BLa2oU5jAyClh0fh88D147Ex1PTtsyiQCdX+qeEjKxU0B03H+2syDwmPoQ7yDDmmaeV4gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqbntiDT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxhMPiJ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqbntiDT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxhMPiJ/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU6I61005067
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kplIKopMwPUMb2r9aqBya9m7p+aoU4XVSf+
	RgSQ1VMs=; b=RqbntiDTalTQy8rlGXiX8Zfd6Vw3rdiePPNbbUQWTdqtQeNNb1B
	wbkH/bntEIGHRK0yjhTn3DQWtduCFrx6AygFvFq3bcYX9rlNssRRycd4KSiN9OZa
	01G6uF3kJtPard55RFY61/IBypKunwh9WjjVyK2qbDraglPzvlFHfq/w1hP+JCPX
	EUoox1toZNIqF5s91m/sjgqxOBatVuNHpmscV2GoG0VEiGSCzxbpGsDi79iVC+8C
	Ol9G2bKqu2SJ0HPBX+HEdcB/6gJXB9si/BaganMDGYfDrhbrsquQsTQZftKnGoYL
	NSRclkylaj9yQBTlRQEulTF6WIa0ank7oPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd38n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:32:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso256581785a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302773; x=1789907573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kplIKopMwPUMb2r9aqBya9m7p+aoU4XVSf+RgSQ1VMs=;
        b=hxhMPiJ/Q7gxdL5tTEre/6mWwDRX2vRAIUJ6jjtZEbi7jCLC6qJxQKi45lsXXsZSrT
         GGk+TkO/5U8iCtYQufdR0tR3I+1pev2NytWuK+hcB45C5KNgWxBXvHv+ZdeP232q04LT
         LAn3yZjSBD5TCXk8JNhftZZFZx3b2C9OBlT4rqSBCbfkXfyOQkaBN24Y0r8PZTuP+H7C
         hjtXq7kajWqNbEglO2YhPaTyw+DiSij06olxmKxTJ1tboinKnOrzb6J5BC3cOZbQ7omc
         FZ4hPCMK1wTjAfDClay2ZfaoYDN4GxnnIy0OkjvgKhcQoeHAvkdCEPaQogL+6cJPPB/8
         ePXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302773; x=1789907573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kplIKopMwPUMb2r9aqBya9m7p+aoU4XVSf+RgSQ1VMs=;
        b=Bjp0r1o6kZt6Fj+44mmTUwQiTZdrZ3SK0pRtn2vF595dsapJvu6BrxzZJDdClrAMNC
         7RQNn+MgSIPB8CXxWrqHmw0fmzKwypD+U0NcFu+5qa8a2ai0Gi/Du3uAF4uBPYdA9riq
         7drjfLBhyj0WVyVaooUnnPzyNbOLD/Am4RpDEL8aUqznKT2q5skSb7KXjrtaZVVzehs/
         soWSnfgppvDR9PwSrOiEmrqsEfVl6FzE6WDahm+UBW24iP8FrZHTVpeXpve9E679QD4p
         wouaR3VeWmhZal+9wowAnBQ6dz+KPCdfYqMBoPWTeZItd26UJxDf/dJyNKgHRtHwi6+h
         sEnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMujsju7P1NAGPIWnx/m96eQnshu7851Nd1KjcXk41xph91PTkW9xZpr47+RQZKfWG19RD+YONiFPJViA=@vger.kernel.org
X-Gm-Message-State: AFuF++k2bZzN5gUvyx1IVupgNHliNHhJtxRg+Pz0gE7juY8iQa9PLb1F
	YZeFdVHk5jwMhAnMD2N7gsb2ONv5peSnxp/haQ9F8Bt3CffBQoc7BmdHE3rbOSRrAMM+AGhL0wB
	bqkt2MVbgklTP7D+f9Cj00KhrqAE4BegL9m/UDiu8ylmplcMlcpF2s7cQS0BMBSAy0EY=
X-Gm-Gg: AYBFou3Jx3F3OeSgU2cAmm4C2PbdAABP9dLdowXV7ZZcu4GQJIYgJYIwQQwiXW9F54P
	U1dkrrnZ3mA/RNNpjfe/9B/cGDjoa+WgVczqXI1g49ZmACvMtG9E/Ne83QipP4kWhrfIMIZxVF2
	U4QwcPIsfP+/jm3l/S8nyoWtWhi+V0raPc/3nvbuMwp2n1qo//4ihj/NLl43dJPvguG6UfYPRWQ
	P1aSzBON6n6p7DlzPTxc9uSovU95oHdw8ytbyYeHDu/NfsfIBWzPF1p+D/2EbFfLqgVFxX36g/x
	Z2UU/rmdks8rnHRsCZw527EUT2ePGvKSqA2do9dr2CfFmnZl0yGCXa0qjJRng7/Qn4HL3fSMMA2
	uY6e0h3/DsnTRSUA=
X-Received: by 2002:a05:620a:410f:b0:939:57ca:7e0a with SMTP id af79cd13be357-939ea0e3ffcmr2118441285a.7.1789302773448;
        Sun, 13 Sep 2026 05:32:53 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:939:57ca:7e0a with SMTP id af79cd13be357-939ea0e3ffcmr2118400285a.7.1789302768225;
        Sun, 13 Sep 2026 05:32:48 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm18582661f8f.1.2026.09.13.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Alexey Charkov <alchark@flipper.net>,
        David Mosberger <davidm@egauge.net>, Li Jun <jun.li@nxp.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: usb: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:32:44 +0200
Message-ID: <20260913123243.100040-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7573; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=vns3fWZ9F1LPaW/ex7XVhNsx9UCowEPvW0dJYWFUamw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppfr2T0eDO30H6kD/uma0qpARjtXnOfpYvbHR
 mgm6R0pIl+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaX6wAKCRDBN2bmhouD
 14zMD/0UULishGTn+lTzSfFq+0qYLgpwtzcOwgRKwsxUtSLUWUTXcSWm3YQfhlVnFwv0fvvWvC+
 B58ouK0p/tGUd32rKCZs/YsttShhPzVAn7sM/KlOEY01oMvqr8atJaGdicCIHwh+vun6qQe6nCP
 Lal8NAA5KFPjH701Vmgtuzdj40v0C9SwP2JmDIsqCJklZcgFmO9jJW5w48MXy0AkfymqqcRzmFd
 +AP9oAd2iIFNDjynn0Ym0FbTkiBVLFfRI4Vgfepk8kPf2optAk7TGwf1dIZgCVS46KNCwN6Pm3Q
 kT75PJoHoSalDQnCmC5UqI2ggwN/K9e5ptbMp6+8Zv0IxY7uC0sNH8cWLMkAfD1IGHCG0Cva7uy
 5eUm9fqlIhSq9ZhF0sxDvVMm9O80wJe812jj9/13zrk+1bPP11M1R1EudL4SAYfRXJf2yasCX93
 bNxgmNDYjW4qK9cWFu+il6L2jEyDWQsWGigXT3CI6uvTlrwlIv78Kqb2uuuJypGaGtsOjQ3oogK
 YLRe53+Lsit4WoHnAAFpP1gqLGueq2Psc2tXrosli7mUMj+bFtI8JE+lb80nc95O0YC8/mpaf53
 JmmE3YNrcKG8cWJlPJDg3QUfTWHWilbqYtoJ+JN8tIc1NzXKwImDXGvdsJ1Q6rNBbIHEOeZrd91 khXdc4vuXEM6b1Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa697f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KDEBpenjW5rMv1hHu3kA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX99czzVO/zcGO
 l6cibxNgdGrItp5cUazX3QEQrAtnGhIek4dql6jEgAzY8JE41vBUcjgAPOgJ5XJglCA4VYtAufx
 fZo8iHc0aJJl607nfmN4f8q8SjOsh8oMIn5mkbTSYq94grqwuWAe6o5YLbuIJw7stV2YC+cpYyj
 Bf7yhgZOlf9hYsm4WOM7VZuyjCsfFElEiZEoARrA4bC55gWArBVmR5vyXV45zQ5LfHZpMlJUyJK
 9VBodddJTu9fxFrt5WtRqZlCMXSrvHaIGUEv6xU1DNh+L+iIyAUYumIUGLwUNC68jJCqnUOvTg+
 HiAg978MJFWtnHYUf2iPMJsKwooQNqsvgyOrc9DIsk59sgfPMVLatD5sJPPw+gW1j1CzkPRdbrJ
 NSqRvI3yFbNxsMpINfiiCYNsI844THTYj56kF/hJG1tad/2IB3aNy3xsjpoT7L1p/Ogu+OVPk5E
 lG4c/yGeB9BhiocB3kg==
X-Proofpoint-ORIG-GUID: 8m7tZuCrXQ_-ZbPJ2KkKfnwehoo_hZBN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX06RZalMxloU0
 206DMT34l298WMh8VIF7bt49b7+dmm7jCLK5elDoLrDQEiaguxOhJVhqzUoq+AR6o6M2dlCKKXV
 mEfpH/Mqzpad12N2yDl3ehiT+jYjA5A=
X-Proofpoint-GUID: 8m7tZuCrXQ_-ZbPJ2KkKfnwehoo_hZBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +-
 .../bindings/usb/corechips,sl6341.yaml        | 20 +++++++-------
 .../bindings/usb/maxim,max3421.yaml           | 12 ++++-----
 .../devicetree/bindings/usb/nxp,ptn5110.yaml  |  8 +++---
 .../bindings/usb/realtek,rts5411.yaml         |  2 +-
 .../devicetree/bindings/usb/ti,j721e-usb.yaml | 26 +++++++++----------
 .../devicetree/bindings/usb/ti,usb8041.yaml   |  4 +--
 7 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..26731c45a604 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -130,7 +130,7 @@ examples:
         phy-names = "usb-phy";
         vbus-supply = <&reg_usb0_vbus>;
         itc-setting = <0x4>; /* 4 micro-frames */
-         /* Incremental burst of unspecified length */
+        /* Incremental burst of unspecified length */
         ahb-burst-config = <0x0>;
         tx-burst-size-dword = <0x10>; /* 64 bytes */
         rx-burst-size-dword = <0x10>;
diff --git a/Documentation/devicetree/bindings/usb/corechips,sl6341.yaml b/Documentation/devicetree/bindings/usb/corechips,sl6341.yaml
index 82996791aaf1..4ddfc7594846 100644
--- a/Documentation/devicetree/bindings/usb/corechips,sl6341.yaml
+++ b/Documentation/devicetree/bindings/usb/corechips,sl6341.yaml
@@ -61,19 +61,19 @@ examples:
 
         /* 2.0 hub */
         hub_2_0: hub@1 {
-          compatible = "usb3431,6241";
-          reg = <1>;
-          peer-hub = <&hub_3_0>;
-          reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
-          vdd1v1-supply = <&vdd1v1_hub>;
+            compatible = "usb3431,6241";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+            vdd1v1-supply = <&vdd1v1_hub>;
         };
 
         /* 3.0 hub */
         hub_3_0: hub@2 {
-          compatible = "usb3431,6341";
-          reg = <2>;
-          peer-hub = <&hub_2_0>;
-          reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
-          vdd1v1-supply = <&vdd1v1_hub>;
+            compatible = "usb3431,6341";
+            reg = <2>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+            vdd1v1-supply = <&vdd1v1_hub>;
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/maxim,max3421.yaml b/Documentation/devicetree/bindings/usb/maxim,max3421.yaml
index 4639be7ab059..042dfc3467d2 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max3421.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max3421.yaml
@@ -57,11 +57,11 @@ examples:
         #size-cells = <0>;
 
         usb@0 {
-          compatible = "maxim,max3421";
-          reg = <0>;
-          maxim,vbus-en-pin = <3 1>;
-          spi-max-frequency = <26000000>;
-          interrupt-parent = <&gpio>;
-          interrupts = <42>;
+            compatible = "maxim,max3421";
+            reg = <0>;
+            maxim,vbus-en-pin = <3 1>;
+            spi-max-frequency = <26000000>;
+            interrupt-parent = <&gpio>;
+            interrupts = <42>;
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
index 581e5916eadd..fe9a02f21c67 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
@@ -67,10 +67,10 @@ examples:
                     #size-cells = <0>;
 
                     port@0 {
-                       reg = <0>;
-                       typec1_dr_sw: endpoint {
-                           remote-endpoint = <&usb1_drd_sw>;
-                       };
+                        reg = <0>;
+                        typec1_dr_sw: endpoint {
+                            remote-endpoint = <&usb1_drd_sw>;
+                        };
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
index a020afaf2d6e..9c8868c478c0 100644
--- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
@@ -84,7 +84,7 @@ examples:
                 port@4 {
                     reg = <4>;
                     endpoint {
-                      remote-endpoint = <&usb_a0_ss>;
+                        remote-endpoint = <&usb_a0_ss>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
index 0aaaadb584e4..176737156d77 100644
--- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
@@ -94,19 +94,19 @@ examples:
             #size-cells = <2>;
 
             usb@6000000 {
-                  compatible = "cdns,usb3";
-                  reg = <0x00 0x6000000 0x00 0x10000>,
-                        <0x00 0x6010000 0x00 0x10000>,
-                        <0x00 0x6020000 0x00 0x10000>;
-                  reg-names = "otg", "xhci", "dev";
-                  interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
-                               <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>, /* irq.6 */
-                               <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>; /* otgirq.0 */
-                  interrupt-names = "host",
-                                    "peripheral",
-                                    "otg";
-                  maximum-speed = "super-speed";
-                  dr_mode = "otg";
+                compatible = "cdns,usb3";
+                reg = <0x00 0x6000000 0x00 0x10000>,
+                      <0x00 0x6010000 0x00 0x10000>,
+                      <0x00 0x6020000 0x00 0x10000>;
+                reg-names = "otg", "xhci", "dev";
+                interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
+                             <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>, /* irq.6 */
+                             <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>; /* otgirq.0 */
+                interrupt-names = "host",
+                                  "peripheral",
+                                  "otg";
+                maximum-speed = "super-speed";
+                dr_mode = "otg";
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
index 07e13fae640b..e75956f0f85a 100644
--- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@ -65,8 +65,8 @@ examples:
             reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
 
             hub@1 {
-              compatible = "usb123,4567";
-              reg = <1>;
+                compatible = "usb123,4567";
+                reg = <1>;
             };
         };
 
-- 
2.53.0

