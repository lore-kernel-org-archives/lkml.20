Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2B4B1D19;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721842; cv=none; b=XdtfCMZ5+9xDvnRYEvEP2mt5wy698AF3+0UFDTxv7tLFzbFvp/4OPrsFe+DKzm4HLPyYyyls+o+DmVl2NMLvu92lmbEjz6DY25BmqvJ0gYfRtgBeqpkottSL7dMG2PHmhGK+TDiwoD3QEcNJk8VhucgjN54cv/yNoXnLwJqwG0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721842; c=relaxed/simple;
	bh=YpzryN/jqffQtkoAJf0qlEIxY6wpQ4aEFwp/t0r701U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7r6AscdQFLwzOdN7EEJZGrRaKMg8b2q87Q+eOpzDB4NQC1dXvPG9QRxUFAPYT2bKYJbdnJaDiY9QSSv4CIVBZCmJarHtRMedAh5IL1OlcDVxSSmYZu11q9jv8X+q1UAOBtiXepfzJm293m3HvLBtjK4vRD9Ns+VKKiJZUzQbTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPvPGNyU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPvPGNyU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A670C4AF11;
	Fri, 18 Sep 2026 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721841;
	bh=YpzryN/jqffQtkoAJf0qlEIxY6wpQ4aEFwp/t0r701U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PPvPGNyULxOqMMPnE6yvOeXnyKggWMg7EMOY9crTCITikYZCYFSW7tleyhgx7xLuX
	 bCsShiKPl99vkOBrJSLetAEczaTD5Re2SGdo2t+p0kYvmQ13D9Dcmbb9LgbdsYNgJ6
	 IAuLgmLXDS7XdlwR1wdGWJ0L2MCwzh/rMC19y7BYri2znpPFKpxH5M0jDMtJuOZIxO
	 NGdFtNVvEzqBfb+u3ZxhJZJqf3TnslRHB9qS2zD6PYAEDx2BswN8mC+ADUUxtpEeb8
	 YrnZzS0f58k+iI7v9Es7PKBu6+fVnRx0qjG/dxK1he3U0zrVUwnFfrTbOlmwyQoJMh
	 0okSd098FP5Qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B615C982DA;
	Fri, 18 Sep 2026 08:57:21 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:36 +0800
Subject: [PATCH 21/21] media: i2c: it6625: use enable_streams and
 disable_streams
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-21-78d72d7886a5@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=3281;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=PmFwvFAlIGe8S5KkdJ/0dJSm3Ai5OjykPBxjocuRLS8=;
 b=pzg0mXTeiUoizaAnBVMTecVitw6D/qbWMbgqWu7RkNbG+vrol9O4e0pUXFH4uag8CLYkMdXvT
 K27Qx+tvexPAVVABJ4Z5YxusCgmv5j4VfLMGKwesNZacVpQyMQYErWL
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

The .s_stream video op is deprecated; add .enable_streams()/
.disable_streams() pad ops instead and keep v4l2_subdev_s_stream_helper
for legacy .s_stream callers, matching the same-device-class precedent
in lt6911uxe.c.

it6625_enable_streams()/it6625_disable_streams() call
it6625_enable_stream_locked() directly rather than the removed
lock-taking it6625_enable_stream() wrapper: v4l2_subdev_enable_streams()/
disable_streams() already lock the active state -- and hence
it6625_lock, shared as sd->state_lock since the previous change --
before calling into these ops.

Do not set V4L2_SUBDEV_FL_STREAMS: this device has a single,
non-multiplexed source pad, so the core's implicit stream 0 is
sufficient and v4l2_subdev_s_stream_helper() already handles that case
without it. Error handling is unchanged from the locked helper these
ops now call directly, so streaming failures are reported to the core
instead of being silently absorbed.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 550eb95c6f74a81fc11cc055b4590159ac50e969..680f27a4587eccfb863bb091c1dede290e57e909 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -936,12 +936,6 @@ static int it6625_enable_stream_locked(struct it6625 *it6625, bool enable)
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
@@ -1503,11 +1497,22 @@ static int it6625_dv_timings_cap(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int it6625_s_stream(struct v4l2_subdev *sd, int enable)
+static int it6625_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 pad, u64 streams_mask)
+{
+	struct it6625 *it6625 = sd_to_6625(sd);
+
+	return it6625_enable_stream_locked(it6625, true);
+}
+
+static int it6625_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
 {
 	struct it6625 *it6625 = sd_to_6625(sd);
 
-	return it6625_enable_stream(it6625, enable);
+	return it6625_enable_stream_locked(it6625, false);
 }
 
 static int it6625_enum_mbus_code(struct v4l2_subdev *sd,
@@ -1795,7 +1800,7 @@ static const struct v4l2_subdev_core_ops it6625_core_ops = {
 
 static const struct v4l2_subdev_video_ops it6625_video_ops = {
 	.g_input_status = it6625_g_input_status,
-	.s_stream = it6625_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops it6625_pad_ops = {
@@ -1810,6 +1815,8 @@ static const struct v4l2_subdev_pad_ops it6625_pad_ops = {
 	.s_dv_timings = it6625_pad_s_dv_timings,
 	.g_dv_timings = it6625_pad_g_dv_timings,
 	.query_dv_timings = it6625_pad_query_dv_timings,
+	.enable_streams = it6625_enable_streams,
+	.disable_streams = it6625_disable_streams,
 };
 
 static const struct v4l2_subdev_ops it6625_ops = {

-- 
2.34.1


