Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713E341F7EA;
	Wed, 30 Sep 2026 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750571; cv=none; b=RccTXBWXpczIenbronIXGpqjkHcuwUa4IdeJYt27obdojxTjCwfXNt/prwC7ze3GYxawuHwma/jCGfKNXqO43Qnwzwe6Aqn9ETGMmd/j8uuPh6s/Z+MrgfT0QuZoVxLFSb4vDylG7ZFqnYlImH9qGPj1cSr0cmtgoMD2KBLAvVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750571; c=relaxed/simple;
	bh=JXc2zAY5pvMfItFUOju/DX40CF8r1F7X/GSq065RlJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3Qmgq85pGkTSOAp48zoiai/1QAhcca+wxcHTpReLZSoVFSy4TbZrHM/xNzyq3GAPx6aoG14zpBdTe4x1PGqDzBU2xM+cTWi4Gn+rdDbrSBwrKeCLQAOu6qk/2xYIcYJFK+JfQp5TFVs/OLY0NBk7zDTY08K72aKozz3VJTErNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akAVtXYE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akAVtXYE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C8EDC4DDF8;
	Wed, 30 Sep 2026 06:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750571;
	bh=JXc2zAY5pvMfItFUOju/DX40CF8r1F7X/GSq065RlJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=akAVtXYE+cUbemhIcSMAYDyND+/TuT7jdj6qxtKIO+Hr/HTA7a/1O6GKdlhSec+5h
	 BpcnRupI4HbvMIQCipC5p8GqmUQGvaxOC7bIKfRcmOkhv35PgiqLFcdwBfa9ittZ66
	 aNqhoKeKzXGxKPC5m7yzii4tCGeMsO5CmRvTacZcrJjftuw4Bs/dbdeQ2qOS+JiRou
	 j7EsnUfo9TaDhAZbOzGThYhbuvWp7Fl8ZJQodJ3pJx5fvwo6RxgZ/0fFKokR7PwONF
	 zKL7p9K5MUrMTFv40Tu3jX5U9x9WQ98AaOXnYBMCCzPqcvnhx6WQdZjgYHOLIsoVQF
	 cwpJjgXmvxM+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190A8CA5FC2;
	Wed, 30 Sep 2026 06:42:51 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:39 +0800
Subject: [PATCH v2 21/21] media: i2c: it6625: use enable_streams and
 disable_streams
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-21-e353f887e7fa@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=2777;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=G4Y3pCwRUr3hCF/1tQ6at9bCfCCdQ3wlFc2uUKsFLdg=;
 b=OYReQLa/Vq3GMHmFs262O1CLQW5yaUJre1HRcO3Q8yFFQMtojrQ0kGjCeOjNAE6JzORO5/foj
 ghQLRRipCSwCBrVVl+aUdJYULjmeZlXewu+DdeT5gZN2bme31FK/74p
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

The .s_stream video op is deprecated; add .enable_streams()/
.disable_streams() pad ops instead and keep v4l2_subdev_s_stream_helper
for legacy .s_stream callers.

Both ops take it6625_lock explicitly around the MCU transactions. This
device has a single, non-multiplexed source pad, so the core's implicit
stream 0 is sufficient and V4L2_SUBDEV_FL_STREAMS is not set.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 1127d050d82522e202f042832e3772fd88e63ca9..10619df51a2274a4deb155710d6aa46c950f10a9 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -935,12 +935,6 @@ static int it6625_enable_stream_locked(struct it6625 *it6625, bool enable)
 	return it6625_update_config(it6625);
 }
 
-static int it6625_enable_stream(struct it6625 *it6625, bool enable)
-{
-	guard(mutex)(&it6625->it6625_lock);
-	return it6625_enable_stream_locked(it6625, enable);
-}
-
 static int it6625_set_mipi_config_locked(struct it6625 *it6625, u32 cfg_val)
 {
 	u8 mipi_data_type;
@@ -1538,11 +1532,24 @@ static int it6625_dv_timings_cap(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int it6625_s_stream(struct v4l2_subdev *sd, int enable)
+static int it6625_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 pad, u64 streams_mask)
 {
 	struct it6625 *it6625 = sd_to_6625(sd);
 
-	return it6625_enable_stream(it6625, enable);
+	guard(mutex)(&it6625->it6625_lock);
+	return it6625_enable_stream_locked(it6625, true);
+}
+
+static int it6625_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct it6625 *it6625 = sd_to_6625(sd);
+
+	guard(mutex)(&it6625->it6625_lock);
+	return it6625_enable_stream_locked(it6625, false);
 }
 
 static int it6625_enum_mbus_code(struct v4l2_subdev *sd,
@@ -1833,7 +1840,7 @@ static const struct v4l2_subdev_core_ops it6625_core_ops = {
 
 static const struct v4l2_subdev_video_ops it6625_video_ops = {
 	.g_input_status = it6625_g_input_status,
-	.s_stream = it6625_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops it6625_pad_ops = {
@@ -1848,6 +1855,8 @@ static const struct v4l2_subdev_pad_ops it6625_pad_ops = {
 	.s_dv_timings = it6625_pad_s_dv_timings,
 	.g_dv_timings = it6625_pad_g_dv_timings,
 	.query_dv_timings = it6625_pad_query_dv_timings,
+	.enable_streams = it6625_enable_streams,
+	.disable_streams = it6625_disable_streams,
 };
 
 static const struct v4l2_subdev_ops it6625_ops = {

-- 
2.34.1


