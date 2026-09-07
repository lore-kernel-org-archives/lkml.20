Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC91B4DA546
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787403; cv=none; b=P8LKYte3r5ncZvDT7lj9faw8Sk1oBHS4uelMbE+pWTqet5m0ss2NFb+3MKOKIQJmQbU5e4hZzdU6Pfclh1GzAd8L2hsT1CUiSarmOpLV0ggMRrQtmHByt3aEc8LZMAUmEr4Mp9QtuLzMZyrJfpOcYQjjOdJ4eq25rSA9bki6Os8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787403; c=relaxed/simple;
	bh=ApA7Ka5HrXzUkLhw8SwfYD5lxiRpAW6cnrR+r1OQvbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozqgwt4O58uzp9rAvIH/VelfXPqt1wsYh1Efy2rQCtoPIkHmQtcpS/MVemC8mtYwgdlC1nlwSu8nbAPPMjsd2+9BXMqdPgGjgZU0lk69utLhRbUAip3RzKjQJjwHqhCLp7yUF9rYPIGxbfR0Arx3McPTLsxcerYHJfp29+/T4AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I8KgPgK9; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I8KgPgK9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3879A1A1A36;
	Mon,  7 Sep 2026 13:23:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D08060383;
	Mon,  7 Sep 2026 13:23:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D147A11C7AF1D;
	Mon,  7 Sep 2026 15:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788787396; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VzAPDf9Nc3K7+RvIAzHAvLx5HCL8DPFPO8epWMMl5yM=;
	b=I8KgPgK9Rqgrxl3crt63BmCkVfrNDV6wR6RCRfmNoEG2UYFojhrldc89w62BfFzPAQUl1M
	2sJDQAILATKgfkt3oARjIxxI+QVM95cv75zBOnFsQ4LBUE7umQZAnXUcSmSySBz40q44Po
	36IXMsidP/ei3wAT0NWCfv2YgBRRV34pwlbPPFnSMTZiLF4A/mv23cKy/nQ3ESJyQ/5vvv
	MRTu1U1aJdacQMN+j2C6+G2KDUShkZOZT0NYcRg0KqFHkcDpE3w+aVxd9wMezGKBLJNeMJ
	prGXCUg65tS3wjQRP/OW4AZlITNJs1NxKqmwXKRKXesqkyKO4IuFAfGvzXugTQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Mon, 07 Sep 2026 15:22:37 +0200
Subject: [PATCH v5 03/19] crypto: talitos - Add missing includes to driver
 header file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-7-1-rc1_talitos_cleanup-v5-3-860f43cd7317@bootlin.com>
References: <20260907-7-1-rc1_talitos_cleanup-v5-0-860f43cd7317@bootlin.com>
In-Reply-To: <20260907-7-1-rc1_talitos_cleanup-v5-0-860f43cd7317@bootlin.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Christophe Leroy <chleroy@kernel.org>, linux-crypto@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788787387; l=1415;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=ApA7Ka5HrXzUkLhw8SwfYD5lxiRpAW6cnrR+r1OQvbw=;
 b=YB+61Q+SOBC/Fh3U5bdTYabkjGMy0HtcZfKLUTsCHWdBXxJudhoZaL1ztwfIbSOr/7HHaQPdU
 lMluF/DkqhOBc6DULyiN3mIdvSXfUFtOiPNP9QbV5qrF8L+wx2lF8My
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add explicit includes for types used by the header file to make
it self-contained and fix implicit include dependencies.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/crypto/talitos/talitos.c | 3 ---
 drivers/crypto/talitos/talitos.h | 6 ++++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/talitos/talitos.c b/drivers/crypto/talitos/talitos.c
index fc443374603a..9f0928312102 100644
--- a/drivers/crypto/talitos/talitos.c
+++ b/drivers/crypto/talitos/talitos.c
@@ -15,10 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/device.h>
-#include <linux/interrupt.h>
 #include <linux/crypto.h>
-#include <linux/hw_random.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
diff --git a/drivers/crypto/talitos/talitos.h b/drivers/crypto/talitos/talitos.h
index d4ff8d589f46..56e36a65ddcc 100644
--- a/drivers/crypto/talitos/talitos.h
+++ b/drivers/crypto/talitos/talitos.h
@@ -5,6 +5,12 @@
  * Copyright (c) 2006-2011 Freescale Semiconductor, Inc.
  */
 
+#include <linux/device.h>
+#include <linux/hw_random.h>
+#include <linux/interrupt.h>
+#include <linux/scatterlist.h>
+#include <linux/types.h>
+
 #define TALITOS_TIMEOUT 100000
 #define TALITOS1_MAX_DATA_LEN 32768
 #define TALITOS2_MAX_DATA_LEN 65535

-- 
2.55.0

