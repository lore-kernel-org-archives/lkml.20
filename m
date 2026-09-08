Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0FC51E447
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858303; cv=none; b=CA4idS6UGBLeyNWAFNZ6mbhPHrtU8eutm1PCifCe413An8Zexw22WTk6+uhHdt0lbmNAY1xAcLXoz1JsmUI32NMtuJhHgkj2Hnk62GlT8PgT1rmvQ2ZNH9Ob2Y3nw4A6J9rEr7XR6RfC/35Mbq04X3UI89xoQqDRf9Dpn5tqq5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858303; c=relaxed/simple;
	bh=cOTndiYvXLFAAAM2y9Xe4uyBomgWf+BKu0APrUCfPAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i45XIRMxRFJp9r6nCMga4NROppTG++Y81vj7AedCrsI0E6krVv6ZevtQySo68jWvenO1yGnAcNzKnDgiWPZ7Y1qFsMcSSybVuVYPnjp/pXvQT8pR0gFJYhWMXsG1SMGImJiuGmkbxSp9RHep3yLt5zATm94QLQS0STr88++KvH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmeO8JYt; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmeO8JYt"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a682579c72so5550824a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858300; x=1789463100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=gmeO8JYtiOFIvUQvVhLHW5TNfGLV7PEyoufi7jtp1HSOyPoiHYMsEiwvVdjfqzrisk
         KcEtGO/mtcpZpVFLIm+4gLOWkWFN+eCDnMI8eM3nfw7vYfwE35ktMQiYmM2wzcbbKPVs
         IRdQeLuwUinia3l/8m1V8f8imtvp4/FvBsi2idDXVkczA/xn6bMynj41tj1s17LELv6/
         yUVVnFUvT1jWwb/LNNiZoNHnFlhXMWQ9+ZgzUn+fABMhKcVbjFPPB91rmawSaK5CdEVd
         MUfl6RaOB4+6q5KKR3HLRmT+qKUj/T6PaMi82ELZix5VqcAO8PJeDHI18uFEg3/GM9kk
         GLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858300; x=1789463100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=KFDdI9bMdei2mHkXJp/HzBI6z0EkylD8BUPgh0Mp6fR0NpH0y8JlTn+e/usi3zsklD
         skHTiFmNnBXd+V1rQsyIa0uwM7EVH0eXSWQYTQZ/f+mv3t7ftfxflcoSar8Q8tjBQiHV
         IuwT3I/YqgiHAdBxIGvMahgnRM1gbHBxt4xWdXeea0ic5dI2dK7/7yPZIiJjASrysMsJ
         Px1zimRQsG7IlSXRVwBiLokp1OWXIb4umFzMrwtMGKMMpKrKM99WlmOmWP5MWzKIS0/4
         RvKfwECUMgBLfBjvZkgKzyugKe2BPlqYJYBCSfu5cyRkn7AYVO2EFuKdqPcjeAQmQcte
         PU7g==
X-Forwarded-Encrypted: i=1; AKwUvBzEx0bJA5urCQaiF7AIw59F7t9XujJnrLmw0BZ/pmrck6YJy+JCmxxXJnkO09akQqI+wZT41IpdoacY7mM=@vger.kernel.org
X-Gm-Message-State: AFuF++lxvo7zbIdVcG3U1x2735QDCgtEzIRalxDunF0M0By3jc1EFDTM
	KTZj3Snztyzuvyzm+euwODcszNz94NLw5LVQ3BRsIxcoynv7ErgJDpw5
X-Gm-Gg: AYBFou2pZ65JYcLl5EM/TJ+yBujF7cPO/rn8+1cSvMHzL3QIoSwzvZhA7l+8Yi71Sam
	lfJ5eE/VdnjNVOXQ58vp0I7aMjGnX3a0jIfo491+ZAXbLe+p4veppjthiPko+Ye+XRUrxHpMFKF
	69N5rQ0HHtxlYhTP9Q9mGuJ1gOlbOQAvmAThGDF5+VfTawz4loHiTU+4SN3AGIjre1jApsq7Zmq
	mn2EJu1613orWgoaBkvteIeuKQCJdqGq/QL0/nebPgMpvJznvlW7F7M1eGmV5J01tLbiK6898iH
	M8UR/vP4XingvPrilvndulnVrRRGhxaEumEKMAx7L56nyq5t+CG7dApqBYzwHLKvugHgFrMPp5X
	fBZSpFxr6iWZdiz67+lHwJpsrpYGHnvCSly2avthE9wD2VECFWad2fNv09JYWyDz0peF6FWLTpF
	z1gSVOyRoGESRNJrvCqERdpSU2nT5a0KN7R1t5F5ONYQ6pXuvwoMXTjV/sjBmW+AllljI70iqX3
	yYM3BVKYmofwh22faxhjnO0ViY0RbUEViCpqrlUo1fc6qoKiURU
X-Received: by 2002:a05:6402:3554:b0:6a6:21d9:541f with SMTP id 4fb4d7f45d1cf-6a7e8d4d131mr18523650a12.6.1788858299489;
        Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 2/5] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Tue,  8 Sep 2026 11:04:44 +0200
Message-ID: <20260908090448.3332-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT schema for Airoha AN7581 Sound Card with the specific WM8960
i2c Codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..8886fbb6b43c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 sound card with WM8960 codec
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: airoha,an7581-wm8960-sound
+
+  platform:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "airoha,an7581-wm8960-sound";
+        model = "an7581-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
-- 
2.53.0

