Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3B2472535;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394166; cv=none; b=jz+mNKMMUnxLCFF8vz+Kt4MZAhYaqGJppbOHXy1NMHIMkzkQrVEXsSMSzYNz6DOVZKWcxWJ4DzjIyoYoTvwJHo8kEXdpGY28BpfaHnK3Q8ZoDnWN4ivvZFG39M/2If2p+p2MhnQ5l7eXZCRuZQNLEt/OT6sRywF/AiEVy2tTOoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394166; c=relaxed/simple;
	bh=NG0zcPrpuUrHqJArNTKYUb+/7+gQImfZBXI+QFiTCFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZ7vkTCdNJprOth+S2paVYA+Hb11M2zYn9fMfQvMgw5ZGqoj+yXV0PNtvisz0RaZUx6Ko2+k5paDoc4GbcaG0NSu3RbRnyrw+GwUJpAdSy47eAtR/0EDP9jk0e0BpT76lXvGhx9+79krz1kJtqgUKgOrfE1tHYAVSQqxcnTzn9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSP8eS0c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSP8eS0c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80BBBC2BD01;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394166;
	bh=NG0zcPrpuUrHqJArNTKYUb+/7+gQImfZBXI+QFiTCFI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aSP8eS0cnkVnk02fHxWD0m6A4C0cYkf2cmZ7d+OWcIq7X8b/lZBrb/pLOihmPsd/T
	 YSEEAhV//pOiPp6dvHtzKmD6/H62Pr8rPopv+rbTD20ydbxlYYS3yYOjUQn1LHjl6F
	 RDacv2sij70ev26NnjFDP95AmMBivj2Py5xqkCRbKZpZLG0MFF93mufJJQf3KorXly
	 3gailyrxhypzQViLLiDpzecQa29NiX2IQpQLOQ0j/AbTOgVo7cdAzkUuH/I49K9ilf
	 bztWoDwsLE7bl9gbKUag+CT8O2X7nShntvBoSjx/mEliNp9OFDgSzgbJwwlxfHE5R7
	 dqphOwJWhdU6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65185C88E70;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:51 +0200
Subject: [PATCH 3/9] dt-bindings: riscv: Add MIPS Boston board compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-p8700-dts-v1-3-3267f14ebce1@htecgroup.com>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
In-Reply-To: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=1403;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=tHtPPite2sONqkkfk86N/TwZq1aosKXIXhSFvR7Duso=;
 b=4xcc9rb7EAWmZYMvfru0693dtlF9DrEifQUIycCT0YkGnWl3JuqAG1qMk2mmlbRPKtqQ+3mXv
 zQ0bHk6gJMSBgalImaA1FbxpVCwpTdzNifGoImPQB9jtec18F0X+aoY
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS Boston board compatible with a P8700 bitfile.

Co-developed-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/gf.yaml | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/gf.yaml b/Documentation/devicetree/bindings/riscv/gf.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..060910c9b04f482aee6f08f8f72232acbad118bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/gf.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/gf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GlobalFoundries MIPS SoC-based boards
+
+maintainers:
+  - Djordje Todorovic <djordje.todorovic@htecgroup.com>
+  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+
+description:
+  GlobalFoundries MIPS SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Boston FPGA development board with a MIPS P8700 bitfile
+        items:
+          - const: gf,mips-p8700-boston
+
+additionalProperties: true
+
+...

-- 
2.43.0


