Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284B950C2B3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650055; cv=none; b=EU6lR/LrVEi73/TeKpq1L9edY1D48vT9e5Ue1M2+j8YAkXLIluaj30jOTn5dH5S91QzWUwnzS+yUIK3bbCMDdE0i3Ho4OkgLj/sZa05ZZ318mEWnTmPg5Ve8B9tVNnN7jtJ7sjVizh07mNAAtV8tEjc1wYZwNJw1Z6bh82GZDls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650055; c=relaxed/simple;
	bh=M7K41bEmZRs8zEe7ciQ4rClIT6UHkTQUin6UUaJnqrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrlEsX9lapfXN3MJD+KaQoHBzbOGXVkSyhCoxVIfO6oz/YXnbP3HHlT8e23PxaHo1W3Xb80X6SjOg8iT39uTiiqTDM7pJnNvVXciGgFj4TuNjOn/a8B+YL5m3YufueMSOd9kZSXa0DN6eh6cnqv98RkKY38t0rRhSzDWBdekVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMbFsdVZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMbFsdVZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B441EC2BCFA;
	Thu, 17 Sep 2026 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789650051;
	bh=M7K41bEmZRs8zEe7ciQ4rClIT6UHkTQUin6UUaJnqrw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DMbFsdVZryHSuLXAkoXUoHDyCQMI0m7RO0Gy7mcQbYVfmnlIm70l4NXQAbil9/nk+
	 M7QHaxVcdN1K2T1Ekfq9rv+M3bRiC3DlNv0ltHd5kFfNgsdA9j6UNSm2SpNAKLLtD1
	 tFkymnwkgxRwkoTQZVtJsI/5lZK0HN0R8Dk35bxW78e5HOdu0M8ZQW+cEBHtQN4RQb
	 NcDWNIYYQ8/iSAIUiz5jFVR1UQp503DI4apgSHhkhiPbPvGqM4NDDqY0H+1iPV0DMS
	 XuzBlwee9ITxeoz3NOsKZ/jM+9JunfnsqiErKr+SVLdw26DQ1mJyIKIk7L2ptnb2KV
	 DTfqmvj0kxYZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3F5C982D5;
	Thu, 17 Sep 2026 13:00:51 +0000 (UTC)
From: Peter-Simon Dieterich via B4 Relay <devnull+peter-simon.dieterich.vaillant-group.com@kernel.org>
Date: Thu, 17 Sep 2026 15:00:43 +0200
Subject: [PATCH 2/2] mtd: rawnand: Reflect that ESMT and GigaDevice share
 ID 0xc8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-esmt-gd9fu2g8f3a-v1-2-577c0ab2d31a@vaillant-group.com>
References: <20260917-esmt-gd9fu2g8f3a-v1-0-577c0ab2d31a@vaillant-group.com>
In-Reply-To: <20260917-esmt-gd9fu2g8f3a-v1-0-577c0ab2d31a@vaillant-group.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789650050; l=1759;
 i=peter-simon.dieterich@vaillant-group.com; s=20260820;
 h=from:subject:message-id;
 bh=GVgrbaeNYYC74jEu4meBBZ7WRozFmcBvWG5whH/D0VM=;
 b=l0SsMisYo5Dfq77I3F5DLjARmFARoNm+su+9JXxGB+DtQTaQrbkkGFRcVSCRzJQ4zmwFZdYYk
 oLMu8xtFbkRASk2T/LZE2YjQ83lC8FgGTFHxMwqqWNHGT7upYXwwOT9
X-Developer-Key: i=peter-simon.dieterich@vaillant-group.com; a=ed25519;
 pk=YI8VL1pBCnAIu0GVWI3a6qn/SG0pMQhm9n/RZTI5KZg=
X-Endpoint-Received: by B4 Relay for
 peter-simon.dieterich@vaillant-group.com/20260820 with auth_id=965
X-Original-From: Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
Reply-To: peter-simon.dieterich@vaillant-group.com

From: Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>

JEDEC manufacturer ID 0xc8 is used by both ESMT and GigaDevice, so
nand_esmt.c handles chips from both vendors. Chips from either
vendor are currently reported as "ESMT", which is misleading when
debugging a GigaDevice part.

Rename the manufacturer entry to "ESMT/GigaDevice" and document the
collision next to the NAND_MFR_ESMT definition. The only behavioural
change is the manufacturer name printed at detection time.

Signed-off-by: Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
---
 drivers/mtd/nand/raw/internals.h | 1 +
 drivers/mtd/nand/raw/nand_ids.c  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b7162ced9efa..b8b29341b88c 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -19,6 +19,7 @@
 #define NAND_MFR_AMD		0x01
 #define NAND_MFR_ATO		0x9b
 #define NAND_MFR_EON		0x92
+/* ESMT and GigaDevice share the same manufacturer ID. */
 #define NAND_MFR_ESMT		0xc8
 #define NAND_MFR_FUJITSU	0x04
 #define NAND_MFR_HYNIX		0xad
diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index 08707ce9d7c0..9b2dd246398f 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -185,7 +185,7 @@ static const struct nand_manufacturer_desc nand_manufacturer_descs[] = {
 	{NAND_MFR_AMD, "AMD/Spansion", &amd_nand_manuf_ops},
 	{NAND_MFR_ATO, "ATO"},
 	{NAND_MFR_EON, "Eon"},
-	{NAND_MFR_ESMT, "ESMT", &esmt_nand_manuf_ops},
+	{NAND_MFR_ESMT, "ESMT/GigaDevice", &esmt_nand_manuf_ops},
 	{NAND_MFR_FUJITSU, "Fujitsu"},
 	{NAND_MFR_HYNIX, "Hynix", &hynix_nand_manuf_ops},
 	{NAND_MFR_INTEL, "Intel"},

-- 
2.55.0


