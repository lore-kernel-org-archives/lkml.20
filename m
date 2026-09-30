Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA54052D5;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=oK/Yd5hlACjQggYuOqpy73xdup61bIzrjz7dHoJ9389E/1GU94gDL5Iofm1yQgG9MqYLczGeBmR0SHKcrcHuF4w6QAcv/ODSvig0eNeG3134AYm5ptmbDrqXJkyie+dWygjMAwZGzTIHk3N0Ukn/ELGSesGTFK/MyEHRlE2O5vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=VfPitG4A/TWGD2Gb2XPC5AV4aWOCH1aUk/QudQegpdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krCudeHNe4Rt6cbvRcTSsLBMyooUHSIoVuJNASm4UF8SAe5Ep8dKCOtGaQ7ScemtNAkE+Db531ntVnmGtJJ1xG1uc2NPbpGpqcnR3p6QU0sMpJ3qbMkLhR4HszgYewwIHY1/zFnzGES15fAUJswVNVSnQDbWZL/NmwxTWi1eRM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFfnBOJ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFfnBOJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70596C4AF65;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=VfPitG4A/TWGD2Gb2XPC5AV4aWOCH1aUk/QudQegpdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pFfnBOJ4vPMWHqYlJXEOlSsPnBvreZxxmKtbwC+XI4UdfbGac0d8qMvWAC7VLexSx
	 HIYSbLf9oTmrfH9Df8Phh/G0Sxveg59UfISISbt9y+zjNGrcAsz7wPTNEoWXAqaILs
	 OQof6ACacHzq3LpdeflYDh5k8R3kcCesRuZDEQeao7m2W+Dv93wu+35h0/RRvHstIz
	 zio/BB6HbQaa1H7jO9p58Zmt1RvpXpB73I7TZe3f/64hYN2GVLVCnIy+CCgoHLKcC8
	 AHWHJr5gvzRQ8dko3GmXNh2ZvXDCBtkyLrWXcclk0nwUYPonJRbBmWTFJ+zvfQud6T
	 SPxcYaUraT0ew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB5FCA5FBB;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:28 +0800
Subject: [PATCH v2 10/21] media: i2c: it6625: clean up
 it6625_wait_for_status()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-10-e353f887e7fa@ite.com.tw>
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=1624;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=YxlpC5255mfOPuhppThyvVPQ835JcGtAqVCa5EVmbb0=;
 b=xinJ9FA+J5QfLFW1tAN3Z2iFtdwQWYJW3bjCcDyKrLob0QDeJIB6NeUQxiXPoaHnkrNqYiImA
 2fnwZ+ErCbFDKlgGz/b17g9B4BdarSeqJ83rNRC065ZK6eX8ORs0K1F
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
index 8d368fd5a64cd815c7a9013c863804c32eee7fc1..7bf008a3ac311c09e17ef7dc25adbed893d25137 100644
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


