Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649CD4B2034;
	Fri, 18 Sep 2026 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721841; cv=none; b=SL2TVeoodkbZx1z4DSvcU+V2aKtB65RC6dBzaTGLPVEna20zYCyyDnwzzk6/ErftoL3kuXwk7ALEJhVUomakIkiHwEq5Hhax+18hsKwGysrGjyK5eN9nXqGcRxKYfJIJpMVF3tVMSUYfv2f0u/Y4451sCYIIahfkgOLENckoAv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721841; c=relaxed/simple;
	bh=Y09jJH9K4LAobG30wFGPg8/lf73Of68us5AYvkdSpkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sscmoaI/BZO3fnCnKztTrouBGR9b0m8YBKkIsDe6x+eLbfWevN+BqekAA4drJOgqwg2uOp3rgtmtlmrgW1y2xogKk1Mvoxc38uZRYeoCFukivg1wny1Sg7kMokZHv7bWokN6kzAB94JaLNKUobsQQvjFk3NfoeCUeSmSPCQ4tu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b41DGEEi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b41DGEEi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99C22C2BCFD;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721839;
	bh=Y09jJH9K4LAobG30wFGPg8/lf73Of68us5AYvkdSpkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b41DGEEipKK2ihPevUE2RmdlpmR0ROsJ9E7LmC5LD8t0NSd8jYzuYbJ7YZkJpYXYs
	 RBerr+cj2azdKkYaOiLB69J94bbpSs6ZNkyi2rp/SUfIVpNkwY5ioxw/vtCDg1OGM3
	 CBe2nqT3AohVvRIu6USKR3GNaoaK79tpx8C9vyXyIl7Q2Ghj+c98FAIGS8aRvTQXje
	 UK09Cy4qzOpfOE1+uxGU6gcKsHpAbMYDb/3v35IreiXXBXlNRbAW8YqWDr5G+hXf6F
	 zFL25FvceuDDJ834RMhi3Gluu7ZQGXcY2L70gJO0SYBASdIEuPM2e/gfoaeS9X9DqP
	 E4IVvg76x3ojQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81029C982D9;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:18 +0800
Subject: [PATCH 03/21] media: i2c: it6625: default the debug module
 parameter to 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-3-78d72d7886a5@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=753;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=4gDgLddPvEaApefdm/VXiVuCA+25zmyLXFpBDuZ557I=;
 b=Yb7vBS9u+fyUDCkPjWNic/5G/TIqKMye9wdZqZO5rdvuWGRbVA2OOTaTPxihG0Qy16rsCgtaT
 uTEqkSWiu5/BV7NFk7PqcOZCjQbpzZc9FSFh6flKbMWf/pMjp9+kyWn
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

Printing all debug information by default is noisy for a normal boot;
default debug to 0 like the module parameter's own description implies.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 5d267676606e340ad0ee5ad2b78e5acb50a32980..42bdcc3af326ceb6c529b8da35836c49c8c43643 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -29,7 +29,7 @@
 #include <media/v4l2-fwnode.h>
 #include <uapi/linux/it6625.h>
 
-static int debug = 3;
+static int debug;
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "debug level (0-3)");
 

-- 
2.34.1


