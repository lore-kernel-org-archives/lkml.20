Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7F1529401;
	Tue, 22 Sep 2026 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068171; cv=none; b=NV+artdPY19Rq5Mms5gLH5noYAStx6uiuXMEGc15+J8AXfe4ZaiwmaTxCUterfJY/vXfnGdbioC6Fw9xx745IjBmPrid4RaImWSHAqqX/DjyCntTdgSQt1EpMTvZmS0asGyanw+UE4VDPz6dT08Hdg3XBdQrpSuPbWQpvP4Zc1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068171; c=relaxed/simple;
	bh=YfRXSPro+uDj/F6BEZLZNNd63lMTt5yxDoob4IlU44Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQRat/Cw0DJtppEgoKjpCcR5lIFl+IY0bNWLoQGNlvDDuLWpeFtkib6iZhGJNlNl9EZPu4Lp6wGDFJWWCGt8JhZ6KJCDLOf8TJtuRgfRSS0ul9fPUORA9nxBKCDqFAxCCmu19d4l3IyCvgqORIcVz3zpzUItZwasuinfbo/dGug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RVzYoTFp; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RVzYoTFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ro
	iZPSCU88QygX7bo5nR/bW1y+/DZdenzXqm3MmxBs8=; b=RVzYoTFp9Jwt8W98S3
	VbTPYnrCOsuIm1F1xc2YJjKHR0WTtJgjafSdF3WVVFBA2d00O4P03ZOjArMxNVr7
	lwIz0ZNW1+8nYD3JiCSfeQbpTwA9Y6YRKqNhIeL0f/RgmX161AVlDD+PlNf0syiU
	u1bBdclULseELVwINzcYM6R10=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3X8edRbJqCNNdAA--.41173S2;
	Tue, 22 Sep 2026 17:08:47 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: [PATCH v2] dt-bindings: arm: vexpress: drop the obsolete hwmon and regulator text files
Date: Tue, 22 Sep 2026 17:08:36 +0800
Message-ID: <20260922090836.111516-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X8edRbJqCNNdAA--.41173S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jw45Ww47CFW8Cw4kXF1kKrg_yoW7Wr43pF
	43Zrn7CF48JFyxJw45t3WIkw45Xr1UC3s7Cr1kZrW8X3Z8AasxJrnakr1rAFy8JrWkGayU
	trWUur1rJF17Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piAwIDUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-x+-NWqyRZ8D8AAA3b

Documentation/devicetree/bindings/hwmon/vexpress.txt describes the
arm,vexpress-volt, -amp, -temp, -power and -energy sensors, and
Documentation/devicetree/bindings/regulator/vexpress.txt describes the
arm,vexpress-volt regulator.

Both restate what arm/vexpress-config.yaml already documents: the same
compatibles, the arm,vexpress-sysreg,func property and the label property.
The regulator node refers to regulator.yaml for the generic regulator
properties.

The regulator file also lists two of them as required, regulator-name and
regulator-always-on. regulator.yaml defines both but requires neither, so
removing the file without doing anything else would quietly drop that
constraint. Add them to the regulator node's required list; all 13 in-tree
arm,vexpress-volt nodes set both.

One sentence in the regulator file is not a restatement: it says that a
supply without regulator-min-microvolt and regulator-max-microvolt is
treated as fixed. vexpress_regulator_probe() implements that by selecting
vexpress_regulator_ops_ro when the two properties do not both define a
range. Move the note into the regulator node description in the schema,
so that removing the file does not lose it.

Nothing else refers to the two files. Remove them.

Assisted-by: LLM
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---

Changes in v2:
- Add regulator-name and regulator-always-on to the required list of the
  regulator node. The deleted text file listed both as required while
  regulator.yaml requires neither, so the constraint would have been lost
  silently. Reported by sashiko.
 .../bindings/arm/vexpress-config.yaml         |  6 ++++
 .../devicetree/bindings/hwmon/vexpress.txt    | 23 -------------
 .../bindings/regulator/vexpress.txt           | 32 -------------------
 3 files changed, 6 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/vexpress.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/vexpress.txt

diff --git a/Documentation/devicetree/bindings/arm/vexpress-config.yaml b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
index 41c53e3acc12..8fe24a997cfd 100644
--- a/Documentation/devicetree/bindings/arm/vexpress-config.yaml
+++ b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
@@ -139,6 +139,10 @@ patternProperties:
 
   "^regulator-.+$":
     $ref: /schemas/regulator/regulator.yaml#
+    description:
+      If regulator-min-microvolt and regulator-max-microvolt do not both
+      define a range, the supply is treated as fixed and only its voltage
+      can be read.
     properties:
       compatible:
         const: arm,vexpress-volt
@@ -157,6 +161,8 @@ patternProperties:
     required:
       - compatible
       - arm,vexpress-sysreg,func
+      - regulator-name
+      - regulator-always-on
 
   "^amp-.+$":
     type: object
diff --git a/Documentation/devicetree/bindings/hwmon/vexpress.txt b/Documentation/devicetree/bindings/hwmon/vexpress.txt
deleted file mode 100644
index 4a4df4ffc460..000000000000
--- a/Documentation/devicetree/bindings/hwmon/vexpress.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Versatile Express hwmon sensors
--------------------------------
-
-Requires node properties:
-- "compatible" value : one of
-	"arm,vexpress-volt"
-	"arm,vexpress-amp"
-	"arm,vexpress-temp"
-	"arm,vexpress-power"
-	"arm,vexpress-energy"
-- "arm,vexpress-sysreg,func" when controlled via vexpress-sysreg
-  (see Documentation/devicetree/bindings/arm/vexpress-config.yaml
-  for more details)
-
-Optional node properties:
-- label : string describing the monitored value
-
-Example:
-	energy@0 {
-		compatible = "arm,vexpress-energy";
-		arm,vexpress-sysreg,func = <13 0>;
-		label = "A15 Jcore";
-	};
diff --git a/Documentation/devicetree/bindings/regulator/vexpress.txt b/Documentation/devicetree/bindings/regulator/vexpress.txt
deleted file mode 100644
index 1c2e92c7831e..000000000000
--- a/Documentation/devicetree/bindings/regulator/vexpress.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Versatile Express voltage regulators
-------------------------------------
-
-Requires node properties:
-- "compatible" value: "arm,vexpress-volt"
-- "arm,vexpress-sysreg,func" when controlled via vexpress-sysreg
-  (see Documentation/devicetree/bindings/arm/vexpress-config.yaml
-  for more details)
-
-Required regulator properties:
-- "regulator-name"
-- "regulator-always-on"
-
-Optional regulator properties:
-- "regulator-min-microvolt"
-- "regulator-max-microvolt"
-
-See Documentation/devicetree/bindings/regulator/regulator.txt
-for more details about the regulator properties.
-
-When no "regulator-[min|max]-microvolt" properties are defined,
-the device is treated as fixed (or rather "read-only") regulator.
-
-Example:
-	volt@0 {
-		compatible = "arm,vexpress-volt";
-		arm,vexpress-sysreg,func = <2 0>;
-		regulator-name = "Cores";
-		regulator-min-microvolt = <800000>;
-		regulator-max-microvolt = <1050000>;
-		regulator-always-on;
-	};
-- 
2.43.0

