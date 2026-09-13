Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1223EB819
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302791; cv=none; b=ZXxWnojVGapLFvbTeINjPdSgkj8lz5IYMnmKCLWIrZuzj1mnN6t5iPKf8NSL7IfI5GVhhRNtLcU7EF3t24BbBf9r44zMdycIAHo+HcZ/PYyfUuQqJFbLaw0N+3wkAxln7fatZkTWCAHM0XHKyewwTZbx9EoE0ZdoN83kzE7UhbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302791; c=relaxed/simple;
	bh=AlIaJEIuArFUR/Ki7M8tVpoeGLbBeitAeHOitnugLnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u0Ftk+6ms8m1bJJArZK9K5C5pHHoIiVSDef30Mzm3od+GXugNapQrHwb3+ZPVwBc3K3MYFeG6BUVR2gocnXI+pZaErW3Z/0vhAMkc4fPF+ayUjtDyhZsyBjJtGtGbdiSyOcqUeJzkP55CHxjGDoJDdmOaohDe/pc3zd6DDU86ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTM+lnbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDzBvyNv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTM+lnbI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDzBvyNv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DATxZG1467994
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fpGKnPlwQMJ6d2jd+nVDM/rLtIW0wAEYfjJ
	WJ0/R6KU=; b=ZTM+lnbIWAuul4Hcc1MMF1HCH6I/TcSe78+k0+DQpEJZ1fEdrLd
	cZiGKC4sCIZkwHPKu0vru9hnOp2QQRLMO2SFxQzmJIKWD66GKfkB6kg9fDx5A3qT
	9UQ7s7PmGOxsfgp9Sy3iG2t0zE1VaBVmehixQfTN4u7EP+kOlGK4E300Qi6FOoQ0
	FIO3LK1Ex7akrRHQwIh6lTnATnUiIA/JzgM4a/tzXU8APjzSm1dNeVac3KeolaBt
	vn3UWyZtZSt0MfGElRkoPf1NMpAH3u8JT/jyLmiRe6TeBRWgtEXAD2zA3xRs4//N
	WSO8b506TXCzQnFVuTGfvPUCbxjyhBbbipw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c3751-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:33:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a08ff8451so165841985a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302787; x=1789907587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fpGKnPlwQMJ6d2jd+nVDM/rLtIW0wAEYfjJWJ0/R6KU=;
        b=hDzBvyNv4h6hw/ctZSwrbSnhp7tDlclbK0IWb95Xu4vpOva/k0M9cCcVih0+lZE7KS
         IY1lOgYZWD5WyRQnl6or+b4gf1OjmqCmfZV3+/4OKcfa3oAumNyqKRQov7B5hkcggljs
         KJhIhdXuRbwRrFL0FOHVaqmdKGu1oPKYL2pClD44tLoL+wlAp/DrpIijJIytD+T8UOvu
         bi4rEFsOQFrh/RMxB2hQvOoI2vOb4Ynj+TXBOCJ0fUy0hwigfWFjnxnUMxgJrPi5jLsp
         6d6wo2PNT8qqd2LHp3FVD9jMyfD3tFwIhBP9GCHM1LJalq0ioDPuQ3BfJ8yvXrIgD8iF
         W9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302787; x=1789907587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fpGKnPlwQMJ6d2jd+nVDM/rLtIW0wAEYfjJWJ0/R6KU=;
        b=OCn3tibwKeYYBWKHbmHya1lIbjZwTthOOEqHwBEkmqzOvGuJ3ZW+IcUt2/AZ9PioN+
         BGhoOMa8VhQJXXCSw5pkTBZ4SCxKWXFc0VV7qp28UsX8+kr0cjOQ3/BNsTZ/7Qn1jML4
         5UFilv1hGYqDWMLHRB57M79IRUbcWWYOiliN+7icFWus5o4aLC2yDIlETireCdgg89+U
         OjcD9o2ywwKtvepTFpjSDv89txJKl5VpLC8EBcPaozVHXosBIYZjI0+bBJ+AOOR3IoMj
         ZCeQ+8hsHHEmuEqMSY2JrisuRX6P8TopzlouxxpiyM8weOfnOicXKbnMLB3G7qolTdJn
         gPRQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0AN/u7I9zGcv7A5RpVtB9FAWcKrZuQ6DC1UfkNZdURiabbatBhm6meJVv0oj3AsmGy9qRoR0xVNIcMLc=@vger.kernel.org
X-Gm-Message-State: AFuF++nf0Alwob2N+QTVUSOFq0ZL8b4nhYNgMA8aFMAN+ehpcjgow7VZ
	EPBJ0+aiIFGsIRG8eJKi2fBkSV1imwlX7r4FXckpGLExEgj4e+VOPjKQq/AKFyBmPLj2JLIHsB0
	VDRAe5CwVjeZMNp9cBWzpZJBxmhkArb1rvxXODWD7yULnHpuIWg3H2deSDUftgVF6hSs=
X-Gm-Gg: AYBFou1v0H5sbnzMgAOGe+KjdDnH3MbohgblwkmXdX186QIHBH/s4t6AHSv8GHJHfFn
	nvGreHQlxc0F+42R+bEb6TlrEUCJnrejP+Nx1oMrDHS7fStHmF9m7hMaGpoUxjiuUhGfWOdAHOV
	KUyyqjl/IY9JCIsA+UO+hY6GzbOxn4vmTS5slE9kaztgezOFoM8ZZMAOwO5HrOoDN9Djn8t6/Wv
	/O95koMYK8USEmqXg/vDcSchwyR0chbNLwMwjaLWzJIwJrAV06NzVfX8DR9eTFodbYwrxiN+q0X
	fkG9OpwZMYTLGW7dBI/Rp+6TTmcT9P2Ht+FsYdN/egCfNxGV0kjHXzki2VCPMdXoaeAOUW88dau
	Y8+k4/WJp/veSLl8=
X-Received: by 2002:a05:620a:8390:b0:93a:83d:1d26 with SMTP id af79cd13be357-93a083d2432mr875126785a.32.1789302787192;
        Sun, 13 Sep 2026 05:33:07 -0700 (PDT)
X-Received: by 2002:a05:620a:8390:b0:93a:83d:1d26 with SMTP id af79cd13be357-93a083d2432mr875122385a.32.1789302786689;
        Sun, 13 Sep 2026 05:33:06 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm20863041f8f.27.2026.09.13.05.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:33:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Artur Weber <aweber.kernel@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Aleksandrs Vinarskis <alex@vinarskis.com>, Andrew Davis <afd@ti.com>,
        Steffen Trumtrar <kernel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: leds: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:33:02 +0200
Message-ID: <20260913123301.100129-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10147; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=AlIaJEIuArFUR/Ki7M8tVpoeGLbBeitAeHOitnugLnU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppf9BkR0CkRS49lp5YPjksTU5OTemdYktvvon
 lGCs9CU1+SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaX/QAKCRDBN2bmhouD
 18+LD/9eTwuH4DhTOVdNetOCBQo8mjmDh6a46105Id9+ghu8F9b+7iOHiFMhbH/AdIA0ZAIup4f
 ZTB4BGdCmpmHTHp6DwZSY5j1FPDvr1D4h5iI12xvzO15ohg3OY04iOS4XKzXQFQ90F3IP7W6nOW
 TIGe3bQtAKCCp8tRxMQE23+eQ7nUv8AOMtIhhFQc5Q6KamCzz4yDMdC4iKDZIN12c5GzdXxO2T/
 72h2eXlh1ji7s3lTNlcTbYZOQClhpyXO8DA47EZIvZjKUaRWrKliD2OwRgVqesIKasXdbxKd+wx
 bHcuTklRP2ZKr5rN/XTnhjGzWJOgWEpQEFSDzPOwnP9oS8PNnSg5355vTA7RgYNYOXDNVd9zkXa
 oWu9ecRoj5S+3LHmoYLyWRP0GEkg5YCBy1JdoAAqx88JxnbOHUUgWAfkHbmOPYYyULs0Ury3b1L
 ByD7vZZ2dG6J8AxLGi8XCx9VRiM6pu6nNffefgU1gw/HmNM8H2V8850EWjqfb+cz490HvkIIzUy
 De4qYJda1Ux+Cr4abTGe9mEf1pTmvAJFzY05UbDzExqZ8XsbFHAY9f8WfvvC87YstXzPk+fnT6U
 JUbce9aHBVECCmt7GscfPtKtfwuhuEhCs86If+FdVZMzHrhvvAsKJ/xIehOhfpJdSF6xJUFZp7j s6+waFjqULVNcWQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CMsePcEzGFaKwbokH7E9EpcLtP0LQxL1
X-Proofpoint-GUID: CMsePcEzGFaKwbokH7E9EpcLtP0LQxL1
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa69803 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=a7949CMAvHCJeXM5QSwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX5VKPVOpSCUF2
 xb/bIc8DwzqSaSZrcZxawFurkD6Ct0HRf8mDGljzghbe3Bwbe/vApmgv5jqQCS6MHARU8m5m1Pp
 b6SlebfVFL5bQlMHFlj+eKIr10eGY4kuYZ5JBCbTgXylEhLLYQVKw2cv+2X+6OuLaAT33ivpd6a
 ui9xzfPjt/roSz9JhYxXrJNic5Q8IMuf77P9dJ8eNRAtgSqaoU1TjvObZ0+8NSmUBnbK6B/7GTq
 r3KuMGfaJ4gG6PfhAV5BUeKgodQJs8ZweqiUVGmr22iGTvzMEr/9GyzEdXLEJU5LPOesgV8Zobt
 G5B7DnbU3sqJLmdN/Y7j3d+taCr8fmXkFC91wwA3x8cFt3tyfMgCRQm4mw1V1QIbz9TIoQgV1Fi
 PUbQ9bX5w+qDU0hiIFWdmtIpK0wMkkN5+wibsupup59VOXhFKoM81TMc3922cFpAB2+tEtk9R3b
 5IZnTEamB3Ww3peZ6OQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX4/9s4Vj+vr4K
 s0JU0gKHY+RhSDhDSaf/EtRevfmq3mjcoWb6r5efug2C03OhBTI9cDzHCZCqZqlYzQtsQ5dc9mq
 Kh4A4aitcM/mtksxPQeg2eG37/AiFCk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../leds/backlight/lm3630a-backlight.yaml     | 52 +++++++++----------
 .../leds/backlight/lp855x-backlight.yaml      | 18 +++----
 .../bindings/leds/backlight/qcom-wled.yaml    |  2 +-
 .../bindings/leds/leds-consumer.yaml          | 14 ++---
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 12 ++---
 .../devicetree/bindings/leds/leds-lp5860.yaml | 12 ++---
 .../devicetree/bindings/leds/nxp,pca963x.yaml | 24 ++++-----
 7 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
index 3c9b4054ed9a..6393cbf3afdf 100644
--- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
@@ -99,20 +99,20 @@ examples:
         #size-cells = <0>;
 
         led-controller@38 {
-                compatible = "ti,lm3630a";
-                reg = <0x38>;
-                enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+            compatible = "ti,lm3630a";
+            reg = <0x38>;
+            enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
 
-                #address-cells = <1>;
-                #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                led@0 {
-                        reg = <0>;
-                        led-sources = <0 1>;
-                        label = "lcd-backlight";
-                        default-brightness = <200>;
-                        max-brightness = <255>;
-                };
+            led@0 {
+                reg = <0>;
+                led-sources = <0 1>;
+                label = "lcd-backlight";
+                default-brightness = <200>;
+                max-brightness = <255>;
+            };
         };
     };
   - |
@@ -121,22 +121,22 @@ examples:
         #size-cells = <0>;
 
         led-controller@38 {
-                compatible = "ti,lm3630a";
-                reg = <0x38>;
+            compatible = "ti,lm3630a";
+            reg = <0x38>;
 
-                #address-cells = <1>;
-                #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                led@0 {
-                        reg = <0>;
-                        default-brightness = <150>;
-                        ti,linear-mapping-mode;
-                };
+            led@0 {
+                reg = <0>;
+                default-brightness = <150>;
+                ti,linear-mapping-mode;
+            };
 
-                led@1 {
-                        reg = <1>;
-                        default-brightness = <225>;
-                        ti,linear-mapping-mode;
-                };
+            led@1 {
+                reg = <1>;
+                default-brightness = <225>;
+                ti,linear-mapping-mode;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
index 9416e1bfab92..2215ee1b2e5b 100644
--- a/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
@@ -95,20 +95,20 @@ examples:
 
             /* 4V OV, 4 output LED0 string enabled */
             rom-14h {
-              rom-addr = /bits/ 8 <0x14>;
-              rom-val = /bits/ 8 <0xcf>;
+                rom-addr = /bits/ 8 <0x14>;
+                rom-val = /bits/ 8 <0xcf>;
             };
 
             /* Heavy smoothing, 24ms ramp time step */
             rom-15h {
-              rom-addr = /bits/ 8 <0x15>;
-              rom-val = /bits/ 8 <0xc7>;
+                rom-addr = /bits/ 8 <0x15>;
+                rom-val = /bits/ 8 <0xc7>;
             };
 
             /* 4 output LED1 string enabled */
             rom-19h {
-              rom-addr = /bits/ 8 <0x19>;
-              rom-val = /bits/ 8 <0x0f>;
+                rom-addr = /bits/ 8 <0x19>;
+                rom-val = /bits/ 8 <0x0f>;
             };
         };
     };
@@ -125,7 +125,7 @@ examples:
             dev-ctrl = /bits/ 8 <0x85>;
             init-brt = /bits/ 8 <0x10>;
         };
-      };
+    };
   - |
     i2c {
         #address-cells = <1>;
@@ -142,8 +142,8 @@ examples:
 
             /* 4V OV, 4 output LED string enabled */
             rom-14h {
-              rom-addr = /bits/ 8 <0x14>;
-              rom-val = /bits/ 8 <0xcf>;
+                rom-addr = /bits/ 8 <0x14>;
+                rom-val = /bits/ 8 <0xcf>;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index a54448cfdb38..bca00b774bb0 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -280,4 +280,4 @@ examples:
         qcom,ovp = <29>;
         qcom,num-strings = <2>;
         qcom,enabled-strings = <0 1>;
-     };
+    };
diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
index fe6a0faa1d3b..b4065c9733a5 100644
--- a/Documentation/devicetree/bindings/leds/leds-consumer.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
@@ -53,15 +53,15 @@ examples:
     };
 
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      v4l2_node: camera@36 {
-        reg = <0x36>;
+        v4l2_node: camera@36 {
+            reg = <0x36>;
 
-        leds = <&privacy_led>;
-        led-names = "privacy";
-      };
+            leds = <&privacy_led>;
+            led-names = "privacy";
+        };
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index 23f809906ba7..85182ad7ad09 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -121,18 +121,18 @@ examples:
                 function = LED_FUNCTION_CHARGING;
 
                 led@0 {
-                     reg = <0x0>;
-                     color = <LED_COLOR_ID_RED>;
+                    reg = <0x0>;
+                    color = <LED_COLOR_ID_RED>;
                 };
 
                 led@1 {
-                     reg = <0x1>;
-                     color = <LED_COLOR_ID_GREEN>;
+                    reg = <0x1>;
+                    color = <LED_COLOR_ID_GREEN>;
                 };
 
                 led@2 {
-                     reg = <0x2>;
-                     color = <LED_COLOR_ID_BLUE>;
+                    reg = <0x2>;
+                    color = <LED_COLOR_ID_BLUE>;
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/leds/leds-lp5860.yaml b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
index 0e88c71c2d39..710fec3738ed 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
@@ -100,18 +100,18 @@ examples:
                 color = <LED_COLOR_ID_RGB>;
 
                 led@0 {
-                     reg = <0x0>;
-                     color = <LED_COLOR_ID_RED>;
+                    reg = <0x0>;
+                    color = <LED_COLOR_ID_RED>;
                 };
 
                 led@1 {
-                     reg = <0x1>;
-                     color = <LED_COLOR_ID_GREEN>;
+                    reg = <0x1>;
+                    color = <LED_COLOR_ID_GREEN>;
                 };
 
                 led@2 {
-                     reg = <0x2>;
-                     color = <LED_COLOR_ID_BLUE>;
+                    reg = <0x2>;
+                    color = <LED_COLOR_ID_BLUE>;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index a16ca11f630b..dac316741b9b 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -164,27 +164,27 @@ examples:
             #size-cells = <0>;
 
             led@0 {
-                    reg = <0>;
-                    color = <LED_COLOR_ID_RED>;
-                    function = LED_FUNCTION_STATUS;
+                reg = <0>;
+                color = <LED_COLOR_ID_RED>;
+                function = LED_FUNCTION_STATUS;
             };
 
             led@1 {
-                    reg = <1>;
-                    color = <LED_COLOR_ID_GREEN>;
-                    function = LED_FUNCTION_STATUS;
+                reg = <1>;
+                color = <LED_COLOR_ID_GREEN>;
+                function = LED_FUNCTION_STATUS;
             };
 
             led@2 {
-                    reg = <2>;
-                    color = <LED_COLOR_ID_BLUE>;
-                    function = LED_FUNCTION_STATUS;
+                reg = <2>;
+                color = <LED_COLOR_ID_BLUE>;
+                function = LED_FUNCTION_STATUS;
             };
 
             led@3 {
-                    reg = <3>;
-                    color = <LED_COLOR_ID_WHITE>;
-                    function = LED_FUNCTION_STATUS;
+                reg = <3>;
+                color = <LED_COLOR_ID_WHITE>;
+                function = LED_FUNCTION_STATUS;
             };
         };
     };
-- 
2.53.0

