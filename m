Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4402F4BF930;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721842; cv=none; b=gW6kXqPrXjtfC08U9dFff/8vF6U09tn6L8yXKve9WdPHXUvmpUDt1H6lONBeakEpOzPllG7NRVrWbEjQ1PFDODdyD3O6nGvBSEN5SgT3y4HgWotasxgU/zv/eQlVdLqsZXIEknHyE8R/T8SWtdk0EvVh5b6hWro6A7wDoDzDtac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721842; c=relaxed/simple;
	bh=0MZfb8YOHcc8fokOMG53lDFB1Qy18zEZ9NRLMlmZKTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SzI/iQqfwuZxpoluLygsYdauJhBTLEtKtREr3xFZeEl6tldJkxwC5hMfYP7ogkCrYrWR5e/Nl8/USAsW4U/KYH4TC6W9bp7fCAb3lJZqIMGJYQPAjQ2iehF9KT3s4R9OIsDIfbFhnYOfqMi2YMYyEDw4IoizTmVsQda9NIstzLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPdXFUGn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPdXFUGn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D51FC2BCFC;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721840;
	bh=0MZfb8YOHcc8fokOMG53lDFB1Qy18zEZ9NRLMlmZKTo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SPdXFUGnc+1kJFe6w289wQtDGDCSdf+RfxgTK3YFBYjobGzDS0iHySZa7x/VA2hp+
	 hTWU/m8NDcJHLqSup37CBPcKXANbmn6J3Av01s1lBxwrcQuix7vZvHw6Acvezo63Dg
	 bJQa7VvY471uuGH43NhYzIzq7wXsUYT448c28D1x5H4w0tFns1Hs+/uHfx/0sRaZKo
	 bFJTpa6k0B8CewgUi0Y7ullJ3Y3KQ+iG4YADjpVgI/oGv6vSssYrrWsq669jRKCb/4
	 qGK+I8Oi/tuJ9kUjbMEt92C58fMeQRp1gUDYbV6nGpseiLB03VaUWO97WPDYLADu7k
	 HIP3yAWo5MJ7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C151C982D7;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:25 +0800
Subject: [PATCH 10/21] media: i2c: it6625: clean up
 it6625_wait_for_status()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-10-78d72d7886a5@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=1624;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=wL/1qnO+KdUccI1MFOk7guLQMPf4wbF6Anqg/vJGVwo=;
 b=tJxYICqzS7N37px8uk6EZk33m365tQjLFHq7GLftJv4UbZA2Q/ulp3MixxR1fatb7sXXqWeDx
 VwbNdQvAVAZAHuJPYmRRe5zj6ge42cUXBNpp/VDFOg3c6Q7gnj4Gcu6
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

Use USEC_PER_MSEC instead of a bare 1000 multiplier for the
read_poll_timeout() sleep/timeout arguments, and add the
linux/time64.h include it comes from. Drop the needless (int) cast on
rval, which is already declared int. Downgrade the unconditional
per-call status log from dev_info() to dev_dbg(), since it fires on
every call, not just failures.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index bc6b0a9a0bb005b30983a30f8ca685f885ab78c6..b580256d32f51465a620b639fc0134366cc6fcc1 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -16,6 +16,7 @@
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/time64.h>
 #include <linux/timer.h>
 #include <linux/v4l2-dv-timings.h>
 #include <linux/videodev2.h>
@@ -502,11 +503,11 @@ static int it6625_wait_for_status(struct it6625 *it6625, u8 reg, u8 val,
 	int timeout_round_ms = DIV_ROUND_UP(timeout_ms, sleep_ms) * sleep_ms;
 
 	status = read_poll_timeout(it6625_read_byte, rval, rval == val,
-				   sleep_ms * 1000,
-				   timeout_round_ms * 1000,
+				   sleep_ms * USEC_PER_MSEC,
+				   timeout_round_ms * USEC_PER_MSEC,
 				   false, it6625, reg);
 
-	dev_info(dev, "%s status = %d %d", __func__, status, (int)rval);
+	dev_dbg(dev, "%s status = %d %d", __func__, status, rval);
 	if (status < 0) {
 		dev_err(dev, "%s err status = %d", __func__, status);
 		return -ETIMEDOUT;

-- 
2.34.1


