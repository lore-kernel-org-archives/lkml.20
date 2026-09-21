Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C154A0142;
	Mon, 21 Sep 2026 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001371; cv=none; b=MEyZaEH6p1JnF+1Ek5Y3jR64Cps34oO+Uimnq0aQ5l4JDlrVKa7D76mgZ4pPXMmPb6TZ702paecyWzf0JznR1TRtILm+cVMoPPdEMyIsJSBazn0mfA90xSPM63IEQ1eAd7ARyNVXyLaPuoWWj6uDXCYRcCW4RjjE2zqRJal86nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001371; c=relaxed/simple;
	bh=/RydMHtFmmBYus0MrR48LToVwrPUhgabAvoP9PIGA6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zsj1g56pqLNAIldfSRaGd22JzQpFXHIaQp9X7wdTueOl9KvAM7j5k0jQUN+wt+wUuZOSQMsWE7hLzPPQ+qHZX0S+4H2lTvHbISQPVFOiIGbvBZnZAKGnvdk5ui7FLNPVG2ScEsNxMh16jPi9aLxl0GIPzJtcnaCXlaPDrzG76dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsp5+wxT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsp5+wxT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00DC3C2BCFC;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790001371;
	bh=/RydMHtFmmBYus0MrR48LToVwrPUhgabAvoP9PIGA6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rsp5+wxTyNHclGpTFt0NGQXMf0ahNzrz9KJlhtygJ+zTAl6OrHNmFUungT8q1DS09
	 FjMlpqvKtvIH2n8r8+EMrjeWON2kxSAycKXgvPpTdNNVzu/sPbWnyS6xfqmLobx6NP
	 G5RY6y8GKtgDrPUMFaOCQEatl1bIorYnpnQi3lulFEIJK3cADZQFug0wAp52kth/qb
	 PVxLu89bbHA/TwmTaguSIGS2nitfh+W+GLInbOCBvBRmpq27PdyERX7hR4RKfWCXd0
	 OiRfY6I2Db8+jIQyLQzNrTKwv27jW6WbJe92rtN62ZG8Kn56SnZD8WzU6PDRVYAnDV
	 tjSdyw13MQWiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E2EC982F8;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 21 Sep 2026 17:35:49 +0300
Subject: [PATCH v4 3/3] nvmem: mtk-efuse: add mt6572 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-6572-nvmem-v4-3-e9c14156559a@protonmail.com>
References: <20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com>
In-Reply-To: <20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790001369; l=1270;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=xNpih/0wX5BB+DZCyvEE4EZcS9hf5v5IbyspXQH1sz4=;
 b=lQfi3rcoqxM26rYqiq3bdUfpJqvAXdKZsW6kWv2PX/ps2k/moNydRJooy2jRo67aZWa92Xxwz
 dgNzuOabuoEA0ujfG0LmGrMa2s8dybc+OU7Pzaky9T4g1uYPRgBsOAU
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a platform data struct for the efuse controller.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 980c29d01337..43cc2da2cc1d 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -131,6 +131,11 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata = {
+	.uses_post_processing = false,
+	.needs_aligned_read = true,
+};
+
 static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
 	.uses_post_processing = true,
 	.needs_aligned_read = false,
@@ -142,6 +147,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 };
 
 static const struct of_device_id mtk_efuse_of_match[] = {
+	{ .compatible = "mediatek,mt6572-efuse", .data = &mtk_mt6572_efuse_pdata },
 	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
 	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
 	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },

-- 
2.55.0


