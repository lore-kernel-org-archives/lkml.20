Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DAC3839BD
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302747; cv=none; b=M+A7HmxSLQTSP8sDgqDMvtcfsXbXF+sqWR+o2f2qaZqJUqfYj1mtw2L9GrjEfa9Op88L7FW43YL65iwGHpquNvhLEjqzXiY2EkKDW1KYq73jatG3OSNeGSrQwyZAayIvqWGRRetgr254wWlsGapz0fmRsvbG/NMHffZcvg19/Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302747; c=relaxed/simple;
	bh=UXwLkW8e38Z+Chv4l/vZ5di96wXoEC3wESQhDm8+TCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XueVfcjXCAUWpj32P4HQN6geS+PCrC454K8Y5TyfmCXTOZa2u+NeNxkX9upPZuGEttDFt8rSrjE+lzzvh1YKgbXSxuON5mvAHXceZZdFjawNNfJ5TddHlaiokMOqWelcfdjZAHwldZqzFC4p1SP6ovnNHba6kQwYrpH3/7A3FeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYVPTm3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1rcWJs3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYVPTm3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1rcWJs3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU0i01004553
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eD46mbjj03Qxo3Sd/C9sKCXQfPVG5HQJSg4
	07QfH54Y=; b=HYVPTm3yC0dwTwy4+A6MYIzQnVEHH8ARfWxqjIpQD/oqdXo/d2w
	mjZR6uVqptgC1oGVs8h8qciqmREaNTysqcbgCM1e6xLLUosiiKmyALXVDYAzS4Kg
	Z/sPOoTdIiswV15nUZFdmaEldRrJpmBDE5ja4980xxjDw//xo2mgsC+ZBR0axcrs
	Ne5siolWOmXFe9ZYLzu/oGNaDEfEBbIs2R72hHOo43fcIfCrXgei6yd/lXDK6gFm
	l5suKfSaAANkb9oVQycBIA0isjqNDvN4VXR+D0lZuLYrLPFxrqyEQvZKtNmThX5R
	T7mGf2Cek6IPqIjcNMvl3MeQMam74MRZJnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd38kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:32:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so488324585a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302744; x=1789907544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eD46mbjj03Qxo3Sd/C9sKCXQfPVG5HQJSg407QfH54Y=;
        b=E1rcWJs3FAtaB5USb5NFIFhAV8gBT7edBQDE3wgsP3eR6sJjBNZWarXTNWW2B1pYo0
         kCdYLUa/2SPqWwzVPRKGpHqFDyE17nHKp+uL3YszEMdyhevyapEV7EjDXVeZGs28oIKk
         JJ/0TMsbKDVh7UqeiI6ifnjwshNVcaCUe+rSnqdik2hnqCMPpjlWaWULCQB5JpoBUhMn
         6kLkzjthtqSnJTwHd3TPz1pUG/96saSy4ry2ozAdd9zOkFs4Ex9iuuYbCOsl0chgn3gJ
         Gr8g/tx//jaeowbSBoGXj2WE8sTZkvPH+fleFSo1zRkKqtSB61jDStx/17kY+ySPE0Dv
         1UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302744; x=1789907544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eD46mbjj03Qxo3Sd/C9sKCXQfPVG5HQJSg407QfH54Y=;
        b=dRDoRfBrx64gK6Rxp8O7y7RJ2f6G38L2dFfQ4c5KPBCVrUIn9XrKqHCrkn+0EO0iel
         GAojf23HgrQO9qlpOTrHMKbewurSHDmxYo8ECAzokdUx7KcyA3kLz8wqjS7kBCYcyZk5
         eBkAAn4cVPj1Faa/Hfjzb8WKFEIdYMUFraeVZt15vAgOr+KH4A7pdkTpCse7a4RFshZf
         zBtpsF01W9VN+l4/luOia/8+zwwP72v2kiOaXgvgwAC2x5qwBgCTnwo/ZneEW9k9huch
         ZV1PFrilMpEcuDDrjqmhsoSwfjy+joQSwZ+rkYh1dsXRFKAPI6osYD6ajV0Y6dJku6aH
         8q7A==
X-Forwarded-Encrypted: i=1; AKwUvBwoiWN4chuyEAiy/qSuaFSXsjvuMR8Ot5w91/8ozFpAV3qDVvD+R3+sFqlBTrNASrmmKpcNPxmR0rIykeM=@vger.kernel.org
X-Gm-Message-State: AFuF++nx0+NjDe1V7zIjdmnPKfO+sDLLV89exH4lwsiiasE0McCEe1hA
	CZx9L5qY7UN5yBP3Le9JVEV5i9VSrfzRMjf8YExMXy2AQWkt+Fy0Fh/x5tLGEAtGrHmop5E3whP
	LhIfJdsE1s4tgP5ZllFqbnXAljADJ80ZJ0q5nSLOYdZV/2ZPx6WPP2GPGdVpnzEqHp1g=
X-Gm-Gg: AYBFou3ImmotOxH0/VQw9SLGKIIYASYHMAU9hQCOQ+LvfHa+SQi/mYuNry5Y5uK+LUK
	pc/R++eLVnvIZ4WnPdXiy8m0I21CSGepMPmmhgMZBbc/vwmRQJ/oYMw9DeFxMGH6YCtWVuGRxoy
	zn5iDq+EBUp0zKDRWiigh2qc2jtqlN50I9rIa7yIrzxsS5CqF7uAt/KnewEJ3J86zd1RCz3Oebd
	lbjV4vX8mtL7N/wTY97LioEc474OIgsDCerArXYOVUCwB/Stcx7BS8XBVCccJPKuM3JMgCqUjhA
	E2oll74f+G/V+KTjhuG7V6NK9DzgHIJAxX46viUNAWyVP+WLt0k4Nyeo2OLyqLbAyzucFCyh7+9
	QYIVYTvw358oR3B8=
X-Received: by 2002:a05:620a:4491:b0:939:a9d4:7023 with SMTP id af79cd13be357-93a18551856mr201803285a.10.1789302744405;
        Sun, 13 Sep 2026 05:32:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4491:b0:939:a9d4:7023 with SMTP id af79cd13be357-93a18551856mr201773485a.10.1789302739186;
        Sun, 13 Sep 2026 05:32:19 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm14345092f8f.0.2026.09.13.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Iskren Chernev <me@iskren.info>, Jisheng Zhang <jszhang@kernel.org>,
        Joy Zou <joy.zou@nxp.com>, Christoph Fritz <chf.fritz@googlemail.com>,
        Brian Norris <briannorris@chromium.org>, Lee Jones <lee@kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        ChiYuan Huang <cy_huang@richtek.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] regulator: dt-bindings: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:32:13 +0200
Message-ID: <20260913123212.99817-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10735; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=UXwLkW8e38Z+Chv4l/vZ5di96wXoEC3wESQhDm8+TCY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppfMgW8CVFgfTDKvWnMCCi9vdnPATpVEb37JQ
 /545925IJ+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaXzAAKCRDBN2bmhouD
 13SwD/4+3EQudJq4eptqIZvVno8xNcy+dkry55DBLr6ceqVgQBbpK4Amg6HFY3Mw95tNXDjxGr1
 i8pDflWQngkdM4pij7lnEfvVRjlhmkMBXSKt43l1zYL9S6ImkYsQ+2imxsNky7Ln0PnXPScZwgw
 pHKYklrPKkWxrohn06iHw5cCS1efXmBN0H8Bxbv77m2+EitrACGsctSR6ONgLna0CVCHwMvrJBA
 7w3bbSjAKlchOEdvC+7nuvF5nbWwCuTd3LCcoU9GUKES2OS1V7tSVxXac6LttOG5yHN4uHlf52u
 b8IeNKF255037lWGCibuMizyk7Cc1J4UiTlq6mw3i+7dtHownkWHXF8c8iaWhdjt1Kj23abtb83
 rctp1FGMKbOUIE0DtRqi5yH01H9Cpnyb8LkGQjtw0RHQM0dw88iA8WshzEPZCFg+t2YUtSECsnA
 i9rxsWg3iD13vhiC0cTEJDuFf5C9PDNW3X0nHaMUlvYyvC/uuFVMv0SdZxBetMFwkoG0w/CGpCa
 AeGsaqclYZem3ZktYQ9hPOACryzmt4pOCd79HR4eo6Sf9rIFrW3DH330mhasezNMeFxaxzC2QBH
 1vGzhLK/jVv3NdqOkj3rmATnopwdpZ09ZJM00WguIgGNf07X8s3SZfISsl1y7jeBfCve4L8Xh6I 3c3gcfr+1AxIDUg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa697d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jun6ngf7UhJfMSKaYbMA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX045UN7kaE+nv
 FgKWMW7YHqUBiF4r07t1monwJYU8lqQXXOQbXI+P9y82YVWwmAxH4HnbA5Ajalm2xqhsycLa0Qn
 /yHxg9xnWbJ5gDKXndsXNBbImY46kSo8sV6mzAAnbvu2jd5A0py+hwsLLGIfYuqH/yUVH8OYZRU
 YgLG1RXRknfdZtGoD2v2Kk3sCG7kMXNZXmPxG/MKa0qsR9B7xa8oqdhPJ6JgC1x5pjprh3RCHL1
 Eb9yBCvA9itchOyP+Kc/pFavNpRfTxXhoa4EJAxKST+XjW6P+UAhTVcHCTDYw4inj4q288vAZFh
 wCxKJpkx7Z7ajfnxGvy3/g7txHkH3le03keIT+fe3Sa0waOf5b+HJlWXIWGfGsNUQrioXWTqHbO
 OzyIGQ8beFofN5C1sAM5IplRHDh53H5iP8iDpwcrSEmOKNC2iMpNkKDAQCfEAq4bnp1ESFbeNKF
 ydZefyYxaImq/EMhhXw==
X-Proofpoint-ORIG-GUID: MigAjmDqA-pAk0cvsLOWQWaeMQVgvDPI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX6f7GOLqt8iWu
 DW8WUbvYE3l/zndrWsW962KTYjFY6HVyT6eC8rKx8QNbOs5a9B292SMlN7S7XowAVQx6v3dwnco
 CBLXc+woxdriixvkq1SKWNlrgFbLm8w=
X-Proofpoint-GUID: MigAjmDqA-pAk0cvsLOWQWaeMQVgvDPI
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
 .../bindings/regulator/maxim,max77826.yaml    |  4 +-
 .../bindings/regulator/maxim,max77838.yaml    |  4 +-
 .../bindings/regulator/mps,mp5416.yaml        | 38 +++++++--------
 .../bindings/regulator/mps,mp886x.yaml        | 14 +++---
 .../bindings/regulator/mps,mpq7920.yaml       | 46 +++++++++----------
 .../bindings/regulator/nxp,pf0900.yaml        |  2 +-
 .../bindings/regulator/onnn,fan53880.yaml     |  4 +-
 .../bindings/regulator/pwm-regulator.yaml     |  2 +-
 .../regulator/richtek,rtmv20-regulator.yaml   |  6 +--
 .../bindings/regulator/silergy,sy8824x.yaml   |  8 ++--
 .../bindings/regulator/silergy,sy8827n.yaml   |  4 +-
 11 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
index 6d6bbfbd26d4..3c02f98a38e9 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
@@ -62,6 +62,6 @@ examples:
                     regulator-max-microvolt = <3587500>;
                 };
             };
-       };
-     };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77838.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
index bed36af5493d..bbfc06fbf547 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
@@ -63,6 +63,6 @@ examples:
                     regulator-max-microvolt = <1800000>;
                 };
             };
-       };
-     };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml b/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml
index f825ee9efd81..4b05e07f5537 100644
--- a/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml
+++ b/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml
@@ -53,26 +53,26 @@ examples:
         #size-cells = <0>;
 
         pmic@69 {
-          compatible = "mps,mp5416";
-          reg = <0x69>;
+            compatible = "mps,mp5416";
+            reg = <0x69>;
 
-          regulators {
+            regulators {
 
-            buck1 {
-             regulator-name = "buck1";
-             regulator-min-microvolt = <600000>;
-             regulator-max-microvolt = <2187500>;
-             regulator-min-microamp = <3800000>;
-             regulator-max-microamp = <6800000>;
-             regulator-boot-on;
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <600000>;
+                    regulator-max-microvolt = <2187500>;
+                    regulator-min-microamp = <3800000>;
+                    regulator-max-microamp = <6800000>;
+                    regulator-boot-on;
+                };
+
+                ldo2 {
+                    regulator-name = "ldo2";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3975000>;
+                };
             };
-
-            ldo2 {
-             regulator-name = "ldo2";
-             regulator-min-microvolt = <800000>;
-             regulator-max-microvolt = <3975000>;
-            };
-         };
-       };
-     };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml b/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml
index 374a4f6b1e23..a7a26c4d75b4 100644
--- a/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml
+++ b/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml
@@ -50,13 +50,13 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         regulator@62 {
-          compatible = "mps,mp8869";
-          regulator-name = "vcpu";
-          regulator-min-microvolt = <800000>;
-          regulator-max-microvolt = <1150000>;
-          enable-gpios = <&porta 1 GPIO_ACTIVE_LOW>;
-          mps,fb-voltage-divider = <80 240>;
-          reg = <0x62>;
+            compatible = "mps,mp8869";
+            regulator-name = "vcpu";
+            regulator-min-microvolt = <800000>;
+            regulator-max-microvolt = <1150000>;
+            enable-gpios = <&porta 1 GPIO_ACTIVE_LOW>;
+            mps,fb-voltage-divider = <80 240>;
+            reg = <0x62>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
index 0d34af98403f..726aaeac054e 100644
--- a/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
+++ b/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
@@ -88,30 +88,30 @@ examples:
         #size-cells = <0>;
 
         pmic@69 {
-          compatible = "mps,mpq7920";
-          reg = <0x69>;
+            compatible = "mps,mpq7920";
+            reg = <0x69>;
 
-          regulators {
-            mps,switch-freq = /bits/ 8 <1>;
+            regulators {
+                mps,switch-freq = /bits/ 8 <1>;
 
-            buck1 {
-             regulator-name = "buck1";
-             regulator-min-microvolt = <400000>;
-             regulator-max-microvolt = <3587500>;
-             regulator-min-microamp = <460000>;
-             regulator-max-microamp = <7600000>;
-             regulator-boot-on;
-             mps,buck-ovp-disable;
-             mps,buck-phase-delay = /bits/ 8 <2>;
-             mps,buck-softstart = /bits/ 8 <1>;
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <400000>;
+                    regulator-max-microvolt = <3587500>;
+                    regulator-min-microamp = <460000>;
+                    regulator-max-microamp = <7600000>;
+                    regulator-boot-on;
+                    mps,buck-ovp-disable;
+                    mps,buck-phase-delay = /bits/ 8 <2>;
+                    mps,buck-softstart = /bits/ 8 <1>;
+                };
+
+                ldo2 {
+                    regulator-name = "ldo2";
+                    regulator-min-microvolt = <650000>;
+                    regulator-max-microvolt = <3587500>;
+                };
             };
-
-            ldo2 {
-             regulator-name = "ldo2";
-             regulator-min-microvolt = <650000>;
-             regulator-max-microvolt = <3587500>;
-            };
-         };
-       };
-     };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/regulator/nxp,pf0900.yaml b/Documentation/devicetree/bindings/regulator/nxp,pf0900.yaml
index 8c8fc2cd4ced..38fe80749c3c 100644
--- a/Documentation/devicetree/bindings/regulator/nxp,pf0900.yaml
+++ b/Documentation/devicetree/bindings/regulator/nxp,pf0900.yaml
@@ -160,4 +160,4 @@ examples:
                 };
             };
         };
-     };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/onnn,fan53880.yaml b/Documentation/devicetree/bindings/regulator/onnn,fan53880.yaml
index b5181719daa1..1618e8f1c4c4 100644
--- a/Documentation/devicetree/bindings/regulator/onnn,fan53880.yaml
+++ b/Documentation/devicetree/bindings/regulator/onnn,fan53880.yaml
@@ -82,6 +82,6 @@ examples:
                     regulator-max-microvolt = <1200000>;
                 };
             };
-       };
-     };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.yaml b/Documentation/devicetree/bindings/regulator/pwm-regulator.yaml
index 80ecf938b749..a7f48d33bad5 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.yaml
@@ -116,7 +116,7 @@ examples:
         regulator-max-microvolt = <1114000>;
         regulator-name = "vdd_logic";
 
-                /* Voltage Duty-Cycle */
+        /* Voltage Duty-Cycle */
         voltage-table = <1114000 0>,
             <1095000 10>,
             <1076000 20>,
diff --git a/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml b/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml
index fec3d396ca50..1526cd071b61 100644
--- a/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml
@@ -151,9 +151,9 @@ examples:
         richtek,vsync-polarity-high;
 
         lsw {
-                regulator-name = "rtmv20,lsw";
-                regulator-min-microamp = <0>;
-                regulator-max-microamp = <6000000>;
+          regulator-name = "rtmv20,lsw";
+          regulator-min-microamp = <0>;
+          regulator-max-microamp = <6000000>;
         };
       };
     };
diff --git a/Documentation/devicetree/bindings/regulator/silergy,sy8824x.yaml b/Documentation/devicetree/bindings/regulator/silergy,sy8824x.yaml
index 82af4d656177..0da920f84f89 100644
--- a/Documentation/devicetree/bindings/regulator/silergy,sy8824x.yaml
+++ b/Documentation/devicetree/bindings/regulator/silergy,sy8824x.yaml
@@ -35,10 +35,10 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         regulator@60 {
-          compatible = "silergy,sy8824c";
-          regulator-min-microvolt = <800000>;
-          regulator-max-microvolt = <1150000>;
-          reg = <0x60>;
+            compatible = "silergy,sy8824c";
+            regulator-min-microvolt = <800000>;
+            regulator-max-microvolt = <1150000>;
+            reg = <0x60>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml b/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
index b222adabc7b4..77da91c28c19 100644
--- a/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
+++ b/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
@@ -39,8 +39,8 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         regulator@60 {
-          compatible = "silergy,sy8827n";
-          reg = <0x60>;
+            compatible = "silergy,sy8827n";
+            reg = <0x60>;
         };
     };
 
-- 
2.53.0

