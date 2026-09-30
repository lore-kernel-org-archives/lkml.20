Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0719F412BE4;
	Wed, 30 Sep 2026 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750571; cv=none; b=NPx5JhCdaHL01ntXwuirygElvMDM0MZLF7o4L3bw+Azss3Y2UnA69NLAcTpaFvYRoY5kaxHmwLufexRsKFRZwisIB0Hi4qUIKlH476zUWeT2UBAQt9IeF7iw9v30x/ThDWVavLfNZvu/q9m/kiNJBBS3q1lm63bNTuGtaV3UcmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750571; c=relaxed/simple;
	bh=ZYacYN6Xyih6skMbmcaF2PTnTNpr3LhA//FUm1Kj860=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WZ2ccsEcj99NAOZy5ZpCBqtfic8sDZUbgQINz1EBAtUhWwubmHYk63N2fO9vRdActLUL7iGELic7O3QwTodZJdJ78FFjanQoBLmULDQkrotF+MVfejJa49uEaxbEvDedD4jfDh5peCEw+FusLHzMv1Bs21MrWpTyeZTT5TVBM4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1+5t/9K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1+5t/9K"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9E8CC4AF48;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=ZYacYN6Xyih6skMbmcaF2PTnTNpr3LhA//FUm1Kj860=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B1+5t/9KZvxKMoKYNF2WA3v1oY8NWErBviHbQFh+NGABVQvOKw5ZCvTMRH1WlLbZQ
	 lJjNZm2k+TatQMAeeQ/FnqkICqKu4M47iGiBEWJBZDw1z8qucOOs1LdQV7SIJ+/oPI
	 vKKFFp/I90qINRDazGE2rr4/JzOGSOq/VTiaodQy4GkGr1Un6P9MjP6DLGvCbfyPej
	 SloHqUItLwlUr/ZLkNq0UoJjsaU9sJCufdXQVGii5eNgVq+27q4az8TWhkRAng5K2v
	 mEphuq1nEkG7zDZB6hGyiT6K7Gte0Rj2bpm0lRLqhH2fa6qx01oP+kH8zTBC+QcvVa
	 BwpVKoqk2cScA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A9BCA5FBB;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:33 +0800
Subject: [PATCH v2 15/21] media: i2c: it6625: use early returns in
 it6625_update_timings_if_changed()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-15-e353f887e7fa@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=1398;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=1f/AMOL9Ry8KFxmsDv9poFd5iZaF6Wsr/4yQ0yh25SY=;
 b=Hh0cU9ywQ+aYrQ8cxEWErYNWKtk03eIwxHrDny11XG8t3Fyfec1XEzjvmggXIJw/xsNdfdl9Z
 GD0I9NjW/XvBnSPrSkdNLzLytD1U4vCAWMdvjHnohVICgbh9N+/G2SF
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
index cb201dea540a0ad0953b55bef5ea6d8e8f16d5b1..c972a74dd5d63655d531579cfd4e8dc3f72cb7ae 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -1454,20 +1454,17 @@ static int
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


