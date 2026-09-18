Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5C34B66E7;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721842; cv=none; b=uWNIxzv2JYhFvOEKxsl442FqIA2p8NdCpY5ROHG4QcKz4mSF+Ng6dHP/jwloeyvyvWvTEGvhNWfaGgEIWJaCofdHapVclZTMRvJ70lkGS1xXL985rFTQG5VfzLqMR7go6WoZdqWclErDHnSdfKQFeejzBG6QAwBbXdnnL53Gox0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721842; c=relaxed/simple;
	bh=lKKBM0Z15+Cg7euZBnlCtVNRM9u1vWlpFXjUS8aHLVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rj4Xub/qWjLu55DPSYi7da6uiNQHAR/OKxCQ5UOcc/V1PgXR7YTAxlFETk4grM7m2wTNc0PCDjDiO0QJ5Q5VDAQwX5lS9xpIc9mzcK/+FrRPwjo58oSJ+25LjJS/8M2PdwSWwHHlyRstvI0kes7+hpwaQaD6T0HX7YZLnfpWxAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIItvJXH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIItvJXH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFEDCC4AF0D;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721840;
	bh=lKKBM0Z15+Cg7euZBnlCtVNRM9u1vWlpFXjUS8aHLVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qIItvJXH4xtvGSrsHpURfQ2k16/srqBTbWY7ZBQT6eoLnY4jqaLarf4OcUUkXhHeo
	 THQCOmpddwnxdCbrAbju/SEUevACNtsT0hJKdtxXkp04Rt5N2LDVnDaOJsSxzFEJBV
	 XPSxDX9iryfnVmeyJLlbQLnGqZuBycwFAmF6W/HzVsmA+a/f8o20DUGrEI8uxFWmGg
	 nUCLSYXxraw07p2PXq7I8kY4P3ejIN3XBBNduKemtmrrGtnQYZ7dQKlFo2YjU1yWlo
	 xYubegtVZGLVKVOU2exB0UnQzsfqnat+lSAh59GNwECgYFd1kSRrIoyT8VXB7484sc
	 r2q2j8j1dA3xQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB66C982D9;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:30 +0800
Subject: [PATCH 15/21] media: i2c: it6625: use early returns in
 it6625_update_timings_if_changed()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-15-78d72d7886a5@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=1398;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=nhYLeOnWUfOr4p9kaFWjpJjBGZeXmu4xl/oIvvdqeOc=;
 b=pVtstrPUw4pFLakci5deW/zW81qVnHiqawNZYO6gByOeaIpB71m9q3FtnfSZy60RhvEFlEMfG
 kWtmxo6iHePDMlPA3aGscJHYw318ej/jcBQn1cJx6XgSJfcSljadHgO
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

Convert the if/else if/else chain that only ever assigns a single
ret value to early returns. guard(mutex)(...) is scoped to the whole
function body, so an early return still unlocks correctly.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 882eda8b836d655585ba45b0a33d1c068bb3a8ee..db962bc100cad9f4d71fa4156b10ff5b4c952a7c 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -1431,20 +1431,17 @@ static int
 it6625_update_timings_if_changed(struct it6625 *it6625,
 				 const struct v4l2_dv_timings *timings)
 {
-	int ret;
-
 	guard(mutex)(&it6625->it6625_lock);
-	if (v4l2_match_dv_timings(&it6625->timings, timings, 0, false)) {
-		ret = 0;
-	} else if (!v4l2_valid_dv_timings(timings, it6625_get_timings_cap(it6625),
-					  NULL, NULL)) {
-		ret = -ERANGE;
-	} else {
-		it6625->timings = *timings;
-		ret = 1;
-	}
 
-	return ret;
+	if (v4l2_match_dv_timings(&it6625->timings, timings, 0, false))
+		return 0;
+
+	if (!v4l2_valid_dv_timings(timings, it6625_get_timings_cap(it6625), NULL, NULL))
+		return -ERANGE;
+
+	it6625->timings = *timings;
+
+	return 1;
 }
 
 static int it6625_enum_dv_timings(struct v4l2_subdev *sd,

-- 
2.34.1


