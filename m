Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ED349429A;
	Mon, 19 Oct 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396531; cv=none; b=ZolroJol+2qTav4FkIkpwd67SXz+YUI8hdY27CLJCNcfkKHdEYb5tGVpV1nteET4fKcrl6ZoA5H+bchMfZ6Mb73CVITux+A+lnTgqhLkFShSRKeeTKy7kbFlHHw81QEqaPhqbsJ8Po3E9ZCDuDKcfA7odwuZ91L1ehThDMq9lNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396531; c=relaxed/simple;
	bh=jx8p4XoDCEmHkARz3LvR8mZjbN2RulpuK3cx8pTILlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiZ+x2nNlovbt/1DCHXezZ3YKc0Mm5aWDgx5hjvCHxJiK+J7E1uccM3HFZiK19glz7i19oe/EqYuKWK3pgC5FoJ1JqjB25wonnbMHpeCTY+i9fQ6912l68wlK+54QAiYHGMYcxskMOwk5ZhiSoP+QgFSQ7cZo32IbnwS3DazPCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1WOLRzD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1WOLRzD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8906C2BCFC;
	Mon, 19 Oct 2026 07:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792396531;
	bh=jx8p4XoDCEmHkARz3LvR8mZjbN2RulpuK3cx8pTILlM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N1WOLRzDPuwjLgYHP37CUyRxg2zFEmKqrou5OedQ5CnaQINfqKrB4nnpnWru4swl7
	 R/IXOtGmZmjoVOCDbxHxjdH52CERRQnJGxae/ven0oosZ12nwpQimtJcjc0z0Q/sPm
	 P69FvpYYghw/3B0/k3kV/6Yxp+pni6PS0MzD747DOGVRi11nnz8Qg8aICC6PdwMJbH
	 nt7UQS/OLvHFqhYbf98Y/1xpuvTEyDyk4o1vot+5pGDSbFzszsIYj8tR4ysUgXhuwk
	 fulOjXIsFJUXZRr/uUFthiyd/yJRNvSKERc4MpNap3vGHV8ZHWmaQnOeg+H7IyKkDp
	 ARQT60kheyT5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5379CCF2D6;
	Mon, 19 Oct 2026 07:55:30 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Mon, 19 Oct 2026 15:55:25 +0800
Subject: [PATCH v4 1/7] dt-bindings: vendor-prefixes: Add shenrongda
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-ultrarisc-dts-v4-1-3979747cda2e@ultrarisc.com>
References: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
In-Reply-To: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792396528; l=887;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=e/Kow+cCHmWBpSOP+t1oxwgy4BH4snNIyYRmuufij+E=;
 b=mWItLRvWnTdrjKctqS+FRwCSkSzFCFcfo5wF+2SMPmExQaQbSFwdy7BFD9RIRoJv2/QGQhCEr
 NN2ywMmfyk9Dw+M0KZyMiqJrRPjRBo2FMnfg//C0qOwBMwcAQ+t9em0
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Add Shenzhen Rongda Computer Co., Ltd. to the vendor prefixes.

Link: http://www.shenrongda.com/
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..e100f3993e57 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1507,6 +1507,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shenrongda,.*":
+    description: Shenzhen Rongda Computer Co., Ltd.
   "^shift,.*":
     description: SHIFT GmbH
   "^shimafuji,.*":

-- 
2.34.1


