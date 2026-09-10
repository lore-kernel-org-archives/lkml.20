Received: from b224-5.smtp-out.eu-central-1.amazonses.com (b224-5.smtp-out.eu-central-1.amazonses.com [69.169.224.5])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68309355F2A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.169.224.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058810; cv=none; b=H/I8tJ11eUdYzI1ANsEGZOdYQtNa3mr10Kswb9eWuXqUNsptWztTDFFpogFSQaxQ3mpZz+Vk7Y3m+y2eNiOhI65fNDhmc5MKZAcV4+5GgjXGQTwai3RBjndp2536vqPZUw2KVAS0c/NXifAM+iKiE6iUVGf3XWLMn/l8ohQvqRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058810; c=relaxed/simple;
	bh=iQkPZUSu5QWYmK5BMUGn5RN8QWahDFyWb9DjqGJqkn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uc3YU8HZcovQJcVn+wkUopgBdZa04V84PvGHFNJyfEshoixAgQlavBcqrPNdY+9ZLeyIoO6NSMWN9puz5tmZJAug7csXQ6iZUqnKaaqIxDfhMLqO1nfN4qV0h29OEYqvw9RE0gKngbGKn8boCQ9yQDK3s12mSpgs1QqQl6NTFjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sagnik.me; spf=pass smtp.mailfrom=mailer.sagnik.me; dkim=pass (2048-bit key) header.d=sagnik.me header.i=@sagnik.me header.b=lrUuQlMS; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=Zu4Uycla; arc=none smtp.client-ip=69.169.224.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sagnik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailer.sagnik.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sagnik.me header.i=@sagnik.me header.b="lrUuQlMS";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="Zu4Uycla"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hi6pntjfnmhxrdkbpi4sl3ndfqswqs3i; d=sagnik.me; t=1789058804;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=iQkPZUSu5QWYmK5BMUGn5RN8QWahDFyWb9DjqGJqkn8=;
	b=lrUuQlMSprZa8++GPrUUKsWC/KdxSgPI3IRa9P7I7oMuTctxj1PUTpJK6G3rw/MZ
	aEEGcCgKJaIh9runijL6DNxDB+PYAuH2I+sLAf5E8WgZm3vicSeXIznx9wRJ7wDbWzh
	i8zuYQVKk2oOPJ23Df9rG9avMFme4O1LIJG2inYtPDQWvMdWNjuQvMTjG8y58ZVtqku
	TIFAHNXvwF3Nn7dCFTZbRWF4I+WLK4DeIeTinLJ7rv15Oq2pEdSeSI4SeEqZ6YHiUbU
	aclpS0zPykpy1Dr0szkEww7oweAFUO1oClq3mAG2eeHflIoG2yx9P+YjJRhzWVAJAys
	9VhJSAIOPw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=sokbgaaqhfgd6qjht2wmdajpuuanpimv; d=amazonses.com; t=1789058804;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=iQkPZUSu5QWYmK5BMUGn5RN8QWahDFyWb9DjqGJqkn8=;
	b=Zu4Uyclab4nZH8g2mEzsd0iwpPqr9GCSBuRDjZW63nKziiJwylM1Y0Tfb5KidoNN
	4u1yZfp1Bh1CqKFN5vePKdHSFdSsC5GQJ7ngQt8KtevNLM022LewrTQHkbxfBZ328kX
	/BJ0x+uEi7GPluKySk+zdTMJAkqD7aCR0fTscRPw=
From: Sagnik Sasmal <sagnik@sagnik.me>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org, 
	mikhail.kshevetskiy@iopsys.eu, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spinand: Do not update the QE bit on devices without one
Date: Thu, 10 Sep 2026 16:46:44 +0000
Message-ID: <010701a08c36e962-eb595dbe-b80b-44eb-858d-c1033f8a86a1-000000@eu-central-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <878q59s2iv.fsf@bootlin.com>
References: <878q59s2iv.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Feedback-ID: ::1.eu-central-1.PI0qW2sOnv0WHLkqY53RTxXQVzstwFEIoB04n7YZrig=:AmazonSES
X-SES-Outgoing: 2026.09.10-69.169.224.5

Commit be0b86c648bf ("mtd: spinand: Gather all the bus interface
steps in one single function") moved quad-enable setup into
spinand_configure_chip(). The new code only determines whether quad
mode is needed when SPINAND_HAS_QE_BIT is set, but calls
spinand_init_quad_enable() unconditionally. This clears configuration
register bit 0 on devices without a QE bit.

That bit is not universally a QE bit. On the Winbond W25N02KV it is
H-DIS, which disables the active-low HOLD function. Clearing H-DIS
enables HOLD during single and dual I/O operations. If IO3 is not kept
high, the flash can pause a command and ignore clock and data.

H-DIS is not restored by the FFh reset command, allowing the incorrect
state to survive an SoC warm reboot while the flash remains powered.

Before the refactoring, spinand_init_quad_enable() returned without
touching the configuration register on devices without
SPINAND_HAS_QE_BIT. Restore that behavior by only calling the helper
when the flag is set.

The regression was reproduced on a JioRouter JIDU6401 with an MT7986
SoC and a W25N02KV. With Linux 6.18.44, sysupgrade failed and the
following warm reboot hung in BL2. With this change applied, both
sysupgrade and warm reboot completed successfully.

Fixes: be0b86c648bf ("mtd: spinand: Gather all the bus interface steps in one single function")
Cc: stable@vger.kernel.org
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Assisted-by: LLM
Signed-off-by: Sagnik Sasmal <sagnik@sagnik.me>
---
I really appreciate the prompt review and your suggestion for a cleaner
approach. Thank you.

Changes in v2:
- Call spinand_init_quad_enable() only inside the
  SPINAND_HAS_QE_BIT condition, as suggested by Miquel.
- Retested on a JioRouter JIDU6401; sysupgrade and the following warm
  reboot completed successfully.

 drivers/mtd/nand/spi/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 43bbe2629..e59581d35 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1813,11 +1813,11 @@ static int spinand_configure_chip(struct spinand_device *spinand)
 		    spinand->ssdr_op_templates.write_cache->data.buswidth == 4 ||
 		    spinand->ssdr_op_templates.update_cache->data.buswidth == 4)
 			quad_enable = true;
-	}
 
-	ret = spinand_init_quad_enable(spinand, quad_enable);
-	if (ret)
-		return ret;
+		ret = spinand_init_quad_enable(spinand, quad_enable);
+		if (ret)
+			return ret;
+	}
 
 	if (spinand->configure_chip) {
 		ret = spinand->configure_chip(spinand, SSDR);
-- 
2.53.0

