Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD921FF1C7;
	Wed, 14 Oct 2026 10:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973928; cv=none; b=RFYMDJ0Pnh90IjTu7i31jBFbdQ729cBoM4t5wiIHHZCnPU24gst3BDXAhIWeIj5Y6IsaArkVvtocens2zgVpeOsE5JW/sNDaulq2wOLC7IukKHTe+d4Aiid5GPTLvRioy1fFIiuscfMS6Mwrcew4+14oFXFGA5yCGILKPHhS4dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973928; c=relaxed/simple;
	bh=n5McwsonXSl9UQTDrznqD2WcpYd/KJYjTe6r+yYO5M0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fDO+BikC6v2oqKbHkMWkQXkJ5ivEhQEHgYfsrf2fhHd7NISi1iJTMcljI9dSrpdrYqvTSefvvnGQono+evGCtEvmUrjdbvXOp2jyHcLjsM9TKpn9Vd/TrJjLXsR4HrvscwEWVljmBa4m1QigtlViy++GuDS7B3pkKv53EIs0MQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EoMYf4Qc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EoMYf4Qc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCF41F000FF;
	Wed, 14 Oct 2026 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791973927;
	bh=W2HYCkYw59tLP3KQRoHzRr8IHN3SjV99xd4vCTLr56g=;
	h=From:To:Cc:Subject:Date;
	b=EoMYf4QcvhgxmY58c0FgRkME1pyOK2QxrTs/EdwL30WkhE7iNGzfWKxBGprh88Dxh
	 r2riuNdo4bAiuPR6dNnum2tU17Ckj+pJzTVICo0Cxtk7TH1XRcZP91Fe2HcgrKJ/T2
	 kOhgWR6ClS8VK4F75PbJPgYvB4TVlEUO4k+WpjQ7YNqU0C9CAoQwOSLuRH3cRaXDTR
	 R90ACYsShG7hUITPCkRQcCTkUcfPkyFTEGvNPzsgqqU2lOxm1XFzww0pM7a7236rTE
	 9ulPxHCAssEbWLhSk5uhI1M/suMjvH+ChQP1LSmwYJfxfHNRZS+kEQTa0MrAhM7mPq
	 POtogcc8x+2Tw==
From: Arnd Bergmann <arnd@kernel.org>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: maxim-serdes: reduce max_des_update_streams() stack usage
Date: Wed, 14 Oct 2026 12:31:33 +0200
Message-ID: <20261014103201.859465-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The function can break the stack frame warning limit in
some configurations:

drivers/media/i2c/maxim-serdes/max_des.c: In function 'max_des_update_streams.isra':
drivers/media/i2c/maxim-serdes/max_des.c:2550:1: error: the frame size of 1648 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
 2550 | }
      | ^

This is a simple large structure on the stack that shouldn't be
there. Move both instances into a dynamically allocated structure
instead.

Fixes: 22923bc4512c ("media: i2c: add Maxim GMSL2/3 deserializer framework")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/i2c/maxim-serdes/max_des.c | 28 ++++++++++++++----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c/maxim-serdes/max_des.c
index 6b4ffd0e2415..4347ca24b5a1 100644
--- a/drivers/media/i2c/maxim-serdes/max_des.c
+++ b/drivers/media/i2c/maxim-serdes/max_des.c
@@ -2164,7 +2164,7 @@ static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
 					struct v4l2_mbus_frame_desc *fd,
 					unsigned int pad)
 {
-	struct max_des_remap_context context = { 0 };
+	struct max_des_remap_context __free(kfree) *context = kzalloc_obj(*context);
 	struct max_des_priv *priv = sd_to_priv(sd);
 	struct v4l2_subdev_route *route;
 	int ret;
@@ -2172,7 +2172,10 @@ static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 	fd->num_entries = 0;
 
-	ret = max_des_populate_remap_context(priv, &context, state);
+	if (!context)
+		return -ENOMEM;
+
+	ret = max_des_populate_remap_context(priv, context, state);
 	if (ret)
 		return ret;
 
@@ -2187,7 +2190,7 @@ static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
 		if (ret)
 			return ret;
 
-		ret = max_des_get_src_dst_vc_id(&context, hw.pipe->index, hw.phy->index,
+		ret = max_des_get_src_dst_vc_id(context, hw.pipe->index, hw.phy->index,
 						hw.entry.bus.csi2.vc, &dst_vc_id);
 		if (ret)
 			return ret;
@@ -2450,18 +2453,21 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
 				  u32 pad, u64 updated_streams_mask, bool enable)
 {
 	struct max_des_priv *priv = v4l2_get_subdevdata(sd);
-	struct max_des_remap_context context = { 0 };
+	struct max_des_remap_context *context __free(kfree) = kzalloc_obj(*context);
 	struct max_des_mode_context mode_context = { 0 };
 	struct max_des *des = priv->des;
 	unsigned int num_pads = max_des_num_pads(des);
 	u64 *streams_masks;
 	int ret;
 
-	ret = max_des_populate_remap_context(priv, &context, state);
+	if (!context)
+		return -ENOMEM;
+
+	ret = max_des_populate_remap_context(priv, context, state);
 	if (ret)
 		return ret;
 
-	ret = max_des_populate_mode_context(priv, &mode_context, state, context.mode);
+	ret = max_des_populate_mode_context(priv, &mode_context, state, context->mode);
 	if (ret)
 		return ret;
 
@@ -2471,11 +2477,11 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	ret = max_des_set_pipes_phy(priv, &context);
+	ret = max_des_set_pipes_phy(priv, context);
 	if (ret)
 		goto err_free_streams_masks;
 
-	ret = max_des_set_tunnel(priv, &context);
+	ret = max_des_set_tunnel(priv, context);
 	if (ret)
 		goto err_free_streams_masks;
 
@@ -2483,7 +2489,7 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_free_streams_masks;
 
-	ret = max_des_set_vc_remaps(priv, &context, state, streams_masks);
+	ret = max_des_set_vc_remaps(priv, context, state, streams_masks);
 	if (ret)
 		goto err_free_streams_masks;
 
@@ -2502,7 +2508,7 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_revert_streams_disable;
 
-	ret = max_des_update_links(priv, &context, state, streams_masks);
+	ret = max_des_update_links(priv, context, state, streams_masks);
 	if (ret)
 		goto err_revert_active_disable;
 
@@ -2533,7 +2539,7 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
 	max_des_update_tpg(priv, state, priv->streams_masks);
 
 err_revert_links_update:
-	max_des_update_links(priv, &context, state, priv->streams_masks);
+	max_des_update_links(priv, context, state, priv->streams_masks);
 
 err_revert_active_disable:
 	max_des_update_active(priv, priv->streams_masks, true);
-- 
2.53.0

