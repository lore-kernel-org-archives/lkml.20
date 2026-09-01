Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4894749D1;
	Tue,  1 Sep 2026 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254449; cv=none; b=serQnw3WUN9d/jLikEk1In9KSt4qwecQfSttpNqVFoF9xSl6PU65zltM642flfmDhX0la4Ef4lpuYG+miI/mkqVZHTA5zUTmdAGFIZiT6YTtI29icRtuH4yBmRvMbt9TcaFSfPI7RbCMApc9agwPmH/aMAJH6xtQ0II46WuDJiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254449; c=relaxed/simple;
	bh=ERI43HuiL6QTfhZ7M0Jf5DJh/DNFPQT5VndJPqtsttw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LmhMGbFMlnPN54Gdp5jKcs7GumFgokBit6iTQGt6ZR7U32zqfebVboA47aaIg4riUSHQEMoJ0DUrzJF4FjHtGi7j+FrptPPjav2nCKwNx7sNomR+VAK8UVhk4Nk3ish9BXCFAwRR5XP2Wv1NwkknzfbOEOvYDy0IzPQlQgWIL3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 6819Jbg5047671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 17:19:37 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Sep 2026
 17:19:36 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Tue, 1 Sep 2026 17:19:29 +0800
Subject: [PATCH v2 2/6] dt-bindings: arm: add Axera AX650 SoC and AX650
 Demo board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-ax650-v1-v2-2-993bea305476@axera-tech.com>
References: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
In-Reply-To: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shi Zhicheng
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        Leng Honglin
	<lenghonglin@axera-tech.com>, <hlleng233@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254374; l=1063;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=ERI43HuiL6QTfhZ7M0Jf5DJh/DNFPQT5VndJPqtsttw=;
 b=W1RQzi21UuVxmWW3bPYMMVjiymvAeGH/Ui98pv9e0T+aasdxCusiaIu4/jDEpRv9TqSXC5F/e
 4oLoPLbpGvGA/jLSQjnRBFLqKBHBtaIvkzsJEGnVTiHhNO80Wvsf4Rx
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.axera-tech.com 6819Jbg5047671

Add devicetree bindings for the Axera AX650 SoC and AX650 Demo board.

Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 Documentation/devicetree/bindings/arm/axera.yaml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axera.yaml b/Documentation/devicetree/bindings/arm/axera.yaml
new file mode 100644
index 000000000000..28bf0ce9fd27
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axera.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axera.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axera platforms
+
+maintainers:
+  - Shi Zhicheng <shizhicheng@axera-tech.com>
+  - Leng Honglin <lenghonglin@axera-tech.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - const: axera,ax650-demo
+          - const: axera,ax650
+
+additionalProperties: true
+
+...

-- 
2.34.1

