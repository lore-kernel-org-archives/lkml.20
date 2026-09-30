Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E7F3EC827;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763286; cv=none; b=QxQQx2RPVOY3aa7eYnySjcd0JHCB9vC3FVywM8dMk3krBgP4rUK1HPwG7SCAhh9OiER7Kts+lHxXyItOjlHD880plZBLrlP7uOvOwq4qGYCLqo2hQSD+zSw4Tu8h0f1/oT4fcqTT/GdVLfHFEodMbL/iFV3b6ywpErPMStmYr0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763286; c=relaxed/simple;
	bh=dVWdIA6jcIe0iWHDTwaO7naqquNUBOM3dPKEaK1Eh+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozeNp3zFLEbf5x0qrz1v1AzoDWHVr1w07PSL0RaklgC/BBVBhtgws5GmCTqw91Rw+hu65xxU2mJF016zrSfeZtuDBCGgKMt7BwG2ALHbpiFSN9YFyjOCmgRqP8Ai6R1GrXdVYkeFqaXjY4bZSwuF3HvOUhKSbB0dwkfF1Z5h5io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeWrlWFF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeWrlWFF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 593CEC4AF0B;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790763286;
	bh=dVWdIA6jcIe0iWHDTwaO7naqquNUBOM3dPKEaK1Eh+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PeWrlWFFxGICZ1rcgyViGjA6yI4epNGq+ncfjNQ8sn3ZYEUM00qhAPLOMf3n+19Im
	 cfnOaiHhdEpFx9CAwtvyC+JbwF4udXsCqc8xickd+94awzi64BKsJICl32CSg/iniA
	 yk7d86dmLLgLAenBhzgQkvfYo4dlIvnib56FlwT100bznZ9fupMnRue0yZt5qqHJnA
	 9Pta4QGxjHDp0/PJZ+06nw4c3E+RoU1JqFSvNTEAGLNkkP47m0DU5W7a4+MzCAM+pU
	 SabBoNj6TtD5XMK3hoS5VP9EyDp094vGn0Q+Yw7du89Dn1YOl86eDvG2ONcunbl0jM
	 IK9xkWdKsKseQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39806CA5FC4;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 30 Sep 2026 13:14:28 +0300
Subject: [PATCH v5 2/4] nvmem: mtk-efuse: add support for 32-bit aligned
 reads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-6572-nvmem-v5-2-384d2a3a1770@protonmail.com>
References: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
In-Reply-To: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790763284; l=2576;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=PlUtOStRK66yTGiZ19W5bDjNAyxn6+b3O2rJne7Jc/o=;
 b=arZOYtmwl2YfTtOmznupil67FCGDWj9KE0w3xmB/mGaqqdt5ZxwDNaTnV8fK5Z4LkT6piWm3T
 wdlB41O6P3SBz63nOz5jiXHVmTSwLu8JZHqNYGv3BmhvnV7vK9thByF
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 00a84ea963a8..980c29d01337 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -4,6 +4,7 @@
  * Author: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
  */
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/io.h>
@@ -13,12 +14,37 @@
 
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
@@ -81,7 +107,12 @@ static int mtk_efuse_probe(struct platform_device *pdev)
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
@@ -102,10 +133,12 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 
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


