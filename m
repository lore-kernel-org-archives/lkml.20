Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F753EC83D;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763286; cv=none; b=UzRX3UKnYE94NzT5IUaAYcxtLXTyB14KBde5/3TLnmaSKHGXcmVUbrI9Wxqn+vCUQugCMTkBGNDBl6q+3YegBU4MAU+kG7WrVhSE7JN3aXAu5U4Cy/vjAY9xOXE7eG5TRZmYGUXMOPUSDQWOv2d9xABWFOolb4xI94o6/tDb5C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763286; c=relaxed/simple;
	bh=Be0+OCNIl6c1x8Jwv+CoKPfEQ8WLlBBw5ctmf3yZWlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxHcpZ4ke8b8O83/K7BQof+ONsqzwfZTPbCs1mvwY60nu+KA89MEt8GS4LkmdLwXib1VQwna3gCB1vMfj/z5XNyR4RuCGtW/D59pxQB4/ccx+dafqpYHnPl7vCjojIHtCJYp+P31NjeVb9WiqqrkblpR1HwhKemrOdpoyqCK+iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5qrffn2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5qrffn2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A306C4AF48;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790763286;
	bh=Be0+OCNIl6c1x8Jwv+CoKPfEQ8WLlBBw5ctmf3yZWlk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b5qrffn2EMyCt73uq2hao7cUhJER8zSy/QzDpulJk/gJckY+QIa9ZIV1BHTMi6DJc
	 f0yN42S5WwMzNJLoL5AG+9c0fGiKXelyp/1NvRkfQWKZRmhCMq3+awtXdaiZThwcoJ
	 xz+4LH7F4rE9N/oR9XKmjjZ55YLoWHAlDvDW8iTmuicoa9sQIzAw+uyR69VOhm6j3V
	 S7mrl1KUF7VXbWHtUYMCpyPgsIc9LApy1BiKqxm5tvJcLwTrfJhHEEfCjHh9DwLyKu
	 3Mmq2LSO0hW5JQdfm7thLzldFErF7E1u+aJc22YYwUvIiQG8gJ1GmHNSaVHdo+H3Ie
	 XdwYJoKVgHOMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583DECA5FC6;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 30 Sep 2026 13:14:30 +0300
Subject: [PATCH v5 4/4] nvmem: mtk-efuse: add mt6572 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-6572-nvmem-v5-4-384d2a3a1770@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790763284; l=1186;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=BLO02wNqFKS1dVneAe1BJFH56sutKZjWvs0KKjgRQ34=;
 b=L0qyOqmqCZmDGJhG809E2bv0npQJLXGEFnqQ74W50W9pGBhzXn7ZOL7uwojtTCmXsBsT/jcd1
 nCAjMxdZ4mOC7lpPhW/fhamdY5VorAYR/QoZHwHfoCdHwZ9S+sQWhGf
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a platform data struct for the efuse controller.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index d2e5c69c580e..24d302a15528 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -150,6 +150,11 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata = {
+	.uses_post_processing = true,
+	.needs_aligned_read = true,
+};
+
 static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
 	.uses_post_processing = true,
 	.needs_aligned_read = false,
@@ -161,6 +166,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {
+	{ .compatible = "mediatek,mt6572-efuse", .data = &mtk_mt6572_efuse_pdata },
 	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
 	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
 	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },

-- 
2.55.0


