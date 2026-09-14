Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06331E84B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361448; cv=none; b=eYKJZ/mVMof7flH8+U2QZ7SzaTuoikBOX55/h62J61+4E93Zjy0lhz7YswCpRZIZmCKIc9Pe7JcEXes9pxJG2XsfGPR77ee1Q+1LR6VT4uuT2KkjGFjkvP5BSZ5unEqYSQfRR7G+52zz1IVGpQHzy6iRm7kg4F1Xc7XyLdv3P6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361448; c=relaxed/simple;
	bh=Z5CWLPifvsIxw2AX2DYTLeV1c5Mrmc8Q4NyyibtsTDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j51w22OarPE7OFp8D6SFAatlUSQX9WXPZtVQYHJDdAOiJLOhmwtQfyK3P5JIEoIJCtYdDRklUwQ4F4nCMf4VE68A0b063Xtl4LcaIEuHDUFyW1nkHcm9cgGlzPgq9kG9Vpl40SUwgYVStfGUH8BzZdWK1xKeqDPHVrdrOLbkAqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiboKh9b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiboKh9b"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A85EC2BCFA;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789361447;
	bh=Z5CWLPifvsIxw2AX2DYTLeV1c5Mrmc8Q4NyyibtsTDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LiboKh9bDIZYQSfR8M7LDLY9UnHSAwaHdjerOZpVvIUtvNViQquq3RHYB6MxXmEAs
	 k1RoyudQkZEJQKKyfr7B487bLK7QZcMnGlOkc2jplUyqpfkJecCQMtuihlNyvIUzTA
	 2kGVMcqSwMx3IovGhEQuCCJf8dAvdJFqH7ssBV2MQeS1wxYxKf7UBk38PMRUznCQYL
	 FJA05PO5F0dYjdHvs/tz1pdvkuYl1qE5+gOvU8w/MwUFiq1mQm44BoVvMKgLErdZ9X
	 hm+C6FMxrlsIyC4hjJIkE4l9ZU0SAK2lwLchHecCJ+7uHL8+pVqM/j2/pGkw8YCQvN
	 CSsCZg2fcmcPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807B5C88E69;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
From: Takahiro Kuwano via B4 Relay <devnull+takahiro.kuwano.infineon.com@kernel.org>
Date: Mon, 14 Sep 2026 13:50:37 +0900
Subject: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
In-Reply-To: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alexander Sverdlin <alex@sverdlin.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789361446; l=1111;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=rZ/ppqGkp79oofIgjp+2euFFx00lpMqR81jL20uurYg=;
 b=afD1LcUOLiZftmqkrFPqF/KTxnZRF8mPVBKSA7bPSLo5RV0+1PoKwVJ43wwJoIYUhPzYS2+9K
 HdcB9jBYcG0Aunc9iUZNcFjr34pqfo7BPM4UpUqY4k9as8A8K6FV1OQ
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-Endpoint-Received: by B4 Relay for takahiro.kuwano@infineon.com/20250227
 with auth_id=566
X-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reply-To: takahiro.kuwano@infineon.com

From: Takahiro Kuwano <takahiro.kuwano@infineon.com>

s25fs256s1 has incorrect SFDP entries, like s25fs512s and s25fs128s1.
Assign the common s25fs_s_nor_fixups to s25fs256s1 to fix its page size
and sector map.

Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6a62ca6f6451..bc50881d5648 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -1148,6 +1148,7 @@ static const struct spi_nor_fixups spansion_nor_fixups = {
 static const struct spi_nor_fixup spansion_fixups[] = {
 	{ .fixups = &spansion_nor_fixups },
 	{ .id = SNOR_ID(0x01, 0x02, 0x20, 0x4d, 0x00, 0x81), .fixups = &s25fs_s_nor_fixups },
+	{ .id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x01, 0x81), .fixups = &s25fs_s_nor_fixups },
 	{ .id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01, 0x81), .fixups = &s25fs_s_nor_fixups },
 	{ .id = SNOR_ID(0x01, 0x60, 0x17), .fixup_flags = SPI_NOR_4B_OPCODES },
 	{ .id = SNOR_ID(0x01, 0x60, 0x18), .fixup_flags = SPI_NOR_4B_OPCODES },

-- 
2.43.0


