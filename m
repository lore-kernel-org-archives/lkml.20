Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B28373BE7;
	Mon,  7 Sep 2026 18:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804307; cv=none; b=L/w9Z8wXqcng3zqfaCIKfpr3MEXMphvdDI2Ss8i5l6dlX++L6PL2nUHv/u7xazVRgF7g8j15eOlQHzbG0EmcPnGYoRpLXpDojHIvwjTR/Qljjy+5nH/ykWr445OUUfzNnhjnPakLtAbRGHWxEVAjyL1Y22xNekadUyVRaJIrsfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804307; c=relaxed/simple;
	bh=HRKfDnU7fpe4hKYsO1qj++xJuTiGlwZYM7a7gsCq21Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxjXn5geSzneLNuYfznCQwM1krzpQmXad5Jikj21cyxDI/0Mz+qsNw6H2xi+POHrlII/rMflA9vZMTpulpmIH9Wqjnpiva1rKiE1XmeYnMs9FUe7Hr/lFRK7MDcIyuoqTXAKFaghmxhe4RLdQyxbgZ/otyhgJ9BPkz+t2/swT1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6w8fsQR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6w8fsQR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 544F8C2BCFC;
	Mon,  7 Sep 2026 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788804307;
	bh=HRKfDnU7fpe4hKYsO1qj++xJuTiGlwZYM7a7gsCq21Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q6w8fsQREm1eCpIPHDmn+hdFxAHEh88vOFEOJaFm5Niv3iB+YTyiPwVIwkHFlZU7z
	 nKvaNlzGixY7NJOQuOHDzu0YraARtU5Q1JK//7vG+77TqN7qIBYGNxpkJogsDySee8
	 irL8lp/MIaDXeQ8Un8Ei98cm6Gggb6173PJajhIWe7nnpbNL/IR4hdWivHQBEupdih
	 8Q/zB3lnp1wl+UARMyr5lNhi5nPS+DrsBUEdPG3Bx18tjsuiqtl+SAnD+XyWCEQOa2
	 DM4Kx4fna2SvaS11aLvQxg4ynQRrSvgaN9jWdnGqdu3dg37LOKQ9QcC3hju3ZVC8Ny
	 p9Um2+3NKsL0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3052BC79F99;
	Mon,  7 Sep 2026 18:05:07 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 07 Sep 2026 21:03:05 +0300
Subject: [PATCH v2 1/3] dt-bindings: mailbox: mediatek,gce-mailbox: add
 mt6572
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-6572-gce-v2-1-412a5b037290@protonmail.com>
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
In-Reply-To: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804305; l=2822;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=/tLOb7ev/WM/LwpIpJ2zPo9FlE7c2orfGWi2CVoRzjw=;
 b=3Oxrmkyz4/yIStLEu203OBakaNbk1L4OkD0Yt892uXJuGpzqi8MbwMB6NCflV2Xjl3WBtwYlF
 N27vLwsUqavD26aiumMKqa2lhGVhXtZSqXSAgMboSAIksIKr1WuTUG6
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string and a header for the GCE constants.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
There's also 'other' subsystem which covers 0x16XXXXXX range, however
mt6572 doesn't seem to have any MMIO there. It's not included in this
patch.
---
 .../bindings/mailbox/mediatek,gce-mailbox.yaml     |  1 +
 include/dt-bindings/mailbox/mediatek,mt6572-gce.h  | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index 587126d03fc6..d6e93010bb94 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6572-gce
           - mediatek,mt6779-gce
           - mediatek,mt8173-gce
           - mediatek,mt8183-gce
diff --git a/include/dt-bindings/mailbox/mediatek,mt6572-gce.h b/include/dt-bindings/mailbox/mediatek,mt6572-gce.h
new file mode 100644
index 000000000000..94eb6ea97542
--- /dev/null
+++ b/include/dt-bindings/mailbox/mediatek,mt6572-gce.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Roman Vivchar
+ */
+
+#ifndef _DT_BINDINGS_GCE_MT6572_H
+#define _DT_BINDINGS_GCE_MT6572_H
+
+/* GCE HW thread priority */
+#define CMDQ_THR_PRIO_NORMAL		0
+#define CMDQ_THR_PRIO_HIGHEST		1
+
+/* GCE SUBSYS */
+#define SUBSYS_14XXXXXX			0
+#define SUBSYS_15XXXXXX			1
+
+/* GCE HW EVENT */
+#define CMDQ_EVENT_MUTEX0		0
+#define CMDQ_EVENT_MUTEX1		1
+#define CMDQ_EVENT_MUTEX2		2
+#define CMDQ_EVENT_MUTEX3		3
+#define CMDQ_EVENT_MUTEX4		4
+#define CMDQ_EVENT_MUTEX5		5
+#define CMDQ_EVENT_MUTEX6		6
+#define CMDQ_EVENT_MUTEX7		7
+
+#define CMDQ_EVENT_DISP_WDMA_EOF	12
+#define CMDQ_EVENT_DISP_RDMA_EOF	13
+#define CMDQ_EVENT_DISP_BLS_EOF		14
+#define CMDQ_EVENT_DISP_COLOR_EOF	15
+#define CMDQ_EVENT_DISP_OVL_EOF		16
+#define CMDQ_EVENT_MDP_TDSHP_EOF	17
+#define CMDQ_EVENT_MDP_RSZ1_EOF		18
+#define CMDQ_EVENT_MDP_RSZ0_EOF		19
+#define CMDQ_EVENT_MDP_RDMA_EOF		20
+#define CMDQ_EVENT_MDP_WDMA_EOF		21
+#define CMDQ_EVENT_MDP_WROT_EOF		22
+
+#define CMDQ_EVENT_MDP_WROT_SOF		24
+#define CMDQ_EVENT_MDP_RSZ0_SOF		25
+#define CMDQ_EVENT_MDP_RSZ1_SOF		26
+#define CMDQ_EVENT_DISP_OVL_SOF		27
+#define CMDQ_EVENT_MDP_WDMA_SOF		28
+#define CMDQ_EVENT_MDP_RDMA_SOF		29
+#define CMDQ_EVENT_DISP_WDMA_SOF	30
+#define CMDQ_EVENT_DISP_COLOR_SOF	31
+#define CMDQ_EVENT_MDP_TDSHP_SOF	32
+#define CMDQ_EVENT_DISP_BLS_SOF		33
+#define CMDQ_EVENT_DISP_RDMA_SOF	34
+#define CMDQ_EVENT_CAM_MDP		35
+
+#endif

-- 
2.55.0


