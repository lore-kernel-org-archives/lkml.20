Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4FC5221DA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755933; cv=none; b=h2Eu67dgj/gOWH9VturrE0P5dbCz17/ZSjjvV8bg1rwQVM6WIE+sj+YPz+WMhIF3rtXN9kUWEsyLWPwGxcJh06XPhUak8XcBabFRkbnGjmpwwI36A+1nDvMErWDum3S0y1Doy7Zv582bMirOJh+SxWtZ33SyCbJ7Z7q8HhRQJd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755933; c=relaxed/simple;
	bh=FwBxD9C+mtpAY3FvuFjka8wR/91ggAo5qXxEvQFo4r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMARmaRXMrrE2Rd+5d1oLYvnK5xj+8P6mlO1ygQEuDHmLCopbd4DjAYIIM5FVgO7l5N6ltyFfD1XiPrDAQriNLP72pM7VeanXttu5DZ3aovS4ovspVqwHfAsNsoqfkaBirgoRKf+CfoaC9EmjlKn9z6pXk2DdkrwiXEAiG9BpyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyCT3uuL; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyCT3uuL"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddb44ad1c1so11305955ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789755930; x=1790360730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoyOc8CCoSjGkrWB9rL6T/fUpbguLCUgVumFgPvb6SI=;
        b=iyCT3uuLPseT5dBjBbZdM+cfyLZnZQ0dLpT7vuP0AMM+DEWtKF8jcCvhynuxtAIfs3
         RSmZ7PbmQyzvBr15YeWLtFlObWV0wqBacjuTR9qNtd2cXJEOvm+5uOOALoQP9at7gq3N
         p03t4BKl1qqcxPWUrneO0y60ub5fhcItYk4HulNctIodwimT1JXFd0SHyOGp3xDGxmGm
         cu/HT4xaecAYK+pYmibj3vMGD+rozvgzkVbsbtycH4pZWLTk4tZ/owB5bqTcjw8H56oa
         /wrrKJu6F7D2imhV0/+MY8Y/a/Noajd0pK5+6iakfP5ug8JSuXPL9FmcuntI2S72+6ak
         H1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755930; x=1790360730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JoyOc8CCoSjGkrWB9rL6T/fUpbguLCUgVumFgPvb6SI=;
        b=aukLbYbosJItYbfu9sdP0rjeH0SXU8c6VH20IizwmC+gNoA3+urXSZioR4gCog3tI3
         hL72xrW7cEenlFBX9YQ8v435NljeeQB2cPRVQDkmxYmFCl0atilZq+7kjWANJAZmuTFs
         IPl6cxR4PNChTSFkmHZltm+wOvxlcq37s5mopSlyQRtxHHc4YNnBoOMDO5+egDikp3Rr
         Yj4fyzLuf9g2tzDRO8JTe8PR6MRvr3Mxj9O03n15gotB+nqFbTAA4ctg8vdqWt0g8mpn
         PlZlbsQhwvZ7hRcE/CkZizgmk0U1EnJvZrmqUEXBddJOwYgSz6u6P+v9gXCsc190ACWf
         55Eg==
X-Forwarded-Encrypted: i=1; AKwUvBwSnRxOODjBAPuabeFDm6vjilv5NiqHQHpRRrYSjZaFo2OHI1o8FpXUnBnEdPFbGzaFc1VN3eAopmkECiE=@vger.kernel.org
X-Gm-Message-State: AFuF++la9iHMG/+31xNIunzXQcjX+9V0rY0CgEyRRDPwmRaVdWFj4LaU
	usCdcO2wbuuZ0fhPMv+z0pKlaiHBRu4ZFmuAR49a+BNYuRIobMUFIprF
X-Gm-Gg: AYBFou062cftmM6XtHlKSL8cihVr+qvkjS2BvVxKjdEVkigrOmoc8xgiAlIrYwQVByZ
	tbP6DBDCD0fbGnY4sPWYoTsOdUYGagYPnevHSDEEtMCpfNB5mb4OyuFe79EW9UMM9l3BTYbb8M0
	IruMj+BfgK0qEPIk8olpr9jxQL84UCGddjwM64k7/yi0TtHYzaipexxIgQVH1+CAoNxPc46V/uF
	nVsAQtwoj0ldPgI8159waaWHlqVSCps/FYuXPuEK+p+37uDJjprhIjRXP47djnvINqEQUvFuZOw
	evbqXKraXfQkDDkmRtkrXnO/sYeIDglVcj9WbX7WcbGdVxYnmZ/Bhm+LrTXj7YWgdO4OBXSMHCJ
	onOT2XLjRapE7SIlcmtJMXpolDcNk2H4+80JpW5jM0lMu0mvSsO4N5Y2ByyqQz1rxsDz6afCskk
	ZhN44/oLbtbNUIUdypDopl4a98Bk11k5YvvH+2yy1EQDE4GHcAmkPVQCRJEql6aW/dMbXCq+ZXJ
	Os8EKhGvkHVA8tH3oB6i23KXmj2iszfbxn6Sk3Bh9g5kCL0KhVu0n4lqaB1u4kFgtjt/6jFSjcW
	uH/dmNv3
X-Received: by 2002:a17:903:1a0b:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2ddb1b86d77mr59804075ad.18.1789755929744;
        Fri, 18 Sep 2026 11:25:29 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b49casm871895ad.7.2026.09.18.11.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:25:28 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andriy.shevchenko@intel.com,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	joshua.crofts1@gmail.com,
	u.kleine-koenig@baylibre.com,
	julianbraha@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v10 1/8] dt-bindings: iio: add Open Sensor Fusion device
Date: Sat, 19 Sep 2026 03:24:39 +0900
Message-ID: <499ecb38dc0b58b979ca1f38d2d30b4ef56cf825.1789753020.git.kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789753020.git.kimjinseob88@gmail.com>
References: <cover.1789753020.git.kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the generic Open Sensor Fusion host interface.

Open Sensor Fusion devices report capabilities and samples over an OSF
protocol stream. Sensor channels are discovered at runtime from
capability reports instead of being described individually in Device
Tree.

The protocol version is discovered at runtime from the OSF frame header.
OSF GREEN is a product identity, and OSF0 is a wire-format magic value,
so neither is used as the Linux compatible string.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 .../bindings/iio/opensensorfusion,osf.yaml    | 52 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 +++
 3 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml

diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
new file mode 100644
index 000000000000..3998390828cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/opensensorfusion,osf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Open Sensor Fusion Sensor Aggregation Hub
+
+maintainers:
+  - Jinseob Kim <kimjinseob88@gmail.com>
+
+description: |
+  This binding documents the generic Open Sensor Fusion host interface. Open
+  Sensor Fusion is a sensor aggregation hub. The hub exposes an OSF protocol
+  data stream over its host interface and reports capabilities and samples for
+  multiple sensor classes. The actual sensor channels are discovered at runtime
+  from OSF capability reports instead of describing them in Device Tree. The
+  protocol version is discovered at runtime.
+
+  Public project documentation is available at:
+
+    https://github.com/opensensorfusion
+
+  OSF0, protocol_major, and protocol_minor are wire-protocol details
+  exchanged in OSF frames.
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: opensensorfusion,osf
+
+  vcc-supply:
+    description:
+      Regulator supplying power to the Open Sensor Fusion device.
+
+required:
+  - compatible
+  - vcc-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        sensor {
+            compatible = "opensensorfusion,osf";
+            vcc-supply = <&vcc_sensor>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..0ec4e481c64b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1267,6 +1267,8 @@ patternProperties:
     description: OpenPandora GmbH
   "^openrisc,.*":
     description: OpenRISC.io
+  "^opensensorfusion,.*":
+    description: Open Sensor Fusion
   "^openwrt,.*":
     description: OpenWrt
   "^option,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index 214aeee7642e..9463b8111d52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20511,6 +20511,12 @@ F:	Documentation/process/maintainer-devicetree.rst
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
 
+OPEN SENSOR FUSION
+M:	Jinseob Kim <kimjinseob88@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
+K:	opensensorfusion
+
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
 L:	netdev@vger.kernel.org
-- 
2.43.0

