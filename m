Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78854657C0;
	Mon,  7 Sep 2026 18:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804307; cv=none; b=nDt7xx8pzSiZhiPtgg0v0XmEZJntPbfY1ZVTGai5X6sCSlxqcnioZ5KumleNkRdxlA9bIASMnTtMpef1sAV06fsOr5jSJsMKAM0PZeLpl4clVXhlSMqgirIyPdGKATLMMqFmx6W6ebTgZfB+KjSN+zukGNd1jhKvyVMfYLWzB70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804307; c=relaxed/simple;
	bh=GRj0pdNNSzpsrMELW8XgF2CHX2bEwzjKTOMhYPlvtL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=boUhddnK1RmdZx6sochjcsZgjISDjCGBRdjZUOlsF5suor+buW643jq7F6GCsKQ6vgIgvfmXCJ21aYFA3d2zGiv48StaWF1bMGUEdSxnIhKnZnY5LfvpQWy/k2w1FYCJmHh/4lt3ROxfKODwYp+oEwoNFJmdEe0ptA54r3khN8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbVIJVYx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbVIJVYx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79E81C2BD00;
	Mon,  7 Sep 2026 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788804307;
	bh=GRj0pdNNSzpsrMELW8XgF2CHX2bEwzjKTOMhYPlvtL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DbVIJVYxR483sw1OgNW3/m3Afl+bmDlWTC+9s4thm2NHJCnl8UPEluefE5fyObYhc
	 G838yMIOt9g7LegOC2xJEG1OnE0ON7yMJuXoMDUI9JTwMXcSUFVR4+CYmRHdhc6gvx
	 o0645r7Vqu2sts6+dyaxonYSVOB+mbdJh0rl25iux/+MWrNEObspns0w2vHaZRiz0g
	 HIE+tDs7kYWXui62ceHwONAbwNKu+oA8a2eFW2hJSB0+3fkLav2QVcNJMhLD6N7yg9
	 G5JWaZWKcc4mixqYND0T1c6eMzUQHLSJYvCkPS7o0CLwwljRX6N79mULFcaqVsGItq
	 IgImiz1zHjzZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C1BC79FAA;
	Mon,  7 Sep 2026 18:05:07 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 07 Sep 2026 21:03:07 +0300
Subject: [PATCH v2 3/3] mailbox: mtk-cmdq: add mt6572 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-6572-gce-v2-3-412a5b037290@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804305; l=1755;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=MP44FydKmOzCKLnDrKX8Goxp+gVfwj/6kJhGpboIwQY=;
 b=AFArNDjBCHtPbXmI8WLL+9005tldLqFATBpTrGGwjgF1zedsNeADjzyeHTvLdWYspGaWlW8zv
 c0WTFDjYzXQDTjvHNlVu/U2iKDUSySCaB0Hy5+OrCWnNsT7mWIYs7Gl
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add legacy_isa field forwarding to the cmdq helper and a platform data
for the mt6572 GCE.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index e523c84b4808..5e7bc52baaa1 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -99,6 +99,7 @@ struct gce_plat {
 	bool control_by_sw;
 	bool sw_ddr_en;
 	bool gce_vm;
+	bool legacy_isa;
 	u32 gce_num;
 };
 
@@ -119,6 +120,7 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
 
 	priv->shift_pa = cmdq->pdata->shift;
+	priv->legacy_isa = cmdq->pdata->legacy_isa;
 	priv->mminfra_offset = cmdq->pdata->mminfra_offset;
 }
 EXPORT_SYMBOL(cmdq_get_mbox_priv);
@@ -787,6 +789,14 @@ static const struct dev_pm_ops cmdq_pm_ops = {
 			   cmdq_runtime_resume, NULL)
 };
 
+static const struct gce_plat gce_plat_mt6572 = {
+	.thread_nr = 14,
+	.shift = 0,
+	.control_by_sw = false,
+	.legacy_isa = true,
+	.gce_num = 1
+};
+
 static const struct gce_plat gce_plat_mt6779 = {
 	.thread_nr = 24,
 	.shift = 3,
@@ -848,6 +858,7 @@ static const struct gce_plat gce_plat_mt8196 = {
 };
 
 static const struct of_device_id cmdq_of_ids[] = {
+	{.compatible = "mediatek,mt6572-gce", .data = (void *)&gce_plat_mt6572},
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_mt6779},
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_mt8173},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_mt8183},

-- 
2.55.0


