Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9143C1D68
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621349; cv=none; b=Y7UL6sGgI7MW5alA48tSU4Tczs2Cxdv1fXJ3QRWgAE5hHZCpQjxK9yQ5w+NlqUMs20XEs4xYEDaZSZj5PDPcmFQNLGvzf1dpz5sAKf6z56tJGKoADb1yE+dVtBt1nIfrf500AOa1+ZeScTugVvSQA4Tr0syD6jZg6Eg9Lb5ZHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621349; c=relaxed/simple;
	bh=b1ee6i6SmotwB95caa+DvKJNA5MPuT8KDx3JzIoVyF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GwuDrNOwT0MfeTGUctzeGFhtL4j+o5BazhmKnBw3koN4vsVAicc8ux49W19IOniKWz7tSZZP+1nlWbLRgGQvgkxOH7Ycekl6NmV9TiCrUEWP5ztftgxU3ZM2L2GFXmPTrJ8nogYgHiKPiwibc8WFBAU1WSBW1H3NtdolZ2pxBGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPbiH2KN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPbiH2KN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5AC0C2BCB8;
	Thu, 17 Sep 2026 05:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789621348;
	bh=b1ee6i6SmotwB95caa+DvKJNA5MPuT8KDx3JzIoVyF0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sPbiH2KNA6+i1SHQVXAUHje1Jo6pat8My9LGWk76CndSZDEtVw4BCX3MGmJW5D2mu
	 s069SDzIdYyODHU8jPwMgS6ykVHFUMlHO95jg7HHWWIOQaZ2UgyDUqO5oZLtGN/Ehu
	 F3ZRNsTXzXYZn8W0EoLxdXpYRAwum4YkkcahfBpO0lvTTSbEJQJOmtA7FzzW0OeNY/
	 h66nqsovURw60z5KqQabniKJqAaP4BBteJR0DA4A/doyV3Z3khvM14qlHFv2u4I4Dd
	 FHl99beWziMv2AHJnuz8N81txiGNxVG0/OFEfxhEODcdJEpIKuLMHCcCUv3vubo/g+
	 n/yZYnmS3m5Ug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E28C982D0;
	Thu, 17 Sep 2026 05:02:28 +0000 (UTC)
From: Takahiro Kuwano via B4 Relay <devnull+takahiro.kuwano.infineon.com@kernel.org>
Date: Thu, 17 Sep 2026 14:02:15 +0900
Subject: [PATCH] mtd: spi-nor: sfdp: Increase SFDP data size limit to 16
 KiB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-sfdp_size-v1-1-c1cdb1003f48@infineon.com>
X-B4-Tracking: v=1; b=H4sIAFZ0q2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Nz3eK0lIL44syqVN00yxRTg+QUA1NjyxQloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loAVFtAnm0AAAA=
X-Change-ID: 20260917-sfdp_size-f9d50cd0539d
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789621347; l=1832;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=jgdfCpo97xb3riAigqfD6paumJXjsCSiN5EBCeoaUd8=;
 b=EYyWvTs7HkUROsN5diVtZwPfmb2LAcsPLbkL0iMzPO9AymQzBW+5TD0aj2cK07tiktx2QJBK/
 f/1qsUw8CyaDgSVnWlSUe+PDsMRdrkst37+t75YXntzbuawrrFDhLtn
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-Endpoint-Received: by B4 Relay for takahiro.kuwano@infineon.com/20250227
 with auth_id=566
X-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reply-To: takahiro.kuwano@infineon.com

From: Takahiro Kuwano <takahiro.kuwano@infineon.com>

The size of SFDP data read and cached is limited to avoid allocating
too much memory. The current limit is PAGE_SIZE, but the Spansion S25FS256S
has parameter tables at offsets beyond 4 KiB.

Increase the limit to 16 KiB to support such devices by introducing the
SFDP_MAX_SIZE macro.

Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 641f17ad51a0..5d5bb6e587bf 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -115,6 +115,12 @@ struct sfdp_bfpt_erase {
 
 #define SFDP_4BAIT_DWORD_MAX	2
 
+/*
+ * Limit the total size of SFDP to a reasonable value to avoid allocating too
+ * much memory just of because the flash returned some insane values.
+ */
+#define SFDP_MAX_SIZE	SZ_16K
+
 struct sfdp_4bait {
 	/* The hardware capability. */
 	u32		hwcaps;
@@ -1594,14 +1600,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 				  SFDP_PARAM_HEADER_PARAM_LEN(param_header));
 	}
 
-	/*
-	 * Limit the total size to a reasonable value to avoid allocating too
-	 * much memory just of because the flash returned some insane values.
-	 */
-	if (sfdp_size > PAGE_SIZE) {
+	if (sfdp_size > SFDP_MAX_SIZE) {
 		dev_dbg(dev, "SFDP data (%zu) too big, truncating\n",
 			sfdp_size);
-		sfdp_size = PAGE_SIZE;
+		sfdp_size = SFDP_MAX_SIZE;
 	}
 
 	sfdp = devm_kzalloc(dev, sizeof(*sfdp), GFP_KERNEL);

---
base-commit: a96edc3f0b4f036a5b6ebc9b1eca4273ef5ce2d0
change-id: 20260917-sfdp_size-f9d50cd0539d

Best regards,
--  
Takahiro Kuwano <takahiro.kuwano@infineon.com>


