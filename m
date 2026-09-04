Received: from mail-m1973198.qiye.163.com (mail-m1973198.qiye.163.com [220.197.31.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021B46C4CD;
	Fri,  4 Sep 2026 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518320; cv=none; b=oD6Fq25CmRNkN3/SiJxTD5R9P1PHT563MMPQ3qfN4vxYEmyY279EqtIK+W9UKk7cjXTZDobEFmAeJYZt+6X6h0xs/eeCnkalIqIkkNlfw8xeOpUolKjEjdZ4OMsdNrzhBBa3Z8HAa7AhxcrfOXVeciBdZ1prsoJAEL2Q+Y0NQgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518320; c=relaxed/simple;
	bh=CVUn4oR5TBb1cbVUGQ67fEH7gdrl9s3ZKb0KDuGoxrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChCc5n0rbzJzsPsjEnH5x0UH+vb+zvbF74bibEvQyjPoEiidPad4fh6SkA2ecytyJ14g0XNHhstRTVyMDSljHxl0MFV1MqUfhoYpwkTmnukGX3S+tx8P1DMelazxnVo0sEGKjPFrw1RlPPCsvuHlhpunGx9l7aLeZqrPCOWOUlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=ijMHZwCe; arc=none smtp.client-ip=220.197.31.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="ijMHZwCe"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c8f646c2;
	Fri, 4 Sep 2026 18:02:52 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Fri, 04 Sep 2026 18:02:25 +0800
Subject: [PATCH v3 1/6] ASoC: dt-bindings: es8316: Document jack detect
 inversion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rubikpi-next-20260605-v3-1-f49146d85af3@thundersoft.com>
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
In-Reply-To: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788516170; l=1226;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=CVUn4oR5TBb1cbVUGQ67fEH7gdrl9s3ZKb0KDuGoxrM=;
 b=mPWmOcmCD4WN4BrNZyhxRj2od3i2SInbiR169g+czYl7fakkXvq86Zf8wf3xDqeDMpkolmnbY
 8gjOv/KdvEiBttgFa5RAcMwECh0C3/xZHB8JfshfHuOgfjZlXTYu+wn
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0aa06bdf048509d5kunm6f63729aafb4c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCShhLVh0eSx9IGExNHhgeSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ijMHZwCe9FOsfo++VSZn3ZRjgCFlgN+/c88OE8X8M7xzJn6RWk4cyBPlnDYDS5Mq34+FzE7zNe+Ha91Pv8Sp2xohkuJuKQDScyHVBKGTO0dSP7TBbEU5O5snq6vqQjA+ThsLrcyU80x7pqEPiZiCB1+MtP1IvVQjO+mdW23dxWs=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=597yvAmbtpxqKhHT8WHhejI5xPg6hWppCyeJ96YlFRE=;
	h=date:mime-version:subject:message-id:from;

The ES8316 driver supports the everest,jack-detect-inverted property to
account for boards which invert the codec jack-detect signal. However,
the property is not described by the binding, so a valid user of the
driver fails schema validation because the binding rejects unknown
properties.

Document the flag so boards can describe the jack-detect polarity used
by their wiring.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 Documentation/devicetree/bindings/sound/everest,es8316.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index f4ff23120c5b..9060358a9080 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -84,6 +84,11 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  everest,jack-detect-inverted:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Defined to invert the jack detection.
+
 required:
   - compatible
   - reg

-- 
2.43.0

