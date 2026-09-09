Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3BB53A8A5;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950983; cv=none; b=gx7+CU7T8wloJ3DvXKE0S2QaigJW4zyv5TcxHPKf4y06UTNzhJko3nfju84YO079Ex01D8nA8zCtBINYMcUrYAsSsrlpL9JVRI0pnmq6Bbr71Wax1wHxsKCo2/v/t35eVOWPs+guDCEy7IqBULmUJrQUK8Sytqyifiyob6xfS90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950983; c=relaxed/simple;
	bh=sSaHce3/qZzCbrOudBOCyhDSZYi1NxJWO36thRGVzKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NBkoY8g0OW7Z3t3Eorl98NwXeDWsJR2SmMY4rGXykUaQg/pJLOj8qXuGC2Fm0rPV8+4cwsYR2cjG1YEO+MofQqx2ANA/um4WdRbY9F3RheDHXEq3XzyBW1uOHzxpR/5F+iwR2Q+765eomuO9UEGJC6JoDrGQlEB4GGSjO1hAmaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3x18ENG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3x18ENG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23454C2BCFB;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788950983;
	bh=sSaHce3/qZzCbrOudBOCyhDSZYi1NxJWO36thRGVzKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T3x18ENGagWDsM6r/NMWuGwlT0S4XHvcH+KbNnuvFycRk6F+qWpRmI62cy0KP9fBa
	 W8XD6AP8isiSG3wSw4fx4Uo7eiNQWknlxT8sUQqZEAz8gtlvsH8wKnMU55hDewKMPq
	 3WnWcJMGjTxBO7gZiDGPuuzCKN54Xnjw99KFs27u3NNh6EziOSubeKfsxUDWEglt31
	 Rq1uotdc6FkiVzvSHMcLSkirsPbTKo+m3vihfZdKNVpN742ZTeE0oii+tDkv5gODej
	 Z2iYHQlNglqqC0+AAcEp5xUG8qHE2viSwP007CwWL+ibOUfdOpbj+182R1wZuH0S0c
	 kuYF5lN7J7W9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027EAC79FAD;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 09 Sep 2026 13:48:51 +0300
Subject: [PATCH v3 2/3] nvmem: mtk-efuse: add support for 32-bit aligned
 reads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-6572-nvmem-v3-2-c0c441656431@protonmail.com>
References: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
In-Reply-To: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788950981; l=2506;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=XhoHgsfcc5OEe7HZ0qvJcNLLqZAnK9nL4IMC1zVANXE=;
 b=KyhS1lFLzJ4JQxSLs/7UgLqXwsNsVrgbAoyJT4edsudSB2Wkf0BJRXPzJMnQEZjps1u0kCQ3A
 QURiR1R0x7lBosdOILwyLYVSDe1SlX+pP52AUCC8rIU5/E9RFh91oz1
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Some MediaTek SoCs, such as mt6572, don't support 8-bit reads, leading
to zeroes or garbage data. 32-bit aligned reads must be used instead.

Introduce a 'mtk_reg_read_aligned' helper to enforce 32-bit aligned
register access. All reads will be performed by reading 4-byte words
and masking them.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index af953e1d9230..178b9d85f813 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -4,6 +4,7 @@
  * Author: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
  */
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
@@ -14,12 +15,37 @@
 
 struct mtk_efuse_pdata {
 	bool uses_post_processing;
+	bool needs_aligned_read;
 };
 
 struct mtk_efuse_priv {
 	void __iomem *base;
 };
 
+static int mtk_reg_read_aligned(void *context,
+				unsigned int reg, void *_val, size_t bytes)
+{
+	struct mtk_efuse_priv *priv = context;
+	u8 *val = _val;
+	u32 i, pos, shift, val32;
+
+	for (i = 0; i < bytes; i++, val++) {
+		pos = reg + i;
+
+		/*
+		 * Read on 32-bit word boundary or if it's the first
+		 * iteration
+		 */
+		if (i == 0 || IS_ALIGNED(pos, 4))
+			val32 = readl(priv->base + (pos & ~3));
+
+		shift = (pos & 3) * 8;
+		*val = (val32 >> shift) & 0xff;
+	}
+
+	return 0;
+}
+
 static int mtk_reg_read(void *context,
 			unsigned int reg, void *_val, size_t bytes)
 {
@@ -82,7 +108,12 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	econfig.add_legacy_fixed_of_cells = true;
 	econfig.stride = 1;
 	econfig.word_size = 1;
-	econfig.reg_read = mtk_reg_read;
+
+	if (pdata->needs_aligned_read)
+		econfig.reg_read = mtk_reg_read_aligned;
+	else
+		econfig.reg_read = mtk_reg_read;
+
 	econfig.size = resource_size(res);
 	econfig.priv = priv;
 	econfig.dev = dev;
@@ -103,10 +134,12 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 
 static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
 	.uses_post_processing = true,
+	.needs_aligned_read = false,
 };
 
 static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 	.uses_post_processing = false,
+	.needs_aligned_read = false,
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {

-- 
2.55.0


